Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 151C2731E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 09:57:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u719vJiB026930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 02:57:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 02:57:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Aug 2016 05:57:17 -0400
Message-ID: <1470045437-191645-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] network-manager-applet: addmissing intltool-native dependency
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
X-List-Received-Date: Mon, 01 Aug 2016 09:57:21 -0000
Content-Type: text/plain

Recipes that use intltool need to depend on intltool-native.
...
|WARNING: network-manager-applet-1.0.10-r0 do_configure: Missing DEPENDS
on intltool-native
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.0.10.bb          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
index d3e08ca..9803a83 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
@@ -2,7 +2,10 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib gconf libgnome-keyring iso-codes nss"
+DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
+           gconf libgnome-keyring iso-codes nss \
+           intltool-native \
+"
 
 inherit gnomebase gsettings gtk-icon-cache gobject-introspection
 
-- 
2.8.1


