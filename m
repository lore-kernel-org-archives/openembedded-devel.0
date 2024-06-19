Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A37C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 07:12:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15035.1718781127470016929
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 00:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6900432da4=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J5gBa9031850
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 07:12:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdra61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 07:12:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzsracazS66Qp0vVQiIiN+jgXrJwRiaaImPdG5gzyL+5KaBhprHVvv7rcQJNNhQj7Kf4aY6uvU95PD/pHxfH07H4X6P3RxDr/jVO6H08NlDvrMOfx/SkVCuZ3gUM2f0Jeneje1cj5UiogNvccYqR0VdZxB/jgp5qMYDLW9od9vv5B+3H2rrJ0D/SxSH4IhaUPliPFJwuPti15ntGHRX5YO30WCXu06HpJgbB5o9ZULsA6SGVlq/utOMRwgsE42lxOGfByVTh+zaHl7RdNMCYTxbQMg/QtiEiN4ptHkvO1CFBp6BTMQ9dMc3r9zmwnMpCSBXLq7+TIrHpxHzotdpTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58zmHd0bKMXQJJ0B/7kVcoM1VJUL4Vw+kd7j605IX5M=;
 b=YolVYQxNJK1jZJG9wg/V0NRsQtd3VG550Lz+01EhZrkcfW0PL565DMj8qsUPFpNu397Zr2zLdaCwmJYdiajh/b13lMJprItvtnHiu1q+mZmj9R6sV11mO7bLuAqKRdsCe/cJUd3nstqB84QNJxVyRzFHalUYADzAbP5agSCwY0OCIiqMjc0x7pibcFnsXYO8CvK6P7iuTQdGH9fiLIJ09u7toMsI4bnBRHGIoCGvoOAcgc8+cP847ytAMVNiGxYzdpEVBKd1SBdin74EIVwh4V5aue95cgRuTBlfLgvxxIqbkyc41sH3P/QT6YkCoMvJoH8Uy5At9lAMvyRWN6qdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 07:12:03 +0000
