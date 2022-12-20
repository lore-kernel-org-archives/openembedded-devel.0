Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18739C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:33:54 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.52983.1671550432369353865
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 4143F22758
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 16:33:50 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.229]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7ecn-2XbUvJ0; Tue, 20 Dec 2022 16:33:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] bubblewrap: import recipe from meta-security
Date: Tue, 20 Dec 2022 16:33:43 +0100
Message-Id: <20221220153343.5067-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671550429-4BFF22DC-138D3ACD/0/0 CLEAN NORMAL
X-TOI-MSGID: eba967c6-6168-4c19-8738-a5949cd822c8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 15:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100159

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../bubblewrap/bubblewrap_0.7.0.bb            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.=
bb

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb b/me=
ta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb
new file mode 100644
index 000000000..4d053b54c
--- /dev/null
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "Unprivileged sandboxing tool"
+HOMEPAGE =3D "https://github.com/containers/bubblewrap"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2"
+
+DEPENDS =3D "libcap"
+
+SRC_URI =3D "https://github.com/containers/${BPN}/releases/download/v${P=
V}/${BP}.tar.xz"
+SRC_URI[sha256sum] =3D "764ab7100bd037ea53d440d362e099d7a425966bc62d1f00=
ab26b8fbb882a9dc"
+
+inherit autotools bash-completion github-releases manpages pkgconfig
+
+GITHUB_BASE_URI =3D "https://github.com/containers/${BPN}/releases/"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}=
"
+PACKAGECONFIG[manpages] =3D "--enable-man,--disable-man,libxslt-native d=
ocbook-xsl-stylesheets-native xmlto-native"
+PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
+PACKAGECONFIG[setuid] =3D "--with-priv-mode=3Dsetuid,--with-priv-mode=3D=
none"
+
+PACKAGES +=3D "${PN}-zsh-completion"
+
+FILES:${PN}-zsh-completion =3D "${datadir}/zsh/site-functions"
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


