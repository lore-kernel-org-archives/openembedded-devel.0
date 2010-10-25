Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PANvp-00083Y-Nb
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 16:22:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 76EA4314A27B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:21:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TC-FvrMokqO9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:21:00 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 470FF3149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:20:59 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 14:20:59 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 14:20:59 +0000
Message-Id: <1288016459-30546-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pkgconfig.bbclass: don't blindly install every .pc file
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
X-List-Received-Date: Mon, 25 Oct 2010 14:22:25 -0000

* Instead of installing the file, print a log message. Later,
  this function could be removed.
* .pc files must be installed explicitly to avoid causing
  build problems. E.g. libsoup-2.4-gnome.pc must not be
  installed if libsoup-2.4 is built without gnome support,
  because gstreamer would try to link against libsoup-2.4-gnome.
* Fixes for lua5.1 and libid3tag, which install their own .pc
  files from OE, have been submitted.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/pkgconfig.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
index 23ab453..d96b708 100644
--- a/classes/pkgconfig.bbclass
+++ b/classes/pkgconfig.bbclass
@@ -16,6 +16,8 @@ pkgconfig_sysroot_preprocess () {
 	install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
 	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
 		pcname=`basename $pc`
-		cat $pc > ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname
+		if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname ]; then
+			oenote "$pcname was not installed."
+		fi
 	done
 }
-- 
1.7.1



