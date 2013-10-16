Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4188160B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 22:42:32 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so679475eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 15:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=1pIdDosp7ErodQSe6PBifDKcvilVxGMCL7l1UzMZ7iU=;
	b=U3fRAJjXMFt51u2UcKSeDq+9MeZWA2+y8DyfJBf+YE1PGwVAbx0XEoGoWdtdoRw5TT
	zsV38/ExCn1dsQZ8BP2bRm6y5JrtoXKdnIPAFH6vAIqrK7iVdsJTFtaaGOl5NU06TLSj
	NKCp3JEvQgtQmaAbDYHmRIiAfC9Z3hRzWp8NnBIOrM47HFn+4+Ym2O9pogozvUl44jxz
	Ltzac/Lm2HJQvJ0B9KyTyeGYcEg+brkPmSJL0j6CU5FQX2BBMcBgOqTtCcM5XwfuqnAg
	8v0iJk3eW4vidv6vM+ntGiXmrPzToOl5RUpIG9bCgU23zylQBfj2KslRNcQ/d1ml29Lj
	iE1w==
X-Received: by 10.14.45.70 with SMTP id o46mr8220798eeb.19.1381963353218;
	Wed, 16 Oct 2013 15:42:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A114C.dip0.t-ipconnect.de.
	[91.10.17.76])
	by mx.google.com with ESMTPSA id s3sm21561672eeo.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 15:42:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 00:42:15 +0200
Message-Id: <1381963336-18888-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 1/2] lxdm: update to latest git version
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
X-List-Received-Date: Wed, 16 Oct 2013 22:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes crashing after first log off

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...heck-only-for-ck-connector-in-case-consol.patch | 48 ----------------------
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |  6 +--
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
deleted file mode 100644
index e2ba52a..0000000
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8657bfcfc5c26382989001e9b6d18295d740c709 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 7 Jun 2013 14:13:41 +0200
-Subject: [PATCH] configure: check only for ck-connector in case consolekit is
- enabled
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-it failed for --disable-consolekit with
-
-| lxdm.c:70:26: fatal error: ck-connector.h: No such file or directory
-| compilation terminated.
-| make[2]: *** [lxdm_binary-lxdm.o] Error 1
-
-Upstream-Status: submitted [1]
-
-[1] http://sourceforge.net/mailarchive/message.php?msg_id=31010893
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9e21a22..49ba944 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,8 +28,6 @@ if test "x$USE_PAM" != "xno" ; then
- 		 fi])
- fi
- 
--AC_CHECK_LIB([ck-connector],[ck_connector_open_session])
--
- # Checks for header files.
- AC_PATH_X
- AC_CHECK_HEADERS([shadow.h stdlib.h string.h unistd.h utmpx.h])
-@@ -102,6 +100,7 @@ if test "x$enable_consolekit" = "xyes" ; then
- 	AC_SUBST(CONSOLEKIT_LIBS)],[
- 	echo "ConsoleKit devel package not found"
- 	])
-+  AC_CHECK_LIB([ck-connector],[ck_connector_open_session])
- fi
- 
- 
--- 
-1.7.6.5
-
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index 97bda4c..5f9d2f4 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -8,15 +8,13 @@ SRC_URI = " \
     file://lxdm-pam \
     file://lxdm-pam-debug \
     ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
-    file://0002-configure-check-only-for-ck-connector-in-case-consol.patch \
 "
 
 LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)}"
 
-SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
-PV = "0.4.2+git${SRCPV}"
+SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
+PV = "0.5.0+git${SRCPV}"
 PE = "1"
-PR = "r7"
 
 DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
-- 
1.8.3.1


