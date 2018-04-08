Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6802E75574
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:12 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id y12-v6so3103237plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9+EBS/6u14EI9iq0SZzbFIhVcCMXky9/6xdeQGoFGHY=;
	b=Ioo357GyDtX7N6sjoZTmUuTRdyZ9ivJG/BdZxnUH60jOLc4IHsW+S7KKTMMjbOm1Gs
	UZVHnmg6kCU3i9uzplGoLj8ebT4Fzu2tEkYJwFMtscoZwAbNEZjhI/7mywJ8Wj4Gsy4C
	OYLcT1sSJgKbgaUL3olR4AmWwPlggDCKu6nZm3FtIOCCZksnqYmM9z4923ks3LQGqoFN
	HGV4ZUA4H7Ig2iyPMbqxdgU3BOpADT+hQlkAqYnyd/rVY27ybxnPd00weh2c/Ey/zMIi
	trTN3Fmb+OZtHWCEsk/su9bmA4Hpj67Jw/7Lsa/lyEbGKfDTWOb4ATwQsDLjh0ZY6JyF
	4SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9+EBS/6u14EI9iq0SZzbFIhVcCMXky9/6xdeQGoFGHY=;
	b=PFbAAf0C+9MMlteHQbOF8K+A2uaqay2ETzYZxbIF2bDBrrHrb525i/MAD1qL811/1J
	Zta/nbutrW9//FPykXsfKwFBSn8yTbNv2Ctzf3E1i9Jcl3xxHge38jtL2wi8+KNaFHeZ
	8sVgom85Mz6XX2lGtPolIBDCEDOT9nYhVl1+j7W1xch8cYlhE1V6TBbm9BGa/XBe2QHT
	XGeOX/1dzUDWQUeUMFFehjpki0STvMf9zj30/+XP/VAMJrGmnDfQmQmVvjOIb93Md/eb
	2VX4qD+yRIHDCWfuwFtfHvDfGavDGQa1K03UoRHC521TCnAerIpoRcc4pGH+kpZkRxQU
	AQvQ==
X-Gm-Message-State: AElRT7E1ePIGCoxFoD9bD7IoP1KF1bAP5jk5S1tGC8gD82BD0VYsTs2l
	RR4Pokh8Vel75XIRr8XCM+pULA==
X-Google-Smtp-Source: AIpwx48duHE52JnDz0dgkKBSt7CK3b+Irrj7kbOALeyz/pQTFVTeuRriahLxJhgRS+7krCG29J056A==
X-Received: by 2002:a17:902:be12:: with SMTP id
	r18-v6mr31541582pls.173.1523170753307; 
	Sat, 07 Apr 2018 23:59:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:33 -0700
Message-Id: <1523170729-26321-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 21/37] t1lib: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:12 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file Makefile.in
Hunk #1 succeeded at 18 with fuzz 1.
Hunk #2 succeeded at 150 (offset -1 lines).
checking file examples/Makefile.in
checking file lib/Makefile.in
checking file lib/t1lib/Makefile.in
checking file lib/type1/Makefile.in
checking file type1afm/Makefile.in
checking file xglyph/Makefile.in

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../t1lib/t1lib-5.1.2/configure.patch              | 79 +++++++++++++---------
 .../t1lib/t1lib-5.1.2/format_security.patch        | 43 ++++++++----
 .../t1lib/t1lib-5.1.2/libtool.patch                | 60 +++++++++++-----
 3 files changed, 120 insertions(+), 62 deletions(-)

diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
index 8b98707..976e038 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
+++ b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/configure.patch
@@ -1,11 +1,21 @@
+From 81c1ba940415595584a837ab1078c64855072f0c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 21 Nov 2011 12:00:54 +0100
+Subject: [PATCH] t1lib: add 5.1.2
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
 
