Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6452C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:42:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11890.1749732140946783311
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01040153B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4D863F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] bridge-utils: remove sysfsutils DEPENDS
Date: Thu, 12 Jun 2025 13:42:12 +0100
Message-ID: <20250612124215.2460717-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117885

This dependency was removed in bridge-utils 1.2 back in 2006[1].

[1] bridge-utils 29cd6d997cacb9191d1f869ec83fc86045885527.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.=
7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.=
bb
index 66c8f2d053..e213cd2c60 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -17,8 +17,6 @@ SRC_URI =3D "\
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "sysfsutils"
-
 CVE_PRODUCT =3D "kernel:bridge-utils"
=20
 inherit autotools-brokensep update-alternatives
--=20
2.43.0


