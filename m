Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738E3C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 00:00:12 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.2616.1675296010063450163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 16:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 65AB91CDF4
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Feb 2023 01:00:01 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.155]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pNN1E-3JgJ4z0; Thu, 2 Feb 2023 01:00:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCHv5] system-config-printer: add recipe
Date: Thu,  2 Feb 2023 00:59:45 +0100
Message-Id: <20230201235945.1955001-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675296000-521BFA0B-F4332C4E/0/0 CLEAN NORMAL
X-TOI-MSGID: 973632c2-4a93-4af3-9afc-30c4d5c11000
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 00:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100910

The OpenPrinting gui for cups configuration

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../system-config-printer_1.5.18.bb           | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-networking/dynamic-layers/meta-python/recipes-pr=
inting/system-config-printer/system-config-printer_1.5.18.bb

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
new file mode 100644
index 000000000..e70edef27
--- /dev/null
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -0,0 +1,36 @@
+DESCRIPTION =3D "a graphical user interface that allows the user to chan=
ge print settings"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+SRC_URI =3D "git://github.com/OpenPrinting/system-config-printer.git;pro=
tocol=3Dhttps;branch=3Dmaster"
+
+SRCREV =3D "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
+S =3D "${WORKDIR}/git"
+
+inherit autotools gettext pkgconfig python3native features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+
+DEPENDS =3D "cups glib-2.0 libusb xmlto-native intltool-native desktop-f=
ile-utils-native"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+PACKAGECONFIG[systemd] =3D ",,systemd"
+
+do_configure:prepend() {
+    # This file is not provided if fetching from git but required for co=
nfigure
+    touch ${S}/ChangeLog
+}
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
+
+RDEPENDS:${PN} =3D " \
+    dbus-x11 \
+    gtk+3 \
+    libnotify \
+    python3-core \
+    python3-dbus \
+    python3-firewall \
+    python3-pycups \
+    python3-pycurl \
+    python3-pygobject \
+"
--=20
2.34.1


