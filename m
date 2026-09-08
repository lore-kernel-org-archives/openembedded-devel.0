Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45131C79FAA
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:06:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9711.1788879994996288766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=iPuKtr6y;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout01.t-online.de (Postfix) with SMTP id B61F91C529
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Sep 2026 17:06:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.236]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3xP6-0czMwc0; Tue, 8 Sep 2026 17:06:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gdm: remove dbus-broker from RCONFLICTS
Date: Tue,  8 Sep 2026 17:06:22 +0200
Message-ID: <20260908150627.2940117-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908150627.2940117-1-f_l_k@t-online.de>
References: <20260908150627.2940117-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788879992-E9FF895A-C4E992C8/0/0 CLEAN NORMAL
X-TOI-MSGID: 9beaf14a-2237-4f60-971a-9b12514d8d47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788879992; i=f_l_k@t-online.de;
	bh=DW5PrGn3z5PTAassoGbpq97FucXRvqTIibIjQ2+KOQY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iPuKtr6y2McXdEKT5pznDXVZ4zJC3CJrAkywBF8PzrDXdkMj/pCqA9KRhC1UkAsos
	 PRhgpoUUT9xDFH7O2ACXxVtp8CovQmHmIrBGRljef1pC/KUIKk8Ij0quh5uMhpJvB1
	 ZHAjqIGPKjfzLLT5TZP+3IJynIxwudwhOwTnG2Gyhc5pVTl2M2LTCQXC7OfO/NaNLJ
	 2JPIfe9uKV2P5f/TUP494cDBRXnyHKR2sSd2t5dn3xkwGwY35vpnBnZJHxdfE7f6oB
	 LX6T24UYw8uY9I5Lmmoecazawd37CFDjK6Kr8LWYdxMKawzlTxUaKB//d8jBSm6jjH
	 tbqqTlI0zkFYg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 15:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129862

After further debugging it turned out that the root cause of my issue
was a race condition between gdm and kmscon and switching to dbus just ch=
anged the
condition to my favour. gdm itself can work with dbus-broker, so this
statement is false

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_50.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_50.2.bb
index 8b4470ec98..c87b958fcd 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
@@ -78,7 +78,4 @@ FILES:${PN} +=3D " \
     ${systemd_unitdir} ${systemd_user_unitdir} \
 "
=20
-RDEPENDS:${PN} +=3D "${PN}-base"
-# gdm relies on dbus-run-session provided by dbus
-RCONFLICTS:${PN} +=3D "dbus-broker"
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${PN}-base ${VIRTUAL-RUNTIME_dbus}"
--=20
2.55.0


