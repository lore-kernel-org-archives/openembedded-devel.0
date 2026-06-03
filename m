Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F130CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:33:20 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21803.1780497197856726257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 07:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IuPL8q+u;
 spf=pass (domain: ti.com, ip: 52.101.85.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+U86xoD4WpiWVjk1kNAtJL/iJkkzkEROMRHLjGKGKOCHG4foaGF8br8STLRgpS8kh9Tqi+5jNkQ+YTPKxYdAzRqloSXax84iPoi3OZb4NXi2SSdSTUgYENRNsdw7IQwdNtxhOPHFz+YwRNOJjrtEKfD2ePfOe4VgJoGDsSlHAOenTYi/6BvMyvxeB5Hc+fR7X0cmgrV6PActF09wuasmgmJ6cqZeyJUkI31q/zY0ecJL8PAvhNZqkhgSzGm+k0u9P0hBZkqGr9DQulleYdZUW6kkRMnYO/ReB8fA9fKI01qEJAm3Z1uavy7MnpsOtaIt7e1rP5lLc3wuT2q8V9mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex9Bfog+rexfs5047Ix9KUF+goh4KeDnwUpiPpLnAeE=;
 b=hRb3cUvb55RnAPcP0GFohYzMRSPwEYyf5z9JsMPXNnbGTeLYWPDHiXsJmTGRBb+xG9ulLvQQVS3o4qJ87X/jWUzAx074rm+hR5Na7RDuXI3OhtZ2TVWCg9EBL1/j5pTqddtCZQXY04Ve51QPiwYGjAJjTzoEs/RJ43MBBitLrxPBnuLRfN1yUZznnfDiJDwdWR/vlYetWnsFynt3UnXXSB5a3KYQTatbFYw+VRcs/6N/eMwgscSEnDmvj00PTP/XlPE3VlsXp45uSa/DOWM0CiFo7FSZjgFm3IUY1f3phL/QrvZk0abOtyyfhREcLRSJd6NvpiGvwhrH8M1WZvtYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex9Bfog+rexfs5047Ix9KUF+goh4KeDnwUpiPpLnAeE=;
 b=IuPL8q+uS6NCa9Qp9sxt4KV5Rdh2hsgLoWfmW3Ws39D3+rMSNofLsZZAbFbMioOJtlAB36/sbQJxurxhs7L9xNVWdaN0R+ae35hHMZzWxkpyMw1dTaItSSmrA7VCidNbPIpjewXPhRBtCEQ+TV/s8mJ7EO5r7Fci862CvxSdnuU=
Received: from BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::7)
 by DS4PPF072D269AC.namprd10.prod.outlook.com (2603:10b6:f:fc00::d05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:33:14 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:59e:cafe::31) by BY1P220CA0039.outlook.office365.com
 (2603:10b6:a03:59e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 14:33:13 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 09:33:12 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 09:33:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 09:33:12 -0500
Received: from [10.249.64.7] ([10.249.64.7])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653EXCOV1922584;
	Wed, 3 Jun 2026 09:33:12 -0500
Message-ID: <b6964b4c-d28b-4630-b8bc-20c12c8d4600@ti.com>
Date: Wed, 3 Jun 2026 09:33:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][master][PATCH] ktx-software: Version change 4.4.0 ->
 5.0.0
To: <a-christidis@ti.com>, <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20260602222336.3053573-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260602222336.3053573-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DS4PPF072D269AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 8691d088-3f3d-4eda-e583-08dec17d0b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wGPpq96rxxStgXehxKLl3IzW5V66sfo/zMU/l+S5hmWUkdYN5RqpRhozaMZnzhdwDOt7J3cAM2LewVs0g7zRM0e8hZJ8Sy1L/n3rM2Mkv2lo8qHqLf3mYch/uyDvZZwsZI2coAIlVpI4AUF3M9BUvN1R4CTeSWo9rtIcq7u1qC1X+frSYCWVnS6kPOScJSIMfLKQ6G2QwUQJ/9yvDrNYu9qA60FU+OSdH4m7nxlLMfbGPLKvdzEmXrHEK8i0zAH5QCCQkbMamopdCcbaixtmpDDaOWr4qi9GydoOH/iETFBctR1inuPVYFaIkC23uAiMojl3Gb0iexOCqAg5XINB1qv4q1Qun4lGa8Ewwtuzv9LLEB3IX0P2dkrC3PGa3POL9RUCMumwhTDq+l3R/pkG5wAXGEYKfgzqXA/VunzNLWFwjZAszSRxgqoUPsr8znNJg0HwwCLJ/XUJ61nIRVmyArKZKoPNPgFDPQDOy9Rm2EVMK+x4404Ak6JFOlJjlEUWO9jb0gXLRxGbFYFS7xbQvKoEJvqZpYgqq2XW+eBVraHz3rTzm81pkaBnMHAgdVAcoxyr6TDV2SwrHO1OE70UIHk9TgkROQJxVO3BfQ6NhOyqbNVZy8F/36ApfMfv5jctuTK0znBDSFTSEz1SKfcnen5VFexZRYXInHaHhQ5KJWcjrbwVuUTUte1fsEqj0S+OIgGFA0sGoGvak4oS2MI2psvTBV95hWh7v19HOKiSGfs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RbsJKKSYbyx0G1rNGoo8OU+6oKfSITJJZpn0Ky/qcfX1w6lzYgeBdGH8+2nNeuhhZsIrNykQzk1hdLjHZS1vnfopPZAUeqcQqrA8RnOYXS0xiLgSIRnvpg8FQ3U5Zvi387nf6+mIjCsoOomBMYCchi5HAV+jkgthu0gfpRElrswbZmuh2cHSQWUQD5fiQm4xlRB83kfSgrl7ZEeimjM6fRmRfPmzN+04jsojukWm1xyDzf4xDb4xFikATfT52pCLhfhg5esiY+/BEG99qC8zum/mQLAPQJotpLZTOzm7L9MG+OP+Mo9NRfgah/0aTU/aNGq5sxChNPawpJBIehZwhqjYwDcLrRzvKAsDGuEcPl/kUW98zJFlgZilbhodWiEP8trqk7gpYNW9agny5VStEWPxVtFgD6PCg4FPdzwsNz+ohb+W9M3TLwcYUz+If78l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:33:13.7949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8691d088-3f3d-4eda-e583-08dec17d0b62
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF072D269AC
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 14:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127382


Tested-by: Ryan Eatmon <reatmon@ti.com>


On 6/2/2026 5:23 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Major 5.0.0 version update. On top of new features, this version fixes
> compilation issues with GCC 16 and C++20.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../{ktx-software_4.4.0.bb => ktx-software_5.0.0.bb}         | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb => ktx-software_5.0.0.bb} (84%)
> 
> diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> similarity index 84%
> rename from meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> rename to meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> index ae4caeb89c..ba9eaf2def 100644
> --- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> +++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> @@ -6,10 +6,11 @@ LICENSE = "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
>   	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & \
>   	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
>   
> -LIC_FILES_CHKSUM = "file://REUSE.toml;md5=45910de791d599e6ba472f6fa506f391"
> +LIC_FILES_CHKSUM = "file://REUSE.toml;md5=9f87c97ba36aab42411bf93c094a61f2"
>   
>   SRC_URI = "git://github.com/KhronosGroup/KTX-Software.git;protocol=https;branch=main;lfs=0"
> -SRCREV = "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
> +
> +SRCREV = "6269d2752ed04446c2d4749f54f3aad4f94555b5"
>   
>   inherit cmake
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

