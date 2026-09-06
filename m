Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A75EC79FA8
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10850.1788687444245839321
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=mpR0MvnN;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout02.t-online.de (Postfix) with SMTP id 98EDCE2EC
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJq0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/15] gexiv2: upgrade 0.14.6 -> 0.16.2
Date: Sun,  6 Sep 2026 11:37:09 +0200
Message-ID: <20260906093713.797648-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-CC7F7956-BF02EC72/0/0 CLEAN NORMAL
X-TOI-MSGID: 46ca564d-7f13-495e-91c6-4350aace8051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=NpDMCx4nUWgpU05r77PeGJxP/RJJ35FziTTY367S5H4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mpR0MvnNzGp2RG/Y9uT+w2MtekCZjz+rrY3gDIfnqYArYYO0ACovB2UlD7p0DklHl
	 aUiI3IIjUGF12r5rEcN4npgpOf7ll7iCzeZTNR+DLQ3IpHewGxz7dmQ7f+WW12aTAe
	 uH+jIRikt+Gqq79AgWbtGUfMJHs+mDSKnO/vXdfLAm1sfsg02XwdB6N7HeItDr0Bhz
	 7chtDsZEmjFBE/MD3GIF7UYiU7ZUt1qnMk7iwsob8xzZLJk9I1Hperi6flJSKFUTx8
	 rT1ORVmeAo+SjK7XxJxkHEZYEYiNsU7U6QdRxXDsdFz/8JCsOHRnlSzmBsDGnxoqtH
	 avuqv/9Tb805g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129791

The library, pkg-config module (gexiv2-0.16), headers and GIR namespace
are versioned now. Users of the old API are on the gexiv2-0.14 recipe.

Build tested on corei7-64, together with localsearch which prefers
gexiv2-0.16.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gexiv2/{gexiv2_0.14.6.bb =3D> gexiv2_0.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.6.bb =3D> gexiv2_0.1=
6.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb b/meta-gnom=
e/recipes-gnome/gexiv2/gexiv2_0.16.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.16.2.bb
index 9d6cc7679a..d9d2260488 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.6.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.16.2.bb
@@ -8,7 +8,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 inherit gnomebase gobject-introspection gtk-doc python3native vala
=20
-SRC_URI[archive.sha256sum] =3D "606c28aaae7b1f3ef5c8eabe5e7dffd7c5a1c866=
d25b7671fb847fe287a72b8b"
+SRC_URI[archive.sha256sum] =3D "aad9e240fdffbe85e390f46ee0a567e251baea5c=
29c3d8690260388683dc8d0a"
=20
 EXTRA_OEMESON =3D " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Dtrue', '-D=
vapi=3Dfalse', d)} \
--=20
2.55.0


