Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mCP-0007M9-Vl
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:54 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAc-0002Qe-4g by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:56 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAb-0008Ms-57
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:53 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:52 +0100
Message-Id: <7fca0ced84a11c35bc3da781385d3b846e8e111d.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300979039.git.stefan@buglabs.net>
References: <cover.1300979039.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 6/7] sane-toolchain-java: switch to cacao-native here too
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
X-List-Received-Date: Thu, 24 Mar 2011 15:11:56 -0000

From: Henning Heinold <h.heinold@tarent.de>

Signed-off-by: Henning Heinold <h.heinold@tarent.de>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/distro/include/sane-toolchain-java.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-java.inc b/conf/distro/include/sane-toolchain-java.inc
index a0f5792..365a3d6 100644
--- a/conf/distro/include/sane-toolchain-java.inc
+++ b/conf/distro/include/sane-toolchain-java.inc
@@ -1,6 +1,6 @@
 # Set PREFFERED and VERSION stuff for working java-toolchain
 
-PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
-PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
+PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
+PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
 PREFERRED_VERSION_classpath-native = "0.98"
 PREFERRED_VERSION_classpath = "0.98"
-- 
1.7.4.1



