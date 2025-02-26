Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277C6C19F32
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9152.1740585036060620470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 756F21516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D1043F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 15/23] neon: fix autoreconf
Date: Wed, 26 Feb 2025 15:50:12 +0000
Message-ID: <20250226155022.1989209-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115667

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/neon/neon_0.33.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/neon/neon_0.33.0.bb b/meta-oe/recipe=
s-support/neon/neon_0.33.0.bb
index a0333f4560..0b8bee0efe 100644
--- a/meta-oe/recipes-support/neon/neon_0.33.0.bb
+++ b/meta-oe/recipes-support/neon/neon_0.33.0.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D "659a5cc9cea05e6e7864094f1e13a77=
abbbdbab452f04d751a8c16a944
=20
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig pte=
st
=20
+EXTRA_AUTORECONF +=3D "-I macros"
+
 # Enable gnutls or openssl, not both
 PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib nls"
 PACKAGECONFIG:class-native =3D "expat gnutls webdav zlib nls"
--=20
2.43.0


