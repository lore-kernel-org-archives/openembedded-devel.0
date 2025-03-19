Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AADC36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:09:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6333.1742386131582013563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7509E12FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7F8B3F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/9] pmdk: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:34 +0000
Message-ID: <20250319120836.982987-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116074

This upstream does not in fact use autotools, so remove the inherit.

Also remove the redundant cmake-native DEPENDS, as this upstream doesn't
use cmake either.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipe=
s-extended/pmdk/pmdk_2.1.1.bb
index 1bafad96b9..e32dbcf63d 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://pmem.io"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3e2f50552a27ca99772f3d884=
f98560b"
-DEPENDS =3D "ndctl cmake-native"
+DEPENDS =3D "ndctl"
=20
 # Required to have the fts.h header for musl
 DEPENDS:append:libc-musl =3D " fts"
@@ -14,7 +14,7 @@ S =3D "${WORKDIR}/git"
 SRC_URI =3D "git://github.com/pmem/pmdk.git;branch=3Dmaster;protocol=3Dh=
ttps"
 SRCREV =3D "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
=20
-inherit autotools-brokensep pkgconfig
+inherit pkgconfig
=20
 # Fix jemalloc error:
 # | configure: error: cannot run C compiled programs.
@@ -26,7 +26,7 @@ EXTRA_OEMAKE =3D "BUILD_EXAMPLES=3D'n' DOC=3D'n' HOST_S=
YS=3D'${HOST_SYS}' EXTRA_CFLAGS=3D'
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE:append:libc-musl =3D " EXTRA_LIBS=3D'-lfts'"
=20
-do_configure:prepend() {
+do_configure() {
 	touch .skip-doc
 }
=20
--=20
2.43.0


