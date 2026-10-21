Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8023.1792577262468173547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=OY0di8dm;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id E76CBE3C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa70; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/26] gnome-calculator: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:52 +0200
Message-ID: <20261021100717.11068-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-67FFC903-E0671F74/0/0 CLEAN NORMAL
X-TOI-MSGID: af742c06-b1c5-495e-85ea-091df258ce47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=R+/SDa0y5kzGqXrHZ3jqNzDDzcfGlk6+1zrgyQaTzmY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OY0di8dmbaj6Z5fcZi0iZPdf4jkb0jnBTRRpk0XMreRJP1xqlOjBVZWXdCKre03sM
	 RmyZHjWaok7XexiLJl9cOt1EXANDQA+oKH6XNZQdJmWcNOc4LKvsw9YpAei8VyQNUa
	 IWf8bAd6dcuXSpfnknJyxv96qBl7PgTg2qV168tSfLu7dwIl5gOZ50iYyMfCgk3sri
	 YipWvhZ45tFk+FozS4tHkOI9Pgw4AUG6k66LawYZ8o0CeeOvTsMFHE09McCJ61WPAW
	 Rr8OVv8uiVYYxxpj8l63DHamNikTxg5ZjfiiazWU/uIm7I7Xuzp6o36hOuB4aU9NBl
	 uQ6hDim55Vkfg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131249
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_51.0.bb =3D> gnome-calculator_51.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_51.0.=
bb =3D> gnome-calculator_51.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_5=
1.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_51.1.=
bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_51=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_51.1=
.bb
index a8d0d6e2ac..1657733658 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_51.1.bb
@@ -32,7 +32,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
-SRC_URI[archive.sha256sum] =3D "5bfb4c53eec61feb6c03faf85218804e87413ecb=
647e08fde6379bf2b1839190"
+SRC_URI[archive.sha256sum] =3D "03edf5972adc020b7e872233caba42f759e9879f=
c4b96f014580f136179c4fa0"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.56.0

