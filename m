Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D3CC7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 13:56:02 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
 by mx.groups.io with SMTP id smtpd.web10.8799.1750946154566349782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 06:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=X7IGcGAo;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.189, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1750946152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VQwEr66KsQRkTS2iDQkuugyOZC/eMATNLm8IjCXWyyM=;
	b=X7IGcGAoqrN6LWcpznNDZrC5jjHd0zb+UHFf1F8s+PkRoufjlL7O7QtgYlMEILV8JndHDX
	A/uCTMIuZOSMtngn9FvOOqYCqfhF5kfaPWBrsuuWRFqnx8n8/V8PM7H+oeyTTuJ40pbbnD
	nuIs82pR0M3VEeaywx8hPktN4s8QI+U=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-moteus: upgrade 0.3.87 -> 0.3.88
Date: Thu, 26 Jun 2025 15:55:41 +0200
Message-ID: <20250626135541.3733219-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 13:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118122

python3-moteus <=3D 0.3.87 requires numpy<2 [1], but openembedded-core
versions newer than styhead provide numpy 2.x [2], causing "pip check" to
fail with the following error:

	moteus 0.3.87 has requirement numpy<2, but you have numpy 2.3.0.

This patch resolves the issue by updating python3-moteus to 0.3.88.

[1] https://github.com/mjbots/moteus/issues/89
[2] https://layers.openembedded.org/layerindex/recipe/51338/
Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../{python3-moteus_0.3.87.bb =3D> python3-moteus_0.3.88.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.87.bb =3D=
> python3-moteus_0.3.88.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb=
 b/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
index 514eafb1b2..b81c53652f 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endli=
ne=3D9;md5=3D24025d3c660abfc62a
=20
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "988f264c330a17d63219c49dd2365bdaff97156be3ab6c5e=
aa204b45dca621e8"
+SRC_URI[sha256sum] =3D "e16387e5fe512a7580ef847e6b2e665d4b40549b064ab237=
e01fd7dec7c46232"
=20
 S =3D "${UNPACKDIR}/moteus-${PV}"
=20
--=20
2.47.2


