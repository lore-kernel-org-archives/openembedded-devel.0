Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OD3qc-0005yZ-S5
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 00:59:15 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9E6364B0078
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 00:55:18 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 00:55:16 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 May 2010 00:53:03 +0200
Message-Id: <1273877583-31604-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Fri, 14 May 2010 22:59:15 -0000

- without this bitbake meta-toolchain fails because it doesn't find who
 provides gdb-cross-sdk
- found thanks to a hint from Phil Blundell on IRC
- tested with Angstrom/ARMv5te

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 classes/cross.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 69f6511..5c2d5be 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -17,8 +17,6 @@ PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
 BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 
-PACKAGES = ""
-
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
 HOST_OS = "${BUILD_OS}"
-- 
1.6.3.3



