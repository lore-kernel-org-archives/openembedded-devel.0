Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF36C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 09:02:58 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.49794.1699261371027418512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 01:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 6 Nov
 2023 17:02:49 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Nov 2023 17:02:49 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v1 1/1] Brotli: fix build failed if the path includes "-static"
Date: Mon, 6 Nov 2023 17:02:48 +0800
Message-ID: <20231106090248.1168247-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106090248.1168247-1-jamin_lin@aspeedtech.com>
References: <20231106090248.1168247-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 09:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106404

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
index 4e2813dde..708c1c194 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
@@ -16,7 +16,8 @@ inherit cmake lib_package
=20
 do_install:append () {
 	for lib in $(ls ${D}${libdir}/*-static.a); do
-		mv -v "${lib}" "$(echo ${lib} | sed s/-static//)"
+		basename=3D$(basename ${lib})
+		mv -v "${lib}" "${D}${libdir}/$(echo ${basename} | sed s/-static//)"
 	done
 }
=20
--=20
2.34.1


