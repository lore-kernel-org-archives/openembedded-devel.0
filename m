Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E775ACAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:45:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9589.1758710723318053728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R7dbscaS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362e8e79a=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O9twHC289094
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=R8EoYTNEh
	LO9BiCscmo5JZL/DpsmPq5e2LV4bcVTALI=; b=R7dbscaS3M/dseHYEz7hGV0iR
	NyUU9OWYr5BPcQfFJb5NLwZgu2Zy2g5o+pMLHA2+FCpr5nof0rs9lIxpzQGx/ZHu
	0+Att/YAhm299mvWFCC7mNzXuYJ1BCbo/AXMsryfFPh/W/M84LFizUOoYYlbf8+k
	JOH5e5jl3Nf5S/S2v6IL58/yJCpBSP7H65Za1T9E6zdY7uW4f/XJ1ITvUKP4BfVV
	HF4K319CG8vYMVtDWfiUbqMZQiAO8yNeUgXeplLXqtcbDql4Y7XWg/Voa90DD37m
	yHpmiE7Ydi4pMxO9+c4ZXZY7lD4gbysJatP2Hd6831yoOlUZSswObXi4zsBwg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89cmxp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 10:45:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwxc25JvIIHzhQn8EpKndrswon1/NM39sFpwqdR+hZSNV9v7hFoqYlxJLSkSI8sgqjk2/uAjOyDxz1H7DdSzV1Ec0edMxWZrCkzQ/JtAG2z10JODLY1RwnE5n31ifxzQ6PBeKzbR/Kc8j76TvNaQjLCiZyuIH9ZeO/CQAfUGGCctnuiVnwTZiJV57cRRaDW0xaNA8wQYPjTSnQIeCz/lCaW43SF+04htWWDVy+mKaICaSnHMU274Y5zANrkRNcq4ZV7mrPJ3YecLIaMC/TfTlN+xG1AlhotSqqmUnyeYO6MwsEfQPwjuR6u/wjRgaIMm+lAUWygEZUJHswjK1UOLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8EoYTNEhLO9BiCscmo5JZL/DpsmPq5e2LV4bcVTALI=;
 b=xEcPtF7Vj4ldWdg9tdBQzt7JjWSLj1M1LiWXMQFhCiI6uTh84ovXsWqIbaygB6Se9GUUvmOP6Raogv37tikTXVVzjV1NpS/3FhcKm49gEE/RiPiHhiuGLwORkwYLuG6ktfKMmCdTUisYgwKHbDb+Ye1850z8q8Er5ANQvF8i28GhSqB/6Mny/T0ToRbs/GfJcyuoXhpUCgZ8QoGt0+4fYXRYGs+VLVfKB/qtMhqAuSCM4dHggkcUYFmYdGcQuuBCR9NBOE92vU1ECoywNdLgsJIhQ0nMtXGGU7qZnp+kOhVy7RSGC1Ji9ExlBk1sibve+yu8K7U0+O0Odztv4pSrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 10:45:19 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:45:19 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@intel.com, Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com
