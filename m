Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 783CC7325A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:27 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666914; Mon, 08 Feb 2016 05:58:27 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWU-000GrO-D6; Mon, 08 Feb 2016 10:58:26 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWU-0003QN-Br; Mon, 08 Feb 2016 10:58:26 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:57:50 +0000
Message-Id: <1454929083-2966-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-oe][PATCH 01/14] pngcheck: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:27 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to "-e
MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index 445e8ad..d523b7a 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.g
 SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee"
 SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_compile() {
     oe_runmake -f Makefile.unx INCS=-I${STAGING_DIR_HOST}${incdir} LIBS=${STAGING_DIR_HOST}${libdir}/libz.a
 }
@@ -19,4 +21,3 @@ do_install() {
     install png-fix-IDAT-windowsize ${D}${bindir}
     install pngsplit ${D}${bindir}
 }
-
-- 
2.1.4


