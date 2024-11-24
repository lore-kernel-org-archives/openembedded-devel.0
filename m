Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A686E668B6
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 14:58:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.68073.1732460298059964109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Nov 2024 06:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id B9D2C4E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 15:58:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.120]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tFE3y-19tjpx0; Sun, 24 Nov 2024 15:58:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: update 115.16.1 -> 115.17.0
Date: Sun, 24 Nov 2024 15:58:07 +0100
Message-ID: <20241124145807.15328-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732460294-5CFE490D-EE93A7A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c7226ef-3dc9-45eb-a9cb-1467c45368be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 14:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114028

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/{mozjs-115_115.16.1.bb =3D> mozjs-115_115.17.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-115_115.16.1.bb =3D> mozjs-=
115_115.17.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb
index df75e29bd..ca92f2cce 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://1894423.patch \
            file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
            "
-SRC_URI[sha256sum] =3D "c3bb5a210738ca0f8cd26aa53fc4a07560db079c06cd0421=
cf35af4035029367"
+SRC_URI[sha256sum] =3D "80f184a102a743ee75401e86dd86af0be5f1e5ebf07c8111=
9d9ca77422d716c3"
=20
 UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs115"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.47.0


