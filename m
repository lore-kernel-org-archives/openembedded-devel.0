Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCDDC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9898.1639393528413599176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4546D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 486DD3F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/12] cpufrequtils: remove obsolete support for renamed
 libtool
Date: Mon, 13 Dec 2021 11:05:08 +0000
Message-Id: <20211213110511.3274555-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94325

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-=
oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index f1fb3052e0..ff41459968 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
-EXTRA_OEMAKE =3D "V=3D1 CROSS=3D${TARGET_PREFIX} LIBTOOL=3D'${HOST_SYS}-=
libtool --tag cc' STRIPCMD=3Decho 'CP=3Dcp'"
+EXTRA_OEMAKE =3D "V=3D1 CROSS=3D${TARGET_PREFIX} STRIPCMD=3Decho 'CP=3Dc=
p'"
=20
 do_compile() {
     oe_runmake
--=20
2.25.1


