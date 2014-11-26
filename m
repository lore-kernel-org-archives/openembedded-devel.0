Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA3872371
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:08:00 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id LL7z1p00Y0BVjqb01L81rF; Wed, 26 Nov 2014 13:08:01 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:07:52 -0600
Message-Id: <e40100d74fe21e694d1a9f334b0fddf02d6dea3e.1417031714.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
Subject: [meta-oe][RFC v2 1/3] gnokii: refine selector for bluez4 package config
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
X-List-Received-Date: Wed, 26 Nov 2014 20:08:04 -0000

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
1.8.5.5


