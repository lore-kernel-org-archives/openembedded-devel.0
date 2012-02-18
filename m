Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq4-0006Gf-OS
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:05 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 22CDF22325A8;
	Sat, 18 Feb 2012 22:20:51 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BD18A22325AE;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 0C82F3C4C0; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:17 +0100
Message-Id: <1329600022-8027-8-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 07/12][oe-classic] angstrom-jalimo.conf, sane-toolchain-java.inc: use jamvm-git instead of cacao-hg as java-native
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:05 -0000

* latest jamvm seems to be more stable

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 conf/distro/include/angstrom-jalimo.conf    |    4 ++--
 conf/distro/include/sane-toolchain-java.inc |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index 3ab8e2d..f2d2fa6 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -5,8 +5,8 @@ PREFERRED_VERSION_jamvm-initial = "1.4.5"
 PREFERRED_VERSION_classpath-initial = "0.93"
 
 # Native VM
-PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
-SRCREV_pn-cacao-native ?= "c7bf150bfa46"
+PREFERRED_PROVIDER_virtual/java-native ?= "jamvm-native"
+PREFERRED_VERSION_jamvm-native = "1.5.5+1.6.0-devel+git0+4617da717ecb05654ea5bb9572338061106a414d"
 PREFERRED_VERSION_classpath-native = "0.98"
 
 # Native compiler settings
diff --git a/conf/distro/include/sane-toolchain-java.inc b/conf/distro/include/sane-toolchain-java.inc
index a754f11..ff91992 100644
--- a/conf/distro/include/sane-toolchain-java.inc
+++ b/conf/distro/include/sane-toolchain-java.inc
@@ -1,7 +1,7 @@
 # Set PREFFERED and VERSION stuff for working java-toolchain
 
 PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
-PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
+PREFERRED_PROVIDER_virtual/java-native ?= "jamvm-native"
 
 # target cacao is failing to build
 # without this provider we get
-- 
1.7.9


