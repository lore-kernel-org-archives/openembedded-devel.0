Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E996AC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 09:56:33 +0000 (UTC)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
 by mx.groups.io with SMTP id smtpd.web10.14483.1704275786419155744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 01:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=BsCiTuHG;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.180, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1704275784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QjlezpwievVXgkpHNS+ppDx24QB8u6GwEav62D7KWzE=;
	b=BsCiTuHGKiFD8EUaVlcHdJfbnR3Lkd3a9qDalIfYC4zBT6O4FgtG97afCjYQnv2SZ5MorV
	icOSwFCBveR6VUXAXHRCyrp/Zwejdv2vzFSDXjBahXJfGDNP4FDxbpzC1nUThhenoJ7nXW
	ET3gdtiA7pPABAw1WKL3Z9m2mikIOnY=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-pytest-cov: add missing python3-coverage dependency
Date: Wed,  3 Jan 2024 10:56:02 +0100
Message-Id: <20240103095602.2737711-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108030

As reported by "pip3 check" python3-pytest-cov depends on
python3-coverage:

	$ pip3 check
	pytest-cov 4.1.0 requires coverage, which is not installed.

This patch fixes this problem by adding python3-coverage to RDEPENDS

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
index 1ff3e75cb..3a68011f4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -10,5 +10,6 @@ SRC_URI[sha256sum] =3D "3904b13dfbfec47f003b8e77fd5b589=
cd11904a21ddf1ab38a64f204d6
 inherit pypi setuptools3
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS:${PN} +=3D "python3-coverage"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.40.1


