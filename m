Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FDBC982CC
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18116.1789458273716477531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=i9W5nn03;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id F1BC71C419
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5o0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/31] gnome-calendar: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:25 +0200
Message-ID: <20260915074347.6003-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-07FFC9B9-710C7B3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9db6bb07-b868-4281-88b1-e06a06be8a08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=oZbSxx2GJ7/TNhT1u+CFoo2/u5Bx/Uj6zFGQ3ak2bEA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=i9W5nn03NpKZyONAydFaYQexgsvSzhCKqhepKWucw4Ic0YXLCteG1Q1qS0dAu2/ay
	 mRvtSEu9KULOQXSO7c0nPKPj8s4aW0p5PdWAEDlMj1oeLWfAVE3TOVhONtBVbs+zwc
	 Upx5GQbyphz6ThDkTvNP6rg3R7xam6riSPG6cSpp2yMw6AD3kJU2fA2E51ikolzDLB
	 bqu6w5pT49yxduulZmsDFkde8E5obmFCQc38+O/HlsfVXJ56Jp/qnqi+Shb7oVcGFb
	 3gv+2P4OzdQ5IiHfIdfWidtU9Bw8sAOuqUwTIoS0U1DuU+wmly1BZk8zuyO9ICWAIj
	 7gJbOfkZWpgYA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130055

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_50.0.bb =3D> gnome-calendar_51.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_50.0.bb =3D=
> gnome-calendar_51.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
index 10a2ae8b0c..9bebe7a377 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
@@ -27,7 +27,7 @@ SRC_URI +=3D "file://0001-Support-building-against-libi=
cal-4.0.patch"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
-SRC_URI[archive.sha256sum] =3D "4b75df071a52d98fb35e647d018030129d24d900=
7790d02457746c98617aeab0"
+SRC_URI[archive.sha256sum] =3D "77c290450c40834392cdea2c40451561e98f43d5=
dae93cd9e915051a6708dc30"
=20
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
--=20
2.55.0


