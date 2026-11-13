Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7423.1794562110093028148
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=udIy0cVf;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id A3EB14BFF
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2R0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/16] gnome-autoar: upgrade 0.4.5 -> 0.5.2
Date: Fri, 13 Nov 2026 10:27:27 +0100
Message-ID: <20261113092732.3895896-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562061-53FFC82B-C68F6103/0/0 CLEAN NORMAL
X-TOI-MSGID: afde6176-bc0e-4ac2-b428-fb909f08b694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=25SNLr1DDm++Zk4WhuUgr4rdKVotaFdWxrfk3Nf5AmM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=udIy0cVfCxXN2/ksViw7dueFEZ2GaOLK0wR90MGlU6VfFVGfQh/u8og/cUGfVmDhW
	 dQiQAnp7z7BQbruBimh00aUTrBc6cphbNVimJfffW1EPnC4xyvsC2Ll1iBuGPA8HaG
	 X7ANZncqceB48WJJfnzAT0+mYqW709TIoySrA/5SQtqqksK48Symwv4lYEUsDBiWBQ
	 gugWJPiDkvHiyBaIEnIQEYCaENIpcCRqkDwSpyy0vd9vIznKCaXQPWIiXM554kmeOR
	 0zGKu2lw9z90cuUFPCSAFVP8mOoFmup6JVgOU3aLz/fFh4wMPnpqBjDS01CdEOaE2v
	 1iLHIviMJ7yCA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132234
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-autoar_0.4.5.bb =3D> gnome-autoar_0.5.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.4.5.bb =3D>=
 gnome-autoar_0.5.2.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb =
b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.5.2.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.5.2.bb
index d7325888d6..ca4262a870 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.5.2.bb
@@ -13,7 +13,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 inherit gnomebase gobject-introspection gtk-doc vala
=20
-SRC_URI[archive.sha256sum] =3D "838c5306fc38bfaa2f23abe24262f4bf15771e33=
03fb5dcb74f5b9c7a615dabe"
+SRC_URI[archive.sha256sum] =3D "6c20bd16c87aba15869e56444424481f632ac302=
989a203e8ce4dcc73dea33a5"
=20
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH=3D"${B}/gnome-autoar/.libs"
--=20
2.56.0

