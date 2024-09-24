Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A94ACF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 13:44:04 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.115])
 by mx.groups.io with SMTP id smtpd.web11.14330.1727185437184987584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 06:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=H3oCdSht;
 spf=pass (domain: kpit.com, ip: 52.101.227.115, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBKnq20PC/yJ4SV6Bjq42kvZ/P9yCY0z0l3HF0phX/8lx8fxc2VbuSreuoPyCmrVX+GHv/jZg42kl7rT2dkHuJT5Bm5N6/50M/CT4Az+zOdynoOU9bJkFS9PKJL/MUkCIDGD6r0/1gpOI/7GJksBFbwNvvE6PQfKoXPqjKW7bdOR74xK/qHK8anBpAMW9Aq6j6IP1z39wKHX1pqqBjIzN9Jde920potzGloLd35FlH7Ss53T2Bgwu6A4Cs7gx+LEHQUUfJlfDQrYgAQ3lwQD7dlRhe2IgBQcN3pRsoa/MwGdqlKaAlvGhuXWJdhxGOesJ9xn4Ft/P+3jNn/xd/NhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcepnXFUocFRHknl6RFNsxIkGaGpxNuiQoAaz6Dmjy0=;
 b=jmlbE334tebO49h7SJqTG+gx6yMrSeHrQejAueU0p14yKVlstvR3KYWXsuStKpoCpkNV8C19ULr44JjLjMpUyqzpzA5iO7jXX+T5LCEEIkDRcAbgGs8mcOjL7y6I6vl7RzxqULVfIzkFYpW4I3a/oBykIEhTvLpeAdltL6iLVp6FMEMSK0LwB51i1SC+hKYp1HwxZxfzJUIzJE+rZ+/X+1Txf5IT2A1Z/cN4UV7RJhJdu/pLMJJfmB0gWKnpi7aZWhzG5qv0Ugpwf8lXbDGwbVolXc8kF/p8CayNun1PoxMW6RVimOclfGFsFOC6ThZhx3s9BX8Q3AaqoKCk4IvgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcepnXFUocFRHknl6RFNsxIkGaGpxNuiQoAaz6Dmjy0=;
 b=H3oCdSht0jW//AjTcpEuRR6qJyGEIah6WbcC6Ex3Miul32Hf8tjcFkvTHrMJ2rZcrqFH73Bc1zCYmVBh7Z1K+sjneARoFvQxHYQyutOIExlzLploMc1H+HYlBV4tfJUFTzzvIdB6RrpXWVosGlRyRsE5v6TmIhVmuy5DoB48vK0=
Received: from SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) by PN3PR01MB9662.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Tue, 24 Sep
 2024 13:43:46 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::ac) by SG2PR01CA0145.outlook.office365.com
 (2603:1096:4:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Tue, 24 Sep 2024 13:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 13:43:44 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Sep
 2024 19:13:42 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <nikhilr5@kpit.com>
CC: Nikhil R <nikhil.r@kpit.com>
Subject: [oe][master][PATCH] nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
Date: Tue, 24 Sep 2024 19:13:29 +0530
Message-ID: <20240924134329.121885-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PN3PR01MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 48196bbe-e59f-4bb9-fada-08dcdc9ee902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9qZD48sDThXMhCB5WmtwNptaMSZyo9jxgjbq04c2EauPvA5GoetRBYQapWL9?=
 =?us-ascii?Q?v2fLf2OMhZM/egBLASoTBcdKz+NxTuAU0Se4Z955k2v2SnilTt6ftFXsl9f3?=
 =?us-ascii?Q?rTbvFRol/YE9UMm2bFfDOy1QnMoIcdal5I6wJg/SI/BqDRV+ieGDecGEam8/?=
 =?us-ascii?Q?AymvLpx70TOjM8Q9TbcR4pixY2rB9KTT90FGEOou4pSKuUqTD3b8mPr97Mim?=
 =?us-ascii?Q?73R9ulvvdB7LB/SEzH2j00yegJ7oZCaYcZTVtk0HNGJpRIxGJ68YwqH74ryn?=
 =?us-ascii?Q?M896LCdjhVsxnMoiPwxP4q7RxYquLWK90AaGHMr6q8PP+5h/qQsLR8CKQkXS?=
 =?us-ascii?Q?cqZ7ScudHvT10cLv4u+RjYvIN4WtXxnZAjxPgoPD6LLA9qn/Tx4ldkzEyN7K?=
 =?us-ascii?Q?cekrElbB3TD62Nje/TggF8ZpP55+1tECd+IfCs+1X0Bg/03x+R9gDlLwzWO+?=
 =?us-ascii?Q?ES5wVzDBwJTe1OOuNzYHxmd82whpwvYmgOc0uH/4ZleFPY8r7fe9SVbIAnpI?=
 =?us-ascii?Q?mgGmLggTOcltealT6V+a2i1O+afuyadhgh5btFd38flBV4aZ6SgZ0A6lqiwm?=
 =?us-ascii?Q?SMqIoq1+kBfPLXN2JPc6wsvpeSAIiZ/hSK4750aGMHMJj/6v2S0DRCnc1dX5?=
 =?us-ascii?Q?/U/HaFkYacLdlVX7CrfBfgKLqUdsVfNgOje5QQFz18ieAdt80ybZlCJVXq4I?=
 =?us-ascii?Q?/2qq65pcriymT4MMOr7Gj06Yd59ZquLvJz+fhqq1AAoHDQbAY2PsxInaOLFY?=
 =?us-ascii?Q?lLywMOA70DDyKOExUC79uAWdeoOcXGfEHNNIUEixKl269HYz9+skJzIciUX0?=
 =?us-ascii?Q?kPQ0y8GtoNuFKD7mJz9b46mczp2RbTd7F1Qo5c8C0asdtDTVS51shignfPWI?=
 =?us-ascii?Q?UjStSYOPTSADJpuhAMQ6rbhXMdV1PPumhhwShoo0S413D2wRaJZ+QVusi9nq?=
 =?us-ascii?Q?GLwn927WD+Vu2MtYRQyhLjfU4XpEb3ZwmTUUQnPbbA4E9vJ8LGl+wAErqstr?=
 =?us-ascii?Q?Wu3BVnc4q63wNFGX3K42AngOJl3O5k+EWN96xAxnjd+OV1grgbxu3gFhSPj9?=
 =?us-ascii?Q?RrU/enNoNWt6ozbJ/ZjD6b+3CAwfRY1dnmEg9xptRC3QyWAG2a2vzU9/ftZf?=
 =?us-ascii?Q?uJJfvFfr0dwC0F9/yxzil0lafjDaYolHK75Puds7VeQheT8cMo9PNhf46YMh?=
 =?us-ascii?Q?vxkvV4aIrijMgcErXZ/ulGRvWPsoViROwpXgW1r/nfqcH+5vpq9NJk5kQdMS?=
 =?us-ascii?Q?7MAVEz7FN3KvBptk0xHk4vXcxUPCjxgtL1azy2p09R3uq8wwjYTi+QiRxOPo?=
 =?us-ascii?Q?nBWCuFcsBwlZQQ7H60DF1i2DonJ/hY9LhtLMEoDQCgN4B+qnaIYpL0JU37rv?=
 =?us-ascii?Q?k6wT1g0Luz7CvJR9d9G7vpnjDmgg6dONCxwPx8AB8dnu6ZpO/sFKAgIrIM/4?=
 =?us-ascii?Q?v1hs5f/RIVdFCl1O9y9JeKfxdhREXn9o?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 13:43:44.5591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48196bbe-e59f-4bb9-fada-08dcdc9ee902
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9662
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 13:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112480

From: Nikhil R <nikhil.r@kpit.com>

This commit updates the RDEPENDS for the ptest package to include
${PN}-python only when the 'python' PACKAGECONFIG option is enabled.

This fix is required as ptest is enabled in the Distro features,
which was causing the following error:
ERROR: Nothing RPROVIDES 'nftables-python' (but /home/builder/src/base/node=
0/meta-openembedded/meta-networking/recipes-filter/nftables/nftables_1.0.9.=
bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nftables-python' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nftables-python']
ERROR: Required build target 'nftables' has no buildable providers.
Missing or unbuildable dependency chain was: ['nftables', 'nftables-python'=
]

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/me=
ta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 43d606f5d..245b86135 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -59,7 +59,10 @@ do_install() {
     fi
 }

-RDEPENDS:${PN}-ptest +=3D " ${PN}-python bash make iproute2 iputils-ping p=
rocps python3-core python3-ctypes python3-json python3-misc sed util-linux"
+RDEPENDS:${PN}-ptest +=3D " \
+    bash make iproute2 iputils-ping procps python3-core python3-ctypes pyt=
hon3-json python3-misc sed util-linux \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)=
} \
+"

 TESTDIR =3D "tests"

--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

