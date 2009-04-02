Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpGej-0000qK-Uc
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 08:44:08 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 005A1189361; Thu,  2 Apr 2009 08:44:11 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 08:44:11 +0200
Message-Id: <1238654651-7091-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] places: add patch to fix API change introduced by SRCREV bump
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
X-List-Received-Date: Thu, 02 Apr 2009 06:44:10 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/e17/places/fix-api.diff |   53 +++++++++++++++++++++++++++++++++++++++
 recipes/e17/places_svn.bb       |    4 ++-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 recipes/e17/places/fix-api.diff

diff --git a/recipes/e17/places/fix-api.diff b/recipes/e17/places/fix-api.diff
new file mode 100644
index 0000000..ef09d25
--- /dev/null
+++ b/recipes/e17/places/fix-api.diff
@@ -0,0 +1,53 @@
+Index: trunk/E-MODULES-EXTRA/places/src/e_mod_places.c
+===================================================================
+--- trunk/E-MODULES-EXTRA/places/src/e_mod_places.c (revision 39774)
++++ trunk/E-MODULES-EXTRA/places/src/e_mod_places.c (revision 39830)
+@@ -371,5 +371,5 @@
+                e_menu_item_label_set(mi, alias ? alias :
+                                         ecore_file_file_get(uri->path));
+-               e_util_menu_item_icon_theme_set(mi, "folder");
++               e_util_menu_item_theme_icon_set(mi, "folder");
+                e_menu_item_callback_set(mi, _places_run_fm, strdup(uri->path)); //TODO free somewhere
+             }
+@@ -398,5 +398,5 @@
+       mi = e_menu_item_new(em);
+       e_menu_item_label_set(mi, D_("Home"));
+-      e_util_menu_item_icon_theme_set(mi, "user-home");
++      e_util_menu_item_theme_icon_set(mi, "user-home");
+       e_menu_item_callback_set(mi, _places_run_fm, (char*)e_user_homedir_get());
+    }
+@@ -407,5 +407,5 @@
+       mi = e_menu_item_new(em);
+       e_menu_item_label_set(mi, D_("Desktop"));
+-      e_util_menu_item_icon_theme_set(mi, "user-desktop");
++      e_util_menu_item_theme_icon_set(mi, "user-desktop");
+       snprintf(buf, sizeof(buf), "%s/Desktop", (char*)e_user_homedir_get());
+       e_menu_item_callback_set(mi, _places_run_fm, strdup(buf)); //TODO free somewhere
+@@ -417,5 +417,5 @@
+       mi = e_menu_item_new(em);
+       e_menu_item_label_set(mi, D_("Trash"));
+-      e_util_menu_item_icon_theme_set(mi, "folder");
++      e_util_menu_item_theme_icon_set(mi, "folder");
+       e_menu_item_callback_set(mi, _places_run_fm, "trash:///");
+    }
+@@ -426,5 +426,5 @@
+       mi = e_menu_item_new(em);
+       e_menu_item_label_set(mi, D_("Filesystem"));
+-      e_util_menu_item_icon_theme_set(mi, "drive-harddisk");
++      e_util_menu_item_theme_icon_set(mi, "drive-harddisk");
+       e_menu_item_callback_set(mi, _places_run_fm, "/");
+    }
+@@ -435,5 +435,5 @@
+       mi = e_menu_item_new(em);
+       e_menu_item_label_set(mi, D_("Temp"));
+-      e_util_menu_item_icon_theme_set(mi, "user-temp");
++      e_util_menu_item_theme_icon_set(mi, "user-temp");
+       e_menu_item_callback_set(mi, _places_run_fm, "/tmp");
+    }
+@@ -498,5 +498,5 @@
+    mi = e_menu_item_new(em);
+    e_menu_item_label_set(mi, D_("Places"));
+-   e_util_menu_item_icon_theme_set(mi, "system-file-manager");
++   e_util_menu_item_theme_icon_set(mi, "system-file-manager");
+ 
+    m = e_menu_new();
diff --git a/recipes/e17/places_svn.bb b/recipes/e17/places_svn.bb
index dc0961f..4aeaed2 100644
--- a/recipes/e17/places_svn.bb
+++ b/recipes/e17/places_svn.bb
@@ -1,10 +1,12 @@
 LICENSE = "GPLv3 LGPLv3"
 PV = "0.1.0+svnr${SRCREV}"
 
-PR = "r2"
+PR = "r3"
 
 require e-module.inc
 
+SRC_URI += "file://fix-api.diff;patch=1;maxrev=39830;pnum=3"
+
 # Calls /usr/bin/eject for media
 RRECOMMENDS_${PN} += "eject"
 
-- 
1.5.6.5



