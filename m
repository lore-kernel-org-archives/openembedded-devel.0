Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tdz6O-0007CF-Ls
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2012 09:04:19 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 833F1D2218;
	Thu, 29 Nov 2012 08:50:05 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2012 08:49:47 +0100
Message-Id: <1354175387-26972-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] zsh: added gnu-configize to do_configure()
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
X-List-Received-Date: Thu, 29 Nov 2012 08:04:20 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-extended/zsh/zsh.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
index cacce91..9713cfc 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -35,6 +35,7 @@ ALTERNATIVE_PRIORITY = "100"
 export AUTOHEADER = "true"
 
 do_configure () {
+    gnu-configize --force
     oe_runconf
 }
 
-- 
1.8.0



