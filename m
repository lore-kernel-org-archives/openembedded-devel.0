Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9PIN-0001Yu-Kk
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 23:04:49 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 909E64B015F;
	Tue,  4 May 2010 23:01:00 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP;
	Tue,  4 May 2010 23:00:58 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 23:00:26 +0200
Message-Id: <1273006826-7168-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1273004809-24230-2-git-send-email-eric@eukrea.com>
References: <1273004809-24230-2-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-m2crypto: add native
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
X-List-Received-Date: Tue, 04 May 2010 21:04:50 -0000

- this package is needed to compile crda

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/python/python-m2crypto_0.18.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-m2crypto_0.18.2.bb b/recipes/python/python-m2crypto_0.18.2.bb
index 7a2af1e..74a212d 100644
--- a/recipes/python/python-m2crypto_0.18.2.bb
+++ b/recipes/python/python-m2crypto_0.18.2.bb
@@ -20,3 +20,6 @@ export STAGING_LIBDIR
 
 SRC_URI[md5sum] = "445dce53fcfc7ec8f6fd31f54da8a067"
 SRC_URI[sha256sum] = "62ed44c8b2d392bdc757981ac37f05d808a0d917e4f9d95de2fbf3c2bdad41a7"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
1.6.3.3



