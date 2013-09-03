Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-08.prod.phx3.secureserver.net
	(p3plsmtpa11-08.prod.phx3.secureserver.net [68.178.252.109])
	by mail.openembedded.org (Postfix) with ESMTP id 65CBD6BD85
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 19:05:05 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa11-08.prod.phx3.secureserver.net with 
	id Lj4z1m0081mTNtu01j50QX; Tue, 03 Sep 2013 12:05:01 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 14:04:49 -0500
Message-Id: <1378235089-5251-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] vim: workaround nawk dependency problem with RPM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 19:05:05 -0000

One of the examples has a #!/usr/bin/nawk which tells RPM to add that as a
dep, which we don't want.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-support/vim/vim.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index d7336c2..991ba74 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -54,8 +54,9 @@ EXTRA_OECONF = " \
 "
 
 do_install_append() {
-    # Work around rpm picking up csh as a dep
+    # Work around rpm picking up csh or awk as a dep
     chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/mve.awk
 
     # Install example vimrc from runtime files
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN}/vimrc
-- 
1.8.4


