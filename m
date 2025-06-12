Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF79C71148
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:42:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12135.1749732142689219748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055B1153B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC0963F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 05:42:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] directfb: remove sysfsutils DEPENDS
Date: Thu, 12 Jun 2025 13:42:15 +0100
Message-ID: <20250612124215.2460717-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612124215.2460717-1-ross.burton@arm.com>
References: <20250612124215.2460717-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117888

This was removed upstream in 1.6.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/rec=
ipes-graphics/directfb/directfb.inc
index df65478b40..4d962ab5d9 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -9,7 +9,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a7908=
589"
=20
 HOMEPAGE =3D "http://directfb.org"
-DEPENDS =3D "jpeg libpng sysfsutils"
+DEPENDS =3D "jpeg libpng"
=20
 SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/DirectFB-$=
{PV}.tar.gz \
            file://configurefix.patch \
--=20
2.43.0


