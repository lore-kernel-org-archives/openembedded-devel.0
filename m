Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37951.1795594116650038597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kGXjAXra;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38644aedba1so8367541eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594116; x=1796198916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvLjU+N6iJnse8EnSpwuhVu6n5+DbxC2jMRhJl1k8qE=;
        b=kGXjAXraylZ+ex/rew9vQm1FeJka+vOuNEfR3SARp4yQSMjjijiBwxR5uIx8p0AWtQ
         Z7UBis3KgE0+LYNCkBdlWR3F80nHCt5Jj3Jy3NEokF4kLrqZRAkyEMJvkm/8urhnoEYE
         O76a14uFdd+8FcRDUNTl0UCIKFdwrkRTqrl3RtUjEjSPTvx4PYMFpePwaGHdx64bjxAB
         72Fm5rTbhlXAq7bCj/8YR9gpgbsJ8g2ZxsnZtgtKmJ/gWDG2yyskDLOaVA297/TNPhTB
         h7dH/Wf+Qoeebqa69yVUTV96ivNsUZGwQrz6QGo3d6sAHUUX9I2SWihF+IuEXZ4UwQOG
         3mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594116; x=1796198916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvLjU+N6iJnse8EnSpwuhVu6n5+DbxC2jMRhJl1k8qE=;
        b=dygjVSEDNquFV1+wSmELOUDvHm7IyWGCmn13lxlDax9LpbM7l4meYRJ9Co3ZKZ9Q/A
         N3uIIJCkx2BJszz7021O+3KOtKWeDk8i24SxQzQfnjwRUtcMcX+otEsAIKihPgP1FNjd
         MaXiFM+CdxQ6WZ51NZfk0xVq9ms/w2XVtZOBGNjfrJckUemZCjMrAlUNgIuc9R9O9mgs
         73F28vJuw1bAXfHSKWtAP15jHn1FJEIU3fR+cEGl87PqS6Ik0C/mF310XXHU0lSOk3La
         6RZbLH+MvavoVqajICd50lYdpK4UnSeqVikvfDJgnBtqekSUqufF4DuohAm0krkLLrCQ
         eNLw==
X-Gm-Message-State: APuU4Z+iacfc6lx7E3OByHzQ/r7jsNUguCDsqCQfkL8Mt1AEAW41ZvTS
	MHlEw95ElU0UuX2D9IVn8PCl0qcREzTWB7uUSva5GLqgUUpk39pFQ3KR1Su+5t/h
X-Gm-Gg: AZFdTZc+RWHsYWZ94LXgNInuqL/XSjPiJ3ocGCvYvy7uQHB+9EHNTMZBydswFaqXvRr
	/VhmnSZBOkZiUqD3MQMmAi9/HY5TsxZfxdy0BlkzKeo/9+9AbaZGZrryv5PdAeREEkFaIVgA2xN
	9W2jJnWxbNR9iWRwnD1knM5KhRidEGnCwxzIU2F1+S+kZcQXjhxdI+h2q0IJWA9b2lswgflzJNE
	iyVDxqNWaHWt3tvFmrI+GFGk/rnd41a2BmUNulr6Caea6FEbymVc9i61o1X5VSyedHNqixR7nUx
	Jdud+riEISG/O+0eqQ3IihW6WYMRLGRjMKAuQkL98N80++0RCCH0TlKmhDjVLJyNz++EDoM6Iaj
	Bs/yjKivZZT9m9U5hysu5PufMjYPEGQy8smP4xM53kogO4JVpHCfQn17dzKd0B7QAYLHPcy0QOl
	POJH7V8RrQK9SFTAIVN98jPYX+nkbcLwIjWggvpN1R6o2dEidiqYBXqq0wCF4idG6JBxtkA9zLf
	kbnljUeWmgnr9xJ8bB/wgPx/sw3CGpvognN+RKkGg20Jj8BoP46U3FVIjtOgT1RoS741cxL/T+2
	nHr6YSAkatg5/hMaVaasfHraL24ShMqyB369zD/U/iwd4IMQ/jHTodjFU9WZypivZlrR5DbKK2X
	lggjrDkztDHpbXfjTdw8N9Mm00N+0GWUhUJSr6xgD2Q7i/j5zTWSiSqCazFKVWJgDpNFUS8K/2G
	C674+oOjOLCm/YS+cqkY/lfmBGv/4w7+c2rJepTSi+9GT8/6z8jxjhjXPbQAlgw3qmpPCsAJx6O
	gElqY3oW+41IO6YoXGrnY3E32bTdBjj1OzhDimyrxN5zQOzmMYtyKsp+AsP5Lf4fP1n/NvKl5zR
	vYML
X-Received: by 2002:a05:7300:d941:b0:385:4b9:18e9 with SMTP id 5a478bee46e88-3856f94f874mr18435671eec.18.1795594115919;
        Wed, 25 Nov 2026 00:08:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 43/55] xdelta3: upgrade 3.1.0 -> 3.2.2
