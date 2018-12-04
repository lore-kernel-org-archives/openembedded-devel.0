Return-Path: <eduardas.m@fods.com>
Received: from pastas.balt.net (pastas.balt.net [217.117.28.48])
	by mail.openembedded.org (Postfix) with ESMTP id 405866BCA0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 16:19:48 +0000 (UTC)
Received: from eduardas-HP-EliteDesk-800-G2-TWR.lifodas.local (unknown
	[213.197.143.19]) (Authenticated sender: eduardas.m@fods.com)
	by pastas.balt.net (Postfix) with ESMTPA id 88E2B1DD90
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 18:19:47 +0200 (EET)
From: Eduardas Meile <eduardas.m@fods.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 18:19:45 +0200
Message-Id: <20181204161945.9576-1-eduardas.m@fods.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.4 at neptunas1.balt.net
X-Virus-Status: Clean
Subject: [meta-oe][PATCH] toybox: fix to use "usrmerge" distro feature properly
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
X-List-Received-Date: Tue, 04 Dec 2018 16:19:49 -0000

Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
---
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index 7e8e7b2ea..1ea868f67 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -60,7 +60,7 @@ python do_package_prepend () {
 
     dvar = d.getVar('D')
     pn = d.getVar('PN')
-    target = "/bin/toybox"
+    target = d.expand("${base_bindir}/toybox")
 
     f = open('%s/etc/toybox.links' % (dvar), 'r')
     for alt_link_name in f:
-- 
2.17.1


