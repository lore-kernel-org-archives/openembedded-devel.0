Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC97ECA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71718.1756799089459925300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xff9DWmj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5826vWXP1223092
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 07:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jA06/e91jaQisd1ptOK0
	NHFAlQuYiL81VA6OvgRX2Us=; b=Xff9DWmjBVtvWp821xR3i1KxDEivHEoSW5Dr
	LgYs9hTNRzd73R9AmsTIIvEOM6OsKVxnXbJ9kmWixXHqHGEce4w0cYKA+8oRaSiA
	FJKEoDCTV+PNPlT2EVJAe7+B3ON5QPZSq1VzICmIHemfEJXHj7fHDYO3gFjIITHV
	4yFvlGccUuBBRT2mUN/hgKIWRMNJSjPZwbEs3lOQa1OWAaQlbl7aTnvkxrynHKJ8
	wrbUAliz36FqxFQY+9O1Xl6sZitmIUDPb5IBg+bRhGahsYQV0vwfprISMsLmEfeM
	pzbTau2nqtg5rFn6wJ/Uzgsn8KajKth68KukwB+2ghnm3y1grQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99tckq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB4H/TDsRNeS128OmWvBulndI+YoB8FERmt7y4m4FJjOgeT2YAFuHwfSCjmFZunO+DW1yiqJomChqtAij9KO0lziNLI0qf1MDj+bByhZp0YFql5PIMvchwO5o7LyEb7qzgUKfk3qPOeHfRwh3P8TuHGD2n4xJQqzfrbIqhJ8s0nT0LwtDrhcsyIlJI2AvIuKebSpiPZZtL3wnHl5RKQiFKqVJAfZeuBcZQYqiClCmnBzvxZ1JTlCidnfomW1Lm+d1EjO0VF70U3rJdGnQRWSiLuJ1+fZBtODRHLtSkxpT44DqvXdjDl7L26m2wOVWcP4zaKafMq5bCOizxbJTKbeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA06/e91jaQisd1ptOK0NHFAlQuYiL81VA6OvgRX2Us=;
 b=jMvw9PleDnwmo6nkoLTl0Yg4IUEbkCdwMWDg2IKL1BJYoiF2PtF8mpyJ5MJz4kGWne+3lykQaOOZC67wuhdjLgD2eMUu9eBuyPpe7Wawa2Sbal0R0BQsDKWBpH4jUvY2hQdzT+1zudo1m3sEYNdnd2pSRZsfEy9uQCgfBpL7tx9bSEkAhsLrIXri+fMqYRVlWvNxTScyC6DAovluA8u50ewju1XF0AZT2wvDX7I7ewdFArNdxTbMD/x4Z8DKneFW/15aQckYA/YInbp3SVHtB5MEHtthvsQ/TVq2Y6aME3VW7TUDAWsn42n4PpQFfB9XVe4GJiM6EJP5oFK5kVTGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:46 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:46 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/7] gnuplot: fix CVE-2025-3359
