Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EA2F9D0D0
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 13:45:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19411.1776174347784001198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 06:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pVwJH5oI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B0B4E8A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 06:45:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B21433F7B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776174347; bh=ZGWchlw4Jh6up9CRzRMwlCf95OkkKZPdl3M9xBGDxAE=;
	h=From:To:Subject:Date:From;
	b=pVwJH5oIln7NNmMjWC5j7rXkwAE+hu7etYVcB9HyDdWRbPhWR1Ql2T4BbMHy+BVKU
	 /9F2nFHsRKozQ6oOsI4/urtL1/lGyEPhSFPO4yOX7/2UiyzI0tykdj6G9Y5Pam1Dmv
	 GhVFtpzu+KW63pbMCHvjgV+QhDCn4suOTLrwVP8Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] xerces-c: fix escaping in CVE_PRODUCT
Date: Tue, 14 Apr 2026 14:45:41 +0100
Message-ID: <20260414134543.2799524-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 13:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126338

The CPE parsing in oe-core's cve_check.py now handles escapes correctly[1=
]
so we don't need to escape in CVE_PRODUCT.

[1] oe-core 3c73dafd03b ("cve_check: Improve escaping of special characte=
rs in CPE 2.3")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb b/meta-o=
e/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
index 102e329878..0a3fbf5b93 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
@@ -9,7 +9,7 @@ SECTION =3D  "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-CVE_PRODUCT =3D "xerces-c\+\+"
+CVE_PRODUCT =3D "xerces-c++"
=20
 SRC_URI =3D "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar=
.bz2 \
     file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.pat=
ch \
--=20
2.43.0


