Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7773D7855A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:43:10 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z91so6786910wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cOeWMIQxuQk204/WUDR1iDWgj3xfrfVpMmt7oAqsK2Q=;
	b=jk94cJC1rXX/i6dMiqaqdZ4JJbRlVnMplm4fduDt2kOqj6FR1h3RwJDgL8oMkWXcE7
	t1O/IVFKPJE1AgED3/tLZvaij2R/ZKT2CHq5LiYI5/jshzX6Mems2TET+fFTuPMVElm8
	X48KqxTKgeA9Ksu7qPzEmQg/HxoBB78jJIACY+Kr5a1fafxcF7TLQsLpzMyoblSPfHDh
	uF1MKYcK+dtFkYxy7Sy/n9842biNYYpWQiESYWyBSWfaQ9OCzF4TpvI3qofStRJd3nUB
	6HGhlCZeoN1aIxYh0ZfdeTlgtVD9vu2QvN2oGCycH1tPtrlRyvwebxbsjmfGgu0eC/ea
	ODlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cOeWMIQxuQk204/WUDR1iDWgj3xfrfVpMmt7oAqsK2Q=;
	b=WDsYUeiwTwls6yaJKibvoVnURPEFlhJzHgM8gGEylG3cjxwierSO+gEi2j7e++MZYR
	HztKyta1GDVHToVVSHZ8jqIVSOVXamqSmsbsiom7KggluIHYYEPWHcGMKxkj84QprqVk
	JqlqblJ5gGW8pu5srL8o68+39sGKurKohbGfAXJnRbLNBE3z666gaEuGGCdkUQ6QRgYj
	GV7bzvYZipNH7hrpbiTu7XGYO0szPB7SFBUut5YU5zkeQpobzlX+REbGc6h1rEAsb8Hf
	bMSs07tiZJgxHN3fVXjCInfpFaoKmWh6La2WH9v1d+VhpZjnnI3o9dcE0QFfFtw1wKyI
	CROQ==
X-Gm-Message-State: AHYfb5iZV/aUGA6+S+Af1uHdGp3aTCpAbygSIQjkTzedBliEaKSfknZq
	r8ksThvWdQh0eCCL
X-Received: by 10.223.180.69 with SMTP id v5mr4385448wrd.199.1502995390636;
	Thu, 17 Aug 2017 11:43:10 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x4sm3898805wrd.66.2017.08.17.11.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 11:43:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Aug 2017 20:44:43 +0200
Message-Id: <20170817184445.10108-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170817184445.10108-1-Martin.Jansa@gmail.com>
References: <20170817184445.10108-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/4] qtwebengine: refresh patches
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
X-List-Received-Date: Thu, 17 Aug 2017 18:43:11 -0000

* upload the patches to b5.8 branch on:
  https://github.com/meta-qt5/qtwebengine
  and 53-based on:
  https://github.com/meta-qt5/qtwebengine-chromium
