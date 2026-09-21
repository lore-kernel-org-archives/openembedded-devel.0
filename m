Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEE7C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47148.1789991724365793941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=sV1EtVD5;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 0F8C67D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1z90; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/24] python3-pyperf: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:48 +0200
Message-ID: <20260921115500.53770-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-8DFF8A93-1F606CF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 78601f73-7a79-442b-92d3-5b3943d9bd61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=9TpKeGbE76J8PZ5QpcF9Bs0dvGqIM3VQ3MOdRwhnrys=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sV1EtVD53RCgI8RYTYxVFEB5eNeWOk8wPoGe4s9BhyBGb7L9W4LCCoLywpnMclcAb
	 drm9YXNREVHegxiD+Ag0TWltFWGO88gdovneiuDnNbDPBMXCNdc1gcogoQHzj3/FiC
	 ISmzewB8X4KhBO6HDgoE9V0Rva85axMfeicaKshqPwmiK6wOar6lOHu2Pzp6NN+x71
	 wqYsq6gEW6l15DbRYbyTvZd7gATvLslZEaOhRi8dQL2bOm1tVwbOQV3DU6+Afv4oPW
	 3I/OGVQkW7JZYGcG9XKexsEsfKS7KLsvoXr0dZiUR0bKQhFIDqO1JyXv09S5BpHTxx
	 +j70xdK4Qxirw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130133

pyperf no longer uses six at build time; the native dependency is stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
index 39b8ee8470..5566f314de 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78bc2e6e87c8=
c61272937b879e6dc2f8"
=20
 SRC_URI[sha256sum] =3D "dd93ccfda79214725293e95f1fa6e00cb4a64adcf1326039=
486d4e1f91caaa62"
=20
-DEPENDS +=3D "python3-six-native"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "python3-misc python3-statistics"
--=20
2.55.0


