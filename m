Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2ACFD2D9D
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 21:55:49 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6924.1773179741368083444
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 14:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=J8VLGHS3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.30, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVAGjmG8426HmbfmqGbJpLLNO/i/fhN2o3nqKInHpgwgmNX9Op9ux77owKPqBnUarF0L8s3zYgyOAAeoKIMxdsHitlNHz4Okl8zls8MSxHtpVmPraBbDtf+NJfLkn3WJMFRkhTT0Pz9DasgXo/xA9wYSKdX5a/tljhBcP3fDnxku207CvKqleksPTJe13yR3Wjqd/KLcnmJCDWOLQo42A/KRsDLmq+bTl5dpnGEPnhoARJ/77PT4UAYyPP69lILvLgvkJr2Ibkm0CJPW/YHnhw64Uv4Gu1aKflW8Yne2logVz6iauRq8vk14tqHHUQa4WT5JSy8TNNtTuISqxmEw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GY43a7R1syy03j8ztsudfaHyDfkw4IkL9VfDQPV7nE=;
 b=AILxctQiwGd2kMeoGXc1UQnoRUcwvwI1IiMwHanB0pBr0uN7WMqLpat64KYs3i7D0t7NnsRQZiDFCLrW/EzvSap7vaDJVnZfJ0dRieNF3tZ50+HD0ZtLZUs7REBdsB2umMiG3VkJmsHCSXhMZfismo8yGggvzitJamtET3Kd91WAxpTxn74EYqm4iaSNtPUil7ID6T03pU/7sa97hHlBRBBy2+WYSD7N5YevLC/jkDo65UMDHc+VreFyeuciNUxoHvy3zpBsPUSVK5eEE/ltzh9LStiHjtmuy+6tgJZzGcPp3362kamOiorkRE1Ozxx7D19zymaxWBqQXN7SFMu70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GY43a7R1syy03j8ztsudfaHyDfkw4IkL9VfDQPV7nE=;
 b=J8VLGHS30nF8qOLndsTS0ScJh7FsKhXtqwyBHCyrPRzNI4NiJe9c2mYyMBWZ2md4x3CpFINKyEMHM7TlhL3mPciM3lzTrXXrZs6alBWSl05H5hsZynU+tYBqCMm3cai/+gckfSnQX34VE3LJcuI2CnxTXWCOG9Ze6Xs1+OBtFP4=
Received: from CY5P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::17) by
 SJ2PR10MB7598.namprd10.prod.outlook.com (2603:10b6:a03:540::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 21:55:39 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::79) by CY5P221CA0005.outlook.office365.com
 (2603:10b6:930:b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 21:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 21:55:36 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 16:55:36 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ALtZVa3849728;
	Tue, 10 Mar 2026 16:55:36 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 0/2] sessions: update recipes for emptty
Date: Tue, 10 Mar 2026 16:55:20 -0500
Message-ID: <20260310215522.2836352-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SJ2PR10MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3c58bb-3233-4e7c-cf2e-08de7eefc30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	V5PGYZ8n2Y+iZ+uIsn/ZdefA0DhXWNRNNIyv0hIm+uoraOgoBv1H7qNBSlxPbaXXsx5STY6ZuUajtLC4tYO64mMTFl/6GWPuyNmCU2mG2as4o3bTwEP+H7rYrGo4kSKW8tigQRXYif/IFkVMTbBl52T3w0PvWKErd9pqLFlhyTDcDCwHksA/Wp1XCDl3xxvoUf16/LHZFdpD98dVwDi6XgPyykWbjS8BbXNDsF5lMOkkHeOPaakNiwIkrdnmXGkH516/nvYjwapZCcbUj/BOZE16vxdE0o8PM4nLmNuy3LgLKokzP2o+8Ffpm5gVeAOe4NyKWeKpSE7/rwG6+Xbn7vM4hQSu42lXXEm9ph6fAVw6WqePinVTyAecmyTyJl8QSeQP+mQqODc00g4vfj389HyCel4c0O2uzn4CqaLs79aOTy00p36DC99I9VUB6/ogU+U0I++dYmRe/G122popC4jYIhiNHi7QtftNbr/ma+RylWUi0lZWHnrIeZdq434ZJrUYlV6yKMzq8k6cqjyGWNQCbZYJV+yQnQ8VowxcpUpuXnwPPCOZ9QvJDkOhQrdRoCdRmsZSEhsgGG//hDjytZwjF3l8kKTywLAMKiQaBAd1gIn1tA6TgGeQxcOm3aQLCTBu/PIYjyWmQ69CRXIAL3UBFqGlRR0JeYIFitRhupKu/7F6ayzQgrAGUzLXB3DCB/wbXCNsRWWtFy721QKnj61We+ZKzTN8GBHqyGkcjv6hjIn6r6hJ7nQqqgJGjOBWgfhlucYVZqnnB8tz11/QeQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CpUI9IjIWJEDUnGlVHV1my4trebl2JOpC2l1dSvFSj6GgUhauaPb2E1tSnvQEnWwQDoD+odhSgfPunXQqg7xBt+QDe26XrEMdVO17ngc96uEHZeeA0LMk4MpdyFZcyxJSUfYPhWfNK7Ffuv1ccrjmh+fNcf8pzqMOBqntBsgD4K/448Vd5gyZyzohAzAgB2Zex4WmEiRaQrZo98jFTsloYdRxy9vw5FOUeeuL8tPTr15ZKFUrQ+heWEUDckaczC640eHDocoV7UX5kQjKCaL/z0hCbodWGjN55SKZXyniNyctN6uhHELZ4NaOHVGbUCb++UgKCv6M4F288l4pK62CAYoOTrU+6zI/xe5uOEcGKH11WeCFliGcsPyNT0l53/HZzN8EDwX26RRWFDcgrOwlbs4/MO4K6D0Hxec5EpTKE8Foj2VbRsgOIp01RQL2qz1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:55:36.6974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3c58bb-3233-4e7c-cf2e-08de7eefc30c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 21:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125043

From: Randolph Sapp <rs@ti.com>

The x-session-manager alternative link has been removed. Instead a distro s=
hould
choose what the default session is by using the DEFAULT_SESSION variable of
xserver-nodm-init.

If the default session cannot be found the user will be presented with a
menu to pick the session themselves. Some of these sessions already provide=
d
their own desktop entries, others needed one to be added.

All required recipe changes have been made, with the only major user facing
change being that a session will not be automatically selected. It's up to =
them
to decide at runtime, with a distro override, or with local.conf override.

This series has a dependency on the emptty series in oe-core.

Randolph Sapp (2):
  openbox: update for emptty
  icewm: update for emptty

 meta-oe/recipes-extended/icewm/icewm_3.8.2.bb     |  6 +-----
 .../openbox/files/openbox.desktop                 |  6 ++++++
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 15 +++++++++++----
 3 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/openbox.desktop

--
2.53.0


