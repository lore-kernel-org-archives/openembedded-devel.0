Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CD0C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:49:53 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
 by mx.groups.io with SMTP id smtpd.web10.10051.1750949387547574336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=KrBQAvJD;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.180, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1750949385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3+JAL57a8govnbVpqxY/2kmqpxHQxTVzNCLEw/SxB74=;
	b=KrBQAvJDBvocGtzwUON61BbXI8dgLPrpSkzJOF3SwbLXpxFLAnNAsUoaz3VwPomKXhmx58
	Cb1QsqW7sQsFAPEbpOrIrkUcNwZMbh9NNdZpc50u/6vYLlehH/bCKCeZLTa2Z029h1S87T
	7lWn0bHF+uKk0KKALO2WHHOKmMIhD2U=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH v2] python3-can: upgrade 4.4.2 -> 4.5.0
Date: Thu, 26 Jun 2025 16:49:28 +0200
Message-ID: <20250626144928.3775478-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118128

python3-can 4.4.y requires msgpack~=3D1.0.0, but openembedded-core
versions newer than scarthgap provide msgpack 1.1.0 [1], causing
"pip check" to fail with the following error:

    python-can 4.4.2 has requirement msgpack~=3D1.0.0; platform_system !=3D=
 "Windows", but you have msgpack 1.1.0.

This patch resolves the issue by updating python3-can to 4.5.0.

[1] https://layers.openembedded.org/layerindex/recipe/66997/
Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/{python3-can_4.4.2.bb =3D> python3-can_4.5.0.bb}    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.4.2.bb =3D> py=
thon3-can_4.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-can_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-can_4.5.0.bb
index 31190a9f1d..8e32cee622 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.5.0.bb
@@ -4,13 +4,15 @@ SECTION =3D "devel/python"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De6a600fd5e1d9cbde2d983680=
233ad02"
=20
-SRC_URI[sha256sum] =3D "1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195=
e92f87257f009df5"
+SRC_URI[sha256sum] =3D "d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d06=
80b2eaeaf52f8eb7"
=20
 PYPI_PACKAGE =3D "python_can"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-setuptools-scm-native"
+
 RDEPENDS:${PN} +=3D "\
     python3-aenum \
     python3-asyncio \
@@ -21,6 +23,7 @@ RDEPENDS:${PN} +=3D "\
     python3-json \
     python3-logging \
     python3-misc \
+    python3-msgpack \
     python3-netserver \
     python3-packaging \
     python3-pkg-resources \
--=20
2.47.2


