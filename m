Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89511CA0EEB
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 02:45:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11129.1755657951065653918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 19:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rf25Mj6E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0327308f36=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K1km702682441
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 02:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UBOFKomBr8IrcE8KBoP6
	hr32hNlvIvkPAWDyTkFgHFM=; b=rf25Mj6EqDswjPjSAijKPAcjAMZmfl+fCCed
	GYhVn3tRcO1GCYJUe+UtYQubDopfO72bhaxMrLgjs35MlDKk9LN4AO/RZnRQQ1K5
	r0dtfiOVRFXGTI+G6WvksJvTws5XuoToALbYQ97k6jifFCkj/q3+ZG2afuCC9WeJ
	EqcID1hf9XA+iJxn/T19lBYFbmm8z+I5zWYzCNUoumUZMY7yf8R5cgXUAE3ey0X1
	9BfkB2pgIC0AB9lw7WI9g+iDxaZ0fIwaBK+Va/jEupo50FP3NCCtr8HTygiWlDPM
	B3WBOGmeGZZbAhcQca7jy7LL+kBnHH9zVEhS+Md3bGRQpgsn/A==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq09dg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 02:45:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEpyNvAM/RHLjf22veTzYusWzmpbpEy2jWO9eFlASFKZUrJ5lqjItlsIZIrSAhuspp3nYwbvJnFs3IUgrO9Noub09SoBnnnAgfibUcyQgWTwRtEumTsSEfxIVF1Vc/f2Qzil5o3q/Dmkhmwn2Q7Ssr02ENl2Sx895RJnw7JjrdgZn0MsPoU+7+6/nLpMD+Bki8XLnWN+hGLxaAe/W9AMvAsVI3cMryrUfNLTaPU3txAIq30pKWHlp3G4GElf9tMtzZF8L5z4snXGY8SuWAo6QL1Cmn4MsWlDUtyS5aLm3nEy5o1Tue1MdrBaqV6JWzGgOqDUXej1A+uFASHEB1BFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBOFKomBr8IrcE8KBoP6hr32hNlvIvkPAWDyTkFgHFM=;
 b=Pv9dPTEDMF9AkxNswIP8TuhypvArBiO2oWFKLPsbz/DCZ2NKdaZM7pVfWbG63558SWS8usFYAw9D0YDNiJp4Z2dI59PTKvOcgjG1A4stu+4CBFWD8pxH0Tq8nohqgvsHD7PHGyfl8MEJWLTcM4zC7RpAEzZwZio4wFlTuSY1nJg3SdCsyQZCc6rGfDVsJbdeE1QVjtDSBZ+OU5rgbvbZI3tBjJF+LYGbbDIO/MMeNCMpKrbDYXkCHNfVzEbFz/1zoOM5K2j975UcS2jaPjzb8qa+mWqwETAe5Ly6rcwp5Cn1Amo7CeAgDJj3Xqb6eM5n0Von+vG+4Dwl053BbS6kVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 02:45:47 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9031.024; Wed, 20 Aug 2025
 02:45:47 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/1] tcpdump: refresh CVE-2024-2397 patch to remove fuzz warning
