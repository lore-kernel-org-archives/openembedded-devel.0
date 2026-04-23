Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E148FAD3E7
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 01:33:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3278.1776907986765214125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 18:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U863Ewdg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573f998c0=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N0T7Cf667972
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dQW/QIwehY5WwOcGPwW/Kps7fXhpaJsC++prX4pqhoI=; b=
	U863EwdgES6nQm0w2TyNW76AR0wu/1gnrFPPtx9Ri1P3ldiSHxvf9ZC7H4TKdNHy
	ssjJAepmbsO5vnc5DSgH+Y3FrZfatkjRXBlFfU99S1H+Yk8izJXbG1GQ+zb+KTXj
	fYi61zymrDZWCv4h3evhtp7/CQWFwk5DfkzWYzJBRrg3k6SpZbi50HrYK6OXXuFJ
	2x/hnrcX2tVODC+g6vv7eqE4hoMBUtmly7Tt3FC7mNidHxE6X/ZxMZmlAbJMt1yW
	tS8RVNDWD6lVOhrTF8HO7de2PcW6toHlw9uG8FAdDPl+wmO/4idx/p4Xjsv/1Tlk
	2elQ3yjNt85Ay7jnjXpaiw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc01p0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1718ZxIqjtaFyArKp1RsZ2fUR/q2nsYE7EdDQ6NOQkLvr7epXiyJverqIg/XTikoprxxNoWbOUvxDgUUBwB/m5F2YrExhXEFyV1UzS7Bauciknve28z/ZlZqT671cUGX0Cehmff90/y1VD2ZoqaUZZT5AoXWLZNB5kTFoBDQ0j02aOwGwHA02d1uR8zzLTAFp1avopwIV1UMqs/Frk9O0+rtT6MoGRMGzcd01Rpg6yy0ptae5Ukc1q9P9krfi6lp1u0NbbB9+Ljo5A0jEbvDV7G5bYgI6pwlGIiDhCDBJQv8qtliumMCs7EDONIlBYhKY1u8K22PQWcXwnqai+XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQW/QIwehY5WwOcGPwW/Kps7fXhpaJsC++prX4pqhoI=;
 b=c6lQI/BmpBMZLWtPYeOspu8kPXKqmJh1yEiV2+zYCu2lcIDvK6I4n5ITG/E8qk2C5APMkEKdpUgW6rMdjBTazbYi+Nwc5bttaLBq1lI9kCvz2W+qCOTaaeFz/wPySP2SnkmvXSev7aGfJEmQW3DkvHo+1MrCNg6VJlznIAUng082VQtY2RChDxiX4ltzEjn2jKZP/LMGhFVp4NZCDYGQXstMS8m5RVMoohQ0GG0e4Q2A2HGD1cB89d1OSECfuAPXC4CuqMc00PSlW3LouxLJhEYb5MqJUrW0+LydHWpoYLj4RW/z7UNeTLZjD0iAxcQnY7a5yNrBWuoQRoh8ROZ7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by CH2PR11MB8833.namprd11.prod.outlook.com (2603:10b6:610:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 01:33:04 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%6]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 01:33:04 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: xiaozhan.li.cn@windriver.com
