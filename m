Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C57CCCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:35:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45343.1762770899514117298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=e6pKaXpQ;
 spf=pass (domain: phytec.de, ip: 40.107.159.85, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joe/gWaI7e1rZeBIra4zhkj8zN9Yt5NoMVlQD2KDtenBT/OtyHSbnAP1ZqOaIK+IuTupTaR2CVMbmKvDz3p7Ei/+XoYuLiZQn3WVge8vj/JOkrYgksaJtMI4AQ5+Qz+u6DgVqBoMy+X4PYwzZz168R2OQ89qmWVC+Vd4kHFUDn1PJme70MpNofl08lgN2FwYuAgirdiluQbqMiKQNeBf8oAekFVWP8bpBXI+q29P8QbcuKrqIQmsoKiIFc4pPPRVxB33Cwam90QstZ2h2ayXsRtMY8tTRRbqc/5uInGDIcPlDy8y8+mgB5rBoT9TEONbJqkfRacgVgLecLk0+j9oHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ7M0XFuq88RdvdfjYgAb8vbcIyDZmx6FHl7zyzoEpU=;
 b=XHAcBuOk5pNec12GkgAdbeQWNTqZyyvQ094Ql+1QSd25fH+m9Gh1yY3WTE7TeoLVNJqbrC+720mZiHidTb8tzxSq36PKPPYuu0yp/0s5xDcQeIEsRB6J1YTbv87EWP45/e9GU6edkdm9qkJZ74qLoVWylxBl3rYPrtGT43wrtgVEzdKZvY8BxhNUKeLNtECIIe1sWG0T+aWNrvcjSp6rNpyk/zfhNaNV+KnIlqSwrPljkHwblO6apL6J+SmPJg+dkDlefS8lQqyHCch4My+7Ap/rDjoUBRhtYjniA2L2KLzIIr11cE3pzumD9YemC9NBH1mVFyuRdD+u5YgeaA8kMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ7M0XFuq88RdvdfjYgAb8vbcIyDZmx6FHl7zyzoEpU=;
 b=e6pKaXpQ3C/GxRPbGoz9hwJ2UexkGYMW2ni0iFmN3Oz4uEr4XnZ8BE5axYvXaUY6nuOu0cEV2A2bb3nDfWc+23gNevxR3QXrcf8tA7Mef4zxtWBwUmkUi5gLXMt6Rkz48Xa+SipQqXLyzFGoFEVVEfrJRZHdnwlEQrZojyblqtMnTVaLT79b2hsdCZn2/wgaATMNKYYrkQ6TvPwbupgxsPOmsm6egtE/xvcBuesVzvFQI7NcUI39rnutGHUkQxW01PhLL4XvtAMJv3DxGaS0uUK58+AvCp1LxgQpVkWjYiIEnUq+6M4RDzRSldjJHt8JzwU02qTEOehu6zPwSFyLUw==
Received: from AS9P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::19)
 by AS2P195MB2406.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:64a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 10:34:53 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::1d) by AS9P194CA0009.outlook.office365.com
 (2603:10a6:20b:46d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 10:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 10:34:53 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 10 Nov
 2025 11:34:52 +0100
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][scarthgap][PATCH 2/2] cockpit: remove deprecated packages
Date: Mon, 10 Nov 2025 11:34:42 +0100
Message-ID: <20251110103442.3179795-2-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251110103442.3179795-1-l.anderweit@phytec.de>
References: <20251110103442.3179795-1-l.anderweit@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|AS2P195MB2406:EE_
X-MS-Office365-Filtering-Correlation-Id: ba459c76-3d71-4bbe-1b49-08de2044c8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7qW+ql7OqX5BXUX1OO+zGrU1mniUMJCzOoGWb9Be15inmKSX7YUtO6ytFkso?=
 =?us-ascii?Q?QUdZ0QY9EvHNEtQMFI/egWi9Pl3ER7qC9tanhtT85WkH4fPZVBiPxXPXAEOh?=
 =?us-ascii?Q?ZjKqTRQ7OfAOJe1HiCR17M7GJQjHoDM7TRYEaB2LbTIykVynrlXYDz6zo6B1?=
 =?us-ascii?Q?M6R2MZlztpZmhYKCWfST1IbZg7DT6PAgbAQ5nmCEAYLwhzP5npPvfn2LKkc1?=
 =?us-ascii?Q?Vu5EkiYhYmJ9hoOiglw5XpfGDibFOfsvPEJd5O780dXEvzVMRJuEgxf5yPbu?=
 =?us-ascii?Q?DILMHEqQ57UW+tiUsMth5oLoLV6yB4sGoe9iInWYurTyBRs/q9Bnu8r40df3?=
 =?us-ascii?Q?HWz09lG8VXH/J0CFSNW0iPrVMX55An6iMktWd1PHK7zJiWSxhVzZN3DGhhhd?=
 =?us-ascii?Q?xe8DXHCYaAHN7ZcmRpHadKAAg3OWeQ+wErBEJMK9iQTeD4Uc8fGfrlG24Lyt?=
 =?us-ascii?Q?9bAZ5E+zzDGW/+qgKmtUM0Vw7JhHjmqW+AE300y9vj0nHVw7cwcWZFYOAOP+?=
 =?us-ascii?Q?i5Xi11K0EwdQegAzJn6rWz1PArk1sR8UazF4zZ+ClNvj8abWdCfYrbJvZqpt?=
 =?us-ascii?Q?6r03fnM+056862ThmH1zN2nvOJ0zM9hQISufgkUtteyyoDY2TRHIUPeqRDlv?=
 =?us-ascii?Q?NMNLYf+Ftx8W7s+RR7yVwcgCL1niEJz88T+gPBmfJ7PSWwQ/uo+HuhDzFuWg?=
 =?us-ascii?Q?hZ0/XYEey7qk7OBPZI6xORszvVt+cb395hz7vJ7b1V2eovplb/GwRQWMGlzf?=
 =?us-ascii?Q?Xg/HGhudQQNVEPLvgxo4o/G5nN/ywS6CiaqudsgEoLLnWXQ4Z1aGANWlwCwL?=
 =?us-ascii?Q?LMX7ni/Mm6MQ1K/tklc3slr/wtsyJqMjVkuld1KaqM/2vKjlafDoE8TV7op8?=
 =?us-ascii?Q?yj4alYv6tBoKlr93EdxtIcGsXir0MUMn2ifnfQysZYtLowzW8DqgRy17sjH/?=
 =?us-ascii?Q?ODlt7385+nVO6tLXiwlqfbXRbP1RnhvlwB2H3LF1GIGpuACf8S7sQXbjGtnr?=
 =?us-ascii?Q?Qssn32fifeHs/Gh6p+/dzfH40NdVFFiyDPrItJnFSL3AdZ7loRM5jJsWcO50?=
 =?us-ascii?Q?mPJ3zwiVpQFrKIY4NTbd3doOIpLDYH48MwP//bnvVjONSLJDnr+1TJd2tnUQ?=
 =?us-ascii?Q?E/SDAR+AhO2zeIdP9DZx5VB3K26WY802gM+gzChvRVK5bMQjeSPOuYCJ8d9D?=
 =?us-ascii?Q?joVsfN2lxcCKXy5R24NYWVT3WaYBCvxctXxvB7I8qWhEVH4/Q0SJlDtNVW8W?=
 =?us-ascii?Q?c+tBWD0B8LQZNM7vBy8xRyaH9EWKIKbWJx21fYnY9j0gZQBRqennQY5kNzsU?=
 =?us-ascii?Q?LPNDc5F3S4/y/bZgBOT9xE/gYH3vsen+Uwkj4gJ7gayKR3keXpvFeKr1RtDn?=
 =?us-ascii?Q?3rFPMGNMVHuOvCrJhQ/STyLZUbHeHqhOHPDDSu0CnajFthf6a/aICRdMyNzQ?=
 =?us-ascii?Q?y3PlX2IQdRuEACHF2YFD6qMPEswYzx78essHPO7m3YR1PxfTbZc0FazRSRH3?=
 =?us-ascii?Q?AXNJR4WX1acDRqs=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 10:34:53.0564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba459c76-3d71-4bbe-1b49-08de2044c8be
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2406
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 10:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121457

