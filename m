Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.60])
 by mx.groups.io with SMTP id smtpd.web11.20993.1605682585737347056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 22:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WqSumU6B;
 spf=pass (domain: windriver.com, ip: 40.107.243.60, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvL/9Z881L0cPWNij5ohH+7S78KmN7YsRHrB/SK7pz5QVomg6iT2ZCdkmcrx9cd+QofVDNdYcmMJGJWeuEl8Jyock6JFCCBL5oOXcXWp3hoYuHTUAHWbPazicXlzG83QPuixz7zGdWC6d00EozYs5qXH2qUDAp3TQksldMomDkAhkK7xUGBIPDTbn4OiMEcyYyH67Dumxpd6tsiUBtH3iHOcg1rXPRMV6IM/5pZq9leITj7CU8WMEmEMEtYw9b6OPUAqTJdObzUQ/pUWm7GUyXDAHrF21ziMDqNPOAiKdkS7ylGa/8ipo3jcobbpS8VIquwKoIFtNqW3BRw0F0esbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVbTcuvKmHyHWSa1ozsnKQpWA5vaIcsZ/n6+5RavBBk=;
 b=NkTpsC3sczgqYkCqgRuBc1LATpe4sS4FIw78miljLvb1m4tqevH/a7IyDGTfwCzi/1lYPmGS2ChoWiUAVNbeNUA+fmPcxODSbbX6Fv1ypAqGbM9cTqXeu48tVkBLoe+iuvcjC3vI/lmUDML56E8p5ZbCPOxkNmHN/G4KMQJx20Ihi6dw5gzA6w2KHiH8P1GC/RcDqgEW12SrZEfBLJWRuDgqf5AqYQKqx4DcDrL0+O2QkGhBojXk4GX3M/BvrRkcN8KFPW3eA9Dbvpg7CCP2m8O81wexiKrZlWzoIyfte0tAf31pXScEEyI74BIr+/XhVBUYtRFvD9y1rJJGjVFl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVbTcuvKmHyHWSa1ozsnKQpWA5vaIcsZ/n6+5RavBBk=;
 b=WqSumU6BAtK9B8Id0RTE5+GaEYAATfTL9LVidR/k/yhNcj+lKPgJ5LW3rbBJ67AUfomQqMJsKrqpwlxmVVYuRSIzzYgjuCQGmq54sMKhcyKN4Fn9g45D0iDfCj0gOPm/TwldxGpx15ZNcdbw20xF75Vl0btByNSxSp/NuG2TBvc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 06:56:24 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 06:56:24 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] traceroute: set VPATH
Date: Wed, 18 Nov 2020 14:56:06 +0800
Message-Id: <20201118065606.1644-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1648843353BCDEFF.28066@lists.openembedded.org>
References: <1648843353BCDEFF.28066@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 06:56:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63819d40-5d24-43be-8219-08d88b8f1005
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5169FB12A1D63DBF701AF190F1E10@CO1PR11MB5169.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zUGNkxPEc5f1KalLac35zzz6NEikeWKFjXkCXAzoFhqlt7GHeh0XRPZj9fpBdD11IhlYO82j/7DsKvYUa0KcTmui32gXPz5zmeXPPtSpqXuHtob3539jbxghQ2kkBUlLoqRQX6uJmYqqeqCxZHqqu1hk4yaMNIIHJW6JVRDVgdtIemptF86hJa38kTxGL4EwZ9SvED5SkcN/QOgNgWdkrNSKgf74/jY4stGbB0e+3FAZGoXl3IUT2kjGpj9HkMNsIa6veo1xYl89c4MDEFy/xAeOoiqR7FTr1u9hTaHT7pqIYWmeCcDROIrd5QRX9QLtzv74ackOBs7piLezcHmpFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39840400004)(6666004)(2616005)(186003)(26005)(8676002)(956004)(6486002)(2906002)(316002)(6506007)(1076003)(9686003)(478600001)(86362001)(36756003)(6916009)(8936002)(6512007)(52116002)(66946007)(16526019)(4744005)(66476007)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	yw6wFDPWjv9evLAuznBuq1aw2Oh1QEigeKOARzLBCMQl3NWGqfIe5/9q39vngBB3BKwvniCD1ZcjnKAOh1N2BQFnbGSTcU9SLwjEiiQzMNNJCrgCIkTTMmAO42w8b3sr/KjT8R095LlrHRWRo96rJp6fRyLWqemwUenfI6MGA/a0+RyIlZq8jO4n47lKkcdRUd7An8W3DzrepZdgY3mAWzogumsM1SQsi7VGLF81S7NQc9V7munzzpp9RtrmDE2DdSZUcxX0VKkHhWtfF2bqKyvk5NPTEqo4c/V2LEHrEb1Ll6OStdlitDvKwMNiisIX/CGcQCF0ukVguQaAKydWBJMcN4051ds9EPYjsHXYaPR7IngffSPD9YM3Y2zC8Gu3nRf6BdBtpSKBed4Ptbd4o6ubwvZgjY0kBQ1TI33TI37WHhBRqKbnVmBgNmkyHalbWujeMwQK9bZNKWi6DaSwHZikZw7h0Y21tFY3MoekfB9VzOG48zojEK71vyF1WFf13A+bnGfTlY7QQeWCERJ3p88Hn9YzbZ14+gmwNfLTczmQucRxZDtSnBMwr1GdCnyz3RXA3ebdADzGoOu4Jw8PzyKAMdSVlwrWo0fzaQtW4xpAGA6d0a4vsu/+AeWZnNInMwYCZSO/c+1KpT1kFQ5Zz7vnQ5lOhWU7yDBK7VnmB6gMnVMueAa3CwmR1yZlPCFlqDmyZn69NeL2HQ9DqAldWGPYOiKueV2Sr72DgYcJTFg+o4MgEM56Cxdr1MjzdH7umjbtZmpy+xlNW1f1chPYg9eh4beIc+UNwmZq5gq18kr6UXXoDJrOt6gmsXYe4qF7oyQs8WE0wgUadKug8h5drtQ6oEPlRa4Zc9GgvELgcqgCbP4urteyOPapHVUknJS83bmrpGymozSnTJC8UQ9Evg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63819d40-5d24-43be-8219-08d88b8f1005
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 06:56:24.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNkVGuVORWJb8/4rltwT3juvrkBW8aeS7g4BNaa+09Qp32nXV1OszOAJWtxjA7RWFJJVs1DT2vqfafx9TqjRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
make[1]: *** No rule to make target '-lm', needed by 'traceroute'.  Stop.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 18930b14a..993794492 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
 SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
 
+EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
 
 do_compile() {
-- 
2.17.1

