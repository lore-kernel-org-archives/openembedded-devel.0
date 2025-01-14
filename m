Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223A9E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:09:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41100.1736849367546633979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 02:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310900c87a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7aek6016412
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 02:09:27 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt72nc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 02:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx5cdbyrDEHEymhxkCjRl731BSZYWpEMW8vLqIA2x+dK2CpThWHKd+DHRLkm1LQX+kZFwVv+37yeHKbsMQpgCvYrRu14dsRkNRurnnV4Dmu/d3/QG8wEyTmXx2vZJ9Yh6RU4zr8zB3V/zdh3+lDQI547cC6HSeOaCpS0ZghPqcCdN1IyfQP1uCGqO9n0itomjMD8ZgqrJ1FSCgbaUIUxh/MzlLEs8z1isW7YwEBrKxzAZRPP1ZvINWzhSFAvwwUqeY5y5wpy7rS6s3mGuP0UNKi0hrEuYDQMYoblpXb1eO9hYVXFmqplJvLmoYaCPhy6XCSNSs3Dn/seTNYgiB2Sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFshQbyDoPenftY/9kO3LM/+n7LY/EmbnXJ3gYSUTgc=;
 b=iGBKWljT4L7Pgpo7kPdfu02Z5aztliONTk2nWUw1PKVxpQ+7t12ef/+jEO9lzTCHxDN+Mw3b33RiHCI6j/byP1FCEhyTEcdv3a9AEKOTO96ECyFvt3ODQD7ag4316gLlY8jmKrseF6YW8gb5D4VDkPljWDDlfNilweDFgGrRFtsCyKuHa+wde7/ko1fppNJwlfIqDmFf56mXa/WCnTzpqcfpN2KdA76ekjMFtw035li4m2z2o6/FMBXVwFBMru58c45SoEFhmIsz4e3hIxJIq4CQDB2JSbxvk0U6Dfmls8CyyJyKYNMmFAICaApZ538bjwlHKmLBiFUC4BWSxwCjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 10:09:24 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:09:24 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] openjpeg: fix CVE-2024-56827
