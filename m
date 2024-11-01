Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEC1E6F075
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:07:34 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.54])
 by mx.groups.io with SMTP id smtpd.web10.935.1730484447728961127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=i0T6C2WH;
 spf=pass (domain: ni.com, ip: 40.107.201.54, mailfrom: erick.shepherd@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLDklYf0VTWryFlEyEAGlE0uVoin1hW2rDPl0H9JSjRrJdb3ANn1ARwmROoKRYS5bI9Uc36k89tLPlckr1k6FoVVqM8hNPI5BoTv5AjPCz4X/et42PVlHe1Nwuy+Yr81RHfGpHqS5Vk9yohr9uA+gf680p53Z3MuKGBrsrkBcpu0AT0qtQTgFrRLi2cnHQT1NWSpRsYeJn0B+wkovCcZ6gMlXF1MwAGWpnyt2XdKPJnE3QK5gVO9TPBYQdmkm1CLV1I2AIjc/LGCdxBzAntn+wDb4RpQAqXhz5V0je2nz0OxUl8AjhrxSp/CSq+IhG2Lo3fyzoy9t+I4nfqfGw4CIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S9Z+J2KcAC6dQvjXx6exgnA3JfrrCCYXQmh7uf6efM=;
 b=GLyhxvzfviYY/1sd+AIO/7EuKxcMr+sdQ0j6dQX8M+sApf9futB9gv1y6EVsWUNvNaeuiTn4T4LJTncMZGjo1pqNSgXrKJpfq4DbQHBaY4mQ8MsZS4FCQe+ydi0aIDYWMa/pVVOlLrYnWy1YIQviozjV+FeyVw4L+XuSmkcwB9y2xSTybGSnfEJW382QTwo9xBGu2T1Y/f7YBFFFp8QafntpIY3tZLu/yAkEdeonzGveVcnr8EPCH1fugBx4dUnnhMq2q7OBF13ifc8IAzKGXT4L8wMHS/vFsxTcjZBYILWXmLyzdb1i1JDkkNkI1KqpG31+RJuLgoklGjFgkJP+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S9Z+J2KcAC6dQvjXx6exgnA3JfrrCCYXQmh7uf6efM=;
 b=i0T6C2WH6ue7A9YpxQ8HJqCbDXdCPdt2S+l2WpW4mykn7wwE1j9kxgr6PbwtR6TkEfxIJ9RwDd13nwzBhLS8LhkWtg8sajT7VPZ0GfgN4NUdh/Hmc6cSFYFjQ+SYLyBKG3wMRtgFWgOQUDkisxEJjtl/6ucx9R6WhlUl4HgCsO0=
Received: from MW3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:303:2b::29)
 by SA6PR04MB9076.namprd04.prod.outlook.com (2603:10b6:806:40c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 18:07:24 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::38) by MW3PR05CA0024.outlook.office365.com
 (2603:10b6:303:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.11 via Frontend
 Transport; Fri, 1 Nov 2024 18:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 18:07:23 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 1 Nov 2024 13:07:23 -0500
Received: from ershephe-ubuntu.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 1 Nov 2024 13:07:22 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [meta-oe][PATCH] ttf-pt-sans_1.1: Install fonts after target boots
Date: Fri, 1 Nov 2024 13:07:09 -0500
Message-ID: <20241101180709.395252-2-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241101180709.395252-1-erick.shepherd@ni.com>
References: <20241101180709.395252-1-erick.shepherd@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SA6PR04MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f7fb50-e0a7-4fb5-a82e-08dcfaa00930
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O+TTdo1swZ/z72lAVMu+Xac0A+UvJnU0rv2mqGAHGPnhzpQbLLaAoQXp8F38?=
 =?us-ascii?Q?Z4baZ4Rf6fbRuhLzEkuvBj7tDU55mdMhC3MjVacEzjTDLtVswNXkJR36ldFd?=
 =?us-ascii?Q?HJeXlPFN909CqN/4ooDvVFhw9TTR5ui9xTLihw2FJNY2lvNCLlJDwG8TFi7p?=
 =?us-ascii?Q?bQVxYMIIBxz+XuUbPA8LT3QBFLbICprTCG5P8jlGIrt2Qy/NB1STSUBdXFwe?=
 =?us-ascii?Q?63cuYzzkOxeA1UxHjglACppkefTaZklXogdfFGZkMbeMgkCnIf9vYVLAdNSC?=
 =?us-ascii?Q?MaGNFYO1AgHAEeGwW0Haqs3g46x2GHuT2Ey5vB2Z96zqsPXzmr5LftkrL9nT?=
 =?us-ascii?Q?yzA5giwPBuPT/bC1e1AOQOkzOFFbf4bz694qY7ZmXegJ+925Xvm93Uyb60+p?=
 =?us-ascii?Q?VP3oHUgxswOShjZlUrCLYWIDDFB5GVfV+RW7XK0fo/3X8E98khOrv4/DB8j7?=
 =?us-ascii?Q?rSexBlA3vshWtEmqzoTSnuuNp0Ew2kHuYFvi6OSo8bOaFCzEg34+3uGmA6Wq?=
 =?us-ascii?Q?FTr9bloyvTfNyTdN5lu0h5lgLm1R7VcZKkKxc7r5kV2Np2Sgz1c5han+GOqK?=
 =?us-ascii?Q?5w3CLqo2ePnPGmYTDEv/OwwhiHAx46nSqMJi/yfNvgz95qUCzg5RnJ8zOSyA?=
 =?us-ascii?Q?m6Pqy2tuJ0W4zq7fIqH+7ikyN5fiQH61V+39QlQ2RioBjwOp7flGNJv3nYtW?=
 =?us-ascii?Q?cpZxl0x8Abnuq6qdFVamE8zb8RkXYuMsteUtdnmeJRg73Mka9BBFl6ltZjpD?=
 =?us-ascii?Q?n9Vdnrs/Y4fmXomKVbTsJWVj1oGBxoZmwN1GBD4evR7sOAhPuyBuXg5+aYkH?=
 =?us-ascii?Q?JJXfd/qeJONP8l9JZYJ4SzK8sabfkhYBreGHddZAus1MSqTPlV5ekhgcJxZl?=
 =?us-ascii?Q?T5F1yupyqjNA6dsD4X1qIPlszCVh8mjcVltItFEgM9pEorhd3f7KkbRbCPmq?=
 =?us-ascii?Q?rscW4dcBoryxG+XKlg1OijbHc1FJhO60rLThAqDZ9XrWIc/n4G/l95QacRRN?=
 =?us-ascii?Q?bf5kt58UqOqDUtT7uurd4AedBvKQrdMFMLpOBTPWKV6VRdvZCeiqInpBlnoT?=
 =?us-ascii?Q?YyI0zFoXU/iHfu1PP0TLAwr5iii0b/frLpC+Wax8ZeeY1Cs6egmVjVh+7EtY?=
 =?us-ascii?Q?+4YoAvqj19qtsF0UdtOg7xnM+9IT5FEHJ4cPCSFQIWREiwp5Hd7tef6VikLi?=
 =?us-ascii?Q?CX6/InZySTrGxD1DKmWfh8E5DoMWXnB6RVeZS2BLnbqEedR4+MXPSjVZiJ0Y?=
 =?us-ascii?Q?R25yJe/+CrIFI1B7nK5grEehLVqBZ0V8n7pjHDQ+tQZvp39+287ZmrM52/8S?=
 =?us-ascii?Q?DDtsNRT4MnD4//l5hXVTDy/s9T0Blh6NiKgvn/jGiL1qKtpKnCvli4aG20j6?=
 =?us-ascii?Q?rIZgSzZXkjlcWYmcwDJIjKCk4Di6ZdWO3s7x5F+J7a4CFp0KEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:07:23.4881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f7fb50-e0a7-4fb5-a82e-08dcfaa00930
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 18:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113388

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


