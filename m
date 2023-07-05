Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8393EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1031.1688577966728233683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B80201764;
	Wed,  5 Jul 2023 10:26:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BA823F762;
	Wed,  5 Jul 2023 10:26:05 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] libpaper: remove redundant autoreconf --install
Date: Wed,  5 Jul 2023 18:26:01 +0100
Message-Id: <20230705172601.3887976-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705172601.3887976-1-ross.burton@arm.com>
References: <20230705172601.3887976-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103673

From: Ross Burton <ross.burton@arm.com>

autotools.bbclass already uses --install, so there's no need to pass it
again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb b/meta-oe=
/recipes-support/libpaper/libpaper_2.1.0.bb
index 26f8fab200..911582553c 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
@@ -6,6 +6,4 @@ SRC_URI[sha256sum] =3D "474e9575e1235a0d8e3661f072de0193b=
ab6ea1023363772f698a2cc39
=20
 inherit perlnative autotools
=20
-EXTRA_AUTORECONF +=3D "--install"
-
 BBCLASSEXTEND =3D "native"
--=20
2.34.1


