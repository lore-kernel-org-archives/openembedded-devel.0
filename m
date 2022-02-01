Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093CFC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.50670.1643733311074681403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A590511FB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5171F3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/14] concurrencykit: enable 32- and 64-bit Arm targets
Date: Tue,  1 Feb 2022 16:34:56 +0000
Message-Id: <20220201163507.1320861-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95188

As per upstream, 32- and 64-bit Arm targets are supported.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.b=
b b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 8d04507b09..0018064119 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "git://github.com/concurrencykit/ck.git;bra=
nch=3Dmaster;protocol=3Dhttps \
=20
 S =3D "${WORKDIR}/git"
=20
-COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64).*-linux*"
+COMPATIBLE_HOST =3D "(arm|aarch64|i.86|x86_64|powerpc|powerpc64).*-linux=
*"
=20
 inherit autotools-brokensep
=20
--=20
2.25.1


