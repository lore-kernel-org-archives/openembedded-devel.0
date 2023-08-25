Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A6CC7EE2C
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:17:04 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.9065.1692951421780659580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id AE9A28F9F
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 10:16:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZS03-2P4QpF0; Fri, 25 Aug 2023 10:16:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv2] spice-guest-vdagent: add recipe
Date: Fri, 25 Aug 2023 10:16:52 +0200
Message-ID: <20230825081652.2664-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692951419-F67EC704-E4A9AC74/0/0 CLEAN NORMAL
X-TOI-MSGID: da054608-adea-4039-8d19-b79a46e74956
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104602

The spice-vdagent needs to be running alongside qemu-guest-agent on
virtualizationguest systems that are using the spice protocol to
get seamless integration.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../spice/spice-guest-vdagent_0.22.1.bb       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice-guest-vda=
gent_0.22.1.bb

diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.=
1.bb
new file mode 100644
index 0000000000..93c6de545c
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
@@ -0,0 +1,25 @@
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
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
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


