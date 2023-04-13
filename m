Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93DEC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:27:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5638.1681363642221490846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=HHvqoovx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467d2966e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D5RHtY020772
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=iTgti/ugXIvDpQ2gPhoy1UYb6YCKSn59kcLNi9pSo58=;
 b=HHvqoovxsWXO1leFyu+Gf4CfL/iwU0fweWJKx533E+r3hMlA7EHi5wN4j0Xm1iaXfCXs
 jgFoUFTNM2x9qxOVVRDnqDkCA9JrGGWfCqub/UZ1R4Ck+D88Plu8RLHTFQqdYr6Xddtf
 QgxcXzbRTlLuxn5/Y8C2jLkzE80XmwyTf0559GqEOow2TQPxpSTcyOpGX/GI7lbMO4Ha
 ds0mOSAtaUl4LmvPdDlwk+AnyARzYCqQvsGGEKoC1ph11rDgXxqL0ELzv8CmOgExoaCS
 OyFmH04y24rM2iUa5Ggz28BdVFpREOTmG/I/V1At39quuvPwhD8KgCoXZ2uhEyJwT998 kQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2g6ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 22:27:21 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 22:27:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/5] xfce4-panel: 4.18.0 -> 4.18.3
Date: Thu, 13 Apr 2023 13:27:14 +0800
Message-ID: <20230413052715.23982-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413052715.23982-1-kai.kang@windriver.com>
References: <20230413052715.23982-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 1mVomEe9xWIh4nhCd14cMf6pp_zYPwKz
X-Proofpoint-GUID: 1mVomEe9xWIh4nhCd14cMf6pp_zYPwKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_02,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33D5RHtY020772
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102071

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-panel from 4.18.0 to 4.18.3

* rebase 2 patches

Release notes for 4.18.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- launcher: Show action menu also when there are several items
- Fix memory management of vala generated plugins
- panel: Rephrase "Don't reserve space on borders" (V2)
- panel: Make property migration generic
- launcher: Avoid "no trigger event" warning when showing the menu
- launcher: Guard access to the plugin menu GdkWindow
- libxfce4panel: Unregister menu also on GtkWidget::hide
- panel: Do not reset output name if a monitor does not have a model name
- libxfce4panel: Fix memory management of source for menu positioning
- panel: Delay removal of ExternalPlugin to prevent use-after-free
- systray: Cancel any async D-Bus operation in finalize()
- tasklist: Do not try to resolve /proc/pid/exe to launch new instance
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian, English
  (Australia), English (United Kingdom), Estonian, Finnish, French,
  Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
  Italian, Japanese, Kazakh, Korean, Lithuanian, Malay, Norwegian
  Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1500), Polish, Portuguese=
