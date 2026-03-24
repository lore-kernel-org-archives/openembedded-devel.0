Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F122DE9A769
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:53:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17086.1774349604583529439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED2F4153B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:53:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EFC83FAF5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:53:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] protobuf: disable ptests for now
Date: Tue, 24 Mar 2026 10:53:17 +0000
Message-ID: <20260324105318.2150394-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125552

oe-core just moved from pkgconfig to pkgconf, which has broken the
ptest buikd due to how fragile the compilation was.

This will be revisited to build the tests properly, but for now simply
disable the ptests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
index 104c0f2c63..4af48b0b99 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
@@ -53,6 +53,9 @@ LANG_SUPPORT =3D "cpp ${@bb.utils.contains('PACKAGECONF=
IG', 'python', 'python', ''
 CXXFLAGS:append:mipsarcho32 =3D " -latomic"
 CXXFLAGS:append:riscv32 =3D " -latomic"
=20
+# The ptests are not buildable now that pkgconf is being used, disable u=
ntil fixed.
+PTEST_ENABLED =3D "0"
+
 do_compile_ptest() {
 	mkdir -p "${B}/${TEST_SRC_DIR}"
=20
--=20
2.43.0


