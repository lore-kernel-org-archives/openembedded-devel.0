Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 1191872376
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:08:01 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id LL7z1p00Y0BVjqb01L82ra; Wed, 26 Nov 2014 13:08:02 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:07:54 -0600
Message-Id: <3f59d584f327d831f17d48e70799da72d160ed5f.1417031714.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
Subject: [meta-oe][RFC v2 3/3] packagegroup-basic: select distro preference for bluez provider
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

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 20b1652..4f2992c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -9,6 +9,7 @@ PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
+inherit bluetooth
 
 # Poke extra recomendations into the list using your machine.conf
 #
@@ -45,7 +46,7 @@ RRECOMMENDS_${PN} = "\
     ${@base_contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
     ${@base_contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
     \
-    ${@base_contains("DISTRO_FEATURES", "bluetooth", "bluez4", "", d)} \
+    ${@base_contains("DISTRO_FEATURES", "bluetooth", "${BLUEZ}", "", d)} \
     ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
     \
     tzdata \
-- 
1.8.5.5


