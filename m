Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxj-0004tm-AB
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:33:03 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKv3-0007dE-AC by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:20 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKv2-00013E-GG
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:16 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:15 +0200
Message-Id: <e682d07e272141a55ef957b0e527950cef3b4fc8.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 6/7] icedtea6-native: add libxext-native to the dependencies
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
X-List-Received-Date: Mon, 09 May 2011 07:33:03 -0000

From: Henning Heinold <h.heinold@tarent.de>

* bump PR

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/icedtea/icedtea6-native.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6-native.inc
index 39ecdad..06da7c0 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -1,12 +1,13 @@
 DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
 HOMEPAGE = "http://icedtea.classpath.org"
 LICENSE  = "GPL with Classpath Exception"
-INC_PR = "r3"
+INC_PR = "r4"
 
 DEPENDS = "virtual/javac-native classpath-tools-native \
 	   virtual/java-native classpath-native \
 	   xalan-j-native xerces-j-native rhino-native \
-	   ant-native libx11-native xproto-native libxt-native \
+	   ant-native \
+           libx11-native xproto-native libxt-native libxext-native \
 	   freetype-native zlib-native giflib-native jpeg-native \
            zip-native \
 	  "
-- 
1.7.5.1