Date: Wed, 20 Aug 2025 10:45:27 +0800
Message-Id: <20250820024527.2917040-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0192.apcprd06.prod.outlook.com (2603:1096:4:1::24)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: cde51f0a-d647-493c-ce10-08dddf93aa5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lhd1BGG1nm3FdryGZfcTOr2BhDu7Fs0ozDjOCpGdFeveaoFM21xDq8KwLcf5?=
 =?us-ascii?Q?sYLKFGRecCilq/hEbPDHnZ4QyTWrvWB8VsSrcvuwubOypGMDcmqXVTw2epm1?=
 =?us-ascii?Q?jmj6otq7niKf0AAN+YSsMbV8serYgml8g05hp19md5Bh+KqUAPf4qIJZOFL0?=
 =?us-ascii?Q?8MHkQ5sqlQdLfYpTaj4ZYJFDYtYMi7ow7j5Hoct6uEaXdvNS7R7wbvT6ytwi?=
 =?us-ascii?Q?gjBExFplU+zAxm8yILIA++LVVwk/0BfPj50PgOFOhLmWu43Y0x9hV25HVGxI?=
 =?us-ascii?Q?13Q8OBjD0ZDdHh2+8U2yTBuzrkVhBEkMwmVL0k5RkrbPWHRcU8RvOhJnStjw?=
 =?us-ascii?Q?O/tA1iHQMGOQMbxotT77wLRjFdiTyHc9FRqq5uoD9067Y41RPmZEkNY3NAlZ?=
 =?us-ascii?Q?j1R5BzO1RP0kbi1wLVB/0PuhHIpLWYnbCTrop8B4PX4jAroq3OMhaTdqLmhm?=
 =?us-ascii?Q?TBzf59ttTjk1AURvi1qRHT8/IdsY2xAtrfvF23D7mbGySV19rqIR0uWWn80c?=
 =?us-ascii?Q?VO4i6geYk24UdaW8O9MZp1tuzh5x1agSBrJdPpkWqxsTc7tDEOGC5JpGHSeE?=
 =?us-ascii?Q?FzUspb7+4p0Mta5FZoCkdLvR2z9WZhXfQrTELRf3NEPGN6kqccTb0k3TGJEN?=
 =?us-ascii?Q?QqPiIPsMxsjvUiqEWGm+AbTdgh2uGzWpxPdPAoKIsEsFL3Pm+R0sWUSbfrQr?=
 =?us-ascii?Q?XZyqSukuwDNG4RPU0ifjDwZ3wkGDCvsa9UrpuJFidOica92dmJ6rUgTRV94j?=
 =?us-ascii?Q?gAw4pYwOS4GzH7SwJiU0fWC1sG7mTBH1RZu2Nkv9/2/eJeGhTFFu7JZAnOxC?=
 =?us-ascii?Q?dFXIHmaMZLfZHAIlcLSRX6G5E/OFZ6AVG4Lrzx2s2myE/n6OGiTEgwlS4KeB?=
 =?us-ascii?Q?b8lCjZIq2OqRSx0H2Lr2saoMXhUqjLz06mLLtkay5knYVikUa03d7kKqNdwo?=
 =?us-ascii?Q?3egj7i3biHBvKakFQvuyaK+e1BKrp4IEypa/GfunFqslSiIwPtTjtajfzMs/?=
 =?us-ascii?Q?nEzdSXy59dp0iHgqz1xK9Yb4Y9VXjNBveCld4U25Gqr5dPO6N0UANd42/KfD?=
 =?us-ascii?Q?m9DZj/ek/K+9dHUETPyc6qSUlGPmEjTenBvtZMOxTWvZRlZtvknCJhTXpK1E?=
 =?us-ascii?Q?zwajG/gaA+wClnUptQ2WfVwDSFei07v1+qaIuEpb9qus5l3gU+5X/L3CKtfb?=
 =?us-ascii?Q?pcWQwJho9uVR8HHB0pTIbm+mq5bhqNzLIL9K7QVb3GYeyaVBc5yRRqiU51J9?=
 =?us-ascii?Q?mmw7+UIzko+vUtlHgMfDyJK5hRpTkYh8O4EG6s/jfwYWxPJ9NIFqf1vgbRvv?=
 =?us-ascii?Q?t1nBeUp3XHxydMhxnelA5k4G3FsE7UpVLZMFCV6ZFH7iuSv+swLGSkSqcL+H?=
 =?us-ascii?Q?CL0RQUHS38DoFcxQCLzc7oBhtAIqpuJtDJ6kc3fhseCS+upvuH10mAYhw1iE?=
 =?us-ascii?Q?mjU8JzJCujw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CFHwtCIYRKQErveibiHqhBGxppR+w6mmzsHvibjnT7DYpJVKc0MLp34InEXB?=
 =?us-ascii?Q?sTZ7JwYkSpWHILEOli3OERpPBlnyiVs8aIyLgOhVYya70onDVLwxvoqTg4OH?=
 =?us-ascii?Q?bshjVRXmHVnwG9UE1eolRhyBISSrtaZNID6tX8Z3IQkK9x7P3Z7GSm6IFDLb?=
 =?us-ascii?Q?9XR7FN3XTUpXkoiW+1dLBKxmickhyo3CnnV14XhP7d10Vp+GxEpGazGCfQc5?=
 =?us-ascii?Q?KwX+f+umDAcSOAo0YY6ym0k3yhKOhEyMC4fowoXIVfvY7jj1XoZKc1sKe9BD?=
 =?us-ascii?Q?RF/5Bk8cjT17r17e/8JzTntWEINdPxON8SJXus+Gpj33dW2WcyKZfbxQhNSX?=
 =?us-ascii?Q?TocZK5vt7/NZlfULx96OApKxxwhABGdcvOYX/YKkIjawHen2Ze59IMcLDoOI?=
 =?us-ascii?Q?cFmBTGdEpeYZvXfH8XAymlZYTwym9TfDwlXqdJpt70GjZ601wwOzur61LKSL?=
 =?us-ascii?Q?uBQ7N6zyfwy6RwzdOwCxIX7bVGJPFwg4cfNY8feMdHj3Hyh5oYmNLvjynq13?=
 =?us-ascii?Q?raV2ecW4QyB55KzYs45xXKOtN4VmWJsbYVdGkbPWwMQnGcSq8OI8hKa6QtlS?=
 =?us-ascii?Q?655eE+esGrTFG8NvvhyveUteMgkFg5bySt6x1jOuxO8FlX7jxxS5FW8dTecL?=
 =?us-ascii?Q?FkqAunlp+0oWwGsPwk5tEbmHy12IiCwnq7FhsEMT8Ypo61ZnMqR/u8gNCKo0?=
 =?us-ascii?Q?kNXZVbM1Kc+PPu6u5DgpQFAvyS/b/BOOKuogL7e+IhBIeFnmkhPQDhJHw3MG?=
 =?us-ascii?Q?wGlf908lGTPlpFoDSbPR9DOgSbWqgbkb7IKTst5huWwiDf4QxYXHjLFG+022?=
 =?us-ascii?Q?5ogpOFge9Wl7oYK2+9f5N4aXNrA2vif76ui4hqKrI/pk8sRXvF4UEHglMPvn?=
 =?us-ascii?Q?GcL020V9b54Y3kjIuKTVdTuHBBRZEkIcnbC0bvkN/EunsigVilLLyUWyaW3q?=
 =?us-ascii?Q?esU/wWhPDxwBuLymECcjJHrUH9Gsuu1pyUX04R0hDeNaodeaGny94Yf95I/Z?=
 =?us-ascii?Q?UzE0eqc72bNthINUhbAmxu8tQl97jA/BPEOpfM34lJZCdUzyxtm1R59s49U3?=
 =?us-ascii?Q?JYoIfNmhy/W39V5EI8jInEDj2wFhaNRFRpgCk3SaqgvFzt/weEjFz4TeQXNU?=
 =?us-ascii?Q?5IcuaR0J+9oVxWA+FDa6Bx6lGVvYl1YJNvcZFBUk4KTfTlDOZKKuE7NZdwzn?=
 =?us-ascii?Q?8GLll4xls4XlKR+fhpmOCA1BoFI0AyHRTRj+wYPiCap+KqhhPHeVnGszgRpL?=
 =?us-ascii?Q?Ln1dzkilz0ddgx6rq71NOOneCdmAfkNtnIrsi6DqwUk+sn6wLhFlxkoEodR9?=
 =?us-ascii?Q?oitcTY1bgdP7LlsndMP/8FgiqlTe42G0yMZgRSmOo0TJGyicSsxhtlXKf10B?=
 =?us-ascii?Q?MTp8kUqoA1400AKLe1OUyEiNDITttktIR/gJ1QDepY8/biL1bBaQ3LPpscX2?=
 =?us-ascii?Q?fdu27jOS7TJ+vraKd6THz31gHsrpwQOjstkWG2tgp08ogdlZNu0WeY6gWnds?=
 =?us-ascii?Q?8wNX29v6m9S2SOIxCqi1PurnZ3j9uH9ZgFfKkqvMm6jYdqpA3uSbyW+QyP83?=
 =?us-ascii?Q?yugsy/sJm0Uh8IgmCFXe1QBzKGLwyvTMvAhmBD3RkjuVdH07x1eKEcXxjkzR?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde51f0a-d647-493c-ce10-08dddf93aa5e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 02:45:46.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSJFE4xP1pPL8fvuRsmiyj0kYfAtBdxUSBGujdq53cBBTiF/J+PC/JpFpcFINT9cqTXZFGIo1ixWibSodkbC7Z2vhQfPnwjXWVpuy+ntdBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
