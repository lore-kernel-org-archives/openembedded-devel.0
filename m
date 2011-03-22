Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1xkJ-0007kI-5X
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:19:36 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6D5B911000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:08 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9CD1B11000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:06 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9DEF93C0BE; Tue, 22 Mar 2011 10:02:19 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 10:02:11 +0100
Message-Id: <1300784531-13757-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] bitbake.conf: fix LZMA_COMPRESSION_LEVEL, because lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 09:19:36 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index e57a7ad..0207146 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -149,7 +149,7 @@ QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
 
 # default compression levels
 XZ_COMPRESSION_LEVEL ?= "-e -9"
-LZMA_COMPRESSION_LEVEL ?= "-e -9"
+LZMA_COMPRESSION_LEVEL ?= "-9"
 
 # default integrity check
 XZ_INTEGRITY_CHECK ?= "crc32"
-- 
1.7.4.1


