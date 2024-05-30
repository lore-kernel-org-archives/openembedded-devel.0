Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA2AC27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:34:27 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web10.12805.1717083266125637818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 08:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Ikn/o1Nb;
 spf=pass (domain: ni.com, ip: 40.107.243.83, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcFrt9F5zcwrN+zwAWDeU+noFyCJUgoUznWQupTmhspb03n1fuIqzu/yg+Ipk8RsiuIzTtzJWJ1k7rkVLNnBnP5veWN7e2pCVX4aN14ZcIzHEDwOhvuW39gkrTSOz0IlRWwQdM2XHYBiOut2zrbexRSMsIUg5uZx2pFj+LGDe17lBLxHi4tSjUmLaeUxkpLaF4EWXiCm3Y1+lgUaQ0PRSL3DrRC2VIrOC5MAlcxEn7izx9dLDqb6aqwv1j6EMXA+fwJyDq0Jxu4edacXPHyPbwM2/qh7+h04vV8F3Ud3P4n/ysKZxUdA461MMuQsHZS888bsB7uosVaMQWCwOE+93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxE8AWdoqXPIJTfIfWzKqq6RfVm/GuPFJqagu6yf2ig=;
 b=J8UCyq5txaRjaY1NsnjyAi6Z0ytjHfnb/8TstgGJMomPDJGyIJjkiwbDlGfGwVu9RU0IPfI8/U+lpm48Su+i0T4jND/5cUl4hStf3akISE+p+N9hVH0JZBba3ygfnsk6A/3aAa0FAuhlebtLJ57qsmQmzfhlqJu0mYD/iDW8mvHxZqFnJrVSEkiYZ3GKEcU/ua8IO+S1z87Nydu/WK9XLKDiZNnQhsfcJYSnSwlbaLKvjXXI+goEOmJCbVgPPQFr5CnHCSy5YLZa+FevUAGAMgeT4jFkL6nezgGj9EaInQxNbNM/4dnS7me6g50WJsK0WMcOnajpORneusu9R1iNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxE8AWdoqXPIJTfIfWzKqq6RfVm/GuPFJqagu6yf2ig=;
 b=Ikn/o1NbN/LhlbOZ6yKZQt4JdGc6S/513exaLWfzDvWjoF9ZORk1xfPqHggxxYg7wlT8vw2+8z4iBP4J9gSszcAdF4BQ/nsEfcrRRCjl6aJ1oJRddSOi+4A4VXcpHBAgXPO63C65gQSjaEEx4lSagwbu26W6TrChX+wPjFEWY7U=
Received: from SN7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::31)
 by CH2PR04MB6774.namprd04.prod.outlook.com (2603:10b6:610:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 30 May
 2024 15:34:23 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::62) by SN7P222CA0023.outlook.office365.com
 (2603:10b6:806:124::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Thu, 30 May 2024 15:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 15:34:21 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 30 May 2024 10:34:21 -0500
Received: from cvadrevu-p620.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 30 May 2024 10:34:21
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-oe][PATCH] pv: Update from 1.6.20 to 1.7.0
Date: Thu, 30 May 2024 10:34:08 -0500
Message-ID: <20240530153408.504969-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|CH2PR04MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 770b993d-1e49-4915-a8e4-08dc80bdfa58
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nIFopuoMzWtEJt4sWph/Bcf09+QjuDdzcki47CAGAqfZoeh4fH9orYYIjkc3?=
 =?us-ascii?Q?76Zq1wIm/Nc4z/2UKBS3VY1enqbqrtijPtxYsfZDUDfobT6MVJqTgg9vjmmi?=
 =?us-ascii?Q?cMUjaPbuCMD4b40PAc849oqW8JucB6xKuyC6mCa902Mf2Cz9N4zgyKTweBR7?=
 =?us-ascii?Q?TuAhmGgwpTQTeFJ5TbdMN50uKHQBvMiXWSuAsEMaCbBw/7beD5kef2ol/rYa?=
 =?us-ascii?Q?5k4nHlbAPt0kYBRSHEwWgMlf2HGroy/o8d2CMMUb51uC8N4n5qj0W4K0ZQFA?=
 =?us-ascii?Q?AFNrG9rJW0hz6wqlo9GfhJMcO8aAwuCy30ia/3rxHilK+E5sZOtkVwlND8/W?=
 =?us-ascii?Q?BEn7C44z/BLN2bbK7JfiNVtVHGCwAxVXqqZuVUBNkg+X0au0WoVYwSTLd4a7?=
 =?us-ascii?Q?54VNbNmUfbM2/Wfc4iojn6AWKcK2YTyIfx8cf129e+poYP59tEh1L+PchD8h?=
 =?us-ascii?Q?omZu73tAwNkjcSYj7R3u+tTCKcqK1GCiWcC2tNft43dKyVbf6D/RZgq0RPI9?=
 =?us-ascii?Q?E6WVa9b0txktLpzhOPJqspUf/86kuG9TYfYVVBlJ6dY/kVlRLnEp9hLXkVv2?=
 =?us-ascii?Q?QtMNsavw0ubss8nb7cZJvNuOJJ3wuic/BmlE4d6ATx0YbhB3ZeEzzW1uZJwq?=
 =?us-ascii?Q?WXJrcKoRiu6S9Gmts4yUYpmhnvUR31cueODXLcbSNzgkSCRzO218HGu8QzPE?=
 =?us-ascii?Q?+6Q06fmlwFHFGXg5cBgYk6Fl5zjt4ErkQw4j/cbu/JVZYD19kHhi5befkHJO?=
 =?us-ascii?Q?q4c257fxf+vIRQT9f4jTx+LA3eRvSz8fUnmXaPujzJI2hzhNWXY8kC14r/vq?=
 =?us-ascii?Q?ZDv0wiKRJTvC3rVG/SLSW4oNYpuS/VL7t3h2SdZTRpTZXXULa4uCUAo9QJvm?=
 =?us-ascii?Q?JaEDxcScr5kwMTqHtaPfbh2eiKwn8PlIdKaFGhju9iVHF+Z+HNJthgRFsmVH?=
 =?us-ascii?Q?fr8+IxpEseE/AGifITC+fHmvBQz/dlJ2I72B/u/Br6RFagDnjave1ch/MOqp?=
 =?us-ascii?Q?N1m1NQ+kfPGl2GVYggM1CH/u3F6CCY54afEfD087E8P9YcbxfjfJ3/aL8ZKe?=
 =?us-ascii?Q?tlScr4MIlpNrNsNdR56+BbPrOAiq0GxtGvijl/hnz//kcNZf/qyNLJO38veE?=
 =?us-ascii?Q?ZTS5VDiVegPIqhdm9w0jSbDPjYSDahAZVLXo4yCdacoPKKQ9pJn0LGyfQwXX?=
 =?us-ascii?Q?faX6xyCdLd1JDikEn0xU6A9mr4VWo6XSxZD95PQ4LHfO+64DGD1BHQIe7jR/?=
 =?us-ascii?Q?yMBhwheZ3c7l3sdwAx5MMdHULyhMpD8XnYIOZawQOQjAQlZwas5imVMuHvSZ?=
 =?us-ascii?Q?QTX0cVUzRMRjXFn10IVL+RD6?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 15:34:21.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b993d-1e49-4915-a8e4-08dc80bdfa58
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6774
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 15:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110629

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta-oe/recipes-support/pv/{pv_1.6.20.bb =3D> pv_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.6.20.bb =3D> pv_1.7.0.bb} (91%)

diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-supp=
ort/pv/pv_1.7.0.bb
similarity index 91%
rename from meta-oe/recipes-support/pv/pv_1.6.20.bb
rename to meta-oe/recipes-support/pv/pv_1.7.0.bb
index 6a739af927..f6f0045c2a 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
+++ b/meta-oe/recipes-support/pv/pv_1.7.0.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "https://www.ivarch.com/programs/sources/${BP}.=
tar.bz2 \
            file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foreg=
r.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] =3D "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5=
a3188814fdc603"
+SRC_URI[sha256sum] =3D "1372b41053881a05e2df10cb054304decc0233261c0aa0e961=
85842fa5a422ad"
=20
 UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX =3D "pv-(?P<pver>\d+(\.\d+)+).tar.bz2"
--=20
2.34.1


