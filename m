Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF94CCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 12:52:23 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.77])
 by mx.groups.io with SMTP id smtpd.web10.37208.1712235139638213102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 05:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=F4YpknKw;
 spf=pass (domain: ni.com, ip: 40.107.223.77, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tm7A1tMeXbhjV6RfCxypCYF72FwbUGIoig4q5HLsmmcddP/3KaSZ3wsrveR9we9J0kp9ETN91CGhumCsMkK9KfwWAlMfJXZMLptJYodBAN8IoWhgp5cZU0UYHwOI/IQsb4vejYvAN2NZdtb4E7dLesc7XS3wv1MjLLCVdiu2pfVEyV1Lbef9YaSWwW/AYhmKo8bq2/nt7vrAriyzFWP0iYDWgG0aBMX0VyKYgzUCZha5m4f9yxgvpKMtLSn5VaWXQpWHUgIUVIp2su0Ct5LdMwiIt+HMS3VJl8pG2+pOL8SdRK+PhMBAAUqoP0nR8THt6f5yusLE/zu4HdfzoNmvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdcYDiVuKGtdoVrxvNVS3e/lfNxUhEQJ9ERNSo0u8Bk=;
 b=WmhUv2KKerQ7+xyJuXWDUh8TUYd1kvvH2qsdtCRKVOkuHyPIyHezaCMxVrenTBPOJZjptL+e+ABGRocIP2dX+F1XUpgGvyX9RfdnqOCGdvsvBBpcYDP6sfBHilxY77IraQ8hp+P/s+haQDIgQsQkeJCdtudm96Ccr7G9jnVTL8HeTbRRFXYSWxZpBNcDuPRlk7PN1/oPAzzUIZoHPf7/dcxiu+hKtl8oYR/y6Xpx2y4P7cKyoftNGbdp3xIv0GEg66X5YmgTgpe0DCz3GjIIGxQrX4mPCGRaQxLOWoFY7cfwkm+6JbqGOVs/QNz+RS8A4Hptftmk/onT3UXWPwyeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdcYDiVuKGtdoVrxvNVS3e/lfNxUhEQJ9ERNSo0u8Bk=;
 b=F4YpknKwRJmExhFFEI396dtFAbvZ3qIjIM0gR68POkfsrHrsPkbeaRj7GSN1mJjb0QQIvOUOz4/qU3/0foah5pXO3IzrQT77eoUA1R+SzZZmEss/MmTnLqpPswe5fMABt1pn8dOB1vM0Z4KUfexyj2g42BGZ8kxUJ9j7POTFeHw=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by BL3PR04MB7995.namprd04.prod.outlook.com (2603:10b6:208:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 12:52:17 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::b5) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 12:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 12:52:16 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 4 Apr 2024 07:52:15 -0500
Received: from cvadrevu-p620.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 4 Apr 2024 07:52:15 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-oe][PATCH] mariadb: Use inherit_defer for native class
Date: Thu, 4 Apr 2024 07:52:10 -0500
Message-ID: <20240404125210.3365296-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|BL3PR04MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: e0df6053-9813-4a14-a107-08dc54a60e72
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lOtT+XmaSwnu1njd4++wAY253suLtOoFXxnIG6092rmsyokFjLeU5xu8djKEfXGoq/EirxTiaihYu2Oaccj3StPG6/M9Ze+Pc8VcmtD5VpPDk3TauKCZ6zjfRRqjokw8yIT3u4c5zvaQHdeO8N0roP1DB0FtJIikf0KFpEADAwPaBaqtvRVBWrVm+ZawzAXeGGvjuer7ucaBmtgzx3S1Z1VdyF7E3lbupeQqoVdiA+AmnYCLx4KVp9Cxt/GOL0vrsZIzda6LxWGY+uL7L/vX3kx2rfjITkc7HCh21J6AMitD22+VVV31ZzunRkGyn+mVel4wcuOd1X5txvcUt5Bm6TzxcXR+kirhihbvDFeppajENl7c4u7qiFmaw/1s3rZJtg+28hu4VV0Ro5e0JEhvG9LD+HtPhgRSTROymrnsORPR8c0MtY3wjNWcgrBSTs2Hi+pEJZs6NpjoxvLD2RLIW4uJEbc8ak1vTzt6XRZMABLwFPEdbnS09kfK35qeWkZXOlyeTmAlous7zaMLCfETT9kfgXjj4nRGlKyRcmLUEHN/nviKlrbwOwGW5gSppJgZSousbeyVPJijZf5Pw9e9uoyhOpzYuk1Cw+DdiodPDVUF0p7hWTSXyKSsKDnf9gFQ0R0TaAiJNO6g1RFZ/eo9tQC2ik56xhW+eTcniEwK7abASuHY5bNcuhno3Y7rBs1QAMVSlzJU5bux/UPdUp4IJV+o5PQbUqrDR9OZ4+ONxH4Irr3RXLRFCPBLebpIZ8Ru
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 12:52:16.2371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0df6053-9813-4a14-a107-08dc54a60e72
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB7995
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 12:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109797

Since useradd.bbclass is using inherit_defer in oe-core, some classes are n=
ow
appearing after native resulting in QA errors

QA Issue: mariadb-native: native/nativesdk class is not inherited last, thi=
s can result in unexpected behaviour. Classes inherited after native/native=
sdk: useradd-staticids.bbclass [native-last]

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb b/meta-oe/=
recipes-dbs/mysql/mariadb-native_10.11.7.bb
index 578357b48..04380eb43 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
@@ -1,5 +1,5 @@
 require mariadb.inc
-inherit native
+inherit_defer native
=20
 PROVIDES +=3D "mysql5-native"
 DEPENDS =3D "ncurses-native zlib-native bison-native libpcre2-native \
--=20
2.34.1


