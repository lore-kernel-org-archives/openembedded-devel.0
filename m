Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id A423478E4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 00:26:50 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id l189-v6so2979054ywb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 17:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cGC0OX2nxmiUuU/dBzEocXVgyEds22RmaGVKrbjfq9Y=;
	b=kZ+wBkOfzY+rdhdhHNx57LdP04xxlHDFi4WX61JYyJ1ZgwGE3mUp55FxcbMsqHtfMU
	MYUidc3q+VMwva6xs/2myAVw4UnP8sk6vvuBz1uSZ+tJByBuhL71tLOTc954wpLb7OyZ
	Y30N9LdzrdONx62f1P8bwnjVd8/30S/VEEfFKBH7eHOTufjAYo60uA+ymIrIGZ9bxbYW
	lungjeVdXWoxllncTnPVKHXqCG7yKkLlTPFRfpew8+bKeThHCmmgx0SOtMJvtxCE+60a
	T+5rCJcNPYws2h05j1bHhSuc36nqIPc3N9EX2L/PnnwpxwRi8lvQke63b09F0D1FoP4X
	HN1g==
X-Gm-Message-State: AOUpUlGpcTsr32UTQm4ZAtzBjrlSqOsCEx8kJ+mj+bJScm4dIZD8XPnN
	arVA6nhLbP88jRE3C8MEhEupJ+Fn
X-Google-Smtp-Source: AA+uWPxUC4lQPZWoTlco6oYZsYqndwqStCQSiln/IzQ41adEiwkVioTg0mHKzX49flebUJkabfy8wg==
X-Received: by 2002:a81:2c0a:: with SMTP id
	s10-v6mr2762823yws.335.1533774411518; 
	Wed, 08 Aug 2018 17:26:51 -0700 (PDT)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	u67-v6sm2132354ywa.56.2018.08.08.17.26.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 17:26:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 01:26:43 +0100
Message-Id: <20180809002644.18549-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180809002644.18549-1-git@andred.net>
References: <20180809002644.18549-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH 3/4] Revert "openjdk-8: fix build for gcc8.x"
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
X-List-Received-Date: Thu, 09 Aug 2018 00:26:50 -0000
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

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../openjdk/openjdk-8-release-16xbyy.inc      |  1 -
 .../hotspot_fix_gcc8x_build.patch             | 21 -------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index fd95e95..c1fcda4 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -16,7 +16,6 @@ PATCHES_URI = "\
     file://0008-jdk-use-correct-include-for-signal.patch \
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
-    file://hotspot_fix_gcc8x_build.patch \
 "
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
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


