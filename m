Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEA4C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:45:03 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7461.1692942301665094944
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id E0F6246AD1
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:44:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZPcw-2AQiNl0; Fri, 25 Aug 2023 07:44:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] spice-guest-vdagent: add recipe
Date: Fri, 25 Aug 2023 07:44:45 +0200
Message-ID: <20230825054449.2315061-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692942298-D37F3029-1756AF69/0/0 CLEAN NORMAL
X-TOI-MSGID: 059edb20-5b53-48d4-8cdb-9147adb7a4a9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 05:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104592

The spice-vdagent needs to be running alongside qemu-guest-agent on
virtualizationguest systems that are using the spice protocol to
get seamless integration.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../spice/spice-guest-vdagent_0.22.1.bb       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice-guest-vda=
gent_0.22.1.bb

diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.=
1.bb
new file mode 100644
index 0000000000..8894d58e21
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Spice agent for Linux"
+HOMEPAGE =3D "https://spice-space.org"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+SRCREV =3D "aa08162f036840d3e33502dc0a836b03b9cec97c"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;proto=
col=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
+
+EXTRA_OECONF =3D " \
+	--with-gtk4 \
+	--enable-pie \
+"
+
+FILES:${PN} +=3D "${datadir}"
+
--=20
2.41.0


