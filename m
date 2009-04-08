Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LrRrm-0000qs-Qp
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 09:06:41 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id E5DE01893D2; Wed,  8 Apr 2009 09:06:27 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 09:06:27 +0200
Message-Id: <1239174387-31686-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] e-wm-config-angstrom: refresh configs, add systray
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
X-List-Received-Date: Wed, 08 Apr 2009 07:06:42 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/angstrom/e-wm-config-angstrom.bb           |    9 +-
 recipes/angstrom/e-wm-config-angstrom/e.src        |  146 ++++++++++++--------
 .../e-wm-config-angstrom/module.cpufreq.src        |    4 +-
 .../e-wm-config-angstrom/module.places.src         |    6 +
 4 files changed, 103 insertions(+), 62 deletions(-)

diff --git a/recipes/angstrom/e-wm-config-angstrom.bb b/recipes/angstrom/e-wm-config-angstrom.bb
index a2c6f93..4b47e05 100644
--- a/recipes/angstrom/e-wm-config-angstrom.bb
+++ b/recipes/angstrom/e-wm-config-angstrom.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Enlightenment DR17 theme for Angstrom"
 LICENSE = "MIT/BSD"
 DEPENDS = "edje-native eet-native"
 RDEPENDS = "e-wm"
-RRECOMMENDS_${PN} = "places"
+RRECOMMENDS_${PN} = "places systray"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = " \
           file://e.src \
@@ -18,6 +18,11 @@ do_configure() {
 	cp ${WORKDIR}/*.src ${WORKDIR}/*.desktop ${WORKDIR}/*.png ${S}/
 }
 
+# [09:16:17] * koen mumbles something about binary config file
+# [09:16:19] <raster> eet -d e.cfg config e.src
+# [09:16:29] <raster> will get u a test dump of it (as e.src)
+# [09:17:09] <raster> eet -e e.cfg config e.src 1
+# [09:17:12] <raster> will re-encode 
 
 do_compile() {
 	for i in *.src ; do
diff --git a/recipes/angstrom/e-wm-config-angstrom/e.src b/recipes/angstrom/e-wm-config-angstrom/e.src
index 3351424..859323d 100644
--- a/recipes/angstrom/e-wm-config-angstrom/e.src
+++ b/recipes/angstrom/e-wm-config-angstrom/e.src
@@ -1,5 +1,5 @@
 group "E_Config" struct {
-  value "config_version" int: 65836;
+  value "config_version" int: 65839;
   value "show_splash" int: 0;
   value "init_default_theme" string: "default.edj";
   value "desktop_default_name" string: "Desktop %i, %i";
@@ -10,6 +10,7 @@ group "E_Config" struct {
   value "border_shade_transition" int: 3;
   value "border_shade_speed" double: 3000.0000000000000000000000000;
   value "framerate" double: 25.0000000000000000000000000;
+  value "priority" int: 0;
   value "image_cache" int: 4096;
   value "font_cache" int: 512;
   value "edje_cache" int: 32;
@@ -19,8 +20,6 @@ group "E_Config" struct {
   value "use_virtual_roots" int: 0;
   value "show_desktop_icons" int: 1;
   value "edge_flip_dragging" int: 1;
-  value "edge_flip_moving" int: 1;
-  value "edge_flip_timeout" double: 0.2500000000000000000000000;
   value "evas_engine_default" int: 1;
   value "evas_engine_container" int: 0;
   value "evas_engine_init" int: 0;
@@ -43,15 +42,15 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "start";
+      value "name" string: "syscon";
       value "enabled" uchar: 1;
-      value "delayed" uchar: 0;
+      value "delayed" uchar: 1;
       value "priority" int: 0;
     }
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "ibar";
+      value "name" string: "msgbus_lang";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -59,7 +58,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "ibox";
+      value "name" string: "connman";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -67,7 +66,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "clock";
+      value "name" string: "places";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -75,7 +74,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "cpufreq";
+      value "name" string: "mixer";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -83,15 +82,15 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "pager";
+      value "name" string: "conf_window_remembers";
       value "enabled" uchar: 1;
-      value "delayed" uchar: 0;
+      value "delayed" uchar: 1;
       value "priority" int: 0;
     }
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "exebuf";
+      value "name" string: "conf_scale";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -99,7 +98,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "winlist";
+      value "name" string: "conf_interaction";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -107,7 +106,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf";
+      value "name" string: "fileman";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -115,7 +114,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_applications";
+      value "name" string: "conf_engine";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -123,7 +122,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_borders";
+      value "name" string: "conf_winlist";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -131,7 +130,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_clientlist";
+      value "name" string: "conf_window_manipulation";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -139,7 +138,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_colors";
+      value "name" string: "conf_window_focus";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -147,7 +146,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_desk";
+      value "name" string: "conf_window_display";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -155,7 +154,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_desklock";
+      value "name" string: "conf_wallpaper";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -163,7 +162,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_desks";
+      value "name" string: "conf_transitions";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -171,7 +170,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_dialogs";
+      value "name" string: "conf_theme";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -179,7 +178,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_display";
+      value "name" string: "conf_startup";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -187,7 +186,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_dpms";
+      value "name" string: "conf_shelves";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -195,7 +194,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_exebuf";
+      value "name" string: "conf_screensaver";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -203,7 +202,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_fonts";
+      value "name" string: "conf_profiles";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -211,7 +210,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_icon_theme";
+      value "name" string: "conf_performance";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -219,7 +218,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_imc";
+      value "name" string: "conf_paths";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -227,7 +226,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_intl";
+      value "name" string: "conf_mouse_cursor";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -235,7 +234,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_keybindings";
+      value "name" string: "conf_mousebindings";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -243,7 +242,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_menus";
+      value "name" string: "conf_mouse";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -259,7 +258,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_mouse";
+      value "name" string: "conf_menus";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -267,7 +266,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_mousebindings";
+      value "name" string: "conf_keybindings";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -275,7 +274,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_mouse_cursor";
+      value "name" string: "conf_intl";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -283,7 +282,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_paths";
+      value "name" string: "conf_imc";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -291,7 +290,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_performance";
+      value "name" string: "conf_icon_theme";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -299,7 +298,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_profiles";
+      value "name" string: "conf_fonts";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -307,7 +306,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_screensaver";
+      value "name" string: "conf_exebuf";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -315,7 +314,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_shelves";
+      value "name" string: "conf_dpms";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -323,7 +322,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_startup";
+      value "name" string: "conf_display";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -331,7 +330,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_theme";
+      value "name" string: "conf_dialogs";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -339,7 +338,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_transitions";
+      value "name" string: "conf_desks";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -347,7 +346,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_wallpaper";
+      value "name" string: "conf_desklock";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -355,7 +354,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_window_display";
+      value "name" string: "conf_desk";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -363,7 +362,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_window_focus";
+      value "name" string: "conf_colors";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -371,7 +370,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_window_manipulation";
+      value "name" string: "conf_clientlist";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -379,7 +378,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_winlist";
+      value "name" string: "conf_borders";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -387,7 +386,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_engine";
+      value "name" string: "conf_applications";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -395,7 +394,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "fileman";
+      value "name" string: "conf";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -403,7 +402,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_interaction";
+      value "name" string: "winlist";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -411,7 +410,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_scale";
+      value "name" string: "exebuf";
       value "enabled" uchar: 1;
       value "delayed" uchar: 1;
       value "priority" int: 0;
@@ -419,15 +418,15 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "conf_window_remembers";
+      value "name" string: "pager";
       value "enabled" uchar: 1;
-      value "delayed" uchar: 1;
+      value "delayed" uchar: 0;
       value "priority" int: 0;
     }
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "mixer";
+      value "name" string: "cpufreq";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -435,7 +434,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "places";
+      value "name" string: "clock";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -443,7 +442,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "connman";
+      value "name" string: "ibox";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -451,7 +450,7 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "msgbus_lang";
+      value "name" string: "ibar";
       value "enabled" uchar: 1;
       value "delayed" uchar: 0;
       value "priority" int: 0;
@@ -459,9 +458,17 @@ group "E_Config" struct {
   }
   group "modules" list {
     group "E_Config_Module" struct {
-      value "name" string: "syscon";
+      value "name" string: "start";
       value "enabled" uchar: 1;
-      value "delayed" uchar: 1;
+      value "delayed" uchar: 0;
+      value "priority" int: 0;
+    }
+  }
+  group "modules" list {
+    group "E_Config_Module" struct {
+      value "name" string: "systray";
+      value "enabled" uchar: 1;
+      value "delayed" uchar: 0;
       value "priority" int: 0;
     }
   }
@@ -1655,6 +1662,25 @@ group "E_Config" struct {
           value "resizable" uchar: 0;
         }
       }
+      group "clients" list {
+        group "E_Config_Gadcon_Client" struct {
+          value "name" string: "systray";
+          value "id" string: "systray";
+          value "geom.pos" int: 720;
+          value "geom.size" int: 80;
+          value "geom.res" int: 800;
+          value "geom.pos_x" double: 0.0000000000000000000000000;
+          value "geom.pos_y" double: 0.0000000000000000000000000;
+          value "geom.size_w" double: 0.0000000000000000000000000;
+          value "geom.size_h" double: 0.0000000000000000000000000;
+          value "state_info.seq" int: 10;
+          value "state_info.flags" int: 0;
+          value "style" string: "inset";
+          value "orient" int: 0;
+          value "autoscroll" uchar: 0;
+          value "resizable" uchar: 0;
+        }
+      }
     }
   }
   group "gadcons" list {
@@ -1956,7 +1982,9 @@ group "E_Config" struct {
   value "border_raise_on_mouse_action" int: 1;
   value "border_raise_on_focus" int: 1;
   value "desk_flip_wrap" int: 0;
+  value "fullscreen_flip" int: 0;
   value "icon_theme" string: "gnome";
+  value "icon_theme_overrides" uchar: 0;
   value "desk_flip_animate_mode" int: 1;
   value "desk_flip_animate_interpolation" int: 0;
   value "desk_flip_animate_time" double: 0.2000000000000000111022302;
diff --git a/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src b/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
index 5c97994..c782ac2 100644
--- a/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
+++ b/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
@@ -1,4 +1,6 @@
 group "Cpufreq_Config" struct {
+  value "config_version" int: 1;
   value "poll_interval" int: 32;
-  value "restore_governor" int: 1;
+  value "restore_governor" int: 0;
+  value "auto_powersave" int: 1;
 }
diff --git a/recipes/angstrom/e-wm-config-angstrom/module.places.src b/recipes/angstrom/e-wm-config-angstrom/module.places.src
index 4fb01da..57e941f 100644
--- a/recipes/angstrom/e-wm-config-angstrom/module.places.src
+++ b/recipes/angstrom/e-wm-config-angstrom/module.places.src
@@ -15,4 +15,10 @@ group "Config" struct {
       value "switch2" int: 0;
     }
   }
+  value "show_home" uchar: 0;
+  value "show_desk" uchar: 0;
+  value "show_trash" uchar: 0;
+  value "show_root" uchar: 0;
+  value "show_temp" uchar: 0;
+  value "show_bookm" uchar: 0;
 }
-- 
1.5.6.5



