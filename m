Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB8xK-00013D-Od
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 16:57:42 +0200
Received: (qmail 25107 invoked by uid 813007); 1 Jun 2009 14:48:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 14:48:58 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon,  1 Jun 2009 16:49:22 +0200
Message-Id: <1243867762-16540-7-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 07/13] tune-ep3912: optimize with -O not -O2
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
X-List-Received-Date: Mon, 01 Jun 2009 14:57:43 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 conf/machine/include/tune-ep9312.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/tune-ep9312.inc b/conf/machine/include/tune-ep9312.inc
index 3f89b67..c8770e0 100644
--- a/conf/machine/include/tune-ep9312.inc
+++ b/conf/machine/include/tune-ep9312.inc
@@ -1,10 +1,14 @@
-TARGET_CC_ARCH = "-mcpu=ep9312 -mfpu=maverick -mfloat-abi=softfp -fno-signed-zeros -O"
+TARGET_CC_ARCH = "-mcpu=ep9312 -mfpu=maverick -mfloat-abi=softfp"
 
 #set arch to ep9312 for all generated packages
-PACKAGE_EXTRA_ARCHS += "armv4t"
+PACKAGE_EXTRA_ARCHS += "armv4t ep9312"
 BASE_PACKAGE_ARCH = "ep9312"
 FEED_ARCH = "ep9312"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
 
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O -fno-signed-zeros"
+DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
+SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) == '1'], d, 1)}"
+BUILD_OPTIMIZATION = "-O"
-- 
1.6.3.1





