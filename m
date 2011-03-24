Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mCR-0007MA-65
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:54 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAc-0002Qg-JZ by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:57 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAY-0008MH-KV
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:50 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:50 +0100
Message-Id: <f538a8adbf3450436056e05b6173e36276e61d3c.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300979039.git.stefan@buglabs.net>
References: <cover.1300979039.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 5/7] angstrom-jalimo: use cacao-native hg version for javac-native
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

* build java packages is more stable than with jamvm

Signed-off-by: Henning Heinold <h.heinold@tarent.de>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/distro/include/angstrom-jalimo.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index e116053..48727c4 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -5,9 +5,8 @@ PREFERRED_VERSION_jamvm-initial = "1.4.5"
 PREFERRED_VERSION_classpath-initial = "0.93"
 
 # Native VM
-PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
-PREFERRED_VERSION_jamvm-native = "1.5.3"
-#PREFERRED_VERSION_cacao-native = "0.99.3"
+PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
+SRCREV_pn-cacao-native ?= "c7bf150bfa46"
 PREFERRED_VERSION_classpath-native = "0.98"
 
 # Native compiler settings
-- 
1.7.4.1



