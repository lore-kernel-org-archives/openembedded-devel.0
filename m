Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web09.14956.1616976745094473110
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=W4caSBfP;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: ben.gampe@digi.com)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171]) by mx-outbound23-158.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:12:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7j//zHjsqOzizrByCG6eE7HJl58G9+Eh30g/PHNkJ5/VNzR9n9XpGycq6WnJSprgEIGvjx9P2z5s33mBv49Miox2xz6r3+fWcnTtTVtZ2HltEHe4X5Z5iGdgsNmxZpNi1kX+XZTZqOOZdFSkk4JPq1VXuK10lrif0czcd39TIqEMMExs9Au2YFjCU6p+3vQWchM+5hyP+X/z1ZtkxfJa03VKl2xvkfQf+qJFMhH/xwVkP0f/ZdytY1wfOX7P1VX3eHG8KVN0C4n4zYGGDw1DFzp9zrKxTlJQdOW5mPdiLrbuy5/vTgFQXEaM1Gb4WiPxI9dTLN8cDKygoApHRq5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35IVLv6FfHAnoLxfJQyALh96ahmXND2W8x9cnMnhBZ4=;
 b=OOdJ01gaLj+Mk3eNx7vGTAeRPzHpmUyOecI5v8sBAU+DVUw/xHB+H9VOgYrbkEugE9H8ET2+V2sSLQ/nypq1htKhDiKHhZlpF61v/gRMVCYX5UVkGoH/Gq3uMKBzJY1RI7jruKPim0aPJ2wKRKxAtLltTgezQ7w6/AtwN+y0MDRHDYVuJgqg5rHAGWVX7ZH+8uhXHEDdxtq00y++zZiUPDdguqLIvldCjMIbMKD11LhbLqg13NIY7XIXe3SuzTiMn4i8RrIAzInKUisSWFiwV8Mnem4emOLdm0n+49KAZek4wcloou8JBqyycz6OBVfYy8vqtgQMk2vL/gaOCAUkAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35IVLv6FfHAnoLxfJQyALh96ahmXND2W8x9cnMnhBZ4=;
 b=W4caSBfPPa9H2enj/Q5dv2bjCKOHTYGVYWUjtPtykro/Y2lUokhTPLuUk3pePdaz+t08emMCF7oObl4i2zS5q/76Fz68TAmFCwCub00csE+gFTfxnf0m5DpzqlHClEQpIn0OVbY0wtA393sW75FQnBi2OA1FHhQhKmLfCaHl7wQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB4244.namprd10.prod.outlook.com (2603:10b6:a03:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 00:12:21 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:12:21 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH] python3-uvicorn: new package
