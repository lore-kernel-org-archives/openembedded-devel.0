Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web10.14678.1616976401726227959
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=nGpMd/hy;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVqysABceLc2k9Wr6brAg7MbQYyOaCH9p7FI3RiY9qhaxy7rfTCq+2Uef5j8Mqz1Ub6unnn6fhkyYPmfUiBqzYlJvYY/jKUHY5T+XW8gG2SiAyYjQbB8ojaS1S08ANPgLs4wEIOGI953dB8VzE9922Sm1pc5rI+gyr1/x116cklrnkiJNG1mGgCK083Onmc37XdFJWMfij2bsHHbyqdvIJIIDQg5ZtJJ7ksNgTFP2A+S/06yajtZhRJ04pCTlepc/KU+IdstcIo6NvIqGVsAVuXJDJzPyPzOMWIdErj0JJwrhjrkpfFAi199gpSa9T4kLYAi0nNsq7CAEKkAGFU2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zScnnkqLuTc7V4HRT68OOObdExM/W+MDH7xFtxOOIrg=;
 b=EqY+/2jd2G7Brzo1bw6aaTqK1aOt2fz+BqBdoB04K03hiX6/O1sCgj25SMZcPj6wWgzxvYNGrCbzjyQ0AvpVivtOHv6AnhHBC5rJUhpQqXVrSxRFzBkLPAcIwPHrnWQnmnhltBcx+uLee6CsUucMBt1BfiIVPkq9pjcAbLKBMXhKxt5WZEJolfAGQHKICl4Blraq/NvyyJLw7PZOV/YcNUmpXkykixK7KBr7gRYG0JMm/wjwOT585m9CI80pdf+UezFNEefW1Z6FeBgUwN+YtvSg9AeYRhpGbsDX52M6plwdSj+jmj6FXEonvvubD44is5UfoYmgH9YJPd+BjeL2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zScnnkqLuTc7V4HRT68OOObdExM/W+MDH7xFtxOOIrg=;
 b=nGpMd/hysGXSXlpmabxov55ogttXKYHwvViNW/ILpRw40YZHIGH91qpEX8qpcgVkAaHwel+kMZT/Gf37d1f3LXonYG5llD9V+sC1RpIBVcV6XbPSF2u02jyvkx26SqhIdZBRupPCRABoqgH/JK3HRaeZJ3Oua8lnF0lQCuf78RE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB3890.namprd10.prod.outlook.com (2603:10b6:a03:1f5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 00:06:39 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:06:39 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH] python3-wsproto: new package
