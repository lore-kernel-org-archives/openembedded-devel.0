Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C431075290
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7570.1773914169802191035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sjwVNLFd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J6lrMp2498502
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=dGNQNCeOHBbgnEaHHD5cFE7UXvFIH3/LzYqD73hgIeo=; b=sjwVNLFd+6IW
	u8Z98FTU2KBCY8zm+W9eIvUbphbj2rKL3UvfVUszatJuyWMCbguTgy2jFftLODdz
	9l14sNtjNmPheLvsCVjPE5cvPOalE4/4QTbBGSnv+Bk8zr+EvnE1DZH+8iFJXAGx
	JIHQXOp6FkDyAA8ImuMcViK4g8pWfifaI2uJOA6hEbhjQEh0p8RbbuUN6oDPlvjm
	YZvKrQrxe8VKmTgnWc1wjcoegz68NGigWp6MYSYrEd5ID2PH/34R3iQ7amdTadQj
	kZq1IbreF2jTRJpJdXkEFcCo5n4nXbmqjBqM8Dym6hcWU7U5kau14uqJpJyXAdUx
	n7Y0/g0eFw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y163wc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hp3zW4KqcGT3gsiMmnzerpFTFeeBMvU5R552VE6MlYFMuKvVduH04SgUUQ/GcZ/0Pc91kcjXcwpHadD97a5QgKntG4w3fm/AUu6MTfN/q4ihyy4YUu7jCUdkbOshPNUju2B7GowUwq3aby8a65YEmnzGo05PmJutwloHSU1FmglUJIXTi3sJw69XVEmNYqecEfd8njlk07EbfgV3EYEqejrtiHrOjzN/xo3FBsiwXiOyvzokh9pSdVOpc7kNCTlH32lTtph1asJKXJFnpu/7XLfdpWzGVBPeAFf9LhsBMNmRZ8R7X3BmITQgXSA1TDrWUeAATiJ5pwHTSqtJ2voMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGNQNCeOHBbgnEaHHD5cFE7UXvFIH3/LzYqD73hgIeo=;
 b=EAOm/CLSfXjXk7yH3XrK2NT8sCANU7wgFvI9Q/lm5qxjOrbNOzg/Ck3vh+hwhp8pZpijVPm6z/ht0bXDmlh2F+tNXlNmxKeWFqW7TK9xSVG5lz3shSf0RG15XATv2EZ0ngRQ8Z08fDXRia758E2lChWPJiqXC/Bovl7RrWDuQu6QjbPBDCVtRCW3v+DkPX7WAkSc3TOyHtWnuA2+dmhgCGZ3/Fgmkw9z8aLhWep4SZ4FINC4MVD5RLzhEUzYy8kABaQO4O3rFhqaxE6glcK77IJf2a+u/AUjvosnfuBW+Sf0/lu4ZJlwK5in2RnjW2o1G8OskrbKRcvriFIbS2I0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:07 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:07 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 7/9] xfce4-screensaver: upgrade 4.18.4 -> 4.20.2