Date: Mon, 29 Mar 2021 10:11:48 +1000
Message-Id: <20210329001148.2569630-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SY3PR01CA0135.ausprd01.prod.outlook.com
 (2603:10c6:0:1b::20) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SY3PR01CA0135.ausprd01.prod.outlook.com (2603:10c6:0:1b::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 00:12:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05561815-b715-45fa-c3ec-08d8f2475234
X-MS-TrafficTypeDiagnostic: BY5PR10MB4244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB42443F0104EE2007B7D587F68F7E9@BY5PR10MB4244.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dPDFGw70ooU7baNtvj2u+YQzPBaF1PUhBKjjb/2WTa6/oaL+tsGpwpA4u1qKZ6Z4uRQ1iYvaJGJZwh5dy5lpiysyYxfy+vxmubc08NMvxBMpPJXw2BWJp1EpFPiHqQLqZVWr0RblIy83Gp/ofKutg38TAcvosddNpYdYAMdNlUeSuGHJ9Rhg6zrkrgiL39zfhG/G9Wf02nHhYjJgcJg8ifT8YhcK2hjIgm1u2QrGLJ+ImqHl9xbeX3EKUCwk+E9lkd/f5gTxC3fd2rCEYFmgNDcbbIJTzTgmEJSR/OP5qgEq0cYmngflR1Y85oVqvIADOmX5SQ55MJRHuQ3weHjfFrjP05sdei9cXYM84OIJDLveSwjKOdXgbpzWqIZetgNa8p2s0ID00V6Pdhkhy14RmUf+zWm8LYC8wtHgRygzmTMXIhhWg/9Fc/fGxUNBBPY3eCaFBBfBmb3tZOTHplNWu2VvS+hW/FTI2vqQmGrgEvCDpmPv87afJJrJt+1Jfx6cUHnbGDJrzN9QS4btehVjLhn+i+5ozBG2mm4q5hRFS7g4WckCyMVLf17N33Blp1/IgyUk6Lk7hm53tHSOtzI8cC9hTFqf0R0Cb9wSbMPzMoaecmoSncY6XNOaAozkL4kwc86GFr1MhxU8kt6sNYJHQatsG7wxFth/ExrKE9u6jPV4/f1bsClPuWErFLUKFeCoAwkZvgIq6qy/VDNNTfq31SOh/On0/e8gQ4tAUuNo1Hw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39840400004)(136003)(346002)(366004)(107886003)(5660300002)(8936002)(6512007)(66946007)(4326008)(2616005)(2906002)(1076003)(478600001)(38100700001)(186003)(6666004)(4744005)(316002)(956004)(26005)(8676002)(6506007)(66476007)(36756003)(6916009)(66556008)(16526019)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?KeAh2eTUoduuOC+i5vNjSpQqDp+hQoVQfNO5VWmLGevE3s/K7OUt0xOerrra?=
 =?us-ascii?Q?oU+32C1GHITvi66VwhToAc9nUtYs0OZVVcjDaaKCTHF23bdhwvUTr/CVfMql?=
 =?us-ascii?Q?C5JeIujlqBOjzcXuLpHxN3S94Noh36A2DzmiFuAHoScWnlsV+5NsSa+tgbsT?=
 =?us-ascii?Q?IF3nmTp9p1yfoWmyUdR22sFR/hF63eKIHtWl3lpyTZyXEh8/XWRwwQMRTjOq?=
 =?us-ascii?Q?ZSGApeq0jhaZkP6ybj713eJyIkdiaI1SVcgu1/VWsOHwrwCzSoo023CdD1BZ?=
 =?us-ascii?Q?nEXpi29kyjO1GLwsQKxPCFCd6tfcPwYAIZuQXFLj9rNEG+flJkTeK90q1loq?=
 =?us-ascii?Q?KMF96ywNaIF7Zj7D6kHt9i9DDBjR5hmQrmhFBheeTEJaI0jp1Wk9i/eVIaCW?=
 =?us-ascii?Q?wZYBUO7HQECBsSbs9gCHNER3goiyQxYIZbtXLJeT4T3ZgBIjhUDyUFqGyMcG?=
 =?us-ascii?Q?g+xCJvtcNctOgdh5NZGwIdGUQXblbT7fpBGyfTfRHZs/PyDF6kgkgqsh8JLu?=
 =?us-ascii?Q?bTzsIxgfGKcF390w4rhgLvmcGABnJmpTF47V8iDbqvC/UdEipoWoOIV1Yyq1?=
 =?us-ascii?Q?/oN/gSqS1bku+YpYAgUuvPKcZCxo+2F7XznhiFSWeuFY1/fDgMCltxVKXtW9?=
 =?us-ascii?Q?saHGNNbgUOp0b9JVvFM9gBHUJhpgnngJPa/a2pAEQU9J6HQkG5V4q1ZJkAel?=
 =?us-ascii?Q?scSTQUEWlLeOnRqzxQtT+X1eiR12GV0m5FQewbFaMSFVqJbdLbfGwC9Z96tV?=
 =?us-ascii?Q?dsRlwfNDShx0UuGt0nvTo7QJrhag7zoJvfH1DHskj7g8dwJWQ65K9klqOv35?=
 =?us-ascii?Q?qF6ZflNW59PG26UNgeHDqJNCRh/GrJaxW9+P6VXBXQVOPJxLTzqFsT5wiRy/?=
 =?us-ascii?Q?uvJNogGDvVaCJydWgKKMdToq9k7AxAt36VR4pluaa1m0r21l4GBYP0zOrxj8?=
 =?us-ascii?Q?xo4f+wU8cJ8IyTnRwBw7RK4kFL0/2t1KKyKEPBzFsC5uwIbecBAO6Q4WITPD?=
 =?us-ascii?Q?+jDyxEowRCt7Rs2j7NbK3ap+dKPItIZ2AmirrwL/KJXmGhVQ95atTJKBNUP3?=
 =?us-ascii?Q?XB2YICmGDosXYxOJIJOAMQaPgFkZS/4mwVNhJ2WbFG+FMbTMzahgZs+73DuB?=
 =?us-ascii?Q?HLalsIT2siktmMc3TakZtG0pm9ujscbm1MdFdWvwSUwbS2T+HpmYlmnmQEhJ?=
 =?us-ascii?Q?meU5rS/t7oSGYksbz3I9YVLKM3sCLDFciS+0jKVLFjkEV7ck0SxTH46mnx+4?=
 =?us-ascii?Q?2vzlKOh/+ncdeNXZZIYqyqPv1DYcVCtRUvCoWLjqP8wtR3/X8g2ZQ0hcn2HK?=
 =?us-ascii?Q?sj1salKX/T7nKOJ/6Uj3YL/h?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05561815-b715-45fa-c3ec-08d8f2475234
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:12:21.2022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUnDnWU8i9ybDdiZga+GFYVPZL6xKmK4JOaZgmbimO1XTVD9Hj4/r3oew3Jkc3LA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4244
X-BESS-ID: 1616976742-106046-5373-10620-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.56.171
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan22-252.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-uvicorn: a lightning-fast ASGI server
---
 .../python/python3-uvicorn_0.13.4.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
new file mode 100644
index 000000000..e04dac0a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The lightning-fast ASGI server"
+HOMEPAGE = "https://www.uvicorn.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=206119e27d6b034e7ce70d73063c82a8"
+RDEPENDS_${PN} = "\
+    python3-click \
+    python3-h11 \
+    python3-httptools \
+    python3-typing \
+    python3-uvloop \
+    python3-websockets \
+    python3-wsproto \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "3292251b3c7978e8e4a7868f4baf7f7f7bb7e40c759ecc125c37e99cdea34202"
-- 
2.25.1

