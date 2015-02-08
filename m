Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-07.prod.phx3.secureserver.net
	(p3plsmtpa08-07.prod.phx3.secureserver.net [173.201.193.108])
	by mail.openembedded.org (Postfix) with ESMTP id 803C072DE1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:54:50 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-07.prod.phx3.secureserver.net with 
	id punh1p0050BVjqb01unipL; Sun, 08 Feb 2015 11:47:42 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:47:34 -0600
Message-Id: <755eef61918d9e50cba60c72d5adf8878d9b37c0.1423421018.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423421017.git.pab@pabigot.com>
References: <cover.1423421017.git.pab@pabigot.com>
In-Reply-To: <cover.1423421017.git.pab@pabigot.com>
References: <cover.1423421017.git.pab@pabigot.com>
Subject: [PATCHv3 1/3] gnokii: refine selector for bluez4 package config
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
X-List-Received-Date: Sun, 08 Feb 2015 18:54:57 -0000

Use bluez4 or bluez5 to avoid ambiguity.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 4826452..acae868 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 X11DEPENDS = " libxpm gtk+"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[bluez] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
 PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
1.9.1


