Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 168A36FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:32 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so105234195pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=9x3kkighYqMcn5bzq1cdrkWmicH/ttPz+1V3esQXWk4=;
	b=UmMzpz4lgwrK/e0xktL8SRi1t0X9gDv4ZoEA448D4Mo1iEjVUVFyYsBG1DVFHCT8PM
	zvd32sirI+rk1kDJxmoLG9CRGjsDBnKmztRMmBEZPBBdu/P6p5p390q+EuERHBQq6kQt
	hc+P8IY+DxPWRp7rkxde9DRF/J9CaoLfW1Oln+COXkHzZYZ5AoNT0prRQh4yd2Khw9uC
	na9c70Vv369/zEsxzk179bAp+UvMiDhE+jRCurFJtJ7nK4NjRFN2nBK889St+/UduAc0
	pPX/uQ2Wgs2Z2LcbirzPUShLPSVAArS4QCZnjyAtwmv7H30dEsG4iJRubZOBrxw4+ZYn
	wmQw==
X-Received: by 10.66.136.47 with SMTP id px15mr14526816pab.102.1450107273582; 
	Mon, 14 Dec 2015 07:34:33 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yl1sm36625383pac.35.2015.12.14.07.34.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id CF433FCC83E; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:57 -0800
Message-Id: <c2c72c32cd47ebaaaac9cdbc769e0f4a8e5eac80.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/14] net-snmp: fix cross compilation
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafaël Carré <funman@videolan.org>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


