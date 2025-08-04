Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BD2C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7492.1754342302114292071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B834F1E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 638D83F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/20] python3-typer: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:18:04 +0100
Message-ID: <20250804211804.344751-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118873

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-typer_0.16.0.bb        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb =
b/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
index 5295d2213e..794e0adaa1 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
@@ -9,12 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D173d405eb704b=
1499218013178722617"
=20
 SRC_URI[sha256sum] =3D "af377ffaee1dbe37ae9440cb4e8f11686ea5ce4e9bae01b8=
4ae7c63b87f1dd3b"
=20
-inherit pypi python_setuptools_build_meta ptest
-
-DEPENDS +=3D "\
-    python3-pdm-backend-native \
-    python3-pdm-native \
-"
+inherit pypi python_pdm ptest
=20
 SRC_URI:append =3D " \
     file://run-ptest \
--=20
2.43.0


