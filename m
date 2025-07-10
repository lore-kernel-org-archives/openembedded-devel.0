Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B477C83F1C
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 05:24:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1374.1752125032438692241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 22:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9286ecb856=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A2xD8q018598
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Jul 2025 22:23:52 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5mvdc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 22:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1wFbdGq0DaQ6HsTbQbf60+hzPMlzYWwyD0tD000yZezgEtDxRAEQkrikm1BQ9twDkmlEaVTwmB4tZ9h63/k7BjWVKEc36g1UEs/JJOrkq8MTco0qeDQRU0YQE27PPKtxSX7KYVYsv9c3MvQv5PVJDIUv104zLQFbr8hGD5qu5YB4iku98mA2e1u6gvuMVYHdWQxokzP+5msMcJ/o3DR86fG85OGhn4a70cAlyaOpoIz6/+q7oZZy4CGeQd9Mf4g/Xv0xmOHgFkdUgPs/joSWS7t904fJpQ55+H1y86cSn8u0umLaVAjy4uXjD1CLujqidusk4DLlRng3zuVcuOH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk58ZZiny2ihS9K1CFXczwxot0BPvxh9er6KZjZAMDw=;
 b=rBHzlgKzNE50aj12aAX7DpTwKO+sUTKvDNLmVIpalUG7JmVWi6EGIlHO6K1vTS1jU+0gUuo7JKV3Wl9Zf+CjMe90D1c6pmwuSwTTflm8/EnVpDtTwR/18aCxxOjceKfoYm1abrxPH6dt9XEXXZZjnwfhKNN4nOy4dgwAL+jydOfg38sfhSiPvdoWDmG33J6kNnz2cwryxTEW0snaDNtTcOPHbsgrQIDIwmrMdGxMjD+ncpoyTe40la2DYnIUeFYLhyu/hKS1J98oCPE6b8SS0dS0kSF6FTf7ofNjxB/5QO27oHgV0eInN168ZCbSgYW39FqhEIO1Udc1NSKTMA875w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 05:23:49 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:23:48 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-perl][scarthgap][PATCH] logcheck: correct the SRC_URI
