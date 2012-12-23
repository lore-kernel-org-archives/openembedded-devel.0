Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRC-0004cU-Ku
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ee0-f51.google.com with SMTP id d4so3116635eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=GXG3fGgAWSD5RWT69QKbZ7o1EGHKS6L6jdng5ecxP2c=;
	b=GuX1oqHBN4e/DzAt4th5pvW9VgNqlZ8lw+T7ZQFb2gQUYQR+ek2yUTgeiPiScEcZ9n
	Nu7uFxl3DpRLchMBX6XJ52z3xKuiJbHNy8s2hrs3KqNJke0WqoY4xSx8B8XQZ12Go35Z
	AtRnr8lxLwejhnAKlCOO+NM/XKocVrnTzlwJAmuYTk7tWqNFjYLWZ0Fok/DSOkM+8kG8
	tvWx/SmuGJB2nOLKxgtpjACnj36+pCJrVGEqG15uNDybp1zVk4ifC92dzF4jBSp3VRvQ
	3kYTZg5Jw7okVY1QyvwwU8GNt471YYAuy+dO8nMkaxl5UUJmvd5K6335E7sj0+bNImdj
	zZew==
X-Received: by 10.14.178.196 with SMTP id f44mr48255960eem.14.1356267786111;
	Sun, 23 Dec 2012 05:03:06 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:36 +0100
Message-Id: <1356267761-15152-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 07/12] xfce4-settings: update to 4.11.0
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this is a development release:
* tests did not show errors
* the new option to store default keyboard layout makes it worth to update

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ngs-dialog-add-touchscreen-pointer-option.patch |  117 ++++++++++----------
 ...gsHelper-gets-a-property-touchscreen-poin.patch |    8 +-
 ...settings_4.10.0.bb => xfce4-settings_4.11.0.bb} |    5 +-
 3 files changed, 62 insertions(+), 68 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.10.0.bb => xfce4-settings_4.11.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
index 4151c3d..d5a1f2c 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
@@ -149,10 +149,10 @@ index d3aab0d..573c551 100644
                                  </child>
                                </object>
 diff --git a/dialogs/mouse-settings/mouse-dialog_ui.h b/dialogs/mouse-settings/mouse-dialog_ui.h
-index 9e0c267..8a68c3b 100644
+index 59806a2..8a68c3b 100644
 --- a/dialogs/mouse-settings/mouse-dialog_ui.h
 +++ b/dialogs/mouse-settings/mouse-dialog_ui.h
-@@ -31,545 +31,555 @@ static const char mouse_dialog_ui[] =
+@@ -31,540 +31,555 @@ static const char mouse_dialog_ui[] =
    "</property></object><object class=\"GtkImage\" id=\"image5\"><property "
    "name=\"visible\">True</property><property name=\"can_focus\">False</pro"
    "perty><property name=\"stock\">gtk-revert-to-saved</property></object><"
@@ -479,51 +479,21 @@ index 9e0c267..8a68c3b 100644
 -  "operty name=\"spacing\">6</property><child><object class=\"GtkHBox\" id"
 -  "=\"hbox4\"><property name=\"visible\">True</property><property name=\"c"
 -  "an_focus\">False</property><property name=\"spacing\">12</property><chi"
