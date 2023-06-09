Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E04C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 02:17:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4445.1686277018502388784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 19:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5524541197=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3591fc9V000300
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jun 2023 19:16:58 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2a80t9vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 19:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeORTXm96j4s9LjrPbPUJPCMaXNRNMQf/3bJZNm824UswwaHe6oR1QVDHMazg7ComRIez1NJ4WOp59i915a4pBDCQr0MA1dCWOGS2qaExqpO4YGB1gWN13vKbo2MfGil2iA8qCfkgV6zd0JmZMoLNXgLMBcSEJounMipUqyIdOMg4vm9ZwwsXMm0SNJYVwBjE/T3/nin3i3XUsSadagtjvWRAvjdThsRkZZIvGKRyncitnx6LbKAHct/X0Rv80vZi1KmzH9ONQT9KkjajfEeO9qSCSMGleBsxBqPbTFykblnEZWpJn88wYH7WekTAv+fbXSohFydx4ySjOZjkZHZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3LCT+W2+qtqQsB4w0qHgCh7w6kUJga5GDERPHjnqDo=;
 b=IkI7cNTDKOPu3drxGIC1FxmXSaJyhR719XjQjNIgNED84BXOP9GouFB3jANF790QgIhsgDa0t9h4a3ajs+LhZzym86YolLV60RmmDpNMN4LDnIwwh5xRKTojWvh+KfHaHwATK+9TDIQemfezualeXe2WiJKA/DBe0uCeCFLWekvQaAuWTO2k3qufGTc/HRbIl3rmevUoKln0jq5INR+VKWReR77TPdwoKy5M6GJovicmtPOZzp8m49sUmK7Ml7kQzDdEFZNo3psv4uNo5oZiyKTBJgRBJR3tglOeR/6vr2QH3vAuhXcGEgbMbiLtbNmz86Vcta759YANBfyCk03HfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 02:16:57 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Fri, 9 Jun 2023
 02:16:57 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][master][mickledore][kirkstone][PATCH] meta-oe: add pahole to NON_MULTILIB_RECIPES
