Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD60FC021A4
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web10.322.1739232614067969332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GLrDxYcK;
 spf=pass (domain: axis.com, ip: 40.107.21.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTSVxZhiqa8/6s3qAk9VkjUg7JoeaVQr1L0KrVkVr24p6z9Z4GzGH3TMYwD0IDgLo/ZHdSN8hBlFb7SgLVtJDHVhDwTQRzG2jhWLTp8shi/YsUh/mDP2fAgGE1qh92frq6/FmJe99NCIa0K7YyOALzJcK/efR6IwtGEnUeyfQZOJzz1Qzt97On9goUMmbGD43QKWk3LOAGtS9C5slTAdC1hGnA0ilR/C6m65HyMo5mtnd3Xi467+2UQEreiKahK+hGnCDGFnkYPQ7o2VWq3Ea+bb1saBsNx6qyUzWdx7MlRUYJUrwbJtkI7BdDiBRNcw9HtkzBU+KdUA4Dfb83VKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8wqkzTy/ZWGZ+9JL9SFr8USqhVJBWNY6d1JKakxYDc=;
 b=uLYIsa2WMn4tVeL24JKI1PUTZzPHU9n2viL565Q+ythknZO6XhEiISK7pWO6p1sf26kKMoPEVjQ5gLgC9/aMsyCbg9w+OdoLJOFI3popbYHGL2Rk54MMUZCs0hb3u3z51wBeWzamPwZIPMKid9naYQWGGVRjCrfJzYw1D2g1a9nMmrnEcq11Uei1pPjNsgJ23kDEQ0Tk7sUFkQYFTJvepstGZexUgmRz21DyXUGpbjphgBxR3KNlyzyWNn0+DGau4mv1swKbc5Z+TCcd82FH2l2Ta1fWwuCRwTdNGF4fEyW9+nDcXvMUeYWTCfiSHnGGLANFh8GU5E2FUD2OUyhHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8wqkzTy/ZWGZ+9JL9SFr8USqhVJBWNY6d1JKakxYDc=;
 b=GLrDxYcKBnyMVBswK4WfJGhshoae2tn/DI4qzpPcS+mHHnf6to8t+OFrwjv4oh9L9BzD1X1K0SQQWAhPhO5T+JH98wOALLaUKhHibZK+vo7XRbrGY7QQo/vw7b2aeDm50pmUfQ4+GVSBtyc/38r8akNOFxZAzdtUkaOhed+A9ZQ=
Received: from AS9PR06CA0453.eurprd06.prod.outlook.com (2603:10a6:20b:49a::7)
 by AS2PR02MB9462.eurprd02.prod.outlook.com (2603:10a6:20b:59d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:10:08 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:49a:cafe::6c) by AS9PR06CA0453.outlook.office365.com
 (2603:10a6:20b:49a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Tue,
 11 Feb 2025 00:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:10:08 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:10:06 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id ECFCD1CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0A60L4178995
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0A6nA4178994
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:10:06 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][meta-oe][PATCH 3/5] lvm2: Remove a lingering reference to ${PN}-udevrules
Date: Tue, 11 Feb 2025 01:09:56 +0100
Message-ID: <20250211000958.4178887-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250211000958.4178887-1-pkj@axis.com>
References: <20250211000958.4178887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|AS2PR02MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbb3eb4-6096-4819-a574-08dd4a3071c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eqDdINIror9alAwSNoWb+EIXHq8++7XFaR+WuETVkV6J+yykbnZcLcJ/srDG?=
 =?us-ascii?Q?+7L3H64/kD0ojRLXBrfiNUN/ehwNCVMGh7GK2h9/rmORhqTuCakqVqSD35EL?=
 =?us-ascii?Q?VmpLab34E9Ikx69s14buINIkBLomTjZK/cA9ZDQPsCyHT01gEfWnHsPsAXMI?=
 =?us-ascii?Q?rgyoPH4lO1p9+FocheXDyCc8GBXMkREcocEgK4sx+ptZfn7Nfyzxktegxa9l?=
 =?us-ascii?Q?QSLzwwtBaOKq8je73UWrZPkMe/sT6SDLIgCRjnfxkDT0ATwKn0NrtPRhuoNd?=
 =?us-ascii?Q?Vlsgh6xAQKmJvIPHGWIVdvs0BobO5lgEEr0F+Klb5dQwlukwIA1uV3h+kMTq?=
 =?us-ascii?Q?o8ksmsnFWXoc94v1K3gB0e91X8EcLVHvzLTEPZ1MGtEasOeDy6cE8eGAUKft?=
 =?us-ascii?Q?hEZunmswF3pxnU7hPhbDP+gqA1sUT1Hg1Rxt7JtxodEzuzXVEoYEV8hjI4wZ?=
 =?us-ascii?Q?bSuAcHIx6iLaQN9WP0yw5zPMI2WH1Ho8zNEjAkhrr1vZ+VDaWjmuTXG0VZaX?=
 =?us-ascii?Q?LaklU5pF/nLnaNhXCHlYudaYhzIu9LQK2JjZj+wIYWgynshOWecxJtqvev9J?=
 =?us-ascii?Q?iCG2j7QVf8X53o0WVOQtBuLQZrFk8gRl8pHLLi41+78UoN8rfwliIEQ6F20X?=
 =?us-ascii?Q?F7AlZrSF80vMTAVE2SLCd3WnOa/oYM4P3JmiMWM+jzryIleBwirM3lYa0HhT?=
 =?us-ascii?Q?yPaiOsxxoYoCzsJJ/An/9mXMoiRzQqTvGEgleSVbBdyBVs0FWtFxan0Ia/ug?=
 =?us-ascii?Q?NF4Qxs47sMYv5twzyQPzhlE726s80skcfUf1aErZCI7TouhWcuwe+RxGN+pk?=
 =?us-ascii?Q?80z35iJhrYbCYsqauwJHXAkySY1nqhebX7MUjhO0HGTgzMs2e39waX5jJ540?=
 =?us-ascii?Q?4br4p/wIcflAPjwr7CzTXvDwzisT6g1VAPkImvK0Re/ueQi8PyJfsiPqCbOL?=
 =?us-ascii?Q?36gZISz38upzhhkQIlCYTHQsqqvH6w/sL+4AYSBH832Gag66IltcAqbccxgX?=
 =?us-ascii?Q?HUNsq48Y/hmwLMLGLgCnTyD5TYZINlscHhHB0faBddAHKcBEDE4BgRDC2OFE?=
 =?us-ascii?Q?7xE0L32qtePeH7zEaW7MNLefezrfy+4z0+8RID2Q7w9QcIcmN4JMptrycqWD?=
 =?us-ascii?Q?MuoBo9flJ0QRPaOR2uLKzOn2kZhe8tl0uXE/x2LjhqUfle7nyt8GxXLVIddp?=
 =?us-ascii?Q?As/qXf3/eQkG9/3l41O2WE/CpaSb9WeYqUVqMQUO8Yodv6xBbGAz/RpgGA4g?=
 =?us-ascii?Q?0DAygPbvm1Xvioq7V4r+UwSvnMRWsxh592U2Wsrh9hycl4GRKewd480pqdrd?=
 =?us-ascii?Q?Baf7+iVIyzRgv27V3EtoRCKp5eRyk0x1Tmo037xK1eIYgiLkNLIesxX3UbUI?=
 =?us-ascii?Q?hseYeg5v6uXhOEYm8PV88OzdyKTJCKG+IoBoEeD5cOP44oggAtbpHM979UiK?=
 =?us-ascii?Q?DVqUDzVILDOsF8m7HJ8uu2LJ3U6/4P05RQNUpEwXFB9otZLTnREJGoF9aH1G?=
 =?us-ascii?Q?dqW03I0jG+DHdzI=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:10:08.3870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbb3eb4-6096-4819-a574-08dd4a3071c8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9462
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115416

The lvm2-udevrules package has not actually been created since commit
5d54a52fbeb69dba7b8ae11db98af4813951fa61.

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