--  "ld><object class=\"GtkRadioButton\" id=\"synaptics-scroll-no\"><propert"
--  "y name=\"label\" translatable=\"yes\">Di_sabled</property><property nam"
--  "e=\"visible\">True</property><property name=\"can_focus\">True</propert"
--  "y><property name=\"receives_default\">False</property><property name=\""
--  "use_action_appearance\">False</property><property name=\"use_underline\""
--  ">True</property><property name=\"active\">True</property><property name"
--  "=\"draw_indicator\">True</property></object><packing><property name=\"e"
--  "xpand\">False</property><property name=\"fill\">True</property><propert"
-+  "efault\">False</property><property name=\"use_underline\">True</propert"
-+  "y><property name=\"active\">True</property><property name=\"draw_indica"
-+  "tor\">True</property></object><packing><property name=\"expand\">False<"
-+  "/property><property name=\"fill\">True</property><property name=\"posit"
-+  "ion\">0</property></packing></child><child><object class=\"GtkRadioButt"
-+  "on\" id=\"device-left-handed\"><property name=\"label\" translatable=\""
-+  "yes\">Le_ft-handed</property><property name=\"use_action_appearance\">F"
-+  "alse</property><property name=\"visible\">True</property><property name"
-+  "=\"can_focus\">True</property><property name=\"receives_default\">False"
-+  "</property><property name=\"use_underline\">True</property><property na"
-+  "me=\"draw_indicator\">True</property><property name=\"group\">device-ri"
-+  "ght-handed</property></object><packing><property name=\"expand\">False<"
-+  "/property><property name=\"fill\">True</property><property name=\"posit"
-+  "ion\">1</property></packing></child></object><packing><property name=\""
-+  "expand\">True</property><property name=\"fill\">True</property><propert"
-   "y name=\"position\">0</property></packing></child><child><object class="
--  "\"GtkRadioButton\" id=\"synaptics-scroll-edge\"><property name=\"label\""
--  " translatable=\"yes\">Edge scro_lling</property><property name=\"visibl"
-+  "\"GtkCheckButton\" id=\"device-reverse-scrolling\"><property name=\"lab"
-+  "el\" translatable=\"yes\">Reverse scroll d_irection</property><property"
-+  " name=\"use_action_appearance\">False</property><property name=\"visibl"
-   "e\">True</property><property name=\"can_focus\">True</property><propert"
--  "y name=\"receives_default\">False</property><property name=\"use_action"
--  "_appearance\">False</property><property name=\"use_underline\">True</pr"
--  "operty><property name=\"draw_indicator\">True</property><property name="
--  "\"group\">synaptics-scroll-no</property></object><packing><property nam"
--  "e=\"expand\">False</property><property name=\"fill\">True</property><pr"
--  "operty name=\"position\">1</property></packing></child><child><object c"
--  "lass=\"GtkRadioButton\" id=\"synaptics-scroll-two\"><property name=\"la"
--  "bel\" translatable=\"yes\">Two-_finger scrolling</property><property na"
--  "me=\"visible\">True</property><property name=\"can_focus\">True</proper"
--  "ty><property name=\"receives_default\">False</property><property name=\""
--  "use_action_appearance\">False</property><property name=\"use_underline\""
--  ">True</property><property name=\"draw_indicator\">True</property><prope"
--  "rty name=\"group\">synaptics-scroll-no</property></object><packing><pro"
+-  "ld><object class=\"GtkLabel\" id=\"label23\"><property name=\"visible\""
+-  ">True</property><property name=\"can_focus\">False</property><property "
+-  "name=\"xalign\">0</property><property name=\"label\" translatable=\"yes"
+-  "\">Scro_lling mode:</property><property name=\"use_underline\">True</pr"
+-  "operty><property name=\"mnemonic_widget\">synaptics-scroll</property></"
+-  "object><packing><property name=\"expand\">False</property><property nam"
+-  "e=\"fill\">True</property><property name=\"position\">0</property></pac"
+-  "king></child><child><object class=\"GtkComboBox\" id=\"synaptics-scroll"
+-  "\"><property name=\"visible\">True</property><property name=\"can_focus"
+-  "\">False</property><property name=\"model\">synaptics-scroll-store</pro"
+-  "perty><child><object class=\"GtkCellRendererText\" id=\"cellrenderertex"
+-  "t3\"/><attributes><attribute name=\"text\">0</attribute><attribute name"
+-  "=\"sensitive\">1</attribute></attributes></child></object><packing><pro"
 -  "perty name=\"expand\">True</property><property name=\"fill\">True</prop"
--  "erty><property name=\"position\">2</property></packing></child></object"
+-  "erty><property name=\"position\">1</property></packing></child></object"
 -  "><packing><property name=\"expand\">True</property><property name=\"fil"
 -  "l\">True</property><property name=\"position\">0</property></packing></"
 -  "child><child><object class=\"GtkCheckButton\" id=\"synaptics-scroll-hor"
