Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DDA10FCAC9
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 20:30:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1269.1775075411294344478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 13:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pjWNxgg0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb439299so1170265e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775075410; x=1775680210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ybtBTKnq/KE6eUTkvuvIASYrD791yLR97PNpdEyST0w=;
        b=pjWNxgg0iEX7pmH0Md4t1SjrQhZhi1ObWa1nCd4sVoGBCDgZAuqwXrWUgqDlyQ5Wo3
         PdGdRJ0mSKbdhBYonCrv4N3iHQC1b+c+iKJtv63J/dsLFCBzv2UzGVVBQ3Y2qOkS2L21
         jsNNaHvvO13ZCHqSBKVVAWT9VmL/C5MkT1C0xE1rPBwRhOEMsJzyTAPCuck2FTkmIQQ0
         z1rQMz+ETxvv/8XqZNpE2zQes7vGr5jqRtXHshCN0//p3DxmGJTNZ6r4UwGvsJYJw3Yq
         lshA7gVjXspb/KyAry1hrJJ7PZM2C7n0XQuuPXFqnWIhhC2ScEnRujkM4qcCiz6Y8IGH
         F3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775075410; x=1775680210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybtBTKnq/KE6eUTkvuvIASYrD791yLR97PNpdEyST0w=;
        b=WPukftXNC4nO/crffd56CAS+WJ3HQnIYGubXQs1+wXAJgVdL4NGICZun5g1rUJ3kS6
         nJxrXDMjAX8asnH9wHDmxIDC0Lt2WILCoFl+tsvnk50sxDYh24bl0cL6LbM4RFDLOmf3
         bxmjUHxnQLd0EtfqGLnIFdxNKuGVhaQBXeqB36kPwMuPIJI+WA4dV4xC/y+Wo19H7Ws4
         pqzTEK0bRG2/g8lUQAxOLzEDoFOJrRcvX8mWKSuNflponPJ51c3GTiz659ndknZntCxd
         UtOKA/G6++Afb0EpvtnfcMCXtEz+uUjebgxFuYtM60nP6L6uA4u72tYaNDFTOLnXX8wg
         P45A==
X-Gm-Message-State: AOJu0Yy0tpsRk+HUNrIBhTfiFz9bKbWSRIG12rV8ZqjWqV1HVaSO6SBm
	FMFaVfoH9Yx2Uo92G7TS+4qlEEX17y5GvGAAkHBrO3BYsr6zuqW4Yyazc04lsA==
X-Gm-Gg: ATEYQzwE+V8poE1pIJ+Dhaamhh66umsqDjcF621OU7n5JIe62Uk8oRYQrP3EQPZR1WL
	Zp9zjbvAVIPsxngGTzLHOzdVxXSIyZuVnKtVZgKtE5TNqa0dhThMkk0o1nx5dKWVEpa3+VDv/kd
	mfF+WGdnJjYZKuJihgueukY25MQzQe83LUY3426+bYabECZkklyGyLl7N6wAb22vdI4RGHpINNJ
	ZroC3NLHv63BbAgfgijKZLL7SxYEAKBdRcHMiWiVgpy2Sia3cLpc9VI7UgIwo9QTict5xKxtnWM
	daybCw0KrV6nmSiiBmRxvXhgwykgoSDHR8mcIjBGgAavjsh8ZFV2z1JZagq3kVnRb4h4zo1I4fU
	K9ZUaoYn2o0HatWuPbz5WouCSCns/t/m+5NGNOLejbimK8H3eEdpC0FBJAH3/U1C85WSyJz7bZ6
	FOOmfIqgoo3PJ47mytZemP
X-Received: by 2002:a05:600c:34c1:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-4888359dc6bmr78291115e9.22.1775075409258;
        Wed, 01 Apr 2026 13:30:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c883b96sm48392525e9.17.2026.04.01.13.30.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 13:30:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] giflib: upgrade 5.2.2 -> 6.1.2
Date: Wed,  1 Apr 2026 22:30:06 +0200
Message-ID: <20260401203006.2332643-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 20:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125912

Drop patch that was merged upstream.

License update: a copyright line was removed. The license is still MIT.

Changes:
Version 6.1.2
=============

Code Fixes
----------
* Fix for low-severity CVE-2026-23868 affecting gifponge, giftool, and gifbuild,
  but not the core library - library clients need not be alarned.

Version 6.1.1
=============

This release bumps the major version, but only one entry point -
EGifSpew() - has changed signature and behavior (in order to be able
to pass out a detailed error code). The internal error
codes in the E_GIF_ERR series have changed value so none of them
collides with GIF_ERROR.

