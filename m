Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13346C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 17:31:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10843.1641922262926813856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6556D6E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:31:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6054E3F766
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:31:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] tbb: upgrade to 2021.5.0
Date: Tue, 11 Jan 2022 17:30:59 +0000
Message-Id: <20220111173059.3086473-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 17:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94752

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/tbb/{tbb_2021.4.0.bb =3D> tbb_2021.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2021.4.0.bb =3D> tbb_2021.5.0.bb=
} (97%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb b/meta-oe/recipe=
s-support/tbb/tbb_2021.5.0.bb
similarity index 97%
rename from meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.5.0.bb
index 02b5d05003..0d108f21ad 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.4.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.5.0.bb
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl =3D " libucontext"
 PE =3D "1"
=20
 BRANCH =3D "onetbb_2021"
-SRCREV =3D "4e021eafc03519cb1081ed775c9502cae72f8d8d"
+SRCREV =3D "3df08fe234f23e732a122809b40eb129ae22733f"
 SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
             file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch =
\
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
--=20
2.25.1


