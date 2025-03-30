Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA22BC36016
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27661.1743326896544949078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KTvh005812
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111wb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJtNOB06B1jwrSw3z61Y4uc0J+ddJ3WXjciKIfBYLF6i+VKhfPCkhcHFUwXOIYoGqqF/8jaQODgbWX/Nb/Jl5U5+Kfu4x64q9TaAu15hD5wPwfDOsR7BEQ3XrrWTyAtKoPFllP/FNcEpULbhLib6+7vvHOBasvJAzENTpwdxCThqEhpeG+c5DIBJw11Blw2sCDxd1Hsc155OoJSBWK/aOIrPyS2YDItVA+xKYdGmHwemeiAAriy+R8J3XmL5LndPkmi58UKGqoYkDvS+dcVC2YPEk7EeHe2/GX4ooCnZdt36LI3zxCdMR4VP+ndXH8gSoX/RI2cxlQJq0iHhmALJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjfeKbkXQ35MzUyWeEQEpQQwOxgC+wOsExtRw0rwp9o=;
 b=hZfq/jXzPDLF/adZ/zn37rJ9wOv2NKZAWXPXf4Y09Rsrl2rrOnW7ccQOS3g9xMyBPuTVyDcfaJQ0u4ly3KXR0iWVBaKZnlrPzdeo/5ui5uEr9P0GkKQQ8AKJce0y7/0sL5nZZsfGo2BZ2UbvVkjhpdVs/d149zsmw0GynFQBNZVX/o9PRZydux9Qca/gT8ERl7A0Aot6q64Y0dZkbGz+7a+9+GgAwdraPamKWD7vcg0nI02+Z+hUgI+KqU6dZWMxo5Ok510tW7jMl+wSTow0YEsUpSc8Cqa19IxSDDtvH9iucylsHFwY6IKMukQA/NWVe25YAI2Fhc1GzP5ibfViWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/7] netplan: upgrade 1.1.1 -> 1.1.2
