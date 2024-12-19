Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2527C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.126946.1734605565434856418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wNW9018323;
	Thu, 19 Dec 2024 02:52:44 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq5dmw-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:52:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:52:36 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:52:35 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 6/6] xfce4-panel: 4.18.6 -> 4.20.0
Date: Thu, 19 Dec 2024 18:52:25 +0800
Message-ID: <20241219105225.555464-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219105225.555464-1-kai.kang@windriver.com>
References: <20241219105225.555464-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: vYKG489BmiLp0V4vV7uMUJsjmPRRMiev
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763fafc cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=y4MZwRvVZDbKptnFEOwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: vYKG489BmiLp0V4vV7uMUJsjmPRRMiev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BJ6wNW9018323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114393

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-panel from 4.18.6 to 4.20.0:

* add dependency libxfce4windowing
* set GDBUS_CODEGEN for configure
* rebase patches as well

The change log is at:

https://gitlab.xfce.org/xfce/xfce4-panel/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...t-display-desktop-icon-when-no-windo.patch | 23 ++++++----
 .../0002-use-lxdm-to-replace-dm-tool.patch    | 43 ++++++++-----------
 ...-panel_4.18.6.bb =3D> xfce4-panel_4.20.0.bb} |  8 ++--
 3 files changed, 36 insertions(+), 38 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.6.bb =3D> xf=
ce4-panel_4.20.0.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-=
not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfc=
e4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.=
patch
index 154f72d18..690deefc9 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
@@ -17,27 +17,32 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@goo=
glemail.com>
 Rebase for xfce4-panel 4.18.3.
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for xfce4-panel 4.20.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  plugins/windowmenu/windowmenu.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/window=
menu.c
-index be7dea4..2f432b0 100644
+index 9a73f29..eab0547 100644
 --- a/plugins/windowmenu/windowmenu.c
 +++ b/plugins/windowmenu/windowmenu.c
-@@ -262,7 +262,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+@@ -266,7 +266,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
    g_signal_connect (G_OBJECT (plugin->button), "toggled",
-       G_CALLBACK (window_menu_plugin_menu), plugin);
+                     G_CALLBACK (window_menu_plugin_menu), plugin);
 =20
 -  plugin->icon =3D gtk_image_new_from_icon_name ("user-desktop", GTK_IC=
ON_SIZE_BUTTON);
 +  plugin->icon =3D gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BU=
TTON);
    gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
    gtk_widget_show (plugin->icon);
-=20
-@@ -695,19 +695,19 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
+ }
+@@ -706,19 +706,19 @@ window_menu_plugin_active_window_changed (XfwScree=
n *screen,
            /* skip 'fake' windows */
-           type =3D wnck_window_get_window_type (window);
-           if (type =3D=3D WNCK_WINDOW_DESKTOP || type =3D=3D WNCK_WINDO=
W_DOCK)
+           type =3D xfw_window_get_window_type (window);
+           if (type =3D=3D XFW_WINDOW_TYPE_DESKTOP || type =3D=3D XFW_WI=
NDOW_TYPE_DOCK)
 -            goto show_desktop_icon;
 +            goto show_no_icon;
 =20
@@ -45,8 +50,8 @@ index be7dea4..2f432b0 100644
          }
        else
          {
--          show_desktop_icon:
-+          show_no_icon:
+-show_desktop_icon:
++show_no_icon:
 =20
            /* desktop is shown right now */
            icon_size =3D xfce_panel_plugin_get_icon_size (XFCE_PANEL_PLU=
GIN (plugin));
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-re=
place-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-l=
xdm-to-replace-dm-tool.patch
index 66a33c722..dc2444193 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-d=
m-tool.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-d=
m-tool.patch
@@ -13,41 +13,32 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Rebase for xfce4-panel 4.18.3.
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for xfce4-panel 4.20.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
- plugins/actions/actions.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ plugins/actions/actions.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/plugins/actions/actions.c b/plugins/actions/actions.c
-index e1f1fa7..440f430 100644
+index 5e58078..b16d38e 100644
 --- a/plugins/actions/actions.c
 +++ b/plugins/actions/actions.c
-@@ -977,12 +977,12 @@ actions_plugin_actions_allowed (void)
-   GError          *error =3D NULL;
+@@ -1054,11 +1054,11 @@ actions_plugin_actions_allowed (ActionsPlugin *p=
lugin)
+       g_free (path);
+     }
 =20
-   /* check for commands we use */
 -  path =3D g_find_program_in_path ("dm-tool");
 +  path =3D g_find_program_in_path ("lxdm");
    if (path !=3D NULL)
-     PANEL_SET_FLAG (allow_mask, ACTION_TYPE_SWITCH_USER);
+     {
+       PANEL_SET_FLAG (allow_mask, ACTION_TYPE_SWITCH_USER);
+-      plugin->switch_user_cmd =3D "dm-tool switch-to-greeter";
++      plugin->switch_user_cmd =3D "lxdm -c USER_SWITCH";
+     }
    else
-   {
--    /* check for gdmflexiserver if dm-tool is not present */
-+    /* check for gdmflexiserver if lxdm is not present */
-     g_free (path);
-     path =3D g_find_program_in_path ("gdmflexiserver");
-     if (path !=3D NULL)
-@@ -1099,9 +1099,9 @@ actions_plugin_action_activate (GtkWidget      *wi=
dget,
-       break;
-=20
-     case ACTION_TYPE_SWITCH_USER:
--      path =3D g_find_program_in_path ("dm-tool");
-+      path =3D g_find_program_in_path ("lxdm");
-       if (path !=3D NULL)
--        succeed =3D g_spawn_command_line_async ("dm-tool switch-to-gree=
ter", &error);
-+        succeed =3D g_spawn_command_line_async ("lxdm -c USER_SWITCH", =
&error);
-       else
-         succeed =3D g_spawn_command_line_async ("gdmflexiserver", &erro=
r);
-       g_free (path);
+     {
 --=20
 2.8.1
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
index acc05f13f..250482d2a 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
@@ -2,7 +2,9 @@ SUMMARY =3D "Xfce4 Panel"
 SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D26a8bd75d8f8498bdbbe64a27791d=
4ee"
-DEPENDS =3D "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala=
-native"
+DEPENDS =3D "garcon exo gtk+3 cairo virtual/libx11 libxfce4windowing lib=
xml2 \
+           libwnck3 vala-native \
+           "
=20
 inherit xfce gtk-doc gobject-introspection features_check mime-xdg
=20
@@ -14,9 +16,9 @@ SRC_URI +=3D " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.pat=
ch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] =3D "21337161f58bb9b6e42760cb6883bc79beea27882aa6272b=
61f0e09d750d7c62"
+SRC_URI[sha256sum] =3D "ff33cd5f5d16c2193fe305f4878d82cd8d2feea92f2594bc=
d27b2b5c392d43b8"
=20
-EXTRA_OECONF +=3D "--disable-vala"
+EXTRA_OECONF +=3D "--disable-vala GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIV=
E}/gdbus-codegen"
=20
 python populate_packages:prepend() {
     plugin_dir =3D d.expand('${libdir}/xfce4/panel/plugins/')
--=20
2.34.1


