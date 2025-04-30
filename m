Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7607AC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 11:45:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.14915.1746013525545213505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 04:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qBRz1JlH;
 spf=pass (domain: axis.com, ip: 40.107.20.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibvGjWEgGpwc5p1c2e0Wy+punqMtXiHdz3DM5YBthNQhN1OOkBjjuYBV3JUWN6V/7Bqj5godXN+4ku/r7AfhdbRzW6bk0tPz4CAzR8ijw7MjED5AgHEqo6aY9KORPo87zMHRYyRzVZsCTYRLITVkrJ4tAHzC/fd49NMNqyhW1NuCkcBrHl+tYBMEs1UA+AbpAg9rHRZqbaiVD/i0Yb7aVRnSk+fXsscDKEl/SnDaNjyiGLYyJd8iIaHuNQHjL8atuAKaNGMHboA+0oHs5U2+eVihnvO984RrKdZHUIJ7vB6oCWlvFccMgfVzCZg7btSNieIHxbBJnG/HGMDARAGs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c98r40WxwzgJAlQZX8/CpeEtaD859qxci1yPmyRBnkU=;
 b=okgdotbXtFBnbArvKlMwF+6jFpQyVDevVI+AXZ0hz5FuD4tjLm5pPLFhNfHPBVE3r+PimU60+L0c+WuiF8fgm/ixkr5yC05X20665JWNXDv07MgG5MmWImFiBYy/r0l5zcnSJUPuHAAbw9GjkWd5kJGK42uoYvrmVvVprevVB9fm+4F2sP4FHjgR4Hq6pD2Us6fQHIxPwV4iynWCckTD9+m5mak+9mFqiWM6r01/re+8jPZMdYk8eMeg5ckRAbrkHZyPZB9+h7hGBOHE9oWKhaqykXpjSdntBFAbxuG9T9uApgWG6Uhy2nANSYX3bmon58YzVM8dUFQDQST1MwCaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c98r40WxwzgJAlQZX8/CpeEtaD859qxci1yPmyRBnkU=;
 b=qBRz1JlHKpsNg2vCjMrGP8Asn2K9ujnAuZ/bJa4S3i8iDhqPfB/3KL20zZnimRFh9a+S5Ya1x8PYwM+CVwTnMuuG5ABf4d5V8FeqxvPGeBUzsF4Y01BfL0aOPGw/FXrrRjG2o7+kBu8Z9WRXpz2rkcVmJIkT9oRkvmZdWtfUC0c=
Received: from AS4P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::8)
 by AS2PR02MB9365.eurprd02.prod.outlook.com (2603:10a6:20b:57b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.17; Wed, 30 Apr
 2025 11:45:21 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::c9) by AS4P189CA0016.outlook.office365.com
 (2603:10a6:20b:5db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 11:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 11:45:20 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 30 Apr
 2025 13:45:20 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 30 Apr 2025 13:45:20 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 21DE695F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:45:20 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53UBjKPH3000910
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:45:20 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53UBjJNX3000909
	for openembedded-devel@lists.openembedded.org; Wed, 30 Apr 2025 13:45:19 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][walnascar][PATCH] pipewire: Avoid having pipewire-native depend on pipewire
