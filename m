Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07F9C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 01:13:25 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.28060.1699838000906204896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 17:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id BB8D9ADA4
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 02:13:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.200]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2LVs-25JNwX0; Mon, 13 Nov 2023 02:13:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] ghex: backport patch to fix build for clang
Date: Mon, 13 Nov 2023 02:13:35 +0100
Message-ID: <20231113011336.2843244-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699837996-E4E0893F-3DBA8D03/0/0 CLEAN NORMAL
X-TOI-MSGID: f56daf7f-5adb-47d6-82be-9f2cf532fe0a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 01:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106621

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...iables-in-switch-statement-should-be.patch | 50 +++++++++++++++++++
 meta-gnome/recipes-gnome/ghex/ghex_45.0.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-=
variables-in-switch-statement-should-be.patch

diff --git a/meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variabl=
es-in-switch-statement-should-be.patch b/meta-gnome/recipes-gnome/ghex/gh=
ex/0001-gtkhex-Local-variables-in-switch-statement-should-be.patch
new file mode 100644
index 000000000..61cd3b180
--- /dev/null
+++ b/meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variables-in-s=
witch-statement-should-be.patch
@@ -0,0 +1,50 @@
+From b00b8332ab19e41c75ce143f45ab4585502c020b Mon Sep 17 00:00:00 2001
+From: Logan Rathbone <poprocks@gmail.com>
+Date: Tue, 24 Oct 2023 14:06:04 -0400
+Subject: [PATCH] gtkhex: Local variables in switch statement should be i=
n own
+ scope
+
+Fixes: #74
+
+Thanks to: David C. Manuelda
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/ghex/-/commit/=
b00b8332ab19e41c75ce143f45ab4585502c020b]
+---
+ src/gtkhex.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gtkhex.c b/src/gtkhex.c
+index b401cd9..18e0433 100644
+--- a/src/gtkhex.c
++++ b/src/gtkhex.c
+@@ -1941,6 +1941,7 @@ key_press_cb (GtkEventControllerKey *controller,
+ 			break;
+=20
+ 		case GDK_KEY_Home:
++		{
+ 			gint64 line_beg =3D self->cursor_pos;
+=20
+ 			while (line_beg % self->cpl !=3D 0)
+@@ -1948,9 +1949,11 @@ key_press_cb (GtkEventControllerKey *controller,
+=20
+ 			hex_widget_set_cursor (self, line_beg);
+ 			ret =3D GDK_EVENT_STOP;
++		}
+ 			break;
+=20
+ 		case GDK_KEY_End:
++		{
+ 			gint64 line_end =3D self->cursor_pos;
+=20
+ 			while (line_end % self->cpl !=3D self->cpl - 1)
+@@ -1958,6 +1961,7 @@ key_press_cb (GtkEventControllerKey *controller,
+=20
+ 			hex_widget_set_cursor (self, MIN (line_end, payload_size));
+ 			ret =3D GDK_EVENT_STOP;
++		}
+ 			break;
+=20
+ 		default:
+--=20
+2.42.0
+
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_45.0.bb
index 6d3e9b978..42c53471b 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
@@ -15,6 +15,7 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-in=
trospection vala gi-docgen
=20
+SRC_URI +=3D "file://0001-gtkhex-Local-variables-in-switch-statement-sho=
uld-be.patch"
 SRC_URI[archive.sha256sum] =3D "05cecc4561ca40b257c5db31da9f68d696133efc=
0ae427ed82fb985a986e840e"
=20
 FILES:${PN} +=3D "${libdir} ${datadir}/metainfo"
--=20
2.42.0


