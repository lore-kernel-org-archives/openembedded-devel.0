Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TswDY-0001i5-Lv
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:01:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 15E59D22CD;
	Wed,  9 Jan 2013 14:46:01 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 14:45:54 +0100
Message-Id: <1357739154-21256-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] libass: add missing dependency on fribidi
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
X-List-Received-Date: Wed, 09 Jan 2013 14:01:22 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-multimedia/libass/libass.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index f398d49..28d6caa 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -5,7 +5,7 @@ SECTION = "libs/multimedia"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
 
-DEPENDS = "enca fontconfig freetype libpng"
+DEPENDS = "enca fontconfig freetype libpng fribidi"
 
 INC_PR = "r1"
 
-- 
1.8.0



