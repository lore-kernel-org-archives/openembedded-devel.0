Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9FEC36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:42:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1068.1742406121051745243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B53BD113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F9C63F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 10/12] openl2tp: don't inherit autotools
Date: Wed, 19 Mar 2025 17:41:50 +0000
Message-ID: <20250319174152.706861-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319174152.706861-1-ross.burton@arm.com>
References: <20250319174152.706861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116095

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b=
/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index f3b74d1e61..d66b7d2390 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -41,7 +41,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.t=
ar.gz \
 SRC_URI[md5sum] =3D "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] =3D "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0d=
ffd11b5444f4860f"
=20
-inherit autotools-brokensep pkgconfig systemd ptest
+inherit pkgconfig systemd ptest
=20
 SYSTEMD_SERVICE:${PN} =3D "openl2tpd.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
@@ -67,7 +67,9 @@ do_compile:prepend() {
         ${S}/Makefile
 }
=20
-do_install:append () {
+do_install () {
+    oe_runmake 'DESTDIR=3D${D}' install
+
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${S}/etc/rc.d/init.d/openl2tpd ${D}${sysconfdir}/ini=
t.d/openl2tpd
--=20
2.43.0


