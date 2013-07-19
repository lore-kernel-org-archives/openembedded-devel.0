Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id A65F96AF69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 20:47:25 +0000 (UTC)
Received: from host-78-149-134-157.as13285.net ([78.149.134.157]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1V0HaE-0005GG-EB by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 19 Jul 2013 22:47:24 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1V0HaD-0000hS-SF; Fri, 19 Jul 2013 21:47:22 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2013 21:47:11 +0100
Message-Id: <1374266831-2316-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.3.2
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH] qtbase-native_5.0.2: Also use gcc 4.8 fix for the native package.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2013 20:47:26 -0000

When running on a host with gcc 4.8 we run into a compile problem with stricter
gcc. This was already fixed for the target packages so we only re-use the patch.

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 recipes-qt/qt5/qtbase-native_5.0.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase-native_5.0.2.bb b/recipes-qt/qt5/qtbase-native_5.0.2.bb
index 3df434e..c7b405a 100644
--- a/recipes-qt/qt5/qtbase-native_5.0.2.bb
+++ b/recipes-qt/qt5/qtbase-native_5.0.2.bb
@@ -1,7 +1,11 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+SRC_URI += " \
+    file://0017-Rename-qAbs-Function-for-timeval.patch \
+"
 
 SRC_URI[md5sum] = "a4fec8ed03867c4ee4fe5a46001a11f0"
 SRC_URI[sha256sum] = "31851ee2f844c100554506a9a446d4b6abb5270bca799c2a683e5f937456a9c8"
-- 
1.8.3.2


