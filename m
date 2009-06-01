Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB8xK-00012m-1r
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 16:57:42 +0200
Received: (qmail 25005 invoked by uid 813007); 1 Jun 2009 14:48:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 14:48:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon,  1 Jun 2009 16:49:19 +0200
Message-Id: <1243867762-16540-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 03/13] tune-ep9312: use flags from Martin W. Guy work
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
X-List-Received-Date: Mon, 01 Jun 2009 14:57:42 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 conf/machine/include/tune-ep9312.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/tune-ep9312.inc b/conf/machine/include/tune-ep9312.inc
index cf3de9c..fd9c1cc 100644
--- a/conf/machine/include/tune-ep9312.inc
+++ b/conf/machine/include/tune-ep9312.inc
@@ -1,8 +1,7 @@
-TARGET_CC_ARCH = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
-# add "-mfp=maverick" for newer gcc versions > 4.0
+TARGET_CC_ARCH = "-mcpu=ep9312 -mfpu=maverick -mfloat-abi=softfp -fno-signed-zeros -O"
 
 #set arch to ep9312 for all generated packages
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t ep9312"
+PACKAGE_EXTRA_ARCHS += "armv4 armv4t ep93xx"
 BASE_PACKAGE_ARCH = "ep9312"
 FEED_ARCH = "ep9312"
 
-- 
1.6.3.1





