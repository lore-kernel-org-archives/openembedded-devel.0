Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A7D347EC64
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so4373107wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C9rUoKml5soT0uUEeUj7bpzSzzijXJ7kBECPTRyka4E=;
	b=SenoDeLCZOX68pHmYh2r7asFmPps7O/jxdgDE4rhUEdp4FTuf6Ew1+UZJUY9UeOYDH
	ell1gng6Oplj+z6b4hJBSbVvrf5VUtQ1AOS8MdSr6OLpqEbr7XoFonHMscyaMFqB++c/
	eYkoA1FyTVepLjRrfLt5rNtyq8cYwFIT9BIWVmhBSi9+NPb4/HxmcqqImmretEwc64C0
	4U+WGqgmEKxauCpBnfW9Nprr5x/NbnOQpfz5lnPCHy0AQAmhvpmpL3TIimTU29jLE+/e
	G/9EDf8o950WKszlwV0G9WraaB7mUBVqMOG4tRo3CFDiL2p+nnPNs3YIO3aqtY3Hz23Y
	LvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C9rUoKml5soT0uUEeUj7bpzSzzijXJ7kBECPTRyka4E=;
	b=IiZ2jik4gWOmLQZw8FaNVljabeqHmJpnVVlCiE4bCJkediUOqV7UWQKR+pFfPuivmX
	lRx4YcnsIbNNwoe91tiuPxTjS0D+RCvQG1M4edleS9yuturoxYCl6XV7zrpxiOUUQCBN
	qbRVasb51DD4ppFRvSodq8L4Ur3vjuu6p+8Hre5UnEbplnex0ZPMU/RyNAVOrCKKY+4t
	a0IGlCenx4q6VBSAOmAxESf9uTfGzvpimJYnIS3fgItNylpbLH8RNCKSkkS8m0rXyycM
	FBZft2xQ3tU32gq5zCDHLQLrm6EKAZzwXP5WGF/xUTzip4ZC0v7tBivzCMypcENroipi
	NlpQ==
X-Gm-Message-State: APjAAAVNjQcjESVtpQP0ZjmWsF+2SbE2zUwSw9Uw2wDud5PN9TjDx/4+
	qytAhb68v9YopN7EyjkF0z5KgYL+yj0=
X-Google-Smtp-Source: APXvYqxS1MDLd2q5w60wOUnwUILumvBxhaobh18MCs9gLEJc0pg1RBsYPHh+61I2HLN1NvKhL3Q4hw==
X-Received: by 2002:a05:600c:149:: with SMTP id
	w9mr6609783wmm.132.1578603926079; 
	Thu, 09 Jan 2020 13:05:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:10 +0100
Message-Id: <20200109210518.22451-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/9] poppler: upgrade 0.82.0 -> 0.84.0
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcements:

Release 0.84.0:
core:
 * Fix crash when converting from Unicode to ASCII-7
 * Splash::scaleImageYdXu: Protect against crash if srcWidth is too big
 * JBIG2Stream: fix potential crash in malformed documents
 * JBIG2Stream: fix leak in reset() if called several times
 * Internal code improvements

utils:
 * pdfimages: Add error message if first page is larger then number of pages.
 * pdfinfo: Improved paper size recognition
 * pdfsig: Fix exit code when dumping signatures
 * pdftocairo: Error out when even/odd selects 0 pages
 * pdftohtml: Fix memory leak
 * pdftoppm: Add an option to scale before rotate
 * pdftoppm: Add -hide-annotations option
 * pdftoppm: Error out when even/odd selects 0 pages
 * pdftops: Improve -optimizecolorspace

qt5:
 * Code cleanups

glib:
 * Fix compiler warnings

Release 0.83.0:
core:
 * Improve when a file is recognized as Linearized
 * Improve const-ness of the code
 * Make code a bit more readable/maintanable
 * Fix uninitialized memory uses in broken files

utils:
 * pdffonts: Make code a bit more readable/maintanable
 * pdftohtml: Make code a bit more readable/maintanable

qt5:
 * Remove a bunch of unused internal functions
 * trUtf8 -> tr (less warnings)

build system:
 * make-glib-api-docs: switch to python3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/poppler/basename-include.patch    | 4 ++--
 .../poppler/{poppler_0.82.0.bb => poppler_0.84.0.bb}          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.82.0.bb => poppler_0.84.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler/basename-include.patch b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
index c18a5f5c0..3d6d7a8f1 100644
--- a/meta-oe/recipes-support/poppler/poppler/basename-include.patch
+++ b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
@@ -16,8 +16,8 @@ index 830c1c80..e93eb368 100644
 --- a/goo/gbasename.cc
 +++ b/goo/gbasename.cc
 @@ -46,6 +46,10 @@
- #include <stdlib.h>
- #include <string.h>
+ #include <cstdlib>
+ #include <cstring>
  
 +#if !defined(__GLIBC__)
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
diff --git a/meta-oe/recipes-support/poppler/poppler_0.82.0.bb b/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.82.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.84.0.bb
index 37f859353..0f3e50571 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.82.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "4d6106c2382c5e66072e0b355acc3640"
-SRC_URI[sha256sum] = "234f8e573ea57fb6a008e7c1e56bfae1af5d1adf0e65f47555e1ae103874e4df"
+SRC_URI[md5sum] = "e14a8aca8809908ad4364c32c17bcb92"
+SRC_URI[sha256sum] = "c7a130da743b38a548f7a21fe5940506fb1949f4ebdd3209f0e5b302fa139731"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.21.0