Subject: [oe][meta-oe][PATCH] jemalloc: fix always_inline build failure
Date: Thu, 23 Apr 2026 09:32:51 +0800
Message-ID: <20260423013251.1874006-2-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423013251.1874006-1-Xiaozhan.Li.CN@windriver.com>
References: <20260423013251.1874006-1-Xiaozhan.Li.CN@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|CH2PR11MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0c8e23-feb6-463d-8ce9-08dea0d8438f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	AXfA2EHiwGLfEUePBUAiBTbbgy0dJSVRO7cSbArgST1wwWNrc/ALi6jPU9N07LuPV6BT8ea0uteaZ46m5TfaVeqNOq8NiXivN/Aqg4Lgl6JjQAvrAHfH3HwJecdh+n9aiixQLg3h0wY8V/DjpjEka6TFoeaJduVGJVFrVDtv/YXqiDvJD82Y+xcPxW6K1qBP9/aoHccDWOhKwAgDENzPjBDjhFcq6AH7GsL6tq9I+X/TeXirR5id6VMFs9IubpuUhjs9reujpHyQlhSF2BrR3uHAqu7S5aed8aB7xJqLoiq73ENxD+W5rMLAWTtXlkmx54HQUjJEggYujCdDm98WI4nxj2oARlcXfkh6ZUFqxQhxL+t5fip4w+lpfC3tZTY4iVHe44INnO1VzFw3RNSCs7RMZ5XI9Bopmwte95BawJA6YZV8LeTv+SgrbeHMTnodUVibRsu1AwDTNUoVlqBJa1BB0k5RNgqUI8XROUk88HGMBPVV4U1tJhAtDFNRt02HqZCB44HaId8OpEr2g+0GYVRD95Q8MO4unDDe59h/60qJSWZxjRzVTRUE7u4RSGxDPGny2urWAZhwc7Uya56Mt/jDbis4JBnzxJe253URRv/9I4gVb7tqA/dMd3REfwAioe42lEUru0SV81HjuKMRMaGRBdZJ/t0a1R1PEItu9cdGqZ0tGi5C8yGAPAG86BJ2w5w8s7srDmJBI/YWOEfMyxzRMT+eYpJBWAPo5iVlhqRxzR29YTy1zaLqgXt2vH+i5BUgnlw0mcidcpw2dQ6GL2UZXF5h2fDaQ+0B6cnDQaE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fCmHCr4ccVsJwdw2KvJuzIjg967rrTNAQwEpTuaARzW4NOrdAAgpdfzrBqVk?=
 =?us-ascii?Q?rR85qGfhRQrBzv0oIH2482KeekZF6BMXmyTRZvrOnL9wHSOytITRIyStR95Q?=
 =?us-ascii?Q?FCSJFXKdBEPMx83k/KqTp4UY/jdvpc2KiuzBriJYLG0foWMnWb6MIjKfizOS?=
 =?us-ascii?Q?9uiMbS7eaqLattgC40N3ijoyL3nSpGQ97EPqhhnTiy/Lfz8K6wIcX9bmcAaV?=
 =?us-ascii?Q?H6NUHXfMlSED7c0fbNVDKN2k8I4ODJex0T8ZZ2AlIVkS7pTU4mxW800LMXHx?=
 =?us-ascii?Q?wZhmAU3r8iARpROxuZj+ADR0ROAtbENwNVqWsiFp0wDsvMHCeLO4s2MF09Lu?=
 =?us-ascii?Q?4dCjblHbWnsle0U4GEf5Jj2tbdfzExgdUcq7QYkB5IRlJScb1N7YSUXXvkxn?=
 =?us-ascii?Q?d4VzwaDBIe6Cy0fNtyP9N+wpdkZaNOpKXxnbpZQMenwjdSkNd/RRSBsewQoe?=
 =?us-ascii?Q?ngVpx7vQ1yZs7qcuHkslWAt4fxd9p9unrV2RWT71LeOwKVB04E9iQUS+9V3a?=
 =?us-ascii?Q?cO+1fXOIdDKT6MQM+V0kfQNPdmFy3PeDCdz4XVioG2+xTMI/VqF3HHXWjF9W?=
 =?us-ascii?Q?MQ99TC9eAvtQ+rAgur4V1sm38u0SolHx12MKZP7x2FH+iczKFFBWU6cIqR0t?=
 =?us-ascii?Q?DWNOiM5/VXTee8WIUNiYV8IQVfdGjmB3M1KkZIXOzYeGcxR+KVnGLy++oHqE?=
 =?us-ascii?Q?oKVajRjwq8Amvn4A4Y8lNEh8CTpRdRJ7jpWePsyI9i1oIXqwqNQJozs49vav?=
 =?us-ascii?Q?bumVwZUFyjQw3Uacln2CIeWQXhmBOZFF4ywE8RGtRz5W8Fo8iI8q0IR4hkW+?=
 =?us-ascii?Q?9mILY8JWJ3eDW1LmTl67volJ9UY6+wl/qOLLStfnMC3l8yx+AZHUpTFgFs7v?=
 =?us-ascii?Q?YuYD0wn1PPhFk11lO7T2SVOqq41Z5ghzrrKu9Q7WrU4YmVBexu55M0nuhD5X?=
 =?us-ascii?Q?Nq4fdNwtQNGlE7+MLN+Apq2TdKnfkgxxTU1q4HCi8QzgB2gkTVAyAbec5ata?=
 =?us-ascii?Q?+g4hqaAvusXr2GpS7qYouBMPDGsWCTHsYS1vm/gYKhT7gqNwjMQPH9MxVHOr?=
 =?us-ascii?Q?EGfdCSO43szIh00tFGDLqEsPU0eUKDvfpMhDsGwBtGjjH24Wsa3/dyzHc1k7?=
 =?us-ascii?Q?oUtC2hmBR6ZR7PaBy/LGR5PGLrY1ZFPYsqQN8hBJ79S1swWUwfgQ+LkrARyv?=
 =?us-ascii?Q?/J/jOKOnXuxXlwBthr+mLUTQaGYHbVMy+40FvvtYN8tZUHPK11GJ/liWMmWp?=
 =?us-ascii?Q?H5PYL5zAVtIoWcmzl4BKVyoGhbhdc4A/pljr22YIWWy5hIWIMBAxalAxiNOy?=
 =?us-ascii?Q?YQ04ZsqdU9lTmc7vZRSZR/1HvHH7XRAXDThsKYuvm+EyDfaxkY+LInRQJNmM?=
 =?us-ascii?Q?EeL2PNj5H1ww6+9a+bwTpNnGMJLyBWwZaNV764ckZDolAr+LH2sYA8k0N/ez?=
 =?us-ascii?Q?ITm+p7/B3CizPH0V9PQejhQtGRs6uc5HbN8jMttZPbIQz2d0meaXbfSVpD93?=
 =?us-ascii?Q?ce7zMcg1eG6PMxU8h+6ZVYonBp3VZDPmdl6C4yXE+vqoZWSPXhQfUvCWG/vq?=
 =?us-ascii?Q?crbOoNiU/FnXh0t+M7ZhMAt73098aaLqsn9sORxOtQ+3nPzwxLXBeWtsDgm0?=
 =?us-ascii?Q?4gL4oUjyecTDFedpAFZon4xX8pq7jqkrfnHzq9++m2TM+QTJ31OC6RZKp6Dm?=
 =?us-ascii?Q?tXQSvO98h4fJcShfx3wGCib1uw/l34hlOs5G92kN08GbUGY5Do1Y8K2IVs5e?=
 =?us-ascii?Q?HfsgFre/zQgC9DiEw1yv04zjDh0wkNQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	HvDRIko+XqnvnDywaZyCQydJt8C87TmhqYXqtbAadWahZBwZ/TvFM2+tktj/YU8iIMDo1VqhM3b1ga3NsjRDKq4jXxe51JFpChn6e95NUL5fAyafrEiCYdWNCPgG3R5CKh4WqOB0Fp8eQ3nmJ/KWBG7TKNnVYzvuSOcf/f86Y0+VaumZo/N66agQunP4Y5MDtXImn3iU8bvNURqYnepPiPOngRklWxkasGL0rU2JPYCk482TpD1Ac5WeV9LU211iAA3FwtfmtgwysZW9pv2JTvi3ySBXqIpE8YWiPTf5Xn5Atbinph0vmXDL853xjzA4Ah9/zVRme+lqes35J9bddg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0c8e23-feb6-463d-8ce9-08dea0d8438f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:33:04.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNMmMtey2njExUMzrcfpJ+2PaMzGBwBC94s+pUS5dDwH5DlMLoKNE2FjUGteVlao/Ko4SeWdSTecNtHB9QvJASoa4/SyzREI+ik0RTT/O/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8833
