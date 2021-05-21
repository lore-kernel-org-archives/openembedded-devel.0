Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6620.1621587404843077849
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 01:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14L8uhjY019462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 01:56:43 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 21 May 2021 01:56:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Fri, 21 May 2021 01:56:41 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libgtop: fix do_compile error
Date: Fri, 21 May 2021 16:55:24 +0800
Message-ID: <20210521085524.31284-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

On some distros, such as fedora32, cross compile failed with following
error since host library is used. undefined reference to
`stat64@GLIBC_2.33'

According doc of ld, set searchdir begins with "=", but not hardcoded
locations.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-fix-compile-error-for-cross-compile.patch | 37 +++++++++++++++++++
 .../recipes-gnome/libgtop/libgtop_2.40.0.bb   |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
new file mode 100644
index 000000000..1bd6e101b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
@@ -0,0 +1,37 @@
+From e865a93000913b4597607289356114cd159f4e28 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Fri, 21 May 2021 03:02:29 +0000
+Subject: [PATCH] fix compile error for cross compile
+
+On some distros, such as fedora32, cross compile failed with following
+error since host library is used. undefined reference to
+`stat64@GLIBC_2.33'
+
+According doc of ld, set searchdir begins with "=", but not hardcoded
+locations.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgtop/-/merge_requests/26]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 472f44b..ed6a4d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -270,8 +270,8 @@ AC_ARG_ENABLE(fatal-warnings,
+                         [Define to enable fatal warnings]))
+ 
+ dnl These definitions are expanded in make.
+-LIBGTOP_LIBS='-L$(libdir)'
+-LIBGTOP_INCS='-I$(includedir)/libgtop-2.0'
++LIBGTOP_LIBS='-L=$(libdir)'
++LIBGTOP_INCS='-I=$(includedir)/libgtop-2.0'
+ 
+ if test x$libgtop_have_sysinfo = xyes ; then
+   LIBGTOP_INCS="$LIBGTOP_INCS -DHAVE_LIBGTOP_SYSINFO"
+-- 
+2.26.2
+
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 63615e433..6d9398f4e 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -8,6 +8,8 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0001-fix-compile-error-for-cross-compile.patch"
+
 SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
 DEPENDS = "glib-2.0 libxau"
-- 
2.17.1

