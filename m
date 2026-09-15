Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12F7C982C7
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18077.1789458264474679677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=A9OrNcCb;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id C4E1A37D72
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds670; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 28/31] tinysparql: upgrade 3.11.1 -> 3.12.0
Date: Tue, 15 Sep 2026 09:43:44 +0200
Message-ID: <20260915074347.6003-28-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-B5FF89B9-7052541D/0/0 CLEAN NORMAL
X-TOI-MSGID: 93bbdc25-1158-412b-93e3-5d2175f2d9b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=2U/nmbKCsXR7rjSy3zUWHMsSFmoDs618Dq0OsiuAsdU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=A9OrNcCbHDpmK5iSESzYz2oyB8KI6FzbJJMSBWbxCY/qCyI6T5W6iVbG/FolA8S77
	 shs9j6AIHzEGxg1P9hR4lYHwzyXfdEn/F6pAKMroyrwHplDsvisqLVkakHnyhg23gE
	 b8kNOsq5igygpNquN99AB1bn9LvRllyDZG+s1c1jli078N7zHtgFScag1bWJ4jIsTa
	 qoK9Vog2+NPfJght3C6bS8m5eFFXseTO/tkemwPnMpVjqTMZxsJJ6AcRUcS5PjwekU
	 G1ZZS/90i7ARKL4Q70aar7zQvLr0OUWqJ4vtABPw36svi/KbmOtAOnJl2IY0QtY6aU
	 QNpdyAYlWhY/A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130046

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/{tinysparql_3.11.1.bb =3D> tinysparql_3.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.11.1.bb =3D> tinys=
parql_3.12.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb b/meta=
-gnome/recipes-gnome/tracker/tinysparql_3.12.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.12.0.bb
index a80d78047f..a645152378 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.12.0.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi=
-docgen bash-completion
=20
 SRC_URI +=3D "file://0001-fix-reproducibility.patch"
 SRC_URI +=3D "file://0001-src-libtracker-sparql-meson.build-dont-create-=
compat.patch"
-SRC_URI[archive.sha256sum] =3D "cfd46021ee1514ad435e714f7aa1ec7a787c7f51=
6a94f4c7438897ee3d6eca1e"
+SRC_URI[archive.sha256sum] =3D "40e3e3ae9811ae07a94ac7dfe8259f218679ebb1=
c9bc98d7ab345b2405926b57"
=20
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
--=20
2.55.0


