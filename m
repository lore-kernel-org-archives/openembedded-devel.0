Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4vTl-0005LE-8T
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 12:53:48 +0100
Received: (qmail 17601 invoked by uid 813007); 2 Nov 2009 11:52:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Nov 2009 11:52:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Nov 2009 12:55:54 +0100
Message-Id: <1257162955-28103-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] matchbox-config-gtk: sync with Poky
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
X-List-Received-Date: Mon, 02 Nov 2009 11:53:51 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

---
 conf/distro/include/sane-srcrevs.inc               |    1 +
 recipes/matchbox-config-gtk/files/no-handed.patch  |   33 ++++++++++++++++++++
 .../matchbox-config-gtk/matchbox-config-gtk_svn.bb |   11 ++++--
 3 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 recipes/matchbox-config-gtk/files/no-handed.patch

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 2f22a7d..94d641d 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -113,6 +113,7 @@ SRCREV_pn-madbutterfly ?= "ecd1842714b5e982f3138cbdd358517d57be6aa3"
 SRCREV_pn-maemo-mapper ?= "118"
 SRCREV_pn-mamonaim_e_applet ?= "51c747849f71981bd1dc9eb1807df4993ad97d04"
 SRCREV_pn-mamona_input_methods ?= "7e6a8cc947689a045d0fba90015da599275347d9"
+SRCREV_pn-matchbox-config-gtk ?= "1614"
 SRCREV_pn-matchbox-desktop-2 ?= "2096"
 SRCREV_pn-matchbox-keyboard ?= "1910"
 SRCREV_pn-matchbox-keyboard-inputmethod ?= "1910"
diff --git a/recipes/matchbox-config-gtk/files/no-handed.patch b/recipes/matchbox-config-gtk/files/no-handed.patch
new file mode 100644
index 0000000..9ab51ec
--- /dev/null
+++ b/recipes/matchbox-config-gtk/files/no-handed.patch
@@ -0,0 +1,33 @@
+Index: appearance/mb-appearance.c
+===================================================================
+--- appearance/mb-appearance.c	(revision 1614)
++++ appearance/mb-appearance.c	(working copy)
+@@ -300,11 +300,13 @@
+     gtk_font_button_set_font_name (GTK_FONT_BUTTON (font_button),
+                                    gconf_value_get_string (value));
+   } else if (strcmp (key, HANDED_KEY) == 0) {
++#if 0
+     GEnumValue *e;
+     e = g_enum_get_value_by_name (g_type_class_ref (GTK_TYPE_CORNER_TYPE),
+                                   gconf_value_get_string (value));
+     gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (handed_check),
+                                   e->value == GTK_CORNER_TOP_RIGHT);
++#endif
+   }
+ }
+ 
+@@ -395,12 +397,13 @@
+   gtk_container_add (GTK_CONTAINER (align), font_button);
+ 
+   /* Left/Right Handed */
+-  
++#if 0
+   frame = new_frame (_("Orientation"), &align);
+   gtk_box_pack_start (GTK_BOX (box), frame, TRUE, TRUE, 0);
+   handed_check = gtk_check_button_new_with_mnemonic (_("_Left-handed"));
+   g_signal_connect (handed_check, "toggled", G_CALLBACK (on_handed_set), NULL);
+   gtk_container_add (GTK_CONTAINER (align), handed_check);
++#endif
+ 
+   gconf_client_add_dir (gconf, INTERFACE_DIR, GCONF_CLIENT_PRELOAD_ONELEVEL, NULL);
+   g_signal_connect (gconf, "value-changed", G_CALLBACK (on_gconf_value_changed), NULL);
diff --git a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
index ec11e45..bc6c051 100644
--- a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
+++ b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
@@ -1,11 +1,14 @@
-DESCRIPTION = "Matchbox gtk theme configuration application."
+DESCRIPTION = "Matchbox GTK+ theme configuration application."
 LICENSE = "GPL"
-DEPENDS = "gconf libglade gtk+"
+DEPENDS = "gconf gtk+"
 RDEPENDS = "settings-daemon"
-PV = "0.0+svn${SRCDATE}"
+
+PV = "0.0+svnr${SRCREV}"
+
 S = "${WORKDIR}/${PN}"
 
-SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http"
+SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
+        file://no-handed.patch;patch=1;pnum=0"
 
 inherit autotools pkgconfig
 
-- 
1.6.5.2





