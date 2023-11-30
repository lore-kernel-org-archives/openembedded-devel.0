Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F378C46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 06:57:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.66966.1701327412750714368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 22:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id B9B8A48D8E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 07:56:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.44.42]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8ayf-4TUGtG0; Thu, 30 Nov 2023 07:56:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv2 2/3] spice: Set meson version based on PV
Date: Thu, 30 Nov 2023 07:57:21 +0100
Message-ID: <20231130065722.18367-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231130065722.18367-1-f_l_k@t-online.de>
References: <20231130065722.18367-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701327409-57FA8986-B9E2044A/0/0 CLEAN NORMAL
X-TOI-MSGID: 15777a49-7017-479e-9664-ab3bd09e3e61
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107167

This fixes:
| Dependency spice-server found: NO found UNKNOWN but need: '>=3D0.14.0'
| Run-time dependency spice-server found: NO
|
| ../qemu-8.1.2/meson.build:1038:10: ERROR: Dependency lookup for spice-s=
erver
with method 'pkgconfig' failed: Invalid version, need 'spice-server'
['>=3D0.14.0'] found 'UNKNOWN'.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index a1f3010dd..419316a26 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -30,6 +30,10 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-openssl=
"
=20
 export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
=20
+do_configure:prepend() {
+	echo ${PV} > ${S}/.tarball-version
+}
+
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
 PACKAGECONFIG ?=3D "sasl opus smartcard gstreamer"
--=20
2.42.1