,
  Portuguese (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur, Vietnamese

Release notes for 4.18.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- directorymenu: Add missing sanity check
- panel: Properly handle null string as property default value
- Revert "Use RGBA visual only if compositing is enabled (Fixes #251)" (#=
672)
- Revert "systray: Do not require compositing to be enabled to use RGBA v=
isual"
- systray: Fix blurry icons in prefs dialog when UI scale &gt; 1
- launcher: Fix blurry icons in prefs and add dialogs when UI scale &gt; =
1
- launcher: Use GIcon for the tooltip icon (#674)
- pager: Use WnckHandle if available (#695)
- Translation Updates:
  Albanian, Finnish, Greek, Italian, Portuguese, Slovenian

Release notes for 4.18.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Update copyright year
- tasklist: Fix scrolling through window buttons (Fixes #692)
- tasklist: Fix group button visibility
- libxfce4panel: Deprecate XfcePanelImage
- tasklist: Do not duplicate menu item activation
- clock: Fix sync timeout
- docs: Fix version for xfce_panel_set_image_from_source()
- clock: Add missing sanity check
- windowmenu: Adapt wnck default icon size when UI scale &gt; 1 (Fixes #6=
82)
- tasklist: Adapt wnck default icon size when UI scale &gt; 1 (Fixes #681=
)
- tasklist: Fix window count positioning when UI scale &gt; 1
- tasklist: Keep icon pixbuf around and use surface also for menu items
- clock: Do not override custom font formats
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (United Kingdom),
  Estonian, Finnish, French, Galician, Georgian, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Norwegian
  Nynorsk, Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese,
  Portuguese (Brazil), Romanian, Russian, Serbian, Sinhala, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur,
  Vietnamese

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...enu-do-not-display-desktop-icon-when-no-windo.patch | 10 +++++-----
 .../files/0002-use-lxdm-to-replace-dm-tool.patch       | 10 +++++++---
 .../{xfce4-panel_4.18.0.bb =3D> xfce4-panel_4.18.3.bb}   |  2 +-
 3 files changed, 13 insertions(+), 9 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.0.bb =3D> xf=
ce4-panel_4.18.3.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-=
not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfc=
e4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.=
patch
index 10c456f45..154f72d18 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
@@ -14,7 +14,7 @@ Upstream-Status: Pending
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
=20
-Rebase for xfce4 4.18.0.
+Rebase for xfce4-panel 4.18.3.
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
@@ -22,10 +22,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/window=
menu.c
-index ba245a3..f8fdee8 100644
+index be7dea4..2f432b0 100644
 --- a/plugins/windowmenu/windowmenu.c
 +++ b/plugins/windowmenu/windowmenu.c
-@@ -250,7 +250,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+@@ -262,7 +262,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
    g_signal_connect (G_OBJECT (plugin->button), "toggled",
        G_CALLBACK (window_menu_plugin_menu), plugin);
 =20
@@ -33,8 +33,8 @@ index ba245a3..f8fdee8 100644
 +  plugin->icon =3D gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BU=
TTON);
    gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
    gtk_widget_show (plugin->icon);
- }
-@@ -680,19 +680,19 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
+=20
+@@ -695,19 +695,19 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
            /* skip 'fake' windows */
            type =3D wnck_window_get_window_type (window);
            if (type =3D=3D WNCK_WINDOW_DESKTOP || type =3D=3D WNCK_WINDO=
W_DOCK)
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-re=
place-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-l=
xdm-to-replace-dm-tool.patch
index b06e26e91..66a33c722 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-d=
m-tool.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-d=
m-tool.patch
@@ -9,15 +9,19 @@ so use lxdm to replace dm-tool
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase for xfce4-panel 4.18.3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  plugins/actions/actions.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/plugins/actions/actions.c b/plugins/actions/actions.c
-index 474798e..63eb41d 100644
+index e1f1fa7..440f430 100644
 --- a/plugins/actions/actions.c
 +++ b/plugins/actions/actions.c
-@@ -905,12 +905,12 @@ actions_plugin_actions_allowed (void)
+@@ -977,12 +977,12 @@ actions_plugin_actions_allowed (void)
    GError          *error =3D NULL;
 =20
    /* check for commands we use */
@@ -32,7 +36,7 @@ index 474798e..63eb41d 100644
      g_free (path);
      path =3D g_find_program_in_path ("gdmflexiserver");
      if (path !=3D NULL)
-@@ -1027,9 +1027,9 @@ actions_plugin_action_activate (GtkWidget      *wi=
dget,
+@@ -1099,9 +1099,9 @@ actions_plugin_action_activate (GtkWidget      *wi=
dget,
        break;
 =20
      case ACTION_TYPE_SWITCH_USER:
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
index 5dcd69d35..7e7075443 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
@@ -14,7 +14,7 @@ SRC_URI +=3D " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.pat=
ch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] =3D "be80023fd546587831bab25ded15ae4c9e346289a75744b6=
ba4cf4ee53794710"
+SRC_URI[sha256sum] =3D "4ae0b8615c9811194bbda0172a63567ed7fdb5519ea48f7a=
4637f4e6e5365e1b"
=20
 EXTRA_OECONF +=3D "--disable-vala"
=20
--=20
2.17.1


