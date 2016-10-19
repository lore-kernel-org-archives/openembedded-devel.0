Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0305A719E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:27:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9J5R2Rv027904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:27:02 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 18 Oct 2016 22:27:01 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Oct 2016 13:27:00 +0800
Message-ID: <1476854820-158987-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux-atm: fix do_compile error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2016 05:27:03 -0000
Content-Type: text/plain

Issue: LIN9-1688

With linux kernel v4.8, for file ./src/maint/zntune.c, glibc time.h is
included before linux time.h, when compile zntune.c, it break down by
the following errors:

	redefinition of 'struct timespec' 'struct timeval'
	                'struct timezone' 'struct itimerval'

We should exclude the linux time.h by disable linux/atm_zatm.h and move
some useful definition in linux/atm_zatm.h to a new header file in linux-atm
source code to resolve it.

(LOCAL REV: NOT UPSTREAM) -- will sent to oe-devel 20161019

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...-fix-compile-error-with-linux-kernel-v4.8.patch | 74 ++++++++++++++++++++++
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |  4 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
new file mode 100644
index 0000000..583a6ca
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
@@ -0,0 +1,74 @@
+From 7cdafc0dee8054f82777ed3bf6d4c8b5582d09ad Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 18 Oct 2016 07:56:02 +0000
+Subject: [PATCH] fix compile error with linux kernel v4.8
+
+In src/maint/zntune.c, the glibc time.h is included before linux
+time.h, so when compile the zntune.c, it break down by errors:
+
+	redefinition of 'struct timespec' 'struct timeval'
+	                'struct timezone' 'struct itimerval'
+
+We should exclude the linux time.h by disable linux/atm_zatm.h and
+move some useful definition in linux/atm_zatm.h to zntune.c to resolve
+it.
+
+Upstream-status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ src/include/atm_zatm.h | 26 ++++++++++++++++++++++++++
+ src/maint/zntune.c     |  3 +--
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+ create mode 100644 src/include/atm_zatm.h
+
+diff --git a/src/include/atm_zatm.h b/src/include/atm_zatm.h
+new file mode 100644
+index 0000000..7d64f4d
+--- /dev/null
++++ b/src/include/atm_zatm.h
+@@ -0,0 +1,26 @@
++#include <linux/atmapi.h>
++#include <linux/atmioc.h>
++
++#define ZATM_GETPOOL    _IOW('a',ATMIOC_SARPRV+1,struct atmif_sioc)
++                                                /* get pool statistics */
++#define ZATM_GETPOOLZ   _IOW('a',ATMIOC_SARPRV+2,struct atmif_sioc)
++                                                /* get statistics and zero */
++#define ZATM_SETPOOL    _IOW('a',ATMIOC_SARPRV+3,struct atmif_sioc)
++
++struct zatm_pool_info {
++        int ref_count;                  /* free buffer pool usage counters */
++        int low_water,high_water;       /* refill parameters */
++        int rqa_count,rqu_count;        /* queue condition counters */
++        int offset,next_off;            /* alignment optimizations: offset */
++        int next_cnt,next_thres;        /* repetition counter and threshold */
++};                                                /* set pool parameters */
++
++struct zatm_pool_req {
++        int pool_num;                   /* pool number */
++        struct zatm_pool_info info;     /* actual information */
++};
++
++#define ZATM_OAM_POOL           0       /* free buffer pool for OAM cells */
++#define ZATM_AAL0_POOL          1       /* free buffer pool for AAL0 cells */
++#define ZATM_AAL5_POOL_BASE     2       /* first AAL5 free buffer pool */
++#define ZATM_LAST_POOL  ZATM_AAL5_POOL_BASE+10 /* max. 64 kB */
+diff --git a/src/maint/zntune.c b/src/maint/zntune.c
+index 62d62ab..bb93eab 100644
+--- a/src/maint/zntune.c
++++ b/src/maint/zntune.c
+@@ -13,9 +13,8 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <atm.h>
++#include <atm_zatm.h>
+ #include <sys/time.h> /* for struct timeval, although it's not used */
+-#include <linux/atm_zatm.h>
+-
+ 
+ static void usage(const char *name)
+ {
+-- 
+2.9.0
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index edfb045..6ab8b07 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -9,7 +9,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://link-with-ldflags.patch \
-           file://install-from-buildir.patch"
+           file://install-from-buildir.patch \
+           file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \
+"
 
 SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
 SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
-- 
2.7.4


