Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE087C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:22:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11466.1740590552311056949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478071516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 041733F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] ifenslave: remove manpages class
Date: Wed, 26 Feb 2025 17:22:16 +0000
Message-ID: <20250226172220.1033779-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 17:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115678

This recipe doesn't ship any manpages since 2.10, so remove the manpage
support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb =
b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
index 02a5520a97..b41eb78374 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
@@ -5,9 +5,6 @@ SECTION =3D "net"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dacc89812938cf9ad6b1d=
ebc37cea0253"
=20
-inherit manpages
-MAN_PKG =3D "${PN}"
-
 SRCREV =3D "62e60904afbe58fda0c7104fdad1c4f618266ba6"
 SRC_URI =3D "git://salsa.debian.org/debian/ifenslave.git;protocol=3Dhttp=
s;branch=3Dmain"
=20
@@ -18,5 +15,3 @@ do_install() {
     install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfd=
ir}/network/if-post-down.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-up ${D}${sysconfdir}/net=
work/if-up.d/ifenslave
 }
-
-FILES:${PN}-doc:remove =3D "${mandir}"
--=20
2.43.0


