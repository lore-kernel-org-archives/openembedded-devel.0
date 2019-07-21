Return-Path: <anbelski@microsoft.com>
X-Greylist: delayed 375 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Jul 2019 01:40:00 UTC
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0A27D8DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 01:40:00 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 93A4D17A2FE2; Sun, 21 Jul 2019 03:33:45 +0200 (CEST)
Received: from
	anbelski-lsg-linux-yocto-0.jls0im4d1fsuxcyoqe2kuaxlef.yx.internal.cloudapp.net
	(unknown [13.78.141.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 064C917A02CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 03:33:42 +0200 (CEST)
From: Anatol Belski <anbelski@microsoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 01:33:27 +0000
Message-Id: <20190721013327.27634-1-anbelski@microsoft.com>
X-Mailer: git-send-email 2.17.1
Reply-To: anatol.oe@belski.net
Subject: [meta-oe][PATCH] Finer gperftools packaging
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
X-List-Received-Date: Sun, 21 Jul 2019 01:40:00 -0000

This splits gperftools into

- gperftools script
- gperftools profiler and other libs
- libtcmalloc-minimal
- docs and other stuff

Especially the libctmalloc-minimal is what is useful if only an improved
allocator needs to be used. The gperftools package stays otherwise fully
backward compatible, as it depends on any necessary lib packages.
Though, the lib packages can be installed separately, which allows for
more flexibility and for cleaner image contents.

Signed-off-by: Anatol Belski <anbelski@microsoft.com>
---
 .../gperftools/gperftools_2.7.bb              | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index c8b91278d..badf0d203 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -28,3 +28,26 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
+PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-libs ${PN}-libs-dev ${PN}-libs-staticdev libtcmalloc-minimal"
+
+EXTRA_OECONF_append += " --enable-static"
+
+FILES_${PN} = "${bindir}/*"
+FILES_${PN}-doc = "${docdir} ${mandir}"
+FILES_${PN}-libs = "${libdir}/libprofiler*${SOLIBS} ${libdir}/libprofiler*${SOLIBS}\
+		${libdir}/libtcmalloc${SOLIBS} \
+		${libdir}/libtcmalloc_debug${SOLIBS} \
+		${libdir}/libtcmalloc_and_profiler*${SOLIBS}"
+FILES_${PN}-libs-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/lib*.la ${libdir}/pkgconfig"
+FILES_${PN}-libs-staticdev = "${libdir}/*.a"
+FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
+
+RDEPENDS_${PN} = "${PN}-libs (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-libs = "libtcmalloc-minimal (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-libs-dev = "${PN}-libs (= ${EXTENDPKGV}) libtcmalloc-minimal (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-libs-staticdev = "${PN}-libs-dev (= ${EXTENDPKGV})"
+
+SECTION_${$PN}-doc = "doc"
+SECTION_${PN}-libs-dev = "devel"
+SECTION_${PN}-libs-staticdev = "devel"
+
-- 
2.17.1


