Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 11F29768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:27 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so182969126wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Tr61hM6CdhG3ZMtAV8Oy/F92jtGkPXmdnSD4cDmbXDM=;
	b=L0CgpBqMatG6vpTNFRKpQ2SFm7GfjZ5ZGAcUUF5sM2h3KfnMY1z7W6UjWzDkOQJ7kR
	JDPPTpbAcfEdYYIRRgVcx22/AruquZvOT+o/dZgRS63liUPY6twIzyxg4UxFVNiOmFSy
	9csVhMxd7uj7ymQiUnoAqdg4roDoxLR4qG2Zo522IcDPoEWgzylWSOvBxq2ZvUWF0MAo
	ye9CiMQNJp8x5D38oqnRmIfx9FiGSvmg08Xsys3Z8Zax/JaQ+OrCLSCPH+A2ejAksAp9
	azVphuMZRo06WaBtBs/zOxcSzOZxq3QHTo31AivyGzOhkh7HyaKJUDP8lOy5NVazEN32
	+uzg==
X-Received: by 10.180.186.34 with SMTP id fh2mr34380526wic.94.1439279907608;
	Tue, 11 Aug 2015 00:58:27 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:39 +0200
Message-Id: <1439279859-1815-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 17/17] xfce4-settings: get option to hide mousepointer for (touch) input devices back
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All patches used in oe were added to the git repo. This makes life easier
for next versions coming up and helps getting binary mouse cursors applied.

To make clear, what the git repo contains a note in the recipe was added.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ttings.xml-remove-trouble-causing-comment.patch |  31 --
 .../0002-xsettings.xml-Set-default-themes.patch    |  32 --
 .../0001-add-cursor-theme-xfce-invisible.patch     | 248 ---------
 ...ngs-dialog-add-touchscreen-pointer-option.patch | 152 ------
 ...sHelper-gets-a-pointer-to-XfceXSettingsHe.patch | 137 -----
 ...gsHelper-gets-a-property-touchscreen-poin.patch | 249 ---------
 ...tect-a-change-of-pointer-device-used-and-.patch | 589 ---------------------
 .../xfce4-settings/touchscreen/invisible           | Bin 4160 -> 0 bytes
 .../xfce4-settings/xfce4-settings/touchscreen/wait | Bin 126096 -> 0 bytes
 .../xfce4-settings/xfce4-settings_git.bb           |  11 +-
 10 files changed, 6 insertions(+), 1443 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
