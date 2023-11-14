Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707C4C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 13:11:41 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.12050.1699967495857353810
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 05:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 2AD85B5B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 14:11:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.36]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2tCS-42amJd0; Tue, 14 Nov 2023 14:11:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] system-config-printer: Add cups to rdepends
Date: Tue, 14 Nov 2023 14:11:56 +0100
Message-ID: <20231114131156.42582-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699967488-ABFFC9F9-56346757/0/0 CLEAN NORMAL
X-TOI-MSGID: b3da34f3-aae1-4afe-8e97-7cd50422e7f1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 13:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106715

---
 .../system-config-printer/system-config-printer_1.5.18.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
index f0ff24f37..4f1498546 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -33,6 +33,7 @@ do_install:append() {
 FILES:${PN} +=3D "${libdir} ${datadir}"
=20
 RDEPENDS:${PN} =3D " \
+    cups \
     dbus-x11 \
     gtk+3 \
     libnotify \
--=20
2.42.0


