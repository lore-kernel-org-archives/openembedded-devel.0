Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9Olq-0006Uq-UR
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:31:12 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 948574B0109;
	Tue,  4 May 2010 22:27:23 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP;
	Tue,  4 May 2010 22:27:21 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 22:26:48 +0200
Message-Id: <1273004809-24230-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] python-m2crypto-native: Add recipe
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
X-List-Received-Date: Tue, 04 May 2010 20:31:12 -0000

- this package is needed to compile crda

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/python/python-m2crypto-native_0.18.2.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-m2crypto-native_0.18.2.bb

diff --git a/recipes/python/python-m2crypto-native_0.18.2.bb b/recipes/python/python-m2crypto-native_0.18.2.bb
new file mode 100644
index 0000000..4a28464
--- /dev/null
+++ b/recipes/python/python-m2crypto-native_0.18.2.bb
@@ -0,0 +1,12 @@
+require python-m2crypto_${PV}.bb
+inherit native
+
+FILESPATH = "${FILE_DIRNAME}/python-m2crypto"
+DEPENDS = "python-native"
+
+do_stage() {
+	distutils_stage_all
+}
+
+SRC_URI[md5sum] = "445dce53fcfc7ec8f6fd31f54da8a067"
+SRC_URI[sha256sum] = "62ed44c8b2d392bdc757981ac37f05d808a0d917e4f9d95de2fbf3c2bdad41a7"
-- 
1.6.3.3



