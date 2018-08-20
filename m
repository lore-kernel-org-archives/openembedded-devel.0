Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5C54E790A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:32:39 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id f145-v6so2568202ybg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YrGyZ+Zwt+ScZ93gKlH12xvGGjfEmZLigrrNRXSCv1s=;
	b=fwxRRUHoW6tmtbP1X3eture1UPVuFfvCQrADo4Ocg6v4vdjoX1YTpHf2YE5DjpqXTk
	IScXZ/P4QwZqN7vdoZvCmbsaqZY4mkbcvbK+xpLHS7gYigVJENx7fMiYTikI6y6oRGhR
	l/ursin09a/nkSSzG1lMin6fQzaItz2kqwfb/MujLho8r/jC/Fp4ZiXmzi4GI0NeDe5K
	vlUqboON6BTnVRjEhUsCZTylKbUkLT9/0rTLrHK24J/jKaTz5K8L7dfzL93yIk27hBQQ
	zvBa7+MSlh3bJomarNKW3p3KbjF/xo8+a5UDXJXHM3DPOTxq6BJDwntDGMn1xR3Km2cx
	LPFw==
X-Gm-Message-State: AOUpUlFEKjGTM337wumcrx2Wp5s+9/ug31bMCK3dciHMKfOKIV6nDWRo
	7uAooMD16sxn/DWfUww00rsD/z63
X-Google-Smtp-Source: AA+uWPwqfjIU8xj8YGHAchZCszFeOK6avI6Mpn4Ps7xTp5H9W1JshaEq0grhpPm/UAJVhGVsS4NssQ==
X-Received: by 2002:a25:918e:: with SMTP id
	w14-v6mr1322389ybl.233.1534779160185; 
	Mon, 20 Aug 2018 08:32:40 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z193-v6sm1496775ywd.90.2018.08.20.08.32.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:32:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:32:32 +0100
Message-Id: <20180820153234.10990-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153234.10990-1-git@andred.net>
References: <20180820153234.10990-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 3/5] openjdk-8: always apply some patches
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
X-List-Received-Date: Mon, 20 Aug 2018 15:32:39 -0000
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