Date: Wed, 25 Nov 2026 00:06:59 -0800
Message-ID: <20261125080732.2419614-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133046
Content-Type: text/plain; charset="utf-8"

Upstream revived the project in 2026 (NEWS, git log):
- Autotools build replaced by CMake; the core library, xdelta3.h,
  xdelta3.pc and a CMake package config are now installed.
- New armor mode: whole-file BLAKE3 verification carried in the VCDIFF
  application header.
- stdin can be used as the source, and help is shown when run without
  arguments on a terminal.
- Hardened allocation sizing against integer overflow and allocation
  failures, rejection of invalid armor streams, and a full XZ magic
  check before external decompression.

Switch to inherit cmake and follow upstream from the release3_1_apl
branch to main, fetching by tag, with an upstream check limited to the
v3 tags (the repository also carries xdelta1 v1.x tags). Upstream's
CMake fetches BLAKE3 1.8.5 with FetchContent for armor mode, which does
not work in an offline do_configure, so fetch it in SRC_URI and point
FETCHCONTENT_SOURCE_DIR_BLAKE3 at it; it is linked statically into the
xdelta3 tool. Turn off the regression-test targets. The lzma option
becomes -DXD3_LZMA_MODE=on/off so liblzma is never auto-detected. The
new static library and its headers, pkg-config and CMake files go to
the default -staticdev and -dev packages.

Unpack BLAKE3 inside ${S} so the debug prefix map covers its __FILE__
strings (buildpaths QA).

License-Update: relicensed by the author from GPL-2.0-only (COPYING) to
Apache-2.0 (xdelta3/LICENSE); add the BLAKE3 license files
(CC0-1.0 OR Apache-2.0 OR Apache-2.0-with-LLVM-exception).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/xdelta/xdelta3_3.1.0.bb   | 20 -----------
 .../recipes-support/xdelta/xdelta3_3.2.2.bb   | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
 create mode 100644 meta-oe/recipes-support/xdelta/xdelta3_3.2.2.bb

diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
deleted file mode 100644
index 93692af682..0000000000
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Xdelta is a tool for differential compression"
-DESCRIPTION = "Open-source binary diff, differential compression tools, \
-               VCDIFF (RFC 3284) delta compression."
-HOMEPAGE = "http://xdelta.org/"
-SECTION = "console/utils"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = "git://github.com/jmacd/xdelta.git;branch=release3_1_apl;protocol=https"
-SRCREV = "4b4aed71a959fe11852e45242bb6524be85d3709"
-S = "${UNPACKDIR}/${BP}/xdelta3"
-
-inherit autotools
-
-# Optional secondary compression
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.2.2.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.2.2.bb
new file mode 100644
index 0000000000..71dc076f7f
--- /dev/null
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.2.2.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Xdelta is a tool for differential compression"
+DESCRIPTION = "Open-source binary diff, differential compression tools, \
+               VCDIFF (RFC 3284) delta compression."
+HOMEPAGE = "http://xdelta.org/"
+SECTION = "console/utils"
+
+LICENSE = "Apache-2.0 AND (CC0-1.0 OR Apache-2.0 OR Apache-2.0-with-LLVM-exception)"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf96fa0d649f7c7b16616d95e7880a73 \
+                    file://blake3/LICENSE_A2;md5=36f2d65d5af763138c43f12eab1ded63 \
+                    file://blake3/LICENSE_A2LLVM;md5=9f15032a73646326104ebe0c70580f1a \
+                    file://blake3/LICENSE_CC0;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+# BLAKE3 is needed for armor mode, upstream's CMake would fetch it during configure
+SRC_URI = "git://github.com/jmacd/xdelta.git;branch=main;protocol=https;tag=v${PV};name=xdelta \
+           git://github.com/BLAKE3-team/BLAKE3.git;branch=master;protocol=https;tag=1.8.5;name=blake3;destsuffix=${BP}/xdelta3/blake3 \
+           "
+SRCREV_xdelta = "5f8f5a553181c139d91b0289c009e5c276c5318c"
+SRCREV_blake3 = "93a431c78a52d7ccf0f366f106467f5070e6075e"
+SRCREV_FORMAT = "xdelta_blake3"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>3(\.\d+)+)$"
+
+S = "${UNPACKDIR}/${BP}/xdelta3"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DXD3_BUILD_TESTS=OFF \
+                 -DXD3_ARMOR=ON \
+                 -DFETCHCONTENT_SOURCE_DIR_BLAKE3=${S}/blake3 \
+"
+
+# Optional secondary compression
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "-DXD3_LZMA_MODE=on,-DXD3_LZMA_MODE=off,xz"
+
+BBCLASSEXTEND = "native nativesdk"
