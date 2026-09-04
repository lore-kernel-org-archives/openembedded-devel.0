Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9094C79F8B
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11564.1788520954739856576
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UBXjyjd2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73087153B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD6283F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520954; bh=Lo5heYml5Dae2D1Mbar6GeyrzFujWirZpgC4Z4O9Uks=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UBXjyjd2vD9Y7xuyjsQF1SBhrTpwTnKS6raDAhdUPsR/RBApRpphfIFR+80VOFQg9
	 +yYp+S8o8X27NAKYAsGwkpi999WbwRDnh8lVQckMlXSSqO97py67X/ukc2qYn/5F1G
	 MR3QQKAs5dOA29qSm35713Loci0nAcxXQeOy/ftA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 7/9] python3-gammu: remove redundant S assignment
Date: Fri,  4 Sep 2026 12:22:20 +0100
Message-ID: <20260904112222.114451-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129761

This is the default value, so there's no need to set it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/=
meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
index 52a0af810fa..f5e2cc4da1f 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -12,8 +12,6 @@ inherit pypi setuptools3 pkgconfig
 SRC_URI +=3D "file://0001-setup.py-StrictVersion-packaging.version.patch=
"
 SRC_URI[sha256sum] =3D "49fc70f01bc192c43ff3ec815e082df5261ea4c8d36a695e=
977734c4eb4df868"
=20
-S =3D "${UNPACKDIR}/python-gammu-${PV}"
-
 DEPENDS +=3D "gammu python3-packaging-native"
=20
 RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-threading"
--=20
2.43.0


