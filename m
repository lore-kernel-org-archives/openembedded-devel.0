Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C7C36005
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:42:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1081.1742406119688567848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 724AA113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E86B73F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:41:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 08/12] libx86-1: don't inherit autotools
Date: Wed, 19 Mar 2025 17:41:48 +0000
Message-ID: <20250319174152.706861-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319174152.706861-1-ross.burton@arm.com>
References: <20250319174152.706861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116093

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/=
recipes-extended/libx86-1/libx86-1_1.1.bb
index ae2714d7e7..817322a484 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -24,4 +24,6 @@ COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
 export LIBDIR =3D "${libdir}"
 export BACKEND =3D "x86emu"
=20
-inherit autotools-brokensep
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+}
--=20
2.43.0