X-Proofpoint-GUID: QBT6Tk1w9LebkGwl5mMwKnb2NKJRID29
X-Proofpoint-ORIG-GUID: QBT6Tk1w9LebkGwl5mMwKnb2NKJRID29
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e976d1 cx=c_pps
 a=3ImmgSqUqdqu0AlmHxYeZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=3IBg_wlri3G4v8povXcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAxMiBTYWx0ZWRfX5iVchJDMDnM4
 jujkfNdARU9TKnAPpalDNZT0k5868HpRI3Wm/qeM0p5a+F6K8Vg4mRDziCmNwWKBRYZU0hvbT8I
 hzBfWZipE80vh+j5lEYtjqbnLqw7jhxAcNFofs8TytnmBqvo7MtHVMKLKGcwNVemX7obRD+HA/3
 laIs2F6s//YY9WaSyG5UopALIAnoZWv6eNdWfEQCMYHj6hVmtNG/b7pE2fztrnp9C92TiH3ntp+
 i524B5vtIuUuhPnwltiQdsLE4O9dw2Ln5F1hP6rRebaqb2GGztytDpZht3EK6+IC4fZEyrVw2ly
 cFa4BCn74ObTYMlpmaX5uKah1JWKhUp8k54kt5cuZ+l4huzD9UwNTDs6WcDB6RJU2kRFg0Rph2T
 GQWcf90WT+avFfFB7Zqwubvrvup2oiiZxwWTpjvO/EBrNZbO64rhy70Tuq5dHLXyHrCdSCSz4Fc
 DOz1UmkhSZ2rqUrJWgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126563

Enable debug build flag in jemalloc to avoid error as below:
inlining failed in call to 'always_inline' 'heap_ph_cmp':
function not considered for inlining

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index aa1f417604..edaaea26b6 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -29,6 +29,8 @@ EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
 # For some reason VERSION file populated only in tarball distribution.
 # Adding jemalloc version since this recipe is using source code from git tag
 EXTRA_OECONF:append = " --with-version=${PV_LONG} --enable-xmalloc"
+# Enable jemalloc debug build flag if DEBUG_BUILD is enabled
+EXTRA_OECONF:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '--enable-debug=yes', '', d)}"
 
 do_install:append() {
 	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
-- 
2.43.0


