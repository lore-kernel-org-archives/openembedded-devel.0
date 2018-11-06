Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 088AF74813
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Nov 2018 06:20:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA66KQON008219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Nov 2018 22:20:27 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 5 Nov 2018 22:20:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Nov 2018 14:20:13 +0800
Message-ID: <1541485213-44314-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] network-manager-applet: move GNOMEBASEBUILDCLASS to correct position
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
X-List-Received-Date: Tue, 06 Nov 2018 06:20:27 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

GNOMEBASEBUILDCLASS is used by gnomebase, if put it after inherit
gnomebase, GNOMEBASEBUILDCLASS in recipe will not take effect

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.8.18.bb            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
index cfb742c..0184000 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
@@ -7,12 +7,11 @@ DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
            intltool-native \
 "
 
+GNOMEBASEBUILDCLASS = "autotools-brokensep"
 inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOMEBASEBUILDCLASS = "autotools-brokensep"
-
 SRC_URI[archive.md5sum] = "34923579b39360db64649342ee6735d8"
 SRC_URI[archive.sha256sum] = "23dc1404f1e0622b7c4718b6d978b101d5e4d9be0b92133b3863a4dc29786178"
 
-- 
2.7.4


