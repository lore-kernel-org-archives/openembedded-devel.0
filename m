Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C625C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9812.1639393518620071352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A42D113E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9AA33F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/12] qpdf: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:02 +0000
Message-Id: <20211213110511.3274555-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94317

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_10.4.0.bb
index 964becf1dd..793dbb1953 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
@@ -5,9 +5,9 @@ SECTION =3D "libs"
 DEPENDS =3D "libpcre zlib libjpeg-turbo"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "9ac6e691cc3f35a9fe44632e3fba727e1b6ef21181c0a883=
287abf5cf97ae222"
=20
 LIC_FILES_CHKSUM =3D "file://Artistic-2.0;md5=3D7806296b9fae874361e6fb10=
072b7ee3"
-SRC_URI[sha256sum] =3D "9ac6e691cc3f35a9fe44632e3fba727e1b6ef21181c0a883=
287abf5cf97ae222"
=20
 inherit autotools-brokensep gettext
=20
@@ -17,8 +17,6 @@ EXTRA_OECONF =3D "--without-random \
                 --disable-check-autofiles \
                 "
=20
-EXTRA_OEMAKE:class-target =3D "LIBTOOL=3D${HOST_SYS}-libtool"
-
 LDFLAGS:append:mipsarch =3D " -latomic"
 LDFLAGS:append:riscv32 =3D " -latomic"
=20
--=20
2.25.1


