Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E850C1B0FF
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8948.1740585039797447279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67CD81516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FB7E3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 21/23] log4cpp: fix autoreconf
Date: Wed, 26 Feb 2025 15:50:18 +0000
Message-ID: <20250226155022.1989209-21-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115673

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/r=
ecipes-support/log4cpp/log4cpp_1.1.4.bb
index a8b9b9a019..929b1d186b 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
@@ -12,6 +12,8 @@ S =3D "${WORKDIR}/${BPN}"
=20
 inherit autotools pkgconfig
=20
+EXTRA_AUTORECONF +=3D "-I m4"
+
 EXTRA_OECONF =3D "\
     --enable-doxygen=3Dno \
     --enable-dot=3Dno \
--=20
2.43.0


