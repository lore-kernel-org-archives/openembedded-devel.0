Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TipQ1-00075n-Gt
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 17:44:25 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 60D6DD22CD;
	Wed, 12 Dec 2012 17:30:02 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2012 17:29:38 +0100
Message-Id: <1355329779-17222-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 1/2] gcc-cross-canadian 4.6: fix dependencies to be nativesdk-* not *-nativesdk
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
X-List-Received-Date: Wed, 12 Dec 2012 16:44:25 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
index e0af4aa..788391a 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
@@ -5,8 +5,8 @@ require recipes-devtools/gcc/gcc-cross-canadian.inc
 require recipes-devtools/gcc/gcc-configure-sdk.inc
 require recipes-devtools/gcc/gcc-package-sdk.inc
 
-DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
-RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
-- 
1.8.0



