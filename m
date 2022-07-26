Return-Path: <brenda.streiff@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694D6C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 16:10:54 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.8689.1658851852675378348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 09:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=CmLEHKRx;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=420681fa7e=brenda.streiff@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26Q8jnke022221
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-transfer-encoding :
 content-type : mime-version; s=PPS11062020;
 bh=ramhDIGivqV6a/W097Lacas+Q+/BXxvv5XqrvgEM2UA=;
 b=CmLEHKRxQIUk5sxB0rDaEvyK/IK0qUBcPvHgCzBziGSxNvHT+ET9D+1tMP3otuQhm4Xm
 LsoHw8nQvSZbDnbFEP8+ADQqXHNzgwmgY5/HVxF5RoyTO5SxZfynmTwH2lsjk1u/GDWn
 BkpPWxI0ZvJfwA82FPShQYmFAAXt+J9RbFze/wVFpkjmYOJUj4EEYhJxDvfsFP1llUDQ
 A+dmAkOPh6Iv01MJtKkUsez3gMHch9HToNFfx4hiHct6ndO7K398TDDQXqsk1XO6Q774
 C6p7cgBZum4Cx+Q7qBcyHF3wdSivv3+uX9dm0loWbMwHX5EN6RygSqYA3Hi7TbqSdn3U /w==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3hgegu5cs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:10:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR2qgwj6c5mwB6/0lMtBiaax247iZBbpEJ/txD4fzDypryjg87eQtWIUY/Etc8Hh8Cw2ALOm1jXGew90Ln5o3beR3HMLozSsfRmHDBvUmMz5vpPqQQcZ5/UtVW1+zeUs2Ctw77mzl5IohDEyvBfXdoEpxx1kvcQQ3CTX0HP5HC7Wkp+fv7UYma91DJj/fy1MVJkCRNxOzGVFaaXd4NMoCgfTI4m0u0NgGUN+FswGEAv7mPOpJ0Uk7mg7V46aDthNxvVqLFpQZS1G8vkMP0oVkso0BWzj7pxYaFLhp/kKXA7ikTyc+e4FRvnWKIDR1oVH/p6vdakZYzggRhdNETLJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ramhDIGivqV6a/W097Lacas+Q+/BXxvv5XqrvgEM2UA=;
 b=jC3SqnkEYovTSNJpF3VBb8MgjpuGWzOPi++7Pu0Nyy+fJjLlk2hjinWjQ8/xBP5ECgJ41DOHtb3Z3VxGy8Pnpfw24WYUP1ddjy/xzmkPJUY0WTL/cn0Od03xlvWPcMZxuA8fFzPhlphLXcAKB7WCx5o758Tjlus3R3GSSzu/ghK6lAUrE2MwKSyHUY7P2dIGLEi3P9VytsAIJwTFrcc7sIU1tewEpzmNugRecHMpAFjoBo1Alx/j432cDM1jMaqzWOwZzTaTTuIfnkELV3gv5CNW/Upa5ILKCreDLrnj8YXCVvxMZyTuQjVQjSA2je+BhV4/E/W+P6dmcSXhWIpKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ramhDIGivqV6a/W097Lacas+Q+/BXxvv5XqrvgEM2UA=;
 b=IFwzz+qsdTi2krTJTH1HyUlkSr7hsTv7ljZ9uls3hXjJj8A2TwMQxlsJfDzcnuYjxuLNaG2NMV+ZGKiNtRzWmIH6331tpDfYTY1Ga9ZqH8kvnt7iSh3NfN5M0xGkMziIOqb+qqtmA++lOf6ckNyVNpagQJ+KHf7MlXTTadrOn7I=
