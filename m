Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2418CA101C
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:18 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.34375.1756974135279560523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id E2E8CEA82
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Sep 2025 10:22:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu5EM-3FNIag0; Thu, 4 Sep 2025 10:22:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][RFC][PATCH 2/2] glibmm: update 2.80.0 -> 2.85.0
Date: Thu,  4 Sep 2025 10:21:55 +0200
Message-ID: <20250904082155.1889717-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904082155.1889717-1-f_l_k@t-online.de>
References: <20250904082155.1889717-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756974126-E1FF8977-568BD113/0/0 CLEAN NORMAL
X-TOI-MSGID: 7732e475-88e6-4045-9ce6-e6b71e8433f8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119272

update is required for gtk 4.20.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../glib-2.0/{glibmm-2.68_2.80.0.bb =3D> glibmm-2.68_2.85.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb =3D> glibmm-=
2.68_2.85.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
index 48a1a2a624..8a4e834715 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI[archive.sha256sum] =3D "539b0a29e15a96676c4f0594541250566c5ca44d=
a5d4d87a3732fa2d07909e4a"
+SRC_URI[archive.sha256sum] =3D "0771306711299fbf62e53c752d53ed5816351271=
67a6cc79ae05f2b8421d29d7"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.50.1


