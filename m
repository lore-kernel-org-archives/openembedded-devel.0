Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C24C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 16:36:20 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.262.1748450169581353774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 09:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 7F88181F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 18:36:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.238.136]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uKJl7-1Y0GeH0; Wed, 28 May 2025 18:36:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv2] networkmanager: update 1.50.0 -> 1.52.0
Date: Wed, 28 May 2025 18:36:00 +0200
Message-ID: <20250528163600.1506377-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1748450165-1A7FB90A-09A7771C/0/0 CLEAN NORMAL
X-TOI-MSGID: 8287bffd-f3e0-4cdc-bc50-9741e3582407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 16:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117648

- there is no tarball hosted at gnome anymore -> switch from
  gnomebase class to meson + git
- add missing dependencies for uuid and nvme, add pkgconfig class
- dhcpcanon option was removed upstream
- gtkdoc is broken. Disable to unbreak builds if api-documentation
  is enabled

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...rkmanager_1.50.0.bb =3D> networkmanager_1.52.0.bb} | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.50.0.bb =3D> networkmanager_1.52.0.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.50.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.52.0.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.50.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.52.0.bb
index 702b80ac68..dd894c0900 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.50.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.52.0.bb
@@ -25,32 +25,34 @@ DEPENDS =3D " \
     intltool-native \
     libxslt-native \
     libnl \
+    libnvme \
     udev \
     util-linux \
+    util-linux-libuuid \
     libndp \
     curl \
     dbus \
 "
 DEPENDS:append:class-target =3D " bash-completion"
=20
-inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-=
doc update-alternatives upstream-version-is-even
+inherit meson gettext update-rc.d systemd gobject-introspection update-a=
lternatives upstream-version-is-even pkgconfig
=20
 SRC_URI =3D " \
-    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
+    git://github.com/NetworkManager/NetworkManager.git;protocol=3Dhttps;=
branch=3Dmain;tag=3D${PV} \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
 SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patc=
h', '', d)}"
=20
-SRC_URI[sha256sum] =3D "fc03e7388a656cebc454c5d89481626122b1975d7c26babc=
64dc7e488faa66e3"
+SRCREV =3D "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
=20
-S =3D "${WORKDIR}/NetworkManager-${PV}"
+S =3D "${WORKDIR}/git"
=20
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
=20
-# ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
+# ['dhclient', 'dhcpcd', 'internal', 'nettools']
 NETWORKMANAGER_DHCP_DEFAULT ??=3D "internal"
=20
 # The default gets detected based on whether /usr/sbin/nft or /usr/sbin/=
iptables is installed, with nftables preferred.
@@ -65,7 +67,6 @@ EXTRA_OEMESON =3D "\
     -Dqt=3Dfalse \
     -Dconfig_dns_rc_manager_default=3D${NETWORKMANAGER_DNS_RC_MANAGER_DE=
FAULT} \
     -Dconfig_dhcp_default=3D${NETWORKMANAGER_DHCP_DEFAULT} \
-    -Ddhcpcanon=3Dfalse \
     -Diptables=3D${sbindir}/iptables \
     -Dnft=3D${sbindir}/nft \
 "
--=20
2.49.0


