Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0696AC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 02:52:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34904.1749091937624439425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 19:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825159c40a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5552Q7KM007424
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Jun 2025 19:52:17 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9ruc4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 19:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdHvjxRtHigLNwFWYKlm+wUqkyMnZsatNPpJ+oPknk73eQJyd7mVv1YKUFYnJ8AN3mTHXze1dI9nMxf7pDg5fH6dv9ieLgIdktqpYyZGIqduLN7yJwcBsIiZjf2DV8rjsl/zvAzD4Lb+U1mf4NPe0fRznAdWCZN+5hFEtgYOzzQqsXZldE9Oy4+N2ZCaT2wD9sr0EmwF3VGRFNqMZCpOB3mLj4aBH4QLLBdvG7y+NHpPNVSEUZYW2uC350MiBJbzJUkKzfIlqs4f/OGiKfiOO3gjZFh00BpETJ503BNkpTagzqVvu5SAtbO0b3fpk3SZw35GvjeeI933tvCciTPpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc4amNPkEYLPfXH6q7z6WgtbQk/vZNSy/mNaKeVE+eI=;
 b=q2V6+u2oNZqVtvhXdfqLCkjvnoe0w0Qmd26n0L/WS5N1twmR+GZt3sjt87RiXg3HojJw72NhLyLWOhSZFRlCd6U0Z7PCcL3Z7HKHLO0o4eCVxAEDJpcjeW68vWW1EaiLINfbSNw/t+O1Cr48D+RDCr0SNEJk+1Wq52JMM3eyS2SMqaNEcYONFtf56+fCq5S9S85GAVSxBOlRQWIA4nxzh7amh5UfdWj+i7+ablFZnYICkGqkZLrDVQKk/GBakIW2iCgf/6vbE1ZspCgIK1fEPY0rSMQJt/6F8wv2aKiblKe7d2yjye/cM8xm/IgC038bR2xV+iz86L/3Irli/SdpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8673.namprd11.prod.outlook.com (2603:10b6:408:21c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 02:52:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 02:52:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [walnascar][PATCH] valkey: upgrade 8.1.0 -> 8.1.1
Date: Thu,  5 Jun 2025 10:51:48 +0800
Message-Id: <20250605025148.2663114-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: a8046e17-ade7-453c-c2e7-08dda3dbf8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i56n8X6vEJ/qXA8AH9RlHmV19YcX9+bj2/vvpz8Q/09zSMN+Q7V1ncSbsg4T?=
 =?us-ascii?Q?X1CXeISvmqKo11LrR9EdQUnSZ3u07wdGbEK3OvKogs1sw76xPEDMBbIWCxb3?=
 =?us-ascii?Q?qvFICPSF5cFZ/x/5SZKcfMt8Ej4F1P3rt+4qkdpjlP9Bhe0hqQnich0Z5Sg4?=
 =?us-ascii?Q?5NHHTndJM5h6PvogkxHOEJDgdBwtHWtzqDOFhHkE7xTHcLJKHGvYziso8U+M?=
 =?us-ascii?Q?lSaHjXBoA8snwrJS+uljZh4rNVQ1UvhDQVEdGj07xGJ1YOr8Eofz3v7A8bz1?=
 =?us-ascii?Q?hIUQ5nWqX0wBKHCO3xJSoo48Lirb3xyMYXCQY8vQZKp1bAIH8JYkTsOJR1rM?=
 =?us-ascii?Q?T7U++gPwHse4eVBGMsUEimaXfmL3g3MvZOrCqyNwvTAc4UbHGEsXy4kqmyrI?=
 =?us-ascii?Q?e9lOfQJhJi+Dg3PwW43mSeVHqieqPwTDKZU1o5ZXswS+HzLsTPg3Ck/Clo/s?=
 =?us-ascii?Q?OKX47LDpY66T8afOmq/iDoOBVe6+5qvJ8oxEvqzFSy1EKWeFwsDWcCVjZR7Q?=
 =?us-ascii?Q?t9EH11+eVRQvtTI4kKHYoudwW3n6tWtn3/l/FhAKh/Yn8DuLhhpN5M5C6MuY?=
 =?us-ascii?Q?97DNM64lPPKw97YMLDDCeJqTMmn8SJVdcWXEQxNVIh817PFTO3KSnfIuiFsS?=
 =?us-ascii?Q?mP80ZxiATHYxwn6AcllerrTpckZGA/xhg/GjlC6dheXYCA2VG2NQX+sHj3y9?=
 =?us-ascii?Q?jhxcWEBtB2DzlIVqLOL7kckdiukZALcc9RxBODhzi53Dx9YseLCBoSQGgfPl?=
 =?us-ascii?Q?pKPtkcnUwIk8Hu3g1bGZlafqjdzjPuAL2UWeNPvI+OyoYzOVTH8mBBK3KS5E?=
 =?us-ascii?Q?SGTcrimvV82+Wm0z3gOQGh7xqECbFGMHEFrYwBla+oY5LOmuYmAWE3SIYlSJ?=
 =?us-ascii?Q?7mKco45BaZw6ik7CwR3JyIwYkG2C6sZ0fp8ZUZ2hEKopj/QgwO5mvSwLyv4i?=
 =?us-ascii?Q?ylnPclKayWIsa9Y77DJfprWj9izVBaFHG+my/Ohjrsa59p1TMD7CnAqgj++1?=
 =?us-ascii?Q?s5nNRTbdVjrDNB9oewfA5liHplJGG18Vif6TbJ/CpAF16TgWdQZXLPi1BrbE?=
 =?us-ascii?Q?70IzL6WLR3OIvZshi2jPLx03Qhc2rOvr8H9lScADQcGn69tSBqpUfaER5Hhy?=
 =?us-ascii?Q?Qvdi9UTFs0PWAQZ1W9ng8JyNsoR3lNgB/LL26hbori6U57yZmiLAbeLG1ahl?=
 =?us-ascii?Q?loGrws7pX+46HoiK84NmLwrQZDdvR3A7FAoTd07VY6SGK9FzJ4xkzl9rdmOi?=
 =?us-ascii?Q?/QV78gCSDHKIziMcnHmtwt8c0ARD3Z2Dsa/DV56wiIF/4IbZTxoAr0d48jww?=
 =?us-ascii?Q?xJPIz2Y4Bn/o4EDjQxh/Py8nnVS0yyDcpq//PMkPss9O707ZAVssJbuQOs+W?=
 =?us-ascii?Q?ICaPyIea+HoeGeKJJbVJADWhzFTFTqAf8AWmH0eShY2PS4fN7iFvQmXc9YlF?=
 =?us-ascii?Q?cfFl25Oy2z6gntOgBR6fksBCUgKTZJMWpZ97X5B5wUv/674nBY4Qpf4RC6tI?=
 =?us-ascii?Q?o/HOPtrI10Wk7P8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AkeIJah8p0XqKwq7W+Ok1xbPyR7lgwpiT5yU1/tsNbcSru6KfE3hna/0Y9L9?=
 =?us-ascii?Q?34iyBZTEcgAxqe5QnslcJOZOPJ5WcDPv33yTsAWM3sd6Lc77d3yFCiJ6pFXi?=
 =?us-ascii?Q?qYTjAHcUJic6TFMG8Ht5CDWU3/ZVjsT6/eDr9f3zupJCUTu0nIL8X7uF9tP8?=
 =?us-ascii?Q?UedJPqvsBmFxprlF+cz4hoofDMrW9nPicM1AInCrKTmFUxibArEi3/nyIB5v?=
 =?us-ascii?Q?UbJvXtBp6sLE/t8jRWLD/NhcnxKSxnT8ll5VcRbLfOdUhKR9w/ClgASK/4Yd?=
 =?us-ascii?Q?5Z4lkp+0QbjAkGxbvoK/SkP8DsjFCx1gfcnYpYq2tvAnALykZ89wqgPC7oam?=
 =?us-ascii?Q?rSSEAAo1bzNBjh3yEofMoMDAaVygWH3/h4ck5QHa0nPoElso53RZMdBt8Wi+?=
 =?us-ascii?Q?OTEn6Z4GPPJBgEl4s9dR8FPIMsToQ8thwHj9qHarnnbKWJ+AqZI9KHqRPBjY?=
 =?us-ascii?Q?bwARcS9VdxPPJOHvw/AP+FOMoAOJtphBKbXTdm48JMsUUmWkYIvDs7l4IwjC?=
 =?us-ascii?Q?pQ8F1IME5d+7F8mWA1t4iIwutNbTDNg6CZaBLSbIqg05YH1gBbHi0kbwIxE/?=
 =?us-ascii?Q?HLyYZleaDCY1f4/TqadWBkAyhl9bP2vzV3/PwNyP+TeWc7Jga2tR7qHyh+V6?=
 =?us-ascii?Q?UWeCMPxxD2Mg9S661OuekJf4MRS48zhReiE4krqni5Dn328k542zMZMehZPz?=
 =?us-ascii?Q?FamveRu85pYnhZA5IT8U0LY0VE48X8BqGqOFI57bKLVrfPgl2RZfm6AEw136?=
 =?us-ascii?Q?OIcxzO8nMgUQcv9Fd+qbuvhyC2yumcEtksc7wj6JHoYECLT/MuNp0eAe1ph5?=
 =?us-ascii?Q?i613GPvqSG51aWwZxVRu18T6343cjzFaH7XkcxijdsdNhHwz7TI2dk2OzdiQ?=
 =?us-ascii?Q?BnYniHk8N9MyeaPwJbcusyPc7DzYMfR8p/ke5bjeVcX+eKIeHlze0TMiId8/?=
 =?us-ascii?Q?kdXX9Cq8moyAzdm3rPJaAv4AAotVxLJFYPau5PQgCEEEUYZAinQjrxZrtbgB?=
 =?us-ascii?Q?0d0g85oE37po6S4xsSUdSEQbT5QTjhVcB7wNKW/flFT4CHiZH9mWjGriGIaz?=
 =?us-ascii?Q?3jnDJmzys4n4wE/oRTfMfFYzXKtC1BbFrEp9FDpZxjWa9dXNLuf03Dba/H/L?=
 =?us-ascii?Q?0y8pyCO4H5jR/slJ9WgeRl1cJFc7PTVfCC/+vzNEoDg9IF4A8TqPCv2dCLLi?=
 =?us-ascii?Q?Szjmq7Y0emXQSa5j0NOeTN1kJMyYxaMsQM2KDoHucByUrU1n9ZAeWCpQWLuq?=
 =?us-ascii?Q?RSB2a9jfALc4pTYskzXP/XUCNeyou5bMiCPufY3MhFsHHgMPZpbAQym2TonD?=
 =?us-ascii?Q?CwIelaV3LjtWEmkibVK0vhaNnSCXFGixuYhN6t23toWWIG5hYVSjqgOG/1go?=
 =?us-ascii?Q?tJvxkpuJmQCKw92dbKti4PfiUz0U8qtqb2b8+pJqxT82zbzkZljX0aHjkO4u?=
 =?us-ascii?Q?fza7eh7k3HnDhwL0v/IrGwG1QDkhm70QMbH69px2Dcy9oEEo0IRxqYCTzIZr?=
 =?us-ascii?Q?zlE1N22zG5UnPmERP5UOlU3TWGUwwMIIxT9RR7QJyGjuDBOAZg9bJork8Rje?=
 =?us-ascii?Q?2JMN4TM7ozmuAOZyffBp2GF+MQBkg9nWqn1vR2RB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8046e17-ade7-453c-c2e7-08dda3dbf8e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:52:12.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6EbXmJkM8gy4znVeMK6Rhj40T0FuHwC7/vlCpTo4plEZZ0DnjxuOzONfSQbWmsoyGiUqpL5ke2e519TwDMzeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
X-Proofpoint-GUID: nU7wMQfhP8fpFVOyywTX4X6x04DGgF6Z
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68410660 cx=c_pps a=spteiRe5ZLpjmnuUvY+Cag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=vF-fKRXy8t_-i-TQYvcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAyMSBTYWx0ZWRfX8uRvyRGxHqCe w0zJMCVV9Yui5x1TX103pplnKDym0FoCCdsuXdo7slFxL7FW3EZj+CYxhNGPNvU80oMizcaGP/L 1/ascTpODIXLdX7XT/DX95XhdOOn9vw8NEKjO0U0p35HJwNWORRTm1SfrwOVT/thBO1MLtDqxG+
 88OEoQRJhgyOjfg/1IXYxkSwCNDUhgtBq7kAI2R1u3Ia2eFSnws6HbiQMMZibziXrTo/7RTjHUX 2iDfP93yyiaX5fNsEWESMeEkSBpPPVUqSPcI8H021EaWtw6MglduaegSeWWYaqI5XaM4rEfAo6O JdACgbLPEkudpyYXIhGuSDQ+jERWkOnAn8+gThHjFXV/oJlHmsJ+ggaNLD9sNg7vdIsYMa963oO
 UKN5keryHCgISsRHSHbKFTZ8s7Wh5W+4Gm8kc+l0qtLfSiwMzqR/XgN6dTpQC7Im5Iajr+Rp
X-Proofpoint-ORIG-GUID: nU7wMQfhP8fpFVOyywTX4X6x04DGgF6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 02:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117744

From: Wang Mingyu <wangmy@fujitsu.com>

ChangeLog:
https://github.com/valkey-io/valkey/releases/tag/8.1.1

Security fixes
  (CVE-2025-21605) Limit output buffer for unauthenticated clients

Bug fixes
  Fix the build on less common platforms in zmalloc.c
  Fix: add samples to stream object consumer trees
  Fix crash during TLS handshake with I/O threads
  Fix cluster slot stats assertion during promotion of replica
  Fix panic in primary when blocking shutdown after previous block with
  timeout
  Ignore stale gossip packets that arrive out of order
  Fix incorrect lag reported in XINFO GROUPS
  Fix engine crash on module client blocking during keyspace events
  Avoid shard id update of replica if not matching with primary shard id
  Only enable defrag for vendored jemalloc
  Allow scripts to support null characters again

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../valkey/{valkey_8.1.0.bb => valkey_8.1.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.0.bb => valkey_8.1.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.0.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.0.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
index 8662221ca4..1686e533af 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.0.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "67c8683792fc9ab7e295f833478eca180c5e4691"
+SRCREV = "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


