Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 2654171FC7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:40 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGggu; Mon, 10 Nov 2014 14:16:41 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:27 -0600
Message-Id: <5702c9e7e790684efd139b89917145208bed4d85.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
Subject: [RFC 08/10] gnokii: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:16:40 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 4826452..4423906 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 X11DEPENDS = " libxpm gtk+"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[bluez] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+PACKAGECONFIG[bluez] = "--enable-bluetooth,--disable-bluetooth,virtual/bluez"
 PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
 PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
1.8.5.5


