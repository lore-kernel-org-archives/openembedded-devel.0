Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782E4C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 17:09:14 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.117.1675184944563498296
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 09:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id 662FF14C42
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:09:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.44]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pMu7y-12tof50; Tue, 31 Jan 2023 18:09:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 3/3] blueman: add missing runtime dependency, add polkit rule
Date: Tue, 31 Jan 2023 18:08:48 +0100
Message-Id: <20230131170848.367522-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131170848.367522-1-f_l_k@t-online.de>
References: <20230131170848.367522-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675184942-11794992-C47D924C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ef7cb29-d366-4206-be16-bb611a6efb5e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 17:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100881

Add a missing runtime dependency on python3-ctypes

Add a polkit rule to allow users of group wheel to use blueman without au=
thentification

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../blueman/blueman_2.3.5.bb                  | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index 2343cec71..eb42e62f4 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
=20
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd
=20
 SRC_URI =3D " \
     git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-3-stable \
@@ -23,6 +23,7 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
 RRECOMMENDS:${PN} +=3D "adwaita-icon-theme"
 RDEPENDS:${PN} +=3D " \
     python3-core \
+    python3-ctypes \
     python3-dbus \
     python3-pygobject \
     python3-terminal \
@@ -58,3 +59,28 @@ do_install:append() {
                                               ${D}${bindir}/blueman-tray
 }
=20
+do_install:append() {
+    install -d ${D}${datadir}/polkit-1/rules.d
+    cat >${D}${datadir}/polkit-1/rules.d/51-blueman.rules <<EOF
+/* Allow users in wheel group to use blueman feature requiring root with=
out authentication */
+polkit.addRule(function(action, subject) {
+    if ((action.id =3D=3D "org.blueman.network.setup" ||
+         action.id =3D=3D "org.blueman.dhcp.client" ||
+         action.id =3D=3D "org.blueman.rfkill.setstate" ||
+         action.id =3D=3D "org.blueman.pppd.pppconnect") &&
+        subject.isInGroup("wheel")) {
+
+        return polkit.Result.YES;
+    }
+});
+EOF
+}
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
+
+do_install:append() {
+        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
--=20
2.34.1


