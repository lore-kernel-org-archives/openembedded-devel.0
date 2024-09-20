Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ED6C78859
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20590.1726844888031088788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B12E91687F
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0J0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/23] gnome-remote-desktop: update 46.2 -> 47.0
Date: Fri, 20 Sep 2024 17:08:02 +0200
Message-ID: <20240920150822.1131707-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844861-F6FFB467-8DDA67E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d948e67-404a-40cd-b13f-75a5301f2198
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112405

47.0
=3D=3D=3D=3D

Translators:
  Sabri =C3=9Cnal [tr], Davide Ferracin [it], Fran Dieguez [gl],
  Aurimas =C4=8Cernius [lt], Efstathios Iosifidis [el], twlvnn kraftwerk =
[bg],
  Alexander Shopov [bg], Daniel [es], Ir=C3=A9n=C3=A9e THIRION [fr], Ande=
rs Jonsson [sv],
  Andika Triwidada [id], Andi Chandler [en_GB], Piotr Dr=C4=85g [pl], Mar=
tin [sl],
  Danial Behzadi [fa], Bal=C3=A1zs =C3=9Ar [hu], Jordi Mas i Hernandez [c=
a],
  Emin Tufan =C3=87etin [tr], Luming Zh [zh_CN], Ekaterine Papava [ka],
  Juliano de Souza Camargo [pt_BR], Daniel Rusek [cs], Yuri Chornoivan [u=
k],
  Tim Sabsch [de], Ask Hjorth Larsen [da], Bruce Cowan [en_GB], Artur S0 =
[ru],
  Quentin PAG=C3=88S [oc], Vasil Pupkin [be], Jose Riha [sk], Yaron Shahr=
abani [he]

47.rc
=3D=3D=3D=3D=3D
* Reduce resource usage of unauthenticated sessions

Contributors:
  Pascal Nowack

Translators:
  Jordi Mas i Hernandez [ca], Daniel =C8=98erb=C4=83nescu [ro], Vasil Pup=
kin [be],
  Ekaterine Papava [ka], Yuri Chornoivan [uk], Luming Zh [zh_CN],
  Asier Sarasua Garmendia [eu], Jiri Gr=C3=B6nroos [fi], Rafael Fontenell=
e [pt_BR],
  Jose Riha [sk], Danial Behzadi [fa], Daniel Rusek [cs], Seong-ho Cho [k=
o],
  Hugo Carvalho [pt]

47.beta
=3D=3D=3D=3D=3D=3D=3D
* Gracefully handle file descriptor limits
* Introduce standalone configuration D-Bus service
* Improve grdctl status reporting
* Gracefully handle invalid x224Crq data
* Fix file descriptor leak

Contributors:
  Pascal Nowack, Joan Torres

Translators:
  Artur S0 [ru], Scrambled 777 [hi], Yaron Shahrabani [he], Junting Wu [z=
h_TW],
  Emin Tufan =C3=87etin [tr]

47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* Support persistent remote login sessions
* Support entering new credentials via standard input when using grdctl
* Use access portal dialogs for warning about connection insecurity
* Avoid crash when getting invalid PipeWire buffers

Contributors:
  Dudemanguy, Pascal Nowack, Ray Strode, Joan Torres

Translators:
  Martin [sl], Bal=C3=A1zs =C3=9Ar [hu]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-remote-desktop_46.2.bb =3D> gnome-remote-desktop_47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_46.2.bb =3D> gnome-remote-desktop_47.0.bb=
} (91%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_46.2.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_47.0=
.bb
similarity index 91%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_46.2.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_47.0.bb
index a16a02aa7..38a8cc01a 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.2.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_47.0.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "97443eaffe4b1a69626886a41d25cbeb2c148d3f=
ed43d92115c1b7d20d5238ab"
+SRC_URI[archive.sha256sum] =3D "8aa55775757b299debe417e169e6e28fecbf18ce=
611ed176fa0d650ab5344776"
=20
 DEPENDS =3D " \
     asciidoc-native \
--=20
2.46.0


