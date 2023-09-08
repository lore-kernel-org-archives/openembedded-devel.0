Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B723CEE57EE
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 10:05:15 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.35585.1694167511167604828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 03:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id A008C815A
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Sep 2023 12:05:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.221]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qeYML-2YIfbN0; Fri, 8 Sep 2023 12:05:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libei: add recipe
Date: Fri,  8 Sep 2023 12:05:00 +0200
Message-ID: <20230908100500.755300-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1694167505-9A8249C6-6BD5221F/0/0 CLEAN NORMAL
X-TOI-MSGID: db41467e-06f5-4a7c-bc0e-97c0bed65d25
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 10:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104801

libei is a library for Emulated Input, primarily aimed at the Wayland sta=
ck.
It uses a typical client/server separation, with the two parts connected =
via
a UNIX socket. In libei parlance, the client-side is called =E2=80=9CEI c=
lient=E2=80=9D, the
server side, typically a Wayland compositor, is called the =E2=80=9CEIS I=
mplementation=E2=80=9D
(Emulated Input Server).

libei is a required dependency for the upcoming mutter-45 release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-graphics/wayland/libei_1.1.0.bb   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/wayland/libei_1.1.0.bb

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.1.0.bb b/meta-oe/re=
cipes-graphics/wayland/libei_1.1.0.bb
new file mode 100644
index 000000000..1727ef9be
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/libei_1.1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "libei is a library for Emulated Input, primarily aimed at t=
he Wayland stack."
+HOMEPAGE =3D "https://gitlab.freedesktop.org/libinput/libei"
+SECTION =3D "graphics"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da98fa76460f96f41696611d6f07e8=
d49"
+
+DEPENDS =3D " \
+	libxkbcommon \
+	libevdev \
+	libxslt-native \
+	python3-attrs-native \
+	python3-jinja2-native \
+	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d=
)} \
+"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libei.git;protocol=3D=
https;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "82cdbc9129a0e2c255fcee6bcaa7abed5578ae14"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
+
--=20
2.41.0


