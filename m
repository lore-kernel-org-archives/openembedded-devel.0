Return-Path: <anbelski@microsoft.com>
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9987EF4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:53:43 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 4525317A0316; Mon, 22 Jul 2019 02:53:43 +0200 (CEST)
Received: from
	anbelski-lsg-linux-yocto-0.jls0im4d1fsuxcyoqe2kuaxlef.yx.internal.cloudapp.net
	(unknown [13.78.141.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 57FF117A0316; 
	Mon, 22 Jul 2019 02:53:40 +0200 (CEST)
From: Anatol Belski <anbelski@microsoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 00:53:30 +0000
Message-Id: <20190722005330.69615-1-anbelski@microsoft.com>
X-Mailer: git-send-email 2.17.1
Reply-To: anatol.oe@belski.net
Subject: [meta-oe][PATCH] gperftools: separate off libtcmalloc-minimal
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
X-List-Received-Date: Mon, 22 Jul 2019 00:53:43 -0000

From: Anatol Belski <anatol.oe@belski.net>

From: Anatol Belski <anbelski@microsoft.com>

The libctmalloc-minimal is what is useful for C++ apps if only the
improved allocator is needed. The gperftools package stays otherwise
fully backward compatible as it's going to depend on libtcmalloc-minimal.
The libtcmalloc-minimal can be installed separately, which allows for
more flexibility and for cleaner image contents.

The discussion on the patch
https://patchwork.openembedded.org/patch/163234/ has shown, that a
separate package for other libs might have less sense in this case, so
it's not done. The patch 163234 can be abandoned in favor of this for
now.

Signed-off-by: Anatol Belski <anbelski@microsoft.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index c8b91278d..c48a98183 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -28,3 +28,11 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
+# Ensure static libs are always enabled, as they seem to be not produced by
+# default at least on ARM.
+EXTRA_OECONF_append += " --enable-static"
+
+PACKAGE_BEFORE_PN += "libtcmalloc-minimal"
+FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
+RDEPENDS_${PN} += "libtcmalloc-minimal (= ${EXTENDPKGV})"
+
-- 
2.17.1


