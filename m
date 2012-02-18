Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq9-0006Ih-4Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:09 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 904AC22325A7;
	Sat, 18 Feb 2012 22:20:55 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1CF8922325AA;
	Sat, 18 Feb 2012 22:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:51 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7351E3C4C5; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:22 +0100
Message-Id: <1329600022-8027-13-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 12/12][oe-classic] openjdk-6-common.inc: fix hardcoded path for allowing to build with linux 3.x
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:09 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/openjdk/openjdk-6-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
index f6d3c34..ee3db29 100644
--- a/recipes/openjdk/openjdk-6-common.inc
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -213,7 +213,7 @@ do_configure_prepend() {
 do_configure_append() {
 	oe_runmake patch-ecj
 
-	for F in ${WORKDIR}/openjdk-src-dir/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk-ecj/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk/hotspot/make/linux/Makefile ;
+	for F in ${WORKDIR}/openjdk-src-dir/hotspot/make/linux/Makefile ${B}/openjdk-ecj/hotspot/make/linux/Makefile ${B}/openjdk/hotspot/make/linux/Makefile ;
 	do
 		sed -i \
 			-e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
-- 
1.7.9


