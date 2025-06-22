Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3566C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 17:43:32 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.1621.1750614211442234158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 10:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id B4A58E051
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 19:43:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.134]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uTOj3-11QWQM0; Sun, 22 Jun 2025 19:43:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gexiv2: fix buildpath error
Date: Sun, 22 Jun 2025 19:43:23 +0200
Message-ID: <20250622174323.22987-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250622174323.22987-1-f_l_k@t-online.de>
References: <20250622174323.22987-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1750614209-1D7F8544-6BF7E401/0/0 CLEAN NORMAL
X-TOI-MSGID: 802d5650-645a-488a-9a23-df5f526f4e02
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 17:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118023

adapt 'sed' command to UNPACKDIR changes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnom=
e/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
index c9307967de..fadae34608 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-python3 =3D "${PN}"
=20
 PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
 src_package_preprocess () {
-        # Trim build paths from comments in generated sources to ensure =
reproducibility
-        sed -i -e "s,${B}/../${BPN}-${PV}/${BPN}/,,g" \
+        # Trim build paths from code in generated sources to ensure repr=
oducibility
+        sed -i -e "s,${B}/../sources/${BP},${TARGET_DBGSRC_DIR},g" \
             ${B}/gexiv2/gexiv2-enums.cpp
 }
=20
--=20
2.49.0


