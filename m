Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286CDC54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 11:42:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19987.1710502922877932993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 04:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E034CC15
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 04:42:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 205233F762
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 04:42:02 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python] python3-pydantic-core: just set PYPI_PACKAGE
Date: Fri, 15 Mar 2024 11:41:59 +0000
Message-Id: <20240315114159.1063479-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109337

From: Ross Burton <ross.burton@arm.com>

There's no need to set PYPI_ARCHIVE_NAME and S explicitly if PYPI_PACKAGE
is set correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.16.3.bb   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.=
3.bb
index b26478451a..2086091d63 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -17,9 +17,7 @@ require ${BPN}-crates.inc
=20
 inherit pypi cargo-update-recipe-crates python_maturin
=20
-S =3D "${WORKDIR}/pydantic_core-${PV}"
-
-PYPI_ARCHIVE_NAME =3D "pydantic_core-${PV}.${PYPI_PACKAGE_EXT}"
+PYPI_PACKAGE =3D "pydantic_core"
=20
 RDEPENDS:${PN} +=3D "python3-typing-extensions"
=20
--=20
2.34.1