X-Proofpoint-ORIG-GUID: ABiweTN1-ojB8WkTCR0wAb7FubsaTozy
X-Proofpoint-GUID: ABiweTN1-ojB8WkTCR0wAb7FubsaTozy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAyMSBTYWx0ZWRfXyD1e/jgfBWgL
 Qt+msiTsB2k2valqUUezM8OAgNsyjoX+UuxQLvNAQtId4z7ceSOVHYSfr/IysUYH2bRdPjnM0E1
 W7Jf7ako6u6Ix0p5W2RCwDdhUOAjRE42Q3am9KIIg+IE/LaUACsTF7o+sBelQDfmI26di0n3fHR
 Cp+bdoQHN4xy2SoMDsL/gJzA/gOgkX8TtQPHaccv/HWk67du0V/EgC/21j7gAJ5W1ZCS2jeoeQ/
 X4sO3VC+vgA/agVyJmXh68CHRynsksc354MZT5HImyzfT/3Tl1i6/BAptrLQoN7xsvhR1/XfhOq
 JI2WpnKSp+XSHcckrwzBefF+FhNbRW5Hp9oR+6u9Y4yQUDKxFZtlgB0EXeqGxpkAg2vF8HA0PyY
 0XLOxvnC7YAPnLRh9aC5iz1MG/kiyQ==
