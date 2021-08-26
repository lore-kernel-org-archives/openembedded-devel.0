Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32138.1629991214649472924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 08:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EGiWEw3S;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38728accdc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17QEYjDI011090
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:20:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3myQdRfhpuuoXyKRmcAIvfQg73h9lyiEdcPL14kKgM8=;
 b=EGiWEw3SYL7Un/ZBUUxempQGAfX15yd0+VZ5yayt/l1Ie8Em0iqZulFdHSaDlVldV7AY
 PnKADn6EWFF6oxU1GVmTcw62qjrzDiKhVz81F02qLjfu2MJYKnML26FcQNJGFwJCunCh
 DEmJpJuOOHbdMEbrvIddIq531vDHfxNTUqEIqvejanMg4G6fbdqnuMOQrGhEXrAGhzoW
 PwWVZiTL09dLvotg5v4jfrUa66/di5tGLxh2eiD01wGm4YVtGPGrfPRsZdKqM7vknI0o
 cm19dI0jIjK8l8HTj7TPiDRfdlwC9fY1jAc4DHRhU5V8K0cQZKDrjZxM9Bl7aJQBKtJj Bg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3apb8n04y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9t9BMFAduTLb6Jt7sM2o3zx7cxypZ2E/0afmxkZdkYXKlAPl4+aUGgizvZ8nrz30UtInalYeNYNqllqDoWtGxrKJrMDnnitgmuD220xEkl9yPLDYuUSaPoTU9RDzJZ9nlMJlYW5iP6oLnMfRIQug0bdyJsGqzdK9sG0QtFSX0f1t1JG6awvBJiObohCbOQl4P8zHZ3wzFAYxMcG6wgd/pFKmyhgzl2cqiiYLD2btKzqW5XL7JY6Yj00Z3R86BjVi7yOc6YWiq5zDgINYLoW0VTFcFnD768BlsYgTpxL3DKlKcZ/xTp4PZFZs84EeX27o2aJn7JBQFhSJpooetWVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3myQdRfhpuuoXyKRmcAIvfQg73h9lyiEdcPL14kKgM8=;
 b=kfHurrEAmkY9Clqmt2Vs2mLsCx1liLnGhrrDcT9QDYkEUtUsXwlJimjElLYNul6CWEBlbtICKieMEIfSmGEZzMJbqdu/owUsYHK4kPdO1ZHV8fVeXNR6boG3k8vbxDum86/toDDP0/DSC5plxDiyVkzy2/7BASKTlYQEXEALo3bnrNsRFFJVP41NjFXzatFqc+i4LJh6aLyeQdjkogsmYOwn2VVRFrZft7BOs61rH/iyhrZuZXyy/4J4hnzp6dlHMmSD3p91PJwALPdE2oDWEHgL6NtKECHAQFhVYwXj4mxkAwvRF/crszvH1W8miMJOlUu6jDdkT+/hlMPBAzMuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3111.namprd11.prod.outlook.com (2603:10b6:a03:90::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Thu, 26 Aug
 2021 15:20:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.021; Thu, 26 Aug 2021
 15:20:11 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-license-expression: add ptest artifacts
Date: Thu, 26 Aug 2021 11:19:44 -0400
Message-Id: <20210826151944.539906-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: YT3PR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by YT3PR01CA0106.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 15:20:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea8880c-8905-4074-33fe-08d968a4ff04
X-MS-TrafficTypeDiagnostic: BYAPR11MB3111:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3111901F86A860967BD445489FC79@BYAPR11MB3111.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cN95/N0cckTAKipRNq63QWYxarQX0xObqHBF9V31sivgQK3/YM68DVh4rlyrkKDsScKAfHgU0xvYsWf+9W0Wi32Bh8CPb2TQaCT+Y/lzOtUaixbCr7+cyEotECs1Ky0wIGulIjnYZlwbzM+zBei875p5H2QKzB+nlrcxzvirkUllsJYoQCYMipZdCefFFdaCrcj0aLPhUZk9QXOMzUpan1vHvrJ6/OBJghXZiiQqDwf2Nto7RaGJXISkdy/J1gp7QhAdZAwxdESiJp8nvMTxWrK9cgAtPcpCIWEupSOn1TIA7u6nUJtAEJz72NYvffouvijpWtAoKkOpbgJunJehIu0xPdJXjeU/BotEiCAFXWU6VAgN7Y0GaesQq78EKvlKTKWoSoPMHwI/Ir3uwg4MB/xJ+w3O05RsuUzphxRolejG+UTsnWTzba5WXA8X0h8F1/up5u/R+PRnUSgKyFVpolCA1RwWNTE7WevydyLfa6Tot+FZxHViEDX/vc18iSNgozb2CbVqz8ifbXMqWFmznUivBJMPS5xCzD6jQlta1ZYujUFTmT47uU8t1pqTkKZYSwVGQJJ6u0rCb/Y4YE1zSkZpXACOo5vGD6ZobuZKEkQKw7eiteW5vD5u4pyuVZY3mXXoLXxRPPMvdd86O5r4bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6512007)(83380400001)(44832011)(66476007)(2616005)(36756003)(66556008)(52116002)(6486002)(1076003)(86362001)(8676002)(186003)(2906002)(6506007)(5660300002)(508600001)(316002)(66946007)(6666004)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?92qQrW8Q+o3YvXkt9xY8rzGLeuDPHvXbnWxDzIggTH4z7QhKWwmMSVh4U98D?=
 =?us-ascii?Q?ht4VDDxb56fEJULp0wE00bIB2UDJeniu4VQJnNbgtZVqM0tR5KO23txfvaPp?=
 =?us-ascii?Q?9KhLi4J1S5H/UVPZTf+lGV1S2JiMBTm9SK5N+N63sVuEF2PpawsdrxS4/Ol+?=
 =?us-ascii?Q?UI7EK35Dr8yXtYnIFl1CBEDmRDpUcA5DOJE1EtZwLbPuiik/3uMHED3BIScR?=
 =?us-ascii?Q?4tApdpCR/pBdiXNTplzpU0Lxk84+BNBg0s2ElXPpf3USKvWmW14pWsOMs56y?=
 =?us-ascii?Q?Ase3MWSfC313Vjlz/XX/1CtnbuRQD7mg0fX5zylgk2e1Cxi/zhvmKPpCZd9l?=
 =?us-ascii?Q?ZAoMditmZKT/+9uybMehRX2zLhL4n/0AhTAzjdQ+vzJYRHZkkLezCb07+j/+?=
 =?us-ascii?Q?qqWFkADUiLsgDXKsaA7PbZCgJ9eaJMLTyPrev+I2qZCDvZ3A7D566t6BNEOn?=
 =?us-ascii?Q?NspkfKm2yXqF0kYtmyuu48huWJ6sWFFCCNLcIExE4dHvxYfby/QN4AeK4ZUe?=
 =?us-ascii?Q?HIpCrF9xxM2SwWUSJSG2MCwtspm5UvxlzS3dsq3UklOy1Il1aZ9b/DVDj3fI?=
 =?us-ascii?Q?cBDtqPyc4ULllZ1Gvg0QdqAGPzd/cvfEswlklKeKlLSnl4SYh2fcorG2TbOi?=
 =?us-ascii?Q?5oSFVGH6mftsGvBtfoW9W4alM4Ur/d2+NuqaJPRsIy6G1HiqXXG2PH6a+Po6?=
 =?us-ascii?Q?QFVgovKPhukwd/S1wZ40kfW/OzCUfqsuh1d5f5CsEogM3MrUrB/cdKFJTHnm?=
 =?us-ascii?Q?1flC8Ef1zo6+VarzweKwjxwfpNg/CekBXu+ggs1hViDZYYpdVrzc5qQU6UDF?=
 =?us-ascii?Q?7arg4S+PulsZKw90jtzgHOBqcpsbnvb5Q/J+V5SE002QzfLUI+48uINsGbif?=
 =?us-ascii?Q?zOJK/8LyfMfE3BCVC8gRkK0/2dehp7PghC7TP6BBF8k9lkSnKJsXXcGh9Q6m?=
 =?us-ascii?Q?xwczjLbVrUNPnp6ueyTfzDu/+tr1Am0uwi6X7jg5XRct/Bv5jsoPY4a8Cea4?=
 =?us-ascii?Q?jfzKMu1rjwQv705zBP3hPoUYSSzVC3fG6BTVakVkCCPnw1GkeXOi83GYw5/P?=
 =?us-ascii?Q?W426E1p+/etbB13yy/nUhJCKumrBt4iSTdcgRS6fG9p5H/itr2ZO38UAEmOQ?=
 =?us-ascii?Q?Qi/DYKy80du/EUr7OjcB+rTNlOcH9zFSdmeqh7xHRZQdyjHr+EGrb/OeYcUH?=
 =?us-ascii?Q?nc7g2EnJAZo8lnSHD2DTTj7CdvBZVRjnIso1B9vr1EViTzYhorur1vFtxB6n?=
 =?us-ascii?Q?Y9d1Q53d/nDqqeBwLb0Zvz5X3XxqugrlAfCefqtFRyL9kcgkNLTH1RQdF3PM?=
 =?us-ascii?Q?L52geH4RdH7RDuuR77ascZ1pcGNo8X71RC0k3XYR3CCFINseW5woNY1jLbL7?=
 =?us-ascii?Q?bjU16tuS3KD+GSzua1iuY5+M9V+R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8880c-8905-4074-33fe-08d968a4ff04
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 15:20:11.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqNwoSSy8FDBrkXxTXKWx9ht3f3kM8wY9NYlLGK4RthNNA0mWZRiIpbWQs23QQpEHLKtxnZYCeGP+EcephlQp69uGfTXRkbI0BM5mCS3Qv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3111
X-Proofpoint-ORIG-GUID: KojoHgWpPLLGEUYcGf6ukPWxkmOg7kkg
X-Proofpoint-GUID: KojoHgWpPLLGEUYcGf6ukPWxkmOg7kkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-26_04,2021-08-26_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260087
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The python3-license-expression ptest is failing because it requires the
contents of the src/ directory from the repo/tarball. Copy this content
to the image when installing the ptest so that it has what it needs.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-license-expression_21.6.14.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb b/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
index 2ed5d9170..efa885441 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
@@ -28,6 +28,8 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/src
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
 }
-- 
2.31.1

