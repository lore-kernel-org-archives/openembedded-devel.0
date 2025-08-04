Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF346CA0EC4
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7485.1754342295370948066
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F419E1E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D4483F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/20] python3-itsdangerous: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:54 +0100
Message-ID: <20250804211804.344751-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118863

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-itsdangerous_2.2.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.2=
.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
index fc43e2854d..efa88f9a43 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4cda9a0ebd=
516714f360b0e9418cfb37"
=20
 SRC_URI[sha256sum] =3D "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c=
81fa6eb73e5f6173"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 CLEANBROKEN =3D "1"
=20
--=20
2.43.0


