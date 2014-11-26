Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 7993972357
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:06:39 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id LL6e1p0070BVjqb01L6gYT; Wed, 26 Nov 2014 13:06:40 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:06:30 -0600
Message-Id: <2ad0311c5de60447f9cc17535bc905ee5beddae8.1417031737.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417031737.git.pab@pabigot.com>
References: <cover.1417031737.git.pab@pabigot.com>
In-Reply-To: <cover.1417031737.git.pab@pabigot.com>
References: <cover.1417031737.git.pab@pabigot.com>
Subject: [meta-oe][PATCH 2/2] obex-data-server: conflict with bluez5
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

Although this package builds with bluez5, it was removed from Fedora 20
[1] and is not used in bluez5-based GNOME [2], suggesting the bluez5
obexd is to be used instead.

[1] http://pkgs.fedoraproject.org/cgit/obex-data-server.git/log/?h=f20
[2] http://www.hadess.net/2013/11/bluetooth-file-sharing-obexpush-in.html

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index 4a2b2b1..afe6106 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ bluez4 dbus-glib imagemagick openobex"
+RCONFLICTS_${PN} = "bluez5"
 
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
-- 
1.8.5.5