* refresh the patches

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...se.gypi-include-atomicops_internals_x86_g.patch |  9 ++---
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  6 ++--
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  7 ++--
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  6 ++--
 .../0003-chromium-v8-fix-build-with-gcc7.patch     |  7 ++--
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  6 ++--
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  6 ++--
 .../0004-chromium-WebKit-fix-build-with-gcc7.patch |  7 ++--
 .../0004-include-fcntl.h-for-loff_t.patch          | 25 --------------
 ...-dependency-to-QCoreApplication-translate.patch |  4 +--
 ...l-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} | 18 +++++-----
 ...l-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} | 27 +++++++--------
 ...-chromium-musl-include-fcntl.h-for-loff_t.patch | 22 +++++++++++++
 ...l-use-off64_t-instead-of-the-internal-__.patch} | 17 ++++------
 ...um-musl-linux-glibc-make-the-distinction.patch} | 17 ++++------
 ...l-allocator-Do-not-include-glibc_weak_sy.patch} | 20 +++++-------
 ...l-Use-correct-member-name-__si_fields-fr.patch} | 18 +++++-----
 ...romium-musl-Match-syscalls-to-match-musl.patch} | 21 +++++-------
 ...l-Define-res_ninit-and-res_nclose-for-no.patch} | 38 ++++++++++------------
 ...3-include-asm-generic-ioctl.h-for-TCGETS2.patch | 25 --------------
 ...romium-musl-Do-not-define-__sbrk-on-musl.patch} | 17 ++++------
 ...m-musl-Adjust-default-pthread-stack-size.patch} | 30 ++++++++---------
 ...sl-include-asm-generic-ioctl.h-for-TCGETS.patch | 22 +++++++++++++
 ...omium-musl-link-with-libexecinfo-on-musl.patch} | 17 ++++------
 ...l-tcmalloc-Use-off64_t-insread-of-__off6.patch} | 17 ++++------
 recipes-qt/qt5/qtwebengine_git.bb                  | 28 ++++++++--------
 26 files changed, 193 insertions(+), 244 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
 rename recipes-qt/qt5/qtwebengine/{0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch => 0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} (61%)
 rename recipes-qt/qt5/qtwebengine/{0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch => 0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} (60%)
 create mode 100644 recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
 rename recipes-qt/qt5/qtwebengine/{0005-use-off64_t-instead-of-the-internal-__off64_t.patch => 0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch} (80%)
 rename recipes-qt/qt5/qtwebengine/{0006-linux-glibc-make-the-distinction.patch => 0009-chromium-musl-linux-glibc-make-the-distinction.patch} (62%)
 rename recipes-qt/qt5/qtwebengine/{0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch => 0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch} (53%)
 rename recipes-qt/qt5/qtwebengine/{0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch => 0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch} (59%)
 rename recipes-qt/qt5/qtwebengine/{0009-Match-syscalls-to-match-musl.patch => 0012-chromium-musl-Match-syscalls-to-match-musl.patch} (56%)
 rename recipes-qt/qt5/qtwebengine/{0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch => 0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (59%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
 rename recipes-qt/qt5/qtwebengine/{0011-Do-not-define-__sbrk-on-musl.patch => 0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (53%)
 rename recipes-qt/qt5/qtwebengine/{0012-Adjust-default-pthread-stack-size.patch => 0015-chromium-musl-Adjust-default-pthread-stack-size.patch} (57%)
 create mode 100644 recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
 rename recipes-qt/qt5/qtwebengine/{0014-link-with-libexecinfo-on-musl.patch => 0017-chromium-musl-link-with-libexecinfo-on-musl.patch} (53%)
 rename recipes-qt/qt5/qtwebengine/{0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch => 0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (56%)

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 4490116..560a027 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From 83eee1ff5f9259595b8630e464fa869c6fde8f3c Mon Sep 17 00:00:00 2001
+From d70a7ccba09ba96e0068ad253b3aac7a47125f8e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH 1/4] <chromium> base.gypi: include
- atomicops_internals_x86_gcc.cc when building for x64 arch
+Subject: [PATCH] chromium base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -22,6 +22,3 @@ index a4da596070..13173d621e 100644
                'sources/': [
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index b7bd5a4..3d8b3b0 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From 793db05d66b7a92ebe069dc76093487489dd8b69 Mon Sep 17 00:00:00 2001
+From 2f3a16a0efaf02521425da2db7d88710da3074b4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 20fb278..7aa0b4a 100644
+index 236ee8ac..0333bdd1 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -168,9 +168,9 @@ defineReplace(mocOutput) {
+@@ -319,9 +319,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index eae2787..587b632 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,7 +1,7 @@
-From 4aa614106c03793709e5dbd69f45df8a5e5c9fe4 Mon Sep 17 00:00:00 2001
+From 79a62dbe498946f487edcb0228c350d9fe7e4d09 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
-Subject: [PATCH 2/4] chromium: Change false to FALSE and 1 to TRUE, FIX
+Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
  qtwebengine compile
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
@@ -61,6 +61,3 @@ index 6d926378be..738d3fdedf 100644
  
    // we want to always get RGB data out
    switch (cinfo.jpeg_color_space) {
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index e487c6a..93e68b5 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From aa5bb11072bc0e441dc6533f53ed5359c5000088 Mon Sep 17 00:00:00 2001
+From bf7f70ae0bf7345c2546f4f4bc371a9e8eeb0bd3 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 7aa0b4a..9b3a639 100644
+index 0333bdd1..687d34f8 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -165,7 +165,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -316,7 +316,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
index 2acce2c..f2456dd 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
@@ -1,7 +1,7 @@
-From 1a163c0cab05761f269fcb5adad5d40d71200d52 Mon Sep 17 00:00:00 2001
+From 944746d5d04ea8eaf268a97440c98136beae1e47 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 11 Jul 2017 10:15:41 +0200
-Subject: [PATCH 3/4] chromium: v8 fix build with gcc7
+Subject: [PATCH] chromium: v8 fix build with gcc7
 
 Use the fix from nodejs:
 https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f51210c50e8
@@ -129,6 +129,3 @@ index 7d774beb5b..eda1478766 100644
  
    // Returns a new HashTable object.
    MUST_USE_RESULT static Handle<Derived> New(
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 786a383..a460178 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 6918d25c54ec4bc17a9b612c0d24b0f01be3aca1 Mon Sep 17 00:00:00 2001
+From 5ff09196304a38304893e0703a8a7d2df2ec889a Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -12,10 +12,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 9b3a639..dc5ed1c 100644
+index 687d34f8..5c0c40fd 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
+@@ -21,6 +21,12 @@ defineTest(isPlatformSupported) {
        return(false)
      }
      gcc:!clang:!isGCCVersionSupported(): return(false)
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index d10ddf7..4001563 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From 6ed60f35761ab268004727be544e9ccf70594211 Mon Sep 17 00:00:00 2001
+From 0e1143af443c80cd49663b55128ab4dd8e570ee1 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index f13bfd0..0e12244 100644
+index d692140e..58528114 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
-@@ -60,6 +60,8 @@
+@@ -59,6 +59,8 @@
  #include <QString>
  #include <QtCore/qcompilerdetection.h>
  #include <QtGui/qaccessibleobject.h>
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
index 46e8761..041d29b 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
@@ -1,7 +1,7 @@
-From 2be0856e09f47e7f2c35e77d4e000d769c6beaf9 Mon Sep 17 00:00:00 2001
+From f62b851edbcc3ac3da448d7570908ad78ebe77dc Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 11 Jul 2017 10:18:13 +0200
-Subject: [PATCH 4/4] chromium: WebKit fix build with gcc7
+Subject: [PATCH] chromium: WebKit fix build with gcc7
 
 Based on qtwebengine-opensource-src-5.8.0-wtf-gcc7.patch from
 http://git.net/ml/scm-fedora-commits/2017-03/msg15697.html
@@ -39,6 +39,3 @@ index e85c72fd65..6f94cd6734 100644
  template<typename T, typename U, typename V, typename W>
  inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
  {
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
deleted file mode 100644
index da8503b..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a0b40dcdfb3331d2b8351bdfb27f1ba3e8a2c33c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2017 14:37:49 -0700
-Subject: [PATCH 04/12] include fcntl.h for loff_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index bdbc4b7e3..b53dd46c5 100644
---- a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-+++ b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-@@ -151,6 +151,7 @@ extern "C" {
- #include <stddef.h>
- #include <stdint.h>
- #include <string.h>
-+#include <fcntl.h>
- #include <sys/ptrace.h>
- #include <sys/resource.h>
- #include <sys/time.h>
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index 27bd141..196ef4c 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 4105c12d6f91171934f60b4dbb74b1ca7a9a3eb2 Mon Sep 17 00:00:00 2001
+From d8fd8c8388c54a0322e60e8be49236df3862ec56 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index b13a9da..8a54cce 100644
+index b21d40b8..758d5335 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
 @@ -46,6 +46,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
similarity index 61%
rename from recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
rename to recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index c56cfc7..b1a0857 100644
--- a/recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,19 +1,20 @@
-From 89d6283c91f2229cc51f473eed344de97d09e946 Mon Sep 17 00:00:00 2001
+From fac50c58630264d67e447c2dcdcf54b4f806d35e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
-Subject: [PATCH 01/12] sandbox: Define TEMP_FAILURE_RETRY if not defined
+Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
+ defined
 
 Musl does not define this Macro
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sandbox/linux/suid/sandbox.c | 9 +++++++++
+ chromium/sandbox/linux/suid/sandbox.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
-diff --git a/sandbox/linux/suid/sandbox.c b/sandbox/linux/suid/sandbox.c
-index b655d1c79..3de34e36f 100644
---- a/sandbox/linux/suid/sandbox.c
-+++ b/sandbox/linux/suid/sandbox.c
+diff --git a/chromium/sandbox/linux/suid/sandbox.c b/chromium/sandbox/linux/suid/sandbox.c
+index b655d1c79c..3de34e36f2 100644
+--- a/chromium/sandbox/linux/suid/sandbox.c
++++ b/chromium/sandbox/linux/suid/sandbox.c
 @@ -44,6 +44,15 @@ static bool DropRoot();
  
  #define HANDLE_EINTR(x) TEMP_FAILURE_RETRY(x)
@@ -30,6 +31,3 @@ index b655d1c79..3de34e36f 100644
  static void FatalError(const char* msg, ...)
      __attribute__((noreturn, format(printf, 1, 2)));
  
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
similarity index 60%
rename from recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
rename to recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 2e0b1f0..43982da 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,18 +1,18 @@
-From 8defe37306b0d1548592afc12baa45f4aec5375c Mon Sep 17 00:00:00 2001
+From e7e4def6d1422b84a9d6a6f7b285515d96210e87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
-Subject: [PATCH 03/12] Avoid mallinfo() APIs on non-glibc/linux
+Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- base/trace_event/malloc_dump_provider.cc | 3 ++-
- content/child/content_child_helpers.cc   | 2 +-
+ chromium/base/trace_event/malloc_dump_provider.cc | 3 ++-
+ chromium/content/child/content_child_helpers.cc   | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/base/trace_event/malloc_dump_provider.cc b/base/trace_event/malloc_dump_provider.cc
-index 3b1a933bc..a554d0373 100644
---- a/base/trace_event/malloc_dump_provider.cc
-+++ b/base/trace_event/malloc_dump_provider.cc
+diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
+index 3b1a933bce..a554d03739 100644
+--- a/chromium/base/trace_event/malloc_dump_provider.cc
++++ b/chromium/base/trace_event/malloc_dump_provider.cc
 @@ -103,6 +103,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
  // the current process.
  bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
@@ -30,10 +30,10 @@ index 3b1a933bc..a554d0373 100644
    return true;
  }
  
-diff --git a/content/child/content_child_helpers.cc b/content/child/content_child_helpers.cc
-index 7ddeb4d16..b8c73b09c 100644
---- a/content/child/content_child_helpers.cc
-+++ b/content/child/content_child_helpers.cc
+diff --git a/chromium/content/child/content_child_helpers.cc b/chromium/content/child/content_child_helpers.cc
+index 7ddeb4d16a..b8c73b09c5 100644
+--- a/chromium/content/child/content_child_helpers.cc
++++ b/chromium/content/child/content_child_helpers.cc
 @@ -25,7 +25,7 @@ namespace content {
  // though, this provides only a partial and misleading value.
  // Unfortunately some telemetry benchmark rely on it and these need to
@@ -43,6 +43,3 @@ index 7ddeb4d16..b8c73b09c 100644
  size_t GetMemoryUsageKB() {
    struct mallinfo minfo = mallinfo();
    uint64_t mem_usage =
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
new file mode 100644
index 0000000..95a12b0
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -0,0 +1,22 @@
+From eac1905c90085d3b9de3764078022643dd1b5ce9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:37:49 -0700
+Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+index bdbc4b7e3b..b53dd46c57 100644
+--- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
++++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+@@ -151,6 +151,7 @@ extern "C" {
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <fcntl.h>
+ #include <sys/ptrace.h>
+ #include <sys/resource.h>
+ #include <sys/time.h>
diff --git a/recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
similarity index 80%
rename from recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
rename to recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index d552a34..d15a63f 100644
--- a/recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,20 +1,20 @@
-From badea43b85346525b7c43c38c32d150b7eb85b13 Mon Sep 17 00:00:00 2001
+From 1690ac56cc013c3a18aa3c83e0efae47cc9da4f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
-Subject: [PATCH 05/12] use off64_t instead of the internal __off64_t
+Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
 
 - only do the glibc 32-bit ABI check for mmap/mmap64 on gnu libc. musl
   does not support the 32-bit ABI.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 10 +++++-----
+ .../third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-index 715c045f6..edc8cf2db 100644
---- a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-+++ b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+diff --git a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+index 715c045f66..edc8cf2db7 100644
+--- a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
++++ b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 @@ -77,7 +77,7 @@ typedef off64_t __off64_t;
  
  static inline void* do_mmap64(void *start, size_t length,
@@ -60,6 +60,3 @@ index 715c045f6..edc8cf2db 100644
  
  extern "C" void* mmap(void *start, size_t length, int prot, int flags,
                        int fd, off_t offset) __THROW {
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch
similarity index 62%
rename from recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch
rename to recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch
index 257d873..434d62c 100644
--- a/recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,17 +1,17 @@
-From 4913850cd644e1fd44ecade5e9faa460de35a7d6 Mon Sep 17 00:00:00 2001
+From 71072da07e963ae1b05f9d956ef715de8d249c5d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
-Subject: [PATCH 06/12] linux != glibc, make the distinction
+Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- base/allocator/allocator_check.cc | 2 +-
+ chromium/base/allocator/allocator_check.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/base/allocator/allocator_check.cc b/base/allocator/allocator_check.cc
-index 5a0564d2f..8c2dc6491 100644
---- a/base/allocator/allocator_check.cc
-+++ b/base/allocator/allocator_check.cc
+diff --git a/chromium/base/allocator/allocator_check.cc b/chromium/base/allocator/allocator_check.cc
+index 5a0564d2f3..8c2dc6491d 100644
+--- a/chromium/base/allocator/allocator_check.cc
++++ b/chromium/base/allocator/allocator_check.cc
 @@ -21,7 +21,7 @@ bool IsAllocatorInitialized() {
  #if defined(OS_WIN) && defined(ALLOCATOR_SHIM)
    // Set by allocator_shim_win.cc when the shimmed _set_new_mode() is called.
@@ -21,6 +21,3 @@ index 5a0564d2f..8c2dc6491 100644
      !defined(MEMORY_TOOL_REPLACES_ALLOCATOR)
  // From third_party/tcmalloc/chromium/src/gperftools/tcmalloc.h.
  // TODO(primiano): replace with an include once base can depend on allocator.
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
similarity index 53%
rename from recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
rename to recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index b999c59..4393103 100644
--- a/recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,18 +1,19 @@
-From 482e77e9562b8a158b5b212e9f1c83c697fed2e2 Mon Sep 17 00:00:00 2001
+From 43384ce7ab1d3b14820cb9bc0698130be9291a8e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
-Subject: [PATCH 07/12] allocator: Do not include glibc_weak_symbols for musl
+Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
+ for musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- base/allocator/allocator_shim.cc | 2 +-
+ chromium/base/allocator/allocator_shim.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/base/allocator/allocator_shim.cc b/base/allocator/allocator_shim.cc
-index 57a398aaa..54c79063a 100644
---- a/base/allocator/allocator_shim.cc
-+++ b/base/allocator/allocator_shim.cc
-@@ -263,7 +263,7 @@ void ShimFree(void* address) {
+diff --git a/chromium/base/allocator/allocator_shim.cc b/chromium/base/allocator/allocator_shim.cc
+index af08ec039f..15070b9a13 100644
+--- a/chromium/base/allocator/allocator_shim.cc
++++ b/chromium/base/allocator/allocator_shim.cc
+@@ -244,7 +244,7 @@ void ShimFree(void* address) {
  // In the case of tcmalloc we also want to plumb into the glibc hooks
  // to avoid that allocations made in glibc itself (e.g., strdup()) get
  // accidentally performed on the glibc heap instead of the tcmalloc one.
@@ -21,6 +22,3 @@ index 57a398aaa..54c79063a 100644
  #include "base/allocator/allocator_shim_override_glibc_weak_symbols.h"
  #endif
  
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
similarity index 59%
rename from recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
rename to recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index 3bd0a9d..04e0012 100644
--- a/recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,17 +1,18 @@
-From 3d12eb821e105111cbd88f5598746bd77c3a9ef0 Mon Sep 17 00:00:00 2001
+From 701bb2640d5e5b03e8e019600a076c93508e1541 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
-Subject: [PATCH 08/12] Use correct member name __si_fields from LinuxSigInfo
+Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
+ LinuxSigInfo
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sandbox/linux/seccomp-bpf/trap.cc | 2 +-
+ chromium/sandbox/linux/seccomp-bpf/trap.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/sandbox/linux/seccomp-bpf/trap.cc b/sandbox/linux/seccomp-bpf/trap.cc
-index 003708d2c..0fef3148f 100644
---- a/sandbox/linux/seccomp-bpf/trap.cc
-+++ b/sandbox/linux/seccomp-bpf/trap.cc
+diff --git a/chromium/sandbox/linux/seccomp-bpf/trap.cc b/chromium/sandbox/linux/seccomp-bpf/trap.cc
+index 003708d2c8..0fef3148f9 100644
+--- a/chromium/sandbox/linux/seccomp-bpf/trap.cc
++++ b/chromium/sandbox/linux/seccomp-bpf/trap.cc
 @@ -168,7 +168,7 @@ void Trap::SigSys(int nr, LinuxSigInfo* info, ucontext_t* ctx) {
    // most versions of glibc don't include this information in siginfo_t. So,
    // we need to explicitly copy it into a arch_sigsys structure.
@@ -21,6 +22,3 @@ index 003708d2c..0fef3148f 100644
  
  #if defined(__mips__)
    // When indirect syscall (syscall(__NR_foo, ...)) is made on Mips, the
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch
similarity index 56%
rename from recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch
rename to recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch
index bfb6ebb..b5a0f84 100644
--- a/recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,18 +1,18 @@
-From 5843df01580b0fb956ee4b7e1a60c0130c8c90f9 Mon Sep 17 00:00:00 2001
+From ad184ecc5e5e67d1f3862e9ed3f767dff9bbc414 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
-Subject: [PATCH 09/12] Match syscalls to match musl
+Subject: [PATCH] chromium: musl: Match syscalls to match musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/lss/linux_syscall_support.h | 16 ++++++++++++++++
+ chromium/third_party/lss/linux_syscall_support.h | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)
 
-diff --git a/third_party/lss/linux_syscall_support.h b/third_party/lss/linux_syscall_support.h
-index 9dbd2391b..a715de177 100644
---- a/third_party/lss/linux_syscall_support.h
-+++ b/third_party/lss/linux_syscall_support.h
-@@ -793,6 +793,14 @@ struct kernel_statfs {
+diff --git a/chromium/third_party/lss/linux_syscall_support.h b/chromium/third_party/lss/linux_syscall_support.h
+index 8a42c1c868..8e878c70f2 100644
+--- a/chromium/third_party/lss/linux_syscall_support.h
++++ b/chromium/third_party/lss/linux_syscall_support.h
+@@ -717,6 +717,14 @@ struct kernel_statfs {
  #endif
  
  
@@ -27,7 +27,7 @@ index 9dbd2391b..a715de177 100644
  #if defined(__x86_64__)
  #ifndef ARCH_SET_GS
  #define ARCH_SET_GS             0x1001
-@@ -1210,6 +1218,14 @@ struct kernel_statfs {
+@@ -1134,6 +1142,14 @@ struct kernel_statfs {
  #ifndef __NR_fallocate
  #define __NR_fallocate          285
  #endif
@@ -42,6 +42,3 @@ index 9dbd2391b..a715de177 100644
  /* End of x86-64 definitions                                                 */
  #elif defined(__mips__)
  #if _MIPS_SIM == _MIPS_SIM_ABI32
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
similarity index 59%
rename from recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
rename to recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 1825ed7..68b8f45 100644
--- a/recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,20 +1,21 @@
-From df3fd62f7f0c51c11e7f715c2523418c31eb6b0f Mon Sep 17 00:00:00 2001
+From c892406f07b4e214397c55de62eccac3d558b134 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
-Subject: [PATCH 10/12] Define res_ninit and res_nclose for non-glibc platforms
+Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
+ platforms
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- net/dns/dns_config_service_posix.cc |  4 ++++
- net/dns/dns_reloader.cc             |  4 ++++
- net/dns/resolv_compat.h             | 29 +++++++++++++++++++++++++++++
+ chromium/net/dns/dns_config_service_posix.cc |  4 ++++
+ chromium/net/dns/dns_reloader.cc             |  4 ++++
+ chromium/net/dns/resolv_compat.h             | 29 ++++++++++++++++++++++++++++
  3 files changed, 37 insertions(+)
- create mode 100644 net/dns/resolv_compat.h
+ create mode 100644 chromium/net/dns/resolv_compat.h
 
-diff --git a/net/dns/dns_config_service_posix.cc b/net/dns/dns_config_service_posix.cc
-index ba8a36913..e9b40d07f 100644
---- a/net/dns/dns_config_service_posix.cc
-+++ b/net/dns/dns_config_service_posix.cc
+diff --git a/chromium/net/dns/dns_config_service_posix.cc b/chromium/net/dns/dns_config_service_posix.cc
+index ba8a369133..e9b40d07fc 100644
+--- a/chromium/net/dns/dns_config_service_posix.cc
++++ b/chromium/net/dns/dns_config_service_posix.cc
 @@ -25,6 +25,10 @@
  #include "net/dns/notify_watcher_mac.h"
  #include "net/dns/serial_worker.h"
@@ -26,10 +27,10 @@ index ba8a36913..e9b40d07f 100644
  #if defined(OS_MACOSX) && !defined(OS_IOS)
  #include "net/dns/dns_config_watcher_mac.h"
  #endif
-diff --git a/net/dns/dns_reloader.cc b/net/dns/dns_reloader.cc
-index 74534e6b1..2780a776e 100644
---- a/net/dns/dns_reloader.cc
-+++ b/net/dns/dns_reloader.cc
+diff --git a/chromium/net/dns/dns_reloader.cc b/chromium/net/dns/dns_reloader.cc
+index 74534e6b1b..2780a776e4 100644
+--- a/chromium/net/dns/dns_reloader.cc
++++ b/chromium/net/dns/dns_reloader.cc
 @@ -9,6 +9,10 @@
  
  #include <resolv.h>
@@ -41,11 +42,11 @@ index 74534e6b1..2780a776e 100644
  #include "base/lazy_instance.h"
  #include "base/logging.h"
  #include "base/macros.h"
-diff --git a/net/dns/resolv_compat.h b/net/dns/resolv_compat.h
+diff --git a/chromium/net/dns/resolv_compat.h b/chromium/net/dns/resolv_compat.h
 new file mode 100644
-index 000000000..4f0e852a1
+index 0000000000..4f0e852a19
 --- /dev/null
-+++ b/net/dns/resolv_compat.h
++++ b/chromium/net/dns/resolv_compat.h
 @@ -0,0 +1,29 @@
 +#if !defined(__GLIBC__)
 +/***************************************************************************
@@ -76,6 +77,3 @@ index 000000000..4f0e852a1
 +	return 0;
 +}
 +#endif
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch b/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
deleted file mode 100644
index abe2eaf..0000000
--- a/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d5014cf9a97cf97a6e9bb7f751c7cee3c24e17fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2017 17:15:34 -0700
-Subject: [PATCH 1/2] include asm-generic/ioctl.h for TCGETS2
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- device/serial/serial_io_handler_posix.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/device/serial/serial_io_handler_posix.cc b/device/serial/serial_io_handler_posix.cc
-index 158c374a0..c08fb4a8e 100644
---- a/device/serial/serial_io_handler_posix.cc
-+++ b/device/serial/serial_io_handler_posix.cc
-@@ -6,6 +6,7 @@
- 
- #include <sys/ioctl.h>
- #include <termios.h>
-+#include <asm-generic/ioctls.h>
- 
- #include "base/posix/eintr_wrapper.h"
- #include "build/build_config.h"
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch
similarity index 53%
rename from recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index a2c2b90..c980189 100644
--- a/recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,20 +1,20 @@
-From 8a6553232988a5bfc8f0c48d4214a3982025fb2c Mon Sep 17 00:00:00 2001
+From be624e7cc1bc18e9e198bba16fcb224a7f9746fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
-Subject: [PATCH 11/12] Do not define __sbrk on musl
+Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
 
 musl libc does not have sbrk. on musl libc will only work when called with 0 as
 argument, so we just let it out for now
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 2 +-
+ chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-index edc8cf2db..a868b50d3 100644
---- a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-+++ b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+diff --git a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+index edc8cf2db7..a868b50d30 100644
+--- a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
++++ b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 @@ -233,7 +233,7 @@ extern "C" void* mremap(void* old_addr, size_t old_size, size_t new_size,
  }
  
@@ -24,6 +24,3 @@ index edc8cf2db..a868b50d3 100644
  // libc's version:
  extern "C" void* __sbrk(ptrdiff_t increment);
  
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch
similarity index 57%
rename from recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch
rename to recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch
index de2ec97..997e312 100644
--- a/recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,19 +1,18 @@
-From 65d516f64c1cca91868cb26aeb93802382704fd5 Mon Sep 17 00:00:00 2001
+From 295fd835b22203807962a3eea08a12b74ae54c2c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
-Subject: [PATCH 1/2] Adjust default pthread stack size
+Subject: [PATCH] chromium: musl: Adjust default pthread stack size
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- base/threading/platform_thread_linux.cc                     | 3 ++-
- chrome/browser/chrome_browser_main_posix.cc                 | 9 +++++++++
- third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp | 4 ++--
- 3 files changed, 13 insertions(+), 3 deletions(-)
+ chromium/base/threading/platform_thread_linux.cc                     | 3 ++-
+ chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
 
-diff --git a/base/threading/platform_thread_linux.cc b/base/threading/platform_thread_linux.cc
-index 95ed32418..666e85ba3 100644
---- a/base/threading/platform_thread_linux.cc
-+++ b/base/threading/platform_thread_linux.cc
+diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
+index 95ed32418f..666e85ba33 100644
+--- a/chromium/base/threading/platform_thread_linux.cc
++++ b/chromium/base/threading/platform_thread_linux.cc
 @@ -96,7 +96,8 @@ void TerminateOnThread() {}
  
  size_t GetDefaultThreadStackSize(const pthread_attr_t& attributes) {
@@ -24,10 +23,10 @@ index 95ed32418..666e85ba3 100644
  #else
    // ThreadSanitizer bloats the stack heavily. Evidence has been that the
    // default stack size isn't enough for some browser tests.
-diff --git a/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-index 3c0a0395b..2af6073e2 100644
---- a/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-+++ b/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
+diff --git a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
+index 3c0a0395b1..2af6073e21 100644
+--- a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
++++ b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
 @@ -73,7 +73,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize()
      // FIXME: On Mac OSX and Linux, this method cannot estimate stack size
      // correctly for the main thread.
@@ -46,6 +45,3 @@ index 3c0a0395b..2af6073e2 100644
      pthread_attr_t attr;
      int error;
  #if OS(FREEBSD)
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
new file mode 100644
index 0000000..2e80de8
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -0,0 +1,22 @@
+From 91d9e3476c6432ae9ea8f8c0a9f6c435be844da0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 17:15:34 -0700
+Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ chromium/device/serial/serial_io_handler_posix.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
+index 158c374a03..c08fb4a8ec 100644
+--- a/chromium/device/serial/serial_io_handler_posix.cc
++++ b/chromium/device/serial/serial_io_handler_posix.cc
+@@ -6,6 +6,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <termios.h>
++#include <asm-generic/ioctls.h>
+ 
+ #include "base/posix/eintr_wrapper.h"
+ #include "build/build_config.h"
diff --git a/recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch b/recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
similarity index 53%
rename from recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
index 1b65420..5e28adb 100644
--- a/recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
@@ -1,17 +1,17 @@
-From 4b5aab95e34e1cbebc7566c1267cddc2560601c8 Mon Sep 17 00:00:00 2001
+From a8163b060b699aa6678c45c970f4fbc806a6c198 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:41:43 -0700
-Subject: [PATCH 2/2] link with libexecinfo on musl
+Subject: [PATCH] chromium: musl: link with libexecinfo on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- base/base.gyp | 1 +
+ chromium/base/base.gyp | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/base/base.gyp b/base/base.gyp
-index 67e051ae4..7f5dfe214 100644
---- a/base/base.gyp
-+++ b/base/base.gyp
+diff --git a/chromium/base/base.gyp b/chromium/base/base.gyp
+index 3c3aded640..347b7e7856 100644
+--- a/chromium/base/base.gyp
++++ b/chromium/base/base.gyp
 @@ -126,6 +126,7 @@
                '-lrt',
                # For 'native_library_linux.cc'
@@ -20,6 +20,3 @@ index 67e051ae4..7f5dfe214 100644
              ],
            },
            'conditions': [
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch b/recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
similarity index 56%
rename from recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
rename to recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 2ef5433..fe141aa 100644
--- a/recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,17 +1,17 @@
-From 1a468dd5239ebdf013d9ffb3a2d181d0434b4c6c Mon Sep 17 00:00:00 2001
+From d05c22bdabe10c0db9b65252e442251efc81a379 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
-Subject: [PATCH 2/2] tcmalloc: Use off64_t insread of __off64_t
+Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 2 +-
+ chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index b53dd46c5..58da4d19d 100644
---- a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-+++ b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+index b53dd46c57..58da4d19d7 100644
+--- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
++++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 @@ -1930,7 +1930,7 @@ typedef unsigned long int ulong;
    #if defined(__x86_64__)
      /* Need to make sure __off64_t isn't truncated to 32-bits under x32.  */
@@ -21,6 +21,3 @@ index b53dd46c5..58da4d19d 100644
        LSS_BODY(6, void*, mmap, LSS_SYSCALL_ARG(s), LSS_SYSCALL_ARG(l),
                                 LSS_SYSCALL_ARG(p), LSS_SYSCALL_ARG(f),
                                 LSS_SYSCALL_ARG(d), (uint64_t)(o));
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 033bdaa..84c4668 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -133,20 +133,20 @@ SRC_URI += " \
     file://0004-chromium-WebKit-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
 "
 SRC_URI_append_libc-musl = "\
-    file://0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch;patchdir=src/3rdparty/chromium \
-    file://0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty/chromium \
-    file://0004-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty/chromium \
-    file://0005-use-off64_t-instead-of-the-internal-__off64_t.patch;patchdir=src/3rdparty/chromium \
-    file://0006-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty/chromium \
-    file://0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch;patchdir=src/3rdparty/chromium \
-    file://0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch;patchdir=src/3rdparty/chromium \
-    file://0009-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty/chromium \
-    file://0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch;patchdir=src/3rdparty/chromium \
-    file://0011-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty/chromium \
-    file://0012-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty/chromium \
-    file://0013-include-asm-generic-ioctl.h-for-TCGETS2.patch;patchdir=src/3rdparty/chromium \
-    file://0014-link-with-libexecinfo-on-musl.patch;patchdir=src/3rdparty/chromium \
-    file://0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch;patchdir=src/3rdparty/chromium \
+    file://0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
+    file://0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
+    file://0007-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
+    file://0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
+    file://0009-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
+    file://0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
+    file://0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
+    file://0012-chromium-musl-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty \
+    file://0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
+    file://0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
+    file://0015-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
+    file://0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
+    file://0017-chromium-musl-link-with-libexecinfo-on-musl.patch;patchdir=src/3rdparty \
+    file://0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
 SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
-- 
2.14.0


