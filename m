Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9FDC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 08:34:52 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.15462.1724229284265084459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 01:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 933D11C63A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 10:33:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.146]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sggmx-4FZeT30; Wed, 21 Aug 2024 10:33:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] bubblewrap: update 0.9.0 -> 0.10.0
Date: Wed, 21 Aug 2024 10:35:24 +0200
Message-ID: <20240821083525.26568-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724229236-06FFA824-665F0FF0/0/0 CLEAN NORMAL
X-TOI-MSGID: ceaca555-163e-4e1b-9241-494ca8633809
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 08:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111881

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../bubblewrap/{bubblewrap_0.9.0.bb =3D> bubblewrap_0.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.9.0.bb =3D> bub=
blewrap_0.10.0.bb} (91%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb b/me=
ta-oe/recipes-security/bubblewrap/bubblewrap_0.10.0.bb
similarity index 91%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.10.0.bb
index c60c1dfd6..60155e035 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
 DEPENDS =3D "libcap"
=20
 SRC_URI =3D "https://github.com/containers/${BPN}/releases/download/v${P=
V}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43=
bab9f2d05dd094e1"
+SRC_URI[sha256sum] =3D "65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b=
4be54b0c45565471"
=20
 inherit autotools bash-completion github-releases manpages pkgconfig
=20
--=20
2.45.2


