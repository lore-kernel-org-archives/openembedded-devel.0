Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053F1CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 09:42:12 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7529.1780566130538892945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 02:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=L/VAH4ZS;
 spf=pass (domain: ti.com, ip: 52.101.53.29, mailfrom: kamlesh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEFmSX17w2YkDw34AqtpjB1wq4r2vgU0JyuJ8eFdOZ0oZFlTEFrvsKwDBg+IdFolB0isJ6UR7lHad7NGPEuQiLgiBhD2Quu2400EeqVuTSolZoTsr+1EGFo1X0XZoFi1TKDD88VoQznC4k06G54JskOgzDQP7HRCHLexmb7qOQ1yUyFEIy0dQtCvyQ3/5u9ZkgJ+E9Xlp+adLt46khNXJI8TF2zJ+lAZCaVHIpIH0jCouoruu0RsA8RNEluDZuDeE2Gvzll5xkvR+f7fd3SdziutoZwBrOn8Lz0BZHiQ/C6Jn1VUurwXe/dOeKqGLLxJoY0SS7jJDj38uGzC3ckv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYmVRoTyb7y7wBXHXZxFoxCPodJayCjGOXEWF/yMeIg=;
 b=AKG8Nn1Ylk1GeZXm+MpYaJQseFE4QA/usBwMzrBzNENAHLK1SLehVWEEU9fgvI+b5ivL2+9zl56Nks8fUrXzoUsBSIspYsZdmDz+BCTZd+ncmYNVFrG93CHOUR1H4LDBQvxKHFsWcPbksRg72OqeAm6jpkElXMuAgAVT+IhHzCtDfUr+/nK+WFV7M2n75ZYzZU6LsqLS0ERyHz6yA57gk2CTjIoJjKwADrV4x3JTEgDvTwgXGBCnp8DI991QBLUeXpJXAt51rCqFhNjQFuJ2ZZ5yVPV5FLCkXIJtrj/v4QqE/YbsLZYiUmzMOeLqwqt4ZaVr0K1qEOKkJebtUnL6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYmVRoTyb7y7wBXHXZxFoxCPodJayCjGOXEWF/yMeIg=;
 b=L/VAH4ZSGZMadiemHYDoxVkeumh+3WabM4exdhJPjq7OHHhrqHAhb/IoIjiKhlOz/ltOtrg2pxFQsoGtzwD8cITnB29KWSqEYpn7CUY6OBvlZoV3KzYH0KD/v6kN0UY/JRznqfkBl04UhQh0KT+wOMBM1Nb4dkdV8vaDx/2aEYg=
Received: from SN7PR04CA0075.namprd04.prod.outlook.com (2603:10b6:806:121::20)
 by CH9PR10MB997858.namprd10.prod.outlook.com (2603:10b6:610:342::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 09:42:07 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::83) by SN7PR04CA0075.outlook.office365.com
 (2603:10b6:806:121::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 09:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 09:42:06 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 04:42:02 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 04:42:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 04:42:02 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.233.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6549g1xY3123032;
	Thu, 4 Jun 2026 04:42:02 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Thu, 4 Jun 2026 15:11:55 +0530
Subject: [PATCH meta-oe master/wrynose] libwebsockets: fix build against
 OpenSSL 3.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260604-libweb2-v1-1-004afc9f92bd@ti.com>
X-B4-Tracking: v=1; b=H4sIAGJIIWoC/x2MwQrCMBAFf6Xs2dAYYoj+inhI9bVdaBPZLVYp/
 XejxxmG2UghDKVLs5HgxcolVzgeGrqPKQ8w/KhMzrpgg/Vm4m5F50xI53hC9NH6nmr9FPT8/p+
 uNGNJpuDn56QLpF3lk4uCbvv+BXj8TgB0AAAA
To: <openembedded-devel@lists.openembedded.org>
CC: Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566121; l=1770;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=jwytmp+2bBVZFpcD+3SFtUVgV8MnqFsM8Ag78uHsAxk=;
 b=IkuWoTxSaknkuzDMg3ukF/lr4X9lx6ZIqYJKh+M24F7rbeY/h6Y51yokwi6pKiaaiAJrudxLH
 nZRJpPAPFF/DHUd+UDusdndOHF4QqYizYxK/+AkRzJwIUHEOQm9+IPD
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CH9PR10MB997858:EE_
X-MS-Office365-Filtering-Correlation-Id: 864fb95c-f0a1-417b-c610-08dec21d8a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lVh6yLrFCtSlYgrzDq13nFQn5pshlHQNX1+HG5Rc+CGcNIoiFYgtmZ9Zu0DuWMyqQuuQpjA04Q2CIog4gckTDPn2iJJk+lvXITCA+Aoya0lZdx+EY4c6aA9I5lg2vGX5cqROhWz766YyghnJOtrbp1dwLxEzeasGuOaX2D/94CHEYDVrGdD8z0KbnfkWFc+3OcWC6vRKbBykOSYkU2fn36BKIJgQhJR8mUyYu668qlc3QRSkTjbaWk+n4KdUZtHPpefFg5X1hnuNB7is4C5glJr0MXUP1WntmPj/QKGMwOoXHY118xixa1NuIH2mbIAGm+vFU9Qow94+TeJfBbj6kd+P1O0ul+SY19sTarduGHzaAiMnSsK12bXvfrKXbJJiZh4VqYtb7MxIQnZCHb4u87LhmwSxN2Ai4K1EnsrX2UXG0vZw+lStMd59F5SQr7VFTefup6TKByr7IhGiFVp0b27wskTUBdJPbQsSFGvvoCW8gzF6vhEcPkGrsRWBGc9hJx/AunxJ5MVqsEyqKib+PJ45P6WlGfTTlS7R4ozScLWJgY/Clfna65O1//DI2j8/UvnWYCKwxketDSRbsRgw5GJVMDxiUJV3zTg5zhJ+oyOirv+GTau4ptb5E8LqYR9ILmePVOquaj7/aGvi/iS2DQKT3QTgpEmSwdbrud8FdhlP9eZXdVWPNF7zMFXosY33rGHGtMH7lvv/LrtCBOTTHFI69tfo1LdbEzNwlqerSLI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gPZBSXOCHD5y4It1MTPIakJNCQyNsrmmS2c6VM4K3p5S/y60ik5FZbND/cuNGPi5vWzmv187bBW8gvKNI2w9f537yR5DAPOkwDWka2stGgx+Dqvez4/61+Xcc5sZmltzWKzOx4Unr8pwr9bYMCmcrP9N/Gz8/fQTWY75IXn8+ZInrPVGBZdsobRFEMpyB5nSUomYgAbBh5RcNHVUj3vJRSFNZMs8n9HV7R9JLOwHTYmghATSFp/Rr40kgmrt7a21Ca/F6zcooOvKAvsOYQ7DqOfEU5e6CKcpayhb7Pe4HX+ysx2u3xTa7qZY++qUfA+u78/HWCX7TYS9uKsIbtGdEX9cDfXowvmcjZV9sApyTl8vugWr2cKtynjbqMsaSFSBu6GakiWagxhI4/C/d/OTDV3l93PM+qnG0jEvc6RyGe34J/CPM3chq3nRveLdTUWI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:42:06.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864fb95c-f0a1-417b-c610-08dec21d8a2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR10MB997858
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 09:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127395

OpenSSL 3.5 (first shipped in wrynose) made HMAC_CTX a fully opaque
type by removing its struct definition from the public headers. It was
deprecated since OpenSSL 3.0 but the struct remained visible until 3.5.

libwebsockets uses HMAC_CTX_new() to detect which form to use in its
lws-genhash.h public header: if found it uses HMAC_CTX *ctx (pointer),
otherwise it falls back to HMAC_CTX ctx (embedded struct).

In cross-compilation the CMake CHECK_FUNCTION_EXISTS probe for
HMAC_CTX_new can fail due to native libraries being incorrectly pulled
into the aarch64 link test, causing the function to be reported as not
found. Before OpenSSL 3.5 this was a silent failure: the fallback
embedded struct still compiled fine. With OpenSSL 3.5 the fallback
now fails with "field has incomplete type".

Force LWS_HAVE_HMAC_CTX_new=ON so the pointer form is always used.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index a18f88390e..fc65890d8d 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -35,6 +35,7 @@ python __anonymous() {
 EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
     -DLWS_WITHOUT_TESTAPPS=ON \
+    -DLWS_HAVE_HMAC_CTX_new=ON \
 "
 
 do_compile:prepend() {

---
base-commit: 39321ae90b64e8f2bd890a2957a5f80e74d4de30
change-id: 20260604-libweb2-6a985e84804f

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


