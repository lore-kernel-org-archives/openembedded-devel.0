Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CBBCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 16:42:59 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.9899.1761756170473213354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 09:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 9E5911DC8
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:42:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.224.109]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vE9Fx-0p6LVh0; Wed, 29 Oct 2025 17:42:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] spice-protocols: update 0.14.4 -> 0.14.5
Date: Wed, 29 Oct 2025 17:42:29 +0100
Message-ID: <20251029164230.218721-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761756161-8BFFCA4B-F9FEF1AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 7b4e5a3d-84dc-4683-8fa1-df87c997a7a1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121164

Major changes in 0.14.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Add SPICE_MSG_DISPLAY_GL_SCANOUT2_UNIX
* Fix for Windows Arm64 build
---
 .../{spice-protocol_0.14.4.bb =3D> spice-protocol_0.14.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{spice-protocol_0.14.4.bb =3D=
> spice-protocol_0.14.5.bb} (89%)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.=
bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.5.bb
similarity index 89%
rename from meta-networking/recipes-support/spice/spice-protocol_0.14.4.b=
b
rename to meta-networking/recipes-support/spice/spice-protocol_0.14.5.bb
index 7f08eebee7..9ac6833d67 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.5.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "https://spice-space.org"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db37311cb5604f3e5cc2fb0fd23527=
e95"
=20
-SRCREV =3D "6f453a775d87087c6ba59fc180c1a1e466631a47"
+SRCREV =3D "c5c2f26422b44e3143c87814af73c38125d4ccfc"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/spice/spice-protocol.git;proto=
col=3Dhttps;branch=3Dmaster"
=20
--=20
2.51.0