deleted file mode 100644
index f926a93..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a84a7a6537544cdf56e1d4cad47a4cf002964039 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 20 May 2012 15:20:08 +0200
-Subject: [PATCH 1/2] xsettings.xml: remove trouble causing comment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Upstream-Status: Pending
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- xfsettingsd/xsettings.xml |    5 -----
- 1 files changed, 0 insertions(+), 5 deletions(-)
-
-diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index 8f9e2eb..49a4c1e 100644
---- a/xfsettingsd/xsettings.xml
-+++ b/xfsettingsd/xsettings.xml
-@@ -1,8 +1,3 @@
--<!--
--  Default values for the X settings registry as described in
--  http://www.freedesktop.org/wiki/Specifications/XSettingsRegistry
---->
--
- <?xml version="1.0" encoding="UTF-8"?>
- <channel name="xsettings" version="1.0">
-   <property name="Net" type="empty">
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
deleted file mode 100644
index 44478e6..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 071a390ba09a8a412f73d295be81a805804a1f24 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 20 May 2012 15:22:09 +0200
-Subject: [PATCH 2/2] xsettings.xml: Set default themes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Upstram status:  Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- xfsettingsd/xsettings.xml |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index 49a4c1e..5ec94e9 100644
---- a/xfsettingsd/xsettings.xml
-+++ b/xfsettingsd/xsettings.xml
-@@ -1,8 +1,8 @@
- <?xml version="1.0" encoding="UTF-8"?>
- <channel name="xsettings" version="1.0">
-   <property name="Net" type="empty">
--    <property name="ThemeName" type="empty"/>
--    <property name="IconThemeName" type="empty"/>
-+    <property name="ThemeName" type="string" value="Xfce"/>
-+    <property name="IconThemeName" type="string" value="gnome"/>
-     <property name="DoubleClickTime" type="int" value="400"/>
-     <property name="DoubleClickDistance" type="int" value="5"/>
-     <property name="DndDragThreshold" type="int" value="8"/>
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
deleted file mode 100644
index 5de14fc..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 4be18d7c8f2ac72b402dcbe8385922638fcd0a89 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 30 Oct 2012 13:14:11 +0100
-Subject: [PATCH 1/5] add cursor-theme "xfce-invisible"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Upstream-Status: Submitted [1]
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
----
- Makefile.am         |    1 +
- configure.ac.in        |    2 +
- cursors/Makefile.am |  178 +++++++++++++++++++++++++++++++++++++++++++++++++++
- cursors/index.theme |    3 +
- 6 files changed, 184 insertions(+), 0 deletions(-)
- create mode 100644 cursors/Makefile.am
- create mode 100644 cursors/index.theme
-
-diff --git a/Makefile.am b/Makefile.am
-index 3060bac..3f0dd1d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,7 @@
- # $Id$
- 
- SUBDIRS = \
-+	cursors \
- 	dialogs \
- 	xfce4-settings-manager \
- 	xfce4-settings-editor \
-diff --git a/configure.ac.in b/configure.ac.in
-index 0e7907d..1378049 100644
---- a/configure.ac.in
-+++ b/configure.ac.in
-@@ -157,6 +157,7 @@ dnl *** Optional support for Xcursor ***
- dnl ************************************
- XDT_CHECK_OPTIONAL_PACKAGE([XCURSOR], [xcursor], [1.1.0],
-                            [xcursor], [Cursor themes support])
-+AC_SUBST(cursordir, "\${datadir}/icons/xfce-invisible/cursors")
- 
- dnl ****************************************
- dnl *** Optional support for Libxklavier ***
-@@ -232,6 +233,7 @@ AC_SUBST([PLATFORM_LDFLAGS])
- AC_OUTPUT([
- Makefile
- po/Makefile.in
-+cursors/Makefile
- dialogs/Makefile
- dialogs/appearance-settings/Makefile
- dialogs/accessibility-settings/Makefile
-diff --git a/cursors/Makefile.am b/cursors/Makefile.am
-new file mode 100644
-index 0000000..c9e5a9f
---- /dev/null
-+++ b/cursors/Makefile.am
-@@ -0,0 +1,178 @@
-+CURSOR_NAMES_INVISIBLE = \
-+	00008160000006810000408080010102 \
-+	028006030e0e7ebffc7f7070c0600140 \
-+	2870a09082c103050810ffdffffe0204 \
-+	03b6e0fcb3499374a867c041f52298f0 \
-+	0876e1c15ff2fc01f906f1c363074c0f \
-+	08ffe1cb5fe6fc01f906f1c063814ccf \
-+	08ffe1e65f80fcfdf9fff11263e74c48 \
-+	1001208387f90000800003000700f6ff \
-+	1081e37283d90000800003c07f3ef6bf \
-+	14fef782d02440884392942c11205230 \
-+	208530c400c041818281048008011002 \
-+	3085a0e285430894940527032f8b26df \
-+	4498f0e0c1937ffe01fd06f973665830 \
-+	5aca4d189052212118709018842178c0 \
-+	5c6cd98b3f3ebcb1f9c7f1c204630408 \
-+	6407b0e94181790501fd1e167b474872 \
-+	640fb0e74195791501fd1ed57b41487f \
-+	9081237383d90e509aa00f00170e968f \
-+	9d800788f1b08800ae810202380a0822 \
-+	a2a266d0498c3104214a47bd64ab0fc8 \
-+	b66166c04f8c3109214a4fbd64a50fc8 \
-+	c7088f0f3e6c8088236ef8e1e3e70000 \
-+	d9ce0ab605698f320427677b458ad60b \
-+	e29285e634086352946a0e7090d73106 \
-+	f41c0e382c94c0958e07017e42b00462 \
-+	f41c0e382c97c0938e07017e42800402 \
-+	fcf1c3c7cd4491d801f1e1c78f100000 \
-+	fcf21c00b30f7e3f83fe0dfd12e71cff \
-+	alias \
-+	all-scroll \
-+	arrow \
-+	base_arrow_down \
-+	base_arrow_up \
-+	based_arrow_down \
-+	based_arrow_up \
-+	bd_double_arrow \
-+	boat \
-+	bottom_left_corner \
-+	bottom_right_corner \
-+	bottom_side \
-+	bottom_tee \
-+	cell \
-+	center_ptr \
-+	circle \
-+	closedhand \
-+	color-picker \
-+	col-resize \
-+	copy \
-+	cross \
-+	cross_reverse \
-+	crossed_circle \
-+	crosshair \
-+	default \
-+	diamond_cross \
-+	dnd-ask \
-+	dnd-copy \
-+	dnd-link \
-+	dnd-move \
-+	dnd-no-drop \
-+	dnd-none \
-+	dot \
-+	dot_box_mask \
-+	dotbox \
-+	double_arrow \
-+	down_arrow \
-+	draft_large  \
-+	draft_small  \
-+	draped_box   \
-+	e-resize \
-+	ew-resize \
-+	exchange     \
-+	fd_double_arrow \
-+	fleur \
-+	forbidden \
-+	grab \
-+	grabbing \
-+	gumby \
-+	h_double_arrow \
-+	hand \
-+	hand1 \
-+	hand2 \
-+	help \
-+	ibeam \
-+	icon \
-+	left_arrow \
-+	left_ptr \
-+	left_side \
-+	left_tee  \
-+	link \
-+	ll_angle  \
-+	lr_angle  \
-+	move      \
-+	ne-resize \
-+	nesw-resize \
-+	no-drop \
-+	not-allowed \
-+	n-resize \
-+	ns-resize \
-+	nw-resize \
-+	nwse-resize \
-+	openhand \
-+	pencil    \
-+	pirate    \
-+	plus      \
-+	pointer \
-+	pointing_hand \
-+	question_arrow \
-+	right_arrow \
-+	right_ptr      \
-+	right_side     \
-+	right_tee      \
-+	row-resize \
-+	sailboat       \
-+	sb_down_arrow \
-+	sb_h_double_arrow \
-+	sb_left_arrow \
-+	sb_right_arrow \
-+	sb_up_arrow \
-+	sb_v_double_arrow \
-+	se-resize \
-+	size_all \
-+	size_bdiag \
-+	size_fdiag \
-+	size_hor \
-+	size_ver \
-+	sizing \
-+	shuttle \
-+	split_h \
-+	split_v \
-+	s-resize \
-+	sw-resize \
-+	target  \
-+	tcross  \
-+	text \
-+	top_left_arrow  \
-+	top_left_corner \
-+	top_right_corner \
-+	top_side \
-+	top_tee \
-+	trek \
-+	ul_angle \
-+	up_arrow \
-+	ur_angle \
-+	vertical-text \
-+	v_double_arrow \
-+	whats_this \
-+	w-resize \
-+	X_cursor \
-+	xterm \
-+	zoom-in \
-+	zoom-out
-+
-+CURSOR_NAMES = \
-+	3ecb610c1bf2410f44200f48c40d3599 \
-+	08e8e1c95fe2fc01f976f1e063a24ccd \
-+	00000000000000020006000e7e9ffc3f \
-+	half-busy \
-+	left_ptr_watch \
-+	progress \
-+	watch
-+
-+
-+EXTRA_DIST = invisible wait index.theme
-+
-+install-data-local:
-+	$(mkinstalldirs) $(DESTDIR)@cursordir@;
-+	$(INSTALL_DATA) $(srcdir)/index.theme $(DESTDIR)/@cursordir@/..
-+	$(INSTALL_DATA) $(srcdir)/invisible $(srcdir)/wait $(DESTDIR)@cursordir@/
-+	for CURSOR in $(CURSOR_NAMES_INVISIBLE); do \
-+		echo '-- Installing invisible cursor '$$CURSOR; \
-+		ln -s $(srcdir)/invisible $(DESTDIR)@cursordir@/$$CURSOR; \
-+	done
-+	for CURSOR in $(CURSOR_NAMES); do \
-+		echo '-- Installing visible cursor '$$CURSOR; \
-+		ln -s $(srcdir)/wait $(DESTDIR)@cursordir@/$$CURSOR; \
-+	done
-+
-diff --git a/cursors/index.theme b/cursors/index.theme
-new file mode 100644
-index 0000000..0c48458
---- /dev/null
-+++ b/cursors/index.theme
-@@ -0,0 +1,3 @@
-+[Icon Theme]
-+Name=xfce-invisible
-+Example=invisible
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
deleted file mode 100644
index cf58f73..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 7c87f8f202a7743a18b8d7fdab5c66a3d54badd5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 1 Nov 2012 21:01:59 +0100
-Subject: [PATCH 2/5] mouse settings dialog: add touchscreen-pointer option
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Upstream-Status: Submitted [1]
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
----
- dialogs/mouse-settings/main.c             |   56 +++++++++++++++++++++++++++++
- dialogs/mouse-settings/mouse-dialog.glade |   28 ++++++++++++++-
- 3 files changed, 422 insertions(+), 329 deletions(-)
-
-diff --git a/dialogs/mouse-settings/main.c b/dialogs/mouse-settings/main.c
-index f4b475b..ff08219 100644
---- a/dialogs/mouse-settings/main.c
-+++ b/dialogs/mouse-settings/main.c
-@@ -956,6 +956,50 @@ mouse_settings_device_set_enabled (GtkToggleButton *button,
- 
- 
- 
-+#ifdef HAVE_XCURSOR
-+static void
-+mouse_settings_on_touchscreen_pointer (GtkToggleButton *button,
-+                                       GtkBuilder      *builder)
-+{
-+    gchar    *name = NULL;
-+    gchar    *prop;
-+    gboolean  enabled;
-+
-+    if (locked > 0)
-+        return;
-+
-+    if (mouse_settings_device_get_selected (builder, NULL, &name))
-+    {
-+        enabled = gtk_toggle_button_get_active (button);
-+        prop = g_strconcat ("/", name, "/TouchscreenPointer", NULL);
-+        xfconf_channel_set_bool (pointers_channel, prop, enabled);
-+        g_free (prop);
-+    }
-+    g_free (name);
-+}
-+
-+static void
-+mouse_settings_set_touchscreen_pointer (GtkBuilder *builder)
-+{
-+    gchar           *name = NULL;
-+    gchar           *prop;
-+    gboolean         enabled;
-+    GtkToggleButton *button;
-+
-+    if (mouse_settings_device_get_selected (builder, NULL, &name))
-+    {
-+        button = GTK_TOGGLE_BUTTON (gtk_builder_get_object (builder, "touchscreen-pointer"));
-+        prop = g_strconcat ("/", name, "/TouchscreenPointer", NULL);
-+        enabled = xfconf_channel_get_bool (pointers_channel, prop, FALSE);
-+        gtk_toggle_button_set_active (button, enabled);
-+        g_free (prop);
-+    }
-+    g_free (name);
-+}
-+#endif
-+
-+
-+
- static void
- mouse_settings_device_selection_changed (GtkBuilder *builder)
- {
-@@ -1007,6 +1051,9 @@ mouse_settings_device_selection_changed (GtkBuilder *builder)
-     /* get the selected item */
-     if (mouse_settings_device_get_selected (builder, &device, NULL))
-     {
-+#ifdef HAVE_XCURSOR
-+        mouse_settings_set_touchscreen_pointer (builder);
-+#endif
-         gdk_error_trap_push ();
-         device_info = XListInputDevices (xdisplay, &ndevices);
-         if (gdk_error_trap_pop () == 0 && device_info != NULL)
-@@ -1735,11 +1782,20 @@ main (gint argc, gchar **argv)
-             /* populate the themes treeview */
-             mouse_settings_themes_populate_store (builder);
- 
-+            /* connect & fill touchscreen-pointer */
-+            object = gtk_builder_get_object (builder, "touchscreen-pointer");
-+            g_signal_connect (G_OBJECT (object), "toggled",
-+                              G_CALLBACK (mouse_settings_on_touchscreen_pointer), builder);
-+            mouse_settings_set_touchscreen_pointer (builder);
-+
-             /* connect the cursor size in the cursor tab */
-             object = gtk_builder_get_object (builder, "theme-cursor-size");
-             xfconf_g_property_bind (xsettings_channel, "/Gtk/CursorThemeSize",
-                                     G_TYPE_INT, G_OBJECT (object), "value");
- #else
-+            /* hide touchscreen-pointer */
-+            object = gtk_builder_get_object (builder, "touchscreen-pointer");
-+            gtk_widget_hide (GTK_WIDGET (object));
-             /* hide the themes tab */
-             object = gtk_builder_get_object (builder, "themes-hbox");
-             gtk_widget_hide (GTK_WIDGET (object));
-diff --git a/dialogs/mouse-settings/mouse-dialog.glade b/dialogs/mouse-settings/mouse-dialog.glade
-index d3aab0d..573c551 100644
---- a/dialogs/mouse-settings/mouse-dialog.glade
-+++ b/dialogs/mouse-settings/mouse-dialog.glade
-@@ -323,7 +323,7 @@
-                                     <property name="visible">True</property>
-                                     <property name="can_focus">False</property>
-                                     <property name="border_width">6</property>
--                                    <property name="n_rows">3</property>
-+                                    <property name="n_rows">4</property>
-                                     <property name="n_columns">2</property>
-                                     <property name="column_spacing">12</property>
-                                     <property name="row_spacing">6</property>
-@@ -415,6 +415,32 @@
-                                         <property name="bottom_attach">3</property>
-                                       </packing>
-                                     </child>
-+                                    <child>
-+                                      <object class="GtkAlignment" id="alignment9">
-+                                        <property name="visible">True</property>
-+                                        <property name="can_focus">False</property>
-+                                        <property name="xalign">0</property>
-+                                        <property name="xscale">0</property>
-+                                        <property name="yscale">0</property>
-+                                        <child>
-+                                          <object class="GtkCheckButton" id="touchscreen-pointer">
-+                                            <property name="label" translatable="yes">_Touchscreen pointer</property>
-+                                            <property name="use_action_appearance">False</property>
-+                                            <property name="visible">True</property>
-+                                            <property name="can_focus">True</property>
-+                                            <property name="receives_default">False</property>
-+                                            <property name="tooltip_text" translatable="yes">When selected, no mouse pointer is displayed for this device and gtk TouchscreenMode is activated</property>
-+                                            <property name="use_underline">True</property>
-+                                            <property name="draw_indicator">True</property>
-+                                          </object>
-+                                        </child>
-+                                      </object>
-+                                      <packing>
-+                                        <property name="right_attach">2</property>
-+                                        <property name="top_attach">3</property>
-+                                        <property name="bottom_attach">4</property>
-+                                      </packing>
-+                                    </child>
-                                   </object>
-                                 </child>
-                               </object>
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
deleted file mode 100644
index eff052b..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From a3b0218137c8796fbb7bd6d852dc8ab5895a65cb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sat, 3 Nov 2012 18:32:01 +0100
-Subject: [PATCH 3/5] XfcePointersHelper gets a pointer to XfceXSettingsHelper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Upstream-Status: Submitted [1]
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
----
- xfsettingsd/main.c     |    2 +-
- xfsettingsd/pointers.c |   55 ++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 56 insertions(+), 1 deletions(-)
-
-diff --git a/xfsettingsd/main.c b/xfsettingsd/main.c
-index 55c4183..99982f7 100644
---- a/xfsettingsd/main.c
-+++ b/xfsettingsd/main.c
-@@ -273,7 +273,7 @@ main (gint argc, gchar **argv)
- #ifdef HAVE_XRANDR
-     displays_helper = g_object_new (XFCE_TYPE_DISPLAYS_HELPER, NULL);
- #endif
--    pointer_helper = g_object_new (XFCE_TYPE_POINTERS_HELPER, NULL);
-+    pointer_helper = g_object_new (XFCE_TYPE_POINTERS_HELPER, "xsettings-helper", xsettings_helper, NULL);
-     keyboards_helper = g_object_new (XFCE_TYPE_KEYBOARDS_HELPER, NULL);
-     accessibility_helper = g_object_new (XFCE_TYPE_ACCESSIBILITY_HELPER, NULL);
-     shortcuts_helper = g_object_new (XFCE_TYPE_KEYBOARD_SHORTCUTS_HELPER, NULL);
-diff --git a/xfsettingsd/pointers.c b/xfsettingsd/pointers.c
-index e7192e7..62ebc60 100644
---- a/xfsettingsd/pointers.c
-+++ b/xfsettingsd/pointers.c
-@@ -47,8 +47,16 @@
- 
- #define XFCONF_TYPE_G_VALUE_ARRAY (dbus_g_type_get_collection ("GPtrArray", G_TYPE_VALUE))
- 
-+/* Property identifiers */
-+enum
-+{
-+  PROP_0,
-+  PROP_XSETTINGS_HELPER,
-+};
-+
- 
- 
-+static void             xfce_pointers_helper_constructed              (GObject            *object);
- static void             xfce_pointers_helper_finalize                 (GObject            *object);
- static void             xfce_pointers_helper_syndaemon_stop           (XfcePointersHelper *helper);
- static void             xfce_pointers_helper_syndaemon_check          (XfcePointersHelper *helper);
-@@ -63,6 +71,10 @@ static GdkFilterReturn  xfce_pointers_helper_event_filter             (GdkXEvent
-                                                                        GdkEvent           *gdk_event,
-                                                                        gpointer            user_data);
- #endif
-+static void             xfce_pointers_helper_set_property             (GObject              *object,
-+                                                                       guint                 prop_id,
-+                                                                       const GValue         *value,
-+                                                                       GParamSpec           *pspec);
- 
- 
- 
-@@ -75,6 +87,8 @@ struct _XfcePointersHelper
- {
-     GObject  __parent__;
- 
-+    GObject       *xsettings_helper;
-+
-     /* xfconf channel */
-     XfconfChannel *channel;
- 
-@@ -108,7 +122,18 @@ xfce_pointers_helper_class_init (XfcePointersHelperClass *klass)
- {
-     GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
- 
-+    gobject_class->constructed = xfce_pointers_helper_constructed;
-     gobject_class->finalize = xfce_pointers_helper_finalize;
-+    gobject_class->set_property = xfce_pointers_helper_set_property;
-+
-+    g_object_class_install_property (gobject_class,
-+                                     PROP_XSETTINGS_HELPER,
-+                                     g_param_spec_object ("xsettings-helper",
-+                                                          "xsettings-helper",
-+                                                          "xsettings-helper",
-+                                                          G_TYPE_OBJECT,
-+                                                          G_PARAM_CONSTRUCT_ONLY |
-+                                                          G_PARAM_WRITABLE));
- }
- 
- 
-@@ -116,6 +141,15 @@ xfce_pointers_helper_class_init (XfcePointersHelperClass *klass)
- static void
- xfce_pointers_helper_init (XfcePointersHelper *helper)
- {
-+  /* All initialisation is done at xfce_pointers_helper_constructed */
-+}
-+
-+
-+
-+static void
-+xfce_pointers_helper_constructed (GObject *object)
-+{
-+    XfcePointersHelper *helper = XFCE_POINTERS_HELPER (object);
-     XExtensionVersion *version = NULL;
-     Display           *xdisplay;
- #ifdef DEVICE_HOTPLUGGING
-@@ -181,6 +215,27 @@ xfce_pointers_helper_init (XfcePointersHelper *helper)
- 
- 
- static void
-+xfce_pointers_helper_set_property (GObject      *object,
-+                                   guint         prop_id,
-+                                   const GValue *value,
-+                                   GParamSpec   *pspec)
-+{
-+    XfcePointersHelper *helper = XFCE_POINTERS_HELPER (object);
-+
-+    switch (prop_id)
-+    {
-+        case PROP_XSETTINGS_HELPER:
-+            helper->xsettings_helper = g_value_get_object (value);
-+            break;
-+        default:
-+            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-+            break;
-+    }
-+}
-+
-+
-+
-+static void
- xfce_pointers_helper_finalize (GObject *object)
- {
-     xfce_pointers_helper_syndaemon_stop (XFCE_POINTERS_HELPER (object));
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
deleted file mode 100644
index cacb5c3..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-From 878fe1287a4c73f67dd2b51d1d7c450097aeffa7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 20 Dec 2012 16:49:18 +0100
-Subject: [PATCH 4/5] XfceXSettingsHelper gets a property
- "touchscreen-pointer"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When this property is set, it overrides overrides cursor theme to
-"xfce-invisible" and sets /Gtk/TouchscreenMode.
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Upstream-Status: Submitted [1]
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
----
- xfsettingsd/xsettings.c   |  122 ++++++++++++++++++++++++++++++++++++++++++++-
- xfsettingsd/xsettings.xml |    1 +
- 2 files changed, 122 insertions(+), 1 deletions(-)
-
-diff --git a/xfsettingsd/xsettings.c b/xfsettingsd/xsettings.c
-index 7657465..76bcea1 100644
---- a/xfsettingsd/xsettings.c
-+++ b/xfsettingsd/xsettings.c
-@@ -73,6 +73,15 @@ typedef struct _XfceXSettingsNotify XfceXSettingsNotify;
- 
- 
- 
-+/* Property identifiers */
-+enum
-+{
-+    PROP_0,
-+    PROP_TOUCHSCREEN_POINTER,
-+};
-+
-+
-+
- static void     xfce_xsettings_helper_finalize     (GObject             *object);
- static void     xfce_xsettings_helper_fc_free      (XfceXSettingsHelper *helper);
- static gboolean xfce_xsettings_helper_fc_init      (gpointer             data);
-@@ -86,6 +95,10 @@ static void     xfce_xsettings_helper_load         (XfceXSettingsHelper *helper)
- static void     xfce_xsettings_helper_screen_free  (XfceXSettingsScreen *screen);
- static void     xfce_xsettings_helper_notify_xft   (XfceXSettingsHelper *helper);
- static void     xfce_xsettings_helper_notify       (XfceXSettingsHelper *helper);
-+static void     xfce_xsettings_helper_set_property (GObject              *object,
-+                                                    guint                 prop_id,
-+                                                    const GValue         *value,
-+                                                    GParamSpec           *pspec);
- 
- 
- 
-@@ -120,6 +133,13 @@ struct _XfceXSettingsHelper
-     GPtrArray     *fc_monitors;
-     guint          fc_notify_timeout_id;
-     guint          fc_init_id;
-+
-+    /* keeper for touchscreen cursor theme / last set */
-+    GValue         *touchscreen_cursor_value;
-+    GValue         *lastset_cursor_value;
-+
-+    /* properties */
-+    gboolean       touchscreen_pointer;
- };
- 
- struct _XfceXSetting
-@@ -157,6 +177,16 @@ xfce_xsettings_helper_class_init (XfceXSettingsHelperClass *klass)
- 
-     gobject_class = G_OBJECT_CLASS (klass);
-     gobject_class->finalize = xfce_xsettings_helper_finalize;
-+    gobject_class->set_property = xfce_xsettings_helper_set_property;
-+
-+    g_object_class_install_property (gobject_class,
-+                                     PROP_TOUCHSCREEN_POINTER,
-+                                     g_param_spec_boolean ("touchscreen-pointer",
-+                                                           "touchscreen-pointer",
-+                                                           "touchscreen-pointer",
-+                                                           FALSE,
-+                                                           G_PARAM_WRITABLE |
-+                                                           G_PARAM_STATIC_STRINGS));
- }
- 
- 
-@@ -169,6 +199,13 @@ xfce_xsettings_helper_init (XfceXSettingsHelper *helper)
-     helper->settings = g_hash_table_new_full (g_str_hash, g_str_equal,
-         g_free, xfce_xsettings_helper_setting_free);
- 
-+    helper->lastset_cursor_value = g_new0 (GValue, 1);
-+    g_value_init(helper->lastset_cursor_value, G_TYPE_STRING);
-+    g_value_set_string (helper->lastset_cursor_value, "default");
-+    helper->touchscreen_cursor_value = g_new0 (GValue, 1);
-+    g_value_init(helper->touchscreen_cursor_value, G_TYPE_STRING);
-+    g_value_set_string (helper->touchscreen_cursor_value, "xfce-invisible");
-+
-     xfce_xsettings_helper_load (helper);
- 
-     g_signal_connect (G_OBJECT (helper->channel), "property-changed",
-@@ -202,6 +239,9 @@ xfce_xsettings_helper_finalize (GObject *object)
- 
-     g_hash_table_destroy (helper->settings);
- 
-+    g_free (helper->lastset_cursor_value);
-+    g_free (helper->touchscreen_cursor_value);
-+
-     (*G_OBJECT_CLASS (xfce_xsettings_helper_parent_class)->finalize) (object);
- }
- 
-@@ -387,6 +427,61 @@ xfce_xsettings_helper_notify_xft_idle (gpointer data)
- 
- 
- 
-+static void
-+xfce_xsettings_helper_set_property (GObject      *object,
-+                                    guint         prop_id,
-+                                    const GValue *value,
-+                                    GParamSpec   *pspec)
-+{
-+  gboolean             touchscreen_pointer;
-+  XfceXSetting        *setting_theme, *setting_touchscreen;
-+  XfceXSettingsHelper *helper = XFCE_XSETTINGS_HELPER (object);
-+  GtkSettings         *gtk_settings;
-+  GValue               bool_val = { 0, };
-+
-+  switch (prop_id)
-+  {
-+      case PROP_TOUCHSCREEN_POINTER:
-+          touchscreen_pointer = g_value_get_boolean (value);
-+          if (helper->touchscreen_pointer != touchscreen_pointer)
-+          {
-+              helper->touchscreen_pointer = touchscreen_pointer;
-+              /* Update touchscreen-mode */
-+              xfconf_channel_set_bool (helper->channel, "/Gtk/TouchscreenMode", touchscreen_pointer);
-+              /* Update cursor */
-+              setting_theme = g_hash_table_lookup (helper->settings, "/Gtk/CursorThemeName");
-+              if (G_LIKELY (setting_theme != NULL))
-+              {
-+                  /* update the serial */
-+                  setting_theme->last_change_serial = helper->serial;
-+                  /* update value */
-+                  g_value_reset (setting_theme->value);
-+                  g_value_copy (touchscreen_pointer ?
-+                                    helper->touchscreen_cursor_value :
-+                                    helper->lastset_cursor_value,
-+                                setting_theme->value);
-+              }
-+              else
-+                  g_critical("Setting not found for /Gtk/CursorThemeName");
-+
-+              if (G_LIKELY (setting_touchscreen != NULL || setting_theme != NULL))
-+              {
-+                  /* schedule xsettings update */
-+                  if (helper->notify_idle_id == 0)
-+                      helper->notify_idle_id = g_idle_add (xfce_xsettings_helper_notify_idle, helper);
-+                  if (helper->notify_xft_idle_id == 0)
-+                      helper->notify_xft_idle_id = g_idle_add (xfce_xsettings_helper_notify_xft_idle, helper);
-+              }
-+          }
-+      break;
-+    default:
-+      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-+      break;
-+    }
-+}
-+
-+
-+
- static gboolean
- xfce_xsettings_helper_prop_valid (const gchar  *prop_name,
-                                   const GValue *value)
-@@ -413,6 +508,28 @@ xfce_xsettings_helper_prop_valid (const gchar  *prop_name,
- 
- 
- 
-+static void
-+xfce_xsettings_helper_check_cursor (const gchar         *prop_name,
-+                                    GValue              *value,
-+                                    XfceXSettingsHelper *helper)
-+{
-+    if (g_strcmp0 (prop_name, "/Gtk/CursorThemeName") == 0)
-+    {
-+        /* Keep last cursor theme set */
-+        g_value_reset (helper->lastset_cursor_value);
-+        g_value_copy (value, helper->lastset_cursor_value);
-+
-+        /* invisible replacement required ? */
-+        if (helper->touchscreen_pointer)
-+        {
-+            g_value_reset (value);
-+            g_value_copy (helper->touchscreen_cursor_value, value);
-+        }
-+    }
-+}
-+
-+
-+
- static gboolean
- xfce_xsettings_helper_prop_load (gchar               *prop_name,
-                                  GValue              *value,
-@@ -426,6 +543,7 @@ xfce_xsettings_helper_prop_load (gchar               *prop_name,
- 
-     setting = g_slice_new0 (XfceXSetting);
-     setting->value = value;
-+    xfce_xsettings_helper_check_cursor (prop_name, setting->value, helper);
-     setting->last_change_serial = helper->serial;
- 
-     xfsettings_dbg_filtered (XFSD_DEBUG_XSETTINGS, "prop \"%s\" loaded (type=%s)",
-@@ -462,6 +580,7 @@ xfce_xsettings_helper_prop_changed (XfconfChannel       *channel,
-              * it first */
-             g_value_reset (setting->value);
-             g_value_copy (value, setting->value);
-+            xfce_xsettings_helper_check_cursor (prop_name, setting->value, helper);
- 
-             /* update the serial */
-             setting->last_change_serial = helper->serial;
-@@ -475,6 +594,7 @@ xfce_xsettings_helper_prop_changed (XfconfChannel       *channel,
- 
-             g_value_init (setting->value, G_VALUE_TYPE (value));
-             g_value_copy (value, setting->value);
-+            xfce_xsettings_helper_check_cursor (prop_name, setting->value, helper);
- 
-             g_hash_table_insert (helper->settings, g_strdup (prop_name), setting);
-         }
-@@ -649,6 +769,7 @@ xfce_xsettings_helper_notify_xft (XfceXSettingsHelper *helper)
-     XfceXSetting *setting;
-     guint         i;
-     GValue        bool_val = { 0, };
-+
-     const gchar  *props[][2] =
-     {
-         /* { xfconf name}, { xft name } */
-@@ -700,7 +821,6 @@ xfce_xsettings_helper_notify_xft (XfceXSettingsHelper *helper)
-                      PropModeReplace,
-                      (guchar *) resource->str,
-                      resource->len);
--
-     XCloseDisplay (xdisplay);
- 
-     if (gdk_error_trap_pop () != 0)
---- a/xfsettingsd/xsettings.xml
-+++ b/xfsettingsd/xsettings.xml
-@@ -36,5 +36,6 @@
-     <property name="MenuBarAccel" type="string" value="F10"/>
-     <property name="CursorThemeName" type="string" value=""/>
-     <property name="CursorThemeSize" type="int" value="0"/>
-+    <property name="TouchscreenMode" type="bool" value="false"/>
-   </property>
- </channel>
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
deleted file mode 100644
index 3c9b3da..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
+++ /dev/null
@@ -1,589 +0,0 @@
-From 78353322ce1070ee1fd7bb5367e2c4dd43928f42 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 20 Dec 2012 16:58:19 +0100
-Subject: [PATCH 5/5] pointers: detect a change of pointer-device used and set
- "touchscreen-pointer" as found in xfconf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-To detect pointer device in use the DevicePresence-, DeviceMotionNotify- and
-DeviceButtonPress-events are handled. Tests showed that by repopenning and
-closing the pointer devices (e.g when another setting was modified), the events
-stopped working. Therefore all pointer devices are opened only once and managed
-in a hash table.
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Upstream-Status: Submitted [1]
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
----
- xfsettingsd/pointers.c | 342 ++++++++++++++++++++++++++++++++-----------------
- 1 file changed, 225 insertions(+), 117 deletions(-)
-
-diff --git a/xfsettingsd/pointers.c b/xfsettingsd/pointers.c
-index cfa56e2..41c8bba 100644
---- a/xfsettingsd/pointers.c
-+++ b/xfsettingsd/pointers.c
-@@ -66,11 +66,9 @@ static void             xfce_pointers_helper_channel_property_changed (XfconfCha
-                                                                        const gchar        *property_name,
-                                                                        const GValue       *value,
-                                                                        XfcePointersHelper *helper);
--#ifdef DEVICE_HOTPLUGGING
- static GdkFilterReturn  xfce_pointers_helper_event_filter             (GdkXEvent          *xevent,
-                                                                        GdkEvent           *gdk_event,
-                                                                        gpointer            user_data);
--#endif
- static void             xfce_pointers_helper_set_property             (GObject              *object,
-                                                                        guint                 prop_id,
-                                                                        const GValue         *value,
-@@ -96,8 +94,11 @@ struct _XfcePointersHelper
-     GPid           syndaemon_pid;
- #endif
- 
-+    GHashTable    *pointer_devices;
-+    XID            last_pointer_active;
-+    gint           device_motion_event_type;
-+    gint           device_button_press_event_type;
- #ifdef DEVICE_HOTPLUGGING
--    /* device presence event type */
-     gint           device_presence_event_type;
- #endif
- };
-@@ -117,6 +118,15 @@ G_DEFINE_TYPE (XfcePointersHelper, xfce_pointers_helper, G_TYPE_OBJECT);
- 
- 
- 
-+typedef struct
-+{
-+    XDevice     *device;
-+    gchar*      name;
-+}
-+XfcePointerDeviceData;
-+
-+
-+
- static void
- xfce_pointers_helper_class_init (XfcePointersHelperClass *klass)
- {
-@@ -147,6 +157,18 @@ xfce_pointers_helper_init (XfcePointersHelper *helper)
- 
- 
- static void
-+xfce_pointers_device_close (gpointer data)
-+{
-+    XfcePointerDeviceData *device_data = data;
-+
-+    XCloseDevice (GDK_DISPLAY (), device_data->device);
-+    g_free (device_data->name);
-+    g_free (device_data);
-+}
-+
-+
-+
-+static void
- xfce_pointers_helper_constructed (GObject *object)
- {
-     XfcePointersHelper *helper = XFCE_POINTERS_HELPER (object);
-@@ -185,6 +207,10 @@ xfce_pointers_helper_constructed (GObject *object)
-         helper->channel = xfconf_channel_get ("pointers");
- 
-         /* restore the pointer devices */
-+        helper->pointer_devices = g_hash_table_new_full (g_int_hash,
-+                                                         g_int_equal,
-+                                                         g_free,
-+                                                         xfce_pointers_device_close);
-         xfce_pointers_helper_restore_devices (helper, NULL);
- 
-         /* monitor the channel */
-@@ -194,21 +220,20 @@ xfce_pointers_helper_constructed (GObject *object)
-         /* launch syndaemon if required */
-         xfce_pointers_helper_syndaemon_check (helper);
- 
--#ifdef DEVICE_HOTPLUGGING
-         if (G_LIKELY (xdisplay != NULL))
-         {
-+#ifdef DEVICE_HOTPLUGGING
-             /* monitor device changes */
-             gdk_error_trap_push ();
-             DevicePresence (xdisplay, helper->device_presence_event_type, event_class);
-             XSelectExtensionEvent (xdisplay, RootWindow (xdisplay, DefaultScreen (xdisplay)), &event_class, 1);
- 
-             /* add an event filter */
--            if (gdk_error_trap_pop () == 0)
--                gdk_window_add_filter (NULL, xfce_pointers_helper_event_filter, helper);
--            else
-+            if (gdk_error_trap_pop () != 0)
-                 g_warning ("Failed to create device filter");
--        }
- #endif
-+            gdk_window_add_filter (NULL, xfce_pointers_helper_event_filter, helper);
-+        }
-     }
- }
- 
-@@ -238,7 +263,10 @@ xfce_pointers_helper_set_property (GObject      *object,
- static void
- xfce_pointers_helper_finalize (GObject *object)
- {
--    xfce_pointers_helper_syndaemon_stop (XFCE_POINTERS_HELPER (object));
-+    XfcePointersHelper* helper = XFCE_POINTERS_HELPER (object);
-+
-+    xfce_pointers_helper_syndaemon_stop (helper);
-+    g_hash_table_destroy (helper->pointer_devices);
- 
-     (*G_OBJECT_CLASS (xfce_pointers_helper_parent_class)->finalize) (object);
- }
-@@ -267,19 +295,19 @@ static void
- xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
- {
- #ifdef DEVICE_PROPERTIES
--    Display     *xdisplay = GDK_DISPLAY ();
--    XDeviceInfo *device_list;
--    XDevice     *device;
--    gint         n, ndevices;
--    Atom         touchpad_type;
--    Atom         touchpad_off_prop;
--    Atom        *props;
--    gint         i, nprops;
--    gboolean     have_synaptics = FALSE;
--    gdouble      disable_duration;
--    gchar        disable_duration_string[64];
--    gchar       *args[] = { "syndaemon", "-i", disable_duration_string, "-K", "-R", NULL };
--    GError      *error = NULL;
-+    Display               *xdisplay = GDK_DISPLAY ();
-+    XDeviceInfo           *device_list;
-+    XfcePointerDeviceData *device_data;
-+    gint                   n, ndevices;
-+    Atom                   touchpad_type;
-+    Atom                   touchpad_off_prop;
-+    Atom                  *props;
-+    gint                   i, nprops;
-+    gboolean               have_synaptics = FALSE;
-+    gdouble                disable_duration;
-+    gchar                  disable_duration_string[64];
-+    gchar                 *args[] = { "syndaemon", "-i", disable_duration_string, "-K", "-R", NULL };
-+    GError                *error = NULL;
- 
-     /* only stop a running daemon */
-     if (!xfconf_channel_get_bool (helper->channel, "/DisableTouchpadWhileTyping", FALSE))
-@@ -299,17 +327,16 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
-         if (device_list[n].type != touchpad_type)
-             continue;
- 
--        gdk_error_trap_push ();
--        device = XOpenDevice (xdisplay, device_list[n].id);
--        if (gdk_error_trap_pop () != 0 || device == NULL)
-+        device_data = g_hash_table_lookup (helper->pointer_devices, &device_list[n].id);
-+        if (device_data == NULL)
-         {
--            g_critical ("Unable to open device %s", device_list[n].name);
-+            g_critical ("xfce_pointers_helper_syndaemon_check: Unable to find device %s / ID %i in hash table", device_list[n].name, device_list[n].id);
-             break;
-         }
- 
-         /* look for the Synaptics Off property */
-         gdk_error_trap_push ();
--        props = XListDeviceProperties (xdisplay, device, &nprops);
-+        props = XListDeviceProperties (xdisplay, device_data->device, &nprops);
-         if (gdk_error_trap_pop () == 0
-             && props != NULL)
-         {
-@@ -319,8 +346,6 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
-             XFree (props);
-         }
- 
--        XCloseDevice (xdisplay, device);
--
-         if (have_synaptics)
-             break;
-     }
-@@ -847,24 +872,56 @@ xfce_pointers_helper_change_properties (gpointer key,
- 
- 
- static void
-+xfce_pointers_helper_change_current_device (XfcePointersHelper *helper,
-+                                            XID *xid)
-+{
-+    XfcePointerDeviceData *device_data;
-+    gchar*                 prop;
-+    GValue                 bool_val = { 0, };
-+
-+    helper->last_pointer_active = *xid;
-+    device_data = g_hash_table_lookup (helper->pointer_devices, xid);
-+    if (device_data == NULL)
-+    {
-+        g_critical ("Unable to find device ID %i in hash table", *xid);
-+        return;
-+    }
-+    if (G_LIKELY (G_IS_OBJECT (helper->xsettings_helper)))
-+    {
-+        prop = g_strconcat ("/", device_data->name, "/TouchscreenPointer", NULL);
-+        g_value_init (&bool_val, G_TYPE_BOOLEAN);
-+        g_value_set_boolean (&bool_val,
-+                             xfconf_channel_get_bool (helper->channel, prop, FALSE));
-+        g_object_set_property (helper->xsettings_helper, "touchscreen-pointer", &bool_val);
-+        g_value_unset (&bool_val);
-+        g_free (prop);
-+    }
-+    else
-+        g_critical ("xsettings_helper was not properly set");
-+}
-+
-+
-+static void
- xfce_pointers_helper_restore_devices (XfcePointersHelper *helper,
-                                       XID                *xid)
- {
--    Display         *xdisplay = GDK_DISPLAY ();
--    XDeviceInfo     *device_list, *device_info;
--    gint             n, ndevices;
--    XDevice         *device;
--    gchar           *device_name;
--    gchar            prop[256];
--    gboolean         right_handed;
--    gboolean         reverse_scrolling;
--    gint             threshold;
--    gdouble          acceleration;
-+    Display               *xdisplay = GDK_DISPLAY ();
-+    XDeviceInfo           *device_list, *device_info;
-+    gint                   n, ndevices;
-+    XDevice               *device;
-+    XfcePointerDeviceData *device_data;
-+    gchar                 *device_name;
-+    gchar                  prop[256];
-+    gboolean               right_handed;
-+    gboolean               reverse_scrolling;
-+    gint                   threshold;
-+    gdouble                acceleration;
-+    XEventClass            event_classes[2];
- #ifdef DEVICE_PROPERTIES
--    GHashTable      *props;
--    XfcePointerData  pointer_data;
-+    GHashTable            *props;
-+    XfcePointerData        pointer_data;
- #endif
--    const gchar     *mode;
-+    const gchar           *mode;
- 
-     gdk_error_trap_push ();
-     device_list = XListInputDevices (xdisplay, &ndevices);
-@@ -874,86 +931,110 @@ xfce_pointers_helper_restore_devices (XfcePointersHelper *helper,
-         return;
-     }
- 
-+    device_data = NULL;
-     for (n = 0; n < ndevices; n++)
-     {
--        /* filter the pointer devices */
-+        /* filter the physical pointer devices */
-         device_info = &device_list[n];
-         if (device_info->use != IsXExtensionPointer
--            || device_info->name == NULL)
-+            || device_info->name == NULL
-+            || g_str_has_prefix (device_info->name, "Virtual core XTEST"))
-             continue;
- 
-         /* filter out the device if one is set */
-         if (xid != NULL && device_info->id != *xid)
-             continue;
- 
--        /* open the device */
--        gdk_error_trap_push ();
--        device = XOpenDevice (xdisplay, device_info->id);
--        if (gdk_error_trap_pop () != 0 || device == NULL)
-+        device_data = g_hash_table_lookup (helper->pointer_devices, &device_info->id);
-+        if (device_data == NULL)
-         {
--            g_critical ("Unable to open device %s", device_info->name);
--            continue;
--        }
-+            /* open the device and insert to hash */
-+            gdk_error_trap_push ();
-+            device = XOpenDevice (xdisplay, device_info->id);
-+            if (G_UNLIKELY(gdk_error_trap_pop () != 0 || device == NULL))
-+            {
-+                g_critical ("Unable to open device %s / ID: %i", device_info->name, device_info->id);
-+                continue;
-+            }
- 
--        /* create a valid xfconf property name for the device */
--        device_name = xfce_pointers_helper_device_xfconf_name (device_info->name);
-+            /* create a valid xfconf property name for the device */
-+            device_name = xfce_pointers_helper_device_xfconf_name (device_info->name);
- 
--        /* read buttonmap properties */
--        g_snprintf (prop, sizeof (prop), "/%s/RightHanded", device_name);
--        right_handed = xfconf_channel_get_bool (helper->channel, prop, -1);
-+            /* add device to our list */
-+            device_data = g_new (XfcePointerDeviceData, 1);
-+            device_data->device = device;
-+            device_data->name = device_name;
-+            g_hash_table_insert (helper->pointer_devices, g_memdup (&device_info->id, sizeof(device_info->id)), device_data);
- 
--        g_snprintf (prop, sizeof (prop), "/%s/ReverseScrolling", device_name);
--        reverse_scrolling = xfconf_channel_get_bool (helper->channel, prop, -1);
-+            /* catch motion event / button-press for new device */
-+            gdk_error_trap_push ();
-+            DeviceMotionNotify (device, helper->device_motion_event_type, event_classes[0]);
-+            DeviceButtonPress (device, helper->device_button_press_event_type, event_classes[1]);
-+            XSelectExtensionEvent (xdisplay, RootWindow (xdisplay, DefaultScreen (xdisplay)), event_classes, 2);
-+            if (G_UNLIKELY (gdk_error_trap_pop () != 0))
-+               g_critical ("Unable to register DeviceButtonPress/DeviceMotionNotify for %i", device_info->id);
- 
--        if (right_handed != -1 || reverse_scrolling != -1)
--        {
--            xfce_pointers_helper_change_button_mapping (device_info, device, xdisplay,
-+
-+            /* read buttonmap properties */
-+            g_snprintf (prop, sizeof (prop), "/%s/RightHanded", device_name);
-+            right_handed = xfconf_channel_get_bool (helper->channel, prop, -1);
-+
-+            g_snprintf (prop, sizeof (prop), "/%s/ReverseScrolling", device_name);
-+            reverse_scrolling = xfconf_channel_get_bool (helper->channel, prop, -1);
-+
-+            if (right_handed != -1 || reverse_scrolling != -1)
-+            {
-+                xfce_pointers_helper_change_button_mapping (device_info, device, xdisplay,
-                                                         right_handed, reverse_scrolling);
--        }
-+            }
- 
--        /* read feedback settings */
--        g_snprintf (prop, sizeof (prop), "/%s/Threshold", device_name);
--        threshold = xfconf_channel_get_int (helper->channel, prop, -1);
-+            /* read feedback settings */
-+            g_snprintf (prop, sizeof (prop), "/%s/Threshold", device_name);
-+            threshold = xfconf_channel_get_int (helper->channel, prop, -1);
- 
--        g_snprintf (prop, sizeof (prop), "/%s/Acceleration", device_name);
--        acceleration = xfconf_channel_get_double (helper->channel, prop, -1.00);
-+            g_snprintf (prop, sizeof (prop), "/%s/Acceleration", device_name);
-+            acceleration = xfconf_channel_get_double (helper->channel, prop, -1.00);
- 
--        if (threshold != -1 || acceleration != -1.00)
--        {
--            xfce_pointers_helper_change_feedback (device_info, device, xdisplay,
--                                                  threshold, acceleration);
--        }
-+            if (threshold != -1 || acceleration != -1.00)
-+            {
-+                xfce_pointers_helper_change_feedback (device_info, device, xdisplay,
-+                                                      threshold, acceleration);
-+            }
- 
--        /* read mode settings */
--        g_snprintf (prop, sizeof (prop), "/%s/Mode", device_name);
--        mode =  xfconf_channel_get_string  (helper->channel, prop, NULL);
-+            /* read mode settings */
-+            g_snprintf (prop, sizeof (prop), "/%s/Mode", device_name);
-+            mode =  xfconf_channel_get_string  (helper->channel, prop, NULL);
- 
--        if (mode != NULL)
--            xfce_pointers_helper_change_mode (device_info, device, xdisplay, mode);
-+            if (mode != NULL)
-+                xfce_pointers_helper_change_mode (device_info, device, xdisplay, mode);
- 
- #ifdef DEVICE_PROPERTIES
--        /* set device properties */
--        g_snprintf (prop, sizeof (prop), "/%s/Properties", device_name);
--        props = xfconf_channel_get_properties (helper->channel, prop);
-+            /* set device properties */
-+            g_snprintf (prop, sizeof (prop), "/%s/Properties", device_name);
-+            props = xfconf_channel_get_properties (helper->channel, prop);
- 
--        if (props != NULL)
--        {
--            pointer_data.xdisplay = xdisplay;
--            pointer_data.device = device;
--            pointer_data.device_info = device_info;
--            pointer_data.prop_name_len = strlen (prop) + 1;
-+            if (props != NULL)
-+            {
-+                pointer_data.xdisplay = xdisplay;
-+                pointer_data.device = device;
-+                pointer_data.device_info = device_info;
-+                pointer_data.prop_name_len = strlen (prop) + 1;
- 
--            g_hash_table_foreach (props, xfce_pointers_helper_change_properties, &pointer_data);
-+                g_hash_table_foreach (props, xfce_pointers_helper_change_properties, &pointer_data);
- 
--            g_hash_table_destroy (props);
--        }
-+                g_hash_table_destroy (props);
-+            }
- #endif
--
--        g_free (device_name);
--        XCloseDevice (xdisplay, device);
-+        }
-     }
--
-     XFreeDeviceList (device_list);
-+    if (G_LIKELY (device_data != NULL))
-+    {
-+        if (helper->last_pointer_active != device_data->device->device_id)
-+            xfce_pointers_helper_change_current_device (helper, &device_data->device->device_id);
-+    }
-+    else
-+        g_critical("no device selected in xfce_pointers_helper_restore_devices");
- }
- 
- 
-@@ -964,12 +1045,12 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
-                                                const GValue       *value,
-                                                XfcePointersHelper *helper)
- {
--    Display      *xdisplay = GDK_DISPLAY ();
--    XDeviceInfo  *device_list, *device_info;
--    XDevice      *device;
--    gint          n, ndevices;
--    gchar       **names;
--    gchar        *device_name;
-+    Display               *xdisplay = GDK_DISPLAY ();
-+    XDeviceInfo           *device_list, *device_info;
-+    XfcePointerDeviceData *device_data;
-+    gint                   n, ndevices;
-+    gchar                **names;
-+    gchar                 *device_name;
- 
-     if (G_UNLIKELY (property_name == NULL))
-          return;
-@@ -1000,63 +1081,72 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
-             /* filter the pointer devices */
-             device_info = &device_list[n];
-             if (device_info->use != IsXExtensionPointer
--                || device_info->name == NULL)
-+                || device_info->name == NULL
-+                || g_str_has_prefix (device_info->name, "Virtual core XTEST"))
-                 continue;
- 
-             /* search the device name */
-             device_name = xfce_pointers_helper_device_xfconf_name (device_info->name);
-             if (strcmp (names[0], device_name) == 0)
-             {
--                /* open the device */
--                gdk_error_trap_push ();
--                device = XOpenDevice (xdisplay, device_info->id);
--                if (gdk_error_trap_pop () != 0 || device == NULL)
-+                /* find the device */
-+                device_data = g_hash_table_lookup (helper->pointer_devices, &device_info->id);
-+                if (device_data == NULL)
-                 {
--                    g_critical ("Unable to open device %s", device_info->name);
-+                    g_critical ("xfce_pointers_helper_channel_property_changed: Unable to find device %s / ID %i in hash table", device_info->name, device_info->id);
-                     continue;
-                 }
- 
-                 /* check the property that requires updating */
-                 if (strcmp (names[1], "RightHanded") == 0)
-                 {
--                    xfce_pointers_helper_change_button_mapping (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_button_mapping (device_info, device_data->device, xdisplay,
-                                                                 g_value_get_boolean (value), -1);
-                 }
-                 else if (strcmp (names[1], "ReverseScrolling") == 0)
-                 {
--                    xfce_pointers_helper_change_button_mapping (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_button_mapping (device_info, device_data->device, xdisplay,
-                                                                 -1, g_value_get_boolean (value));
-                 }
-                 else if (strcmp (names[1], "Threshold") == 0)
-                 {
--                    xfce_pointers_helper_change_feedback (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_feedback (device_info, device_data->device, xdisplay,
-                                                           g_value_get_int (value), -2.00);
-                 }
-                 else if (strcmp (names[1], "Acceleration") == 0)
-                 {
--                    xfce_pointers_helper_change_feedback (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_feedback (device_info, device_data->device, xdisplay,
-                                                           -2, g_value_get_double (value));
-                 }
- #ifdef DEVICE_PROPERTIES
-                 else if (strcmp (names[1], "Properties") == 0)
-                 {
--                    xfce_pointers_helper_change_property (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_property (device_info, device_data->device, xdisplay,
-                                                           names[2], value);
-                 }
- #endif
-                 else if (strcmp (names[1], "Mode") == 0)
-                 {
--                    xfce_pointers_helper_change_mode (device_info, device, xdisplay,
-+                    xfce_pointers_helper_change_mode (device_info, device_data->device, xdisplay,
-                                                       g_value_get_string (value));
-                 }
-+                else if (strcmp (names[1], "TouchscreenPointer") == 0)
-+                {
-+                   /* only hide if the current device's property was changed */
-+                   if (device_info->id == helper->last_pointer_active)
-+                   {
-+                     if (G_LIKELY (G_IS_OBJECT (helper->xsettings_helper)))
-+                         g_object_set_property (helper->xsettings_helper, "touchscreen-pointer", value);
-+                     else
-+                         g_critical ("xsettings_helper was not properly set");
-+                   }
-+                }
-                 else
-                 {
-                     g_warning ("Unknown property %s set for device %s",
-                                property_name, device_info->name);
-                 }
- 
--                XCloseDevice (xdisplay, device);
--
-                 /* stop searching */
-                 n = ndevices;
-             }
-@@ -1072,26 +1162,44 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
- 
- 
- 
--#ifdef DEVICE_HOTPLUGGING
- static GdkFilterReturn
- xfce_pointers_helper_event_filter (GdkXEvent *xevent,
-                                    GdkEvent  *gdk_event,
-                                    gpointer   user_data)
- {
-+    XDevicePresenceNotifyEvent *dpn_event;
-     XEvent                     *event = xevent;
--    XDevicePresenceNotifyEvent *dpn_event = xevent;
-     XfcePointersHelper         *helper = XFCE_POINTERS_HELPER (user_data);
- 
--    if (event->type == helper->device_presence_event_type)
-+    /* Comparison for device changed is done here redundantly to prevent call
-+     * on every mouse move.
-+     */
-+    if (event->type == helper->device_motion_event_type
-+             && helper->last_pointer_active != ((XDeviceMotionEvent*)xevent)->deviceid)
-+        xfce_pointers_helper_change_current_device (helper, &((XDeviceMotionEvent*)xevent)->deviceid);
-+    else if (event->type == helper->device_button_press_event_type
-+             && helper->last_pointer_active != ((XDeviceButtonEvent*)xevent)->deviceid)
-+        xfce_pointers_helper_change_current_device (helper, &((XDeviceButtonEvent*)xevent)->deviceid);
-+
-+#ifdef DEVICE_HOTPLUGGING
-+    /* handle device add/remove */
-+    else if (event->type == helper->device_presence_event_type)
-     {
-+        dpn_event = xevent;
-         /* restore device settings */
-         if (dpn_event->devchange == DeviceAdded)
-             xfce_pointers_helper_restore_devices (helper, &dpn_event->deviceid);
-+        else if(dpn_event->devchange == DeviceRemoved)
-+            /* we could try to find a remaining pointer to set that as active
-+             * one but that might not fit and as soon as the user works with
-+             * another pointer we are changing to correct one.
-+             */
-+            g_hash_table_remove (helper->pointer_devices, &dpn_event->deviceid);
- 
-         /* check if we need to launch syndaemon */
-         xfce_pointers_helper_syndaemon_check (helper);
-     }
-+#endif
- 
-     return GDK_FILTER_CONTINUE;
- }
--#endif
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible
deleted file mode 100644
index ef4d9aadb6dfdd7fd2eec07e4d57babd900e6ad9..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 4160
zcmaz@E-eyZ00BlIWME)o`1@Z0NXr1R3KAbArvSx33Ji>3j8S?t1V%$(Gz3ONU^E0q
dLtr!nMnhmU1V%$(Gz3ONU^E0qLtt2k003Ri2BZK0

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait
deleted file mode 100644
index 8b9ac7e20af7855968bc96c1b64cf8eb14539545..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 126096
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
C+)S1L

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 5ce38b9..25fa292 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -6,11 +6,12 @@ DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib l
 
 inherit xfce xfce-git
 
-SRC_URI = " git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0 \
-            file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
-            file://0002-xsettings.xml-Set-default-themes.patch \
-"
-SRCREV = "a4540c2350cecf53f7095027edd102c6a24e36af"
+# schnitzeltony git repo is the mainline repo
+# + datetime-setter - sent to mainline but strange response
+# + minor bugfixes - sent mainline but no response
+# + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
+SRC_URI = "git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0"
+SRCREV = "30bc3db17e0c634e41d2f099de6f39bb894906cd"
 S = "${WORKDIR}/git"
 PV = "4.12.0+git${SRCPV}"
  
-- 
2.1.0


