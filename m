Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8043.1792577262372568484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HmaloL9m;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id E4B3C37E0F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa60; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/26] gjs: upgrade 1.90.0 -> 1.90.1
Date: Wed, 21 Oct 2026 12:06:51 +0200
Message-ID: <20261021100717.11068-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-A97F9903-407ABCF0/0/0 CLEAN NORMAL
X-TOI-MSGID: e82a2ac6-e66f-4671-b812-0692b39fc993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=eK7E48ISu06HG8iRb3o5QGssPVhYhi7/9P+XDh3kI/U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HmaloL9mTGk+0fntFT6W2yN6QHejvA1TKD+o7yDTFMXaRlbSjYz/d82QhpmT9SeUC
	 wng+QuqOqYBX0EmXcktIPMpicO6lK73BQHwVmr2lDOj+7F8bbH+c20xgQ0eXMxbmwQ
	 njPML9YDCGI9U/m37yZUD8vGCUkZyRjDzYlPvu8regbhZKkzdP6/8ZyVLUGRhzqDxN
	 ptqZUnz7zJtavwNTNfubabVxot0xKy1zV0EE20ZphAR0HPozHFbbeocBjAbWYK7UBM
	 R+i4zx+4g6ekt7/6jG8MtQx09n7YVW89xiXqzVeDUHQFbeKTXgiGjiJ36iSw+jtov1
	 yGasQ6r9zqDMw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131234
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.90.0.bb =3D> gjs_1.90.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.90.0.bb =3D> gjs_1.90.1.bb} (=
95%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.90.0.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.90.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.90.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.90.1.bb
index 50bbc20e71..65f737f83e 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.90.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.90.1.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig gettext gobject-introspection f=
eatures_check
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BP}.tar.xz;name=3Darchive"
 SRC_URI +=3D "file://0001-Support-cross-builds-a-bit-better.patch"
 SRC_URI +=3D "file://0002-meson.build-Do-not-add-dir-installed-tests-whe=
n-inst.patch"
-SRC_URI[archive.sha256sum] =3D "47e9f22b1d4aca841c6c492b449b6de32ff68097=
2183e26fe7b98a45c5c3fee1"
+SRC_URI[archive.sha256sum] =3D "05ceaa80f48e3782e5c44938572fad863e02b8c4=
a6c55657a99aa81db8ce9efa"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.56.0

