Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8FBV-0004qo-7V
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 18:37:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CD9E93149E3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 18:36:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9MN-Mu-vrIUu
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 18:36:25 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 7A6F73149E93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 18:36:24 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Tue, 19 Oct 2010 16:36:24 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 16:36:24 +0000
Message-Id: <1287506184-13086-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dvdauthor-0.6.18: initial recipe
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
X-List-Received-Date: Tue, 19 Oct 2010 16:37:11 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/dvdauthor/dvdauthor_0.6.18.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dvdauthor/dvdauthor_0.6.18.bb

diff --git a/recipes/dvdauthor/dvdauthor_0.6.18.bb b/recipes/dvdauthor/dvdauthor_0.6.18.bb
new file mode 100644
index 0000000..91eb3b9
--- /dev/null
+++ b/recipes/dvdauthor/dvdauthor_0.6.18.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A set of tools to help you generate DVD files to be played back on a standalone DVD player."
+SECTION = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "freetype libdvdread libfribidi libpng libxml2 zlib"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"
+SRC_URI[md5sum] = "ded5373800ac6448ff044606f5047550"
+SRC_URI[sha256sum] = "0e21c2d9c09f7e347c4c9bd7b691455f524ec2e91bcafc18b84d7b7fb3a9cb26"
+
+S = "${WORKDIR}/${PN}"
+
+inherit autotools
-- 
1.7.1



