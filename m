Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P6jDP-0002xK-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 14:16:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2C6483149EA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 14:16:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PAz3ugcriHnu; Fri, 15 Oct 2010 14:16:13 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 92B643149EA0;
	Fri, 15 Oct 2010 14:16:12 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Oct 2010 12:16:12 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 12:16:01 +0000
Message-Id: <1287144965-6419-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
References: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] cdtextinfo: initial recipe
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
X-List-Received-Date: Fri, 15 Oct 2010 12:16:53 -0000

* cdtextinfo queries information about an Audio-CD from CD-Text
  or CDDB. It outputs queried data as XML.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/cdtextinfo/cdtextinfo_0.1.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cdtextinfo/cdtextinfo_0.1.bb

diff --git a/recipes/cdtextinfo/cdtextinfo_0.1.bb b/recipes/cdtextinfo/cdtextinfo_0.1.bb
new file mode 100644
index 0000000..22da5b5
--- /dev/null
+++ b/recipes/cdtextinfo/cdtextinfo_0.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Query CD-Text or information from CDDB"
+AUTHOR = "Andreas Frisch <andreas.frisch@multimedia-labs.de>"
+SECTION = "console"
+PRIORITY = "optional"
+LICENSE = "GPLv3"
+DEPENDS = "libcddb libcdio"
+
+SRC_URI = "http://dreamboxupdate.com/download/sources/${P}.tar.bz2"
+
+SRC_URI[md5sum] = "8fa7eeae52093bb90c1453ca4b8a29c9"
+SRC_URI[sha256sum] = "62498d3db29c5de2e9e9119b315d2c8d7558c5a45264f26aabcf1f989437af33"
+
+inherit autotools
-- 
1.7.1



