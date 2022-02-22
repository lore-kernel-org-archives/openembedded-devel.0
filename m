Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6DBC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 06:42:54 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web08.9806.1645512173571268022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id 119341283F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:42:52 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.173.113]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nMOsp-1k2ZNq0; Tue, 22 Feb 2022 07:42:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 2/2] xfce4-panel: disable vala
Date: Tue, 22 Feb 2022 07:42:38 +0100
Message-Id: <20220222064238.2554257-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222064238.2554257-1-f_l_k@t-online.de>
References: <20220222064238.2554257-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645512167-0000BD0E-0E36AB70/0/0 CLEAN NORMAL
X-TOI-MSGID: 33d2575b-80d6-48c7-b3ae-098f2ba3e8ea
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 06:42:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95441

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/m=
eta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index 3c1864a80..02038b0c1 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -14,6 +14,8 @@ SRC_URI +=3D " \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
=20
+EXTRA_OECONF +=3D "--disable-vala"
+
 python populate_packages:prepend() {
     plugin_dir =3D d.expand('${libdir}/xfce4/panel/plugins/')
     plugin_name =3D d.expand('${PN}-plugin-%s')
--=20
2.25.1


