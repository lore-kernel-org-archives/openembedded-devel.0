Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F375A7FB21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 05:49:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,242,1569254400"; d="scan'208";a="77621828"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 13:49:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D2B04B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 13:41:17 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 29 Oct 2019 13:49:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 13:49:28 +0800
Message-ID: <20191029054928.26567-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4D2B04B6EC86.A8B95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCHv2] autofs: upgrade 5.1.5 -> 5.1.6
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
X-List-Received-Date: Tue, 29 Oct 2019 05:49:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-When compiling version 5.1.6 on musl, the following error occurs:
| In file included from defaults.c:32:
| ../include/log.h:49:8: error: unknown type name 'pid_t'
-Add autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch to fix it.

-Refresh the following patch:
 autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-Bug-fix-for-pid_t-not-found-on-musl.patch | 30 +++++++++++++++++++
 ...0001-Do-not-hardcode-path-for-pkg.m4.patch |  4 +--
 .../{autofs_5.1.5.bb => autofs_5.1.6.bb}      |  5 ++--
 3 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb} (93%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
new file mode 100644
index 000000000..2a583466e
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
@@ -0,0 +1,30 @@
+From d0d5ac317dab11610a5fc91ca3e7f5ad72ce2236 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Tue, 29 Oct 2019 13:19:37 +0800
+Subject: [PATCH] Bug fix for pid_t not found on musl.
+
+When compiling version 5.1.6 on musl, the following error occurs:
+log.h:49:8: error: unknown type name 'pid_t'
+
+Upstream-Status: Pending
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ lib/defaults.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/defaults.c b/lib/defaults.c
+index a6ea116..b3ecfa5 100644
+--- a/lib/defaults.c
++++ b/lib/defaults.c
+@@ -21,6 +21,7 @@
+ #include <string.h>
+ #include <sys/utsname.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <stdarg.h>
+ 
+ #include "config.h"
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
index 410827b33..b991acad3 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
@@ -9,7 +9,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-update patch to version 5.1.5
+update patch to version 5.1.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  configure.in | 2 +-
@@ -20,7 +20,7 @@ index 493b9f1..268d06b 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.5)
+ AC_INIT(.autofs-5.1.6)
  
  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
similarity index 93%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
index 9e43549e8..aeadc9d5d 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
@@ -25,11 +25,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://pkgconfig-libnsl.patch \
            file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
            file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
+           file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
            "
 
 
-SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
-SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
+SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
+SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
-- 
2.20.1