Date: Wed, 30 Apr 2025 13:45:17 +0200
Message-ID: <20250430114517.3000888-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|AS2PR02MB9365:EE_
X-MS-Office365-Filtering-Correlation-Id: f5443460-2c53-483e-7dc9-08dd87dc7c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FRBS2ucOAK6nWLSBhyFr6KghCm4zicca6H4rOc48pH2I5n70XCrxtgMTAkjn?=
 =?us-ascii?Q?X0QLIJXvjveJnxoXpWRi1ZL/Suigda4/1Rb03lO09NM5RVuAxNXUJncaMjTg?=
 =?us-ascii?Q?ajKvDi43BZQxPj9MqHY+baiRLhmY6YkjNQe6lYvhwOYA3+kDKjNRkdLl9lmQ?=
 =?us-ascii?Q?cF35t0yKL/P2d8G7LmY7Ac7gyEvGBs6QpTOpFCcVCaiH/scmlEvMUmmfMaeC?=
 =?us-ascii?Q?kDejbehguPOZkpks1c6v98dRJZ0efeGhSGJojUOt0b/OXjW0fbtw8ZeAVFM6?=
 =?us-ascii?Q?aWpo7d5Su0gYqNlaBFHrnEtO+DPLfWj8coW3WUWY3STyZ8C0mhY29Qlg8Ih2?=
 =?us-ascii?Q?PLWEdwA3m2BhguzWynUOx64McHXpqTVYUbgopABQcBBqc06oFcXayb3i1lVY?=
 =?us-ascii?Q?Ms8FiaV0CpYq0yYad/nCx2p3Mgfgj0pAMzyBVdQVslCPos8PGH0g72EJ8Gvy?=
 =?us-ascii?Q?P/OtFIzNhip0q6cb/svVOmuo13toQvv3nE3v3PjxPW9mGBRrCdRp7g3rss3/?=
 =?us-ascii?Q?rVsjU4l3IahUjPKW0av7O/tS9m8XVPwn5siXGlokipTv4qR6pY1FtOW8J3sk?=
 =?us-ascii?Q?KsupG4MqSDSXW9FF6smlVH6K+/1gqNDeUCK2WDG93RbRgU4HFZ5nCjT+K5le?=
 =?us-ascii?Q?JNP7OByK4gvjV0hm21PMT+2VFrz4OqYq3qbPYFDPtqSimg6uG8fOsd+4C2aZ?=
 =?us-ascii?Q?CHNl6U8AglnzqHE3WjK2Lx0xlNweYFn1sOtx2nOcNxMUQ9KXh0L8hC0f20i/?=
 =?us-ascii?Q?GBf7IeaS40+pUJfUdQY05oOL8ene3Q3k3e2YNFUeG/ZelZ0rgplFXFfrdKKS?=
 =?us-ascii?Q?YDmjSS62zMDsyvMEUBGmtsc9xz6kkLOeCBF3dQwFfz6dbp2y7pg2XQTYPS2N?=
 =?us-ascii?Q?NiD8/ToEGnXH5mMZgvuJ/9Gym5f/UfGUAQT7wlef3C+s6q+lD50p3sYyUMfn?=
 =?us-ascii?Q?7T8k+mafZzlNsCENpAdW8P0VKwWe79IEpNC4+2vW5rVKlfuhNWk6/aZX3/1G?=
 =?us-ascii?Q?/ZcEASEY9qbDG1dfzfzNCvtgwJ7R45Jn6SwVS7H/HIgXAGTNk7PdTS4h+oRG?=
 =?us-ascii?Q?kketSqTKIQqKWuUeT069IrtXnWFOVCk8aPtk8IeJZyVc9GkxVFW57jwu/a2u?=
 =?us-ascii?Q?MQ8a+ZTabZOkHVGspw3LgRgoTlqvsI7dRybzlmQnaX1Pg3OuFj18Sgpfg7JJ?=
 =?us-ascii?Q?cYmu/an+lGLRSD2GxavTW38C+Iy/q5toqH9u8jpcuoB1Exj/eWq0otpc3VqM?=
 =?us-ascii?Q?v0CwEHjiCKYY8xQQEQNuL49kG315aHBTpHkzF3Kl1a88j+wtrb5OLuP6F8Nc?=
 =?us-ascii?Q?d73appOEDsoTPgmwFvup59ovQw40dn6ajEZ6BFG1SGFZleysaQO9ywui1Rr8?=
 =?us-ascii?Q?0icDzENR7EwGkdfrPXcfhba5yYsHQtPTld7ei8QA5Hsrlo/F937XLIemhgvy?=
 =?us-ascii?Q?OHiSQgGKeCrKYBz/mu4/iPeg98x5ZGpsaUUM5zJ8U9fqJcfnYcnBkLssN6jG?=
 =?us-ascii?Q?sZlQZGb15qnnt5CJi1sJPZsxZE/Auja4o7eo?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 11:45:20.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5443460-2c53-483e-7dc9-08dd87dc7c59
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9365
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 11:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117250

Make pipewire-pulse only depend on pipewire-modules-protocol-pulse for
target. Otherwise the magic behind BBCLASSEXTEND and PACKAGES_DYNAMIC
results in pipewire-native ending up depending on pipewire (for target).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
index 122f8fc4ec..039087e3cf 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
@@ -334,7 +334,9 @@ FILES:${PN}-pulse =3D " \
     ${systemd_user_unitdir}/pipewire-pulse.* \
     ${bindir}/pipewire-pulse \
 "
-RDEPENDS:${PN}-pulse +=3D " \
+# This uses :append:class-target rather than +=3D to avoid a dependency fr=
om
+# pipewire-native to pipewire.
+RDEPENDS:${PN}-pulse:append:class-target =3D " \
     ${PN}-modules-protocol-pulse \
 "
=20

