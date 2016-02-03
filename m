Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id C3AA977337
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 13:04:22 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 7F93A42BB0A;
	Wed,  3 Feb 2016 14:02:46 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	=?UTF-8?q?Jo=C3=A3o=20Henrique=20Freitas?= <joaohf@gmail.com>
Date: Wed,  3 Feb 2016 14:02:32 +0100
Message-Id: <1454504552-27015-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-erlang][PATCH] erlang: fix host-user-contaminated
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
X-List-Received-Date: Wed, 03 Feb 2016 13:04:25 -0000

Fix host-user-contaminated QA issue by running chown on erlang
installation root in do_install.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 recipes-devtools/erlang/erlang_18.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/erlang/erlang_18.1.bb b/recipes-devtools/erlang/erlang_18.1.bb
index 8f947ad4b0dc12a1bf972bf8dcb4f34b585d29e8..63ae68b8772e603a428c89b76f220df3c8382ed8 100644
--- a/recipes-devtools/erlang/erlang_18.1.bb
+++ b/recipes-devtools/erlang/erlang_18.1.bb
@@ -59,5 +59,6 @@ do_install() {
 
     # Actually wx is not suitable with erlang embedded
     rm -rf ${D}/${libdir}/erlang/lib/wx-*
+    chown -R root:root ${D}${libdir}/erlang
 }
 
-- 
2.5.0