Date: Thu, 19 Mar 2026 17:55:45 +0800
Message-ID: <20260319095547.3614749-7-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c8a748-262a-494c-d075-08de859dbdee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NozzPxt8A6KU0USkfKD7kaTaPsqIO5BCqXmCeMtdlzdh4PRJG+/7Uea/+bdbWb0SpxZkOGUjSaW/evGwh/ePnLg7A9QRgVmH+vs8FsFcMwWGaRyxItuKXAc0Eb4GkfgLT9kfFaNEWDmVu8UNymAggDKqyLVP32+D7SCqXFAaJhgovDDgFQRu2+yg2njbZcl8gFrhdsyBoenlhyOC8Pg0y5yFxRdsxYUs74ybMP/MU5BQyDYsrd0mNQZeA70ycs2wjWn1IB/fGVAi6V8W/Xv4TsLiCIr8cZVpLkiZKzb7dRw3qtTUe0wPxPbVt/GJVJazC31F9woVIPCrX2its7dZskltLn8jNXekJGnFKXs8viyZcAWQ1S0nc3Aj5CUPS2SMe5F0fiPWwRffiWd1b9ofTSa816J3IAkeNA63WaGjbUrTuQgYKVXi3SJCtzqTqxHKLhmDRWdCRPAdzhdBMQvi87XFBTpYkJemrYHfyBPXxpAnqhktvSjHld0hmlUj4htUsRVnQp+3oSEeMPQWT7mXIBMToosFBp8Gxl4FjNfj/xhic0t1PEcpJ0Chmx9SQl9GE479DXBg7Xd0M/GytGlVrvfruUExDZp812bcWxF6xDM7zyLVdmdRAaxjoUXDf4u2hfmm3b72JpdEA8/uSgXLj7gdiBCOK6kHotOBrZ0T0j47zW5vqVYOXsvQPXdbIo3bGsnF1As5clV2TUMriXRoHOyizTs43sYICWrcR8Y6TQdTGZyWHa+5B84lEOlWNrchVdKCSHLAVtEKyp4Sg+RSyuDZjqEy15Nr4mJwbQsVaPU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1azI4hdQ7lBb9RLaQgehPOCfhkXFa/TbG/X30jIkh1ISWCVhUzsOQLOdCrRF?=
 =?us-ascii?Q?v2QkTRf5pqTrIAKFv1FLzbUJeNM9GbNsZzvce5OEx0CqnBtEMQINnqjTDjrX?=
 =?us-ascii?Q?j8qFH8CK9ruM+2GvHwGoBSl3NyYlwjyjz2HiKxQvkZ/buAd1TbGXcw5jBiTo?=
 =?us-ascii?Q?g8G9/EhqnPxGb1e5hl1G0NID+rkTXutuk0+g3G11jWDAqkluV1TIRFMRcTeD?=
 =?us-ascii?Q?fO2JhHazScjpiCppxTS+rLtpOIjmyA3pa0i3aFh3wLp3ovSKKe4MNL2DMjBt?=
 =?us-ascii?Q?qQsnLgd9TnKsO8dyhT2G3kna55ZYTKxtZ7DwRqL0UUHY2LCK0zuUdKNu8oqf?=
 =?us-ascii?Q?JUiqbQJWjh4Is0pvW2OBOQ+aP+0HpjDCSflnmrzS98emYg5BxE+lvCDbJOZh?=
 =?us-ascii?Q?NmKrx+0BKvsGRtW9QCDTbvjSvU/6zcOdVLw00A/gC4gWB3rMK+21dxyQC+uX?=
 =?us-ascii?Q?8dsKWrKsZUVxisjpkMpXA52blkK83jUSgXHSTHC1yXV+Hg2GcU2RgcRSeT9U?=
 =?us-ascii?Q?0Ww/kEop2gZb6UYWyBJZUqklOtXNhJhrQuVMZI7jAM5ScZtZoFbv5aBTWjMM?=
 =?us-ascii?Q?8LuqTfL3MhkPjvPaJ4VCcjGeyLgqqd8gX60tZvrGbYhMKXR8Xq6qEKsp0q5C?=
 =?us-ascii?Q?I/DF5ihnJVoWbtISE0So9xe0HqehQk1MxynE8zbkfmwISbbcoZUsCwt5AJVb?=
 =?us-ascii?Q?lOMvgWPg+FWSoxIDAiTv9cugPkgeDlENB/xOPZZ0Qe7kaOr3267IycCwywza?=
 =?us-ascii?Q?BHJ7r92rO3atd+jlXelj+TDJ7KsfVwfP1DLbmrBCgERbUvQuSmmIw7Spb5rA?=
 =?us-ascii?Q?Ho92+Onsf3aGkjyr9EqgBSbRtLjg1r0iREdVsToiNnFdg6MI3DOMfb7CGENv?=
 =?us-ascii?Q?Ztwcep4RAVCPTCrhewWGbTjONoeaIGRTqBvRo/QY9YoyOvdFdzggnHXqn+BW?=
 =?us-ascii?Q?8u1TeDKAnaBrLJxJELTTXu4tF6qdQ6WW5zNfXrchse5SB8ZQr8L3irVB9ALy?=
 =?us-ascii?Q?Nn+2Gh/PODgI8xcvDNn/NzCicYM48Z/mSxx33ZWkeJHYfMfaPA7t8yqlWWn6?=
 =?us-ascii?Q?4MqK78l2S58Ve3XN+OS+H4W6TbaLg2+mVZdB7mei/N9MHSZsqGPo6MJ5SRps?=
 =?us-ascii?Q?woziM/B7san4GSXdrBK+exas/QlBXwi5MQY/xa6GPIvK1jCasvpJRR5u1X0v?=
 =?us-ascii?Q?KlK8oH8P0DAl3w8+yFU4kPJ9AgU388/bQhRoelDszRcUh1U5Y3qZ5XyQ0nC/?=
 =?us-ascii?Q?l93dY1RJwyJY4pfFtCFHQK6SLpJ5HGQrVKzM7rgyYGyb4v5zPh7lNXtQxuiw?=
 =?us-ascii?Q?+cmu1c7uhUGmgpiJ1byWXVPDvwiosEWqGROLwUyoN6/w8JBUUDJEDj2s10kr?=
 =?us-ascii?Q?acf92j6t7OgX1l3mAYVMXpbj0RhuU6CufMk1eim/9BPkzJCaAl0gmS9/Ll5e?=
 =?us-ascii?Q?hhSmoke6tfV2TzjcnIBKkPdYFSKw5VMLzPIVIuyRANpqpB39vvv8SzkwP0HI?=
 =?us-ascii?Q?5kVbE1fqxlb3NRmZDB+zAe/zJrovNNcCmbYOHHh9M1FnVm1CepMH12P92BMF?=
 =?us-ascii?Q?DSU4yb+X4qFPUXfp2KLzfKtiIZYsUOornxTHDvMxOnBkzqJkfvtuAmJimWqX?=
 =?us-ascii?Q?VgPOmoV2uK13powwsjivCZDtNj2jKez9LIGFe5b6M0MKgIl//Z+AwyO45bZK?=
 =?us-ascii?Q?QFr7Es6TmJ/SWjgNscDzW5biDPffvVqgvfqYsQ9tAe5o32+qDRgEMBiT8YED?=
 =?us-ascii?Q?E+dKz1CVy5s1krtv2JXF+5ARIvvmcAI=3D?=
