Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1215CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:16:11 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.784.1780413369776236934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pCWunJnQ;
 spf=pass (domain: ti.com, ip: 52.101.53.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5AFeUrGvgvxficMGZn2W6CfBfFnma7m83E7MK95XOw2gXFNRo2WXGApRV5YUnzUR5/4BS+iZqoelkf3sim6//n0rCt03EaRUoVLdKVHLebWD4MXAplm2bFAD35ByRwsujEzcDFZaJDK6pOXR1nHgFzoY7hxvnTLurDYA7x6zgnJrhi+WHKtpwxdagvrD+LrosZV5BBxNch26Z4087ZXWj4LnOG7bwJsyhDrEYP7jV1rCbo77staU8SP60RtOnzE2XE9SjMdsOE+vCD0E0CHWDjbWhJ5voNEZWBNFrX9lsCQWPNZXvBlcdfhFglT5rduf4Bc9zZI23cmKgWJRiD4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky7Gj1gauS8GlNRXdRegftkQWIVJoscFvW/bjTjxWxE=;
 b=YVbU808nX8leAmvOtPnPBue4+WmYOPe84E9pt1GoaPRccyM3xbYb23r8JR5jFh9IbacCdrc4hXkdWwwXA2LImHixMmJvxwRziq9MwtI6qvnReN55hYuZ+udhlWkOjUCKOI3SJFLTsgW6jaL802W/XJ5VO5Am3SIMAA9v5y9PrvFvJ5I+eUjzXDcZsL0ISgK+rrpQKxwjdmlPxBhc6W1JaRnGH1Cz40c8ekKb05AaHtTEA0BJ8odcdkLdxooVCi04n8nnpImctWOQ+zyscugO3gbvjgagkq7BRmjoKJ2zCgu6h2gepMjKx828tzFHooncEnek23kf/Gf3MtCe8JEDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky7Gj1gauS8GlNRXdRegftkQWIVJoscFvW/bjTjxWxE=;
 b=pCWunJnQsvoCWcVlxKqnPInm/xTz7EQENsAp+yvJ7UY8d8keIH+gLeWH1xuZMimMxt/HRLkrbfM5a3aK4p1p5IpNuho52wCKPbSVKKVLalnqQszemjcA3X21uSzdTNySMD2l9P+Lk+0unxDceuxA6cPIk7Fk14GDz6FlEt2D1gI=
Received: from BL1P223CA0038.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::7)
 by SJ0PR10MB5598.namprd10.prod.outlook.com (2603:10b6:a03:3d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 15:16:04 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:5b6:cafe::7f) by BL1P223CA0038.outlook.office365.com
 (2603:10b6:208:5b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 15:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 15:16:02 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 10:15:31 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 10:15:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 10:15:30 -0500
Received: from [10.249.32.125] ([10.249.32.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652FFUBt4010264;
	Tue, 2 Jun 2026 10:15:30 -0500
Message-ID: <b1e3711a-d31d-43e2-b14e-fa437fa74ef2@ti.com>
Date: Tue, 2 Jun 2026 10:15:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libcamera: add workaround to fix build with
 gcc 16
To: <f_l_k@t-online.de>, <openembedded-devel@lists.openembedded.org>
References: <20260530073155.1588404-1-f_l_k@t-online.de>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260530073155.1588404-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SJ0PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1446f6f5-610f-41a2-5bd8-08dec0b9dc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|82310400026|36860700016|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ExsY2XiAIVfIF/pp17aIpEzlBRwybQRQCrBJn6cuxM5gQZQE7YA5UChoYF03LGxz1/Lb7131C/NRUyE01cxs/qmX1qJGvuIOU1xojIpSHR+sBocx4FGbD1oNGvTsduYecwB26m5aS0kULCFq1f50md3pZxkCO49c+Hb+8yxZWXGp2ura90yotwSZrbku7GhPXC/cwZJQA4RPvle1/3Fic6AH1wipv2OspVKe/3OoxQo0T4qs1xRCaMvs5xB3SHCisfEikSq4/t/8XwgfUsgdoNmTwQf2SEZO5GQO8rVLlhTcLX/p7bpwIwrTM0D7dVRJMptyGiCNkr778WSQlAPnQM/wiI45Ki8zNJ4QBZFq8gw5oTZ1K5c3iTXA27/F4pnZvAO8hhOQD9p1QT16uilqqhqVjf53usPNTilGwYXQeNgsoKH6oraqtg/P+rz9nB13/mDrEiHpedQRvxQpyrFVdB2NjDCCVPWWkfnlSHXxQ30O+hD2IRegHVJgcvykCdcghHPoP3nFdaCtMODQwu3DCM48yTaVlbkvDFm5bJ8pvOkcIhS34gu/n2mFLcVqHX3RASEHP+gCw2+52aCIQDv4eE0351OCTR0WZMuliJqzDOMM9uL3wzRasCDy7rlilcZI882Fi5WZexGxB3At3hb7B8Qy2S4ciNYBHAD9ZBSpgy1RVi4YgI1G5iSSkr1Wt/BFbFkKEvZGtX8dRxQnszrTomCMB7xqaM8ksrfK2t4d1t0=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(82310400026)(36860700016)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	F3K1YfOkSwV1yWptrGEdNGGEf+aeV3e/X2YpmBFHkRinlKIkXgOEWceMYYXfNLsXHNxaBFNiM6TKN2r5WKIQgzcO8snO7BI7UH1ZkROntucZfSybi/X21FORKXKKzAA7V6rltkmAVUuHr/CBW5vqQDeMbHU2y6dPJdaWc3238z7nPSCr42+cAooW9wzGjjMf/bf29y4ZsHYU87lY5D0JpPjXQQnlG5mtBjDKz2Oi2IXP2x85CmcG8OK0P1jMZU74A3K+fiykROTVe+BhDVVfwyYkPDTrH7Zlm3xMjf4UPaw9vYSU76V5W9OnC2zZXrgs6rPlCgbEgXlRjpMDbJUJ9feE9CoqiTUbzl3fUovwtHzdYCFFzxUzCilhtjuRzpJsGigbPQibE8ms8I2BAuNCEGO0mZ2R89mNBW5xZIPx1/zbAoW6X6Qkkt0B9KOSQ796
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 15:16:02.6912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1446f6f5-610f-41a2-5bd8-08dec0b9dc25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127361


Not sure if the maintainers want to go in this direction but I've tested 
this patch and it fixes the build issue.

Tested-by: Ryan Eatmon <reatmon@ti.com>


On 5/30/2026 2:31 AM, Markus Volk via lists.openembedded.org wrote:
> libcamera fails if using gcc16 with -Werror=array-bounds=
> 
> Ignore this issue for now until it is properly fixed
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> index 74cb910417..9be439fdf1 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> @@ -100,3 +100,5 @@ FILES:${PN}-pycamera = "${PYTHON_SITEPACKAGES_DIR}/libcamera"
>   GLIBC_64BIT_TIME_FLAGS = ""
>   
>   INSANE_SKIP += "32bit-time"
> +
> +CXXFLAGS += "-Wno-error=array-bounds="
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127294): https://lists.openembedded.org/g/openembedded-devel/message/127294
> Mute This Topic: https://lists.openembedded.org/mt/119559335/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

