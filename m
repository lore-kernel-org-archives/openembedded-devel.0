Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41523C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1935.1667847914847558544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 5DF321587C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:05:13 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7Qm-28ACOK0; Mon, 7 Nov 2022 20:05:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/5] yelp: use libsoup-3.0 by default
Date: Mon,  7 Nov 2022 20:04:53 +0100
Message-Id: <20221107190454.39581-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107190454.39581-1-f_l_k@t-online.de>
References: <20221107190454.39581-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667847913-60A0E2DC-759CF744/0/0 CLEAN NORMAL
X-TOI-MSGID: bb63e3a9-5868-423b-9236-1b5aa862d32a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99478

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
index fe3b1105c..200ed0f70 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -22,11 +22,13 @@ DEPENDS +=3D " \
     webkitgtk \
     yelp-xsl \
 "
-PACKAGECONFIG ?=3D ""
+PACKAGECONFIG_SOUP ?=3D "soup3"
+PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
=20
-# Enable if soup3 is enabled in webkit recipe
+PACKAGECONFIG[soup2] =3D "--with-webkit2gtk-4-0,,"
 PACKAGECONFIG[soup3] =3D ",--with-webkit2gtk-4-0,"
=20
+
 do_configure:prepend() {
     export ITSTOOL=3D${STAGING_BINDIR_NATIVE}/itstool
 }
--=20
2.34.1


