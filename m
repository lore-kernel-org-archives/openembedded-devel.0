Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8E1C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:16:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.9387.1693383379307124298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 1C9A44D9CC
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 10:16:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.217]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbGMn-2QwTSr0; Wed, 30 Aug 2023 10:15:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] spice: add missing dependency on orc
Date: Wed, 30 Aug 2023 10:15:48 +0200
Message-ID: <20230830081550.1364085-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693383358-299F3649-2A11C754/0/0 CLEAN NORMAL
X-TOI-MSGID: 82f2a2fe-eadc-444c-a9ad-86d54f05a782
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104662

this fixes:
meson.build:139:23: ERROR: Dependency "orc-0.4" not found, tried pkgconfi=
g

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index 78e3b0d88..a1f3010dd 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -25,7 +25,7 @@ CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched =
already, caused by inaccura
=20
 inherit meson gettext python3native python3-dir pkgconfig
=20
-DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4=
 python3-pyparsing-native python3-six-native glib-2.0-native zlib"
+DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4=
 orc python3-pyparsing-native python3-six-native glib-2.0-native zlib"
 DEPENDS:append:class-nativesdk =3D " nativesdk-openssl"
=20
 export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
--=20
2.41.0


