Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1TqNpX-0004j6-Ev
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 13:53:59 +0100
Received: from aimless.elisa-laajakaista.fi
	(a91-156-58-157.elisa-laajakaista.fi [91.156.58.157])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id A3971264BB;
	Wed,  2 Jan 2013 13:38:57 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 14:38:50 +0200
Message-Id: <1357130330-2531-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] krb5: reconfigure for aarch64
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
X-List-Received-Date: Wed, 02 Jan 2013 12:53:59 -0000

krb5 needs reconfigure, since the current config.sub included doesn't
include aarch64.
---
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index b1bb32a..c755862 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -35,5 +35,6 @@ python do_unpack() {
 }
 
 do_configure() {
-	oe_runconf
+    gnu-configize --force
+    oe_runconf
 }
-- 
1.7.10.4



