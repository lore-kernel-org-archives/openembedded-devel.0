Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDA9E6F07A
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:07:24 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.62])
 by mx.groups.io with SMTP id smtpd.web11.906.1730484441142506030
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=h/O6CS2d;
 spf=pass (domain: ni.com, ip: 52.101.62.62, mailfrom: erick.shepherd@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtuWAOPcGBvKlZ1w/rO2EKyNT2r1nrSnHCMNdDu3AXLXiMzSRPKj7fxVCD1ULKYMXIiQu47vLxYJ3gzu6xcUFeAe1559Ug3W7ikgSs5VFpZvQ4/bgqDN9WHAk8+0w+1eveoxAqSpdqnOUnoMVZRcmG3Vyg/de7K2thq+r1TQYla2/5Eq+hn70ELbzVBkGlmEvjvfHYkxY22p0pwvTVDSr2AOUFtjGfaMMJN/STMZNwvDGTnS2cNDo581ulVeDamQWD6O9/uJ2xk5TGIriXaNcogu/PkS6SGIaSwcPp2ZsANHbIZunNqvzmn3VcVxKTOY6yYds/KtYCaVfirM6Iq7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S9Z+J2KcAC6dQvjXx6exgnA3JfrrCCYXQmh7uf6efM=;
 b=FqDV9lyfgwSsu82z1ha6oMmxQTBqegk9mpNasazFgsgHjwerPWFhwPzp/9rVdb61FX6nSwTVuORMiltpRZvQUAr9V7lhxRUYs+MmryIjUlAHgWh4vU2M1DzThb1BjG7bXfVnb5Oo73v8qjBfU3KPNEO5BXB7AtyPTdvlPYC0rqVoO4GV5JGEVuiFUZPVaE+PXCK0yFD3QjY/Qrm3RUhvoffqAHt3Q+/Lj/u/4Y5pM4jV5h/UNsL0ALUwolL5/EWyQw1wapkQvxKvrXtLFawYwxm9aPZ3GmCbp2aNZEr+Kpa0P09PyTIhy9gFdQpvFqPfB7weglsUHUPaT79bItrG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S9Z+J2KcAC6dQvjXx6exgnA3JfrrCCYXQmh7uf6efM=;
 b=h/O6CS2dtGNTJ3tGBHR77TmsUlmKMldZ2j1GZftdMAifn3FcyYbwtmI7vpm32Qq6695FqLJc4Shi6V9g7HUWVIqJjH2atjGCZp2SNx0RVC23Jn5E/PlOmly+K8/20lx93SwQBp8KKc7ZHctVJe1lz700fr7vfZ5M7VHg6GxHlO0=
Received: from DS7PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:3b8::15)
 by BY1PR04MB9586.namprd04.prod.outlook.com (2603:10b6:a03:5b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Fri, 1 Nov
 2024 18:07:17 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::26) by DS7PR03CA0010.outlook.office365.com
 (2603:10b6:5:3b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Fri, 1 Nov 2024 18:07:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 18:07:16 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 1 Nov 2024 13:07:15 -0500
Received: from ershephe-ubuntu.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 1 Nov 2024 13:07:15 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [meta-oe][PATCH] ttf-pt-sans_1.1: Install fonts after target boots
Date: Fri, 1 Nov 2024 13:07:08 -0500
Message-ID: <20241101180709.395252-1-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|BY1PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: a71f204d-d9a1-4626-1e59-08dcfaa004da
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I53Y32VmbzVgf2Ev9pMpaCGkzaXoeoEnvr0U8TInd/uH1K7zZGg4x9vnE82u?=
 =?us-ascii?Q?uMylNkLUypY+Yz33Yxh6SbyVNvwi2PVB4sha/Ryz6TYutg18/0TgNa2vm0Gi?=
 =?us-ascii?Q?ZiA4kNMRYqkinR+bYY11fJbIW/8kf9dIqMa5AjVsWcaX0EEgXmhvnc47/7AZ?=
 =?us-ascii?Q?E+WOUSxnErzsbBL9a4HaZEHqPd7lz/3WIY8eXijYb7og1ykk0mWcPHKoZoz8?=
 =?us-ascii?Q?88rYJTD1WR7E1TR8U1/rngSOkHXGeu1fyJVFR0HY1h0dQn4yKYvrCJe3TDkB?=
 =?us-ascii?Q?hW/xKSef1vc0jt4gL+MgwC1PyGoehgHry8OXwvz3jfqojbBskwH+L2SJp/gt?=
 =?us-ascii?Q?cCx4NZd6TOGf151RxIs5bmhzbkdX6XTRefU4W+G/L1X5uu+QA0mEMbH/94gd?=
 =?us-ascii?Q?YXUfK37erK4VN7CNEmdEjN1QGGFsbkzVCiboUWYU/6AdXmWAdT7pLocVCzu6?=
 =?us-ascii?Q?RoVeiPXZV6pHI8tZcespXT1G7sUBmWYLKsZjMQHco0VAIXSRF1IVSlcXq/p2?=
 =?us-ascii?Q?ybVpA732tO+NauZU1ZliQpO1JqOXLmQLLD/6so8tRjWL4S321GiqH202Pho5?=
 =?us-ascii?Q?XQYWIMoGHTsURmCpx9FE6kFPO9FRlOaVLxV2jn/m4RXchTzwDNNXmrZ59d20?=
 =?us-ascii?Q?TTwrnqC+NIoHNV6s8/hZqw8Wwrd52Z6AX4zRV48qDhJI9qISze/BQ3SRYChN?=
 =?us-ascii?Q?DnAKNzJ3J93x+Nla4fJae7HuOzaf0qxB1bPkMdaKbG4bKEG7gOR8psALn4nr?=
 =?us-ascii?Q?hW4uyZcH9KgNkUyKzPx8KxwCRwMsDhPxUbIBOEBDpjs0bIEM+LJZHJhkW+bC?=
 =?us-ascii?Q?YkxIS05kuPeGhSjYwuRz/fj6+1zZrG+ERa2EJlBI5t/3XXqC1i+4mDdS97yz?=
 =?us-ascii?Q?TbRnnoX0PB4z4uIyV2HdmPHaE7BCYZCtTBQQUL5TRaBUnehclI7bwZNMf50v?=
 =?us-ascii?Q?4q5OaChl6YFasm2S3+sVtEOCZMNTDmUsiWUKjwPeEbZKcjnuqQWtRBD7IoWG?=
 =?us-ascii?Q?2ITbnBo9oURsBCxKVCyc8Bt4osdLL+WDTIDSW/0yt9je+7KUSCL/jn4UeCdr?=
 =?us-ascii?Q?jHYbeUzrjfRFA01jLol5BuzYigrzh4leHQJZgV4v9BG15asYpTMPsmVgIHnZ?=
 =?us-ascii?Q?Yh8mYBEVoniPZ/whPvTUvsOX0yxieGSRYC/3yLiumwHMyTsz1mVms98JuGzQ?=
 =?us-ascii?Q?//jVqRFNVijqf8gpi3Wtpkk+PiqIBmIeYZFBdHnmzD3ms6DUM34hlyUCEwfk?=
 =?us-ascii?Q?0cnW4v9rlx7ogTbqVXghnab+MJccSvfmiWcctxuFdgWqwSnPOGwU2j8LKxOE?=
 =?us-ascii?Q?JSBnc+wvS6aOlvBBARu9afmS24Bw4DX+T60fTD16dvGeMhNU5vQr9fyVSt//?=
 =?us-ascii?Q?djH+IJs9IVe9t0UTWw/NCeNb6mgoXsF4/bFH+A5wEPBkz7BC6g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:07:16.2257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71f204d-d9a1-4626-1e59-08dcfaa004da
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB9586
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113387

Access to the font cache on the target is required to
get rid of the "configuration required on target" font
warnings that appear during rootfs builds.

Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index fce76418f..5789f90c7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -27,7 +27,7 @@ do_install () {
=20
 FILES:${PN} +=3D "${datadir}"
=20
-pkg_postinst:${PN} () {
+pkg_postinst_ontarget:${PN} () {
     set -x
     for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
         mkfontdir $fontdir
--=20
2.43.0