Date: Tue, 14 Jan 2025 18:09:10 +0800
Message-Id: <20250114100910.1538526-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114100910.1538526-1-peng.zhang1.cn@windriver.com>
References: <20250114100910.1538526-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 151a2e62-41ad-4483-0533-08dd34838586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yW2fAOm0HuZ4t+k6eg3HZUSWY1k19sO1C57jeYZUEbc44B/lzTvwJSVvx+NJ?=
 =?us-ascii?Q?Wula5ZqAyoSyBWxGFzRQ+ZEEF6lppIxTnX/+O1EULVY58WWmRvXeWE9m+rJs?=
 =?us-ascii?Q?OpdY1FLdcjs+zsawELADhT6znrLwj5oL/m99qvDh51sF7ucso0O48aVN/Dn2?=
 =?us-ascii?Q?lgWjZI+LnE/CNElsgbM0Xd6oCmoAxmx+PRefs/RBBXkb24rBgofwsoEUWmMO?=
 =?us-ascii?Q?eLEcFTYfIn/NFsbpYEE5xrY3y9s1fBRVReeyAIt+1wvGRKKS9fNaMjeEvdd4?=
 =?us-ascii?Q?0e3W08UrzFB/GAax4rRsfg492axgNCAIPqy67csim2fcU6uL59UpJNTQTiiv?=
 =?us-ascii?Q?g2/LKDiMg1Bvd8/ZxIQ3daR3MaOmQDlAIdYIFyFTsT/F/E4HQn+BToUFkQ4E?=
 =?us-ascii?Q?fT8hv30qIrHnDUZRAOG+uLpKZj2ZTqHty+LgCjIZoJT/E9ja2Dxt/LSDbFdX?=
 =?us-ascii?Q?FaO/aU29cvLN4Bz1PdwiUELx1qDlsC+7YqU2dDcjR8vLM+3STaTd3geMufVs?=
 =?us-ascii?Q?xQSxTCuVPZ7I5RGqaqHuOvHr7ayWuc+VpiTqeGf9KiZKlTNqqgfnEhT6kd+7?=
 =?us-ascii?Q?hEhyDEBTb9GIA4XZ8Ic7hjePzL03CY4QJzT4Nzbvub4aq0a560jeq7L1FAdn?=
 =?us-ascii?Q?+cRrCrH+016jci34+N2GNtmnkrnnLfwk4crh9INZcfSh19loaIdFukma37Dz?=
 =?us-ascii?Q?bkLvBjdnXkoLD7lKJpgA3+hBN8m678CUxvf04W6pVkby3H5QSWv3RKxB2gWW?=
 =?us-ascii?Q?GA5wteFv6Nadb4wHX9Myi6XxNcuFS4kvr9oJT4suaZc1jIG01ipv71jXLOSX?=
 =?us-ascii?Q?MozsMEyZVqv6bZ7cKFROPJQ1aFfKD1S18vGLAU3lo5QUqUoSsNkzdcW7uWq2?=
 =?us-ascii?Q?hzw14lhehnXXAtPZ/kL18kA0Ip9HeUh803nQCRPCOldU0veAuHghwkonOJFn?=
 =?us-ascii?Q?03fWyWAtw3QW2QGU16dmKQi1YWsLDrEjXccmQTxax/eR3S8KdtAtgoAZPe8H?=
 =?us-ascii?Q?j9z+h/Nd5fF7vJBCMxWM7rjMBtJ5pl/jv2mp2PaMbWAwzjvMaCKha4/o1aHJ?=
 =?us-ascii?Q?HJFjnvhqcvUAdKvnCXc3RrmDiT5K4tP0oe7ty32lPcN9zkpK7uIzJgtedKPX?=
 =?us-ascii?Q?WKN9QnylOtgnv315Nh86Qvog0I9oUOXYwWJXQJD0qDjcWHctInjHfwICv4+v?=
 =?us-ascii?Q?S6JzMqyj1vgPzW5cLas7Rd5tgqqdPAsLQdSP9hm87rooD+KtUnV5547QQqVJ?=
 =?us-ascii?Q?BNgIUhcZpl0/e4AREgjKJ2okRWcvEskDX83sxzUdAp69DRhqhmQGSSDiZ0yE?=
 =?us-ascii?Q?sg+waXRyX579jqqvlCz+mw7O8i3bPeBixMqugzJChzMQcWUig5vo6NK8JylI?=
 =?us-ascii?Q?lDT9kyZ2RoIjrijEaGCbj2QkFnRoXn3+c6TMF6k9wPAORK6YxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pkbKIjN3Jjr3XIAFXVLoNqRiX7yrN6wVg6vHWQk7C787UZtCwzvCBtmBCNQa?=
 =?us-ascii?Q?TGBcbl6+yxNMmJt9u6LH7iSk8ZAwV1n9E7w/dAxDY//AAryI19qW54llMCHK?=
 =?us-ascii?Q?Xz+/ks5FADSrsRGFYjk4DugvjrQwRYPt4MH48EN+3hKzsQ1koRHCR9q7MAwA?=
 =?us-ascii?Q?z7B4C75M0QqCw26X8RnIwDJbY7XYKrO5tH16l3SXJVhoKKi2knFEJL59mZTM?=
 =?us-ascii?Q?I4tyTF5z+1kShtOLqWJDjucijrO3/u98XwMLizXaVro7wIPqNvH5PotkswMI?=
 =?us-ascii?Q?pcpOuSxQZrN1STNATPBxLM4wk8Vvve9gnhsFX6zMK9oHSKcOKCX4IyP3jYio?=
 =?us-ascii?Q?CTAYInU3Zw/OSfQ9LfTj1zep02odHGjfx29gkGr1knueLWc5CAlBgKLroNLz?=
 =?us-ascii?Q?xE91/DlXql3MqoawSzV67C5WDuYZG2sWMCL1ijnRasAFmNHAQpePziy491mJ?=
 =?us-ascii?Q?6UQDAQ8AEbGM1ZGi9zqEq0mOkbiztKRPRnGw5N7QfmUbcfkPur2+Wi77M74+?=
 =?us-ascii?Q?LrcLsj5C0p3W9KQ6RsgeRH5TqGxwGu8b1ESqpTyEWndl5OMpULDdCDpv3A4d?=
 =?us-ascii?Q?VeVrFptd0jR/GruCUa8KQlsblAbB2KsaJfekRyKmyloqZ7TxaN5JB2+R9d+L?=
 =?us-ascii?Q?GRwO2Ojx80wVMidvqZHvG5gAo+fXFdIQ99fcm38aWdbn6NycMaFDfiB4qdCC?=
 =?us-ascii?Q?ad7qgO96732QApWw7HyiBjrn6jE0LCWGieg6hSgFZQY+khOofwEwXHoJsbn7?=
 =?us-ascii?Q?VAvq6Te4VUG7AeQp7UVMZNu/5HVylYpCXbkp2y7wFuWF2g8urwfQfowdBzyY?=
 =?us-ascii?Q?FKaW+oAwVhbJwfVzekiMFlGOvCzxm5iTUT5DlYg27VCrVa7h5Jj669dx80Ba?=
 =?us-ascii?Q?6JJRhxA4EjhAzfBfUoddEZFU+fZvWdf0JqaLJIX3UT52pQa7IQoTvg7rCoJ3?=
 =?us-ascii?Q?huFJNushI5kj3m2yHMgNbckaR0vftANGp9l8kQedr+LnFDzoPgwBQRAkuWuO?=
 =?us-ascii?Q?X5FJhI+gxAhEI8Wx8mKd0CrKyn9DDLW+Rpvr9gJtl0taigQBzHG02eK35y5C?=
 =?us-ascii?Q?i18tvtJkB8J9zzYSlEmvOMnhItZ46bUIYdN/xyfsNVv3/xjb+yMGLvYlvEE5?=
 =?us-ascii?Q?qrLkfmTeF2VHy5SmeSP3EZD6JFgjobSaSE8dXCBmpAt/1TWnUzZxQDmn0Qi1?=
 =?us-ascii?Q?pY/hFW67d/dYsKe14EAWH2Z9XC5Rt7yYrfzP6AheZ61r9O/6qWvjjnO1Ruv0?=
 =?us-ascii?Q?/QSCF2omf9QFjMpMWcZCqIFMrarovQ36XjKG4XyRTaoUXr/XW2ciuKG/RCp3?=
 =?us-ascii?Q?R+CqREpdGLI+yRsngX9xnoPxGuXJ9+SWvDsKbKqt5T0jAPGN9ed+yCzhyLJc?=
 =?us-ascii?Q?qco10AmG//dxzpAzBWm9DX0RqkzrODosrXVfQThT8LRCoBp/T+5t38pPg5F1?=
 =?us-ascii?Q?WIiEyPS2Rc2DJ0B1GSn0PmWpEPuIm3QHUlYtvTENgumR0NBPeHKTdQjeHmoL?=
 =?us-ascii?Q?JcFzYEXSATJVK/cHfDzDxv6gzF9zG8l7gAMO9rfRxA6HOYfypRqv+QiMkfLw?=
 =?us-ascii?Q?eyfDbNUDZD+B8rcOLJ284Spv5BD8A8niPaG/paam1MJZR5IDnxdQuwDXeWEx?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151a2e62-41ad-4483-0533-08dd34838586
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:09:24.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z06eGSfCsmLE4xU8XK5Wxi/samHMJlNhZD/DLqt6atQL3zWGPEW5VAq+QTKHo0OI+iLwDY0alei9AUC8WKO9kmx6GXFd8/kmK2TVPvNOjig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-ORIG-GUID: tqctb07j9Ef0SBLrSi1-Z_obtwwTz5xr
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678637d6 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=64SeUrbXAAAA:8 a=pMEJznBF0z_DQNz8OsMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=HLuTerElwpHB00cmObDT:22
X-Proofpoint-GUID: tqctb07j9Ef0SBLrSi1-Z_obtwwTz5xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501140084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 10:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114877

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-56827:
A flaw was found in the OpenJPEG project. A heap buffer overflow
condition may be triggered when certain options are specified while
using the opj_decompress utility. This can lead to an application crash
or other undefined behavior.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-56827]
[https://github.com/uclouvain/openjpeg/issues/1564]

Upstream patches:
[https://github.com/uclouvain/openjpeg/commit/e492644fbded4c820ca55b5e50e598d346e850e8]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...rker-validate-that-current-tile-part.patch | 33 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch
new file mode 100644
index 000000000..f959a65d9
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch
@@ -0,0 +1,33 @@
+From b343d72eb4c4b776b4925b441d18abf6a20b42a7 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 25 Nov 2024 22:02:54 +0100
+Subject: [PATCH] opj_j2k_add_tlmarker(): validate that current tile-part
+ number if smaller that total number of tile-parts
+
+Fixes #1564
+
+CVE: CVE-2024-56827
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/e492644fbded4c820ca55b5e50e598d346e850e8]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/lib/openjp2/j2k.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
+index 8e343ab2..08f771a5 100644
+--- a/src/lib/openjp2/j2k.c
++++ b/src/lib/openjp2/j2k.c
+@@ -8227,7 +8227,8 @@ static OPJ_BOOL opj_j2k_add_tlmarker(OPJ_UINT32 tileno,
+     if (type == J2K_MS_SOT) {
+         OPJ_UINT32 l_current_tile_part = cstr_index->tile_index[tileno].current_tpsno;
+ 
+-        if (cstr_index->tile_index[tileno].tp_index) {
++        if (cstr_index->tile_index[tileno].tp_index &&
++                l_current_tile_part < cstr_index->tile_index[tileno].nb_tps) {
+             cstr_index->tile_index[tileno].tp_index[l_current_tile_part].start_pos = pos;
+         }
+ 
+-- 
+2.39.4
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 9c0fe0e30..871b324df 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://CVE-2022-1122.patch \
     file://CVE-2021-3575.patch \
     file://0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch \
+    file://0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.34.1


