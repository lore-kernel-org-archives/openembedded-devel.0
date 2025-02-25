Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1F4C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15894.1740506963302394859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41E6828C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AD053F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] php: remove obsolete acpaths
Date: Tue, 25 Feb 2025 18:09:08 +0000
Message-ID: <20250225180917.3232793-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225180917.3232793-1-ross.burton@arm.com>
References: <20250225180917.3232793-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115589

As of "autotools: don't try and find in-tree macros" in core, acpaths is
no longer used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/php/php_8.2.26.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes=
-devtools/php/php_8.2.26.bb
index 053242413f..b8e96833f6 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -136,8 +136,6 @@ LDFLAGS:append:riscv64 =3D " -latomic"
=20
 EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
=20
-acpaths =3D ""
-
 do_configure:prepend () {
     rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
     find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=3D.*!APXS=
_HTTPD=3D${STAGING_SBINDIR_NATIVE}/httpd!'
--=20
2.43.0


