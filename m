Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8B69070A6B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 21:38:38 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so6903352wev.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/pOPC6f7NNsNvzpnCitSQOSIIDBdxkYnfUSc1AlAcvM=;
	b=kXOI8jGqySZFTjYAUpRSuPV+UbngXMiRQnhhXkjE3fG990Kct9lJXgkarFeXpK5fTZ
	AFWdpzmeAwiz1kIKSbdzbZ/aA/6NFZKYHUAZ9h0PCB2Qr5M8bPOWgaW6Yr7kPz/Ti8d+
	LySgNoKHORdGt+8VnAH2DtOcRDWLTBegeZKx8tFxTM7CBx0mFTCGH6HutKVPRBqVVaXM
	xm/0L7j69sIWw1+8sTli79p1GuQsxIlBZ/gId5WTEJdkmKEBqO4xNKaUD9WmUkBP2DcR
	y1y3+Z99cKwPi0AKSux22wZ5bJR0Wif6xg7KgP6hM0YLedtfUbWx51kCmGrQz225Q6qt
	RhlQ==
X-Received: by 10.180.38.39 with SMTP id d7mr12951623wik.24.1407620318954;
	Sat, 09 Aug 2014 14:38:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm23230695wic.24.2014.08.09.14.38.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 14:38:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 23:39:09 +0200
Message-Id: <1407620350-7644-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-browser][PATCH 1/2] firefox: properly fix build without freetype-config
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
X-List-Received-Date: Sat, 09 Aug 2014 21:38:44 -0000

* fails with:
  ../../gfx/thebes/gfxFT2Utils.o: In function `gfxFT2LockedFace::GetMetrics(gfxFont::Metrics*, unsigned int*)':
  /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/firefox/10.0.11esr-r0/mozilla-esr10/gfx/thebes/gfxFT2Utils.cpp:139: undefined reference to `FT_Get_Sfnt_Table'
  /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/firefox/10.0.11esr-r0/mozilla-esr10/gfx/thebes/gfxFT2Utils.cpp:234: undefined reference to `FT_Get_Sfnt_Table'
  ../../gfx/thebes/gfxFT2Utils.o: In function `gfxFT2LockedFace::GetFontTable(unsigned int, FallibleTArray<unsigned char>&)':
  /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/firefox/10.0.11esr-r0/mozilla-esr10/gfx/thebes/gfxFT2Utils.cpp:364: undefined reference to `FT_Load_Sfnt_Table'
  /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/firefox/10.0.11esr-r0/mozilla-esr10/gfx/thebes/gfxFT2Utils.cpp:372: undefined reference to `FT_Load_Sfnt_Table'
  collect2: error: ld returned 1 exit status
  ../../config/rules.mk:1089: recipe for target 'libxul.so' failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox/firefox/freetype-2.5.patch | 73 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_10.0.11esr.bb      |  2 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 recipes-mozilla/firefox/firefox/freetype-2.5.patch

diff --git a/recipes-mozilla/firefox/firefox/freetype-2.5.patch b/recipes-mozilla/firefox/firefox/freetype-2.5.patch
new file mode 100644
index 0000000..78f4ff8
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/freetype-2.5.patch
@@ -0,0 +1,73 @@
+Adapted from:
+https://bugzilla.mozilla.org/show_bug.cgi?id=944454
+
+Upstream-Status: Backport
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr mozilla-esr10.orig/config/system-headers mozilla-esr10/config/system-headers
+--- mozilla-esr10.orig/config/system-headers	2012-11-15 19:24:02.000000000 +0100
++++ mozilla-esr10/config/system-headers	2014-08-09 20:59:18.103672068 +0200
+@@ -273,6 +273,19 @@
+ freetype/ttnameid.h
+ freetype/tttables.h
+ freetype/t1tables.h
++freetype.h
++ftcache.h
++ftglyph.h
++ftsynth.h
++ftoutln.h
++ttnameid.h
++tttables.h
++t1tables.h
++ftlcdfil.h
++ftsizes.h
++ftadvanc.h
++ftbitmap.h
++ftxf86.h
+ fribidi/fribidi.h
+ FSp_fopen.h
+ fstream
+diff -uNr mozilla-esr10.orig/js/src/config/system-headers mozilla-esr10/js/src/config/system-headers
+--- mozilla-esr10.orig/js/src/config/system-headers	2012-11-15 19:24:19.000000000 +0100
++++ mozilla-esr10/js/src/config/system-headers	2014-08-09 20:59:25.877672347 +0200
+@@ -273,6 +273,19 @@
+ freetype/ttnameid.h
+ freetype/tttables.h
+ freetype/t1tables.h
++freetype.h
++ftcache.h
++ftglyph.h
++ftsynth.h
++ftoutln.h
++ttnameid.h
++tttables.h
++t1tables.h
++ftlcdfil.h
++ftsizes.h
++ftadvanc.h
++ftbitmap.h
++ftxf86.h
+ fribidi/fribidi.h
+ FSp_fopen.h
+ fstream
+--- mozilla-esr10.orig/configure	2014-08-09 23:05:46.397944139 +0200
++++ mozilla-esr10/configure	2014-08-09 23:07:23.691947627 +0200
+@@ -16011,8 +16011,7 @@
+ #define MOZ_PANGO 1
+ EOF
+ 
+-    else
+-        succeeded=no
++    fi
+ 
+   if test -z "$PKG_CONFIG"; then
+     # Extract the first word of "pkg-config", so it can be a program name with args.
+@@ -16105,7 +16104,6 @@
+ 
+         
+         
+-    fi
+ fi
+ 
+ if test "$MOZ_ENABLE_QT"
diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 98da1a4..307e672 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -73,6 +73,7 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
            file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
            file://configure.patch \
            file://powerpc_va_list.patch \
+	   file://freetype-2.5.patch \
            file://vendor.js"
 
 SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
@@ -85,7 +86,6 @@ inherit mozilla
 EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
 
 ARM_INSTRUCTION_SET = "arm"
-TARGET_CC_ARCH += " -I${STAGING_INCDIR}/freetype2"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" destdir="${D}" install
-- 
2.0.4


