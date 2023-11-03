Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFD1C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 11:37:45 +0000 (UTC)
Received: from TWMBX03.aspeed.com (TWMBX03.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.30023.1698989363510048618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 22:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Nov
 2023 13:29:18 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Nov 2023 13:29:18 +0800
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v1 1/1] Brotli: fix build failed if the path includes "-static"
Date: Fri, 3 Nov 2023 13:29:18 +0800
Message-ID: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 11:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105854

It would like to remove "-static" in the name of statice library
at the do_install task. For example: replace libbrotlicommon-static.a
with ibbrotlicommon-static.a However, if the patch of
this statice library includes "-static", it would build failed.
(ex: set my build directory "build-static")
Change to remove "-static" in the base name of static library
to fix this build failed.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.0.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb b/meta-oe/reci=
pes-extended/brotli/brotli_1.0.9.bb
index 4e2813dde..6492b1943 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
@@ -16,7 +16,8 @@ inherit cmake lib_package
=20
 do_install:append () {
 	for lib in $(ls ${D}${libdir}/*-static.a); do
-		mv -v "${lib}" "$(echo ${lib} | sed s/-static//)"
+		basename=3D$(basename ${lib})
+		mv -v "${lib}" "${D}${libdir}$(echo ${basename} | sed s/-static//)"
 	done
 }
=20
--=20
2.34.1


