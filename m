Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 186D171BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:18 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sI5F011163
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:18 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:18 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:53:59 -0700
Message-Id: <20180806085408.44739-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 01/10] libwnck3: 3.20.1 -> 3.24.1
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:18 -0000

* inherit gettext to fix qa error

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libwnck/{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb}             | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
index 02149fbec..f3103b4d7 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
@@ -10,9 +10,10 @@ DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
-inherit gnomebase gobject-introspection gtk-doc
-SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
-SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
+inherit gnomebase gobject-introspection gtk-doc gettext
+
+SRC_URI[archive.md5sum] = "23df51ec0a1169014fe3a102d572b244"
+SRC_URI[archive.sha256sum] = "afa6dc283582ffec15c3374790bcbcb5fb422bd38356d72deeef35bf7f9a1f04"
 
 inherit distro_features_check
 # libxres means x11 only
-- 
2.11.0


