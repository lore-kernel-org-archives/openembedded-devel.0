Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8019.1792577262372781796
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=BC0sfkqk;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 1F4F237E24
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEK-0cELaE0; Wed, 21 Oct 2026 12:07:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/26] nautilus: upgrade 50.3 -> 51.1
Date: Wed, 21 Oct 2026 12:06:59 +0200
Message-ID: <20261021100717.11068-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577252-67FFC903-1416CC99/0/0 CLEAN NORMAL
X-TOI-MSGID: 492ca03f-d996-4111-bcbe-8704d4bc79c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=9qXkIH3chH+hJo5He9EqJntNk5LZoENU1LzuGZ+PAsE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BC0sfkqkP3R6VL4iKmqvOsvUd7Ozu0payr0jSCruylnE+fQ08BgHnE3wmv8Rlvh/z
	 8IxN4nRrVRcqZaR+P7RcsuTxPRYJfM+wYTy7TX7ERhzXjP9PL8bNVppIJqwF6SJ7p5
	 jBmBApw4cpUJzeR5rWTguoKOgBEuZpACRGsprhu2oESL82ibj2v9zs/WulVx4rd7CU
	 8biVpcFru1EiMdqXpBEF8Hlseg10/vfZ/7suk9HoVHzstBHCZY5MhZxoZmMYHSutE1
	 yn0q8/zC37d8OgLDWlC7+zJ19QRB0TsfH/oOOJZe70dNX7PbpkQZEBUKuAsUYANnox
	 tK00ItQNRNAWA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131244
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_50.3.bb =3D> nautilus_51.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_50.3.bb =3D> nautilus=
_51.1.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_51.1.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_51.1.bb
index d94adf5b1a..14b0b0668c 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_51.1.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "63773baf0ddec7b4875fc2c22040378562ea1e68=
12fe0a2e29c9c8d5c72807f8"
+SRC_URI[archive.sha256sum] =3D "a703bc152d18d161d9dab957e2390a36e6246bb5=
c24de7b15c9624fcfa2f2816"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.56.0

