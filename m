Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMg4-00056u-E9
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 15:01:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 74F51314A20D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:00:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QLTfbyjjTURE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:00:38 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id EA461314A1B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:00:36 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 13:00:36 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 13:00:36 +0000
Message-Id: <1288011636-23800-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CBDE483.3030002@opendreambox.org>
References: <4CBDE483.3030002@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 resend] dvdauthor-0.6.18: initial recipe
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
X-List-Received-Date: Mon, 25 Oct 2010 13:01:29 -0000

* v2: updated DESCRIPTION, SECTION and PRIORITY

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/dvdauthor/dvdauthor_0.6.18.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dvdauthor/dvdauthor_0.6.18.bb

diff --git a/recipes/dvdauthor/dvdauthor_0.6.18.bb b/recipes/dvdauthor/dvdauthor_0.6.18.bb
new file mode 100644
index 0000000..24f3a74
--- /dev/null
+++ b/recipes/dvdauthor/dvdauthor_0.6.18.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A set of tools to help you generate DVD files to be played back on a standalone DVD player"
+SECTION = "console/multimedia"
+PRIORITY = "optional"
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



