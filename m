Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxM-0004mZ-St
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:40 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKuj-0007ax-JL by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:29:59 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKui-00010F-DF
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:29:56 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:29:56 +0200
Message-Id: <dda8ff6c3b7e006ed3114bc7de15dbf8b1742313.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 1/7] icedtea6-native_1.7.10: Remove reference to deleted patch.
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
X-List-Received-Date: Mon, 09 May 2011 07:32:40 -0000

From: Stefan Schmidt <stefan@buglabs.net>

During my cherry-pick of Henning's patch from master I somehow b0rked the commit
by loosing this hunk that also deletes the reference to the deleted patch file.

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/icedtea/icedtea6-native_1.7.10.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native_1.7.10.bb b/recipes/icedtea/icedtea6-native_1.7.10.bb
index c55e197..77c6232 100644
--- a/recipes/icedtea/icedtea6-native_1.7.10.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.10.bb
@@ -33,5 +33,4 @@ export DISTRIBUTION_PATCHES = "\
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
 	patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
-	patches/icedtea-jdk-build-sizer-32-on-amd64.patch \
 	"
-- 
1.7.5.1



