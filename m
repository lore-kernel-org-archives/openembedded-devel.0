Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PANwA-00084y-Oy
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 16:22:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BC8BA3149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:21:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hGOeaBkEiIqR
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:21:22 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id BE2F9314A290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:21:16 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 14:21:16 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 14:21:16 +0000
Message-Id: <1288016476-30704-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsigc++-1.2.5: exclude autoheader
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

* Running autoheader regenerates sigcconfig.h and adds #define PACKAGE_*,
  which conflicts with programs using libsigc++.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
index 7b7ecff..93c231d 100644
--- a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
+++ b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A library for loose coupling of C++ method calls"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r3"
+PR = "r4"
 LICENSE = "GPL LGPL"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsigc/libsigc++-${PV}.tar.gz \
 	   file://autofoo.patch \
@@ -11,6 +11,8 @@ S = "${WORKDIR}/libsigc++-${PV}"
 
 inherit autotools pkgconfig
 
+EXTRA_AUTORECONF = "--exclude=autoheader"
+
 FILES_${PN}-dev += "${libdir}/sigc++-*/"
 
 SRC_URI[md5sum] = "d0d1ffcae0eced97ef4f17ce0ba81352"
-- 
1.7.1