Received: from SA0PR04MB7386.namprd04.prod.outlook.com (2603:10b6:806:e4::13)
 by SN6PR04MB4798.namprd04.prod.outlook.com (2603:10b6:805:b2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 16:10:50 +0000
Received: from SA0PR04MB7386.namprd04.prod.outlook.com
 ([fe80::b1f0:fc1f:d740:3993]) by SA0PR04MB7386.namprd04.prod.outlook.com
 ([fe80::b1f0:fc1f:d740:3993%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 16:10:50 +0000
From: Brenda Streiff <brenda.streiff@ni.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] Add python3-aiodns 3.0.0
Date: Tue, 26 Jul 2022 11:10:32 -0500
Message-Id: <20220726161032.1630170-2-brenda.streiff@ni.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726161032.1630170-1-brenda.streiff@ni.com>
References: <20220726161032.1630170-1-brenda.streiff@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0108.namprd05.prod.outlook.com
 (2603:10b6:803:42::25) To SA0PR04MB7386.namprd04.prod.outlook.com
 (2603:10b6:806:e4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c86d05-7d7f-4af5-9203-08da6f21684d
X-MS-TrafficTypeDiagnostic: SN6PR04MB4798:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lF8NyC2ldU9RlkB2YanAb9Hjf1wk4pO/EwESwgAGDpqk4Yz4fOYhixI9SgQOFA2ldB/ELVdh+x5gj+aBfZHpEcP2ego5x8eYMThNBZoEHl5UMaOe2pBumHRU4+CX/l/ea/67vJas0QIQe86y4XZ6S8MDs95ohAPKsFWImExb9LpHaFaNG+SgFlj/KZ/sYrogpV1a0S7rvHaYJarHq2lS0a82e+JK1ZodHiS6fy4gWWVmD7OJa/9bI6x9xa0JBTp+6FH2LSqtNVDHgrrnxwGjBsb4JNy+wwCW8MABS1YtbxxOkEntXby1Ouf1HWUn/P91puS/Q0c46izDtS1xbg1N2xOWhNvxWbHnVrCuwXiwQh1vyD1YO9lEivfXOVJhrXYE6KrlExcM+Dk8w2pyqC2sfJsPEvw5rC5dQ9vSy2iADskq4ypy9byaUmsYNUqK0FzgH083LbhVmmFpkqCZQkIZ6THOO2IunyrLkkJH/gQlORARCNaBw/EbTGX25mbgUsjl6I0meZ+ayFLejkw53GNUOTR6zJuR7sPKQS3GYV2qhAAYZYjNfL1hNgtYm8O4NqDU3lKpw3hZI0i0/7h/r0yTY92Ki+lPAaGSAmsTbAAck8v3H1XRSAzDbwl8Tm4lMxp7e2aKtSva1bJWOmZjMk/XlJywt9Sc1Y6/+KLKaHUK9vm8uiL38+g6K40Tc8YxPoDzzaZR7n+nPJov0K1egtX9uIt5LzOMw0+BHxWCDFwottg3QiriaIKlgTe/kvW9zYZXBVRfGlrNYeRRQsOqoSSfPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR04MB7386.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(36756003)(66556008)(66946007)(66476007)(8936002)(8676002)(5660300002)(44832011)(6486002)(478600001)(316002)(6916009)(6506007)(41300700001)(86362001)(6666004)(2616005)(1076003)(186003)(2906002)(38100700002)(83380400001)(6512007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qki+I4RSI1qBvSbmXBXbJmrYxF3hRVRgrZI5Ar5uJ9mSYfekLzsgw87YW5Jy?=
 =?us-ascii?Q?+xJWOf5hVM6JjptZDMrhtLwWBy3zPF+qtN4aCZUf6H3mv040s6pgeWgA9JW2?=
 =?us-ascii?Q?2KIIUsQ8M8cIFpmIPkHaLmjV3a31tqIO3rzsROkfHuFVckNcoJSVHZLUOALH?=
 =?us-ascii?Q?BJ53YYCugojQPSU0XwJwEzmM8qvSOhgRo9fixzhjtPXkHradCAbQaqunzFWM?=
 =?us-ascii?Q?BbDF/bMkuITPD3HBa61j8REqrqCJfOAggg2Z5U2f3lgGpkyifiJDfesC2X/g?=
 =?us-ascii?Q?VTT43WgHVTHceX5HFZO6F9uAnd7zaxaU/lyxGFjKcTyaE1Brb/fulO51+q6F?=
 =?us-ascii?Q?yUuVjmExANwly12p61mp2yLIk65bKSeK4G8aFilGfoip4PeST/LZDZTJ23Js?=
 =?us-ascii?Q?h1XlxddnIFqE2Xhvyp5D2LSi0khVm8divP+mqFK+pPKjDBxufZqave6jQP3I?=
 =?us-ascii?Q?A9cCtqIeL/bpv7EsbyDR7r6OCKsh5sUgaICIXlbzl4/spDBTDWGkJCKeBfHR?=
 =?us-ascii?Q?uuAG9kl6QOYihvC+UmV4UUke1PAJ5bKekE3xUibLeaDjaq6AfVU/eZuPRUfY?=
 =?us-ascii?Q?bcR+p/gZJk2xl7V21aD9U3SoBQ4uLgttzm+DBwPOdMR82xeRJ6YPrkwqt6NA?=
 =?us-ascii?Q?OQ3g+l2vc0oGd9ApsKGqQjL+ceyYOL4KJp9lAtK5eqr6/fi6SxcaL0qB66X4?=
 =?us-ascii?Q?4fkmtfDEPnvK+gbSJijfyHLfQqvN+ZQHWl5WBM57JfPRQ0yeKg+RY1gnH0je?=
 =?us-ascii?Q?CNcrhGcsqxqMm0qDJ5R0X9RtnvyxBXXfZ6fYRb7Ner1G0oh5BCQ1K+vEieCQ?=
 =?us-ascii?Q?9VB3O4VfU7ELFK6YR+1+Vr4xQGGHTDN3MVnf1p1R0+miSL0tfzNkY+Jho5CC?=
 =?us-ascii?Q?1xJWN1moMCx/fEUSduutEfHUymjD1jgbSX7WU7skkx2moLTXx8KVgljaOlz+?=
 =?us-ascii?Q?kxk9bVvBxOpx3bi0vZNi4TsejmsFDSzS/rpieVvp5tqFqoOhHpxlmB+b+cwz?=
 =?us-ascii?Q?sAHhQjuXLHrkEcHMcFkzYUjELj4Cwa0ndu3zxZfGhh5NEXTktoeDME6FMwGl?=
 =?us-ascii?Q?fhY2nOdJ6U+Ci+HUuaY2nJ7oSgt8nEn9hgk2gU86oOF1x8tlthY+Q9RyNn3S?=
 =?us-ascii?Q?SeoUgXqoQUh2hoXJcMz/9fW9p5NRSIOMA+nEAxkYZcIl3RsARswtlVaT0OWA?=
 =?us-ascii?Q?pS6s6gyjbY87ozjpAOapTyW3Aa7NMI8cBWtcLC5R2qsH5c9PRlvCGMV9bTDr?=
 =?us-ascii?Q?09zJ9N4rCNox76H/gUPKOAvPqvFbLbYzXOtnZoKZTl1T+FlBM6yLqKxiw7OU?=
 =?us-ascii?Q?NMwx/wQK5BPny2Az+BV/LaI4nXOnJOk3ZiRW+fOOnUFDJxVPOglSYWpKyGpj?=
 =?us-ascii?Q?U8ld3Yts4jaFRQsy2KdDoVB+fP0/y0kwompGJ83FmzoonOfMW221a/0KdUfw?=
 =?us-ascii?Q?2P5EbzwRvxcO3YDHXnPscupeZ1X82BMudkRb8D33z7hSFlpfp9nrePszyYmQ?=
 =?us-ascii?Q?0QZmxs9qGnBJFbzPwMQAFO6VM49KgtNCa2rh2U9HAmYF4Sw/MMWYBU6TjFTt?=
 =?us-ascii?Q?b7XHjDBa7BPqEGxWCqg/paUCAQDxqmQWYbPKFOGL?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70c86d05-7d7f-4af5-9203-08da6f21684d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7386.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:10:50.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tfHUAKFvbMoKe9rgBmvsNJF9kg+elB0iYzeCHUS80XzVXlHUni5iQL1mmBUnwvkbIjrv8bnfGHpZDLjL79ZAZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4798
X-Proofpoint-GUID: 8ffzo8QtSt4-Ju10Sl9n6UElI2Dws4Sc
X-Proofpoint-ORIG-GUID: 8ffzo8QtSt4-Ju10Sl9n6UElI2Dws4Sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=876 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207260062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 16:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97994

From: Sergey Kizunov <sergey.kizunov@ni.com>

aiodns is a Python module for asynchronous DNS resolution using pycares.

Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>

Updated and converted to new recipe syntax.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
---
 .../python/python3-aiodns_3.0.0.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb
new file mode 100644
index 000000000..64599d43c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Simple DNS resolver for asyncio"
+DESCRIPTION = "aiodns provides a simple way for doing asynchronous DNS resolutions using pycares."
+HOMEPAGE = "https://github.com/saghul/aiodns"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a565d8b5d06b9620968a135a2657b093"
+
+SRC_URI[md5sum] = "181e11935c78965de2b2b7b0e5efba8d"
+SRC_URI[sha256sum] = "946bdfabe743fceeeb093c8a010f5d1645f708a241be849e17edfb0e49e08cd6"
+
+PYPI_PACKAGE = "aiodns"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-pycares \
+"
-- 
2.30.2


