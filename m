Return-Path: <voipio@kos.to>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id C43B160EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 13:47:21 +0000 (UTC)
Received: from kos.to (a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 14B7F26553
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 15:47:20 +0200 (CEST)
Received: from voipio (uid 1000) (envelope-from voipio@kos.to) id 5e0a36
	by kos.to (DragonFly Mail Agent); Mon, 30 Sep 2013 16:47:18 +0300
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2013 16:46:09 +0300
Message-Id: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: patches@linaro.org
Subject: [meta-java][PATCH 1/3] jamvm compile add extra space to argument
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
X-List-Received-Date: Mon, 30 Sep 2013 13:47:22 -0000

Just as safety measure.
---
 recipes-core/jamvm/jamvm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index da194f7..4677238 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -36,7 +36,7 @@ do_configure_append_virtclass-native() {
 EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi"
 
 # Needed for big compilation targets like OpenJDK
-CFLAGS_append_virtclass-native = " -DDEFAULT_MAX_HEAP=1024*MB"
+CFLAGS_append_virtclass-native = " -DDEFAULT_MAX_HEAP=1024*MB "
 
 # Enforce usage of ecj-initial.
 EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
-- 
1.8.1.2


