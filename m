Received: from helsinki.digox.de ([87.106.28.129] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NwMws-0001Ek-St
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 23:56:43 +0200
Received: from localhost.localdomain by digox.de with esmtp
	(emil_qGGZo1odWQvr.); Mon, 29 Mar 2010 23:53:23 +0200
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 23:53:27 +0200
Message-Id: <1269899607-30980-1-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 87.106.28.129
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH] pkgconfig.inc: add missing ${D} when creating ${libdir}/pkgconfig in do_install_append
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
X-List-Received-Date: Mon, 29 Mar 2010 21:56:43 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/pkgconfig/pkgconfig.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfig.inc
index 5707735..4f618f8 100644
--- a/recipes/pkgconfig/pkgconfig.inc
+++ b/recipes/pkgconfig/pkgconfig.inc
@@ -22,5 +22,5 @@ do_configure_prepend () {
 }
 
 do_install_append() {
-	install -d -m 0755 ${libdir}/pkgconfig
+	install -d -m 0755 ${D}${libdir}/pkgconfig
 }
-- 
1.6.6.1