Date: Thu, 10 Jul 2025 13:23:28 +0800
Message-Id: <20250710052328.3399677-3-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
References: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0171.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::21) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4002139b-1da9-4b39-e6c7-08ddbf71f2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GZjy7U5TYfIDEEjMVUGiTxEuxqockxcUwhR7pE4ybJeqY+mD4/Sg57PU21VB?=
 =?us-ascii?Q?VqisFgsEj+h2poXmxyDOzzu07qCWF9Gz+mZwtFX0FdhvO6jt8HqT6amyi43R?=
 =?us-ascii?Q?y1kq3XZZskKJdxHHLqlzCicA76uXN0OEDFUdapCxq9ALeFC+l7wIKg+yjqpL?=
 =?us-ascii?Q?e9xhQiKQsrNmQt3Y0c3RkTtc7CrI4Gkv0ixX/ijOg5ELNWP8eWmWbXT5hxnp?=
 =?us-ascii?Q?LGkCkK+eQBwaoF4dVIHtc2eM+/ffO2mrKyP25Ib9NVnig/QlBQZ7Mj5+CxZY?=
 =?us-ascii?Q?iLZy/VqgQcNr5i/1wq7fI2o3KR6cNWV5GW3Hk8AUSMSPIT3CVyEWEroVwek5?=
 =?us-ascii?Q?uYnrCps8lBcqGRWZ2CJpQx3kERz2b73kadwfsgJIIv0KkZcDf8s8KOKoNmKI?=
 =?us-ascii?Q?de+4SmJRllT3AtmIQ1HW/BbtjD6v5YxHcz+0cGIrjneDsrPisYer4KIP+GEW?=
 =?us-ascii?Q?6q3YcMdSmushlZ/HadHap8KqVr/XkSgW4/tGpAWIQGgRwwXQdtU07Vwh86w1?=
 =?us-ascii?Q?47kotqmeKQhwLMcEQd1xvyHlZXHNcAUO8NPgI1vdCJ2s+dX+NT0dW+cTACWY?=
 =?us-ascii?Q?m0vmhNRHjnDXr6mFW+tCEQVcvbpXSVmLrru2b0M80P59w5vOPBG2dGZQCm98?=
 =?us-ascii?Q?9Ji6YNdhAEkS49/+F7DPHfpM3DBAESks59eZWq/kEKxm/YWJInOUMCsm0NuN?=
 =?us-ascii?Q?xKxEgoOrIpEbWLfeCgy6yKhPMCLeIBenQFvG8AbqqYsubRtr4uwTiZq2F2M+?=
 =?us-ascii?Q?ALKjPI1K11kFWXVDII3bNlxHaTc7i1YCylz9M2hU4SsifggCEp8wraXMa8NB?=
 =?us-ascii?Q?8Tyf6blmfSsmpAMTXwZtp2ACjEpK3oArBuMN74dhomvTiXUmDlRcTZ7PtgAK?=
 =?us-ascii?Q?KS9nkaoMMOJ7Vi667tlOCbuKlY4GBcFYw5XiuopyGK6uGJI9jlon97YKSVZY?=
 =?us-ascii?Q?q1azgRjKTKwEgL8Ieedk+7/XOhHlWfFVuqUeDxoI5/yBPeokDy7e4XmkeSHB?=
 =?us-ascii?Q?KUeRzD0BuwBKCJQIEOnFPmOpuJUQ5CMd11qlxMIV463G10aI1lSkGJXGoKo1?=
 =?us-ascii?Q?CnZzUNNRawcsx7c4jb75oxZ+Xdklp1yL93KHL39uN/fRDXyfB6A69h7q67gt?=
 =?us-ascii?Q?8jlDmOd0PoeOPAfKjszsvyUW0uimwSo0Z2DanSsr2IMl2kN0XOeC1u5k9fip?=
 =?us-ascii?Q?UL36eo3bO7g07VnKcqzFv1Wzp5606BSn9yDz5/plxqfUZ1OlmYuXGJ66STQO?=
 =?us-ascii?Q?tU1Xy6Xo05ki6AFqDRKHniooRuWHpveE5MdS0Qd+NWQEczCfVWLR8NhavIcG?=
 =?us-ascii?Q?szvbpdcZky842tnJvmiz23fJeXgNTY/4E/oO5Pvxr8a2fN/IdIclooZ05GPg?=
 =?us-ascii?Q?a8Wko0Z0mpDk/34OmGtrtA1DNja98PYSCYb0VD2Al8JgOvoVrcBZSUo8k2jE?=
 =?us-ascii?Q?Z0projJkvJ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ucQyB4EUWRPQuBzOSsBkIh4nxT0naUqKcLck52Hj99OuaTxDjKKH/Y1Eg6be?=
 =?us-ascii?Q?5M8ostF6xcm+euaPY14Kdle3EKXnKeIHM+rC662eQtuAFGurSlRSOldHUIrF?=
 =?us-ascii?Q?gNERbwznPFxXEqA02nOD3OnL450Ox3kJApBaIEXv0nbkgFGpzh/55SZ96B3a?=
 =?us-ascii?Q?BhVQwGvqG8/aVxs9fmV7srvO255tk3hhzbO+M4wfDQjlCeeetbhE1H+hKFsD?=
 =?us-ascii?Q?uxdX1/91/bgRZWGwOu+w+H953WoxbGrfJAC3ATrF6jGAkvboeL/1mn4PKHNa?=
 =?us-ascii?Q?qvfRD+cKe+Xwfwlf6lSJmbw/BKK+lweFhPcq6jX0Fnul42HsNzDMXCdi/LvB?=
 =?us-ascii?Q?q2koxG67bSuMdpi263J7FrhK84DFcAo3UjvMFINxjytiXCHuXqHXrJIY2fOO?=
 =?us-ascii?Q?NcaKscjIU97c84rsDcvATZwl8L374kv4LLaYr+ovG66LQ28FHl1O+sdL8VlT?=
 =?us-ascii?Q?3Dh5rHbRKhNflThtAEqfQY4xTg6e3Mq/zOisQz+Bf2v7HNYHEbcDRcZLNr4a?=
 =?us-ascii?Q?6lZBP2mDl7+J9wTxctw9uArrjkPte4iBpk8PkALgNFbQHscCUlyqcvgtDJNk?=
 =?us-ascii?Q?G2qXk0XqzZyXmbTLfFJFKdC/PvTh+MZTBrO5JQ4Lj3DhFowSMur42Jn1/S2S?=
 =?us-ascii?Q?3SEYkv0hVaHR7qFMZJb/LLHVZBl67Px+Hz1ULo/v6QKt+bjGMGbB0SnCB/jX?=
 =?us-ascii?Q?vmp6kbQSnufl9P9meFvMDozmlXsNhPfxS+jqSvvSg4WEuZovAQhJTaLajxjH?=
 =?us-ascii?Q?A+bOr89R5JxKeyFfWEwsN2LPUM4ayv8Oed1HsRveNgimcNnOMdt6myU+8oWw?=
 =?us-ascii?Q?MsJp17Y7yJoaBs0ShweBtCwtZLy4rS7bP7jfoi2+PdBRFs/LkEJvYlxKJ7KV?=
 =?us-ascii?Q?ANUvivrnFm3gZoowZ5BY9cyuspbGcXvv6VD+eTEp1cpjlTGRtxhW918TMpZq?=
 =?us-ascii?Q?/8SC3lfX2xdRQDgy0KNQVK81jH8kLcE7ArO62vCSwlmUytCMebBqBYfsLGKf?=
 =?us-ascii?Q?72qb+MReS2I0YUsBBogJPX37RVWHC/zfbomlV8afQkNBLVJDiSW5I/jL2r4T?=
 =?us-ascii?Q?z4Mj9O5dUrHSq94WE0d1L/LpmDaF5JgcSS00d4r1txDCGlTuOTYMOi9DgcV/?=
 =?us-ascii?Q?kuNuehY3ZVZJ+UVHJ1oxJeO4BlBedroh1TfLVoh4t7fns06XT5CTQDYi3ttB?=
 =?us-ascii?Q?KdcD6H/B2Rr6m7WSuJyhqiKXmGg/YPwqeRuh8kR069qyTh9Ho/k3zqMiGbEa?=
 =?us-ascii?Q?FRB3atxj52NUI82IiOkyvMo3Rc15iUPJd/ljo3FxsxhSifd07AfTSHjKGOnH?=
 =?us-ascii?Q?Fvbsiu8qrACnIrIklL1GIJn9qhkSsIo0h9ePGMDyOwIIPA3jmMkTuAdXS0Eu?=
 =?us-ascii?Q?Jfx1U3asC1wS8/pxZfFKGYSgPWaIAKA41JE8TM8TLIEnZfC/oKbZDk/z8Sb/?=
 =?us-ascii?Q?6d2j49POLyq+gvCzGJzNEfv3F5vXf3idIIGIahDvE1FArmHq7Do8LtFE+1l1?=
 =?us-ascii?Q?xH7HGjE/Hvx2h/wFtjhsK+VXo/1UGkK8xDm+EqpDPyhQovt4mC2keh1WGPNW?=
 =?us-ascii?Q?Y654IdWNU4dPEeF46Rr+eOC3uCvMJvfA0ceJNHnqd2OQvONJXWK4DRRmQIAt?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4002139b-1da9-4b39-e6c7-08ddbf71f2e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:23:48.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FURR9ATfZShoA/tMs78xUZi3A3z8+X9oepzPExclUbB505zrgK0ngwM5eIRY93hnGlKlb/MxpOiEFG37FX6McDM6dGNm4vawSHbNBjp9LSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX59cuZBuQsIQC l2lQHvcRBQmhDHTxxcNhh70m5B3J7U8m5sfpC4bwNxtIyY2n4t3r8gimg8XWbe6B8KlxZOALaZ2 DXJ/smf4BeV3oEMHaJs19JIyevKoiR52/wp4nGCDLgcuXTAi2b98MtFl9S+Cdxb3vHP9XechkyS
 NFj9bpmbHJk+MaVL/lLEH8EW5qfMSKgz74yyYd0hph5uC2quvrwNKYHi9eh16XTT0fceUf8DX7U a1NhmXJrYEWs1A8W7Fi88NMM8FR9lZpgqkz21UIBQijEBu4AGe4UKGwIvgddo7KtYoUdqBZXF6y UGlbBfGfqzyDxj0w29imADzrmfCrxTfRzqQtWdDlEPbjcaiu0y+Awf0QSJFdJXxYLXPnWVfl8rr C9K2RF3z
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686f4e68 cx=c_pps a=C121ihmqoWJLztpWA59etQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=any1U0a9AAAA:8 a=t7CeM3EgAAAA:8 a=sgloKSfiJ8h4_L10iagA:9 a=60uXiyMm-41XKgWTl_BI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e5LR1kPNrtmsBkheFRCqHvkaTJAeutaz
X-Proofpoint-GUID: e5LR1kPNrtmsBkheFRCqHvkaTJAeutaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118392

From: Guocai He <guocai.he.cn@windriver.com>

In http://ftp.debian.org/debian/pool/main/l/logcheck/, the
tarball of version 1.4.3 is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
The maintainer tell that the old tarballs in https://snapshot.debian.org/
---
 meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
index c13bd940ea..3d17de6390 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20230718T155737Z/pool/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
 SRC_URI[sha256sum] = "ad83ae80bd780bdae5eefd40ad59a3e97b85ad3a4962aa7c00d98ed3bdffcdd0"
-- 
2.34.1


