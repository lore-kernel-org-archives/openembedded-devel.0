Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id ABE8260125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 15:54:25 +0000 (UTC)
Received: by wikq8 with SMTP id q8so95026601wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=Ett6olCsUnjJ3pNep0Wh1gg7Q6BuRI2/s5NMjOlVges=;
	b=HlAPbh9MRO/zkCI1JHf3QY9Bijc5F1wBR68fukrBau7Bppei5eyc4hpSNxmXN6FOSU
	HDRL/GvLv4Xpb1JB0QvMdSJHV2dc8bNy+S8HZqoHbMNU8oYZmP3Vshh1QUsd8TPRkUaI
	sAn29xk/aW7cZxsaXpGqdNZ9ognkYr7RJi25V+xeF4QZKtMurwnKstxyg750z9d4h8VK
	cc5NRO6wajNe5A6X+IBISfZ0rljqlcdInFLvrnplGjz5pJAYgJiq18bVTS+npCbKAQwv
	QeSTtXum91T51esQG4isry+qyjVKtiGO64860AR+86/zdX3mS18nuwW0BMR9DMgh1dMp
	2VTw==
X-Received: by 10.195.18.67 with SMTP id gk3mr2633533wjd.35.1446652464644;
	Wed, 04 Nov 2015 07:54:24 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	l186sm29351648wmg.19.2015.11.04.07.54.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 07:54:23 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 16:54:18 +0100
Message-Id: <1446652458-9940-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-networking][PATCH] net-snmp: fix cross compilation
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
X-List-Received-Date: Wed, 04 Nov 2015 15:54:26 -0000

---
 .../0002-config_os_headers-Error-Fix.patch         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
new file mode 100644
index 0000000..a90ce1f
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
@@ -0,0 +1,31 @@
+From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
+Date: Wed, 4 Nov 2015 16:49:30 +0100
+Subject: [PATCH] config_os_headers: Error Fix
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
-- 
2.5.0


