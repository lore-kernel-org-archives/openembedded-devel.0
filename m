Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B54E810A3
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:00:37 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.12669.1695801634596799722
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id B4F0FD243
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 10:00:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.64]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qlPT9-1P6NUX0; Wed, 27 Sep 2023 10:00:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: Upgrade 102.15.0 -> 102.15.1
Date: Wed, 27 Sep 2023 10:00:18 +0200
Message-ID: <20230927080018.2533-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695801627-827EAF2D-5843F6CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 8413de61-89ab-40a5-a9bd-07913f569d41
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105174

This fixes a possible segfault in polkit

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/{mozjs-102_102.15.0.bb =3D> mozjs-102_102.15.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-102_102.15.0.bb =3D> mozjs-=
102_102.15.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
index 08cfededa..8a39b2d31 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            "
-SRC_URI[sha256sum] =3D "81fa590408f5a3af8f004d839ac47fb4121e05fe71733444=
5cec9ca55d8746af"
+SRC_URI[sha256sum] =3D "09194fb765953bc6979a35aa8834118c453b9d6060bf1ec4=
e134551bad740113"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.42.0


