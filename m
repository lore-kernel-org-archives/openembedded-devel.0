Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AFFC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15835.1740506962926908995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 942721BCB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBE2D3F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] lftp: remove obsolete acpaths
Date: Tue, 25 Feb 2025 18:09:07 +0000
Message-ID: <20250225180917.3232793-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115588

As of "autotools: don't try and find in-tree macros" in core, acpaths is
no longer used.

Also remove an obsolete FILES:PN-dbg as the debug package is packaged
automatically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb b/me=
ta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
index bf3e18dce7..927916f985 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] =3D "8a07cbf4df09b107fe3fc41d133ee2f=
6cea6ef4c33ccf06c8448ad058c
=20
 inherit autotools gettext pkgconfig
=20
-acpaths =3D "-I ./m4"
-
 EXTRA_OECONF +=3D "--with-modules --disable-rpath"
=20
 PACKAGECONFIG ??=3D "openssl zlib gnutls readline expat"
@@ -27,5 +25,4 @@ do_install:append() {
 	rm -rf ${D}${libdir}/charset.alias
 }
 FILES:${PN} +=3D "${datadir}/icons/hicolor"
-FILES:${PN}-dbg +=3D "${libdir}/lftp/${PV}/.debug"
 RDEPENDS:${PN} =3D "perl bash readline"
--=20
2.43.0


