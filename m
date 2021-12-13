Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A7EC43217
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9664.1639393520254811192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE54A6D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 998F53F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/12] apache2: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:05 +0000
Message-Id: <20211213110511.3274555-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94320

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index 4b36c50d55..29deedf3a6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -156,7 +156,6 @@ apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${sbindir}
     install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
     sed -i 's!my $installbuilddir =3D .*!my $installbuilddir =3D "${STAG=
ING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_cros=
sscripts}/apxs
-    sed -i 's!my $libtool =3D .*!my $libtool =3D "${STAGING_BINDIR_CROSS=
}/${HOST_SYS}-libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
=20
     sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
     sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
--=20
2.25.1


