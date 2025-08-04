Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FDAC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7489.1754342298737892838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E6D81E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0701D3F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/20] python3-soupsieve: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:59 +0100
Message-ID: <20250804211804.344751-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118868

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb=
 b/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
index 684290ffad..94b02f824a 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da23cdb0cf58=
a8b6d3d25202783bd6553"
=20
 SRC_URI[sha256sum] =3D "ad282f9b6926286d2ead4750552c8a6142bc4c783fd66b02=
93547c8fe6ae126a"
=20
-inherit pypi python_hatchling python_setuptools_build_meta ptest-python-=
pytest
+inherit pypi python_hatchling ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D " \
     python3-core \
--=20
2.43.0