X-Exchange-RoutingPolicyChecked: 
	pASLyOHBoxdDvOtW/uzRvVkCFMSph5EudAak5pRwKJB0tM7vmr2YTiHPSRWE9fGeWMhPdOfs0yj4dTObDOpXfHCXVdRwROUrvatVMc48DIY9gsvZLQ8YNcOaHuyZ/2BdkOBfgwmAdTNZvlk/eB78j9hyGtpuprB+llAtMG0FvtPTk/5qX7IOxsHoi3NjAVBdFkoKJ7st1UJXxrcjPZHx5oJgONQjhNndKWW+mvltaYdQWvYflwibdY1gwK+k5clfBSJejTRESpbE7Oh20hk1EpYsOEnDcdxf4/qALjK70cK6i4JsNNBzAdzrNiCofA+qD9bO9TNG+jI/9WpbJrlCoQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c8a748-262a-494c-d075-08de859dbdee
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:07.8396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfm8n9Q2mPVYIp0FZVtbNK8AP5jSXkVgo9XB/qghw7o8Vbg99G7F5Mm1J1n7aFtNMy/1XH7LjhZJjX0DuEwGgjz6hmgzwb62O7LoWODiFO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bbc839 cx=c_pps
 a=0FlYyfQadWprtAtRvkXThA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=W3DJtOadfAajD9ohS_gA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX4BVLNBS+kl4N
 LUEm1z7aotB98pXL+P+eZ1DgshZuDskBWjLl1h8Quatf34HIcXf7Sa2kQJMzLwghEc6EbnDe0pi
 clMZ6eVJCDPW4AbF9Sh/YPkh6PIYUYOw3p94LXqd9H/aNBkNMoaW3AxTcc0XLc6Lr94bSr/Suak
 owftK+3qL1EY+gSmpDThE+rtjq/rRyEc/APfBEsM16VMfICW5wzviGJcezzZ9xurNI2kmliUQmv
 5xAmse3KYc1hDVAM3L8Uax9ZdLzHNIkN7CwhlnmqXZniNjw/BZSlVoTdZPTtl7FRdl/BDvyXokj
 73bii7XoTLLN/COUWahqE7qrcvCTAiO8H4H3faAo7ejVCWJw4Q9d8ZQYNypIBkbfFkOom9L0uxP
 LcVjmb++nK0WiQ3Nsh/Qr0fqV3LKDRqXmFrUcQNr/PZcj5tkts9yQfkvuROgKVOkYpREea+M+kP
 SL7fdmVmy6FbRnNct9g==
X-Proofpoint-GUID: ZCjTNP3ywYk0Cn8Ipbm00fxsFpwuDESx
X-Proofpoint-ORIG-GUID: ZCjTNP3ywYk0Cn8Ipbm00fxsFpwuDESx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125389

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.2
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.1
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.0

Removed the patch which is no need, when changed to meson.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...ce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} (85%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
similarity index 85%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
index 7322dedc29..2033eb082f 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -7,13 +7,14 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     "
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
 
 DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
 
 inherit xfce-app
 
-SRC_URI:append = " file://fix-cross-compile.patch"
-SRC_URI[sha256sum] = "cf717d032d2d0555978c479299da992af6dc3363ae7e758af9515c7166eac170"
+SRC_URI[sha256sum] = "5032f60a31df5e50a80512e301b595be5ea6a6bd762cdd95cacc24cbd29a01d7"
 
 do_install:append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
-- 
2.50.0


