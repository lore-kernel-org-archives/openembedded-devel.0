Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C65C36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6216.1742386129805855885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84BB512FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEC183F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/9] mce-inject: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:31 +0000
Message-ID: <20250319120836.982987-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116071

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/r=
ecipes-support/mcelog/mce-inject_git.bb
index 8fc8e2b5e5..6c1255772d 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-linux'
=20
-inherit autotools-brokensep
+EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS}'"
=20
-EXTRA_OEMAKE =3D "destdir=3D${D} CFLAGS=3D'${CFLAGS}'"
+do_install() {
+    oe_runmake 'destdir=3D${D}' install
+}
--=20
2.43.0