---- t1lib-5.0.2/configure.in~configure.patch
-+++ t1lib-5.0.2/configure.in
-@@ -75,9 +75,9 @@
+---
+ configure.in | 95 ++++++++++++++++++++++++------------------------------------
+ 1 file changed, 38 insertions(+), 57 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index eade4c0..e649ea9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -74,9 +74,9 @@ T1LIB_PATCHLEVEL=builtin(eval, MACRO_T1LIB_LT_REVISION)
  T1LIB_VERSIONSTRING=\"MACRO_T1LIB_IDENTIFIER\"
  
  
@@ -18,7 +28,7 @@
  
  dnl We want these before the checks, so the checks can modify their values.
  test -z "$LDLIBS" && LDLIBS=-lm   AC_SUBST(LDLIBS)
-@@ -161,6 +161,7 @@
+@@ -162,6 +162,7 @@ fi
  
  dnl **** Check for underscore on external symbols ****
  
@@ -26,21 +36,12 @@
  AC_CACHE_CHECK("whether external symbols need an underscore prefix",
                 ac_cv_c_extern_prefix,
  [saved_libs=$LIBS
-@@ -178,68 +179,48 @@
+@@ -179,68 +180,48 @@ then
    AC_DEFINE(NEED_UNDERSCORE_PREFIX)
  fi
  
 -dnl **** Check which ANSI integer type is 16 bit 
-+dnl **** Check which ANSI integer type is 16 bit
-+T1_AA_TYPE16=""
-+for type in short int; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x2"; then
-+		T1_AA_TYPE16="-DT1_AA_TYPE16=$type"
-+		T1_INT16="$type"
-+		break
-+	fi
-+done
- 
+-
 -AC_CACHE_CHECK( "which ANSI integer type is 16 bit", ac_16bit_type,
 -		AC_TRY_RUN([
 -int main(void) {
@@ -58,21 +59,23 @@
 -else
 -  T1_AA_TYPE16="-DT1_AA_TYPE16=int"
 -  T1_INT16="int"
++dnl **** Check which ANSI integer type is 16 bit
++T1_AA_TYPE16=""
++for type in short int; do
++	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x2"; then
++		T1_AA_TYPE16="-DT1_AA_TYPE16=$type"
++		T1_INT16="$type"
++		break
++	fi
++done
++
 +if test x"$T1_AA_TYPE16" = "x"; then
 +	AC_MSG_ERROR("Unable to determine which integer type is 16 bit.")
  fi
  
 -
  dnl **** Check which ANSI integer type is 32 bit 
-+T1_AA_TYPE32=""
-+for type in int long; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x4"; then
-+		T1_AA_TYPE32="-DT1_AA_TYPE32=$type"
-+		T1_INT32="$type"
-+		break
-+	fi
-+done
- 
+-
 -AC_CACHE_CHECK( "which ANSI integer type is 32 bit", ac_32bit_type,
 -		AC_TRY_RUN([
 -int main(void) {
@@ -90,21 +93,22 @@
 -else
 -  T1_AA_TYPE32="-DT1_AA_TYPE32=long"
 -  T1_INT32="long"
++T1_AA_TYPE32=""
++for type in int long; do
++	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x4"; then
++		T1_AA_TYPE32="-DT1_AA_TYPE32=$type"
++		T1_INT32="$type"
++		break
++	fi
++done
++
 +if test x"$T1_AA_TYPE32" = "x"; then
 +	AC_MSG_ERROR("Unable to determine which integer type is 32 bit.")
  fi
  
 -
  dnl **** Check which ANSI integer type is 64 bit 
-+T1_AA_TYPE64=""
-+for type in long long_long; do
-+	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x8"; then
-+		AC_MSG_WARN("$type is 64 bit")
-+		T1_AA_TYPE64="-DT1_AA_TYPE64=\"`echo $type|tr '_' ' '`\""
-+		break
-+	fi
-+done
- 
+-
 -AC_CACHE_CHECK( "which ANSI integer type is 64 bit", ac_64bit_type,
 -		AC_TRY_RUN([
 -int main(void) {
@@ -118,6 +122,15 @@
 -  T1_AA_TYPE64="-DT1_AA_TYPE64=long"
 -else
 -  T1_AA_TYPE64=
++T1_AA_TYPE64=""
++for type in long long_long; do
++	if test x"`eval echo \\$ac_cv_sizeof_$type`" = "x8"; then
++		AC_MSG_WARN("$type is 64 bit")
++		T1_AA_TYPE64="-DT1_AA_TYPE64=\"`echo $type|tr '_' ' '`\""
++		break
++	fi
++done
++
 +if test x"$T1_AA_TYPE64" = "x"; then
 +	AC_MSG_ERROR("Unable to determine which integer type is 64 bit.")
  fi
diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
index 8b4ce40..bc2476b 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
+++ b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
@@ -1,3 +1,8 @@
+From cea83003de3ffebde92becd1e599fe3b28f0a7c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Mar 2017 23:13:36 -0800
+Subject: [PATCH] t1lib: Fix printf format string errors
+
 Fix printf formats to use format qualifiers
 fixes
 
@@ -6,20 +11,17 @@ error: format string is not a string literal (potentially insecure) [-Werror,-Wf
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
---- a/lib/type1/objects.c
-+++ b/lib/type1/objects.c
-@@ -957,7 +957,7 @@
-  
-        sprintf(typemsg, "Wrong object type in %s; expected %s, found %s.\n",
-                   name, TypeFmt(expect), TypeFmt(obj->type));
--       IfTrace0(TRUE,typemsg);
-+       IfTrace1(TRUE, "%s", typemsg);
-  
-        ObjectPostMortem(obj);
-  
+---
+ lib/t1lib/t1subset.c | 2 +-
+ lib/type1/objects.c  | 2 +-
+ lib/type1/objects.h  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/t1lib/t1subset.c b/lib/t1lib/t1subset.c
+index da427b2..e76974f 100644
 --- a/lib/t1lib/t1subset.c
 +++ b/lib/t1lib/t1subset.c
-@@ -759,7 +759,7 @@
+@@ -759,7 +759,7 @@ char *T1_SubsetFont( int FontID,
  	     tr_len);
      T1_PrintLog( "T1_SubsetFont()", err_warn_msg_buf,
  		 T1LOG_DEBUG);
@@ -28,9 +30,24 @@ Upstream-Status: Pending
    }
    
    /* compute size of output file */
+diff --git a/lib/type1/objects.c b/lib/type1/objects.c
+index c413a0f..f828e6a 100644
+--- a/lib/type1/objects.c
++++ b/lib/type1/objects.c
+@@ -957,7 +957,7 @@ struct xobject *TypeErr(name, obj, expect, ret) /* non-ANSI avoids overly strict
+  
+        sprintf(typemsg, "Wrong object type in %s; expected %s, found %s.\n",
+                   name, TypeFmt(expect), TypeFmt(obj->type));
+-       IfTrace0(TRUE,typemsg);
++       IfTrace1(TRUE, "%s", typemsg);
+  
+        ObjectPostMortem(obj);
+  
+diff --git a/lib/type1/objects.h b/lib/type1/objects.h
+index 13cbae7..3a1d337 100644
 --- a/lib/type1/objects.h
 +++ b/lib/type1/objects.h
-@@ -214,7 +214,7 @@
+@@ -214,7 +214,7 @@ struct xobject {
  /*SHARED*/
  /* NDW: personally, I want to see status and error messages! */
  #define IfTrace0(condition,model)                                 \
diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
index e050025..da54f87 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
+++ b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/libtool.patch
@@ -1,12 +1,28 @@
+From bab41f5e1fc1fc809da1371e6a0222e0eb21e5f0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 21 Nov 2011 12:00:54 +0100
+Subject: [PATCH] t1lib: add 5.1.2
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
 
---- t1lib-5.0.2/Makefile.in~libtool
-+++ t1lib-5.0.2/Makefile.in
+---
+ Makefile.in           | 5 +++--
+ examples/Makefile.in  | 5 +++--
+ lib/Makefile.in       | 6 ++++--
+ lib/t1lib/Makefile.in | 6 ++++--
+ lib/type1/Makefile.in | 6 ++++--
+ type1afm/Makefile.in  | 6 ++++--
+ xglyph/Makefile.in    | 6 ++++--
+ 7 files changed, 26 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 29c3468..396c020 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -18,7 +18,8 @@
- # Last modified:       2001-04-01
+ # Last modified:       2005-05-01
  #
  
 -SHELL     = /bin/sh
@@ -15,7 +31,7 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
-@@ -150,7 +151,7 @@
+@@ -149,7 +150,7 @@ distclean: clean
  	$(RM) examples/Makefile
  	$(RM) xglyph/Makefile
  	$(RM) doc/Makefile
@@ -24,8 +40,10 @@
  
  
  # The following two targets are for building and cleaning the python-
---- t1lib-5.0.2/examples/Makefile.in~libtool
-+++ t1lib-5.0.2/examples/Makefile.in
+diff --git a/examples/Makefile.in b/examples/Makefile.in
+index b301db5..7a6a514 100644
+--- a/examples/Makefile.in
++++ b/examples/Makefile.in
 @@ -14,9 +14,10 @@
  # Last modified:       2001-04-01
  #
@@ -39,8 +57,10 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
---- t1lib-5.0.2/lib/Makefile.in~libtool
-+++ t1lib-5.0.2/lib/Makefile.in
+diff --git a/lib/Makefile.in b/lib/Makefile.in
+index 89e5e86..6e0f960 100644
+--- a/lib/Makefile.in
++++ b/lib/Makefile.in
 @@ -15,8 +15,10 @@
  #
  # Contributions by H.Kakugawa to use libtool!
@@ -54,8 +74,10 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
---- t1lib-5.0.2/lib/t1lib/Makefile.in~libtool
-+++ t1lib-5.0.2/lib/t1lib/Makefile.in
+diff --git a/lib/t1lib/Makefile.in b/lib/t1lib/Makefile.in
+index a6c2478..32434b3 100644
+--- a/lib/t1lib/Makefile.in
++++ b/lib/t1lib/Makefile.in
 @@ -14,8 +14,10 @@
  #
  # Modified by H.Kakugawa to use libtool
@@ -69,8 +91,10 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
---- t1lib-5.0.2/lib/type1/Makefile.in~libtool
-+++ t1lib-5.0.2/lib/type1/Makefile.in
+diff --git a/lib/type1/Makefile.in b/lib/type1/Makefile.in
+index 241f124..42efa94 100644
+--- a/lib/type1/Makefile.in
++++ b/lib/type1/Makefile.in
 @@ -14,8 +14,10 @@
  #
  # Modified by H.Kakugawa to use libtool
@@ -84,8 +108,10 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
---- t1lib-5.0.2/type1afm/Makefile.in~libtool
-+++ t1lib-5.0.2/type1afm/Makefile.in
+diff --git a/type1afm/Makefile.in b/type1afm/Makefile.in
+index 61611e1..9b51406 100644
+--- a/type1afm/Makefile.in
++++ b/type1afm/Makefile.in
 @@ -15,8 +15,10 @@
  #
  # Modified by H.Kakugawa to use libtool
@@ -99,8 +125,10 @@
  CC        = @CC@
  CPP       = @CPP@
  CFLAGS    = @CFLAGS@
---- t1lib-5.0.2/xglyph/Makefile.in~libtool
-+++ t1lib-5.0.2/xglyph/Makefile.in
+diff --git a/xglyph/Makefile.in b/xglyph/Makefile.in
+index 8da9b63..741334c 100644
+--- a/xglyph/Makefile.in
++++ b/xglyph/Makefile.in
 @@ -15,8 +15,10 @@
  #
  # Modified by H.Kakugawa to use libtool
-- 
2.7.4


