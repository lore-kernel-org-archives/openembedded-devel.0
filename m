Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15845.1795264753504765207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2026 04:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=YN1+D8uQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout03.t-online.de (Postfix) with SMTP id 7AD57E814
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 13:38:45 +0100 (CET)
Received: from localhost.localdomain ([84.154.170.58]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xUkMc-0tYhf60; Sat, 21 Nov 2026 13:38:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] kmscon: enable kmsconvt@ for systems with VTs
Date: Sat, 21 Nov 2026 13:38:35 +0100
Message-ID: <20261121123835.69902-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795264722-BEFFA867-8EDD85BB/0/0 CLEAN NORMAL
X-TOI-MSGID: 4efe5520-a91c-43f7-8241-fb716fb3547f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795264725; i=f_l_k@t-online.de;
	bh=6XVXNrMkgc1HfRrNtpXtlyAqtbxy2R+kCXfX7awrEmw=;
	h=From:To:Subject:Date;
	b=YN1+D8uQFhesuGwU5nKRLw1kx41QqXCAZfVGriMIALW20ubibtH5ItV7wa9kZfCoJ
	 ZkUtfPlstM8mrwmrIxnNHlQAVLrgg8Hux4gpqIi/0mP6GnKGcHZM/xlOzPPmSL7exc
	 dizK83xTRHHY+fxlwGQG/mzv9VxkSjdGUrGKWDEkJGlCwhYrRFbc6rAtSuVOsCI0Ho
	 yePM8+wwTDxy7ejk3IOnPk55gOwAFokjzU+WTP/snTaNbk0aD5j73cjEVFB+fUAPYE
	 GmyF96cKWmtEkMAyUhpxnFVhYQ6IoRp2hj4kG8we28T2gGZFk86fzhY/8YBJhf1hKb
	 abHdWNoVJhSLQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2026 12:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132781
Content-Type: text/plain; charset="utf-8"

kmscon.service carries ConditionPathExists=3D!/dev/tty0 and is meant for
systems without virtual terminals. For systems with VTs upstream ships
kmsconvt@.service, which replaces the getty (WantedBy=3Dgetty.target,
DefaultInstance=3Dtty1, Conflicts and OnFailure getty@). Enable
kmsconvt@${KMSCON_VT} next to kmscon.service, so kmscon comes up in both
cases. KMSCON_VT defaults to tty1; images with a display manager on VT1
set it to another VT, as display managers only conflict with getty@tty1.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb b/meta-oe/r=
ecipes-graphics/kmscon/kmscon_10.1.1.bb
index d498c39d20..3aa5e6b4da 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
@@ -45,7 +45,9 @@ EXTRA_OEMESON =3D "\
     -Dvideo_fbdev=3Denabled \
 "
=20
-SYSTEMD_SERVICE:${PN} =3D "kmscon.service"
+KMSCON_VT ?=3D "tty1"
+
+SYSTEMD_SERVICE:${PN} =3D "kmscon.service kmsconvt@${KMSCON_VT}.service"
 FILES:${PN} +=3D "${systemd_system_unitdir}/kmsconvt@.service ${datadir}=
/terminfo"
=20
 do_install:append() {
--=20
2.56.1

