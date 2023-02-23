Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2698C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:32:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9259.1677155556969958167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DF0DC14;
	Thu, 23 Feb 2023 04:33:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FD73F881;
	Thu, 23 Feb 2023 04:32:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] nodejs: remove redundant comment
Date: Thu, 23 Feb 2023 12:32:33 +0000
Message-Id: <20230223123233.1727895-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101222

This commented-out assignment should have been removed in 3ff0235.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index 1c530ee29b..802c4191bb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -140,8 +140,6 @@ LDFLAGS:append:x86 =3D " -latomic"
 CROSS_FLAGS =3D "--cross-compiling"
 CROSS_FLAGS:class-native =3D "--no-cross-compiling"
=20
-#export LD=3D"${CXX}"
-
 # Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
     GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
--=20
2.34.1


