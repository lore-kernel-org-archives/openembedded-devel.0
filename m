Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063E8C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18074.1789458262036944242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=H4gpAlZS;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 04CFF37C28
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5p0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/31] gnome-console: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:26 +0200
Message-ID: <20260915074347.6003-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-A27FB9B9-8EF0D462/0/0 CLEAN NORMAL
X-TOI-MSGID: 662bd381-9800-4705-93df-5aa628cacf6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=ktWSUHAdJIEK4YxcfrmJftp0s6KVr7Cg+92uIO1IOns=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=H4gpAlZSDnD7dwfdDOda1+khghXTL80A9u4aLyddey71DtbkUg6EbiODrh9EDh7jk
	 cQFCCtESp9yS9Hijaz3NShofXtEtus9861111fnlx+b7mtYkPGCGzGaUkzaoAreM6o
	 fmj/rvUonj5jRgFBX9IKynreHd0snjb+ljSkAiy8vFbULLt3tGXHxn+fTU8g7Sbvl5
	 sDlKKmC0cafxy3n5LMlWuQzVkNQpuv/APW+maztYgFdTkjM16m37RMFZtkQ33pPDhW
	 aR15lNe6gVRc1IroVahGETwaejdZgY9kJhdAZ9E6Tq6C7phpWWEfUyDv1lW/y3TeqW
	 9/0/qTOgL1CzA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130036

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-console_50.0.bb =3D> gnome-console_51.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_50.0.bb =3D=
> gnome-console_51.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb=
 b/meta-gnome/recipes-gnome/gnome-console/gnome-console_51.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_51.0.bb
index 0ec64f9cc8..d76feff13f 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_51.0.bb
@@ -18,7 +18,7 @@ DEPENDS =3D " \
     vte \
 "
=20
-SRC_URI[archive.sha256sum] =3D "e4950207f0547e6a6c0f18eebfcf6e1a10461eab=
0f2fae0aae512b1044c7ac6e"
+SRC_URI[archive.sha256sum] =3D "f40d13903b1f067f0c02e0812f78df8ec25d8cd1=
29794e7e46bd56ca0c156f2f"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
--=20
2.55.0


