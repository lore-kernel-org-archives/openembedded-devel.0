Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB222C982C4
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18075.1789458262901339729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=FOJRqWbS;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id CE95E4EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds690; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 30/31] eog: upgrade 50.2 -> 50.3
Date: Tue, 15 Sep 2026 09:43:46 +0200
Message-ID: <20260915074347.6003-30-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-297F99B9-9A21939F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c367cea-83fa-4c8e-814a-1e548381317c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=jcc7kLdFg0cg2rdIS+n6bCC1DSRPRx9TNAMh4LivF/k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FOJRqWbSJGsSZmI0MaFN+Sc3K+wW9c+MGKbIuM8MzzE5gfP5v4oMUUnFPF0a0Ww35
	 JuvN/nvKdHWQ7CCxayr/DrtCaDL6xdJQY6SP4/LWeJ25xaiFop061qFoQ1NsdaBJ8/
	 kAZ9vNR1wnkSPP579rCQ7NGFRHqbBA4h1wzV0VJiANfIwduG0aiV01U3Aw7KylYMRi
	 YFyIhnmeq3MEhRHfldQlRFrrYPeDvCuuYYRhKMvKpkgqo9ojke3dnn1jBMFjMQ1ylh
	 qRiB9sfZ6oeD96U/DsiEv8p9AdqiW/DvLp8Exc4TGRfDzNUYQoqSpeK8K0Ev4IUN1a
	 ue+duV+PnbtCA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130043

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_50.2.bb =3D> eog_50.3.bb}       | 2 +-
 .../gnome-chess/{gnome-chess_50.0.bb =3D> gnome-chess_50.1.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_50.2.bb =3D> eog_50.3.bb} (90%)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_50.0.bb =3D> gn=
ome-chess_50.1.bb} (100%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_50.2.bb b/meta-gnome/recipe=
s-gnome/eog/eog_50.3.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/eog/eog_50.2.bb
rename to meta-gnome/recipes-gnome/eog/eog_50.3.bb
index 7eba518a5e..21c6853a69 100644
--- a/meta-gnome/recipes-gnome/eog/eog_50.2.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_50.3.bb
@@ -23,7 +23,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "c6c2afdfe40a838de0c6b264884a80d388f1c2ef=
a3f73a15ede08824c46be0b3"
+SRC_URI[archive.sha256sum] =3D "37280cd3874c6f219012b219f9f2c83bd88d750b=
f25f05bc7f742f41018466f4"
=20
 PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11','cms', =
'', d)}"
=20
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.0.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb
--=20
2.55.0


