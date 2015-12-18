Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2A61560616
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:45:15 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l126so62076273wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=Lng+ZGL0S8dFK+G5sPfV0jpjLg8HxcZn9q6tPo2IwYA=;
	b=p8YEzs7SWMh/m2X3NVieO9eJu7tELMciU0QddHOY5F0efpmqXAlrgoYMgiJGvqHGYM
	w48aZxWa5T0VMSwjxK9MfW0OHiTL+VJtctJ18tQTRXomyQPKbJy0N0B27hdy79Xjdk4r
	HaEcArhDDmE35fv8gKhWG1wirCsNxSP/N8LBiLIlPkq6wgjj6/blt4COcp8QFaM4uP3U
	e0MDOI0F9/rbZnMRs+hQj3kjsZGvUIe5CASF3/AIoqAsujsHSqRHwP01qBlypkJ8bTvQ
	oTPnhKCtlJFae3YzInAYbCA4MMotX47m0rpkrnVH6543m7MjbxAsM3RcQs83L11tSdZ/
	cxZQ==
X-Received: by 10.28.59.133 with SMTP id i127mr2764789wma.24.1450439115997;
	Fri, 18 Dec 2015 03:45:15 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id q74sm6377296wmd.0.2015.12.18.03.45.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 03:45:14 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 12:45:10 +0100
Message-Id: <1450439110-17705-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <CAMKF1sqhNJCSrnVcb7YjfC-XPgP5QnVmyiB5aOh1Kk7A3TbdzA@mail.gmail.com>
References: <CAMKF1sqhNJCSrnVcb7YjfC-XPgP5QnVmyiB5aOh1Kk7A3TbdzA@mail.gmail.com>
Subject: [meta-networking][PATCH] net-snmp: apply patch for cross-compilation
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
X-List-Received-Date: Fri, 18 Dec 2015 11:45:16 -0000

7fb5479 added the patch but did not apply it
Rename patch to explicit it differentiate it from other patches
---
 .../net-snmp/0001-config_os_libs2-Error-Fix.patch  | 31 ++++++++++++++++++++++
 .../0002-config_os_headers-Error-Fix.patch         | 31 ----------------------
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 3 files changed, 32 insertions(+), 31 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
new file mode 100644
index 0000000..5866a95
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_libs2-Error-Fix.patch
@@ -0,0 +1,31 @@
+From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
+Date: Wed, 4 Nov 2015 16:49:30 +0100
+Subject: [PATCH] config_os_libs2: Error Fix
+
+ERROR: This autoconf log indicates errors, it looked at host include
+and/or library paths while determining system capabilities.
+---
+ configure.d/config_os_libs2 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 47491e2..e3647f9 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -226,10 +226,10 @@ if test "x$with_nl" != "xno"; then
+     case $target_os in
+     linux*) # Check for libnl (linux)
+         netsnmp_save_CPPFLAGS="$CPPFLAGS"
+-        CPPFLAGS="-I/usr/include/libnl3 $CPPFLAGS"
++        CPPFLAGS="$CPPFLAGS"
+         NETSNMP_SEARCH_LIBS(nl_connect, nl-3,
+             [AC_CHECK_HEADERS(netlink/netlink.h)
+-            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES -I/usr/include/libnl3"],
++            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES"],
+             [CPPFLAGS="$netsnmp_save_CPPFLAGS"], [], [], [LMIBLIBS])
+         if test "x$ac_cv_header_netlink_netlink_h" != xyes; then
+             NETSNMP_SEARCH_LIBS(nl_connect, nl, [
+-- 
+2.5.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
deleted file mode 100644
index a90ce1f..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
-Date: Wed, 4 Nov 2015 16:49:30 +0100
-Subject: [PATCH] config_os_headers: Error Fix
-
-ERROR: This autoconf log indicates errors, it looked at host include
-and/or library paths while determining system capabilities.
----
- configure.d/config_os_libs2 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 47491e2..e3647f9 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -226,10 +226,10 @@ if test "x$with_nl" != "xno"; then
-     case $target_os in
-     linux*) # Check for libnl (linux)
-         netsnmp_save_CPPFLAGS="$CPPFLAGS"
--        CPPFLAGS="-I/usr/include/libnl3 $CPPFLAGS"
-+        CPPFLAGS="$CPPFLAGS"
-         NETSNMP_SEARCH_LIBS(nl_connect, nl-3,
-             [AC_CHECK_HEADERS(netlink/netlink.h)
--            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES -I/usr/include/libnl3"],
-+            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES"],
-             [CPPFLAGS="$netsnmp_save_CPPFLAGS"], [], [], [LMIBLIBS])
-         if test "x$ac_cv_header_netlink_netlink_h" != xyes; then
-             NETSNMP_SEARCH_LIBS(nl_connect, nl, [
--- 
-2.5.0
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index b32d842..62186d4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://run-ptest \
         file://dont-return-incompletely-parsed-varbinds.patch \
         file://0001-config_os_headers-Error-Fix.patch \
+        file://0001-config_os_libs2-Error-Fix.patch \
         file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
 "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
-- 
2.5.0


