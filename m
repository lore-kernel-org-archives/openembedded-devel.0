Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7076A790B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:30:34 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id d4-v6so803914ybl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YrGyZ+Zwt+ScZ93gKlH12xvGGjfEmZLigrrNRXSCv1s=;
	b=loDTsKK7MdbMuy+qfk1atwz6EKCrPiXsvZcMTyQ+yaCFtIkAfJNDtg5+kQtJ/xSiqA
	LqlB2bk3GYQvkWtvF7T3CgQVlJH0CpVEzKLZbKfUoSTN15Kgzr720Sdd6J5bGBmkwmz7
	afcazv4GYFTEeSURgv493wziR7wvMRhyVUkqH387Murt4FJJA/KvsydFMbC8V+uVW6hh
	yLhHlx6B5Z3Vjgws8NJsMPywcAYDR3s/MQqvVWfRAHbPCTHY+OBVL3CViUCr3TuA5X5E
	tRiXiKAs/s1aoXvSJhx8EnXS9SCoodkhapt5nga+pM0MuEZyxlKJU2/GZMFVuOuY/jTD
	1ykg==
X-Gm-Message-State: AOUpUlGSM/g+uGxnCGoVW0n9mg3JWxhwlIj0z+AowEY9gkQCOHMhUYkA
	t1HENxgHfRMHZ2z/6MdJSuIaeX+W
X-Google-Smtp-Source: AA+uWPxsXa6eFJcpHoivi+gWAeyqxix8Fu3jF1HRfulPGapYJGEnefhGdRpZ9xsJwtDCVQukr5kDxw==
X-Received: by 2002:a25:220a:: with SMTP id
	i10-v6mr12166134ybi.489.1534779035342; 
	Mon, 20 Aug 2018 08:30:35 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	126-v6sm5213507ywl.48.2018.08.20.08.30.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:30:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:30:28 +0100
Message-Id: <20180820153030.10211-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153030.10211-1-git@andred.net>
References: <20180820153030.10211-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 3/5] openjdk-8: always apply some patches
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
X-List-Received-Date: Mon, 20 Aug 2018 15:30:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

As a simplification for the upcoming aarch32 port.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-native.inc                | 2 --
 recipes-core/openjdk/openjdk-8-release-172b11-common.inc | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index e6f7933..6a01046 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -7,8 +7,6 @@ DEPENDS = "\
     ca-certificates-native openssl-native coreutils-native \
 "
 
-SRC_URI_append += "file://handle_extra_output.patch"
-
 PACKAGECONFIG ??= "gif jpeg png zlib"
 PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index 4bcecef..8e94a4f 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -18,6 +18,8 @@ PATCHES_URI = "\
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
     file://0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
     ${HOTSPOT_UB_PATCH} \
+    ${LIBPNG_NEON_PATCH} \
+    file://handle_extra_output.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
@@ -43,7 +45,6 @@ PATCHES_URI_append_class-target = "\
     file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;striplevel=0 \
     file://openjdk8-fix-adlc-flags.patch;striplevel=0 \
     file://openjdk8-add-missing-linker-flags.patch;striplevel=0 \
-    ${LIBPNG_NEON_PATCH} \
 "
 PATCHES_URI_append_libc-musl = "\
     file://musl-0001-hotspot-stop-using-obsolete-isnanf.patch \
-- 
2.18.0


