Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tj6Mv-00038r-DV
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 11:50:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DB163D22CD;
	Thu, 13 Dec 2012 11:36:02 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 11:35:25 +0100
Message-Id: <1355394929-25182-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 3/7] dialog: added gnu-configize for AArch64 support
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
X-List-Received-Date: Thu, 13 Dec 2012 10:50:21 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-extended/dialog/dialog.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
index 03b0aa7..27e4e60 100644
--- a/meta-oe/recipes-extended/dialog/dialog.inc
+++ b/meta-oe/recipes-extended/dialog/dialog.inc
@@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-ncurses \
                 --disable-rpath-hack"
 
 do_configure() {
+    gnu-configize --force
     sed -i 's,${cf_ncuconfig_root}6-config,${cf_ncuconfig_root}-config,g' -i configure
     oe_runconf
 }
-- 
1.8.0