Subject: [meta-oe][scarthgap][PATCH] layer.conf: add bpftrace to NON_MULTILIB_RECIPES
Date: Wed, 24 Sep 2025 03:45:02 -0700
Message-ID: <20250924104502.816035-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c87f1e-462f-44a0-02e8-08ddfb5774b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eWcNxNsWmSwwdx8mCF223kCKOH0b7JXcrKqzYZK+8AjWYdyPSz0B8w/IvKHM?=
 =?us-ascii?Q?sWrumJriGBQIMBY0po204H0FPVa8j+7BZtYmooKh/f2d61FPJdyZbAYQiPiv?=
 =?us-ascii?Q?xdUbXANi8qlgpV0YmvjdLqus3WUW8hnwYXEjykGjOVmOnLJ3CIm4JgBj/C+M?=
 =?us-ascii?Q?ruxlmR9nZGHllo+WiJrFPAprzJTYwPHDD9eCKOewOrIC7V8LmUfGPthAkf9j?=
 =?us-ascii?Q?jr2VMBd/Cyq6JUFnnmRwBnINvpK5GpfQJpNpoyIK9CLWxTFhmVz6/nR/Dq3N?=
 =?us-ascii?Q?BVhcymNVcMygiVTgqmkHKuxtE0aeoff+yhO5Vppwkj5j3rgwqfGNAQlZKGvA?=
 =?us-ascii?Q?KIjhdQEjwpUuEotWZzFHoAeaK7UuoXwSoK2bsGxwgGJvYDGGS8SpyXw72h9q?=
 =?us-ascii?Q?Lu3YlXa+euX2wZZ4qy00Sss7J0DZ0OytUtLtKgN7MA+fBe9TxKt5bFSVxd4n?=
 =?us-ascii?Q?NJjatjK71wTCMg1ZRUgrUvbFJH78XuxQQTM+jmcmOLkN0646Mu37cgfYarlo?=
 =?us-ascii?Q?AvBMSEoIGhixX8AdEzOkWRP+EsWK+Dd8uWXiksm8TAfpnKy9Hp7fSlMAn2oI?=
 =?us-ascii?Q?OgsWqZ7ICmhecgEAqgEZid3EXJlPqFxNjGLuv21a7atZpzLJHT4uTAP53dbb?=
 =?us-ascii?Q?XT+8ksCrLbL+JGDxie0vQQYIx4wnjtUmjnriD/VAmhYOLcvwO1H5wnm4cH7m?=
 =?us-ascii?Q?blJQafaMzck74WOSNReKXphQKAyst8v1diJ6B57PA9j1b23o5XKiwJGPBkF/?=
 =?us-ascii?Q?Buzcd74XHJx7RceyrTgxBsrixpSEaCrI/UCIS3WLIWb10CGqQYGostzegTMH?=
 =?us-ascii?Q?6Qv0Lx38grXOVYGfwri8DG6gFw4BdEfqaCL5grwM5PNaJF9JOscilWWtxliJ?=
 =?us-ascii?Q?QF6rMSjvSH4jXEi3DJ+heQI590KM8MwyvLb81H4kHPrCUQWd51OKPAS7/Xj6?=
 =?us-ascii?Q?q74SvBFiSA/H7InaSCUbAbSsbZ8hs7ALqTezMsXv+vEsLhK1H92YolshHT1j?=
 =?us-ascii?Q?Zselnu6hStQt9jrGEE6hSm2dOgxwh+bOjmNQWFaYkqm6RZn4GRBxVPlRDfIY?=
 =?us-ascii?Q?5IyYoN0YGN1k2jKvFLe04w3Gi6qZn43b2B4yUqR8l/LfW9mAHR5HUSMHqE1w?=
 =?us-ascii?Q?e0iSqpGq2dFv2R9N3poL8sf7zOY7SpEFIXiU5hTi4S3UP+DaNlAlfStJ9yCI?=
 =?us-ascii?Q?0oTkxp8ZmLDjMdZ8PD305PgxCXbf0YoD1iw2O0vIOKuih4x4Z5DdSP1Pem6r?=
 =?us-ascii?Q?dnNvrvSi89WCQd4yZDXZ7Z6D375gYQ7bTW1WulApz/l8+stdwgP38HsElj7G?=
 =?us-ascii?Q?iOskBn8EfqDkccxt+5QF3Xpjdgcbe/hI+pgs002GRA8xUm7Uoll8xfY/WwxZ?=
 =?us-ascii?Q?eZctARkJUwHA/L3ZQjwZLmIra8UfrMXoO1T5tz43oblCtgrXJ9Bkwlr1Nh/v?=
 =?us-ascii?Q?1i4UoOnVsK9RZB2MoZd7xJ6PWv1vvkXUhn6+haZOydq4IuVFSNVyFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ROoAMsWQoa2XkFgbvcuhrBaVX34xRoHbdCADUnHq1qKH8tAaX7MnIwr11som?=
 =?us-ascii?Q?aVpscf25tqrlOO8+V9uxvQB2cOopXQDCBWZeRnsUa0eMumQnB54O6Swa65A7?=
 =?us-ascii?Q?xWQmG13dBlCOlVinGLas5cKx0BTCBtH366V17L2GNc4z8tuxfgHPYjt4BskH?=
 =?us-ascii?Q?4a6FFdcS7khptuS/7f8Rsbd/kSusZPd6PkK77btVy/yip2UYnWVSnqsSRSSd?=
 =?us-ascii?Q?oBB5Fk8egh3IpzFmsV5QZq6Yc1++r6Vej01DzMhvvgwobk07tQGRcmgw0I3z?=
 =?us-ascii?Q?YTxuIe3t7W4MbsbTCOOWDCf87xr7YZ55My3FSebArG010cNmah8Z3g/WhN2U?=
 =?us-ascii?Q?jakkT4AlBP86FRljjqhsgCQ7cGNmcIgIoih0eqhAJbV/QtyivkgVrt9cPeqd?=
 =?us-ascii?Q?Tc+nuFT7p/CaDHeMG6DxlstNOH+KJutmRseqHoiJ16Sz4/qM1n6LnYdiZxH7?=
 =?us-ascii?Q?gt2CFBC4k1Vu2TrqCDOY3lYf4QiV8+aMcxF3zb8q5oa3tQhgQHbY7eSSZTjj?=
 =?us-ascii?Q?IOWG7eLZzoU0qrfh+XpOthVxZTiTGcjrZDBQou2lxZ1P7C41tRGizDGGZNWA?=
 =?us-ascii?Q?igmKKH+8QQibT6s7446xr5f1W6nYQHZvBfRN7Y4AWsrTQlB+FEN1zz5YFP2u?=
 =?us-ascii?Q?ypNeYXrqQV4px5g8n4+BbM/W/mVgNfpn8J+/98Oo7HrMVrkqUKqSW+Pwjcge?=
 =?us-ascii?Q?qs1TVvyLVt7cRq7pwt5HYyE5BgkB1uvJwBHH6eVSyCOW8wOxws2vOu6PhV4N?=
 =?us-ascii?Q?t46S//rtUGk/nEA0BS8LWOkCopmVh2BUyBrHeh02sf+TQcKDxL6ozFNBy3Si?=
 =?us-ascii?Q?qcGhh8CzTjoYS8fHSu+y7R694SfGWQczRkxvxc+KPhAPD5oXUmDtvxHfQRjQ?=
 =?us-ascii?Q?ht46MIz22edFDOSymhpYNTE61sN4hivxUDZOL9FEj6DAWVUQlTdbm6f8YYr9?=
 =?us-ascii?Q?UlAXxVt+jM37V5GxtcItkzXsP63+sdVzfiAwn2pblVlTG6bUxW4/m0YNJndc?=
 =?us-ascii?Q?oNC2sCc+b+mhGqreFphe2hfYrugu6Z9UKwGo8O9Px58ujXjHpEj5qLELsWxA?=
 =?us-ascii?Q?kd6TZRLcK8sQ8TGapba3JVTO0l2cYMPbwmCnt5gJTlJhWFp2dq+JBehH8oVt?=
 =?us-ascii?Q?egz8NHXt/Ui0LC1Qls/47cSQ7Pf1kYaFU9gUa5qUmp0ai5/gwHzsLUDy9Hne?=
 =?us-ascii?Q?2bPSznV3ZVh+CDNIwlEvUOAkojDax+XJA3LJPkm/8BCmj7p4tEbWB1hTflMO?=
 =?us-ascii?Q?Tv3vTwkFL9jYCHsuNqUyTVRf58iQ/cGMBEbqaWvuEoN3oM4jlCOf0UWdAC1n?=
 =?us-ascii?Q?s3HDG65CQjScYOqoEvruA+EonLrtrUS9LIKuSqhH4KJ9GaFQJjOUknYIItV0?=
 =?us-ascii?Q?F/bSNW8BTOae9PaBCTQ2hKAKvXRMVfBcm6unbzkwYFFWRVglHa8Kawf6IVRm?=
 =?us-ascii?Q?Wr2ef6Mc23w+4c4TX0yqvA2l6f1hLT+0txWf3E3Z1KeIzabNeDuyKIE/ru/d?=
 =?us-ascii?Q?ZKFjoXfFxx9hzC+4a2ZOGQi5Z3g2zZN724vaRAwQU3iTjNr1AtqSmgA6Vx1o?=
 =?us-ascii?Q?17Rl6WcsXnontFExxcHxQVDXMvpzKfAB9oGPCbHg1i7UcTnPtKCOIlu8SZeV?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c87f1e-462f-44a0-02e8-08ddfb5774b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:45:19.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5G8ciYQ0wheRnKttZkdiOXrqt8BbTgVTTg2xnjJ18XlIk4sOvyrTX4wcjEqtrk/KAKgWLMVL/ZsknJQiMGu6p7A150WDZPZgRxRsXwm1Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA5MSBTYWx0ZWRfX0t1XT2Xd4bp6
 u3FaVJ/8JoowyAAx+Uyv08S/UkLbmYil88pMaaNc2hXJFpvYgEr9DwU+3NRUBMC80HnpurMKc+h
 CmM9b+TNcEXI6S/yho2VsMZvwdplMzbkIiywxolc+SNOFHzT20CSLZv95MxjJ2VD57yfAbLkbg0
 hCiRnHVSIKD+fjxdJ9sZOpPRvi4BOF9dT/YBPLuMcVogC3cuTjAO/+s8EipCNAjML5o254TgVWC
 UBINWu1sBRCyaCjc7eiJIQsRPmjPgrMtiEm5LeXEzvJ3hkN5jpIISGkk+1f3yIpkHx6Z14ktzz1
 VTi7nPnnqQhPsC5GQB4otIQw7esN6i3elsROxOYv+l4z8SLESh0GLyosJAAi2g=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d3cbc2 cx=c_pps
 a=YpUwD7Le0KImUpHpM7zjfA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=ToliOdm6Xv3mqA58rcUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IQQ4j38Fk5gvhCPSsD0W_01ssMP1rLyH
X-Proofpoint-ORIG-GUID: 2Tooibu0o2xbBbwmMQs8EjzL08XoUONZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119801

From: Sunil Dora <sunilkumar.dora@windriver.com>

bpftrace need line up with kernel architecture type,
so add it to NON_MULTILIB_RECIPES.

bpftrace must be built with the same architecture (32-bit/64-bit) as the kernel
to ensure compatibility when tracing kernel functions and using eBPF features.

(cherry-picked from f8498f26991fbd8ea996dcf7c63d1c79e9c034a7 in master )

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 9faf579b82..463d063f0a 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -114,7 +114,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole libbpf"
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace"
 
 NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
 NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-- 
2.49.0


