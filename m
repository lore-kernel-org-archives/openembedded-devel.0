Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 42D5978DD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:49 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id j68-v6so13154759ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JzrJIjqeDHXISLa1YkZKa62Rb18MZ6jumP/9RadtjAc=;
	b=A8iWprAi1SOTQ7g/aOsia2y3cKdCAoyXN8tiNUMTX539UziUsTuQe55Gw6kBC2p8Go
	BMn6o8wj01We4sbCvNReyDZgfJpO38CjpRbbjGsFl6DLC/hhYGb3Tj593sN/WWkXbEFo
	sFe5CDQcEIMyaUU4Lc7tGLxzB8WjjAvnlvpafnNgCbodOQT4W/x7lKrAXy3AL58Tx7sc
	VeBMK06L6Efbae8oR9bX8SNQrK2y4nqDLQp/0zYjuRbzhxPEm5hO+zoNMRMw4A2RL36V
	njXlq+1TL+kEyefclYq1P43RqN07dfygG3ZgGuROams9a8JWLjmN0BJqtudiQjhwBjFM
	Oh9A==
X-Gm-Message-State: AOUpUlHNTRcdEjUk4fJiDeIsgk/HLrorL7tv8lO/DHGO+sCljXnDkFul
	pkRaPTUNYzA2djC2HvvFmeLpU9iA
X-Google-Smtp-Source: AA+uWPykVvgthT35Pxw8vlLldXE2fCdYyMbuEOVlBXYHQv7DICva6Z4K+w3UNhDfJCmXP+helPULQQ==
X-Received: by 2002:a25:8ca:: with SMTP id 193-v6mr8782107ybi.72.1534154990139;
	Mon, 13 Aug 2018 03:09:50 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:49 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:34 +0100
Message-Id: <20180813100936.23663-8-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 7/9] Revert "openjdk-8: fix build for gcc8.x"
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This reverts commit 52fb41cec7d5125bb11c718705158696ffef11f8.

The change being reverted has two problems:
- it still doesn't produce working binaries
- compilation on pre-gcc v7 compilers fails (which is
  relevant for compiling openjdk-8-native, as that
  uses the build machine's gcc, not yocto's gcc):
  | At global scope:
  | cc1plus: error: unrecognized command line option ‘-Wno-stringop-overflow’ [-Werror]
  | cc1plus: all warnings being treated as errors

We now use a different approach to address the issues
than that patch, and it is thusly not needed anymore.

We fully support gcc < 7 again.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../openjdk/openjdk-8-release-16xbyy.inc      |  1 -
 .../hotspot_fix_gcc8x_build.patch             | 21 -------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index bd440c6..8b30c37 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -16,7 +16,6 @@ PATCHES_URI = "\
     file://0008-jdk-use-correct-include-for-signal.patch \
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
-    file://hotspot_fix_gcc8x_build.patch \
     file://0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
 "
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch b/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch
deleted file mode 100644
index 1a406f2..0000000
--- a/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Richard Leitner <richard.leitner@skidata.com>
-Date: Thu, 14 Jun 2018 23:42:11 +0200
-Subject: [PATCH] openjdk-8: hotspot: fix gcc8 compilation
-
-As oe-core/yocto-project master migrated to gcc8.x we need to support this.
-Therefore disable following gcc warnings/errors which caused the build to fail:
-  + stringop-overflow
-  + return-type
----
-
---- a/hotspot/make/linux/makefiles/gcc.make
-+++ b/hotspot/make/linux/makefiles/gcc.make
-@@ -197,7 +197,7 @@
- endif
- 
- # Compiler warnings are treated as errors
--WARNINGS_ARE_ERRORS = -Werror
-+WARNINGS_ARE_ERRORS = -Werror -Wno-stringop-overflow -Wno-error=return-type
- 
- ifeq ($(USE_CLANG), true)
-   # However we need to clean the code up before we can unrestrictedly enable this option with Clang
-- 
2.18.0


