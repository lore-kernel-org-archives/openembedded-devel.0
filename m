Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DC5C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:22:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11334.1740590553020531198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994521516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 578B33F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] pureftp: fix autoreconf
Date: Wed, 26 Feb 2025 17:22:18 +0000
Message-ID: <20250226172220.1033779-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226172220.1033779-1-ross.burton@arm.com>
References: <20250226172220.1033779-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115680

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.b=
b b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 1ce3c468b7..8a56ad5078 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -15,5 +15,7 @@ SRC_URI[sha256sum] =3D "1126f3a95856d08889ff89703cb1aa9=
ec9924d939d154e96904c920f05
=20
 inherit autotools
=20
+EXTRA_AUTORECONF +=3D "-I m4"
+
 PACKAGECONFIG[libsodium] =3D"ac_cv_lib_sodium_crypto_pwhash_scryptsalsa2=
08sha256_str=3Dyes, \
                            ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208=
sha256_str=3Dno, libsodium"
--=20
2.43.0


