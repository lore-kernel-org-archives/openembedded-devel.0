Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FE6C18E7C
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9136.1740585026963485442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59A38FEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FE263F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 01/23] cpuid: fix stripping
Date: Wed, 26 Feb 2025 15:49:58 +0000
Message-ID: <20250226155022.1989209-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115653

cpuid's Makefile passes -s to install to strip the binaries, but as this
uses the _host_ strip it can fail if that strip doesn't know about the
target (for example, building cpuid for x86 on aarch64):

  install -D -s -m 755 cpuid .../image/usr/bin/cpuid
  strip: Unable to recognise the format of the input file `.../image/usr/=
bin/cpuid'

Set INSTALL_STRIP=3D'' so that the binaries are not stripped, and remove
the INSANE_SKIP for already-stripped.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe/r=
ecipes-devtools/cpuid/cpuid_20230614.bb
index ed339e0160..8fdbe21737 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
@@ -17,9 +17,7 @@ COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
 inherit perlnative
=20
 do_install () {
-    oe_runmake DESTDIR=3D${D} bindir=3D${bindir} mandir=3D${mandir} inst=
all
+    oe_runmake DESTDIR=3D${D} bindir=3D${bindir} mandir=3D${mandir} INST=
ALL_STRIP=3D"" install
 }
=20
 RDEPENDS:${PN} =3D "perl"
-
-INSANE_SKIP:${PN} +=3D "already-stripped"
--=20
2.43.0


