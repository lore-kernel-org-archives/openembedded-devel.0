Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B47C0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:34:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13339.1737729246329954420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC7C497
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82D753F694
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] ncftp: update for autoconf changes in core
Date: Fri, 24 Jan 2025 14:33:58 +0000
Message-ID: <20250124143401.1635224-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 14:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115062

ACLOCALEXTRAPATH is no longer used, so pass the required -I via
EXTRA_AUTORECONF.

Also explicitly disable aclocal as the aclocal is hand-maintained.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-=
networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index de111cac05..be92e35d31 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://www.ncftp.com/public_ftp/ncftp/${B=
P}-src.tar.xz \
            "
 SRC_URI[sha256sum] =3D "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b=
8711344bef24f7e8"
=20
+# Doesn't use automake
 inherit autotools-brokensep pkgconfig
=20
 CFLAGS +=3D "-DNO_SSLv2 -D_FILE_OFFSET_BITS=3D64 -Wall"
@@ -19,8 +20,8 @@ CFLAGS +=3D "-DNO_SSLv2 -D_FILE_OFFSET_BITS=3D64 -Wall"
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[ccdv] =3D "--enable-ccdv,--disable-ccdv,,"
=20
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal -I ${S}/autoconf_local"
 EXTRA_OECONF =3D "--disable-precomp --disable-universal ac_cv_path_TAR=3D=
tar"
-ACLOCALEXTRAPATH:append =3D " -I ${S}/autoconf_local"
=20
 do_install () {
     install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
--=20
2.43.0


