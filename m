Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD3EE7718E
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 09:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19398.1735205499515696593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Dec 2024 01:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090c61c71=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ9LV8u003828
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:39 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub43qb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmDUdK3wjUPDxzJ1IY52CR9JZ0z78/3edB+dtzo547kmb5ezcFc3W9R38hFxhQP3eW/hdEohdS04LUKn+rL14W3wE7+u36yMICkJEcS884YnHq3oaVOPedp2wEsfh30Rc6KN6phpY+ftgvVe7/5nOgHHX8vXGgD8hpMpVILNsOgKV4lgja9tVa37mjPrxCYoir8bO+43SScU8/EpIXcQtrfn/a5VwginWwdAYNn2zMOiTKnEMV4u2426W62Wrq95yEaVxPkCyl2Qbcsl48oMpZgYO2YO1HbT4gePKrCfQl+/BcWgOuFPXdEUGIILvJHgKjKOTiP4i+OkOQhGs0yhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB4jEjVKOXt3TxRA/HLm4ztfOMbYcYh0Ef2D+nPZv+Q=;
 b=iBKZDOnCHoiUWdrfTl18E2C7FTQS1O7BJ6ZiLi1Z6CwIEsTYQQV7AepNOFiJ4g5VelIz+ABKEQq9brHNcSyfeXSRnm6VC6u48g2GVLbobZrkwzfdALuiv5mBfb/u5BVI4ISL8xgdkK0JSXqb/czqtIrLafU8QiloKcOrSoJLwxpVta2G/dcS2ZRCaRfDx/9eguD4WMSYu4Lo/esAJG+kdJ4cNR5Awm0CKEn1ujphIndCqnEmXnwTh/BpA0aNAUE9UQHVqYjY2RNXJyS4pdCFJjgrso7SBWVGJM3SvfxhdSvHFkk1EZvVYEv471fK8aho3t8Hl29/KaNBFcX41St/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.16; Thu, 26 Dec 2024 09:31:32 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 09:31:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] networkmanager: upgrade 1.48.10 -> 1.50.0
