Return-Path: <eduardas.m@fods.com>
Received: from pastas.balt.net (lex.balt.net [217.117.28.48])
	by mail.openembedded.org (Postfix) with ESMTP id 890826BA7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 16:53:13 +0000 (UTC)
Received: from eduardas-HP-EliteDesk-800-G2-TWR.lifodas.local (unknown
	[213.197.143.19]) (Authenticated sender: eduardas.m@fods.com)
	by pastas.balt.net (Postfix) with ESMTPA id C11371BE6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 18:53:11 +0200 (EET)
From: Eduardas Meile <eduardas.m@fods.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 18:52:57 +0200
Message-Id: <20181204165257.11634-1-eduardas.m@fods.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.4 at neptunas3.balt.net
X-Virus-Status: Clean
Subject: [meta-oe][PATCH] toybox: use cml1.bbclass to add a proper menuconfig task
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2018 16:53:13 -0000

It is sometimes convenient to use "bitbake toybox -c menuconfig".

Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
---
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index 1ea868f67..614136e27 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -48,7 +48,7 @@ do_install() {
     install -m 0644 ${B}/toybox.links ${D}${sysconfdir}
 }
 
-inherit update-alternatives
+inherit cml1 update-alternatives
 
 # If you've chosen to install toybox you probably want it to take precedence
 # over busybox where possible but not over other packages
-- 
2.17.1


