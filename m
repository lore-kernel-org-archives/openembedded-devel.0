Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8048.1792577262676676736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=fr+9Awsg;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 19650E7FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEK-0cELaC0; Wed, 21 Oct 2026 12:07:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/26] libgsf: upgrade 1.14.58 -> 1.14.60
Date: Wed, 21 Oct 2026 12:06:57 +0200
Message-ID: <20261021100717.11068-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577252-AAFFA903-73F40CFC/0/0 CLEAN NORMAL
X-TOI-MSGID: 99fbaa2a-a2ed-47c1-8ad5-29012982120c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=B/ibg8mRPjfmYMC2qPabbiXZNGFMcuRTZlSdh/ZBAag=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fr+9AwsgHGhk293O7Y1fHUZage1bLmUUFhgazM8FUkztBgATAPH0RxnZonW3KqIvl
	 BIPTZqS/1dHFEc7M3EYKjanbBHGqUoehm5o2cRlmHoeBXHKm2HMLw3LbAUHQcTq6Wv
	 MdUE78VVrH0koi7Xlg222mzwqG5owW3vZ+XcGTwn/t1yJckituviF3fczZFo1Ipqde
	 qxShNv2kQm3vfm2FVAaUC4Oc1/FK4wXQTpk7pOBGSWnJmhwYrvzRgCvkTJn8LqmEEg
	 qz3enUuBRSd2YFKo9SUPJQAcw1dhjy5LFibnx/FnEecFbtD81SNFPAyhE8sIvuAok/
	 zIEKIbSX25e0A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131240
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libgsf/{libgsf_1.14.58.bb =3D> libgsf_1.14.60.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.58.bb =3D> libgsf_1.=
14.60.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.60.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.60.bb
index a23ca13608..ea989c1b71 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.60.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
=20
-SRC_URI[archive.sha256sum] =3D "06e07ea12b7a52b9e316faddfecb640b1717a487=
5c59f0efb3b0cec1e2ccf35a"
+SRC_URI[archive.sha256sum] =3D "83e12c36a099a8a7019bf425e2c24af66eeb2ef5=
874251e694431a07d9805dae"
 SRC_URI +=3D " file://0001-configure.ac-drop-a-copy-paste-of-introspecti=
on.m4-m.patch"
=20
 PACKAGECONFIG ??=3D ""
--=20
2.56.0

