Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8ZzB-00005e-H7
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 16:50:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BD18F3149E32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:49:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KzaLG+S1Sid8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:49:00 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 9C1933149C9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:48:59 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 20 Oct 2010 14:48:59 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 14:48:59 +0000
Message-Id: <1287586139-12885-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsigc++-1.2.5: convert to new style staging
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
X-List-Received-Date: Wed, 20 Oct 2010 14:51:10 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb |   17 +----------------
 1 files changed, 1 insertions(+), 16 deletions(-)

diff --git a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
index 6b347e5..7b7ecff 100644
--- a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
+++ b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A library for loose coupling of C++ method calls"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r2"
+PR = "r3"
 LICENSE = "GPL LGPL"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsigc/libsigc++-${PV}.tar.gz \
 	   file://autofoo.patch \
@@ -13,20 +13,5 @@ inherit autotools pkgconfig
 
 FILES_${PN}-dev += "${libdir}/sigc++-*/"
 
-acpaths = ""
-
-do_stage() {
-	install -d ${STAGING_LIBDIR}/sigc++-1.2/include
-	install -m 0644 sigc++/config/sigcconfig.h ${STAGING_LIBDIR}/sigc++-1.2/include/
-	oe_libinstall -so -C sigc++ libsigc-1.2 ${STAGING_LIBDIR}
-
-	install -d ${STAGING_INCDIR}/sigc++-1.2/sigc++
-	for f in sigc++/*.h
-	do
-		install -m 0644 $f ${STAGING_INCDIR}/sigc++-1.2/sigc++/
-	done
-}
-
-
 SRC_URI[md5sum] = "d0d1ffcae0eced97ef4f17ce0ba81352"
 SRC_URI[sha256sum] = "dcd6d3ea9a2c185b5286f80eefe9ac1402036b8fa21cfc742442d99579bd2b3e"
-- 
1.7.1



