Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB6EC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:42:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12133.1749732141223901469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A411A1C0A
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 661313F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] libhugetlbfs: remove sysfsutils DEPENDS
Date: Thu, 12 Jun 2025 13:42:13 +0100
Message-ID: <20250612124215.2460717-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612124215.2460717-1-ross.burton@arm.com>
References: <20250612124215.2460717-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117886

This doesn't appear to have ever been needed as a build dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index ccc0b71c04..b9d65a7a20 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/libhugetlbfs/libhugetlbf=
s"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f17206a5=
b0a1"
=20
-DEPENDS =3D "sysfsutils"
 RDEPENDS:${PN} +=3D "bash python3-core"
 RDEPENDS:${PN}-tests +=3D "bash python3-core python3-resource"
=20
--=20
2.43.0


