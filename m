Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695DFC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 15:53:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24582.1703087617916137712
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 07:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 634AA2F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:54:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E1AA3F64C
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:53:37 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] php: remove lemon-native build dependency
Date: Wed, 20 Dec 2023 15:53:34 +0000
Message-Id: <20231220155334.1055853-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231220155334.1055853-1-ross.burton@arm.com>
References: <20231220155334.1055853-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107665

From: Ross Burton <ross.burton@arm.com>

This was required by the sqlite2 extension, which was removed from PHP
in 2010[1].

[1] https://github.com/php/php-src/commit/6c76f3606cddeb010cf1fc5ea28b474=
56ea9639e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/php/php_8.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.9.bb b/meta-oe/recipes-=
devtools/php/php_8.2.9.bb
index 27d3be1b00..cb9d0060a3 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.9.bb
@@ -6,7 +6,7 @@ LICENSE =3D "PHP-3.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ebd5be8e2a89f634486445bd164b=
ef0"
=20
 BBCLASSEXTEND =3D "native"
-DEPENDS =3D "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native=
"
+DEPENDS =3D "zlib bzip2 libxml2 virtual/libiconv php-native"
 DEPENDS:append:libc-musl =3D " libucontext"
 DEPENDS:class-native =3D "zlib-native libxml2-native"
=20
--=20
2.34.1


