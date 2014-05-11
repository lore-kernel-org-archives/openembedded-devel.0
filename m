Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f169.google.com (unknown [209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F35266004
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:52 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so6565331lbd.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kAAT2IzsiK7uvxDTY6CgWHpoppTqXgyq1J4t3UUNsM4=;
	b=Hf/F/UuMzqcClIm1cP7JDuGnvG5wBoSU8lp1Y+W+YYiPZgAwvcFjS/B2N09cGji+sT
	oIkjpdRstySki1Cs/dt0joweFZ2Y/U20yLlgLxQsYLguT9bNEvYsTjUrDhy9Z0KluYUU
	Q1xH6MCvvlnPr3+CzAii3JeiFiW1arJMpSHVOzzD7fFAYJCvLpJlkK0+hMlSMhAIaAGi
	vvnRML9dYdFPErPHUKb2WF0v4vtyoU4pHQgdHt48irC/CIXBQ1ciqjzHD0GKCdf10/Kn
	ND7fJp7LutCoOvVfrK0R7Fyl11FSokrjrrA24ZVJot7ezZnoCsvunSU/SXs6MDjNWGUK
	McpA==
X-Received: by 10.112.254.163 with SMTP id aj3mr18681677lbd.20.1399790992955; 
	Sat, 10 May 2014 23:49:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u4sm6972009lal.8.2014.05.10.23.49.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:52 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:08 +0200
Message-Id: <1399791009-2718-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] tk: Fix build with xft
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
X-List-Received-Date: Sun, 11 May 2014 06:49:53 -0000

* xft requires fontconfig, but pkg-config --libs xft doesn't return it
  add it manually

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch  | 13 +++++++++++++
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb                  |  3 +--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch

diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch
new file mode 100644
index 0000000..a0c157f
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch
@@ -0,0 +1,13 @@
+--- a/configure.in.orig	2014-05-10 14:35:39.859147385 +0000
++++ b/configure.in	2014-05-10 14:36:20.282925184 +0000
+@@ -554,8 +554,8 @@
+ 	dnl make sure package configurator (xft-config or pkg-config
+ 	dnl says that xft is present.
+ 	    found_xft=yes
+-	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
+-	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
++	    XFT_CFLAGS=`pkg-config --cflags xft fontconfig 2>/dev/null` || found_xft="no"
++	    XFT_LIBS=`pkg-config --libs xft fontconfig 2>/dev/null` || found_xft="no"
+ 	AC_MSG_RESULT([$found_xft])
+ 	dnl make sure that compiling against Xft header file doesn't bomb
+ 	if test "$found_xft" = "yes" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index a5e76e9..1177d03 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=c88f99decec11afa967ad33d314f87fe
     file://../xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
-PNBLACKLIST[tk] = "tk8.6.0/unix/libtk8.6.so: error: undefined reference to 'FcCharSetHasChar'"
-
 DEPENDS = "tcl virtual/libx11 libxt"
 
 SRC_URI = "\
@@ -26,6 +24,7 @@ SRC_URI = "\
     file://tklibrary.diff;striplevel=2 \
     file://tkprivate.diff;striplevel=2 \
     file://fix-xft.diff \
+    file://configure.use.fontconfig.with.xft.patch \
 "
 SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
 SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
-- 
1.9.2


