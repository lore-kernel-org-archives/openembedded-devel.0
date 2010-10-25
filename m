Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAOgI-0006SM-5q
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 17:09:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6D4D43148C0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:09:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id AyfPaeKXX6py
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:09:04 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8E28D314A2AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:09:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 15:09:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 15:09:03 +0000
Message-Id: <1288019343-3218-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	TVD_SPACE_RATIO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libdvbsi++-0.3.4: initial recipe
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
X-List-Received-Date: Mon, 25 Oct 2010 15:09:51 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libdvbsi++/libdvbsi++_0.3.4.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libdvbsi++/libdvbsi++_0.3.4.bb

diff --git a/recipes/libdvbsi++/libdvbsi++_0.3.4.bb b/recipes/libdvbsi++/libdvbsi++_0.3.4.bb
new file mode 100644
index 0000000..058220b
--- /dev/null
+++ b/recipes/libdvbsi++/libdvbsi++_0.3.4.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "C++ parsing library for Service Information (SI) in DVB systems"
+AUTHOR = "Andreas Oberritter"
+SECTION = "libs/multimedia"
+PRIORITY = "optional"
+LICENSE = "LGPLv2.1"
+
+SRC_URI = "http://www.saftware.de/${PN}/${P}.tar.bz2"
+SRC_URI[md5sum] = "78f19f665fe3399eb8bc97cd6ca7738c"
+SRC_URI[sha256sum] = "2dfd9f588f639664f22afc794a173a0c36bb8ebd81615b0f192eefcb60e23480"
+
+inherit autotools pkgconfig
-- 
1.7.1



