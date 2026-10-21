Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8045.1792577262524335883
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=OIGIN9/b;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 00F9AE3DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELaA0; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/26] gnome-shell: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:55 +0200
Message-ID: <20261021100717.11068-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-86FFA903-15C577F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 89e4f5d1-e8a8-474e-ba26-a684a0b56202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=RIf8+3LzSkMTqlaYwAcM3tyV6ZCSh+JS8imfc8Nqe5E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OIGIN9/bMVfeiw8ZOF9IzljsAmibZPWATr6fQjc3lD7x1hj1Gs2p+sMIpu+DW2yER
	 Eoghio+14UNTS7dkfmK3EgT8Vx1igetaiBm0Uoco5/UGUhdg7BR9oeeLJJdXi4Nl+e
	 B4QWt10oH+8mHxxyRKMMiEp67O5LvMEYzOsrgPL7XKkJ2dSf0R6ZRc3Ahy24JVCApY
	 BzFR5vO09mNpoB4/pNMBvASvBdVj0PCiOMkkHH35RqGMdjRZucFZvmUSspwIDMN523
	 ZEePpDf69Nvny3N/Mm9vc4wg4TE0tGtHrr4vgxa0toAxkPHj9zy+Taq/xKbZb2HrQr
	 ksEKLA+SJwg7w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131236
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_51.0.bb =3D> gnome-shell_51.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_51.0.bb =3D> gn=
ome-shell_51.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
index accd1c8168..e8873bb2cc 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
-SRC_URI[archive.sha256sum] =3D "2179bab13af353427065096af8bf3d30da7b86e0=
c516e5ba86a14998af9575f6"
+SRC_URI[archive.sha256sum] =3D "c1eb08d9651a567ed5d9b2791371f1898e657cf4=
5e75e1d88adefbab807977d6"
=20
 PACKAGECONFIG ??=3D " \
     camera-monitor \
--=20
2.56.0

