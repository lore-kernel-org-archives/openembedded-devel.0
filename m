Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9294EC53210
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106406.1671917642593787930
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=gCrnrgnO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLWRPC030212;
	Sat, 24 Dec 2022 21:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=HtBbwLg+f921cH0SoPtJWKRjbh8RHOZ6YKNUZLROfx8=;
 b=gCrnrgnOUl2Hltr537B+i3DX+1u6x+Mmqjsq5N3n1gZyr5h6aaxtv+cXizwCsAsVGndA
 6XJNrprOcF4A0BdY1zhrh/hXi2VcR6tKdAP0vXnXEC+Xfv9BmwXmjsAkRXQobr5AZj1p
 mhhAMg2KTNYfkGX0bwrJzhLDumPkVMDr0ghCgQgSVHbkzxjzvDZ+XI/xUf5hbgyT7Cg+
 NYK+KSctifi1CFOks7bwfX9D43JJz65+KTXxkdhy+BwIQ/lFpYtTbGBf1urKXyd8CPNF
 YIFOdjSrkAecEmgqpxuGWeaDaZAOB4luI5kdH2RHRnjUPkORyHTnpxuq9LuFuA8Zc7fD hw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fd2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:34:01 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:01 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:00 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 06/16] xfce4-panel: 4.16.3 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:37 +0800
Message-ID: <20221224213347.39959-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: iQErStzjyRQnFQQPkQXlWwLhk95G29U5
X-Proofpoint-GUID: iQErStzjyRQnFQQPkQXlWwLhk95G29U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BOLWRPC030212
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100214

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-panel 4.16.3 to 4.18.0
* update license which should be GPL-2.0-or-later
* rebase 0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...o-not-display-desktop-icon-when-no-windo.patch | 15 +++++++++------
 ...fce4-panel_4.16.3.bb =3D> xfce4-panel_4.18.0.bb} |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb =3D> xf=
ce4-panel_4.18.0.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-=
not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfc=
e4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.=
patch
index 1adb14552..10c456f45 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-dis=
play-desktop-icon-when-no-windo.patch
@@ -13,15 +13,19 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Pending
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
+
+Rebase for xfce4 4.18.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  plugins/windowmenu/windowmenu.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/window=
menu.c
-index f47e993e..061d6544 100644
+index ba245a3..f8fdee8 100644
 --- a/plugins/windowmenu/windowmenu.c
 +++ b/plugins/windowmenu/windowmenu.c
-@@ -251,7 +251,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+@@ -250,7 +250,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
    g_signal_connect (G_OBJECT (plugin->button), "toggled",
        G_CALLBACK (window_menu_plugin_menu), plugin);
 =20
@@ -30,16 +34,14 @@ index f47e993e..061d6544 100644
    gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
    gtk_widget_show (plugin->icon);
  }
-@@ -640,7 +640,7 @@ window_menu_plugin_active_window_changed (WnckScreen=
       *screen,
+@@ -680,19 +680,19 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
            /* skip 'fake' windows */
            type =3D wnck_window_get_window_type (window);
            if (type =3D=3D WNCK_WINDOW_DESKTOP || type =3D=3D WNCK_WINDO=
W_DOCK)
 -            goto show_desktop_icon;
 +            goto show_no_icon;
 =20
-           /* get the window icon and set the tooltip */
-           gtk_widget_set_tooltip_text (GTK_WIDGET (icon),
-@@ -660,12 +660,12 @@ window_menu_plugin_active_window_changed (WnckScre=
en       *screen,
+           window_menu_plugin_set_icon (plugin, window);
          }
        else
          {
@@ -47,6 +49,7 @@ index f47e993e..061d6544 100644
 +          show_no_icon:
 =20
            /* desktop is shown right now */
+           icon_size =3D xfce_panel_plugin_get_icon_size (XFCE_PANEL_PLU=
GIN (plugin));
 -          gtk_image_set_from_icon_name (GTK_IMAGE (icon), "user-desktop=
", icon_size);
 +          gtk_image_set_from_icon_name (GTK_IMAGE (icon), NULL, icon_si=
ze);
            gtk_image_set_pixel_size (GTK_IMAGE (icon), icon_size);
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb
index 46d26159a..5dcd69d35 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Xfce4 Panel"
 SECTION =3D "x11"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D26a8bd75d8f8498bdbbe64a27791d=
4ee"
 DEPENDS =3D "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala=
-native"
=20
@@ -10,11 +10,11 @@ inherit xfce gtk-doc gobject-introspection features_c=
heck mime-xdg
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[sha256sum] =3D "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8f=
d9f066379af1e092"
 SRC_URI +=3D " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.pat=
ch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
+SRC_URI[sha256sum] =3D "be80023fd546587831bab25ded15ae4c9e346289a75744b6=
ba4cf4ee53794710"
=20
 EXTRA_OECONF +=3D "--disable-vala"
=20
--=20
2.17.1


