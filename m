Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TEzU8-00029I-2s
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Sep 2012 11:25:20 +0200
Received: from puchatek.dom (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2AFD9D22D6;
	Fri, 21 Sep 2012 11:12:40 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Sep 2012 11:12:35 +0200
Message-Id: <1348218755-6185-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] orrery: added missing dependency on gtk+
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
X-List-Received-Date: Fri, 21 Sep 2012 09:25:20 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 1e41f5b..c216f29 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -3,6 +3,7 @@ HOMEPAGE    = "http://projects.openmoko.org/projects/orrery/"
 SECTION = "x11/scientific"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
+DEPENDS = "gtk+"
 
 inherit autotools
 
-- 
1.7.10.4



