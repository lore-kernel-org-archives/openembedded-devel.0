Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540CC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:33:46 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
 by mx.groups.io with SMTP id smtpd.web10.55144.1751877218306212866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 01:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=U6YwQ9fB;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.174, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1751877215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I5fl3YCwu9SVu+TbMdEwpVu6jsAOr9OnAzGt9ltfkMQ=;
	b=U6YwQ9fBWz8N1mniUsKFEq9A3QW9w2xmXezwdJJEiBCjbgb5jV1qmfy++vJJykd3Ev2fY2
	rxD43CvwJHv+jgyRBhL9/x5qMTbBGHd4LGUExXKZ4DpEhJK5Jx7h7ihM32oRosZ3iQZmrK
	wZ6IzBfp0wHZSFDEd3VypedHhqWweRo=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-moteus: upgrade 0.3.88 -> 0.3.89
Date: Mon,  7 Jul 2025 10:32:42 +0200
Message-ID: <20250707083242.3281294-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 08:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118245

Update python3-moteus to the latest release.

Since no formal changelog is available, here's the git shortlog of the
moteus python library [1] for the corresponding release:

Josh Pieper (2):
      Add some more register definitions
      Add --version options to moteus_tool and tview

[1] https://github.com/mjbots/moteus/commits/main/lib/python
Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../{python3-moteus_0.3.88.bb =3D> python3-moteus_0.3.89.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.88.bb =3D=
> python3-moteus_0.3.89.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb=
 b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
index b81c53652f..5467293ff8 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endli=
ne=3D9;md5=3D24025d3c660abfc62a
=20
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "e16387e5fe512a7580ef847e6b2e665d4b40549b064ab237=
e01fd7dec7c46232"
+SRC_URI[sha256sum] =3D "78ed04c213e20b44c81b73e2b66f5a7e45339014cc3fdaf9=
4c4fcc875d35402a"
=20
 S =3D "${UNPACKDIR}/moteus-${PV}"
=20
--=20
2.47.2