@@ -550,6 +520,26 @@ index 9e0c267..8a68c3b 100644
 -  "ty></object><packing><property name=\"position\">1</property><property "
 -  "name=\"tab_fill\">False</property></packing></child><child><object clas"
 -  "s=\"GtkVBox\" id=\"wacom-tab\"><property name=\"visible\">True</propert"
++  "efault\">False</property><property name=\"use_underline\">True</propert"
++  "y><property name=\"active\">True</property><property name=\"draw_indica"
++  "tor\">True</property></object><packing><property name=\"expand\">False<"
++  "/property><property name=\"fill\">True</property><property name=\"posit"
++  "ion\">0</property></packing></child><child><object class=\"GtkRadioButt"
++  "on\" id=\"device-left-handed\"><property name=\"label\" translatable=\""
++  "yes\">Le_ft-handed</property><property name=\"use_action_appearance\">F"
++  "alse</property><property name=\"visible\">True</property><property name"
++  "=\"can_focus\">True</property><property name=\"receives_default\">False"
++  "</property><property name=\"use_underline\">True</property><property na"
++  "me=\"draw_indicator\">True</property><property name=\"group\">device-ri"
++  "ght-handed</property></object><packing><property name=\"expand\">False<"
++  "/property><property name=\"fill\">True</property><property name=\"posit"
++  "ion\">1</property></packing></child></object><packing><property name=\""
++  "expand\">True</property><property name=\"fill\">True</property><propert"
++  "y name=\"position\">0</property></packing></child><child><object class="
++  "\"GtkCheckButton\" id=\"device-reverse-scrolling\"><property name=\"lab"
++  "el\" translatable=\"yes\">Reverse scroll d_irection</property><property"
++  " name=\"use_action_appearance\">False</property><property name=\"visibl"
++  "e\">True</property><property name=\"can_focus\">True</property><propert"
 +  "y name=\"receives_default\">False</property><property name=\"tooltip_te"
 +  "xt\" translatable=\"yes\">When selected, the scroll wheel will work in "
 +  "the opposite direction</property><property name=\"use_underline\">True<"
@@ -1116,19 +1106,26 @@ index 9e0c267..8a68c3b 100644
 -  "roperty name=\"lower\">16</property><property name=\"upper\">48</proper"
 -  "ty><property name=\"value\">24</property><property name=\"step_incremen"
 -  "t\">1</property><property name=\"page_increment\">11</property></object"
