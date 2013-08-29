Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1A94B6BCF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:50 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so347803eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=++XEqXKmtuF8/FTRsD8iaFuR+EMXk65Kqj916seNmBM=;
	b=kxBMiJ9cpQJkKQJfCCjacrKSBPdq/J5iH0X2G9hVvJS5L6f7SX7/1k+8l4UgEB0dCq
	tcW6JMrvNKhdXE8OTU4oMpPw8kjaUQ8brne+/q30evj+rltScv7zqpqnDKwxrsufY65j
	EcJ9Noua+RkowErkV6ha2E4cTDYJTnbAED2yI1YJUY2WiYeuOHoxHWq+JIV1UNc4azJZ
	zorX/Bbcu9VhIAsdaCH7YGLcFAvSNitJvCRKC/Cuk/i0B56SFn0mFC4Hx9EOCtErxtb1
	8JAJ6Aq9NrCTM/jkGbpN6xorcluwEnDRdAaJBiffgN2fGlL0afCD6rHiI+NoEirmWBU0
	i2cQ==
X-Received: by 10.14.99.193 with SMTP id x41mr5392254eef.52.1377791451528;
	Thu, 29 Aug 2013 08:50:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm47155046eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:55 +0200
Message-Id: <ce667a200941cb8764ff7ce563650571fc3b3378.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 02/66] libmikmod: upgrade to 3.2.0
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:51 -0000

* 3.3 is only beta
* 3.1.12 was failing to build with texinfo-5, see
  http://sourceforge.net/p/mikmod/mercurial/ci/1fd17189f82561a3a0e343aef05e5cf0b39b8f26/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mikmod/libmikmod/CVE-2010-2971.patch           | 24 ----------------------
 .../mikmod/libmikmod/ldflags.patch                 |  4 ++--
 .../{libmikmod_3.1.12.bb => libmikmod_3.2.0.bb}    |  7 +++----
 3 files changed, 5 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-2971.patch
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.1.12.bb => libmikmod_3.2.0.bb} (73%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-2971.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-2971.patch
deleted file mode 100644
index 94ea8f5..0000000
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/CVE-2010-2971.patch
+++ /dev/null
@@ -1,24 +0,0 @@
----
- loaders/load_it.c |    4 ++++
- 1 file changed, 4 insertions(+)
-
---- libmikmod-3.1.12.orig/loaders/load_it.c
-+++ libmikmod-3.1.12/loaders/load_it.c
-@@ -743,6 +743,8 @@ BOOL IT_Load(BOOL curious)
- #define IT_LoadEnvelope(name,type) 										\
-				ih. name##flg   =_mm_read_UBYTE(modreader);				\
-				ih. name##pts   =_mm_read_UBYTE(modreader);				\
-+				if (ih. name##pts > ITENVCNT)							\
-+					ih. name##pts = ITENVCNT;							\
-				ih. name##beg   =_mm_read_UBYTE(modreader);				\
-				ih. name##end   =_mm_read_UBYTE(modreader);				\
-				ih. name##susbeg=_mm_read_UBYTE(modreader);				\
-@@ -756,6 +758,8 @@ BOOL IT_Load(BOOL curious)
- #define IT_LoadEnvelope(name,type) 										\
-				ih. name/**/flg   =_mm_read_UBYTE(modreader);			\
-				ih. name/**/pts   =_mm_read_UBYTE(modreader);			\
-+				if (ih. name/**/pts > ITENVCNT)							\
-+					ih. name/**/pts = ITENVCNT;							\
-				ih. name/**/beg   =_mm_read_UBYTE(modreader);			\
-				ih. name/**/end   =_mm_read_UBYTE(modreader);			\
-				ih. name/**/susbeg=_mm_read_UBYTE(modreader);			\
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
index 4261379..de31139 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
@@ -5,8 +5,8 @@ diff -urN libmikmod-3.1.12.orig/libmikmod/Makefile.in libmikmod-3.1.12/libmikmod
  	rm -f Makefile
  
  $(LIB): $(OBJ)
--	$(LIBTOOL) --mode=link $(CC) -version-info 2:4:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
-+	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -version-info 2:4:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
+-	$(LIBTOOL) --mode=link $(CC) -version-info 3:0:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
++	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -version-info 3:0:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
  
  dl_hpux.lo:	$(top_srcdir)/dlapi/dl_hpux.c \
  			$(top_srcdir)/dlapi/dlfcn.h
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
similarity index 73%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
index e6bdcbe..b1ebf97 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
@@ -6,16 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \
+    http://mikmod.shlomifish.org/files/${P}.tar.gz \
     file://m4.patch \
     file://autofoo.patch \
     file://ldflags.patch \
-    file://CVE-2010-2971.patch \
     file://obsolete_automake_macros.patch \
 "
 
-SRC_URI[md5sum] = "9f3c740298260d5f88981fc0d51f6f16"
-SRC_URI[sha256sum] = "891a2b780306e6ef86e381f459e71a085d4e7f56c970a879d3bf341c01bdfc32"
+SRC_URI[md5sum] = "96e9820d72a41fe27ff304071739696c"
+SRC_URI[sha256sum] = "734c8490bbf9b0c587920b92414dcfa3c2267838a0cdf698d5f1fb6bba8f661e"
 
 inherit autotools binconfig lib_package
 
-- 
1.8.3.2


