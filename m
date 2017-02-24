Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA2D871995
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 06:48:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1O6mnuw009795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:48:49 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 23 Feb 2017 22:48:48 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Feb 2017 14:40:42 +0800
Message-ID: <20170224064042.19219-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collect: fix to build with glibc 2.25
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
X-List-Received-Date: Fri, 24 Feb 2017 06:48:52 -0000
Content-Type: text/plain

Fix to build with glibc 2.25 and remove from blacklist.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-fix-to-build-with-glibc-2.25.patch        | 24 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  3 +--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch b/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch
new file mode 100644
index 0000000..be942e5
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-fix-to-build-with-glibc-2.25.patch
@@ -0,0 +1,24 @@
+Subject: fix to build with glibc 2.25
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/md.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/md.c b/src/md.c
+index 3725f9a..202225b 100644
+--- a/src/md.c
++++ b/src/md.c
+@@ -25,6 +25,7 @@
+ #include "utils_ignorelist.h"
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ 
+ #include <linux/major.h>
+ #include <linux/raid/md_u.h>
+-- 
+2.8.3
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index b544b92..59732db 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-conditionally-check-libvirt.patch \
            file://0001-collectd-replace-deprecated-readdir_r-with-readdir.patch \
            file://CVE-2016-6254.patch \
+           file://0001-fix-to-build-with-glibc-2.25.patch \
 "
 SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
 SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
@@ -86,5 +87,3 @@ INITSCRIPT_PARAMS = "defaults"
 # threshold.so load.so are also provided by gegl
 # disk.so is also provided by libgphoto2-camlibs
 PRIVATE_LIBS = "threshold.so load.so disk.so"
-
-PNBLACKLIST[collectd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130654/"
-- 
2.8.3


