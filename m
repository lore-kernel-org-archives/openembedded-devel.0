Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 77CF572336
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:06:39 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id LL6e1p0070BVjqb01L6fYK; Wed, 26 Nov 2014 13:06:39 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:06:29 -0600
Message-Id: <14c1c51abdfe686041233a0e74d4fd50194623ad.1417031737.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417031737.git.pab@pabigot.com>
References: <cover.1417031737.git.pab@pabigot.com>
In-Reply-To: <cover.1417031737.git.pab@pabigot.com>
References: <cover.1417031737.git.pab@pabigot.com>
Subject: [meta-gnome][PATCH 1/2] obexd: conflict with bluez5
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
X-List-Received-Date: Wed, 26 Nov 2014 20:06:50 -0000

obexd was integrated into bluez5 and is no longer a separate package.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 26869fe..f28f77b 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,5 +1,7 @@
 SUMMARY = "OBEX Server and Client"
+# obexd was integrated into bluez5
 DEPENDS = "glib-2.0 dbus bluez4 libical"
+RCONFLICTS_${PN} = "bluez5"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-- 
1.8.5.5


