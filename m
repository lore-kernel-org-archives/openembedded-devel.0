Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FC1C369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 16:39:39 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13646.1744907969797530114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 09:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id B698F1614
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 18:39:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.76]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5SGt-0tTTjY0; Thu, 17 Apr 2025 18:39:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] static-passwd-meta-gnome: add gnome-remote-control user
Date: Thu, 17 Apr 2025 18:39:12 +0200
Message-ID: <20250417163912.1060162-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417163912.1060162-1-f_l_k@t-online.de>
References: <20250417163912.1060162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744907967-697F992D-11738116/0/0 CLEAN NORMAL
X-TOI-MSGID: 119a9391-4370-4228-8e3e-dc818563641b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116939

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/files/static-passwd-meta-gnome | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/files/static-passwd-meta-gnome b/meta-gnome/files=
/static-passwd-meta-gnome
index 4502d8bd10..03659d77f1 100644
--- a/meta-gnome/files/static-passwd-meta-gnome
+++ b/meta-gnome/files/static-passwd-meta-gnome
@@ -1 +1,3 @@
-gdm:x:680:nogroup::/:/bin/nologin
\ No newline at end of file
+gdm:x:680:nogroup::/:/sbin/nologin
+gnome-remote-desktop:x:974:974::/var/lib/gnome-remote-desktop:/sbin/nolo=
gin
+
--=20
2.49.0


