Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409B2CD342C
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 00:30:40 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.7432.1695083436774617264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 17:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id A1E9B1443E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 02:30:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.37]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiOd7-1xHfQ90; Tue, 19 Sep 2023 02:30:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] tracker: add missing Upstream-Status
Date: Tue, 19 Sep 2023 02:30:19 +0200
Message-ID: <20230919003019.20666-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695083417-0492CEBC-FDAB3F48/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c6302d3-c2b6-44b7-b68f-f9a1e2018534
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 00:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104955

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/tracker/0001-fix-reproducibility.patch              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproduci=
bility.patch
index 30a58923c..4a11f8314 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
@@ -8,6 +8,8 @@ binaries at various places. Avoid this to improve binary =
reproducibility.
=20
 todo: Some of these paths may need to be adjusted to make the test envir=
onment work
=20
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  meson.build                       | 6 +++---
--=20
2.42.0


