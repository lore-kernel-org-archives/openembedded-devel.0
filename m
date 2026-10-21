Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8047.1792577262576175461
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=olEjE2sp;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 30D31E40C
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaI0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 15/26] papers: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:07:03 +0200
Message-ID: <20261021100717.11068-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-45FF8903-AC0BC7B7/0/0 CLEAN NORMAL
X-TOI-MSGID: db784c90-ed96-4658-9a84-45734b938ee2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=V85HlPAPibogSlypBN2Ko+FPfKXZZI+Cr/BcyU2eDus=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=olEjE2spPyQQs5cxDuGBOn29OMKHuXHXJW+/xjLvf/rITGyVE32C6I+8TCpq+NuKa
	 PiftbZo/XK6FPyadsrQEI3a/f5GP2EENG+pRKwYk+TXMq55YdNVcKRCD7F3DnpfK/f
	 uWpCuijA304CRlZnm2N22J9Fcrrg6J6E/RiZevPR7h2bbdh/WqFPmHp/Hy/skhMetV
	 LSijvMz29AfxIPe7/dVZLzTQGnhqqxX3yvvoVer0mbCb6isjDI5HM6TA2/hOE9t8Rj
	 PwTvO50nBOPsEmUUIWd/XnqL3I4yLahphV1JJwXVUMGdzk1NzUEU9Xoo1FY5zacwmI
	 jLBgtI0nPyCjA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131238
Content-Type: text/plain; charset="utf-8"

The 51.x releases are tagged on the gnome-51 branch, main has moved on
to the next series; fetch from the stable branch.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/papers/{papers_51.0.bb =3D> papers_51.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/papers/{papers_51.0.bb =3D> papers_51.1.=
bb} (96%)

diff --git a/meta-gnome/recipes-gnome/papers/papers_51.0.bb b/meta-gnome/=
recipes-gnome/papers/papers_51.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/papers/papers_51.0.bb
rename to meta-gnome/recipes-gnome/papers/papers_51.1.bb
index 124fd68d09..9065acafff 100644
--- a/meta-gnome/recipes-gnome/papers/papers_51.0.bb
+++ b/meta-gnome/recipes-gnome/papers/papers_51.1.bb
@@ -15,10 +15,10 @@ GTKIC_VERSION =3D "4"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/papers.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3D${PV} \
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/papers.git;protocol=3Dhttps;br=
anch=3Dgnome-51;tag=3D${PV} \
            file://0001-meson-Support-cross-compilation-via-a-rust_target=
-cr.patch \
            "
-SRCREV =3D "6ca6e7ec685343cd4664f6253ab0f42d31e51bb3"
+SRCREV =3D "2c3976fb832605e2a6165dd6dacc4412cb5dfa3e"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/papers/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

