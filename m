Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8459B78F31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:16:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r24-v6so7076784wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iyPS+zMMfD+aivGuaShHDc0x0xEjBMTSyOpR4ZY5y+Q=;
	b=XbrB6GSXH26MhLvdXf/i82lE+JlQSEgIHaa6dFdjlxAlmKNh50/G0qX/FdhLoG+Vhi
	il3Vyx/jVv01v3cGy9xnknPrkeNPq8oa7egvodv4YFzq334d2qrcujB6J8tqs7DmYyY/
	L1g96L/+OsFAd8mRzomKBswIWEo2VLVcC26ngp7UG4fuKnmZsdHOVoYP41umI4vcFC5o
	j5SFyro0vfIfiKrA6H/rehBQIlkxkND59dk8H7xUKaZcPNpLSIHNlE6rU7+LXdH0juBr
	Li+3MxLbWRvt/cbXoWeXoLEPEB+b1eNKxpi2xASEtlqEj8E018J1M9f9JM5NqL7xZVmS
	S1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iyPS+zMMfD+aivGuaShHDc0x0xEjBMTSyOpR4ZY5y+Q=;
	b=Io8rvZX9pcMXJSf31Gxj8y8I/XpoQMFW6tK2gyNCDlcvlnghYCjiFbEcxPG00NTIwe
	bHwaYcCdqiDKlQb4Ei+H1yqp6BJHoKq3nKWDGcF8pBIkNSXt0mVVYWK1YlC+MZ08FOiz
	JMGFsPBqNioH0lBakrgmksKw3+ZUcZzV9wjchyQKVHGraNSimD8k441i+OD1HDySLEA7
	R6wGspsF2q1ERzEDzbGsjJwJdA+stjtE3XSY1NMo9fC8SGgL3WRmYEWvjY3zYBbB3dZC
	FCN9OGQY0LLOMFG3xUlDfkXDsGGxknBR5J20stRZIRV15h6SXwGr0Z3tXnxXGmYxRWio
	6i7A==
X-Gm-Message-State: AOUpUlF8OO9KGS7OSYxpohxH0YCTX0nb8WPVB7unChwWlmNMrwzkpXPh
	NxYo8tgnPw/kyy3ki5YSmVRujp/L
X-Google-Smtp-Source: AA+uWPxwIIEzp76V8EiCMCjdx7PUvqbkLGh22+QhPkDMEI6eZlcx7OqP4O3QPwLWoqhBRR2PDu804g==
X-Received: by 2002:a1c:b45:: with SMTP id 66-v6mr7491688wml.45.1534151771038; 
	Mon, 13 Aug 2018 02:16:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l11-v6sm21650965wru.25.2018.08.13.02.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Aug 2018 02:16:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 09:16:13 +0000
Message-Id: <20180813091613.31739-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openocd: prevent fetching git submodules during do_configure
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
X-List-Received-Date: Mon, 13 Aug 2018 09:16:11 -0000

* I've tried just disabling them with:
  --disable-internal-jimtcl --disable-internal-libjaylink
  but that still tries to use missing jim.h:
  | ./src/helper/jim-nvp.h:47:10: fatal error: jim.h: No such file or directory
  |  #include <jim.h>
  |           ^~~~~~~
  | compilation terminated.
  | Makefile:3619: recipe for target 'src/libopenocd_la-openocd.lo' failed
  | make[2]: *** [src/libopenocd_la-openocd.lo] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/openocd/openocd_git.bb   | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 84727bf970..21a86de390 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -4,10 +4,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libusb-compat libftdi"
 RDEPENDS_${PN} = "libusb1"
 
-SRC_URI = "git://repo.or.cz/openocd.git \
-           file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
-          "
-SRCREV = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
+SRC_URI = " \
+    git://repo.or.cz/openocd.git;protocol=http;name=openocd \
+    git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
+    git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
+    git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
+    file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
+"
+
+SRCREV_FORMAT = "openocd"
+SRCREV_openocd = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
+SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
+SRCREV_jimtcl = "a9bf5975fd0f89974d689a2d9ebd0873c8d64787"
+SRCREV_libjaylink = "8645845c1abebd004e991ba9a7f808f4fd0c608b"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
@@ -16,10 +25,10 @@ inherit pkgconfig autotools-brokensep gettext
 
 BBCLASSEXTEND += "nativesdk"
 
-EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html "
+EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html"
 
 do_configure() {
-    ./bootstrap
+    ./bootstrap nosubmodule
     oe_runconf ${EXTRA_OECONF}
 }
 
-- 
2.17.1


