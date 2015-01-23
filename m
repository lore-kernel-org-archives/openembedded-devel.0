Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43472CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:24 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so37665pad.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=e042UF9W4lqtD2yhf9gpMFfUqTMZ4EgkGUxpjshcpSI=;
	b=K6iV1X6uXXR1MDDYRzg5izo450tB/cPU60DrNZulR+9zIEcp4EvvTwpgSPHf8xU1di
	FDcy8l77OI8hP2rog8WgVpDqgqQjwgrNhd/JPs3/evV687VUz0xH48Y/ssucjpucgC6j
	s3HL6AiJCiDyeMTDggRmpd9/TT55093Y8Vcjbxg0SOA2novncoVgSMoI+u9IFkcaYzoJ
	OKa+qjHBvhLPXkKzDvqRb7VT4XSCfMScb5PjVQdDBaSJQIXkx6AX/Ysrz1cNfrK56exO
	+m28DfWu8MehDEtEPJnNWrjfgVO1mZszwgMZAtEgLLvFL4QWY4o/uGGmfAtDSuuHSrxZ
	PEvA==
X-Received: by 10.68.223.196 with SMTP id qw4mr15309161pbc.26.1422053665111;
	Fri, 23 Jan 2015 14:54:25 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:51 -0800
Message-Id: <bd4735a82ef196c5843d01bc56c87f182d8f33de.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 11/11] xmlto: remove recipe as it's in OE core
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:24 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Remove xmlto recipe from meta-oe because it's in OE core now.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xmlto/xmlto-0.0.25/obsolete_automake_macros.patch  | 12 ------------
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb          | 18 ------------------
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
1.9.1


