Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 9902B6FC68
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:36 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGcfn; Mon, 10 Nov 2014 14:16:37 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:22 -0600
Message-Id: <499117eafe5a97145dd3d43a4254224524df0f1f.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
Subject: [RFC 03/10] foxtrotgps: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:16:37 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 101e87e..ef63296 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.foxtrotgps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
+DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd virtual/bluez intltool-native"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
-- 
1.8.5.5


