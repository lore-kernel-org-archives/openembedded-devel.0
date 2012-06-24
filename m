Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Simtr-0003uw-I2
	for openembedded-devel@openembedded.org; Sun, 24 Jun 2012 15:30:47 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id ED9CBEA040;
	Sun, 24 Jun 2012 15:27:04 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 51977604DE; Sun, 24 Jun 2012 15:19:57 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Sun, 24 Jun 2012 15:19:57 +0200
Message-Id: <1340543997-16249-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340543746-15982-1-git-send-email-apelete@seketeli.net>
References: <1340543746-15982-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] bluez4: update checksum values
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
X-List-Received-Date: Sun, 24 Jun 2012 13:30:47 -0000

This patch updates the md5 and sha256 checksum values reported in
recipes/bluez/bluez4_4.42.bb to match the ones of the source package
actually.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/bluez/bluez4_4.42.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/bluez/bluez4_4.42.bb b/recipes/bluez/bluez4_4.42.bb
index 48f793e..c3aa496 100644
--- a/recipes/bluez/bluez4_4.42.bb
+++ b/recipes/bluez/bluez4_4.42.bb
@@ -10,5 +10,5 @@ inherit update-rc.d
 INITSCRIPT_NAME = "bluetooth"
 INITSCRIPT_PARAMS = "defaults 23 19"
 
-SRC_URI[md5sum] = "d24dfd3ca42847123e29f58b29af6948"
-SRC_URI[sha256sum] = "ed7631a6d22b456eb26b881bdbe46ea47f93d2f192da420408bad4bbc245f796"
+SRC_URI[md5sum] = "a44181c8cf79796a99b792a5372e602d"
+SRC_URI[sha256sum] = "a834f3a961449c6ae83ad26aa5d0b82a6cdd7e49f608aa71a2454a33c62cfb99"
-- 
1.7.10



