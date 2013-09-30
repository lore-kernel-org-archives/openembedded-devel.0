Return-Path: <voipio@kos.to>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 12E6260EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 13:47:23 +0000 (UTC)
Received: from kos.to (a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 5A2F02654C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 15:47:24 +0200 (CEST)
Received: from voipio (uid 1000) (envelope-from voipio@kos.to) id 5e0a1a
	by kos.to (DragonFly Mail Agent); Mon, 30 Sep 2013 16:47:22 +0300
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2013 16:46:10 +0300
Message-Id: <1380548771-13812-2-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
Cc: patches@linaro.org
Subject: [meta-java][PATCH 2/3] jamvm: update to latest in openjdk-7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2013 13:47:23 -0000

jamvm has wrong wrong checksums for version referred. Update
the version to match that is in jamvm_git.bb and make checksums
match.
---
 recipes-core/openjdk/openjdk-7-release-25b30.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
index 363b6e2..60f4f43 100644
--- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
+++ b/recipes-core/openjdk/openjdk-7-release-25b30.inc
@@ -43,11 +43,11 @@ CACAO_URI = "http://icedtea.classpath.org/download/drops/cacao/${CACAO_FILE};nam
 SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
 SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"
 
-JAMVM_VERSION = "0972452d441544f7dd29c55d64f1ce3a5db90d82"
+JAMVM_VERSION = "ac22c9948434e528ece451642b4ebde40953ee7e"
 JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
 JAMVM_URI = "http://icedtea.classpath.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
-SRC_URI[jamvm.md5sum] = "740c2587502831cac6797d1233a7e27b"
-SRC_URI[jamvm.sha256sum] = "47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"
+SRC_URI[jamvm.md5sum] = "3a67d0f3471bd2d5b2446d91bfa73f73"
+SRC_URI[jamvm.sha256sum] = "4662da1fe3e0e11d8fa685c7f2fc748576b9f3d3e37dc56b798dd6a5bd6b61e7"
 
 # Allow overriding this separately
 OEPATCHES = "\
-- 
1.8.1.2


