Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RoMG1-0003OU-VM
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 22:44:26 +0100
Received: by eaa1 with SMTP id 1so302121eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 13:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HVGfXMa8U7NWmytcpctLU7kv4zACMEkk4lHumwFSNac=;
	b=xvBPV+hywU/pRAUkPhG2KHNHceBcZTX18KmQf6nYOwr+PMYzkXxWgiZ4VDXwo70euR
	wkvPhkwcMkCSFr2Go2u6VjLI2lQ1u7nuIWdbhBduoKfkfyvw2dEQYYAiII98zLP9PPwD
	Q0wzW0jG2//+LL5OZLG2hFmUKFbm4EEcwn8Tg=
Received: by 10.213.29.2 with SMTP id o2mr22558ebc.54.1327095404679;
	Fri, 20 Jan 2012 13:36:44 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id x4sm16646023eeb.4.2012.01.20.13.36.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 13:36:43 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:34:24 +0100
Message-Id: <1327095264-18153-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] Add patch for gtk+ 2.24 iconview segfault.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 21:44:26 -0000

[1] https://bugzilla.gnome.org/show_bug.cgi?id=663138

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gtk+-2.24.8/gtk_icon_view_layout-crash.patch   |   30 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
new file mode 100644
index 0000000..3ca24d5
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
@@ -0,0 +1,30 @@
+From 5c3bb1839cac52828756f9ddb98f49d586853991 Mon Sep 17 00:00:00 2001
+From: Cosimo Cecchi <cosimoc@gnome.org>
+Date: Wed, 16 Nov 2011 22:38:45 +0000
+Subject: Revert "iconview: layout items immediately when setting a GtkTreeModel"
+
+It makes GtkIconView segfault on GTK 2.24.
+
+gtk_icon_view_expose() calls gtk_icon_view_layout() first thing if
+there's a layout queued anyway, so we wouldn't end up in the same
+situation causing the crash the original patch is supposed to fix.
+
+This reverts commit 5a03f4a6a50237d86959f596dda143dfc2f040d1.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=663138
+---
+diff --git a/gtk/gtkiconview.c b/gtk/gtkiconview.c
+index 62877fa..54b3f3b 100644
+--- a/gtk/gtkiconview.c
++++ b/gtk/gtkiconview.c
+@@ -5423,7 +5423,7 @@ gtk_icon_view_set_model (GtkIconView *icon_view,
+
+       gtk_icon_view_build_items (icon_view);
+
+-      gtk_icon_view_layout (icon_view);
++      gtk_icon_view_queue_layout (icon_view);
+     }
+
+   g_object_notify (G_OBJECT (icon_view), "model");
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index ec827a7..4e5b66f 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
            file://toggle-font.diff;striplevel=0 \
            file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
            file://doc-fixes.patch \
+           file://gtk_icon_view_layout-crash.patch \
 	  "
 
 # TO MERGE
@@ -27,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
-- 
1.7.3.4



