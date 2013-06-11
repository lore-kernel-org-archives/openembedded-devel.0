Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB2E6A9F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:32 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so6057288eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KuaF0Lbn6rODqzCrzfNLCz2fDeEkLg7d1Vpu7fxGYO4=;
	b=heawtd59rnVJmvhqgmRVX+gMXO5sEpT/bexHeWd8nEGO1UeqU8FOuAmPrQTHSAA9OW
	M+UP7IrQ+CTmR+7oZvjz2MZFbcYNqsdGji8P0hBfen7t9VxebBISQfzsdGjDx/xAJV8J
	SU+IChk/BOoiBAQwaArB8znbXxBUsKDdHx1wcAM/pTkPBXBixtNhljIidfyzvgQ3VA/I
	Er+LDcS8Ej9OjNBJGhb4cag29TQhF3/pfnTFDIgU/ngDPzztl3ijtnikhdXz0htBFQ/j
	My6btWKTXH3/ZIhtTwhSn6SM1PxD5aEDMlEBii4hdUbTHL4DsBhs+v30yDV20IA3QLej
	FoZA==
X-Received: by 10.15.51.78 with SMTP id m54mr14708149eew.1.1370929053117;
	Mon, 10 Jun 2013 22:37:33 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:34 +0200
Message-Id: <1370928876-14423-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 13/15] lxdm: remove consolekit dependencies in systemd environment and fix build
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:33 -0000
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
1.7.6.5


