Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800BFE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 14:31:03 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.54])
 by mx.groups.io with SMTP id smtpd.web10.16895.1734100256979602965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Dec 2024 06:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=CMSUhFvP;
 spf=pass (domain: axis.com, ip: 52.101.67.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLSQ+wZNh1xmEJXBPAWCJ6ajLpO33IYrEZrkjhoBOWdj2QJZDZ9xxcr0JmXTxJYzeNts8uCAJHK0MApiwy6Lup+CxFgq68XwbUS63KmvV9wmpwGBI+kEqkEPiTRZCF4u4IaJsDRb5t/rq4AB1VhGzZLZ47UtV2X72zOFGLl8xFV2YGKDbgGPF8aVq/w8sJAmeTOx5vmCmn3Wd6dt0KEBcij7GJ4vr6+WcY/wI8eI7u5A4A1v2wBJUN8sl+n78EjtsZW/0V13vM2yXv7RGR24e3B3qkRUDY9lto3crx74PSC+GM3K/1noBbbe344rhQA6OrfPxUJFoW0JnWBOwDHXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2bTFcQJg5811wHobOE88N98pKOByVZ83hpW+MKTf5U=;
 b=WOPxWvCyRt5H3tRfihzhV+/QEIHq+vTMbLeTHEez1/iO29eE8eNjHlvv9Ii05lgnC4hOQhtREIR1h1+wtr2U6BBr8mH5FFi8UtedOlOHKtW7Z4Z1YmpGoL2HCZHxmyuHjZoQzNHrtqXnXzp4z3AZiUEeIw83DJZXVkPLAwYy8clqR1UTXUXUp/OesHYKwziCPu+Upak40ANTZJSR9Owt+Ih1b7N+0v98Kp+NZVBQkdrx+QoPDRoZbNNd9EsIoGkwpnsQOs6jj5GYCCQApFxMoEv/OCg0U8xo0k/QYR/JOyvBoggkKc11N/aiI7RC8EGebdgBQ/FHHIcHOLa1YJAhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2bTFcQJg5811wHobOE88N98pKOByVZ83hpW+MKTf5U=;
 b=CMSUhFvPZHdwv1vyiMpc3X4L6YQxvbQfZTXZvxdU0RKbohQRbGYn6x0orR+lLW+s66B3Rt8zV7YmY2gaKrCM2sYibcO9j8M7HnJMdCNNwU7Vj+THgnRn9aHJ+DT79oyZOs5WURZrOJroc5a8qb8xPPGtrl1rp8FZoaAweVsyVq4=
Received: from AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::33)
 by AM9PR02MB7138.eurprd02.prod.outlook.com (2603:10a6:20b:271::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 14:30:51 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::49) by AM6PR10CA0056.outlook.office365.com
 (2603:10a6:209:80::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 14:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 14:30:51 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 15:30:50 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 15:30:50 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C6EB34E
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 15:30:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4BDEUon4934703
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 15:30:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4BDEUoot934702
	for openembedded-devel@lists.openembedded.org; Fri, 13 Dec 2024 15:30:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lvm2: Remove a lingering reference to ${PN}-udevrules
Date: Fri, 13 Dec 2024 15:30:37 +0100
Message-ID: <20241213143037.934675-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AM9PR02MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 48902bc7-2308-497e-1ee2-08dd1b82be7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UH3WedXJxIrxdbrpK7aJkFxc3wndrbo+HKcU9Wf+xlKI1rCfwzAeTdA2K7li?=
 =?us-ascii?Q?XU9pBvSx9ht1weLol0rmh14feFgrPR5pRipUNggY2KIP/oiXmzZldBGAgonY?=
 =?us-ascii?Q?4c1s71zueVjUXusc1T2NrZ0UGKYrAxqn/RX+N/2310m4ysgkWwwOupAmtQvU?=
 =?us-ascii?Q?TRyBlpfiJSoTqpha8GktgsCW0qGtUAKrJwI53ug3uiC5j4v+iBrmtOXU0wZ6?=
 =?us-ascii?Q?BDa7VBl+exh/kvdH10++/MtJ7T1MLopAVa/F07dCrFo97vHE5AGo4hZhjgaA?=
 =?us-ascii?Q?bTJQfP8xV/hrv9XOmvlTfN9jneey0XBazZWLN3rAE1HEEWdVLLLvQR6R0GHc?=
 =?us-ascii?Q?F8GFzgRomias0gScfRQH9dKahqVNKlsCTZhdeFDoWgiA110zA1YbTehix9Wr?=
 =?us-ascii?Q?CK9f2AXyDytNhvWYb8IX3iIq42e0b8stmgAbzhJ9QkXZfAUtaYOCjhtHd4yE?=
 =?us-ascii?Q?5fZauMzWALWw6IUo5MHCnvw21+fnKtqzY1ENEjdQeZJGqOQMt2kTcWWG6oID?=
 =?us-ascii?Q?uzhay6juuB/CZfVjWlCmGUs4j2K2RF3lENWQi4tvk8E3ImzUTVCByXJkAmyP?=
 =?us-ascii?Q?huwQMHkh2VWGGClkz3f9OvjZb2UOHVsTa/XL469Hv50c3W4EGKbxaBjeXyUq?=
 =?us-ascii?Q?JGeWBQ/Y3qX6KyyTv40b8IYcmAlixulJcMkezpKQfxU1mdyvrGSsJPWa7o82?=
 =?us-ascii?Q?zHyBkOKVXxJErdqMRDw/6Gd4XPE9XIXIXJujaxjFlgSC1DTtBjXrPR/REdtK?=
 =?us-ascii?Q?685DGMNVLyjYE92vzxUj1sBJTl9fB85tCNRJ108GoZW1mcs2VRnE1IagZQJ8?=
 =?us-ascii?Q?NYz2+EympGcAmxFEzb8Z17IOGMsa1uV3FE685ymtjR/xCSBfgjyfjJkFPaWr?=
 =?us-ascii?Q?5Q+t4eth9dh3r61QjUbB6N44qu/bY8ckaZSeJ9lXf8oM8/dkYBfqvKh+hxOT?=
 =?us-ascii?Q?9E+16xYDN6RWisBUUZYIEUG0qVyqxlcgxIO2v/CBXRE2jibzwmqVAyCMvXqq?=
 =?us-ascii?Q?lUuWozuvI6dafPqH2N6n7K0I4LKFsgxRAYGZbX+11/pqhWts6/Ifc0dRNzC1?=
 =?us-ascii?Q?+w04BN1DyzRHve+mwBVX6VA1tyYR0IZt2FD3QCqBm4P3LNDJnmt6WHB5SvE+?=
 =?us-ascii?Q?Wd24hknWHZ/6AYO2a6M2dK+VTYWa/+Lz1Vbq6HiLHv3PuhAvC5bSyUdKIiRk?=
 =?us-ascii?Q?3ioomOOPuYH4hlundN2k7v7wYT08pAADX2HFUUdkKsaBXXmQB0CTkk0JcyMn?=
 =?us-ascii?Q?Rtw5p50MH/MJMZL6rtUmICTz+Es5Me/V4p160gWEX05ww72PGkbc55YibV85?=
 =?us-ascii?Q?A3nzb7RwyiRBVGtIvhGZBg2EEmkBlDJyvYdUIk65UIFJkkf8f3rtdZm//Iev?=
 =?us-ascii?Q?AQPVyViEPfwNoDqBnab+hk5Zh4NTMX9RFbBCa4tCl00UXijWnMbyCn3depcY?=
 =?us-ascii?Q?E8HcD7N5/XjSt3GaMbKPyxeC66RFH1l8?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 14:30:51.1382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48902bc7-2308-497e-1ee2-08dd1b82be7a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7138
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 14:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114312

The lvm2-udevrules package has not actually been created since commit
c37c867e1adddd6fa39cf3f3d4c6688ea6dc825a.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-support=
/lvm2/lvm2.bb
index f905a5ac9e..ccf9c380fe 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2.bb
@@ -38,7 +38,7 @@ do_install:append() {
     || true
 }
=20
-PACKAGE_BEFORE_PN =3D "${PN}-scripts ${PN}-udevrules"
+PACKAGE_BEFORE_PN =3D "${PN}-scripts"
=20
 SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd=
', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \

