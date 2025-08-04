Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975A0C87FD1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7213.1754342299408306200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB421E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABDB13F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/20] python3-systemd: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:18:00 +0100
Message-ID: <20250804211804.344751-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118869

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-systemd_235.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b=
/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 3abea5f5f2..6b44751df7 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7=
c0106c936039d1e71c8c6b8008e
=20
 DEPENDS +=3D "systemd (<=3D235)"
=20
-inherit pypi features_check pkgconfig python_setuptools_build_meta
+inherit pypi features_check pkgconfig setuptools3
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
--=20
2.43.0


