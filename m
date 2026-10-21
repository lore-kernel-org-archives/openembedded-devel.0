Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8024.1792577262468581352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=M3AuhjeJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 23316E3FA
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEK-0cELaF0; Wed, 21 Oct 2026 12:07:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/26] rygel: upgrade 46.0 -> 46.1
Date: Wed, 21 Oct 2026 12:07:00 +0200
Message-ID: <20261021100717.11068-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577252-ABFFC903-FC2BE636/0/0 CLEAN NORMAL
X-TOI-MSGID: 1fba5852-4e23-4ae5-9b11-160b8d4fe665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=NYAYJ/HpP7TV9ELityO1C2W/TJU/Lq00RDuEXssrQso=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M3AuhjeJH1s/oIQ5ksRgIdplmeFoJUK+yPpwQEDDUGxh+AynwyASjqRU3TIVrJalh
	 RK5tO7F3qTt0T/iIZ7wVMioJfp0WphZ4IclLh0eTT3V2Nu3mpEH6VzIWGOUEWDj5cS
	 1g4pQYLVBbmO8rVjvR+/5yovs3BcFSqh+icdzKKwmeMmFR5CvfrbGBr2K9r+dnDCwW
	 cyLOdbsMGa37l5dcDBQQGmF1H6U6kZ/Dze6byomt3Hj9Po4uEQBmlAMmVDBHxBjNWZ
	 eMVdtsWo6SQDY1khdulIwGhBpWw3B8SuPkvqWKNQtCYNIbVYgErQdnIVKeqhNgsopC
	 sKdUxvDJb/8kQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131243
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/rygel/{rygel_46.0.bb =3D> rygel_46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_46.0.bb =3D> ry=
gel_46.1.bb} (97%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb b/m=
eta-multimedia/recipes-connectivity/rygel/rygel_46.1.bb
similarity index 97%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_46.1.bb
index 0087493109..56bf7adae8 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_46.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase features_check vala gobject-introspec=
tion gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
-SRC_URI[archive.sha256sum] =3D "b61512c99307e2de7081f96b002427bbf23b25d5=
b0c3f6ae8d7798caebce4a86"
+SRC_URI[archive.sha256sum] =3D "6e2bd8d4e8bd047f9eeb6909171de3e6c2161f0d=
6e2975a575d09fd14665de86"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.56.0

