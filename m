Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6456.1793345615339885680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=cFRPnaog;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd92.aul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout04.t-online.de (Postfix) with SMTP id 5544782D
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 08:33:32 +0100 (CET)
Received: from localhost.localdomain ([84.163.35.82]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xMh7C-2O1XHc0; Fri, 30 Oct 2026 08:33:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: upgrade 1.6.9 -> 1.6.11
Date: Fri, 30 Oct 2026 08:33:21 +0100
Message-ID: <20261030073321.535016-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1793345610-62FFB40E-9AC91807/0/0 CLEAN NORMAL
X-TOI-MSGID: 25a29523-3959-4983-8ef9-b38f372bf37e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1793345612; i=f_l_k@t-online.de;
	bh=xqtkqz9LqBPbSAWruXEJxMuFvtZOhm/1KRsgZeZw5X8=;
	h=From:To:Subject:Date;
	b=cFRPnaogcHeUxejaPcDN54ZF9bDf7mowqasZYiE8Eh9SZUQN716S0BzgL9UhZnd5E
	 fFKUssXpRUbbC+XwgQ25FK8TqdtfNQdf84Gh8RpBCe2h0UlIMAeSOhqfDzzLmwbqwe
	 tpJ2FePSwKHIAtyFe6zjFFaWafbl7jdf/Nkf3zJzVMuSG9btwChHFK6AMRzLnQ2PtC
	 1iGTYAAnHrAZcS4nCBA9WKPONQJlNxfIFyCJKVOHMgN3gJTssJwcfPkyJey4+LnHow
	 vALfjI1S91RG/HyV5LhEDfDg/haaqzM+KfK2nf/n7k+s5fqxmy/5wKkxWYrDHs7qEg
	 wiHEl/FIMJ5rQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 07:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131682
Content-Type: text/plain; charset="utf-8"

Changelog:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/1.6.11/NEWS?ref_t=
ype=3Dtags

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.6.9.bb =3D> pipewire_1.6.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.9.bb =3D=
> pipewire_1.6.11.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
index 143f3d5e0a..ec55d6034b 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus"
=20
-SRCREV =3D "8fa27cabdc6c0c1350c69c026af5850ef0af1e26"
+SRCREV =3D "4287f31510771fc999f8a58a024c81ca10b8d55f"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0001-pipewire-compress-offload.patch"
--=20
2.56.0

