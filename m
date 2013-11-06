Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED956D437
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 22:59:51 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 1EE2F2698E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 23:59:53 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2013 00:00:52 +0100
Message-Id: <1383778852-22175-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.4.1
Subject: [meta-oe][PATCH] orc: version 0.4.18 migrated to oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2013 22:59:51 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-devtools/orc/orc.inc       | 25 -------------------------
 meta-oe/recipes-devtools/orc/orc_0.4.18.bb |  6 ------
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/orc/orc.inc
 delete mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.18.bb

diff --git a/meta-oe/recipes-devtools/orc/orc.inc b/meta-oe/recipes-devtools/orc/orc.inc
deleted file mode 100644
index 4a356e4..0000000
--- a/meta-oe/recipes-devtools/orc/orc.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "orc - The Oil Runtime Compiler"
-HOMEPAGE = "http://code.entropywave.com/projects/orc/"
-LICENSE = "orc"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
-
-INC_PR = "r1"
-
-SRC_URI = "http://code.entropywave.com/download/orc/orc-${PV}.tar.gz;name=orc"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
-
-PACKAGES =+ "orc-examples"
-FILES_orc-examples = "${libdir}/orc/*"
-FILES_${PN} = "${bindir}/*"
-
-python populate_packages_prepend () {
-    libdir = d.expand('${libdir}')
-    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
-}
-
-do_compile_prepend_virtclass-native () {
-    sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
-}
diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.18.bb b/meta-oe/recipes-devtools/orc/orc_0.4.18.bb
deleted file mode 100644
index 2375d8c..0000000
--- a/meta-oe/recipes-devtools/orc/orc_0.4.18.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require orc.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[orc.md5sum] = "1a2552e8d127526c48d644fe6437b377"
-SRC_URI[orc.sha256sum] = "34d3c8a7259f42bed4dcfbc106c5e3d0cc8e17eeaa73128d1c5eaf92883a6a24"
-- 
1.8.4.1


