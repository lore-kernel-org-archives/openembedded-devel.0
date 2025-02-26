Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F32C19F32
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:22:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11467.1740590552539355107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5E01A2D
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A78293F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] udpcast: add missing manpages PACKAGECONFIG
Date: Wed, 26 Feb 2025 17:22:17 +0000
Message-ID: <20250226172220.1033779-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226172220.1033779-1-ross.burton@arm.com>
References: <20250226172220.1033779-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 17:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115679

The manpages.bbclass adds the 'manpages' PACKAGECONFIG but this isn't
defined:

    ERROR: QA Issue: udpcast: invalid PACKAGECONFIG: manpages [invalid-pa=
ckageconfig]

There is not an option to disable the manpages, so add a stub
PACKAGECONFIG to silence this error.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/udpcast/udpcast_20230924.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/udpcast/udpcast_20230924.bb =
b/meta-networking/recipes-support/udpcast/udpcast_20230924.bb
index f93f9850a8..3dea7e2ef6 100644
--- a/meta-networking/recipes-support/udpcast/udpcast_20230924.bb
+++ b/meta-networking/recipes-support/udpcast/udpcast_20230924.bb
@@ -18,5 +18,7 @@ SRC_URI[sha256sum] =3D "17b5cd8b1e54f7e2e53357ac02ee86e=
4198bf704096987a03a3b5c402a
 # Installation of rateGovernor.h fails without brokensep
 inherit autotools-brokensep manpages
=20
+PACKAGECONFIG[manpages] =3D ""
+
 # pod2man required to build manpages
 DEPENDS +=3D "perl-native"
--=20
2.43.0


