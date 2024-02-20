Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B7DC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 07:19:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.8419.1708413565284881536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 23:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 5158F5C6A;
	Tue, 20 Feb 2024 08:19:23 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.43.200]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rcKPS-1M1GV70; Tue, 20 Feb 2024 08:19:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv2] gedit: update 46.1 -> 46.2
Date: Tue, 20 Feb 2024 08:19:30 +0100
Message-ID: <20240220071934.10184-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1708413562-2E7FB9FB-EE0D0223/0/0 CLEAN NORMAL
X-TOI-MSGID: 975d246d-e650-4465-9e7a-9e97f1bf9059
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 07:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108917

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gedit/gedit/0001-fix-for-clang-18.patch   | 32 +++++++++++++++++++
 .../gedit/{gedit_46.1.bb =3D> gedit_46.2.bb}    |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-cla=
ng-18.patch
 rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb}=
 (89%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.p=
atch b/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch
new file mode 100644
index 000000000..40fd93b98
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch
@@ -0,0 +1,32 @@
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/gedit/-/i=
ssues/588]
+
+Temporary workaround to fix build:
+../plugins/quickhighlight/gedit-quick-highlight-plugin.c: In function =E2=
=80=98gedit_quick_highlight_plugin_load_style=E2=80=99:
+../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:47: error: i=
mplicit declaration of function =E2=80=98gtk_source_style_copy=E2=80=99; =
did you mean =E2=80=98gtk_source_style_apply=E2=80=99? [-Wimplicit-functi=
on-declaration]
+
+   96 |                         plugin->priv->style =3D gtk_source_style=
_copy (style);
+      |                                               ^~~~~~~~~~~~~~~~~~=
~~~
+      |                                               gtk_source_style_a=
pply
+../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:47: warning:=
 nested extern declaration of =E2=80=98gtk_source_style_copy=E2=80=99 [-W=
nested-externs]
+../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:45: error: a=
ssignment to =E2=80=98GtkSourceStyle *=E2=80=99 {aka =E2=80=98struct _Gtk=
SourceStyle *=E2=80=99} from =E2=80=98int=E2=80=99 makes pointer from int=
eger without a cast [-Wint-conversion]
+   96 |                         plugin->priv->style =3D gtk_source_style=
_copy (style);
+      |                                             ^
+
+--- a/plugins/quickhighlight/gedit-quick-highlight-plugin.c	2024-02-20 0=
8:11:47.925749255 +0100
++++ b/plugins/quickhighlight/gedit-quick-highlight-plugin.c	2024-02-20 0=
8:12:16.218594067 +0100
+@@ -90,11 +90,12 @@
+ 	if (style_scheme !=3D NULL)
+ 	{
+ 		style =3D gtk_source_style_scheme_get_style (style_scheme, "quick-hig=
hlight-match");
+-
++#if 0
+ 		if (style !=3D NULL)
+ 		{
+ 			plugin->priv->style =3D gtk_source_style_copy (style);
+ 		}
++#endif
+ 	}
+ }
+=20
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
index c0221b9a7..6cdc33c1c 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
@@ -23,7 +23,8 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc get
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016=
b1e17e869caf5bfb94c6aa4e"
+SRC_URI +=3D "file://0001-fix-for-clang-18.patch"
+SRC_URI[archive.sha256sum] =3D "c0866412bad147ebace2d282ffcbb5a0e9a304b2=
0fd55640bee21c81e6d501ef"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.43.0