Date: Thu, 26 Dec 2024 17:31:15 +0800
Message-Id: <20241226093116.874361-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226093116.874361-1-yi.zhao@windriver.com>
References: <20241226093116.874361-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b430db-7af1-4ab1-2f65-08dd25901597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JDu5Z151GsWz62ihWAJ46+sIn3DWBhs/kTIQsIVVOHmlSU3h7+escREA+4L8?=
 =?us-ascii?Q?+aVtO+C0vXrxh/jonaMY+ieQ+vAjy8E+3DNa0cXqHW4NqEwsiR89XQYupoIL?=
 =?us-ascii?Q?6QeckEEyz2qPuTdCHneZX7Pq/WNx+jf+WBMFVXw/Cp0QC257ahwka8W8KvTE?=
 =?us-ascii?Q?2PddkWhZgznN0DTZ5V9qtJOX73SaDLexQTD1a1fYRt7/RvzqzDA/wrIew3Aj?=
 =?us-ascii?Q?uvD4N9Txdhhqeo6rOf0HzjbVDRe9a4BRmDAe2Ba+g3hVlFCewCAq7S/aI0nn?=
 =?us-ascii?Q?8/+t2/AFM48pv6I7gb9SG5Hr39G+XaixhhdE1zfDGwrHp2DerBwYxpavpWKu?=
 =?us-ascii?Q?qeu4q1HyQGfK7WzVT2U/sFECYX7ZOowISQVUlxWzoms1xFnSX+S926Um4kpq?=
 =?us-ascii?Q?JnkcPASmCoJBOS4Rtmil8gtYAT+polIikBx/eczPcJMjJy3F/7ZIBwXGnPK7?=
 =?us-ascii?Q?YeVpRzy6aRjz7pRg9puJN9oLpUkxV0xV6rhfYrLcKfcO1P44dgcUkq2bzDmz?=
 =?us-ascii?Q?Jo+RbAmOBYzZpc0zpOs7dbcmLH/+5uleAyMMbgvG7kINtZIYuO1BWU+tlOz8?=
 =?us-ascii?Q?5HkwyYpLEX6c5eV4izZDkUDmabt8LY+WF6BqQAKLALf9mclU2fSFFI85MHW7?=
 =?us-ascii?Q?nX0dVAb4ClnKcxkAU8EpeyMM1a1zbAxjfNGQedOtIM0vqbnR+y4UHybS4DjS?=
 =?us-ascii?Q?eVAOaAf+mSyQRNPL6Vi/mTQRTYRMAokrELGKwVuJf7+wuAdTDU3olLjpxvHq?=
 =?us-ascii?Q?PlQZ+2fL9lB/Hyepe4AzXQMVsxSTgxLPuBiGJTacRw48tUe4NmvuIixgB7XS?=
 =?us-ascii?Q?UDRzEBimUHa1a+OPNvahxWd4HxR+FGi4sOKMRivzNvKBgDoP+Rf6QziVjBSM?=
 =?us-ascii?Q?QaxNDScVWWMYQoDPOVx12Wa0EeBBnmN2f4B8k0jqqPd2e6Ce/2Wvr8AbPSao?=
 =?us-ascii?Q?V9wsDbsTmSi2bw7c6WsTTrysipwEPcTzD+6G6g6yJWNKBC7TjGq9l7qqEdZT?=
 =?us-ascii?Q?ATa9J3ZHfoejjVUFQt5hKwhsPc6BtAjEtmFDcKPx4KIWb2S2aWqz8PGzABqW?=
 =?us-ascii?Q?MYiDtYaDMjhB/vkrYs49p6d3fBP11hGrSSBc/UgeLowGNS02whHIpSUbfIm3?=
 =?us-ascii?Q?72/94c0Ablq4QgFktu/qk4EXU6nsUzQZsy8tDA/G1OBxCMC6tFq0Z/j4o/WQ?=
 =?us-ascii?Q?ESNArvLWG0HOftwEadfeBo1C+zKvk7H+bpjA/UcvfbX0MfY+tsKp95U0F/lI?=
 =?us-ascii?Q?ajepZtIOLsAemgrNl95eFtfmwAD5aGCq75vpFFgi4I/wRXTMhbxSJcqrWiHi?=
 =?us-ascii?Q?qDkB67/NA9LGa7xDg2fT4Efk3oqKBaOMQjXcvEfPq4JHIN/hMvU4NUI0j8/K?=
 =?us-ascii?Q?5/ptnPRYJB4ArKMrZxA/XmUKY4ec2/S+6YmSZTBA0j6ObvtK6g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/HDsV0cIESNeT7TRQLl+8VofhYx7zCXQFW1geloNufpcZ/2T8hYbSVAhk9ma?=
 =?us-ascii?Q?qkBMBCRc3BIwERKbBHL9UHMMLTgKpa4w3sSRV9yC0VhHMFzMZJsPNM0YUein?=
 =?us-ascii?Q?lRd2+poboOOQ49sDZnInF5aZ0cuPPBNxr8oPW9o1Gf3yfrKNtUOIZOV/ISMA?=
 =?us-ascii?Q?g/YibNDyD9nlrePJW6URbwO2wh4VoIocRUqQUUx+VAUgsd0c9AtiYEbeUU30?=
 =?us-ascii?Q?wxx4VotnZclGnLTMBtjVbKVxyMHmUB/NWzIn7cR8lljOe7hdrKBm9hXl2B91?=
 =?us-ascii?Q?/Ft0gLnfR5CoXQPsFkkBVfCLy+vovoDV5W3b2MB9QU45OmHlqSzFAFnPFaUf?=
 =?us-ascii?Q?9a8CnMK78FX5DlNCD+nJCNvAPglcL9VaVAKfnMFe+t7oOm7vkmeoyjMI7ZVF?=
 =?us-ascii?Q?/e0gboWXjxu5aGHHA1Ea2IqOp95hJiFne6zDJSucQvk53uYa8mcm9lfZuJ/T?=
 =?us-ascii?Q?yWbD/IeQec+6gA4yX0i9DSEtt5iGmC2tVb1RVBcgL2WNAXOeyF6ZtSuUN48H?=
 =?us-ascii?Q?EdhkBAivrskm6dBiWuCfxYkoVKC/F4O7B6lijwVqWpuGbP3ytiA4qQ8JG9qZ?=
 =?us-ascii?Q?5YPOA9M1WDyr2FQky3ai6/qQ7oIoJKj5eI3qqsyJkggBoA2G8Q3mOZffXMd3?=
 =?us-ascii?Q?0Yl2a8ryBLfjrgSVAmboGf1bJ82b/Xupnz0a5LG8Pe9qUnAiBFK5UuNP5cyb?=
 =?us-ascii?Q?tt55yUOqMBLjoulQmyYlJE/Qe7mvenYeg9cmIBdS+5SCbFwfZ9JHQpl1vrda?=
 =?us-ascii?Q?0oHGcyIv/iciKhPxjMo3U4RIt2wEPKnLpshyKOT5vsWFEEtTLh+xvww7WJ0j?=
 =?us-ascii?Q?Sq2pKOgylipElX6a9LNCTae72fzoMCh2ODexSDcQOTWvCZbH1UJt+feGHgVa?=
 =?us-ascii?Q?6MCiwdvSncxmS122DSGUGxWKv4G3POHNKwrfW873c6Cp6AiJHkWIAT51tJmQ?=
 =?us-ascii?Q?AQusOM9Ja2TYrztpj0zNRu9m4hBc2PUgS57SzJMYP4R1+X9mZsN2HNWxATgk?=
 =?us-ascii?Q?dS+gjz3Yshnx92NNMs1eogd3F8/b8onI7CCFerYEFgRjsU8w3GQSvBwbfrC/?=
 =?us-ascii?Q?wyVIjNp/Ma0LqCCdDThGjTqSgqc6vQ+mOiJPcWQpmWbzRjzll43AWwbhODa4?=
 =?us-ascii?Q?HapnZ7J3+cZO3LEDi0dxNlz8tgX8ovF3m3ls5KJeOUAYHKKEkaw2sZwCZuI3?=
 =?us-ascii?Q?2qHzJqdaT3D7xzb51jNPzw0CYzx6IVsG+H2VK4RnNKvrqxBlbbU1cDz+SzYz?=
 =?us-ascii?Q?6GUVKNI8TR2wKpUtc93Me9+dYP2GwcG+vq7adWsYH5FqGvjFwW1EzjPBNXnH?=
 =?us-ascii?Q?Lz0ZV9ZeagTg5U1ZHBjH1YswUYIzEMMFVFaBvoU6XADQLjOq46cmu5wh9JyA?=
 =?us-ascii?Q?3yN2KYp8iuU6U4LctEk9sfD0HBtTGkFZVkpaFoefzP7Tw19AL27IodkPA9YV?=
 =?us-ascii?Q?sOLG2nrcOSwZrWktljHkMahc419tPYLzCcQ9ZzKLPucK8VqMvjR9uqD9mS7t?=
 =?us-ascii?Q?6TiLjGT9DU9AlOUnpJHM054JX81rP+fcZGDR5nFG10Xu4xoqIHDlCmF0D9YU?=
 =?us-ascii?Q?O4FX3UoqGdY1hTYVSzF4vD3fyftdsSLQl6OjMjs2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b430db-7af1-4ab1-2f65-08dd25901597
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 09:31:32.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsbxxvBUdyOjUz8eCkC3nWEXHlEHM0gIUM9LBp2uRjQ2FrO5Vchzsmhvlg5GpjrQKOT0Lj+8hn7ZluldzCnoFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676d227b cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=bSMUa81cj67YOZ3HX3kA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oZnjaNbAYnccweq3K8C_JnNcjgnzx792
X-Proofpoint-ORIG-GUID: oZnjaNbAYnccweq3K8C_JnNcjgnzx792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-26_04,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 09:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114553