--  "><object class=\"GtkListStore\" id=\"wacom-mode-store\"><columns><colum"
--  "n type=\"gchararray\"/><column type=\"gchararray\"/></columns><data><ro"
--  "w><col id=\"0\">ABSOLUTE</col><col id=\"1\" translatable=\"yes\">Pen (a"
--  "bsolute)</col></row><row><col id=\"0\">RELATIVE</col><col id=\"1\" tran"
--  "slatable=\"yes\">Mouse (relative)</col></row></data></object><object cl"
--  "ass=\"GtkListStore\" id=\"wacom-rotation-store\"><columns><column type="
--  "\"gint\"/><column type=\"gchararray\"/></columns><data><row><col id=\"0"
--  "\">0</col><col id=\"1\" translatable=\"yes\">None (right-handed)</col><"
--  "/row><row><col id=\"0\">3</col><col id=\"1\" translatable=\"yes\">Half "
--  "(left-handed)</col></row><row><col id=\"0\">1</col><col id=\"1\" transl"
--  "atable=\"yes\">Clockwise</col></row><row><col id=\"0\">2</col><col id=\""
--  "1\" translatable=\"yes\">Counterclockwise</col></row></data></object></"
--  "interface>"
+-  "><object class=\"GtkListStore\" id=\"synaptics-scroll-store\"><columns>"
+-  "<column type=\"gchararray\"/><column type=\"gboolean\"/></columns><data"
+-  "><row><col id=\"0\" translatable=\"yes\">Disabled</col><col id=\"1\">Tr"
+-  "ue</col></row><row><col id=\"0\" translatable=\"yes\">Edge scrolling</c"
+-  "ol><col id=\"1\">True</col></row><row><col id=\"0\" translatable=\"yes\""
+-  ">Two-finger scrolling</col><col id=\"1\">True</col></row><row><col id=\""
+-  "0\" translatable=\"yes\">Circular scrolling</col><col id=\"1\">True</co"
+-  "l></row></data></object><object class=\"GtkListStore\" id=\"wacom-mode-"
+-  "store\"><columns><column type=\"gchararray\"/><column type=\"gchararray"
+-  "\"/></columns><data><row><col id=\"0\">ABSOLUTE</col><col id=\"1\" tran"
+-  "slatable=\"yes\">Pen (absolute)</col></row><row><col id=\"0\">RELATIVE<"
+-  "/col><col id=\"1\" translatable=\"yes\">Mouse (relative)</col></row></d"
+-  "ata></object><object class=\"GtkListStore\" id=\"wacom-rotation-store\""
+-  "><columns><column type=\"gint\"/><column type=\"gchararray\"/></columns"
+-  "><data><row><col id=\"0\">0</col><col id=\"1\" translatable=\"yes\">Non"
+-  "e (right-handed)</col></row><row><col id=\"0\">3</col><col id=\"1\" tra"
+-  "nslatable=\"yes\">Half (left-handed)</col></row><row><col id=\"0\">1</c"
+-  "ol><col id=\"1\" translatable=\"yes\">Clockwise</col></row><row><col id"
+-  "=\"0\">2</col><col id=\"1\" translatable=\"yes\">Counterclockwise</col>"
+-  "</row></data></object></interface>"
 +  "l\" translatable=\"yes\">_Behavior</property><property name=\"use_under"
 +  "line\">True</property></object><packing><property name=\"position\">1</"
 +  "property><property name=\"tab_fill\">False</property></packing></child>"
@@ -1228,7 +1225,7 @@ index 9e0c267..8a68c3b 100644
 +  "nterface>"
  };
  
--static const unsigned mouse_dialog_ui_length = 37918u;
+-static const unsigned mouse_dialog_ui_length = 37588u;
 +static const unsigned mouse_dialog_ui_length = 38582u;
  
 -- 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
index 180ccfd..cacb5c3 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
@@ -235,17 +235,15 @@ index 7657465..76bcea1 100644
      XCloseDisplay (xdisplay);
  
      if (gdk_error_trap_pop () != 0)
-diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index 0a579d6..baa413c 100644
 --- a/xfsettingsd/xsettings.xml
 +++ b/xfsettingsd/xsettings.xml
-@@ -41,5 +41,6 @@
+@@ -36,5 +36,6 @@
      <property name="MenuBarAccel" type="string" value="F10"/>
      <property name="CursorThemeName" type="string" value=""/>
      <property name="CursorThemeSize" type="int" value="0"/>
 +    <property name="TouchscreenMode" type="bool" value="false"/>
-     <property name="IMModule" type="string" value=""/>
    </property>
-</channel>-- 
+ </channel>
+-- 
 1.7.6.5
 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
index aa878ae..c5cb033 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
@@ -3,7 +3,6 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
-PR = "r3"
 
 inherit xfce
 
@@ -18,8 +17,8 @@ SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
             file://touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch \
             file://touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch \
 "
-SRC_URI[md5sum] = "cc4dd9179ead9046c056431f01a12000"
-SRC_URI[sha256sum] = "0843f09ba9673f1d1b5df8dce4a17b63c183a9ba3be75fb6ef99a67fc8c1f77e"
+SRC_URI[md5sum] = "3bf42281b64b10b2691008cd693f7dbd"
+SRC_URI[sha256sum] = "4a4f1e79a58b524f3a6dd030b6fc687671b35566f847e6f516c6f84211191698"
 
 FILES_${PN} += "${libdir}/xfce4"
 
-- 
1.7.4.4



