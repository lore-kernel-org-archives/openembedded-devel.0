Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD16D6A250
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6517.1731621624709698548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 542411474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 099063F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/21] python3-systemd: switch to python_setuptools_build_meta
Date: Thu, 14 Nov 2024 22:00:07 +0000
Message-Id: <20241114220009.737413-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113842

Switch to the modern build system, and sort the recipe assignments to
be more idiomatic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-systemd_235.bb   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b=
/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 7a7d5a5053..0e923bc35c 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -4,9 +4,13 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
 PYPI_PACKAGE =3D "systemd-python"
-DEPENDS +=3D "systemd (<=3D235)"
-RDEPENDS:${PN} +=3D "systemd python3-syslog python3-logging python3-sysl=
og"
-REQUIRED_DISTRO_FEATURES =3D "systemd"
-inherit pypi features_check pkgconfig setuptools3
 SRC_URI:append:libc-musl =3D " file://0001-Provide-implementation-of-str=
ndupa-for-musl.patch"
 SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71=
c8c6b8008e695c0a"
+
+DEPENDS +=3D "systemd (<=3D235)"
+
+inherit pypi features_check pkgconfig python_setuptools_build_meta
+
+REQUIRED_DISTRO_FEATURES =3D "systemd"
+
+RDEPENDS:${PN} +=3D "systemd python3-syslog python3-logging python3-sysl=
og"
--=20
2.34.1


