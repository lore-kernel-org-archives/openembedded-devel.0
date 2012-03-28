Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCi2o-0004ox-Ul
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 03:51:27 +0200
Received: by pbcum15 with SMTP id um15so956661pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 18:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=krFTjsMAR8HKRZEp9AsTYtHlRKmOown4Q4ye++z3hKA=;
	b=LagKD9wVwRmpxzZn/ySiUbSYjaqidGkZRQORiO5es/kWbrJm9frkBy9cAA8TK81HgK
	UFew7HQAoqHhGPLmq4e+/qBvOvvBipWVLorvI2PQ7jul6tdy+5XRUIb3GU4Qt3NTFGjs
	OSxvSwZHxyP8eNodJPcg+vkhREAl0ivHnTmcIiomVyXbn5sBoX5KiMzMc/Vp/cnHrtoS
	LvywUagVwm8owWofcEd0l4UscbItiIt+YutOBuR+Yaff+6anCX4555RJ7dUaqyzswKTf
	nTcaZZlBe5TqHuh+Prf/PHdJcYkUTuY8jG0d7SI/qANyZGQM7WqhIM8cyLigm2VmTbsV
	DOAg==
Received: by 10.68.136.137 with SMTP id qa9mr6263716pbb.12.1332898944640;
	Tue, 27 Mar 2012 18:42:24 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f5sm1532418pbe.26.2012.03.27.18.42.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 18:42:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 18:42:06 -0700
Message-Id: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [toolchain-layer][PATCH 1/2] eglibc-2.12: Move to toolchain-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 01:51:27 -0000

Its relevant in toolchain layer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.12.bb          |    0
 .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    0
 .../eglibc-2.12/armv4-eabi-compile-fix.patch       |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf |    0
 .../eglibc/eglibc-2.12/generate-supported.mk       |    0
 .../eglibc/eglibc-2.12/ld-search-order.patch       |    0
 .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    0
 .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |    0
 .../eglibc-2.12/shorten-build-commands.patch       |    0
 .../recipes-core/eglibc/eglibc-initial_2.12.bb     |    0
 .../recipes-core/eglibc/eglibc-locale_2.12.bb      |    0
 .../recipes-core/eglibc/eglibc_2.12.bb             |    0
 13 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/cross-localedef-native_2.12.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/generate-supported.mk (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-initial_2.12.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-locale_2.12.bb (100%)
 rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc_2.12.bb (100%)

diff --git a/meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb b/toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb
similarity index 100%
rename from meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb
rename to toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
diff --git a/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb
rename to toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb
diff --git a/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb
rename to toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb
diff --git a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb
similarity index 100%
rename from meta-oe/recipes-core/eglibc/eglibc_2.12.bb
rename to toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb
-- 
1.7.9.1



