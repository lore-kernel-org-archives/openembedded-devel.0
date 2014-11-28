Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3619723BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 09:13:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAS9DkWB018391
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 01:13:46 -0800 (PST)
Received: from pek-hostel-vm07.corp.ad.wrs.com (128.224.153.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 28 Nov 2014 01:13:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Nov 2014 04:13:44 -0500
Message-ID: <1417166024-2366-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xmlto: remove recipe as it's in OE core
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
X-List-Received-Date: Fri, 28 Nov 2014 09:13:52 -0000
Content-Type: text/plain

Remove xmlto recipe from meta-oe because it's in OE core now.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../xmlto-0.0.25/obsolete_automake_macros.patch    |   12 ------------
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb      |   18 ------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 delete mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb

diff --git a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
deleted file mode 100644
index faa8acc..0000000
--- a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
---- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
-+++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
-@@ -1,7 +1,7 @@
- AC_INIT(xmlto, 0.0.25)
- AC_CONFIG_SRCDIR(xmlto.spec.in)
- AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_PROG_CC
- AM_PROG_CC_C_O
diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
deleted file mode 100644
index 9188c8a..0000000
--- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "A shell-script tool for converting XML files to various formats"
-HOMEPAGE = "https://fedorahosted.org/xmlto/" 
-SECTION = "docs/xmlto" 
-LICENSE = "GPLv2" 
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r1"
-
-SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-"
-SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
-SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
-
-inherit autotools  
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


