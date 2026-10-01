Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB62CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:20:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12459.1790864438892528917
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dr4ae9c6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D1D497
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 07:20:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFFDF3F85F
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790864438; bh=cWIfXM1KEWUdeJuxnd+TEneuCMwsRvNTAL+MfgrUeN8=;
	h=From:To:Subject:Date:From;
	b=dr4ae9c6idmlYm/KfAAil255848VW14eUj1gtLfNhMcppHaLWb+lfYJm88pC2P6VE
	 Z48jeTYgTBdoc8dbS0eqdg1imV0zp26op42yJU88gDnMolAXWfPW3epMjRJ4A7iyO4
	 CLgpJ3gV8ZLgsQTwmgZHzBEsTN3SVTpcSE+vvEX0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] unicode-ucd: upgrade 16.0.0 -> 18.0.0
Date: Thu,  1 Oct 2026 15:20:33 +0100
Message-ID: <20261001142033.3108684-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 14:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130592

Upstream moved where they are putting tarballs[1]:

  Starting with Unicode 17.0.0, the zipped versions of the data files
  are only published in https://www.unicode.org/Public/<version>/ucd/

Update the SRC_URI and UPSTREAM_CHECK_URI patterns, upgrade to 18.0.0,
and unpack the .zip into ${BP} so we don't need to set ${S}.

[1] https://www.unicode.org/Public/zipped/ReadMe.txt

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{unicode-ucd_16.0.0.bb =3D> unicode-ucd_18.0.0.bb} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/unicode-ucd/{unicode-ucd_16.0.0.bb =3D> u=
nicode-ucd_18.0.0.bb} (62%)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb b/=
meta-oe/recipes-support/unicode-ucd/unicode-ucd_18.0.0.bb
similarity index 62%
rename from meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb
rename to meta-oe/recipes-support/unicode-ucd/unicode-ucd_18.0.0.bb
index debe26f4ce..81123978fc 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_18.0.0.bb
@@ -4,26 +4,24 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/ucd-license-v4.txt;md5=3D3049f=
4ad14be1ebf8c80a93d9d32b2d6"
=20
 SRC_URI =3D " \
-    https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdi=
r=3Ducd;downloadfilename=3Dunicode-ucd-${PV}.zip \
+    https://www.unicode.org/Public/${PV}/ucd/UCD.zip;name=3Ducd;subdir=3D=
${BP};downloadfilename=3Dunicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;downloadfilename=3Ducd-license-v=
4.txt;name=3Ducd-license \
 "
-SRC_URI[ucd.sha256sum] =3D "c86dd81f2b14a43b0cc064aa5f89aa7241386801e35c=
59c7984e579832634eb2"
+SRC_URI[ucd.sha256sum] =3D "7b3e555514060b92290d154f53655c5eb0fa62b16eb0=
4c03434ff72d1a66a0d8"
 SRC_URI[ucd-license.sha256sum] =3D "e7a93b009565cfce55919a381437ac4db883=
e9da2126fa28b91d12732bc53d96"
=20
 # The tarball name (UCD.zip) carries no version, so check the per-releas=
e
-# directories in the Public/zipped/ index instead.
-UPSTREAM_CHECK_URI =3D "https://www.unicode.org/Public/zipped/"
+# directories in the Public/ index instead.
+UPSTREAM_CHECK_URI =3D "https://www.unicode.org/Public/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
=20
 inherit allarch
=20
-S =3D "${UNPACKDIR}"
-
 do_configure[noexec] =3D "1"
=20
 do_install() {
     install -d ${D}${datadir}/unicode
-    cp -rf ${UNPACKDIR}/ucd ${D}${datadir}/unicode
+    cp -rf ${S} ${D}${datadir}/unicode/ucd
 }
=20
 FILES:${PN} =3D "${datadir}/unicode/ucd"
--=20
2.43.0