Date: Fri,  9 Jun 2023 10:16:41 +0800
Message-Id: <20230609021641.197688-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:3::31) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 158c8252-2c3d-4250-f7c4-08db688f99b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AmiGJqwUg+iHt4pGzjCqWJcQPnY+CYqh3qUw7wLuqcE88sxUgX+y/52wf1WWhIXchFYgYGsl7ilWRN15DFMQ8Ca4m5cXczkzfsmVWJjO1PXGbh3/s+7HuxBXtS6LNmq6brXNWExuuh0ZkScTs67gL4sEXFS9vFE3oXaOK6scozOt1fMWlDPFa7u7cEpqGlg461VYjO/oV4cbxgq9IHJfhxcBJbaKYl04LmjwKwnexROmVM0y35Jie1Wq3DE0Qh4rCwOKn1kVIuTZhlyOIW9gdYcCQfaJ3MTS9+9MMLjF/rIx4thsGSCISqSGD7n9xtJ8AGZAOyHFjmeuWfnNt0OPQbUOIm/HCgG1vQRAZ97k2TWR3rvig7zPq5kCEVN+ZWYnharTYJzRWHorW1hYQ6vuCtixrDv2Y5QVUnKis6Fbxo9+Ktwou2oC/81NPhLcM2jGsRFSnW4FUmw8vXLbKYvM5Jd5Z/TZCt3+wIwImf6zhjtwrvxhoHmw/eD/Epx2Su2Y3Y6ZadH46WlPFxIInT86o+Jxmp0DfB8rKWkUKVzHvrGPfo7yTQnPZHlc/PMXDS7N6KYQPXfG8/4EThzBdgWRnQEg2FIRxDAi7yYyijsAkqRSJpwPYqHCtyqSqkUznbKB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199021)(26005)(6506007)(6512007)(1076003)(186003)(2616005)(83170400001)(83380400001)(6666004)(52116002)(2906002)(4744005)(6486002)(8676002)(44832011)(5660300002)(6916009)(38100700002)(38350700002)(41300700001)(8936002)(478600001)(66476007)(66946007)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H4mh/tyb3nP8W6A0vLlj//7rTuVvB7YTSCc4vB7ab3c/bQiKIdM/TAuTVjAb?=
 =?us-ascii?Q?wMMIXdzUfbl0OPw1vrkpNNphEyLyUguj9KX1BqnXFTZT5QpU4V/D9KU+rlkV?=
 =?us-ascii?Q?LvZtg8Ok+f7A4sfRdu6Y0Oh12FhVqTKIaCzURIApxzYtHXdSFyN2tCmN+lzP?=
 =?us-ascii?Q?uC602JukRSfGJ9aR/YqBLboR5Pszv0FwAPJATbcPWWkNpG8HLXswgWjWsxKX?=
 =?us-ascii?Q?4+3ITbKmTA4R0k6h6GTCFX4HgDL1PB7KXpOkA5HdaZtiJA8/XqLJvg9xuR+j?=
 =?us-ascii?Q?sqRzKcChrsIOFs5bp1NLdZAqF4hRjJfKv+3wgiviReyMisVujcEPOnm9C03R?=
 =?us-ascii?Q?fYDm/mthrZmWAKxyonLz6HT2p57O+GxQSyomiCZ3w7UU9C+DIAGvH9wtLRhc?=
 =?us-ascii?Q?X5BRwsMdYRPtG0mHpVN6DPGFMd9OCL2F5Ont0Tsq2GGTTLOcZm3J6LMviJh6?=
 =?us-ascii?Q?tsHA3Rz5LR9M5NZLyieuj33Fb/l2PbrmlaqUW0CninwLq+HwOTSUCa0bh07Z?=
 =?us-ascii?Q?6zJsloVNrBkbfCqaCKr1vVr3/dky8UXInh/4Wdn5NrwFUyI5GCRYrQLL18BJ?=
 =?us-ascii?Q?Mln24gMkSXddvZujp9Y7/6ErMklpes6L6kzgIz/iFVDS0x+2z5xSnjEKkf2B?=
 =?us-ascii?Q?uCPG7R1Tm47yxoeXTk5trbQVQ2wcZ1RoIwh+XNDuFSrlJ2NOvmS4q2LssZ2V?=
 =?us-ascii?Q?M9T+B8fulcNce9lI81i8mxQTpNDXDHMUaQWNpngOOWZJKg/cjeZQYVjuM7b8?=
 =?us-ascii?Q?ngdNOKyiHX2WafllBuCtkWvuvkpkAvE15pRiKfaaWJ1hKF4lAM4e3GoHs02D?=
 =?us-ascii?Q?9qIfaZnsjz2qrEALOqfMNE7BjOUYQ59rMvb3jq6zmPBLfwgGEd03F3y/BVv+?=
 =?us-ascii?Q?uGnl+BP04WPgrj2WzPtCtRF+L2K43KjZqsYcBNV84W6bOpwAxCfO703tqMOm?=
 =?us-ascii?Q?Jt8ly363SzMPpWFXj8jeLiN/BDy7+nfNU5PlQpnybRP62ELNN5wNvBNjQJp8?=
 =?us-ascii?Q?PDNkR0raVIVHS3wc7SKI6XpK6W2mNrQiWh5t+JefMRvG+gagbR+qb/UqAbQ4?=
 =?us-ascii?Q?x1CqHtkJG9zHazMYMtNDYz3xdI9giYgzia3Y5V680CWpsoHvLH7eL556MyB7?=
 =?us-ascii?Q?ddcPJv+Ye6T+zWeqVyF2cDzf7WZOtu6YHKCi4Cc6p8GjX1cKfF8WQtM7adQT?=
 =?us-ascii?Q?eUU9HLuKnSwWdmUuGahxTZMw6VB3kMGLhcTo7EpthXCL1tr0xBTNvi604Vtp?=
 =?us-ascii?Q?/PU110KPcPP99bYV1D7jqa/rJVp49oS1R+3NZnLkLJGSFfrpO9xmcwYU2mWl?=
 =?us-ascii?Q?BoFA6M3qvna7Vy3mYz7WmkCZst6X/8Vjxs0yUobaVyGYAfrnf9dtrJkQDOvI?=
 =?us-ascii?Q?IPdghzrYj4GAxajY6qdEaxQCAM2Bm1tZ1TmMcrSjnhGCczkHgehjREuJ0c6n?=
 =?us-ascii?Q?It8fljU6vuvnV01Tfu3G3OrIogrmu7N7VgIIgEHsaVlIgYJMDgFa+ICsxL2/?=
 =?us-ascii?Q?B2ZZRJ99/z+j/4wPzeIKAUVeR2zpET9QGzMUGySpxzCP0tTmdad6KSCAzEhz?=
 =?us-ascii?Q?Hsntki1jDEEVB2SIQlLeRhieU67etTg/Hkdfiv+pKUmCd70j8oUgTFfPQY5A?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158c8252-2c3d-4250-f7c4-08db688f99b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 02:16:57.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMiwAlJA6lc3aTIHWZQw2ZHpT447QVuxnnV0f9OR2hynSiuIUhA2mQKLITy6/eeFsOMycXsoYdqn0RXuPb/RDCDnZfFur92rIAPBi25UPt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-Proofpoint-GUID: R1ksO1x7L55NGebdiPNJdLoTtbA072fz
X-Proofpoint-ORIG-GUID: R1ksO1x7L55NGebdiPNJdLoTtbA072fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_18,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=635 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 02:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103193

From: Xiangyu Chen <xiangyu.chen@windriver.com>

pahole need to line up with kernel's architectures bitsize,
so add it to NON_MULTILIB_RECIPES.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index b17add6f7..923b722b3 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -111,4 +111,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash"
+NON_MULTILIB_RECIPES:append = " crash pahole"
-- 
2.34.1


