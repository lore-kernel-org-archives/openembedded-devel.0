Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8056.1792577264948895583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WNrfq6rC;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id A2257E978
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEN-0cELaT0; Wed, 21 Oct 2026 12:07:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 26/26] sushi: upgrade 51.1 -> 51.2
Date: Wed, 21 Oct 2026 12:07:14 +0200
Message-ID: <20261021100717.11068-26-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577255-67FFC903-FCE477EB/0/0 CLEAN NORMAL
X-TOI-MSGID: 5752bbfd-5965-4153-ab88-fa3b79744a81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=t00palL/jfGcai5+idjE+TJ9X5nGUaB6Au4eaLJ/Ntg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WNrfq6rCsugyFOu4b1+vdiPsM5ws63cZNq7cAHYFiJSbAY4wnoXKUDKwMRDSJthzy
	 Rf0/ZtTKoKKJSN4zkMUE6I5oXMuNccaUcZVxGQos7DNehpasXceqgrkWUHE3TGjMYq
	 ZklQaY75U6qA2In2N2/0iSmt6B+rg73EtfAXrb4OWikI2+GLkMXTml3hISJJtoQnn4
	 KS4RIwuzHjLG68DsbXR+u4m4dA7KZQkXyjzA20dsxrpKljmbP7UFbfJTGJV1zqYxzl
	 eAZ7tuhj4Wwg0zFh5GcgVYYL586s51Q4DKEBLItU+Qcu1qRwGhNQ71F5AVH12P2iFN
	 R/2Pwj3OBJVfg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131254
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/sushi/{sushi_51.1.bb =3D> sushi_51.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/sushi/{sushi_51.1.bb =3D> sushi_51.2.bb}=
 (93%)

diff --git a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb b/meta-gnome/re=
cipes-gnome/sushi/sushi_51.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
rename to meta-gnome/recipes-gnome/sushi/sushi_51.2.bb
index f083618bd8..034a967d6c 100644
--- a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
+++ b/meta-gnome/recipes-gnome/sushi/sushi_51.2.bb
@@ -30,7 +30,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspect=
ion-data"
=20
 SRC_URI +=3D "file://0001-libsushi-guard-the-X11-Window-field-when-GDK_W=
INDOW.patch"
=20
-SRC_URI[archive.sha256sum] =3D "d326ec69fc004be3a5fc048f7ecf2c8eb828b7d8=
b682f1e7a2ba01a5e72993e1"
+SRC_URI[archive.sha256sum] =3D "928c0155bd5664098bdb4d591806e70e8219a4b6=
6bf46c95382f72589e4e9a6e"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
--=20
2.56.0

