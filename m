Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA96C624D3
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 13:50:08 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8397.1788616195703605084
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2026 06:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=cgGHa09C;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 7DDD94AF;
	Sat,  5 Sep 2026 15:49:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.1]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x2qmF-1bajDN0; Sat, 5 Sep 2026 15:49:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Claude Opus 5 <noreply@anthropic.com>
Subject: [meta-gnome][PATCH 2/2] evolution-data-server: don't pull webkitgtk by default
Date: Sat,  5 Sep 2026 15:49:39 +0200
Message-ID: <20260905134939.47864-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905134939.47864-1-f_l_k@t-online.de>
References: <20260905134939.47864-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788616191-32FFA9E3-EFA43C74/0/0 CLEAN NORMAL
X-TOI-MSGID: cd04ac3e-e9e2-4990-932c-da5e4f3c4527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788616193; i=f_l_k@t-online.de;
	bh=fAJjNc4AArs6yjov5WJfeXFmuPU5dgqvdR5OIF40lDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cgGHa09CONP5KyJnL9QpJCEIEyOWVYsjWqX6jcA66PmYv30x7QvO3oHgCSlSXnvsL
	 XtNW0k3KJLc5qKKBe0ORtXZvPCrrMe1xGFtT0agJhIsDhJdmvKb0QcwwT0UTaUnV7x
	 nVl87LWpvOEP5o4OfwflIPIR5VaQL5g0Adabdz7i0MUOGBcZhgwdJIB6BeY0UkWIf0
	 R4ln8HZajpB3jy0iNELGO19bTa0hB5TE7fc54foLWOa9zuZYcdwl1OmtHgu9jLq8ts
	 sKRNXL6iKuGcsCbd4sBLzF9JM9hg2FR6+VtO1lwBG8xfxP0SQLuBtYoksz5oVu98fW
	 /8F35Q/wL+Dow==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 13:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129778

The oauth PACKAGECONFIG only controls the embedded webview of the built-i=
n
OAuth2 credentials prompter (ENABLE_OAUTH2_WEBKITGTK4, guarded by
WITH_WEBKITGTK in e-credentials-prompter-impl-oauth2.c). OAuth2 support
itself does not depend on it: json-glib is a hard requirement of the buil=
d
and without WebKit the prompter offers the authentication URI for opening
in the default browser, receiving the response over the
org.gnome.evolution.dataserver.OAuth2Response D-Bus service.

Drop oauth from the default PACKAGECONFIG so that webkitgtk is not pulled
into every build that needs evolution-data-server. The option stays
available for those who want the in-dialog browser.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01HiauLCu6cken5wf44PijzQ
---
 .../evolution-data-server/evolution-data-server.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index c3c4e3eae5..8ed111b334 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -39,7 +39,7 @@ EXTRA_OECMAKE =3D " \
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D${STAGING_BINDI=
R}/g-ir-scanner-wrapper"
=20
-PACKAGECONFIG ?=3D "goa oauth"
+PACKAGECONFIG ?=3D "goa"
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
 PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON -DENABLE_OA=
UTH2_WEBKITGTK=3DON,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEBK=
ITGTK=3DOFF,webkitgtk json-glib"
--=20
2.55.0


