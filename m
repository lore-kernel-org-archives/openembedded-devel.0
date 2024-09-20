Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE3FCF9C52
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20594.1726844890014147942
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C2DE9DE4A
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0T0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/23] gnome-system-monitor_46.0 -> 47.0
Date: Fri, 20 Sep 2024 17:08:12 +0200
Message-ID: <20240920150822.1131707-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844862-D57F8467-AA87E51B/0/0 CLEAN NORMAL
X-TOI-MSGID: f5a7e006-d426-4ed1-ade2-3eca75e8f000
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112415

New in 47.0 - 14 September 2024
* Updated translations
* Fix blurred background on HiDPI screens !160 #300 (Qiu Wenbo)
New in 47.rc - 31 August 2024
* Updated translations
* Minor improvements in defaults and settings loading (=C3=93scar Fern=C3=
=A1ndez D=C3=ADaz)
New in 47.beta - 2 August 2024
* Updated translations
* Fix help and version crashing the application #260 !148 (luiz)
* UI modernization for dialogs and disks view !150, !152, !153, !154 (=C3=
=93scar Fern=C3=A1ndez D=C3=ADaz)
* Improve initial loadgraph points #248 !151 (Luiz Fran=C3=A7a)
New in 47.alpha - 29 June 2024
* Updated translations
* Improved flatpak app icon search !132 (=C3=93scar Fern=C3=A1ndez D=C3=AD=
az)
* Set affinity for all tasks !134 (Yannis Gerlach)
* Use new Adwaita adaptive dialogs !125 (=C3=93scar Fern=C3=A1ndez D=C3=AD=
az)
* Use same translatable for CPU charts and affinty #203 (Robert Roth)
* Several migrations from deprecated treeview to columnview (=C3=93scar F=
ern=C3=A1ndez D=C3=ADaz)
* Migrate color button to GtkColorDialog (=C3=93scar Fern=C3=A1ndez D=C3=AD=
az)
* Add one column per group of 32 core labels !144 (Yannis Guyon)
* Various interface improvements to match HIG (=C3=93scar Fern=C3=A1ndez =
D=C3=ADaz)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-system-monitor_46.0.bb =3D> gnome-system-monitor_47.0.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_46.0.bb =3D> gnome-system-monitor_47.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_46.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_47.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_47.0.bb
index eaeaa2cb0..721ae5a94 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
47.0.bb
@@ -22,10 +22,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-ico=
n-cache features_check get
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-def gnome_verdir(v):
-    return oe.utils.trim_version(v, 1)
-
-SRC_URI[archive.sha256sum] =3D "5376248158c686c308255472e8c2a9e4c1725564=
2c149fc7198c6d034e547599"
+SRC_URI[archive.sha256sum] =3D "ede7b925eb714d8b3c2bfbf7405a1b714494fe47=
e02f0af08f5837b3e256547f"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
--=20
2.46.0