Date: Tue,  2 Sep 2025 15:44:26 +0800
Message-ID: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: f9781031-6e2d-4d0f-b5eb-08dde9f4963b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5C/KoCj/NTJ978X21vn/VZFmgrxTeaHDy/eDtCDWvGpsQIJ5A6r97mIcVnEw?=
 =?us-ascii?Q?kSEi0jzYhNQbKVHPq2mRlgfFHNfeZyfX8RSvlxKEjacxaYDLFMPHD6sVeAh1?=
 =?us-ascii?Q?W5AF671nsMawD4L75OCH8ZCxsKF7F/0NsknVsB8b82w6q/cZ3lY7C6cs6//E?=
 =?us-ascii?Q?yufyiBuF0bf+hoHEnCzOomzEC56SjdMOD0UMy2kxrEgpO7MKbjZAB6VSQ2Ti?=
 =?us-ascii?Q?yaCOJgcibZc88X7uwFoo2jjTieSc3OXccG764GpjxHfjxwlnVtq8RutKQGuH?=
 =?us-ascii?Q?A7RSIWcC+nAkZkbxbSjgxeqEA+SE+2/Wq1bK2dHdUPzp7xGBWlkZWxOilJID?=
 =?us-ascii?Q?lioVBlNY//zdCCqtesHAkJO5RQ9YZj5b6iVlaiO6I2F5UUguU+fO58Yq+erM?=
 =?us-ascii?Q?YyhGMcTCcYQilVG2d+xBgOmshlzshy6TBt/wntfYuTRl4m7ZWjRCZN9hhKa3?=
 =?us-ascii?Q?ijx5241UTKSQGpL7yJZSnrYDKQtNV+KfBvOxqOkJvlbYPJbbUbaSnquCt7zb?=
 =?us-ascii?Q?7r5yQlX0V+KoTVWOpVmeNL8yru6S8SPl8elzUAyHnlZ4p0euvVyMFyBvgRnP?=
 =?us-ascii?Q?ahULJhOBe0qsSmnmLhyE8F36nkVUBjoVx8SzMolPMqmnVRd7DBlajLp/0hP7?=
 =?us-ascii?Q?EcwTX52Zp+zm6tVv83Sey8qHAG/+LWgUO+U83NTco8wRhEoa0B1YCbjyHt0r?=
 =?us-ascii?Q?691j/kvq/iIJOmLIcn1IW0C7N1pZykqcd3tcSBaLzOpr1uryK+lFZb1nuewg?=
 =?us-ascii?Q?wt8mOOrBuvllEZaD0tU/csp1xnHboBey8WaIBh2yZyLkrUSVYIU/IZR5BsGj?=
 =?us-ascii?Q?H5BJLYR85oxSoOWwJ06J/oc8ld1a/+IIN8pq3SaBaTJTO0EHhOLfT3OWno/x?=
 =?us-ascii?Q?qYC7y4U9upJVJbvWNECvRRo36+Zji+yqKOClnrBNYJYgT/BwK2UptMQCJynp?=
 =?us-ascii?Q?SmyC+JWF58Ks150PoNjJ9rqU9d2smkgGYgTsF/bwFjna1BiMqzrBOCUPOmil?=
 =?us-ascii?Q?HGFWstZsdOMpbAaP/5wHraU1lRnu09GNH8fMU8uyOSmrVd3evRVuwJBrwrkJ?=
 =?us-ascii?Q?INxsy39zazTClK3utY+3WASrRdL6Uq3m31Wt+fsBEu2PLSR5NL9uOcTWPrRh?=
 =?us-ascii?Q?yW3+NX7ezwQh2imR4Lit0kOjGCDasHZbLHDFXIe3JqozJhHRDVSjYUgoLYFN?=
 =?us-ascii?Q?JHM9Rm8o+E5tw3AJ1IEBGaNpcAmWZxxLWOGLcMn+V+isceNr6XcWqClAsVn6?=
 =?us-ascii?Q?vo5xboHCUop3VnTEAaicKNPyIDnMIfXLt/EcObfNoj3wJkARcak9pn1z38it?=
 =?us-ascii?Q?aahh5JvVALFlemJx10kGYV0NJaYn7RQaNIQr70DiLgFrgb2nfhv4X6lDlY52?=
 =?us-ascii?Q?xANChPARoaDWaJgFzaazVs9H7eQesF8raphRUU0uPs6tsJfy7BbNAs6SaURL?=
 =?us-ascii?Q?zbpDZfv64q4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?42dpSmUmZl1dhD1wnYaBUrGz7DecraLjx/fP+7TSc+gt8IUoTcnGdGpm/2NE?=
 =?us-ascii?Q?s4U/TqNF3DRXFiPNqgqiKSvVBR7ZrSWVvcyWrFwwU7sIy/uKYYwCYnmksWN4?=
 =?us-ascii?Q?U22cWP5dztKBYXqdfz0CS0gNW9EJwwv4oCsTDWs+oNMCbK3mA2zBb2HRvNOz?=
 =?us-ascii?Q?wPYqkN3wt8if69jEfYRmmWTrtqADu0FmE0CWTdJZiCnkdabsZ/5mgUnR3YrA?=
 =?us-ascii?Q?MugWaxlBuWYJPgcQDeub5qLECThErNnIDBsAuzEzwuJsIOS7OWmJ4cndNKQz?=
 =?us-ascii?Q?EyxDnfampPwogGnZZ2hSfQcoPKDJn7l0PX34ymRR3XJCOySEhPaEk72AlfMW?=
 =?us-ascii?Q?mRMm3iXyBFgzNh+Dd1ffLfp9pDlnwuL+qD8icZMrU8KlcvXrDyRZqkWLDu0g?=
 =?us-ascii?Q?cdtbM8DeUQWDzgtkF+r51wHSqJpMogUHzO/X23KaDsV8XiLUx8LDz0wRjDxC?=
 =?us-ascii?Q?8Qurgs/WnKV+s8fl3Wq4jgZq+kAATU503m8Cy8Kxhog8jmzHesN+2O6YBB5Z?=
 =?us-ascii?Q?jGdaokP3eE7f6MjZqGWKl/AbgJBd3bUY27HjRvgQXkTSBxfKsb5v9cWohSBQ?=
 =?us-ascii?Q?rzBD74iZZYnz079+h+SkBPyyOPneoubT1MFuLl6R3I0nbiqkQdK2fhf2PmDD?=
 =?us-ascii?Q?Toiq4GyhemP3RK6zuFh03RuAaf/QSjWpMEXshiQ4S0uNASjHkbpq0RHlmVUv?=
 =?us-ascii?Q?VwBlGjrILiiJ67IRgx/mJBRWbdYNoUIHaKuzNmIm11oQKWxhZ/RwUz9+5aQQ?=
 =?us-ascii?Q?wuO1olDv86NcU7J8lUrQ+jj9la/fORi6aTGkcgJfl82uXvWJzB9ViEB5o0kr?=
 =?us-ascii?Q?cJROCP3Xn0lt+ReFWFxm9NhLk3GSI1iYymokX9irhFHFJ837yJNDQzzRE1wi?=
 =?us-ascii?Q?7/IhnP+OI8ItAy6/GhiW9XYfmNoYvObvfVmZgnR7B5XKWgcrmW659z0nppF0?=
 =?us-ascii?Q?O7YUr066Mt66kXTL17su821YNn3XabNiJcvvSRSoOQnBOKcddw3nDztXpKmU?=
 =?us-ascii?Q?Cv9Ozj61DEgYcZ5dTaQSKI9iepFG2kapTZEx2eS1h26/5tD5Wv4pZukoCT8H?=
 =?us-ascii?Q?707eJFfa5J5rx7Oj2P5uWxC93nvC0YQZDnuJrLROI7YEunXAVseVwdcmHm4p?=
 =?us-ascii?Q?sEtANd8Kc4VJkKC6VV48YEzr8wP0jtpfleY42H4ECVVUHw8It+RgfwElv/yU?=
 =?us-ascii?Q?9GqvAmSnAd/ih3OEdXTPdm1XJrZzs3+llTWk7mcTenA1zzCfszehrFa2eprf?=
 =?us-ascii?Q?dpuMmEBF0AmCtmfMGfdbXAy7/mb0g9nw4ydaGXbDLyLQHkDCJV8K6Wjw4mr5?=
 =?us-ascii?Q?r8vtIm64/o6vyaWCve7ULWLXFovjs47gefzT3d9sOa2cGQaH+4orK6F3dQBa?=
 =?us-ascii?Q?F4QlNasEWzO2H6ia4ynu6GXUqYibQiiXREd3JX+No7rz+yxZ7Jp0EnHSfINB?=
 =?us-ascii?Q?NKEzd0woE7dADAryC4tYrbQp68Dp4mEy/8arXWnS41jZVJxjBMZJfJslLU1h?=
 =?us-ascii?Q?ANpQpzuzGFZTMTjJMFgmXIRqbZNu+bDXcuvcnZ6uLgKTqIcUKqZcukOt+9WP?=
 =?us-ascii?Q?Wsm35H9VrkMsnTfh/nITCbPP2SuN0de+3XNmRutTb3xR/edmAMKnzUSvJaqE?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9781031-6e2d-4d0f-b5eb-08dde9f4963b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:46.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H69d07EgjNEJxg0eJLk3VFKquoc9Sr9iQX00Uy5X+S0Zu/jrGlLWL1r8jyA9sdIjP9/veasxbyz7q6v0daJ2IuIhWFMGD5ADkjWpei2but4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b6a070 cx=c_pps
 a=clEwq8AbTxs6UVDo5+t0mQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=efV5ao4sAAAA:8 a=t7CeM3EgAAAA:8 a=-6N0tzXvYAPP5OpoGb4A:9
 a=-Ie3GqMprXkrkPNEQgfm:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cRTOeKtMb9YTfUQg2vM2RQ5PICOaq3lh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfXxuoJJ7aos6E5
 Ed8860t3DfMjttuDhStmNawiMgTtsXDBMUFc/gofBRJlxV7tWOsgsVfUuYYPSTaYZPE7Cbh7Agn
 TdaPo/vBPSDqk4O9CbFeDUOuW/hAwnvVAhjjpoQWNWXli6zDTTPBVohNIU5unXmQCMbD3vLv8vl
 5M7Z3YuliPKCk51FO7+Jqk5H9kjUrmMBRSQIAMYtW0WaniQC7/tgl639G714era1S9K3MOvZ2tL
 QvW1y9/a92wXK/HREXix0ftdj7TjLBEvpnKBr+4GgVAUXUsD/5FW7+k8F6mnj0Z7FRLGvHF4/Vl
 hWlnwgAsxRCRudReVW0uLCtysp7dBwtliDDoGhBsSgAHZZiPIVsWADVadb9qlo=