Date: Sun, 30 Mar 2025 17:27:56 +0800
Message-Id: <20250330092800.1275186-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092800.1275186-1-yi.zhao@windriver.com>
References: <20250330092800.1275186-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 71318bf5-19c8-4cfe-767c-08dd6f6d3246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s+LwrpUWeKnQGkBMcEQ94bU7zp7URK6peaTZe6cfgNOtpEMkIT6mncnWkwOz?=
 =?us-ascii?Q?xQ1xRSH/6YuEY6TRwtrF/xI3GEPraKmsn6jPcVJIW8u2dTcAoy9tXYcEAU+e?=
 =?us-ascii?Q?z4Y3NlOr3GuzWDLl4UDv/9AA9KV6HkqeYSj+akoDqz5o1ngRrw/dB+0MtXAd?=
 =?us-ascii?Q?Wxa4mh6NOitog9YXb5tMTL1IB7EW3im2AnD0zF+STXvlBnYP0LTYoNCAb2jj?=
 =?us-ascii?Q?x23d9FLOeht/zc3asS1GLNs/raZQneqfsKPPW6KSKHHUcwsKXpva6KZx1x25?=
 =?us-ascii?Q?GVno1iNxfAgDmvTstSzOPETqIFCtUgd0mqzBaZuX5mbK4rmhl+uiyXQgw/sr?=
 =?us-ascii?Q?egp5w3g1Nd/iSFVpgou5duEO21S4JQkjTKjHGJUdJsQOp2VH03zB4/D59myL?=
 =?us-ascii?Q?PHFTi2AjGnNTL8MZb28883uwZeuVgOrQtczH9eDUJORjHW/i0ubiAOEiHTd4?=
 =?us-ascii?Q?qgw3LBYTaZ8eRRAtIeEnDywVm8TmTuadknGzi/m+Q8Aotvek+aBcvwJrPwz0?=
 =?us-ascii?Q?tHhv8IBfYGtL5lct6TP8zy4AqnlkHZT2dPPqU4KF3148fm7towZHLx88SZZg?=
 =?us-ascii?Q?er+sjGWBXFFmac0nGlUotWOUrhc/omSPWBdvgy69YMQURv2R2lz0y1hJGVnM?=
 =?us-ascii?Q?IyMXLxk7oBgyDDBt/QKcYgT0j+pQePWhvXA0ykhhbKphxWQMWuctasTVqv7Q?=
 =?us-ascii?Q?ruXJCC77nGwkPkfV/PQDV9xhIKoeNtIAXA5bPy6bkpGANC6+wt5TrbciC6L3?=
 =?us-ascii?Q?g0MVFsnL29dgnSA9icDy/PceSmDeDpNp1sjokYru7RjmD4SUjc7/PFOGzTBY?=
 =?us-ascii?Q?J6Ap8oj3na2fGIphlXHlgZEvSHLopBcTG+1n8EACdAAjOEUySLePC2SmR7hy?=
 =?us-ascii?Q?DVSBq0SpHDcdePhyQj9xnaVddb6E71Ly8AU1TEbIViAA3PrDag6ZpGOjbfLa?=
 =?us-ascii?Q?kGT9p+lD4XuqodvBNrr03gLjFFSLc8pdzETrFGU6cEizVNfEkWT0MiZWk/bw?=
 =?us-ascii?Q?f/ka3Ngu//+mC74x/U207gPfA8fsxdsAkJTRevAqixEuHVcZV8PfI+oF8cHd?=
 =?us-ascii?Q?quMc2gZHeI+JN16+x0uR/A4aOAjaB1KjhRF1Nyntq34B12pURFj4slkcqEZk?=
 =?us-ascii?Q?AatMj710IBsO74paC9pV+zWYSPuqON1u9M2861s+iZsNT3vBZl8Ld7eOTIhm?=
 =?us-ascii?Q?q6vCiF3vwr8DbO65ljzk2uEXeyIfNsPG01qzoX45WdhxiqL0WxugV37W8YtQ?=
 =?us-ascii?Q?ymB59ydQmayU6JC1fW96YNhWaQyPqBktFk/0LwiOapoCXBsruomb3Dwzmnrs?=
 =?us-ascii?Q?dkLZlKcPRFqRSLpFqphuo3TmP3xX9A/cHlxh/iLVlO3yHkz6JUo5s+mGgwst?=
 =?us-ascii?Q?A2rsw2VNBH5yY6GafSINknxykBR1BvZU2AooP2H3EULgvIEVQVmjq1cp7HUh?=
 =?us-ascii?Q?kNfhXUxNZdCLJ5/u6vDCM43z6+qy+4vUc1LkJbdZdNSELBfjHZ/ceYFT4aJN?=
 =?us-ascii?Q?z04ULloYqx0YEC8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?djtKO5mSr5o2i1TeILYftnK9Na1zK9VOpxQ3CiqrLZrkjI/ATxPgid6x3ejk?=
 =?us-ascii?Q?YimTLuOHJXm1pA6YnsfWG12Ctm/GuJgy1n6gpL6gUesktgouvwiexaZOg+9g?=
 =?us-ascii?Q?Q9bf76TDu8DWftoZGJkIcNg4XNhBuMYlvn4xoRF8CcwaGw3sLeKjDiuYC6CL?=
 =?us-ascii?Q?jNKPjMRt070x+QPQ+585jbkXHoor9XhhaSuuctKGgdDGt3FMbGqHxEHPd2YN?=
 =?us-ascii?Q?4+Bl0hVVwxfPYMMw3FzeVEcyNUJUr1klRB3FzeP7mt2odrA3F5mCYyB0t6B7?=
 =?us-ascii?Q?5TgfdDqDlBvf40Yewr8VNcoVUIDLYq0ZVKwRh/p+wnd5qtDJFPJTKFAwalcF?=
 =?us-ascii?Q?P9GVkLcNj4I4fiw/BXPdcm+B8ofpOGouhkZWXhIVSyXKfxal4Y+2krVaNYcU?=
 =?us-ascii?Q?/ku9wELuPIvg+Mn+x4nSjMzUQS84BrwS0pxUSX7TvABW2CtJXmbbVlENPa9S?=
 =?us-ascii?Q?8dnim5O7lyP5UIRAXTA6aEOf9WKZThboQV/g1Q12PR5hJxRB87amjYifp9oW?=
 =?us-ascii?Q?WVRZGpuPQNIufYGO4np3/bLR8W6Oi7N9wiEaUMkBijlEPnXPoLZ7o95WLZ9T?=
 =?us-ascii?Q?p3gLpg5bqlEOVOcPQDLHUqepmR5uOyF+2COKmGp+fUTHyvBTcFCcJQ7Uegrz?=
 =?us-ascii?Q?j17lip4yWRXbYgdc2jduaH5DZXJ4yZxs3qTgHgnSAXwXiV9si/1eA6NMqGDJ?=
 =?us-ascii?Q?OVPVgAw6r1tK4m9PlercXPAmr0IcpoYN26bF+s8M+Z/ewvpPrxj2YcY3OFbV?=
 =?us-ascii?Q?saJUVGBytiST8x/fh71XurpnDfvCFU2+NmsUqMXQPuTZNSSpsS45OTM4JEuh?=
 =?us-ascii?Q?5bHmCkCkx7c9z3s4VNRLG0ucP8T1+A7M+CuG0m6ww76CGgmYi2hyTAPvJdqu?=
 =?us-ascii?Q?bnvqbpmTS2DLm1l4ot4JERSOJC+YabwMMLJ2E+F0akMnL64JNE481B17mNDK?=
 =?us-ascii?Q?MqUxE9RUdZ8uBQs6OOCA5OvM/InA7YhO+RG0c703JV10d4yZsMElhugXbdbR?=
 =?us-ascii?Q?u/js7+Oy5Mk5iI+lb9OVEV9Op5zre6z1nizWwYvf68TcPDlSHFnY6VbUuqvG?=
 =?us-ascii?Q?OVNmeGaxSsN6/bho5oFmvZknrwpHPb+YmzpbIwyO+SfY1FyabkBoW4kWlp4G?=
 =?us-ascii?Q?evdv35TtWfKNMbjUYbABuolF4z3TU3Dfrtox6dRbiPihUCumd8xPquh49ktS?=
 =?us-ascii?Q?CW3f8EChVKOTqYFCx3g/9UuuUid/gGT1KAQLS1ts6TxfR4s4bwoBlKgs6Wy8?=
 =?us-ascii?Q?E+BQTw0zohzhPb1KOYlEEiPgoxX8eFNe784fYWmUIaQyUO0c4fML/nUMKyOc?=
 =?us-ascii?Q?gG51a4sDviPRoO82OFIx4wezM285GTSO3/5ROmYc5zZp9dJenKlKuMTgCpRW?=
 =?us-ascii?Q?LEmpsvBCDMQbXWhwjToyo1Idl9lGglzpuj2bRJLJjsP10CdfsM3wPLAwIUf6?=
 =?us-ascii?Q?1mepqncmFIQfuIfGtJxLZoYhKeeouyzqqCeE/04ZLWiTZQW2B2BqwdspS3As?=
 =?us-ascii?Q?fF1dL2AmbfmT/A7NqS55d9MNzJow5bpoP7oGpkofB83Km8mxa0tXfQhF7gow?=
 =?us-ascii?Q?GTHIjMx/6lS2URWYuzELM4gUd7vpVnBuiWNDliY3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71318bf5-19c8-4cfe-767c-08dd6f6d3246
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:14.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLZY6llOixLWeQkGQSLtnQEbm0cguVRmwD74+tbLg2bIBk8du+HWbMqZLM/CmnLJG+7P8SJ2wrHTF4bajXxt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90eaf cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Yhdj7NcvIbXozQyVLjEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _FsZsL8gOgeXgEe7kWudY4Sgu1N2fsdY
X-Proofpoint-GUID: _FsZsL8gOgeXgEe7kWudY4Sgu1N2fsdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116381

ChangeLog:
https://github.com/canonical/netplan/releases/tag/1.1.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../netplan/{netplan_1.1.1.bb => netplan_1.1.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.1.1.bb => netplan_1.1.2.bb} (97%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
similarity index 97%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
index 96a3cdbfd7..69c2165ab1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=stable/1.1;protocol=
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-SRCREV = "731d3c9e7e88d3f27ed6cf77edba7a2f5890a778"
+SRCREV = "01045f683b9419beb90119497cd1b2be44e83b8e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


