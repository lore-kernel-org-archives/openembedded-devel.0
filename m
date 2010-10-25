Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMW8-00049v-3X
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:51:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id ACF823149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:50:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id K+t+Gh8MQWJn
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:50:25 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 49ACD314A1B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:50:24 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:50:24 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:50:24 +0000
Message-Id: <1288011024-22560-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libungif-4.1.3: update recipe, fix packaging
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
X-List-Received-Date: Mon, 25 Oct 2010 12:51:13 -0000

* Use lib_package to move static libraries to -static
  and *.la and *.so symlinks to -dev.
* Converted to new style staging.
* Ran oe-stylize.py.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libungif/libungif_4.1.3.bb |   24 ++++++++----------------
 1 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/recipes/libungif/libungif_4.1.3.bb b/recipes/libungif/libungif_4.1.3.bb
index f53008b..f5bc6fb 100644
--- a/recipes/libungif/libungif_4.1.3.bb
+++ b/recipes/libungif/libungif_4.1.3.bb
@@ -1,22 +1,14 @@
-SECTION = "libs"
 DESCRIPTION = "shared library for GIF images"
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
+SECTION = "libs"
 LICENSE = "MIT"
-PR = "r2"
-
-PACKAGES += "${PN}-utils"
-
-FILES_${PN} = "${libdir}"
-FILES_${PN}-utils = "${bindir}"
-
-inherit autotools
+PR = "r3"
 
-do_stage() {
-	oe_libinstall -so -C lib/.libs libungif ${STAGING_LIBDIR}
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
+SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
 
-	install -m 0644 lib/gif_lib.h ${STAGING_INCDIR}/
+inherit autotools lib_package
 
-}
+PACKAGES =+ "${PN}-utils"
 
-SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
-SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
+FILES_${PN}-utils = "${bindir}/*"
-- 
1.7.1



