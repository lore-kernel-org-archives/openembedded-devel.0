Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13VD-0001lP-CE
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 17CBB3148E41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PXwd6SJ0SDPb; Wed, 29 Sep 2010 22:37:11 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 98C3B3148E18;
	Wed, 29 Sep 2010 22:37:06 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:06 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:26 +0000
Message-Id: <1285792594-10032-11-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/18] libungif-4.1.3: reduce package size, build without X11
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:57 -0000

* Move static libraries to FILES_${PN}-dev.
* Add --without-x to configure flags.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libungif/libungif_4.1.3.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes/libungif/libungif_4.1.3.bb b/recipes/libungif/libungif_4.1.3.bb
index f53008b..9f033cc 100644
--- a/recipes/libungif/libungif_4.1.3.bb
+++ b/recipes/libungif/libungif_4.1.3.bb
@@ -2,20 +2,25 @@ SECTION = "libs"
 DESCRIPTION = "shared library for GIF images"
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 PACKAGES += "${PN}-utils"
 
-FILES_${PN} = "${libdir}"
+FILES_${PN} = "${libdir}/*.so*"
+FILES_${PN}-dev += "\
+	${libdir}/libungif.a \
+	${libdir}/libungif.la \
+"
 FILES_${PN}-utils = "${bindir}"
 
 inherit autotools
 
+EXTRA_OECONF = "--without-x"
+
 do_stage() {
 	oe_libinstall -so -C lib/.libs libungif ${STAGING_LIBDIR}
 
 	install -m 0644 lib/gif_lib.h ${STAGING_INCDIR}/
-
 }
 
 SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
-- 
1.7.1



