Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9B5F53D8C
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 19:16:51 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59094.1773688609539006018
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 12:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=tXSu4cmW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.30, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwzGy6Hty65svjhntRAh+o2SQ1qMyKKJqmbgDtbKw3AX8FejV+VJwfWriv9/7RSneJEc+URfGqCRUd/FfGekBbw3LB7bghfvRtE4km0p/XSpazZlPJ4mOjYP/9DatG68SYNkrEFV5RwxcFVETwbV+J3hAZjmVG6mZl6/brBqb/3C+3Facx5+EMIHjDqOwO33xFsOcib6zIhU0zGzP5NxmEskC83sdt+QTjtLceAsdGjbzkDiFrM2ix6YEhHM98i9+1EaYLN1bxzxAjDdKjdbMPdeS6AzwzNQLHG43i8LQjrn9D0/1qyeUgAM9roJHu7XW0lPTzTcKhBg2RAhkrMRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id95PPIqLrh3sUPPeNwUa03lHI3NcjOgfYm6Rb23bEI=;
 b=a6J+4aEuBQ3bzrtjPNyoTWALOVZWA6aH+wtqT9TZaosinTl4SIob+CH83AeIaVv99VtTqGfB/oCVLLc+kZ6cfuMbWzpcjV1atigsRS+Yboxnont4ELIDfyfbgupTJPmkksN5cRg9vOHJfEdCuVMCkcmX24h4zqKXGz0JubflADTczW3ilmHdQ5PsjZyDnS8FxDfUPhpstCHqBFhykBvRkmhkfd0K0Y6rMJnc/sCX2Q/xyx0vSqLu0OdTEsAKGxOsIz9nBtYYQzl/kkueNgRZEdIsP6JGAzJ+EYQJtqNF+JwRYHCPpUj5Epodm96qLqFyH4lJ5ANNs4HDU/NzSwVH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id95PPIqLrh3sUPPeNwUa03lHI3NcjOgfYm6Rb23bEI=;
 b=tXSu4cmWyYQeTkI7ZyBvHtYsW2zHQBwa09MojglHRXOqI3XVxMDNfNI2EZg2qNqwdpRmLP7KNIl/7KsoAg1R8DbGlUBDYoELOM1C+kIL6ZMi1FOG/CQOBUkaI1oXXodDRw7jL7vKnk/QSBite8pIkC2fsXQkADF0xuhO43e2ueI=
Received: from PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::9)
 by BN0PR10MB4965.namprd10.prod.outlook.com (2603:10b6:408:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 19:16:44 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:32d:cafe::1) by PH7P220CA0098.outlook.office365.com
 (2603:10b6:510:32d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Mon,
 16 Mar 2026 19:16:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 19:16:42 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 14:16:42 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 14:16:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 14:16:42 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GJGgLX1816225;
	Mon, 16 Mar 2026 14:16:42 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Mar 2026 14:16:42 -0500
Message-ID: <DH4G4V56CMNZ.3IXBQC7P2RTXI@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH 0/2] sessions: update recipes for emptty
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <189B999485293477.1328210@lists.openembedded.org>
In-Reply-To: <189B999485293477.1328210@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|BN0PR10MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: e6045bde-4636-4e4f-9dda-08de83908eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6JiketBUY1906fvAQCDRrOLFobgX/Di8ObrbXEFVN2xapbPiGCcEeHTlOacHPh9cbFxmbxWIekkvA066n4jthTb1UX6k56sadn3xmpKpvqvBbEuLN48ZZRHFWHm7wmsNxkwc/mcJZRHbOpCbcRffsHuXVbPvs3i2GlaCf/2aohYQzsGJSKqz/Xzw4Kse92pYKUvL7SB3lEKRHZmh0AxEjfGI7gsZmNHd8peZHi5ZMwvqKM8g7inPcdbbW9/rcyJ5LUrBU0V/VHqcdB2QY3THtNX6fb3VSfLJ10pB8EVey9LUoT35vpd4ANPsIXGXY0L5BkaOKm4aYfY5tkz6a+DPcOCeTSLRRQAe0fARkdtOmscKe5bnNLqPwYHtJKNvhEqDxxPYYZyxGO/fjBZjV+2lJoE+hM3F1tsYBgnFDRhMzsEhDNT8Hhho1rz1f2A1T7GJx/hzqMYxJ42zmkgPb3/cqPiYFdRaSSrqFmQKQRR4h6R0IaKnrDtc2KjDQOoY5vEo/KUUt5K0O2NNifEf1kn17deLOAWwDh3QMkv9KuFeyEKfF29dpxI5YLCCkGtyxuOyTELwxzkrDttD2yPYzPSYBIoAS8CWsOrkJ5BAyfMETtNt0UnYvlBVRnskgQLpJ0vIQRolcf/prMcElo+/I6PJ8Z9iS+pXExXuTH29mAm5OdxNMd2tFkZNzdRYLjy8lVczksUlTMwEW9spfDGhI7CBYN9fBuJPZFPzyWpUSk/Z5qiovFMWE9puaM6RB91CRvhjLBmFhA31wOEMX3af6WV/MA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CoaH51BYOQ61laSyZJArtpn6yUWktbt5iJ+V8EvwPtwErEQY/m7C5QxC5gvyYeEB42ZEZmfDzTupACChmyPCiIRtMYjS+R3L64xlt9c+2sWsX3PNwwhBbqBFIfbc63imYqgbOEU0XZfm0RD2JGwVwlYSE6xq70SYTyvQ6m0XvkVlDOjVUN/6jJwo2GuhUjqi8pbdhOnfzGAfcWi2nVZBjNFANBrOB8l0Qrpse28WOowgxT9cuEnQsdUZHkflIVS/LvB9ftBjj7Dxyvpvx+bVVlBGq4wBLJdcDle5SGblDEe1SNe2uIgvGaQGVSDNzljKgt0LJYFllWmC7lUD/B2gzbug6qkwwNjjAnD2CaW1FoDP0Xw3QBjjdbxbBwe75ZSY6QUXOELEHO4ePVIQ2YqnqmW2qu3GciK9UTttvzWxTWf+IKarFJ0gPRcu+AvO0w8r
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 19:16:42.8697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6045bde-4636-4e4f-9dda-08de83908eea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4965
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 19:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125283

On Tue Mar 10, 2026 at 4:55 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> The x-session-manager alternative link has been removed. Instead a distro=
 should
> choose what the default session is by using the DEFAULT_SESSION variable =
of
> xserver-nodm-init.
>
> If the default session cannot be found the user will be presented with a
> menu to pick the session themselves. Some of these sessions already provi=
ded
> their own desktop entries, others needed one to be added.
>
> All required recipe changes have been made, with the only major user faci=
ng
> change being that a session will not be automatically selected. It's up t=
o them
> to decide at runtime, with a distro override, or with local.conf override=
.
>
> This series has a dependency on the emptty series in oe-core.
>
> Randolph Sapp (2):
>   openbox: update for emptty
>   icewm: update for emptty
>
>  meta-oe/recipes-extended/icewm/icewm_3.8.2.bb     |  6 +-----
>  .../openbox/files/openbox.desktop                 |  6 ++++++
>  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 15 +++++++++++----
>  3 files changed, 18 insertions(+), 9 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/openbox/files/openbox.deskto=
p
>
> --
> 2.53.0

The required emptty series was removed from oe-core master-next. Please hol=
d off
on taking these patches for now.

Randolph

