Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCD5260197
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 05:14:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e5so11213746plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 21:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/v/pDf4kHP+aIRRWVuZAh6JovXBvAQMJVleLRw5nu/w=;
	b=DK4IIB8Qbvh4cjBJ0ZrR8lLZZUG9deydPxbkiOyQPy6922JCNWF1zWupbm9pnxB2No
	+DdM+mSBuegF9u7j7+I08jdA5mLm/qkBS7YWLBaXTepHd9bMeM9U9Zorm+FDMClMap/y
	Sn7V50XcJIkuvHRnXe0WZ0kxHFvlnhDg3aoZzAjNdrn7BFgylhXQ6vsyi16E8A/OgxtU
	lLnn9+Sf/N6r/BJnUETYjSeHDY3KJL8fRDb9XUDHIjo19VWIbmnqJBiRNVf6vFObBMFB
	1LJWtu0Kna9da/84gfLENdzin5Py4bGJzn1dU9OVMqln/PD/LHCpJ6LQ6BOjWna3lp5F
	T83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/v/pDf4kHP+aIRRWVuZAh6JovXBvAQMJVleLRw5nu/w=;
	b=i7Rh+1PksNe1tO+te3TGOwavou1tTpxMDyUqDgDm946yjtNPkeCnrJUGnHHLAehVUR
	/TNKg6Jvx0LQ4+oj/pg5jpotoLCnjEYU79mzydj4Eqyw3yrPcOftSj3EwjDqKV2hr+70
	D2o3DRE2SrHO0dQPtxtVR2cWlCTRmIz5Yf8SXLS+k3NXYBYDTjlOqf1AdTsntnXOsOtR
	z+tW433SG7VIHn7zlfWAPiMK+PWIzaEI4w71/2tMYq0fBF9woLGSWC3j5Dd+T7ZeWWBQ
	v0a8ih3Xnh84JtBooX8QHGJIM7/Zcu4qC5r4EfS/wZ5ckljkrWfDEEw6pg8IIa9k15F2
	Zgww==
X-Gm-Message-State: AA+aEWYE6xHDJqS7uiXAdPPmGWvjbinM73fJYiYCc90diOrf+BrqSwvx
	9Bqfx/LFAkki6IcSEAReejUi3t/l7ag=
X-Google-Smtp-Source: AFSGD/UJdi7nMsTxSL6LRjwo67xgPf+MTZ6O6Y8DdQ7DaTb5vTLsse2t6sz6/QX5iuA9dGJnqtn1Mg==
X-Received: by 2002:a17:902:1745:: with SMTP id
	i63mr26331170pli.145.1544073285463; 
	Wed, 05 Dec 2018 21:14:45 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	g70sm36406910pfg.98.2018.12.05.21.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 21:14:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 21:14:34 -0800
Message-Id: <20181206051434.22690-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] tk: Upgrade to 8.6.9
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
X-List-Received-Date: Thu, 06 Dec 2018 05:14:45 -0000
Content-Transfer-Encoding: 8bit

Use tcl8.6 instead of tcl8.5 in confsearch.diff patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Correct the patch level of confsearch.diff

 .../recipes-devtools/tcltk/tk/confsearch.diff | 49 ++++++++++++-------
 .../tcltk/{tk_8.6.8.bb => tk_8.6.9.bb}        | 22 ++++-----
 2 files changed, 41 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.8.bb => tk_8.6.9.bb} (65%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
index 4dbd9a4f16..8cc07bcfac 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
@@ -1,35 +1,46 @@
+From 5539442e5f5442606071afc5cf02642314ad13bb Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 17 Aug 2011 22:52:35 +0200
+Subject: [PATCH] tk 8.5.8: import from OE rev
+
 Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
 and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
 installation.
 
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -1431,7 +1431,8 @@
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
+---
+ unix/configure | 1 +
+ unix/tcl.m4    | 2 ++
+ 2 files changed, 3 insertions(+)
+
+Index: a/unix/configure
+===================================================================
+--- a/unix/configure.orig
++++ b/unix/configure
+@@ -1432,6 +1432,7 @@ echo "$as_me: error: ${with_tclconfig} d
  			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
  			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tclConfig.sh" ; then
---- tk8.5-8.5.8.orig/unix/tcl.m4
-+++ tk8.5-8.5.8/unix/tcl.m4
-@@ -93,7 +93,8 @@
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib/tcl8.6 2>/dev/null` \
+Index: a/unix/tcl.m4
+===================================================================
+--- a/unix/tcl.m4.orig
++++ b/unix/tcl.m4
+@@ -94,6 +94,7 @@ AC_DEFUN([SC_PATH_TCLCONFIG], [
  			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
  			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tclConfig.sh" ; then
-@@ -223,7 +224,8 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib/tcl8.6 2>/dev/null` \
+@@ -227,6 +228,7 @@ AC_DEFUN([SC_PATH_TKCONFIG], [
  			`ls -d /usr/local/lib 2>/dev/null` \
  			`ls -d /usr/contrib/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tk8.5 2>/dev/null` \
+ 			`ls -d /usr/pkg/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tk8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tkConfig.sh" ; then
+ 			`ls -d /usr/local/lib/tk8.6 2>/dev/null` \
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
similarity index 65%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
index 4e38525cbb..9eec4bba73 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
@@ -4,15 +4,15 @@ SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
 LICENSE = "tcl"
-LIC_FILES_CHKSUM = "file://../license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../compat/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../doc/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../library/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../macosx/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../tests/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../unix/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../win/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
-    file://../xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+LIC_FILES_CHKSUM = "file://${S}/../license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../compat/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../doc/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../library/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../macosx/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../tests/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../unix/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../win/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://${S}/../xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
 DEPENDS = "tcl virtual/libx11 libxt"
@@ -26,8 +26,8 @@ SRC_URI = "\
     file://fix-xft.diff \
     file://configure.use.fontconfig.with.xft.patch \
 "
-SRC_URI[md5sum] = "5e0faecba458ee1386078fb228d008ba"
-SRC_URI[sha256sum] = "49e7bca08dde95195a27f594f7c850b088be357a7c7096e44e1158c7a5fd7b33"
+SRC_URI[md5sum] = "e3cf6290999ee30651d75864eccfec63"
+SRC_URI[sha256sum] = "d3f9161e8ba0f107fe8d4df1f6d3a14c30cc3512dfc12a795daa367a27660dac"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
-- 
2.19.2


