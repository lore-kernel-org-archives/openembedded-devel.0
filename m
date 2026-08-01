Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A21C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 15:58:41 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8177.1785599918877925391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 08:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=JL6q9goS;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 66A1437BB2
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Aug 2026 17:58:31 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wqC6T-4T0qen0; Sat, 1 Aug 2026 17:58:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] colord: set proper home-dir
Date: Sat,  1 Aug 2026 17:57:50 +0200
Message-ID: <20260801155750.7583-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1785599905-BE7FBB82-44945E06/0/0 CLEAN NORMAL
X-TOI-MSGID: b7702e58-32ec-4a45-bace-d5b53bb4c5a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785599911; i=f_l_k@t-online.de;
	bh=fyO/1G8cE28eDKuE7OTiikV2Cw1T8L2W7b9hMhCpN2E=;
	h=From:To:Subject:Date;
	b=JL6q9goSy4fsDujo2layNIfOCEoLnzDDuDUVueCvQcM2xP572Pl68OzqTldV0mq/7
	 r+zKezD9WD64ZkoEwM+43mHndRmjPJWPshdF5Y6xNDK4kg1Pl2sOlxWDTwusAV2zTL
	 URxzjBqjv1IOPRjlUXlqkc8HHgl9sFhDNkfZQ9EcsmN0VzNdqv3+1Ql63lv33Uzy6v
	 7WxQkqUxAK0rsknxr1wbx5OAgdbz0NmSnl+pMouxNC+YTtiMhhkjPvdWbE+3Uhycww
	 aGc70ImU02NPK4SmRGDunrwwIQcilbFgo9Z7SOEVyQNWzHlb+WT1wjB+i3QWaJ3yrY
	 ds/kgg1N09nxA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 15:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128616

This fixes:
WARNING: hyprland-image-1.0-r0 do_rootfs: User colord has been defined as=
 (colord, 998, 998, -, /home/colord, /bin/false) but sysusers.d expects i=
t as (colord, -, -, colord colour management daemon, /var/lib/colord, -)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/colord/colord.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-s=
upport/colord/colord.bb
index 19d2ac3211..571c4b1826 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -47,6 +47,11 @@ FILES:${PN} +=3D " \
     ${libdir}/sysusers.d \
 "
=20
+do_install:append() {
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/lib/colord 700 root root - -" > ${D}${sysconfd=
ir}/tmpfiles.d/colord.conf
+}
+
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --user-group -s /bin/false colord"
+USERADD_PARAM:${PN} =3D "--system --user-group --shell /bin/false --no-c=
reate-home --home-dir ${localstatedir}/lib/colord colord"
=20
--=20
2.55.0