X-Proofpoint-ORIG-GUID: cRTOeKtMb9YTfUQg2vM2RQ5PICOaq3lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119169

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-3359:
A flaw was found in GNUPlot. A segmentation fault via IO_str_init_static_internal
may jeopardize the environment.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-3359]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/a5897feadc4be73b0ffd8458556c47117bd24d03/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-3359.patch       | 67 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-3359.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-3359.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-3359.patch
new file mode 100644
index 0000000000..d2de00ec6d
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-3359.patch
@@ -0,0 +1,67 @@
+From 997b4ee68275664b94e0c881ace5121d79c0c29c Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 25 Mar 2025 22:51:54 -0700
+Subject: [PATCH] hpgl: font name parsing overruns the string by one char
+
+if no comma is present in the font name.
+E.g.
+   set term pcl
+   set title "Title" font "sans"    # no comma in font name
+   plot x
+
+Bug 2781
+
+CVE: CVE-2025-3359
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/a5897feadc4be73b0ffd8458556c47117bd24d03/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ term/hpgl.trm | 28 +++++++++++-----------------
+ 1 file changed, 11 insertions(+), 17 deletions(-)
+
+diff --git a/term/hpgl.trm b/term/hpgl.trm
+index 04088977d..fdb4c7083 100644
+--- a/term/hpgl.trm
++++ b/term/hpgl.trm
+@@ -1650,28 +1650,22 @@ TERM_PUBLIC int
+ HPGL2_set_font(const char *font)
+ {
+     char name[MAX_ID_LEN + 1];
+-    int sep;
+-    int int_size;
+-    double size;
++    char *sep;
++    double size = HPGL2_point_size;
+ 
+     if (font == NULL)
+ 	font = "";
+ 
+-    sep = strcspn(font, ",");
+-    strncpy(name, font, sizeof(name));
+-
+-    if (sep < sizeof(name))
+-	name[sep] = NUL;
+-
+-/* determine font size, use default from options if invalid */
+-    int_size = 0;
+-    /* FIXME: use strtod instead */
+-    sscanf(&(font[sep + 1]), "%d", &int_size);
+-    if (int_size > 0)
+-	size = int_size;
+-    else
+-	size = HPGL2_point_size;
++    safe_strncpy(name, font, sizeof(name));
+ 
++    /* determine font size, use default from options if invalid */
++    sep = strchr(font, ',');
++    if (sep) {
++	double req_size = strtod(sep+1, NULL);
++	if (req_size > 0)
++	    size = req_size;
++	*sep = '\0';
++    }
+     return HPGL2_set_font_size(name, size);
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index fe5e5c067d..eff2ccc98c 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
            file://gnuplot.desktop \
            file://gnuplot.png \
+           file://CVE-2025-3359.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