X-Authority-Analysis: v=2.4 cv=SPoblOvH c=1 sm=1 tr=0 ts=68a536dd cx=c_pps
 a=sf6Aymw6zs8OwPgXym0k8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=mHr6GJ5fAAAA:8 a=fk1lIlRQAAAA:8 a=E52wHLAc1MrdafiitiAA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=N127T80v9oXcZuUJjtVr:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 02:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119010

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The CVE-2024-2397 patch was applied with fuzz and offset adjustments:
  Hunk #1 succeeded at 42 with fuzz 2 (offset 5 lines).
  ...

Refreshed the patch against tcpdump 4.99.4 sources to align context and
line numbers.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
index 169ec6be7044..a0e7df923734 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
@@ -1,4 +1,4 @@
-From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
+From 32a589ec83fa4536353f05df4c0cda05176cfe65 Mon Sep 17 00:00:00 2001
 From: Guy Harris <gharris@sonic.net>
 Date: Tue, 12 Mar 2024 00:37:23 -0700
 Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
@@ -24,25 +24,26 @@ routine, in case nd_pop_all_packet_info() didn't restore it.
 Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2]
 CVE: CVE-2024-2397
 Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
  print-ppp.c | 31 +++++++++++++++++--------------
  print.c     |  8 ++++++--
  2 files changed, 23 insertions(+), 16 deletions(-)
 
 diff --git a/print-ppp.c b/print-ppp.c
-index 2cf06c363..9aed23eb9 100644
+index aba243ddb6f2..e5ae0646ebae 100644
 --- a/print-ppp.c
 +++ b/print-ppp.c
-@@ -37,6 +37,8 @@
- 
- #include "netdissect-stdinc.h"
+@@ -42,6 +42,8 @@
+ #include <net/if_ppp.h>
+ #endif
  
 +#include <stdlib.h>
 +
  #include "netdissect.h"
  #include "extract.h"
  #include "addrtoname.h"
-@@ -1358,7 +1360,6 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
  	u_char *b, *t, c;
  	const u_char *s;
  	u_int i, proto;
@@ -50,7 +51,7 @@ index 2cf06c363..9aed23eb9 100644
  
  	if (caplen == 0)
  		return;
-@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
          if (length == 0)
                  return;
  
@@ -65,7 +66,7 @@ index 2cf06c363..9aed23eb9 100644
  
  	/*
  	 * Unescape all the data into a temporary, private, buffer.
-@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
  	}
  
  	/*
@@ -87,7 +88,7 @@ index 2cf06c363..9aed23eb9 100644
  	length = ND_BYTES_AVAILABLE_AFTER(b);
  
          /* now lets guess about the payload codepoint format */
-@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
          }
  
  cleanup:
@@ -104,7 +105,7 @@ index 2cf06c363..9aed23eb9 100644
  }
  
 diff --git a/print.c b/print.c
-index b9ba5997d..f20633388 100644
+index 9c0ab8622de1..33706b93228d 100644
 --- a/print.c
 +++ b/print.c
 @@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
@@ -124,3 +125,6 @@ index b9ba5997d..f20633388 100644
  	if (ndo->ndo_Xflag) {
  		/*
  		 * Print the raw packet data in hex and ASCII.
+-- 
+2.34.1
+
-- 
2.34.1


