Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TipQ2-00075u-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 17:44:26 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6BF86D22E8;
	Wed, 12 Dec 2012 17:30:03 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2012 17:29:39 +0100
Message-Id: <1355329779-17222-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355329779-17222-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355329779-17222-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/2] libgcc: s/virtclass/class/ to make it up-to-date
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
X-List-Received-Date: Wed, 12 Dec 2012 16:44:26 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
index 8529755..4dade08 100644
--- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
@@ -5,7 +5,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
 PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+PKGSUFFIX_class-nativesdk = "-nativesdk"
 
 PACKAGES = "\
   ${PN} \
-- 
1.8.0



