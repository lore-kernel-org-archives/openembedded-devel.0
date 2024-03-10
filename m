Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF60C54E66
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 09:03:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.30584.1710061414536695189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 01:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout08.t-online.de (Postfix) with SMTP id 5C1A0D38F
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 10:01:43 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.166.16]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjF3t-30IuP30; Sun, 10 Mar 2024 10:01:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] editorconfig-core-c: fix reproducibility issue
Date: Sun, 10 Mar 2024 10:01:54 +0100
Message-ID: <20240310090155.1097000-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710061301-E4A16957-5E94DF17/0/0 CLEAN NORMAL
X-TOI-MSGID: bc0eb85a-cb93-4216-a0a6-62fa3bca53c7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 09:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109251

remove STAGING_DIR_HOST from the EditorConfigTargets.cmake file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../editorconfig/editorconfig-core-c_0.12.6.bb                 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.=
12.6.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.=
6.bb
index 1facb352c..976120b51 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
@@ -13,3 +13,6 @@ inherit cmake
=20
 DEPENDS =3D "pcre2"
=20
+do_install:append() {
+    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/EditorConfi=
g/EditorConfigTargets.cmake
+}
--=20
2.44.0


