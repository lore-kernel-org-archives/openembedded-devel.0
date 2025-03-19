Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BC4C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:08:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6215.1742386128977492782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5A2512FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BAEF3F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/9] gradm: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:30 +0000
Message-ID: <20250319120836.982987-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116070

This upstream does not in fact use autotools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb b/me=
ta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
index 6238a04d96..89119389fd 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
@@ -22,8 +22,6 @@ UPSTREAM_CHECK_URI =3D "https://grsecurity.net/download=
"
=20
 S =3D "${WORKDIR}/gradm"
=20
-inherit autotools-brokensep
-
 do_compile() {
     oe_runmake 'CC=3D${CC}'                               \
                'LIBS=3D'                                  \
--=20
2.43.0


