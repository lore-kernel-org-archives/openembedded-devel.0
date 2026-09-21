Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B83BC982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47391.1789991765107963338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=jMAE9q1t;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id 7DF2438159
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc8-04X1yy0; Mon, 21 Sep 2026 13:55:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/24] nvmetcli: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:37 +0200
Message-ID: <20260921115500.53770-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991716-74FEEA93-6D09ACF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f925c76-9ba8-4d6d-a411-7c58a58b4c34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=ucfqHWcyfuY6LrrQQMDzYo3vGfh6FE0wGaTanfOrYyE=;
	h=From:To:Subject:Date;
	b=jMAE9q1tmOi+Kyf2deBZbIcc9qtdqWtm9vNCkl633/MHWUPyQ2N4tWUvfYXFXcvW+
	 13yYtR9vTtStPawvFxgY5liKQEv48/FT/jrxjNr3Oejz19321M8ZdRhezdzFMlHLjV
	 RiP2Gn/QBP+kbExmu/j8YzYiIoekOK5tM1dKYWzE73FAr6/ewpWMrZP8btEa3/ctE/
	 oBKd9xh5fxSyW1z6Y8977Dci48EFV3CzsQIwh+ubOWzzRYlMMHI+6wa+wvAmyY4rO1
	 6iy9uxK9PcZwly6GQixkePXEwWgMIkPzmFRYr52fThlcIHyjIZ9iwOzo4FQoJMYDz3
	 ZxIGJUPT00tNA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130139

nvmetcli imports neither six nor anything that needs it; the runtime
dependency is a leftover from the Python 2 era.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/=
nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvme=
tcli/nvmetcli_0.8.bb
index cf2d54c07d..5f54dc812d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
@@ -17,7 +17,7 @@ SYSTEMD_SERVICE:${PN} =3D "nvmet.service"
=20
 SYSTEMD_AUTO_ENABLE ?=3D "disable"
=20
-RDEPENDS:${PN} +=3D "python3 python3-six python3-pyparsing python3-confi=
gshell-fb"
+RDEPENDS:${PN} +=3D "python3 python3-pyparsing python3-configshell-fb"
=20
 SRCREV =3D "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
 SRC_URI =3D "git://git.infradead.org/users/hch/nvmetcli.git;branch=3Dmas=
ter"
--=20
2.55.0


