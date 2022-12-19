Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2D3C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:36:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.33466.1671482194382574715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 12:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 96EBF36B4
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:36:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7Ms5-0ImY7d0; Mon, 19 Dec 2022 21:36:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] bubblewrap: import recipe from meta-security
Date: Mon, 19 Dec 2022 21:36:14 +0100
Message-Id: <20221219203614.3540198-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671482185-EF7F5A26-FD6D11CF/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f4f4e9d-57e8-4224-90bb-d3b6531521b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 20:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100116

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../bubblewrap/bubblewrap_0.6.2.bb            | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.=
bb

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb b/me=
ta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
new file mode 100644
index 000000000..50f61adf8
--- /dev/null
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
@@ -0,0 +1,25 @@
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
+SRC_URI[sha256sum] =3D "8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa=
547433603b8af20b"
+
+UPSTREAM_CHECK_URI =3D "https://github.com/containers/bubblewrap/release=
s"
+UPSTREAM_CHECK_REGEX =3D "bubblewrap-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit autotools bash-completion manpages pkgconfig
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


