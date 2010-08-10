Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Oir0b-0006Ee-P8
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 17:45:12 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 556A780C527; Tue, 10 Aug 2010 17:44:49 +0200 (CEST)
Received: from localhost (unknown [82.113.106.4])
	by gravedo.de (Postfix) with ESMTPSA id 5438780C4FF;
	Tue, 10 Aug 2010 17:44:45 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 17:44:36 +0200
Message-Id: <1281455076-4291-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] lvm2.inc: remove unnecessary EXTRA_OECONF_arm line from recipe
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
X-List-Received-Date: Tue, 10 Aug 2010 15:45:15 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/lvm2/lvm2.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
index db3a1c1..da7cc9c 100644
--- a/recipes/lvm2/lvm2.inc
+++ b/recipes/lvm2/lvm2.inc
@@ -12,7 +12,6 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
-EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"
 
 inherit autotools
 
-- 
1.7.0.4



