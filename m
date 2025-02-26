Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA73C19F38
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8945.1740585037158298993
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFEED1516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:52 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 779AE3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 17/23] neon: remove obsolete class-native override
Date: Wed, 26 Feb 2025 15:50:14 +0000
Message-ID: <20250226155022.1989209-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115669

This prefix override for native builds is no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/neon/neon_0.33.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/neon/neon_0.33.0.bb b/meta-oe/recipe=
s-support/neon/neon_0.33.0.bb
index 4c6ed00827..66398c6de0 100644
--- a/meta-oe/recipes-support/neon/neon_0.33.0.bb
+++ b/meta-oe/recipes-support/neon/neon_0.33.0.bb
@@ -32,9 +32,6 @@ PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zli=
b"
=20
 EXTRA_OECONF +=3D "--enable-shared --enable-threadsafe-ssl=3Dposix"
=20
-# Do not install into /usr/local
-EXTRA_OEMAKE:append:class-native =3D " prefix=3D${prefix_native}"
-
 do_configure:prepend() {
     echo "${PV}" > ${S}/.version
 }
--=20
2.43.0


