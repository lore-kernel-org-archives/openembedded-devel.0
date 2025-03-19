Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF535C35FFB
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6331.1742386128009405700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84F0112FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EDC4C3F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/9] rdisk: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:28 +0000
Message-ID: <20250319120836.982987-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116068

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/=
meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index e6d99431be..abe23cb46e 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -36,9 +36,11 @@ UPSTREAM_CHECK_REGEX =3D "/rdist/(?P<pver>\d+(\.\d+)+)=
"
=20
 DEPENDS =3D "bison-native"
=20
-inherit autotools-brokensep
-
 EXTRA_OEMAKE =3D "CPPFLAGS=3D'${CFLAGS}' BIN_GROUP=3Droot MAN_GROUP=3Dro=
ot RDIST_MODE=3D755 RDISTD_MODE=3D755 MAN_MODE=3D644"
=20
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+}
+
 # http://errors.yoctoproject.org/Errors/Details/186972/
 COMPATIBLE_HOST:libc-musl =3D 'null'
--=20
2.43.0