ChangeLog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.0/NEWS

Drop 0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch as
it has been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...re-Disable-sd_dhcp6_client_set_duid_.patch | 65 -------------------
 ...er_1.48.10.bb => networkmanager_1.50.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 67 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.48.10.bb => networkmanager_1.50.0.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch
deleted file mode 100644
index 8e246efe01..0000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 34d7a6c9919a73c2e716835000944c17438b2ca1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 14:03:15 -0700
-Subject: [PATCH] libnm-systemd-core: Disable sd_dhcp6_client_set_duid_uuid
- function
-
-When building on musl systems ( with out systemd ), and using LLD linker
-from LLVM project we fail to link with undefined symbols.
-
-This symbol is in sd_id128.c but its disabled, so let disable the functions
-which need this function.
-
-| x86_64-yoe-linux-musl-ld.lld: error: undefined symbol: sd_id128_get_machine_app_specific
-| >>> referenced by sd-dhcp-duid.c:202 (/usr/src/debug/networkmanager/1.48.0/../NetworkManager-1.48.0/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c:202)
-| >>>               libnm-systemd-core.a.p/src_libsystemd-network_sd-dhcp-duid.c.o:(sd_dhcp_duid_set_uuid) in archive src/libnm-systemd-core/libnm-systemd-core.a
-| x86_64-yoe-linux-musl-clang: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1966]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c   | 2 ++
- .../src/libsystemd-network/sd-dhcp6-client.c                   | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-index e664a4a..7ba5020 100644
---- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-+++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-@@ -193,6 +193,7 @@ int sd_dhcp_duid_set_en(sd_dhcp_duid *duid) {
-         return 0;
- }
- 
-+#if 0
- int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
-         sd_id128_t machine_id;
-         int r;
-@@ -209,6 +210,7 @@ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
-         duid->size = offsetof(struct duid, uuid.uuid) + sizeof(machine_id);
-         return 0;
- }
-+#endif
- 
- int dhcp_duid_to_string_internal(uint16_t type, const void *data, size_t data_size, char **ret) {
-         _cleanup_free_ char *p = NULL, *x = NULL;
-diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-index 7c20116..08c1e96 100644
---- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-@@ -244,6 +244,7 @@ int sd_dhcp6_client_set_duid_en(sd_dhcp6_client *client) {
-         return 0;
- }
- 
-+#if 0
- int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
-         int r;
- 
-@@ -256,7 +257,7 @@ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
- 
-         return 0;
- }
--
-+#endif
- int sd_dhcp6_client_set_duid_raw(sd_dhcp6_client *client, uint16_t duid_type, const uint8_t *duid, size_t duid_len) {
-         int r;
- 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
index a9b9233b7e..9d2b1f2670 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
@@ -40,11 +40,10 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
-    file://0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "5dc188fdffcf2d23c89d34b1e6319a6b20203e12eaec24b30037b7ea8ac8c613"
+SRC_URI[sha256sum] = "fc03e7388a656cebc454c5d89481626122b1975d7c26babc64dc7e488faa66e3"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1


