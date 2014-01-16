Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id 13C0D6B2E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:59:40 +0000 (UTC)
Received: from mail148-co1-R.bigfish.com (10.243.78.235) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.22; Thu, 16 Jan 2014 03:59:39 +0000
Received: from mail148-co1 (localhost [127.0.0.1])	by
	mail148-co1-R.bigfish.com (Postfix) with ESMTP id 08828A000B9	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:59:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail148-co1 (localhost.localdomain [127.0.0.1]) by mail148-co1
	(MessageSwitch) id 138984477711297_6028;
	Thu, 16 Jan 2014 03:59:37 +0000 (UTC)
Received: from CO1EHSMHS024.bigfish.com (unknown [10.243.78.235])	by
	mail148-co1.bigfish.com (Postfix) with ESMTP id E838034004C;
	Thu, 16 Jan 2014 03:59:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS024.bigfish.com
	(10.243.66.34) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 16 Jan 2014 03:59:36 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 16 Jan 2014 03:59:35 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0G3xWTR026888;	Wed, 15 Jan 2014 20:59:34 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2014 11:59:30 +0800
Message-ID: <1389844770-9491-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] piglit: remove
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
X-List-Received-Date: Thu, 16 Jan 2014 03:59:40 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *This recipe is now back in OE-Core.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-graphics/piglit/piglit_git.bb | 44 ---------------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta-oe/recipes-graphics/piglit/piglit_git.bb b/meta-oe/recipes-graphics/piglit/piglit_git.bb
deleted file mode 100644
index 7c4f9a0..0000000
--- a/meta-oe/recipes-graphics/piglit/piglit_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "OpenGL driver testing framework"
-LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
-
-SRC_URI = "git://anongit.freedesktop.org/piglit"
-
-# From 2012/12/30.
-SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
-# (when PV goes above 1.0 remove the trailing r)
-PV = "1.0+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "virtual/libx11 waffle virtual/libgl libglu python-mako-native python-numpy-native"
-
-inherit cmake pythonnative
-
-# CMake sets the rpath at build time with the source tree, and will reset it at
-# install time. As we don't install this doesn't happen, so force the rpath to
-# what we need.
-EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
-
-do_install() {
-	install -d ${D}${bindir}
-        install -m 0755 piglit-*.py ${D}${bindir}
-
-        install -d ${D}${libdir}/piglit/
-
-        install -d ${D}${libdir}/piglit/bin
-        install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
-
-        cp -a lib/ ${D}${libdir}/piglit/
-        cp -a framework/ ${D}${libdir}/piglit/
-        cp -a generated_tests/ ${D}${libdir}/piglit/
-        cp -a tests/ ${D}${libdir}/piglit/
-        cp -a templates/ ${D}${libdir}/piglit/
-
-        sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
-        sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
-}
-
-FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
-
-RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
-- 
1.8.3.2



