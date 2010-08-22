Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OnDDD-00044f-Di
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 18:16:00 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 477932EF80; Sun, 22 Aug 2010 20:15:32 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:15:28 +0400
Message-Id: <1282493728-2421-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1282493728-2421-1-git-send-email-khimov@altell.ru>
References: <1282493728-2421-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] ethtool: remove versions prior to 2.6.35
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
X-List-Received-Date: Sun, 22 Aug 2010 16:16:00 -0000

since 2.6.33 ethtool have changed version numbering and old versions
override new one. 2.6.35 is considered as safe upgrade for three year
old version 6, so there is no point in keeping it or any previous one
around.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/ethtool/ethtool_3.bb |    5 -----
 recipes/ethtool/ethtool_4.bb |    5 -----
 recipes/ethtool/ethtool_5.bb |    5 -----
 recipes/ethtool/ethtool_6.bb |    5 -----
 4 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 recipes/ethtool/ethtool_3.bb
 delete mode 100644 recipes/ethtool/ethtool_4.bb
 delete mode 100644 recipes/ethtool/ethtool_5.bb
 delete mode 100644 recipes/ethtool/ethtool_6.bb

diff --git a/recipes/ethtool/ethtool_3.bb b/recipes/ethtool/ethtool_3.bb
deleted file mode 100644
index 0583eb1..0000000
--- a/recipes/ethtool/ethtool_3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ethtool.inc
-PR ="r1"
-
-SRC_URI[md5sum] = "b4e71f7fa2629250677eefcb338442c5"
-SRC_URI[sha256sum] = "015d7c6084a668d7c2868d074e41a9cdd80bb6f0c7c6b9d275802e1629dd301f"
diff --git a/recipes/ethtool/ethtool_4.bb b/recipes/ethtool/ethtool_4.bb
deleted file mode 100644
index 84c4984..0000000
--- a/recipes/ethtool/ethtool_4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ethtool.inc
-PR ="r0"
-
-SRC_URI[md5sum] = "3882c7c9cb9b4c37b08846dea9370245"
-SRC_URI[sha256sum] = "4536d6bc9ce52b9f4d505ff36aefca23c1042a92fd2f9a54308eff6e09b1a22b"
diff --git a/recipes/ethtool/ethtool_5.bb b/recipes/ethtool/ethtool_5.bb
deleted file mode 100644
index 58b6cf7..0000000
--- a/recipes/ethtool/ethtool_5.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ethtool.inc
-PR ="r0"
-
-SRC_URI[md5sum] = "5df7f165974e096e2de890e099f87a12"
-SRC_URI[sha256sum] = "9eaad6076e57a5e2019733e4387705dc66829ea17cce04701b436cf5f374bb8f"
diff --git a/recipes/ethtool/ethtool_6.bb b/recipes/ethtool/ethtool_6.bb
deleted file mode 100644
index ada11c4..0000000
--- a/recipes/ethtool/ethtool_6.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ethtool.inc
-PR = "r0"
-
-SRC_URI[md5sum] = "3b721ec27f17ebf320ba8c505cf66d9c"
-SRC_URI[sha256sum] = "5046f573e7dd77f689c33c5f0aa0f2b7f96c79e0b37d6ecc78bae74c094fb4c6"
-- 
1.6.4.2



