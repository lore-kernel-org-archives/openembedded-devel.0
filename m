Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoa-0004W4-W3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:13 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id BF667275CE43; Mon, 18 Oct 2010 20:51:35 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 0C8D3275CD26;
	Mon, 18 Oct 2010 20:51:34 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:14 +0200
Message-Id: <1287427884-1517-6-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/15] palmpre: prefer git version of tslib
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:14 -0000

The git version of tslib is currently the only one which has support for the cy8mrln
touchscreen which is used on the palmpre device.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/machine/palmpre.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/palmpre.conf b/conf/machine/palmpre.conf
index 2a62c30..f5852c5 100644
--- a/conf/machine/palmpre.conf
+++ b/conf/machine/palmpre.conf
@@ -20,6 +20,9 @@ require conf/machine/include/omap3.inc
 # Put it below omap3.inc as we override the kernel here
 PREFERRED_PROVIDER_virtual/kernel = "linux-palmpre"
 
+# We need the git version of tslib as this is the only one providing support for our
+# attached touchscreen
+PREFERRED_VERSION_tslib = "1.0+git%"
 
 IMAGE_FSTYPES += "tar.bz2"
 
-- 
1.7.1



