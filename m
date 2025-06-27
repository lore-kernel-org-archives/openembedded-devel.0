Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77459C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:26:55 +0000 (UTC)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
 by mx.groups.io with SMTP id smtpd.web10.8581.1751012812287989424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 01:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=O21+HzrC;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.180, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1751012809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mFoubhCtop/C+WK29yclFHUaGI+tn25RpXQo+Ck24yc=;
	b=O21+HzrC0rJ0kupycoRBJIf/E+cpClRtxsnu94bC0M3ptquAznHFn+oPjDYCntik3ojSOI
	7+M9MJc4C0Bc9OQVW/spqZENcImIxdBkHFUFf+1Z68IlBfIfJonUOa6LRbbTn7/gBGNteX
	2FTvLyr5KU7TJrAzht936S4Qxqd8Fbw=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [meta-python][walnascar][PATCH] python3-moteus: Upgrade 0.3.79 -> 0.3.88
Date: Fri, 27 Jun 2025 10:26:23 +0200
Message-ID: <20250627082623.4115091-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 08:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118143

python3-moteus <=3D 0.3.87 requires numpy<2 [1], but openembedded-core
versions newer than styhead provide numpy 2.x [2], causing "pip check" to
fail with the following error:

	moteus 0.3.87 has requirement numpy<2, but you have numpy 2.3.0.

This patch resolves the issue by updating python3-moteus to 0.3.88.

[1] https://github.com/mjbots/moteus/issues/89
[2] https://layers.openembedded.org/layerindex/recipe/51338/
(cherry picked from commit 9af65f1680d2bb27e7c8911e8912ddeb2e38fe41)
(cherry picked from commit 7414d1147ee31fda335df00a7723fa80290d20ed)
(cherry picked from commit 980f7e5da4745ee56a42833114bc990412b747be)
(cherry picked from commit c2c4428c313cf2de5a3af4b4932e791172000d1c)
(all cherry-picks were squashed to this commit)
Cc: Leon Anavi <leon.anavi@konsulko.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../{python3-moteus_0.3.79.bb =3D> python3-moteus_0.3.88.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.79.bb =3D=
> python3-moteus_0.3.88.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb=
 b/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
index 4944e13ff4..80557d4959 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endli=
ne=3D9;md5=3D24025d3c660abfc62a
=20
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "fae569f0c2e208059e081cf0fcca2e8f71c6c1de582836c7=
45bb884af1e35bf4"
+SRC_URI[sha256sum] =3D "e16387e5fe512a7580ef847e6b2e665d4b40549b064ab237=
e01fd7dec7c46232"
=20
 S =3D "${WORKDIR}/moteus-${PV}"
=20
--=20
2.47.2