Received: from IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7]) by IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 07:12:03 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-pyyaml-include: support native and nativesdk build
Date: Wed, 19 Jun 2024 15:11:40 +0800
Message-Id: <20240619071140.1908305-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To IA1PR11MB6417.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6417:EE_|SN7PR11MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a400783-38e6-41b1-8741-08dc902f1e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZePjaOSpEyjsbT2V5f8w25nAgiN7WD0cQvpK/pURFLLjDsN1QdA2NLfdRWBs?=
 =?us-ascii?Q?QEOzU4RtCpKM0OOWon9I96lVumir9jeA/yJ5z4olFScZJmMRiqx3U7XMZijr?=
 =?us-ascii?Q?AkQIsfgOjVCQB77pk3+w6a9L9j0F8fvM2mY/l6XB5F8Vvy+ku3Z4p/o2vM2u?=
 =?us-ascii?Q?+3J6zivtOid2r7A+QimaWJ0yTIA5f3rFikP36XEx3iaDlxlgBfRZ8oRTQgU8?=
 =?us-ascii?Q?JlE0NDij48TsrCytyctIki7XBkvnXZfwiCdKVjlKVCDKHvLJsleSbDV9ex7U?=
 =?us-ascii?Q?mA6yHW+PVhezHk/TdNPYZXVVOgrQHUsx/tfDxW6WcJXFGzi4hJLnQOLHp3Sw?=
 =?us-ascii?Q?33wpRlyOrYOJVBebY8iGmluAdObsEfRq31iVgR1c3TxhiRIjeyry1eUH+VPZ?=
 =?us-ascii?Q?HNHj10Bcuh0U33A1a3YG0OXNKfohOMgfpZTJprjHx3rChqxRyfzDFYG8Qx8B?=
 =?us-ascii?Q?2dXh8Ww3N8UgKlKD4zRCfJz3nbYTszr7Cpk/aX3ruQPlnnFjjELe9DErObGd?=
 =?us-ascii?Q?Lh+Y3qz2463RSJq4/2lh9QItZNsrxdUHr1DnMbZnNewa3EQNAg4yCm5ogPqc?=
 =?us-ascii?Q?6kAYXgU83CVqaVcxcCDjO/OPaq3Xcpsmb8ABRLNMvAcH5W8cS5QesYb2GkOt?=
 =?us-ascii?Q?+W8AAIfs0HHdFGDJ+uU2K6+YVj+k0xTr4QGeKuHluc4K9IMNS7FEs+DatpSc?=
 =?us-ascii?Q?fRTbpMPY3tCwFXyz2fAQML2IHYTKrazIb9jxpoZ7gFvVmAPSyUZ6feeDjzY4?=
 =?us-ascii?Q?0rY0LmbhRVLea1dJJhs6tV5XkJYwG0p6CpyScjRvZKuYL/cqi1MTnvQIGfDq?=
 =?us-ascii?Q?moGTIRhC2hLfFcByobP6Nw452h2CVXgs1LPUaVYJKek/NRQHtFB7fz5ISxY0?=
 =?us-ascii?Q?1od4ld+V8Kq+2qyeMABnJC9Bg6RJfEGiSwIM2EVlUpkL10JuYBrTmEphyRfu?=
 =?us-ascii?Q?ehAYscz/SVK3wOoEFLs46Hdin2p78/6Un3cMGQ9VIdXV31PNvcpsuVGGtFAM?=
 =?us-ascii?Q?KtELDLAgKdtTBDm22SLmIsSKuaZsMXcUGtDyxCpFTYB95fQTvFuFPXiriQEA?=
 =?us-ascii?Q?53CcEzcrBE1thNVjxDphxK4fG6jrp/eD7Em+rVfnu1DL6sJAetkDk95kF0xG?=
 =?us-ascii?Q?7hXeG97GyuNpnjh+ZaV2tcv0HLz0hMOznD05DXb97UIox/knkNY57HgBWUIq?=
 =?us-ascii?Q?Ulqno1UBN/2NYia0dG9j/oAhpxbaOas/Rrf3iYnwH5FNkz49lMwWUq5qsc1C?=
 =?us-ascii?Q?/VGkvL39gq2Yz8RPc7gsk8GlPdMNORyNE5p1n6fYvxTZK+bZod/aa3YiMQxC?=
 =?us-ascii?Q?mKbMrXJqH3Hm8RLt5ApKsyyTDgIBUDDntIeM4ALyupACGuT0Lw4D/Z5u+1zf?=
 =?us-ascii?Q?ZGgv1cI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6417.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X1iS2bOKnwtSI4Y45cF2yM2XdCTk/X4ZOyDTDJlJuyc/w7iabT+yzdKBKd7i?=
 =?us-ascii?Q?RYpI1cjWaXUFrFV+N1Qmey8hDz2xkaEujxmVpAWUe557wdcarK2moqrS9qxY?=
 =?us-ascii?Q?sos7k5PDj2Qsde6pgNHqZfiFzByUg24f4zFekekkyjxWy8mqxw3I+uAKpIw2?=
 =?us-ascii?Q?cCNjMDgms+PiJjLEfFPDi8gmM8HIWc/34HtscwTNIJNVo1tgru1f10WH8Awp?=
 =?us-ascii?Q?tuu36NI654HfcOWRKviHIgAtHnAUHDW1WobR0oToxKxDDQBKg8wNYD/TG01P?=
 =?us-ascii?Q?K8xhsb27dEelmmhdDs1hGfCKGaDKwflXzwJnReVuCJZkFhiGcV1ogjLlwXi8?=
 =?us-ascii?Q?Tf7FTlUSFnXzVTO/jl06uPmuwjkLivYEZ9al8DFfrHp8cwLVUWduJ5MzHLil?=
 =?us-ascii?Q?gqfNjocamuuOHRcJH1s6ouV0QIFHliDFn/bkrloTdBoiSKjj9rhvu8byxtG3?=
 =?us-ascii?Q?GGv9x5hdEIfCyw/4plEP/kMpS6vucEHCHT5FnUpSqh/DymJJjJI2WwmoHTd1?=
 =?us-ascii?Q?mraoUcrm8a5m+tqGC3lXCOlv6LZytGA5AcU+2ftV9wKngc2B4TpDSGJgI/Je?=
 =?us-ascii?Q?le4hWuHqUbNHfI01vju/wCK6MsjmhWXuPu9Fh+IeMUoNXOeAYdAvx7Vb0TP4?=
 =?us-ascii?Q?lhrPLKDY0/mUKoQl7wMZm7siI3fyBPrq7uv3AHB+nbloIGnV6iR28FAbE341?=
 =?us-ascii?Q?pXJh6y1uPT8axykSlkXcWTsxpB47d1dzY7b7b4tEodWQOfczWMfz5q4oI0G6?=
 =?us-ascii?Q?vLFl0OSihLtoQSGUkZK9DbROpGJjSjyP3+BlIMgtMlXQ+uUx1s0pQgCfGfDu?=
 =?us-ascii?Q?GntD/J8d2i1Ahn0OJpIHUnjudVWpWXhZ5Z9j/jUGvG6tuGCkOa0CVRVd90Fl?=
 =?us-ascii?Q?YLawnKLiewu6QnXe7+EUWpm4syLfYDHBf0cWFWH5YdOTLYdftNBqFqUs/rwZ?=
 =?us-ascii?Q?vpPQh190gVk3qgTq/ET89SspO42tLt3ymiSjL5EUu5n87saCcXLR2My1lCZR?=
 =?us-ascii?Q?ABCHmcjP7bYnwJYmzJztH9BF/31ljMkvRUMcrof2b+0UL6NLGDHjkUVcS/Lj?=
 =?us-ascii?Q?Jc2uMHbkiTFR/pR6iL8ZKIpEYXhXiwhjdOGUkAQRHDuIHRzZGaCLPcYSoWOw?=
 =?us-ascii?Q?QVPhXMaoKO/UU+8ZzqNKx2cnHZuELpPlV2n1pzbyPm8q7uhqsoxMhQplIQoc?=
 =?us-ascii?Q?C3PWwZ7J75YizNUKdi+Cr591aRFoMWphr8x8UrJ0rk1lXQxT5LzFgIeESegU?=
 =?us-ascii?Q?wanDZ5C9iFG2MuqGYlqJkVI/u9QTIWl5HS4//oIZARhA+R2cSsPVeE7GNhyN?=
 =?us-ascii?Q?5LM2lzs4Vdt8i0PHrrN0P9Xn4bYgA/RzPl+jaBiSnsRcFByphsfKXYuY6L4i?=
 =?us-ascii?Q?5gsmlftbirx/hLtRhBcS8sm5hCZRXi5iif8wdEQpw7OzOPaqOBjifuBU/up0?=
 =?us-ascii?Q?NdhPxwaIr/htQf2o1SRAOlw44y8JednDDiyiyPbWdVB1TuiYyX2zzn4CafrR?=
 =?us-ascii?Q?1AeHSqzeKiq4YPPVQJhj3ijery15F2d4aa+JwHYAuQfXcUBsA+I8b1VadbJH?=
 =?us-ascii?Q?3pOZtdQkCaf4eBMCD5a/xn4AfV6ubaBJXDj+54jGEl/ZC2t1UIxHbszTYrOu?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a400783-38e6-41b1-8741-08dc902f1e6f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6417.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 07:12:03.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GROGEXNzdqwGDkbySDnJrdRyl2fRXakB+xwM4melYvNsA9ASmtlPLTJ2DjmG5aACUeMGYymbjvR893j6xhdVIayETpBxZYnnG93LCiT+Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
X-Proofpoint-ORIG-GUID: sSZY71rUjDl0dKr3xuC6fUB9C4myFqx5
X-Proofpoint-GUID: sSZY71rUjDl0dKr3xuC6fUB9C4myFqx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=964 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406190051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 07:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110960

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 56e2e5df9bba23c431bed2fa7794d5cc86c08f2f)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
index b60a0f9c8..7db86b96d 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
 "
-
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


