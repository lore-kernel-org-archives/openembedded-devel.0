Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52767C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 17:09:44 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.131.1675184983593129009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 09:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 52DA011DB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:09:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.44]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pMu7y-12tof40; Tue, 31 Jan 2023 18:09:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/3] system-config-printer: add recipe
Date: Tue, 31 Jan 2023 18:08:47 +0100
Message-Id: <20230131170848.367522-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131170848.367522-1-f_l_k@t-online.de>
References: <20230131170848.367522-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675184942-11794992-9CCC9E4A/0/0 CLEAN NORMAL
X-TOI-MSGID: eb6e4918-a00a-4be4-952a-b8bf0c8a17e6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 17:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100882

The OpenPrinting gui for cups configuration

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../system-config-printer_1.5.18.bb           | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-printing/system-config-printer/system=
-config-printer_1.5.18.bb

diff --git a/meta-oe/recipes-printing/system-config-printer/system-config=
-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/syste=
m-config-printer_1.5.18.bb
new file mode 100644
index 000000000..57b238929
--- /dev/null
+++ b/meta-oe/recipes-printing/system-config-printer/system-config-printe=
r_1.5.18.bb
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
+DEPENDS =3D "cups glib-2.0 libusb systemd xmlto-native intltool-native d=
esktop-file-utils-native"
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
+    python3 \
+    python3-dbus \
+    python3-firewall \
+    python3-pycups \
+    python3-pycurl \
+    python3-pygobject \
+"
+
+# ignore 'requires /usr/bin/python3, but no providers found in RDEPENDS:=
system-config-printer? [file-rdeps]'
+INSANE_SKIP:${PN} =3D "file-rdeps"
--=20
2.34.1


