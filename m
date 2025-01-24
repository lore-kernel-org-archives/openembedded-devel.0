Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D68C0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:34:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13241.1737729247597344280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E074497
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF4723F694
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] syslog-ng: remove obsolete double-run of configure
Date: Fri, 24 Jan 2025 14:34:00 +0000
Message-ID: <20250124143401.1635224-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124143401.1635224-1-ross.burton@arm.com>
References: <20250124143401.1635224-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 14:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115064

There do not appear to be libtool problems with syslog-ng, so the
requirement to double-run autoreconf from 2017 must have been resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb b/meta-=
oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
index 588a38126b..e489287c5a 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
@@ -64,15 +64,6 @@ PACKAGECONFIG[tcp-wrapper] =3D "--enable-tcp-wrapper,-=
-disable-tcp-wrapper,tcp-wra
 PACKAGECONFIG[geoip] =3D "--enable-geoip,--disable-geoip,geoip,"
 PACKAGECONFIG[native] =3D "--enable-native,--disable-native,,"
=20
-do_configure:prepend() {
-	olddir=3D$(pwd)
-	cd ${AUTOTOOLS_SCRIPT_PATH}
-
-	ACLOCAL=3D"$ACLOCAL" autoreconf -Wcross --verbose --install --force ${E=
XTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf =
execution failed."
-
-	cd $olddir
-}
-
 do_install:append() {
     install -d ${D}${sysconfdir}/${BPN}
     install -d ${D}${sysconfdir}/init.d
--=20
2.43.0


