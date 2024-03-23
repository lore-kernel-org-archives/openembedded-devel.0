Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6428ACD1287
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5312.1711183280320002520
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 3FDA3452E8
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwD-1MMRGc0; Sat, 23 Mar 2024 09:41:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/13] gnome-system-monitor: update 45.0.1 -> 46.0
Date: Sat, 23 Mar 2024 09:41:27 +0100
Message-ID: <20240323084138.178281-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183273-0CA7E850-A810257C/0/0 CLEAN NORMAL
X-TOI-MSGID: ef163739-20f6-4cbf-a2b7-e0ab29b9b247
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109533

- gnome-system-monitor was ported to gtk4

New in 46.0 - 16 March 2024

* Updated translations
* style: Blend header bar with window contents !126 (kramo)

New in 46.rc - 2 March 2024

* Updated translations
* interface: Readd Delete key as shortcut to end process !128 (=C3=93scar=
 Fern=C3=A1ndez D=C3=ADaz)
* Fixed memory leak in affinity change !129 (Yannis Gerlach)
* Updated app links !130 (=C3=93scar Fern=C3=A1ndez D=C3=ADaz)
* Metainformation improvements: correct developer and platform added (Sop=
hie Herold)

New in 46.beta - 11 February 2024

* Updated translations
* Fixed several memory leaks (Barnab=C3=A1s P=C5=91cze)
* Fixed several plotting issues (Barnab=C3=A1s P=C5=91cze)
* Partial rework of graph class hierarchy (Robert Roth)
* Remember window state #295 (=C3=93scar Fern=C3=A1ndez D=C3=ADaz)
* Renamed appdata to match desktop file !124 (=C3=93scar Fern=C3=A1ndez D=
=C3=ADaz)

New in 46.alpha - 6 January 2024

* Updated translations
* Application ported to GTK4 (Ond=C5=99ej M=C3=ADchal)
* Fixed shortcuts #262 (Robert Roth)
* Fixed highcontrast graph labels #266 (Robert Roth)
* Fixed argument type mismatch !82 (Barnab=C3=A1s P=C5=91cze)
* Updated UI to match Human Interface Guidelines !84 (Automeris Naranja)
* Ported various application components to adwaita (=C3=93scar Fern=C3=A1=
ndez D=C3=ADaz)
* Added flatpak build manifest !113 (=C3=93scar Fern=C3=A1ndez D=C3=ADaz)
* Various code improvements (=C3=93scar Fern=C3=A1ndez D=C3=ADaz)
* Appdata updates !114 (Sabri =C3=9Cnal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...stem-monitor_45.0.1.bb =3D> gnome-system-monitor_46.0.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_45.0.1.bb =3D> gnome-system-monitor_46.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_45.0.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-sy=
stem-monitor_46.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_45.0.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_46.0.bb
index b90bbb8e5..eaeaa2cb0 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
46.0.bb
@@ -6,7 +6,10 @@ DEPENDS =3D " \
     gnome-common-native \
     libxml2-native \
     glib-2.0-native \
-    gtkmm3 \
+    glibmm-2.68 \
+    gtkmm4 \
+    gtk4 \
+    libadwaita \
     libgtop \
     librsvg \
     polkit \
@@ -22,7 +25,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "43f6b7805c74532490edb8822ebdf8b3cf2c5ef8=
42a51252a14c34715f5d49b4"
+SRC_URI[archive.sha256sum] =3D "5376248158c686c308255472e8c2a9e4c1725564=
2c149fc7198c6d034e547599"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
--=20
2.44.0


