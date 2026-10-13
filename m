Return-Path: <Poornima.Lokesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BFACA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 11:56:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5310.1791892605799499936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 04:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EjDavW23;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4746b3645f=poornima.lokesh@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5dhLA1073230
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 11:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=M4ZtqeWX/q4ToAsLoCUA
	50SXNJQuSy8z1M6eEL8ATp0=; b=EjDavW23I101DDIFuOgAx2Jx3huehCxwJzah
	oKiwhEQESOjRqHc9LRNSZp5q7+BEz0v8PynYolcrDw2q0hMa+WeWkSUxzTrjXc0W
	rwS3BW5HzOCitzKsoKkwo2Lyk5JxEWbyTZZfn+t9JIzBsacQO8isfRe3H8P/qKAj
	IRhYH5LhPDzL6Kd2f2z3+r2L0+kNWtwpUQEkLpGLEkjCqzaZCpyA3SXmyNQExbv8
	P+z+EnSxW7VB7i4ldowsKINYDa3RAy7Ut1jELWD6RHDaLQKnfcjoqWYdi8msoa4g
	DICOOmW7k7yEzPt27TPgWgpUOnNkekBgbqvhZflGXZaLuS5oIA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023087.outbound.protection.outlook.com [40.93.196.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7ajw43wh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 11:56:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFD3RsvCCpmfdcSKZPnS4oxnUgFGXbAcPAC5X9JtojtuN/iy24Yry8V4cWzz7GqsL3kA+y7PWto25kxLwbUN5NT4TzHlBYNWxTdxN/EBddus4zTJ1dGTlqyQiF0YyHF9vthm9jvkOmvgPunfJHkB8pbqI+uu5OVeBZz7qc47gaP7xjyteFRyg7CrXdb0orP0Xj8AWbemifOf30l/y0s2cRCbE+arED52HvlXFl1lce138PAhSf72zM7IW5v5XUOqL297KI3+329NVs0nDRI3aLnUD2LcqwcJkuYwdaIrM0Ei7OC/P+VEPeRY5oPaJXf8raOvxoStOooCGA+XhuawWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4ZtqeWX/q4ToAsLoCUA50SXNJQuSy8z1M6eEL8ATp0=;
 b=TSRGXyK+k4L2TFu8LeTKTz7FaMUeTbtcTy+IBwL0QblcFDhLB14NYEUVcxf4YQBnC8DbkL5MOwfAhOsoymRHSBncXe75LnV2xQgd1fTwj75K5nqm4jgW4EYOXV7jNzczPqizzxERApfdvtoOtopuMP4bmN1KlvaZSDvYeUUIrjWA/veev8vxAcLCc0Clypw6nnGAdr1zOvjRXBpva87WgsEFA05/nfu/6j/MYxJz4UdpUcdDUc/IX6L3L7j8HfF+Jd+F8jJKM0LsUwCtwhsj3sVkeJb3l+dJqGYkDtIGkACjJqGFO/M36WeG15w3VbHQQz1BNMJGYzbuhJvkbEENBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c) by MW4PR11MB6837.namprd11.prod.outlook.com
 (2603:10b6:303:221::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 11:56:40 +0000
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac]) by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 11:56:40 +0000
From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: upgrade 11.4.12 -> 11.4.13
Date: Tue, 13 Oct 2026 17:26:03 +0530
Message-Id: <20261013115603.2114987-1-Poornima.Lokesh@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SL2P216CA0113.KORP216.PROD.OUTLOOK.COM (2603:1096:101::10)
 To DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFCA3BFC2BF:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d8fef2-5ce0-46e3-0811-08df29210a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|6133799003|12006099003|18002099003|10067099003|3023799007|38350700014|11063799006|261009223027099003|56012099006|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 
	z4eL7uy8uaF98I0VXS++WZfEC1fnYL0rPAy9XpPMI+J3UepZ6h4tYS81HaGhZ0j9Wi/xfh01zj4/A+mOVDpm1jh6p4G3Ans2lu+XaDkutGIuddbUKmbeTL4ilnkzbyaf+F5wIEeiY1fWAvjOhFtALoklDVlJbE1YYsNmb+YwvgRQBKQNNh1Q6deR6QdZDAI5QOPLqZNkbrDEetl6UbUq+b8n2dITpDvz071le9IRMRYiZDEhSbCQ8ziaqSkLZZLPrS6L1gjlqrbGit87BGQObF2R1RyBqRpD3A/g1oBpTBgChtxx7ZynC7WQv6nVvLuIg1xyTYNm+Th2jKS9FQqRG7/sKIhw4iZNwWUDHdj5NQfIeCspanwXqaVyhQSVMyNT4EJqKrHjHfVrsTUjSbsuHI5h01CPatwAyrWhUj5N92b10CKQq/+YnqaHbqBeGBavxZtkrivoHQfXYjRzONgdaXks9m6uZvibwmoR5ZJZhrdbcR5nCJ31jCZileegoX3ZEaHbuuqri9EMFiNMKIzhMH+ng8zNlwWjLnTUI0D6mcrsbG1I88+toSSqAj+3mdmzF7lG23jIF/aPbvbjQjOu2q3744odBxrxVXQQWddm/slED/5uX/kUNzg/V7d10avdGruifAzntmjaykvCqL1gqbIcsp3Gy+PorpO9WAA1AQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFCA3BFC2BF.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(10067099003)(3023799007)(38350700014)(11063799006)(261009223027099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xh6tbfeVcoqoAUAbdIEc1LlVoFPDPjscGTFqKdloKz2nydb/2yUKsvib4ZdK?=
 =?us-ascii?Q?SleeHIXhTNWaFB1IdsKiikAYRYaqA0xr3isH2nudiC6xDAQ1sFvOmETYBlAh?=
 =?us-ascii?Q?uUzpJ94+iM89Xf0BdrsxGck3Vk+tA2EJ+49pj2J8AquV2t9nnf/SbUrvDndw?=
 =?us-ascii?Q?m/FKzcXgv3mmWAP44BEfkbsGzqeD6idXwHHr8ymYS2KTN5EHRpvBntJa9nn/?=
 =?us-ascii?Q?onlU+58yuHFUKW5eCJmNY2TWuB1v8xaK/mXVlplnO69EHzyPhunTXUJYVq2X?=
 =?us-ascii?Q?RqXt8VZ6QZLPGQ+4sAmzljUdV6d9cT38TGwCBolajQJfvqAVk9zsOcaHSri5?=
 =?us-ascii?Q?udh1/C5coHYU45eG848fLnmhQeFnMZO8vgAvdk+acrWyoOQZlEgxHuXPBMal?=
 =?us-ascii?Q?1xK9jtkMYpDErlMXjcmCom1JfCiayR0vM4UDb2RFUfR6WPh1NCrQkg0XztvZ?=
 =?us-ascii?Q?ogY10dgnYeDkM3uOxC3IbRjkjKLjnz+pG7AebbfClvuaJ0vNS80wVG1IUlJ9?=
 =?us-ascii?Q?NfTs8OjeaurCaZgfv5OAwJqxN4LvdIhKF9d5XvWHVKSNjlgV1jZifZ2sRFM0?=
 =?us-ascii?Q?p+9e3rrMTCzTRYclRa2IUq32K3vFXJw/g8KiycZV28GVA1Tclqatvr9PeK58?=
 =?us-ascii?Q?u//7vb0w4/RZOBdKtVBNa1LMvMJj1wvUOlRO+36mcjdsugkfy9mlNR4G80+Y?=
 =?us-ascii?Q?xRPr4lqDXI9frFUe3LVWtT1Y52E5sB4lKu13h4XQqYyUcCVwE19ysizCvuCL?=
 =?us-ascii?Q?V8tZhfYDNZsCZpGauui8PvfqvjJ5oZNR3cXv75YV/qEM1nd3CrpY8qYX7/VE?=
 =?us-ascii?Q?BzMZPrCdjYzBHKMzew2WQmCeY8irquIVaQZxWcHXSTHUNUEdbxoCfRr9dpGK?=
 =?us-ascii?Q?Q73okis9YwFpfqGizVH4dZcTnqsgfzjZ0CvMT7Ed2Ditxr9T57DH2mmLpqjc?=
 =?us-ascii?Q?FGwqyY6iNN/9s6QDfuifJ3ozTs4YjtLw5OvExj6PBWbBsmkcZqvErspMkj8o?=
 =?us-ascii?Q?7bk7NuIDG/iKQ9XkDyLZ9/9UIIs6UI4LI1qURfdFoQ5mmNMgZA7JLl/bGszx?=
 =?us-ascii?Q?q6Q8dog28MnTLAbdkI08fnEaXzchSaPd709ie8g4VoCb7ijd0vn3xjKqpwRT?=
 =?us-ascii?Q?4QsZmyH1sncDCBDbQuqLe93VzAOSLH0VBIbQC2pI90z+/d1r7ohXEIb7Y0xB?=
 =?us-ascii?Q?SGSl6e13JxTnF+lJjyP+zzzMgc7vJaJWeMCFT2RTWJ+SDjkoNVk1KyDqIVee?=
 =?us-ascii?Q?2rdFqz8p/bQynJsaWKYflOeyH9tQj6VywdcrW5eEOqMQLxjUbTMV/HZnwUCp?=
 =?us-ascii?Q?k3kk1eR8t8aKkSKQZcwMMIZ/iivbh4D0poU/2acRwaiPMj9ulVOEKpHV++sQ?=
 =?us-ascii?Q?/sJPc4HnsuN4LSI+gBWHI6qhu0P13hHWbe5v9avUncNVknFFTkdOKHUY2OPx?=
 =?us-ascii?Q?I2HkZfn/evv/8Gfnq4acS6UvNsrX81yq/wjtmFk3pQEBh0g8GooxZw8e+nwB?=
 =?us-ascii?Q?KYcdtNIfl6HxvLLBFepdHyBwr0W1h3bSClD8d9MzBUVl6CkeMF1DhqmXSNbr?=
 =?us-ascii?Q?ZSRUVS2RoCENOE1RubccNDfwA+1BY5trMol1rDvwzCNcSpBEy+0srMPTYmBR?=
 =?us-ascii?Q?JHDzAgKKJq5P6r0fsI+5PuBvCEg+xcX3+pGJXtOkfL4Q+eBxt+pZ8RvLB4RO?=
 =?us-ascii?Q?qSMRCsWuT7UZs9wmbI22UBL1wWzF9JhaOv2/YGmNAadUM16P4PrwKcvv4HLa?=
 =?us-ascii?Q?VEpu7lUIv4mWi/b7A33iFFvKAOwYWAQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	Jpoz8pQp8/fZ9yDQLRWclc6djYyZeEBsW4rtljOt5ntn4/wSLGtBs0Vvko8nM4TmbLA+2aMBZusWVj/3Izi7/5a93pHN0o0/c602ZRkiUQDlXCz7ynhQyFqWZ+4OAwYAdcZY82LeQpsM5OGKLxkt7MmAagQjl2oU+UQQxiHxOO449X93XB/RNqooc/dKQJowJBAnWxhU+xbBG6603toeXhruCsoPqWr/TXaLi6ciGLWI8n8B2nnAvJKM+xkCJ+i1RoU/CAoir+/1InWRcFmb1aLCoDZqCiqOadRSyW99uPeeVBDQDddc64ZZwZpDsA9MyEPudXZse05yiqxcPI6BwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d8fef2-5ce0-46e3-0811-08df29210a82
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:56:40.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kk7wHgH4gm9U8nAkg+MDMxDg3uY4MGQLMtXErxg9Op+p9AzIBi9Q9W1oqgY/yRd+0/Z1ymfCpeD17NQoBH413aC8Q5C4OGsX+dmuFK6coDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NyBTYWx0ZWRfXzcfSxNa47vBj
 crWgptROApnnS6eMmB0I9laWNVvxD0//LETKvrnPCz3XTcBt4wLm8OKpTLF1RNRMMG01gzxvcvr
 nXbijvZSiBS+py4DBDJECfb+jVRh4e6EsVZgpDvC14Pyjus99q4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NyBTYWx0ZWRfXyiPViPKFQbvr
 fFw/3nV8hlWPGskD9T1IqA8u8IpPSSQ3OyaVG1DThcCFiPvB00R8w0DqU1jO3nwg8zR6a/D+0Mu
 VBf9uXPHnSYayvbT3TTs35+P4kQsuGdzf+wzyCLLgCeKzNXGJPTKZVmgDGe9DIDcN3IXiZMLccs
 kY+Gx02IHky3ZBRIHtlK4cUcXp6CjzIx0aYwsdlxWSjPTPKQytJmNQUoabvUOIlRW3TeMns9+Q1
 8PjZUjZTLOhQxaRYI9+b3L9kjZeCjPzaom9BSkZQNg0k3SIXjVX7H2PjWHGEabKrdFvsTbibAVI
 v1bRvdnD51CEOKArVVrZhCjx+ltS/lIaDs7L5BNzzO4nVL3R03C9O1DOJrmxSteCV+u5115rIwh
 VilVFMQmJ3wsAL9AjRE0vGxQHPsxVS0oU3UzK/oLwmT0OvxVN0G1f64b3nq9n01GYrCWEQ3vOJq
 LtCOEfuvUO6lPscSdhA==
X-Proofpoint-ORIG-GUID: 2zjbU-VRClwxCmNpzNVHebtBnywr7rZH
X-Authority-Analysis: v=2.4 cv=BetNQbt2 c=1 sm=1 tr=0 ts=6ace1c7c cx=c_pps
 a=DH6uOP27q4GouF/df79YRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=t7CeM3EgAAAA:8 a=y5Nd51aSfWJYrUkzOrcA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2zjbU-VRClwxCmNpzNVHebtBnywr7rZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69D5dhLA1073230
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 11:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130863

Fixes CVE-2026-107816: an out-of-bounds heap read in the qc_info plugin
when reading information_schema.query_cache_info after caching a query
that contains embedded null bytes, which could disclose adjacent heap
memory or crash the server.

Drop c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch, which is already
included upstream in 11.4.13.

Disable the DuckDB storage engine (new in 11.4.13) via -DPLUGIN_DUCKDB=3D=
NO:
it bundles its own CMake subproject that is not cross-compile aware and
fails do_compile in a cross environment.

CVE: CVE-2026-107816
Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
---
 ...e_11.4.12.bb =3D> mariadb-native_11.4.13.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...b11be28ae9b2432b2a661bf38a197cf9514d.patch | 52 -------------------
 ...{mariadb_11.4.12.bb =3D> mariadb_11.4.13.bb} |  0
 4 files changed, 2 insertions(+), 54 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.12.bb =3D> mariadb=
-native_11.4.13.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432=
b2a661bf38a197cf9514d.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.12.bb =3D> mariadb_11.4.1=
3.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_11.4.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.13.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 1cf90c8f93..390f9853bc 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,10 +25,9 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/=
${BP}.tar.gz \
            file://riscv32.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-b=
uil.patch \
-           file://c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch \
            file://0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-O=
pen.patch \
           "
-SRC_URI[sha256sum] =3D "5ab7883db519bfcebfdd2aac09bc5544a12ce328f39edd46=
d0bf01690615ef6c"
+SRC_URI[sha256sum] =3D "1bb254b106d0a7ca871cfa18fa6e18d4b80a7430f9ec9d15=
71ec4271a13def96"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
=20
@@ -80,6 +79,7 @@ LDFLAGS:riscv32:toolchain-clang =3D "-latomic"
 EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
                  -DWITH_JEMALLOC=3Dno \
                  -DWITHOUT_TOKUDB=3DTRUE \
+                 -DPLUGIN_DUCKDB=3DNO \
                  -DCMAKE_DISABLE_FIND_PACKAGE_Boost=3DTRUE \
                  -DGROFF=3DFALSE \
                  -DNROFF=3DFALSE \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661b=
f38a197cf9514d.patch b/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2=
432b2a661bf38a197cf9514d.patch
deleted file mode 100644
index a58b6f112f..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197=
cf9514d.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From c21bb11be28ae9b2432b2a661bf38a197cf9514d Mon Sep 17 00:00:00 2001
-From: Daniel Black <daniel@mariadb.org>
-Date: Thu, 21 May 2026 11:54:35 +1000
-Subject: [PATCH] MDEV-39692 innodb intrinsics fail to compile on ARMv8.3=
-A and
- later (but not ARMv9.x)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Assembler messages:
-{standard input}:169: Error: selected processor does not support `retaa'
-{standard input}:271: Error: selected processor does not support `retaa'
-
-It happens because the pmem_cvap() funciton manually inserts the `.arch
-armv8-2.a` clause, making GAS believe that retaa instruction (inserted
-by GCC) is invalid.
-
-Replaced compiler dependent version by using the generic sys instruction=
:
-
-__asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
-                           "r"(u) : "memory");
-
-Co-authored-by: gemini-code-assist
-Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Reviewed-by: Marko M=C3=A4kel=C3=A4
-
-Original solution: https://lore.kernel.org/openembedded-devel/2026052011=
3418.2523208-1-dmitry.baryshkov@oss.qualcomm.com/
-
-Upstream-Status: Backport [https://github.com/MariaDB/server/commit/c21b=
b11be28ae9b2432b2a661bf38a197cf9514d]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
----
- storage/innobase/sync/cache.cc | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cach=
e.cc
-index c5e67709e22b2..064c29d6f0205 100644
---- a/storage/innobase/sync/cache.cc
-+++ b/storage/innobase/sync/cache.cc
-@@ -82,11 +82,8 @@ static void pmem_cvap(const void* buf, size_t size)
-   for (uintptr_t u=3D uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
-          end=3D uintptr_t(buf) + size;
-        u < end; u+=3D CPU_LEVEL1_DCACHE_LINESIZE)
--#if defined __ARM_ARCH && __ARM_ARCH =3D=3D 9
--    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "m=
emory");
--#else
--    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "m=
emory");
--#endif
-+    __asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
-+                         "r"(u) : "memory");
-=20
-   __asm__ __volatile__("dmb ishst" ::: "memory");
- }
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_11.4.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.13.bb
--=20
2.40.0


