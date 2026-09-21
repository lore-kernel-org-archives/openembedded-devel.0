Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A49DC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47394.1789991767149283276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=QVn4rC5W;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id DE7591C411
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z80; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/24] python3-pymemcache: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:47 +0200
Message-ID: <20260921115500.53770-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-EA7F3A93-2682C86E/0/0 CLEAN NORMAL
X-TOI-MSGID: 87053fd7-b3e3-48b3-9944-c12b57b144ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=BEMI7UUqvcPLzzehALEg/k5o6FKMeKxTPBO4hMJIdRw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QVn4rC5WXQQpLOZFdOEP5NY6PJ1QS3vug+sZ1hoVQTcTcmtJG7FZeoaXc+B+cUg8h
	 LYNrV8588/TH1eqTK/ie3tv8s0LE9sicM9HcWHy5l/syIyiYwd12nziyPz17xtxWAN
	 9mzMkMD/4X/rP0kPx7t/tVB8043zitRN+bug2KMedCuluW1hR9REN90X+VuMFzLs/H
	 Pj3cmZd4VIc4NSN4jsgVQ+YsiAEtW3yEhVpYYnDzQORg/hD3wP/5wU5ATunm0pXzTf
	 iDV/+Ke5gMGb87En5EN+KLM9rn/NiNLsDOkviARzjloJ2WbKLVUMvehOD/B3RouTkf
	 DRqcGYFJ98TVQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130143

pymemcache no longer uses six at build time; the native dependency is
stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0=
.bb b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
index f47711c6b5..9ceeaef95b 100644
--- a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
@@ -11,7 +11,6 @@ inherit pypi setuptools3
=20
 DEPENDS +=3D " \
     python3-setuptools-scm-native \
-    python3-six-native \
 "
=20
 RDEPENDS:${PN} +=3D "\
--=20
2.55.0


