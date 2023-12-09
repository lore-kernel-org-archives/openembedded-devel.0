Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFA0C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 17:08:35 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.13631.1702141710558606234
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Dec 2023 09:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 756566B546
	for <openembedded-devel@lists.openembedded.org>; Sat,  9 Dec 2023 18:08:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.193]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rC0oT-19GgtN0; Sat, 9 Dec 2023 18:08:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] tracker: dont inherit gsettings
Date: Sat,  9 Dec 2023 18:09:03 +0100
Message-ID: <20231209170903.672584-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1702141705-D7FFC93F-861451BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 04e239c6-1ec7-4304-a7b3-0ae5912da767
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Dec 2023 17:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107320

this fixes an issue I encountered on raspberrypi4-64 at do_rootfs:
ERROR: hyprland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['track=
er'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /home/flk/poky/build-raspi/tmp/work/raspber=
rypi4_64-poky-linux/hyprland-image/1.0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /home/flk/poky/build-raspi/tmp/work/=
raspberrypi4_64-poky-linux/hyprland-image/1.0/temp/log.do_rootfs.629667
ERROR: Task (/home/flk/poky/meta-hyprland-image/recipes-core/images/hyprl=
and-image.bb:do_rootfs) failed with exit code '1'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.6.0.bb
index c5b5c4eab..603efbb32 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
@@ -19,7 +19,7 @@ DEPENDS =3D " \
 "
=20
=20
-inherit gettext gnomebase gsettings gobject-introspection vala gtk-doc  =
bash-completion python3native
+inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion python3native
=20
 SRC_URI +=3D "file://0001-fix-reproducibility.patch"
 SRC_URI[archive.sha256sum] =3D "52592cfe19baffd16dbe47475be7da750dbd0b63=
33fd7acb60faa9da5bc40df2"
--=20
2.42.1


