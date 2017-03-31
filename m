Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28A2977EC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:53 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 81so18584259pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5Ozg7DewfVntZx3Z3FEB3gnQAijPP51vxYrj72rAEp0=;
	b=J0dDlaflbow2lqrSN/HvboAJH/YKlWMIF4X678lqxXlQ0naWr2h9LhrMxBWNLJsAv2
	0NLYzCjWvAoD12JEOWASpUq1L++mDRVzQeXropXan3IMIs+HAJXkChObibEeHww1VuTq
	+ZAhwJesKDKvCniYyQ5usyFAPHgw3zMLX6cG8xEIRlmrUlhQngwWzFFM2NGRY3hAI7rd
	gbm+m41MT98GX791jNCUNIRFl46raRxhilHNGC2rW00uyZUQlBd5t9yHOwyMDrdU1IsJ
	U/yT60h1hOW7k2Dvt07I2Dofy/Z9lAuoD8yfAUSn5wGVxyWLbqbMw2fxKlC20uDN+HHI
	lkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5Ozg7DewfVntZx3Z3FEB3gnQAijPP51vxYrj72rAEp0=;
	b=NLwgfj+djBkmIDIpMTFhIfzHnziDxJeCQqoNCm2gyMNvhGtHEw/Wq2qNvOexBvXDsT
	hYh8mQhQcZBFCB9X+RlrxhLTqbQwWS300G6DbQ4xDOcnrQJDO8Mr/6ZptfuVeoxUIh4T
	I+MovE9t/5rHY5Rw9IuXBNhFgjb4omJiMlpEK8b5alq65oUSwvYaS7uR/PYeUwjTP+pb
	Do+lqylvo6/1FpX3pGQIBOlDilnPILDOfwaQe547d1c5QQL/8lz2aI+yXFPHegnSPRLw
	ocRGKg+da+yV6vwrl1LDyxTCoh8owtrUv0mqoW8Khw5S8vCvoQW51H8S1mjvo7QVXjGm
	TwoA==
X-Gm-Message-State: AFeK/H36XSVLm2tOZlUYlTFglT4DZ3Z3zFegSAw62v5skwRNJ9cqrI3kgjvHB/h1Pf2gVg==
X-Received: by 10.99.51.200 with SMTP id z191mr4145019pgz.137.1490978634383;
	Fri, 31 Mar 2017 09:43:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:44 -0700
Message-Id: <20170331164247.5052-40-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 40/43] lxdm: Find libexecinfo if its on platform
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:53 -0000

fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-libexecinfo-providing-backtrace-APIs.patch | 36 ++++++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb        | 16 +++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch
new file mode 100644
index 000000000..f9fd4970f
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-check-for-libexecinfo-providing-backtrace-APIs.patch
@@ -0,0 +1,36 @@
+From 1d2425febf2020e38db70188df582acc9f37b136 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 13:01:33 -0700
+Subject: [PATCH] check for libexecinfo providing backtrace() APIs
+
+on musl it depends on external library to provide backtrace APIs
+unlike glibc where it is bundled in
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index aa3291c..b15f65d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,7 @@ AM_PROG_CC_C_O
+ 
+ # Checks for libraries.
+ AC_CHECK_LIB([crypt], [crypt])
++AC_CHECK_LIB([execinfo], [backtrace])
+ 
+ # Check for PAM support
+ AC_ARG_WITH(pam, AC_HELP_STRING([--with-pam],[Use PAM for authentication]),
+@@ -33,6 +34,7 @@ AM_CONDITIONAL(HAVE_PAM, [test -n "$USE_PAM" -a "x$USE_PAM" != xno ])
+ # Checks for header files.
+ AC_PATH_X
+ AC_CHECK_HEADERS([shadow.h stdlib.h string.h unistd.h utmpx.h])
++AC_CHECK_HEADERS([execinfo.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_TYPE_PID_T
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 407129dde..c98c3a132 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -2,13 +2,13 @@ SUMMARY = "LXDM is the lightweight display manager"
 HOMEPAGE = "http://blog.lxde.org/?p=531"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz \
-    file://lxdm.conf \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
-    ${@bb.utils.contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
-    file://0002-let-autotools-create-lxdm.conf.patch \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz \
+           file://lxdm.conf \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
+           ${@bb.utils.contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+           file://0002-let-autotools-create-lxdm.conf.patch \
+           file://0001-check-for-libexecinfo-providing-backtrace-APIs.patch \
+           "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
 
@@ -16,6 +16,7 @@ PE = "1"
 
 DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
 DEPENDS += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
@@ -25,6 +26,7 @@ inherit autotools pkgconfig gettext systemd distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
+LDFLAGS_append_libc-musl = " -lexecinfo"
 
 EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)} \
-- 
2.12.1