Date: Mon, 29 Mar 2021 10:06:11 +1000
Message-Id: <20210329000611.2568639-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYAPR01CA0042.ausprd01.prod.outlook.com (2603:10c6:1:1::30)
 To BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYAPR01CA0042.ausprd01.prod.outlook.com (2603:10c6:1:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 00:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 059feb5d-ee22-4c8a-26e2-08d8f2468690
X-MS-TrafficTypeDiagnostic: BY5PR10MB3890:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3890F850984A620E2CF68FD98F7E9@BY5PR10MB3890.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d7R30EOtAvu6iR85v6FzZ2qO55KHEJLptN3Gd3WXozq82VwDf0ilL3LmzADatlIo1cK5Tm9jK44bCd4PRIFHSIPovEXZJsoEenfxTSfamsOT2Vy4qDXgblO36p/4ewheRYkwOardXgrEAN/SimsElmgHOaQRXPOU7M0le6VKY+MzQlxFMuLBRHy3ahpTXClBJudiIHxCPBiViCV0avMrzIe4JWjS48yiBjUXeR5CzYnPRXw7GNrYOeG/0gHF/qY/+B+xQCbkDqJMtJPH6JOfDVHaXy42OlJpqJqu2NKtoEjld2csMXkJZPyiGdfoVzFAHj7WkzXXiulfOAGBeO+2gWtnpSK3B11MV7BsgGwyYlAtiSIgpi1htvIDK334dHX54yIMnEvudbdx0n29u/G/ICg+xUNPIDB4FPH7hM/jJSV4+CqJ3330BltBqdr+aXS44Ct+XzCd0cKxuB9D2NJMZfYnevg9stw/EiyksVRnFPHN3cXt66ZpIdI2juvK2l2Q89hnmkJbMvwkn4zi7tWrSUNlsOb1h4oiGoNOeLvjcE1E/j8VJjr894C48/K9Dit00t/NqAH2WzzEjpZ5ycZw+2mBj71uNjULt65cs8cZuNz67ZLPfWv84IoeONqX5/RWy25mLzpeu/S4du8klvwZ8OrUGNkoXFNjJXy+qDSSHm5VuFSm1MNqA8X+IYHlzvanGUjcULwy5Y2CRUU5SBvgg8aiIpdhMCoQl7YYX4DYXQM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(186003)(26005)(66946007)(5660300002)(52116002)(36756003)(316002)(66556008)(1076003)(6666004)(8936002)(6506007)(8676002)(956004)(38100700001)(2906002)(2616005)(4326008)(107886003)(16526019)(4744005)(66476007)(6512007)(478600001)(6916009)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?NwPakyipzq8/Qrc0HRc8lXduf+yqmxN/1UDZUQIA4PFt6x2c1GPHpzbJvV6c?=
 =?us-ascii?Q?l26JGBBi9uMfdOoIiCyyjloS6eCWSwkZ2ZS6t3y8DJ45vPbJs7sXhwHOiiei?=
 =?us-ascii?Q?40RVqsef4LB2rzgFeNoDZkQ5fbfE/mOOLYHIIaPJay7rOIQZSGnUHw9VqMDH?=
 =?us-ascii?Q?FyO5xHqQn3LnR2VBU0fipnchKfkhMP+s6AyRdw5zomUmKmH4B5dCXmZxv3Op?=
 =?us-ascii?Q?T++FklhNoFRit5F3dYr83C/QXR0OuCEFQ9KU97+lKFLUD0p2fLSImM2oSN5v?=
 =?us-ascii?Q?TB8ATT554t8CAGNYra5NJVk9Z41BXTz6WBlyJdbu9Be2iRyBHDpHjS5+V8tf?=
 =?us-ascii?Q?RpiiXz5hk5X0/AjeJlo09vW6zLAyH/ICQJ6eleNzgOty4BN9I9jpU0e/5it8?=
 =?us-ascii?Q?xFIF1OnfPUOvKaY4ep8+yFd2EpRNvLic+2SBN4X/tQICVUSPHVvpzdh1/vx4?=
 =?us-ascii?Q?O4yfqmPW5/X8elV7rM5KGu5mT7QTciEioE2V6tLsncZi1tA5j7In4Sd6/rbu?=
 =?us-ascii?Q?io1uMcOcIAx/uRTOjK4fUTE1LM5ZGFxjsR7Isp+oZxKEC4u4UDNPzwTsEaQI?=
 =?us-ascii?Q?LLXGtAXTfR1GrV/ZyisPKXRzMHI3BbRSG9tVMR1zf6Uhwhtlx37AzNqptvsr?=
 =?us-ascii?Q?nCHB3tRwDWe843Pm5M0/cKpB8URqO4WYp7xS/qhqP9rIggzYQeKIzwBvKlT0?=
 =?us-ascii?Q?wJvHlNoDpQmFhA+EyoriMvENf+tPrBdAiTrbSTWsQE6WP9dlGdAVS+eVn0h9?=
 =?us-ascii?Q?0sQo4NqjJYaLbYkyJcKmY3eLFZd2V9SfKsoYY/iv7Kd6dMiBAjOfRrGRPVM+?=
 =?us-ascii?Q?NHZ6gX/PUBuHnKkIqdzE8zONyMKUQO06IGRuiaU8OcyGJT8KgNIHX89/yzQR?=
 =?us-ascii?Q?SJyjdVqbOxbNkr9La150jzFwxSjT7Ku6cxSBupTM5chlP31FdevZ7xXvcd51?=
 =?us-ascii?Q?/4GDymuXXTIae8S3qFrsCrBfUltbKOEOJOUpEmWrS7EObSGuqGPxNKSeQtFs?=
 =?us-ascii?Q?jMMiyTNT9/LkcAoAof904sDwzeg7oqcu9DVeAhD31A+7QVCXsaz0eKrHqQdc?=
 =?us-ascii?Q?ZUq9K95DonrqRULcwUOAL82EDl7mgXY0pW2b5BaNSSuWWr1Et9JkkLgEw3EJ?=
 =?us-ascii?Q?sqYr/mRRxGjTBzwek2olu+El/Mvn7Yqshn6jfQ66crAixgro5wmC+VWiFRJ5?=
 =?us-ascii?Q?Aw1HYjaDpH3L+n6YSVmY3cVrSybQLd/TCMu6LaGT/1XK3F0fZ8ruGztwttvT?=
 =?us-ascii?Q?c6CW9gybIkW0r0Oa/pUncokVWdYxa1DmEKkGTFZXqpoRMH8EnmGjsi4tpi8z?=
 =?us-ascii?Q?rTF7pHIUi+Eo9Cs4L4nEQpHP?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059feb5d-ee22-4c8a-26e2-08d8f2468690
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:06:39.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZcYM/WqicfXvMY9TF76gV7LqwgISgBaL284NB7iVwEEzmOIaskH9iAbJMvvKrRJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3890
X-BESS-ID: 1616976400-102250-5768-19538-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.73.48
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan9-186.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-wsproto: a webSockets state-machine based
protocol implementation
---
 .../recipes-devtools/python/python3-wsproto_1.0.0.bb      | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb
new file mode 100644
index 000000000..5d87b9d69
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "WebSockets state-machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/wsproto/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "868776f8456997ad0d9720f7322b746bbe9193751b5b290b7f924659377c8c38"
-- 
2.25.1