This code has been systematically audited and hardened wuth
ChatGPT-5.2. The only library fixes reported by users or found by
robot were for some memory leaks that could only triggered by severely
malformed GIFs. Other bugs are edge-case failures in the CLI tools.

The gif2rbg CLI tool has been moved to the "obsolete" bin, because its
only deployment case in 2026 is as a piñata at fuzzer parties.

Warning: the CLI tools in the obsolete category will soon be removed
from the distribution entirely. The maintainer is tired of fielding
junk bugs filed against them by would-be coup-counters who found yet
another edge case, and the rest of the world doesn't need noisy CVEs
that aren't actually DoS or security issues for giflib clients.

Code Fixes
----------

* Fix for CVE-2021-40633.
* Fix SF bug #165 EGifSpew leaks GifFileOut->SColorMap
* Fix SF bug #171 ImageMagick required to build giflib on non-Darwin Platforms
* Fix SF bug #172 Incorrect object files in shared libutil on darwin
* Fix SF bug #173 installation of manual pages and html documentation
* Fix SF bug #175 Memory leaks in gifecho.c's main() and in gifalloc.c's GifMakeMapObject
* Fix SF bug #177 wrong pointer used in giftool getbool
* Fix SF bug #179 Path Traversal vulnerability
* Fix SF bug #180: -Wformat-truncation likely pointing out an actual bug
* Fix SF bug #182 out‐of‐bounds writes in Icon2Gif
* Fix SF bug #184 uninitialized buffer in DumpScreen2RGB
* Fix SF bug #185 integer overflow in gifbg.c
* Fix SF bug #186 integer overflow in Icon2Gif
* Fix SF bug #187: CVE-2025-31344
* Fix SF bug #170 Tests failing on Ubuntu Noble, giftext buffer overflow
* Fix SF bug #165 EGifSpew leaks GifFileOut->SColorMap
* Fix SF bug #162 detected memory leaks in GifMakeSavedImage giflib/gifalloc.c
* Fix SF bug #161 detected memory leaks in EGifOpenFileHandle giflib/egif_lib.c
* Fix SF bug #142 ABI break public symbol GifQuantizeBuffer

Other bugs that duplicate these have breen addressesed by these fixes

* SF bug #156 EGifSpew leaks SavedImages (and more); won't fix, caller
  might want to write a GIF, modify the in-memory data, then write
  again.

Tests
-----

Test suite now emits TAP (Test Anything Protocol).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...Makefile-fix-typo-in-soname-argument.patch | 34 -------------------
 .../{giflib_5.2.2.bb => giflib_6.1.2.bb}      |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.2.2.bb => giflib_6.1.2.bb} (77%)

diff --git a/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch b/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
deleted file mode 100644
index dc87ed60b9..0000000000
--- a/meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7f0cd4b6b56183b0afbefd01425e5ebd2b8733b4 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 8 Jul 2024 13:18:11 +0200
-Subject: [PATCH] Makefile: fix typo in soname argument
-
-* introduced in:
-  https://sourceforge.net/p/giflib/code/ci/b65c7ac2905c0842e7977a7b51d83af4486ca7b8/
-  there is no LIBUTILMAJOR variable only LIBUTILSOMAJOR leading to:
-
-  ld: fatal error: -soname: must take a non-empty argument
-  collect2: error: ld returned 1 exit status
-
-  with some linkers like GOLD
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
-Upstream-Status: Submitted [https://sourceforge.net/p/giflib/code/merge-requests/17/]
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 87966a9..41b149e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -109,7 +109,7 @@ $(LIBUTILSO): $(UOBJECTS) $(UHEADERS)
- ifeq ($(UNAME), Darwin)
- 	$(CC) $(CFLAGS) -dynamiclib -current_version $(LIBVER) $(OBJECTS) -o $(LIBUTILSO)
- else
--	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,$(LIBUTILMAJOR) -o $(LIBUTILSO) $(UOBJECTS)
-+	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname -Wl,$(LIBUTILSOMAJOR) -o $(LIBUTILSO) $(UOBJECTS)
- endif
- 
- libutil.a: $(UOBJECTS) $(UHEADERS)
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
similarity index 77%
rename from meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
rename to meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
index aa47f93095..77f8905358 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b427970b2f3a9142a4e432c78c4680f4"
 
 CVE_PRODUCT = "giflib_project:giflib"
 
@@ -9,11 +9,10 @@ DEPENDS = "xmlto-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
-           file://0001-Makefile-fix-typo-in-soname-argument.patch \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"
+SRC_URI[sha256sum] = "2421abb54f5906b14965d28a278fb49e1ec9fe5ebbc56244dd012383a973d5c0"
 
 do_install() {
     # using autotools's default will end up in /usr/local

