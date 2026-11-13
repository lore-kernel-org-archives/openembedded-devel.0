Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7452.1794562166949849397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=AnjDpHBM;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id ABA4F10915
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2S0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/16] gnome-software: upgrade 51.0 -> 51.1
Date: Fri, 13 Nov 2026 10:27:28 +0100
Message-ID: <20261113092732.3895896-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562061-F2FFA82B-EBF13A3B/0/0 CLEAN NORMAL
X-TOI-MSGID: e2492de5-0297-4d76-9624-0b7a825aa17a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=Te2Gsi07f5PB11kRmUD6o1LmCyMg0AU1fjJb2TRIuYc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AnjDpHBMDPtcEmk6B+dY08DSslPE2iGksnTgWrdEAap11EXv8KATh3j3o4GU9KpGc
	 EIoe+tGvm7JnRITcPAVwtFR8+P8zaxxT2b4o6pdKAo0a/6UyFc1t+gnka0aywptlAu
	 5VaiCSQ64OTHa9VrPbSCDf25cOKpPs6c4uNh37Ci/RfX7nLM8WxYk00JKGUOneXl4t
	 gHAprgj0O09he480hUHYZjjNKDE7kcHDHmtLyJqHX2XTDvy6enxWQco8UI/knjbCjY
	 KObC4uVGPY5b8ATTj6mWHFibF+dxyAwbAuYOssl29rIqIYNWnVtWGgRokgnqObCQkX
	 HustQyBvTiiMA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132244
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_51.0.bb =3D> gnome-software_51.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_51.0.bb =3D=
> gnome-software_51.1.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.1.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_51.1.bb
index 6fc1eb4e52..7ac7d8d006 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.1.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "834b6035e61e36dd72339eb3e15d299b472ae0b3=
93467a5bb36bb0045e0ba123"
+SRC_URI[archive.sha256sum] =3D "6501b1d7e499bfb8009f08efa3339ca6369bc38e=
e335cc3dfb67da7b2ab71289"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-software/-/=
tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

