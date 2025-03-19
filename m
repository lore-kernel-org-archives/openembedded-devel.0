Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14714C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:09:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6334.1742386132453137533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2501612FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:09:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EF3E3F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/9] triggerhappy: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:35 +0000
Message-ID: <20250319120836.982987-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116075

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/=
meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 0b14f9557a..5eb8e4d9aa 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/wertarbyte/${BPN}.git;bra=
nch=3Ddebian;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd
+inherit pkgconfig perlnative update-rc.d systemd
=20
 PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','sys=
temd','',d)}"
 PACKAGECONFIG[systemd] =3D ",,systemd"
@@ -30,7 +30,9 @@ FILES:${PN} =3D "\
 "
 CONFFILES:${PN} =3D "${sysconfdir}/udev/rules.d/80-triggerhappy.rules"
=20
-do_install:append() {
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' 'BINDIR=3D${D}${sbindir}' install
+
     install -d ${D}${sysconfdir}/triggerhappy/triggers.d
=20
     install -d ${D}${nonarch_base_libdir}/udev/rules.d
--=20
2.43.0


