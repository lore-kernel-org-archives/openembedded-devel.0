Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 9921B7205C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:35 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGbfJ; Mon, 10 Nov 2014 14:16:36 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:20 -0600
Message-Id: <145df44783ecab755c77aa79c985b4a3d8e624f6.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
Subject: [RFC 01/10] gypsy: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:16:36 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 7c93d0a..15d80fe 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -6,7 +6,7 @@ client applications, passing the data as simple values for the clients \
 to use."
 LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "console/network"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
+DEPENDS = "glib-2.0 dbus virtual/bluez dbus-glib libxslt-native libxslt"
 
 inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"
-- 
1.8.5.5


