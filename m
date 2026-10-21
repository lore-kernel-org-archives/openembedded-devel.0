Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8026.1792577262674746788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WyT+P2DR;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 28048E954
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEK-0cELaG0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/26] pangomm-2.48: upgrade 2.56.2 -> 2.58.0
Date: Wed, 21 Oct 2026 12:07:01 +0200
Message-ID: <20261021100717.11068-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-65FF8903-F30844B5/0/0 CLEAN NORMAL
X-TOI-MSGID: e68dd40d-1841-4de5-8c1f-d3d80a6de2d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=qtIHuB6kCxwBeGYQJfJg7r1XkU07iF1s+PtNTmVfQ24=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WyT+P2DRpCJYt4ATPrEY9wrnBIappTGl+jc6vVVyQ+brTsdjBVDjqMECoqboBD1Xs
	 3i06cBILUpsf8IZJMxzbJ8cwO0nQJFIZDwySVi+b8TjpXBYA8SmbMA3bH8ov9F7gDT
	 YL3Z/DddCEW4JTlrmTboYNZCU5g7Jk37mLwj/sUJpoMJaUarxP+eRGSM4ovIWhK23p
	 vXCl/0VkwOH0LbmpTFNRm0zPQ903tEkJ3ub3G7TQDud5i9mkld/da/FjmOvhJ1sO2F
	 iqSSkgVA9OYSai2l3KL+qbcIZMVX0QxkKJEsXW4TaXYtnMP31F94Ow0rJ8ADLUdKYR
	 OyIhGCAAg9+8Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131246
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pango/{pangomm-2.48_2.56.2.bb =3D> pangomm-2.48_2.58.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm-2.48_2.56.2.bb =3D> pango=
mm-2.48_2.58.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb b/meta=
-oe/recipes-graphics/pango/pangomm-2.48_2.58.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb
rename to meta-oe/recipes-graphics/pango/pangomm-2.48_2.58.0.bb
index d65891960c..2337c3425c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.58.0.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "mm-common cairomm-1.16 glibmm-2.68 pango"
 GNOMEBN =3D "pangomm"
 inherit gnomebase
=20
-SRC_URI[archive.sha256sum] =3D "f1e984c85a85b6a0e61616366521f51dd8282a07=
2bb45d15b5084762b62f4c0e"
+SRC_URI[archive.sha256sum] =3D "217514c1a65035c2fce6e69e33b0d92bafa2594c=
c474e995a4473441b10f3a33"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.56.0

