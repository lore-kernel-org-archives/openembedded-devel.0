Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6700A6AD74
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:03 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so3347546eei.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=vmQzyR653n+Wf7nYghBBl0yoKLKu4miACBcT0+cRy+A=;
	b=MivRu+TEX73QrKF7v0lS6wTMYt9otfkm15vzZSx79MbQr4ygWflw0bALTdFkQk2NOv
	7tt7ngmPZYITVsG+mHvRGW6g61EesYmsdGGUBrnYgpL2eI7HWobULaOxR4TFIIAVCs6J
	1d0IU5CcLRtAl+IVzW5GN1mGMPi4c3/tZjp7zO9Pc815EzYVblxa+zpR0Qb9TcaqKwJf
	e9YEaSYCL1c+dsWjcDSROxdo7CjJhFQ0QRcY+ZaRBUgIfzs9/LzmiEV1MJVn1H0ZzpEo
	RMpJq0bxdYkUgcyWs/1C9AqCiz9sn3pVS59GAgSEV2g0w/GLq+WcNtNIvg1psS6srWPk
	Zwag==
X-Received: by 10.15.95.4 with SMTP id bc4mr3590096eeb.40.1371663004111;
	Wed, 19 Jun 2013 10:30:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.30.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:23 +0200
Message-Id: <1371662967-31734-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 16/20] lxdm: remove consolekit dependencies in systemd environment and fix build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 17:30:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...heck-only-for-ck-connector-in-case-consol.patch |   48 ++++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
new file mode 100644
index 0000000..e2ba52a
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
@@ -0,0 +1,48 @@
+From 8657bfcfc5c26382989001e9b6d18295d740c709 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 7 Jun 2013 14:13:41 +0200
+Subject: [PATCH] configure: check only for ck-connector in case consolekit is
+ enabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+it failed for --disable-consolekit with
+
+| lxdm.c:70:26: fatal error: ck-connector.h: No such file or directory
+| compilation terminated.
+| make[2]: *** [lxdm_binary-lxdm.o] Error 1
+
+Upstream-Status: submitted [1]
+
+[1] http://sourceforge.net/mailarchive/message.php?msg_id=31010893
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9e21a22..49ba944 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,8 +28,6 @@ if test "x$USE_PAM" != "xno" ; then
+ 		 fi])
+ fi
+ 
+-AC_CHECK_LIB([ck-connector],[ck_connector_open_session])
+-
+ # Checks for header files.
+ AC_PATH_X
+ AC_CHECK_HEADERS([shadow.h stdlib.h string.h unistd.h utmpx.h])
+@@ -102,6 +100,7 @@ if test "x$enable_consolekit" = "xyes" ; then
+ 	AC_SUBST(CONSOLEKIT_LIBS)],[
+ 	echo "ConsoleKit devel package not found"
+ 	])
++  AC_CHECK_LIB([ck-connector],[ck_connector_open_session])
+ fi
+ 
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index 6675691..8767e98 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://lxdm-pam \
     file://lxdm-pam-debug \
     ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+    file://0002-configure-check-only-for-ck-connector-in-case-consol.patch \
 "
 
 LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)}"
@@ -17,7 +18,8 @@ PV = "0.4.2+git${SRCPV}"
 PE = "1"
 PR = "r7"
 
-DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
@@ -26,7 +28,7 @@ inherit autotools gettext systemd
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
 
 do_compile_append() {
     # default background configured not available / no password field available / no default screensaver
-- 
1.7.4.4


