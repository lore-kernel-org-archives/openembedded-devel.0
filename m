Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dcw-0005ct-6F
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:18:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6C3B13148EF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 13:17:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fh6L8FwXucQP; Fri,  1 Oct 2010 13:17:50 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id B52983148368;
	Fri,  1 Oct 2010 13:17:49 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 11:17:49 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 11:17:31 +0000
Message-Id: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] mumudvb-1.6: initial recipe
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
X-List-Received-Date: Fri, 01 Oct 2010 11:18:11 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/mumudvb/mumudvb.inc    |   12 ++++++++++++
 recipes/mumudvb/mumudvb_1.6.bb |    4 ++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mumudvb/mumudvb.inc
 create mode 100644 recipes/mumudvb/mumudvb_1.6.bb

diff --git a/recipes/mumudvb/mumudvb.inc b/recipes/mumudvb/mumudvb.inc
new file mode 100644
index 0000000..8f3ba45
--- /dev/null
+++ b/recipes/mumudvb/mumudvb.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "redistributes streams from DVB on a network using multicast or HTTP unicast"
+AUTHOR = "Brice Dubost"
+HOMEPAGE = "http://mumudvb.braice.net/"
+SECTION = "console/multimedia"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://mumudvb.braice.net/mumudvb/${P}/mumudvb_${PV}.tar.gz"
+
+S = "${WORKDIR}/mumudvb"
+
+inherit autotools
diff --git a/recipes/mumudvb/mumudvb_1.6.bb b/recipes/mumudvb/mumudvb_1.6.bb
new file mode 100644
index 0000000..3100bd6
--- /dev/null
+++ b/recipes/mumudvb/mumudvb_1.6.bb
@@ -0,0 +1,4 @@
+require mumudvb.inc
+
+SRC_URI[md5sum] = "a463af541d0395ba3a2286e92f080615"
+SRC_URI[sha256sum] = "0b3921762dabac062bba5b086fe5661e98526f8ea2b1719aad0fb40128d7111b"
-- 
1.7.1



