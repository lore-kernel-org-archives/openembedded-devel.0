Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1792577262353902309
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WHTHmTG9;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id E1B751C461
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa50; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/26] gdm: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:50 +0200
Message-ID: <20261021100717.11068-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-45FF8903-EC096AD9/0/0 CLEAN NORMAL
X-TOI-MSGID: bd3aef61-e139-4f1f-a3fb-24ccb230c392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=XfzDavlFOwdL1nu/IxyiKYrXJqjxX2xQMRLnKPjFyQ0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WHTHmTG93Rpv+4VNTWJVfy6ObGBbCvvrX4oEzPZpNvwa2m/ubKRcoZ79FI5xJL3LG
	 yspJuMJpEgQ4cPLWqKmopU6sOkdbJYf14vQFMGoIQULHF4+5SR0pfqqdtjw6U2tuLS
	 HNrclP3ZCA0dqsHvOgIR60TLmayqjsOqW/sdQTdDDc+rVENpzYwIkej1gx53QKIIqR
	 Ds8kIzfGwxt4J35oxUJ1ohm/vM9qhjNtWBrNO6ZE6SHbagCxTC4XO9BR+wJodVwV5h
	 NsKvxVgkknpCHRnwAGdDNl0tnK9he+Q8utvzhfjouP/gLxfluXfBdpYSgAreViVc/K
	 8h1q1HEe3zHlA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131232
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_51.0.bb =3D> gdm_51.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_51.0.bb =3D> gdm_51.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_51.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_51.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_51.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_51.1.bb
index 00e1fd930d..7ee327bff2 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_51.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_51.1.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "2ce5acf5a438b8f6dc1d14fd777a911be5eeb2f7=
ab9a7c4600166205b15d6536"
+SRC_URI[archive.sha256sum] =3D "27970ad4f58eb0a48fb01bffb89a8f472503641c=
3573eb6d788ad4042de01120"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,=
plymouth"
--=20
2.56.0

