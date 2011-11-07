Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQRW-0001T1-Bj
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 15:44:58 +0100
Received: by faat2 with SMTP id t2so2533023faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sM8bzzzHnGopqGPT+VgVDeHjHioqbmOaV3NwNT/LyJU=;
	b=ndHhOdVj7I1xbBoHYfstXtpuozHsEvXk1BsfyHEb8LIFyjXWtLsAjWlcyBaLgG2OLE
	8dlbuKee9ht/mJDCNH3/clOBgNaSAfDrNCijf3aeMGGYetAlIVZDH6U5iVJ2xVFEhRHB
	ZT6wMgzqcgq/3CMlNE9D7mPD4BtzJZetgjGLE=
Received: by 10.152.122.34 with SMTP id lp2mr543436lab.20.1320676724875;
	Mon, 07 Nov 2011 06:38:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id pw12sm8653114lab.13.2011.11.07.06.38.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:38:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:38:32 +0100
Message-Id: <1320676714-3099-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
Subject: [PATCH 1/3] libnl: drop 2.0 and git recipes, now there is usable in oe-core
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
X-List-Received-Date: Mon, 07 Nov 2011 14:44:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/libnl/libnl/fix-pc-file.patch  |   11 ---------
 .../libnl/libnl/fix-pktloc-dep-race.patch          |   20 -----------------
 meta-oe/recipes-support/libnl/libnl_2.0.bb         |   23 --------------------
 meta-oe/recipes-support/libnl/libnl_git.bb         |   20 -----------------
 4 files changed, 0 insertions(+), 74 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl/fix-pc-file.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl/fix-pktloc-dep-race.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_2.0.bb
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_git.bb

diff --git a/meta-oe/recipes-support/libnl/libnl/fix-pc-file.patch b/meta-oe/recipes-support/libnl/libnl/fix-pc-file.patch
deleted file mode 100644
index 17666fb..0000000
--- a/meta-oe/recipes-support/libnl/libnl/fix-pc-file.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: libnl-2.0/libnl-2.0.pc.in
-===================================================================
---- libnl-2.0.orig/libnl-2.0.pc.in
-+++ libnl-2.0/libnl-2.0.pc.in
-@@ -6,5 +6,5 @@
- Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl
-+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
- Cflags: -I${includedir}
diff --git a/meta-oe/recipes-support/libnl/libnl/fix-pktloc-dep-race.patch b/meta-oe/recipes-support/libnl/libnl/fix-pktloc-dep-race.patch
deleted file mode 100644
index ee21744..0000000
--- a/meta-oe/recipes-support/libnl/libnl/fix-pktloc-dep-race.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: libnl-2.0/lib/Makefile.am
-===================================================================
---- libnl-2.0.orig/lib/Makefile.am
-+++ libnl-2.0/lib/Makefile.am
-@@ -27,11 +27,15 @@ CLEANFILES = \
- 	route/pktloc_grammar.c route/pktloc_grammar.h \
- 	route/pktloc_syntax.c route/pktloc_syntax.h
- 
-+BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
-+
- # Hack to avoid using ylwrap. It does not function correctly in combination
- # with --header-file=
-+route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
-+route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(YACC) -d $(YFLAGS) -o $@ $^
- 
diff --git a/meta-oe/recipes-support/libnl/libnl_2.0.bb b/meta-oe/recipes-support/libnl/libnl_2.0.bb
deleted file mode 100644
index e646e3d..0000000
--- a/meta-oe/recipes-support/libnl/libnl_2.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require libnl.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "\
-  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
-  file://fix-pc-file.patch \
-  file://fix-pktloc-dep-race.patch \
-"
-
-SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
-
-PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
-FILES_${PN}-route = "${libdir}/libnl-route.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
-FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
diff --git a/meta-oe/recipes-support/libnl/libnl_git.bb b/meta-oe/recipes-support/libnl/libnl_git.bb
deleted file mode 100644
index a4a37a8..0000000
--- a/meta-oe/recipes-support/libnl/libnl_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require libnl.inc
-
-PE = "1"
-PV = "1.9+gitr${SRCPV}"
-PR = "${INC_PR}.0"
-
-DEPENDS = "flex-native bison-native"
-
-S = "${WORKDIR}/git"
-SRCREV = "d378220c96c3c8b6f27dca33e7d8ba03318f9c2d"
-SRC_URI = "\
-  git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
-  file://fix-pc-file.patch \
-"
-
-PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
-FILES_${PN}-route = "${libdir}/libnl-route.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
-FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
-- 
1.7.7.2



