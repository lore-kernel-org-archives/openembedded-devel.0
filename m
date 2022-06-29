Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E9C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 11:25:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10273.1656501943107985434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43CE152B;
	Wed, 29 Jun 2022 04:25:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31EBF3F66F;
	Wed, 29 Jun 2022 04:25:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cppzmq: fix -dev RDEPENDS
Date: Wed, 29 Jun 2022 12:25:40 +0100
Message-Id: <20220629112540.3798502-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 11:25:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97618

Since oe-core 6f28420 PN-dev RRECOMMENDS PN instead of RDEPENDS, so this
recipe RDEPENDS on a non-existent package.

Unset DEV_PKG_DEPENDENCY to remove the automatic dependency on PN from
PN-dev.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/=
recipes-connectivity/zeromq/cppzmq_git.bb
index dfb0b14e3e..7189115092 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -18,3 +18,4 @@ EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
 PACKAGES =3D "${PN}-dev"
=20
 RDEPENDS:${PN}-dev =3D "zeromq-dev"
+DEV_PKG_DEPENDENCY =3D ""
--=20
2.25.1


