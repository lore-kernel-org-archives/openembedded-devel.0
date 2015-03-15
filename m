Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D46426AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:53 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so25142756wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Vn478uOpeBuCazxOnO56k9kEZcbzi7dWtdIT19uY1CM=;
	b=B8s9ygBlltSerMkAgrruYXajpDVFmQH4KdHObRpcjfGkIpIm8mqmrHZnXymhWl0Y3M
	D4UlZtx1uLsDsF3ZhV7vaSudDaEerkTjnRLY89FmOfG2zmmm3iYcbCFYi9AicErpuebk
	CNg4ZRYa/xP1ZEdxAWqwSXqUeg5X0m9g8YPqMthg60mvg6CQuKKAi9vdzPLh2eeMGamN
	hU49EXY9BLgTtFy3WGPiCbNikj4wc3SOnTDWYbE8wzMJCsdzG48yEkBuuJO95ZwHej+e
	DOvyKbtcsEV+rU3a2GDQ05kHD54rOfde1zc49g0v+IBc7H8VQV5HUwFvdY81PprkbDTr
	yvTA==
X-Received: by 10.194.90.210 with SMTP id by18mr113388867wjb.80.1426462434565; 
	Sun, 15 Mar 2015 16:33:54 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:10 +0100
Message-Id: <1426462419-10173-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 01/30] exo: update to 0.10.3
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
X-List-Received-Date: Sun, 15 Mar 2015 23:33:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../exo/exo/reduce-build-to-exo-csource-only.patch | 26 ++++++++++++----------
 .../exo/{exo_0.10.2.bb => exo_0.10.3.bb}           |  5 ++---
 2 files changed, 16 insertions(+), 15 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.2.bb => exo_0.10.3.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index 84b2370..246511c 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -14,15 +14,17 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- Makefile.am  |   10 +---------
- configure.ac |   20 --------------------
- 2 files changed, 1 insertions(+), 29 deletions(-)
+ Makefile.am  | 10 +---------
+ configure.ac | 20 --------------------
+ 2 files changed, 1 insertion(+), 29 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index c2e3fff..79b0931 100644
+index ad7c6ce..3acd94a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1,13 +1,5 @@
+@@ -1,15 +1,7 @@
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
  SUBDIRS =								\
 -	exo								\
 -	exo-csource							\
@@ -35,16 +37,16 @@ index c2e3fff..79b0931 100644
 -	po
 +	exo-csource
  
- AUTOMAKE_OPTIONS =							\
- 	1.9								\
+ distclean-local:
+ 	rm -rf *.cache *~
 diff --git a/configure.ac b/configure.ac
-index efcd62e..aac2495 100644
+index bb9be05..23471d0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -110,15 +110,6 @@ AC_PROG_CC()
+@@ -116,15 +116,6 @@ AC_PROG_CC()
  AM_PROG_CC_C_O()
  AC_PROG_INSTALL()
- AC_PROG_INTLTOOL([0.31], [no-xml])
+ IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])
 -AC_CHECK_PROGS([PERL], [perl5 perl])
 -
 -dnl ***************************************
@@ -57,7 +59,7 @@ index efcd62e..aac2495 100644
  
  dnl ***************************************
  dnl *** Check for standard header files ***
-@@ -165,17 +156,6 @@ dnl ***********************************
+@@ -171,17 +162,6 @@ dnl ***********************************
  dnl *** Check for required packages ***
  dnl ***********************************
  XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.30.0])
@@ -76,5 +78,5 @@ index efcd62e..aac2495 100644
  dnl *************************
  dnl *** Check for gtk-doc ***
 -- 
-1.7.4.4
+1.9.3
 
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.3.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.10.3.bb
index ef8e55f..f11f049 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.3.bb
@@ -4,7 +4,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
-PR = "r4"
 
 inherit xfce pythonnative perlnative gtk-doc
 
@@ -18,8 +17,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
-SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
+SRC_URI[md5sum] = "d45b7e18e3a73e4a7b2ec6ef7943de17"
+SRC_URI[sha256sum] = "95704b14ef9065268c3aa9a7c0bacbe0ddb490a183a4f5ab13bba4a1722826bd"
 
 PACKAGES =+ "exo-csource"
 
-- 
1.9.3


