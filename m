Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357D8C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 10:56:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5169.1641552965746413228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 02:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C7E1435
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 02:55:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B8B03F66F
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 02:55:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] fwts: do out-of-tree builds
Date: Fri,  7 Jan 2022 10:55:55 +0000
Message-Id: <20220107105555.2981551-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107105555.2981551-1-ross.burton@arm.com>
References: <20220107105555.2981551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 10:56:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94684

The bug preventing out-of-tree builds was fixed in 21.05.00.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-test/fwts/fwts_21.06.00.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_21.06.00.bb b/meta-oe/recipes=
-test/fwts/fwts_21.06.00.bb
index d33000b8b5..0480adb96c 100644
--- a/meta-oe/recipes-test/fwts/fwts_21.06.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_21.06.00.bb
@@ -20,8 +20,7 @@ COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|powerpc64).*-=
linux"
 DEPENDS =3D "libpcre glib-2.0 dtc bison-native libbsd"
 DEPENDS:append:libc-musl =3D " libexecinfo"
=20
-# Use brokensep for now (https://github.com/ColinIanKing/fwts/issues/2)
-inherit autotools-brokensep bash-completion pkgconfig
+inherit autotools bash-completion pkgconfig
=20
 LDFLAGS:append:libc-musl =3D " -lexecinfo"
=20
--=20
2.25.1


