Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA34D6A249
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6509.1731621614742464694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66AB51474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:44 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136203F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/21] python3-dbus-fast: inherit cython class
Date: Thu, 14 Nov 2024 21:59:52 +0000
Message-Id: <20241114220009.737413-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113827

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Also remove obsolete setuptools/wheel build dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-dbus-fast_2.24.3.bb   | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3=
.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
index bf267ed869..3e0bed7e38 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
@@ -7,13 +7,7 @@ SRC_URI[sha256sum] =3D "9042a1b565ecac4f8e04df79376de1d1=
d31e4c82eddb6e71e8b8d82d0c
=20
 PYPI_PACKAGE =3D "dbus_fast"
=20
-inherit pypi python_poetry_core
-
-DEPENDS +=3D " \
-	python3-setuptools-native \
-	python3-wheel-native \
-	python3-cython-native \
-	"
+inherit pypi python_poetry_core cython
=20
 RDEPENDS:${PN} +=3D " \
     python3-core (>=3D3.7) \
--=20
2.34.1


