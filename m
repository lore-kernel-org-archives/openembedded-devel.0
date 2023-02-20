Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7694C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16496.1676907978830751659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61D03FEC;
	Mon, 20 Feb 2023 07:47:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FE9A3F703;
	Mon, 20 Feb 2023 07:46:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/8] nodejs: run configure.py in verbose mode
Date: Mon, 20 Feb 2023 15:46:10 +0000
Message-Id: <20230220154614.42832-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101171

It's useful to know what configure is detecting, so pass --verbose.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index 6431069e9c..e14f1a4d7f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -142,7 +142,7 @@ do_configure () {
     export LD=3D"${CXX}"
     GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-    python3 configure.py --prefix=3D${prefix} --cross-compiling \
+    python3 configure.py --verbose --prefix=3D${prefix} --cross-compilin=
g \
                --shared-openssl \
                --without-dtrace \
                --without-etw \
--=20
2.34.1