From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.co=
m>

This commit removes from the recipe the following deprecated packages:
- `cockpit-docker`: cockpit project no longer supports Docker since version=
 228
  [1]
- `cockpit-machines`: cockpit-machines is now provided in a dedicated
  repository [2], and code base has been removed since version 242 [3]

[1]: https://cockpit-project.org/blog/cockpit-228.html
[2]: https://github.com/cockpit-project/cockpit-machines
[3]: https://cockpit-project.org/blog/cockpit-242.html

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfair=
elinux.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a495fd2a54614ab238e4e87355cc850c68d56fd1)
Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-=
webserver/recipes-webadmin/cockpit/cockpit_304.bb
index f8b8b52608bd..7515a86a5742 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -60,10 +60,8 @@ PACKAGES =3D+ " \
     ${PN}-sosreport \
     ${PN}-storaged \
     ${PN}-networkmanager \
-    ${PN}-machines \
     ${PN}-selinux \
     ${PN}-playground \
-    ${PN}-docker \
     ${PN}-dashboard \
     ${PN}-packagekit \
     ${PN}-apps \
@@ -103,19 +101,11 @@ FILES:${PN}-networkmanager =3D " \
 "
 RDEPENDS:${PN}-networkmanager =3D "networkmanager"
=20
-FILES:${PN}-machines =3D " \
-    ${datadir}/cockpit/machines \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xml =
\
-"
 FILES:${PN}-selinux =3D " \
     ${datadir}/cockpit/selinux \
     ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.xml \
 "
 FILES:${PN}-playground =3D "${datadir}/cockpit/playground"
-FILES:${PN}-docker =3D " \
-    ${datadir}/cockpit/docker \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-docker.metainfo.xml \
-"
 FILES:${PN}-dashboard =3D "${datadir}/cockpit/dashboard"
 ALLOW_EMPTY:${PN}-dashboard =3D "1"
=20
--=20
2.25.1


