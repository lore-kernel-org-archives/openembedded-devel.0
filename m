Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E84AC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 11:37:45 +0000 (UTC)
Received: from TWMBX03.aspeed.com (TWMBX03.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.30023.1698989363510048618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 22:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Nov
 2023 13:29:18 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Nov 2023 13:29:19 +0800
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ast2600:emmc: unsigned rot image align block size (512bytes)
Date: Fri, 3 Nov 2023 13:29:19 +0800
Message-ID: <20231103052919.3649613-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
References: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 11:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105855

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Change-Id: I9b82f11cdf3e8524b99f8dfe6a102fedf2b87e5f
---
 .../recipes-aspeed/images/aspeed-image-gen-secureboot.bb  | 8 ++++++++
 .../recipes-aspeed/images/aspeed-image-emmcboot.bb        | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspeed-=
image-gen-secureboot.bb b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/i=
mages/aspeed-image-gen-secureboot.bb
index 7a6ae1fa0b..f0d046ae58 100644
--- a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspeed-image-g=
en-secureboot.bb
+++ b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspeed-image-g=
en-secureboot.bb
@@ -193,6 +193,12 @@ make_recovery_image() {
     python3 ${STAGING_BINDIR_NATIVE}/gen_uart_booting_image.py ${S}/${GEN_=
IMAGE_MODE}/${SPL_IMAGE_NAME} ${S}/${GEN_IMAGE_MODE}/recovery_${SPL_IMAGE_N=
AME}
 }
=20
+make_emmc_unsigned_rot_image() {
+    if [ -f ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ]; then
+        python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py ${S}/${GEN=
_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ${S}/${GEN_IMAGE_MODE}/emmc_${SPL_I=
MAGE_NAME}.unsigned
+    fi
+}
+
 make_boot_partition_ext4() {
     # Generate a compressed ext4 filesystem with the fitImage file in it t=
o be
     # flashed to the user data area at boot partition of the eMMC
@@ -617,6 +623,8 @@ python do_deploy() {
         bb.build.exec_func("make_recovery_image", d)
=20
         if aspeed_boot_emmc =3D=3D "yes":
+            print("Make emmc unsigned rot image")
+            bb.build.exec_func("make_emmc_unsigned_rot_image", d)
             print("Deploy mmc image...")
             deploy_mmc_image(d)
         else:
diff --git a/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb=
 b/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
index 4faf0d032c..9eb91e8b00 100644
--- a/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
+++ b/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
@@ -61,6 +61,11 @@ do_mk_emmc_boot_image_g6() {
         install -m 0644 ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_=
IMAGE}.${UBOOT_SUFFIX} ${OUTPUT_IMAGE_DIR}
     else
         install -m 0644 ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE=
}.${UBOOT_SUFFIX} ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.=
${UBOOT_SUFFIX}
+        if [ -f ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOO=
T_SUFFIX}.unsigned ]; then
+            install -m 0644 ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_I=
MAGE}.${UBOOT_SUFFIX}.unsigned ${SOURCE_IMAGE_DIR}
+            python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py ${SOUR=
CE_IMAGE_DIR}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${SO=
URCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsign=
ed
+            install -m 0644 ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_=
SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${OUTPUT_IMAGE_DIR}
+        fi
     fi
 }
=20
--=20
2.25.1


