Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB14AC3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 08:15:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45485.1746432939883378204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722095ce56=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5456Kdoq023990
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 May 2025 01:15:39 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjs7fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1x+osFLXaytYcV55VACwkU/HFRmUYZAo7p/2E4jITWo/TwnyAMlvJ/Ddr0mpC/Y8W23g0BtPDL2vusa+HttTnVxA0efass25CE60nE/gVbxzHYUBxq6+kVQ4LUVc9ogCv6w5xdOpjmcTcv/MZfnppWrfRyIEnY6pNAkK3gZgK4TcNFb88yzUCeYcqll9gJySh0uVWPJN1vK3OCh/zZyvJLY8Et/Jum4vrfi8aRe7oPTIC+xt5O4tvZdWNTbX6RTsXATCdFnqx6I1wK86f0GX9fcVr59ExKXZxnhQQf6WGjL48r9oj3u5W5Ax/aAReN6C35vf2DFyCUqd/9+Xp/NdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edxvR4gqWb6n4F5kUCGsW42yolxShgUJ2c9Aw27fs7Y=;
 b=canQNEDWfsQG87uZbKx8ac5kGV7ndOTGr4UDQiTFyaHxcUKwPNiNlLReKLjbZX62IfDo6XZW0h8nxnlSk+pl+902esQRhq0ffhCzTddYSbVt5xb8FvIF80huQh+z4KQZclmmNECrmau5PE8IOTy3ZV+ylVPwo2ezgk8n++ta1o9/wRcF2TU7Pq7HJ9mCMgXeeWoR31exs8tKuXmoxFOOfwp7t3CTUXeBS3KxRY5LEOCXggCPUMiKDVrMGcHHq98ONs1S5qkhXulzk6/+K5xivEQ0XSfsr4C6hWjUpmhEGclP8LG+n2iwYtQnms3VfWd4vvGFg1HFm+Ddg3CMiVY7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Mon, 5 May 2025 08:15:36 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 08:15:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nmap: add recipe for 7.92
Date: Mon,  5 May 2025 16:15:20 +0800
Message-Id: <20250505081520.4141686-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c93a95e-4f3b-49df-93bc-08dd8bad03a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?37dLGG5H36xT2UeE04OCw5PjZGpLAWhNHPstfuTZTz4LFVQyAL40OYeII8xC?=
 =?us-ascii?Q?exu4H32LWIFCbYhXTMfmHDswNoqaKH4ko8Ei6YJZAdLC2525WhgutdpLPZ5q?=
 =?us-ascii?Q?RtrSjkJE2Z64TDOxmrHjRtxrr+7uRkWuM/JZu9P25OOdEdMtqS40yiUqEdlM?=
 =?us-ascii?Q?PUDl42JCommuao2L7maxsG4Z+lB/t1R4+vWlMVGzzdCzALu+nFOh4nIdTn4f?=
 =?us-ascii?Q?OcNUREkV3DVA9PmQ8yxYu6gB1s6XzA/Bda8EI8g8nSacXIUJ9tfucQfI5U3P?=
 =?us-ascii?Q?VrEyuHPEe8/KhxQrDke2NZYP86r+w1otz/CVAWpX/jjMLIe+7oAyNi6d/h3R?=
 =?us-ascii?Q?T1EZQRlJm5rfPySgmDCezCqWOenJ5LlF3AEVER0YZe5wsoSye9bNPURigOzl?=
 =?us-ascii?Q?BtBYniydsALI6V+MeNSJ34cHnw2uSaNhFiN3DMHB/RSGJhjkMpVokWaibHti?=
 =?us-ascii?Q?mhrsro2PvAoKmqon+E/8hfmSvcA1L/j8IJeNTDHYLQtQf/8xpv72/Mln56v7?=
 =?us-ascii?Q?fYQbBNrF5NFY/5+JsdpBzU0IMrQBCRceKhfAjOPnNQ9YBgYh0w+A0Qg3oQOK?=
 =?us-ascii?Q?5s7+36tCASl2ursqIlQ5ZDHjrNvZAMzUoyqUQMb/8sgOWaz+rD1sV35O1EpS?=
 =?us-ascii?Q?tUHLGe7DGpK173OZEF13FFjBKpz8zz+QmdF1MIuRGY0q87HCW6+GCtjHl8nN?=
 =?us-ascii?Q?/SJNjJmCN0h1DBnwN6wtkng0kRAiP7dwiDKhsn2LyFvgq78oJC4Vf4fU2NLh?=
 =?us-ascii?Q?obgTEMp2d0S9QTmt3/mNY3qZpwIv+wFdDhoj789yNqm1kM3MbY1F9L+56hx7?=
 =?us-ascii?Q?xDFWCAPezrFKl+gwRMi6lv4rXLa7kS2+ilR3aDxFbg5OVWqoTXhFrU8wTaua?=
 =?us-ascii?Q?uzDTAfvigFnCtyzN6NVG1NBhWyacgLcAXJkXQbhhDG16lKpcksYv9WhhN7Th?=
 =?us-ascii?Q?OH2yeYPNShH9wol5mFruSmIiTaOOly39zRiY3Gwu5EusAb4GB7Q3M1nTL4iE?=
 =?us-ascii?Q?lKaJXG2Kn7r0KUk8vt6i1Al0ekP0+O8d+kgZOS0Jqo/ApVyFpLvUlHfZntHm?=
 =?us-ascii?Q?UOLjUxLcO5mJsaPx4EX9ZGuJWSqlTiEz37+1dGfKjzrhYV3PaiTjYCshNV/H?=
 =?us-ascii?Q?gphoNhMYIwivJiSsqSGaC+n9Da4uW8NzgP47VDK6Kqtg78CMoByGmOcQdxsp?=
 =?us-ascii?Q?rIZFcCp3+Dzu4Wsw6njXRT9Wpx3FoHPtzamSI/QSpPUsJuzMlXC2+xzo2eNZ?=
 =?us-ascii?Q?1iQvl6m1mqOnzPy9utqBqpBzp7FgK0SaAd5E0UH0jLeivI64VDgxgvHUHCNw?=
 =?us-ascii?Q?6Bwemvr1IQS+TXKqGWjs98oD3C6Jn/ZT84ta2X7x3HKGA97APrE9BPEKnTXz?=
 =?us-ascii?Q?4DhspfBThHEadq47tqn2RSbCySKZ/W9Edlr2SUudFgpvzTjtC5q4kjTk+Hxc?=
 =?us-ascii?Q?VzK52iMTTr0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3FGmTiGy7Ne3c6D/VOlUolgBHjyfp+3tBtrFudaxXeRuO2IHtjD2e03CphVb?=
 =?us-ascii?Q?4z6TplRevz4RdjVxbxForUbr3eE6lPoGuFEnKGvFIuTt1dDJQiAbJq6hnk71?=
 =?us-ascii?Q?xtZkeBCz/lzpGgpl5ab6sGxt+di23qxxowZz6WsW5zPS1C2MM2ucW3RZD1HM?=
 =?us-ascii?Q?4c2NPcVbpVYtZrYsqHpzjg6vt+j7Xx4k95mS2vwWLFzAEZc2F6BHYqCZl2+9?=
 =?us-ascii?Q?TA9ClqNsM5U70gTamLK9J0O8x3DMmr827Df+KmGFWBH/yFps8EqphqRK9h3H?=
 =?us-ascii?Q?9q4QRS/I9XBzC+WQ141SOVE5rnCYHrARVnY6OAtplgeBG701CROrVO7CTO76?=
 =?us-ascii?Q?kHVDvhdSB5FoC5YSFhxkN5jd8akGVUKMQFUhvZuMOJWCaAacyIK+zZ8VX1mI?=
 =?us-ascii?Q?Ylj9kTZH7cuvMxECagBqvZ+iGNkR4D2wO6VwcXpUuv19jEVDm+JWAXXHdY2t?=
 =?us-ascii?Q?o7ix0q++VkDyn7idlhSEqSPlaFqY2dD5lkXBclYS3UHf/lkz+K1fWI6g2LRj?=
 =?us-ascii?Q?xYUX9ew+pA3NetrmjGXXNbHIauPWreL1DjgquI7FIn4iIxKYBoR4xMGnerOH?=
 =?us-ascii?Q?65VV6JJRIewP/0nqbPVAvXvVmoaxjeWaDjMHnG6Ihk52Aml8h9tcxaCbnnb+?=
 =?us-ascii?Q?n4PnFLDvA3sz+VMQC9m3ACVxd/o68AOwYos5C9tk1O8AgAkS3h7V/T/cTEo9?=
 =?us-ascii?Q?k7R79IRase0+E5u9m8PVQZjWqJ5uXEvlLne1S2ylGD1qZ4clZXJtvpqnXl2I?=
 =?us-ascii?Q?ZwTvCn9XmyacnPBofmDenskU+bsoXzr0fOgOyQO8QOYVq87Wefut79Zf1CSB?=
 =?us-ascii?Q?1tX3rP1vCo+P7BI7WYhszidWzpVUH5v0NQt+JE1+RotzJ0QfwsReoVBYfPIe?=
 =?us-ascii?Q?pNORuRdgRkTUlP/H+8FrvHZjhJov5/8WctSZmxezXbDONXR9GRUYVq4qBjR2?=
 =?us-ascii?Q?q4oqL4kKKhU8qJUMi6Aj1VkKnTeqLNIjAYUhVCiWNPnbLTSx217GHa9I6C5T?=
 =?us-ascii?Q?6Lug2QC9qlPn2R2q24TsXGe3XuCv5lFArpee4GLwufLCYQtZnQd6mY/L7gKk?=
 =?us-ascii?Q?XiPlN3jGX4vEVu7k37jVC2Tpx5aTTDmJ2ceEIY09/tizoO5hyy9o7gk7GSHz?=
 =?us-ascii?Q?FYX6XmQruW1nttr55UllQxmGyF+HE1tYQKoW2Zeo4Pqni36kZDYwVRigHn1o?=
 =?us-ascii?Q?8krnyf/R9hlroNuDOQ8LUI37FjG35TqK+68V0UDSjuyrSOF/RPNLSxEk9WKz?=
 =?us-ascii?Q?IZIDq3G5ENopQJz0AAnTty00Q5dtu2mCHGlOshtt69mzVFS6K0x5I+WHSiCO?=
 =?us-ascii?Q?fUtBVLXvCFVde7mIRXdFbVGf0yev00Wx2HinHColPvJZx2j/fVLTLz1u8w9e?=
 =?us-ascii?Q?1i06m2HWtNxzXZmcrIyS0FwiN1vu7K+v0IWdY2dwc11weSER+A1UqAuggfaV?=
 =?us-ascii?Q?Dc7OII/dXTACSiUn9LqTC7p3+JHJtFm+ZlXSbjXClcwNi6o4WWWkhHNxQP4A?=
 =?us-ascii?Q?SygBYIj0nRNqPD4lWU8W+gbvwkhEWKH13wWVWBeaV49cy6rghZWzT5gXylNz?=
 =?us-ascii?Q?Y9UWbKfPMWACIseglxJwJoND2FSfF8TRXgfzF09S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c93a95e-4f3b-49df-93bc-08dd8bad03a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:15:36.6673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO8x41tPihBfDfRlVoqxGxqBA287l817CSWzRUCEbOeKUVN4tym0e2qfAlZ5QPEVeq8ujwB7auzJQTJtsQGUdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3NiBTYWx0ZWRfX8TrIvAjUesZb 4dyk0vNo2AgfjL3iiVkaCWC9QHuYUARq44TLI79OMKdSsOnmvFRizaIPccku2H4ZqzQg3cC0880 oQqT4whMr9LThQgHKo+eZjELumBGQEDExdlE6lZOyLzEHm1zZU4M9hSIDtRG2hASgMf6drXAXSn
 amsXUzUniaLiQGhCgSl9YxrBbN8qIL992Tw5FvpMo9CumVpuZ4xfHZuVl0pWeN4M4dVDA7IQrPa RzYiEYmWK+Izj0u4iYqQtydz5rK0SFWxB9E39CnmcmKeIHoDH9i98t/XHusBQSvGeBfASF93UYC XMFm+4xt00j5cPBhy5z9xcgFkefzqEvHwE2eAy15e67ZkSqQPFgwlKfadUdbvP/ptBTo9HkPyw/
 b5+Pc2o+1fXKeC0+AhxaXNW4tEriWEgfsQPPiti25wG4qdzTWMfmXQ33Y1KQU8Z06eZhhpEf
X-Proofpoint-ORIG-GUID: 7IIapLTiJetMR6Gba_nc7G6rDLqLNVMY
X-Proofpoint-GUID: 7IIapLTiJetMR6Gba_nc7G6rDLqLNVMY
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681873ab cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=auHYCxwYAAAA:8 a=07d9gI8wAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=obsBQ3oSHwMSdR7eR6cA:9 a=sqfIHldIKiMA:10 a=67XU6oJk2Lrwzah0vfu5:22 a=e2CUPOnPG4QKp8I52DXD:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505050076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117299

The nmap has changed its license to NPSL (Nmap Public Source License)
since 7.90[1][2]. See [3] for a discussion of this license.

According to [1] and [4], 7.92 is the last dual-licensed (GPL-2.0 and
NPSL)version:
"Note that some releases of Nmap may fall under a previous version of
this license, or a different license entirely. The exact terms for a
given version of Nmap can be found in the included LICENSE or COPYING
file. To ease the transition to the NPSL, the first three Nmap releases
made under that license (Nmap 7.90, 7.91, and 7.92) may also be used
under the previous Nmap license terms by anyone who prefers those. "

Add 7.92 recipe with GPLv2 license.

[1] https://nmap.org/npsl/
[2] https://lwn.net/Articles/842436/
[3] https://github.com/nmap/nmap/issues/2199
[4] https://nmap.org/changelog.html#7.92

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...efine-the-python-library-install-dir.patch | 31 ++++++++
 ...l-mkdir-with-coreutils-mkdir-command.patch | 38 +++++++++
 ...e.h-header-to-pass-clang-compilation.patch | 76 ++++++++++++++++++
 .../0004-Fix-building-with-libc.patch         | 79 +++++++++++++++++++
 ...ing-between-build-ncat-and-build-lua.patch | 55 +++++++++++++
 .../0006-Fix-build-with-libpcap-1.10.5.patch  | 47 +++++++++++
 meta-oe/recipes-security/nmap/nmap_7.92.bb    | 66 ++++++++++++++++
 7 files changed, 392 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap_7.92.bb

diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
new file mode 100644
index 0000000000..6298f7ea26
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
@@ -0,0 +1,31 @@
+From 67b4614ea529460dca9326bfe5d355bad6f9bdee Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Sun, 27 Apr 2025 16:33:08 +0800
+Subject: [PATCH] redefine the python library install dir
+
+If install-lib is not defined, it is always /usr/lib/, but it
+maybe /usr/lib64 for multilib
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ccfceda..6b25d27 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -387,7 +387,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock build-netutil $(NPINGD
+ 	@cd $(NPINGDIR) && $(MAKE)
+ 
+ install-ndiff:
+-	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
++	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
+ 
+ NSE_FILES = scripts/script.db scripts/*.nse
+ NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
new file mode 100644
index 0000000000..f81e230b28
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
@@ -0,0 +1,38 @@
+From 783333de42b06020f5c0852c415cd34972a773fb Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Sun, 27 Apr 2025 16:35:11 +0800
+Subject: [PATCH] replace "./shtool mkdir" with coreutils mkdir command
+
+"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in
+today most release has supportted the -p parameter, not need to use
+shtool, and it can not fix the race if two process are running mkdir to
+create same dir
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ ncat/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ncat/Makefile.in b/ncat/Makefile.in
+index 4632a78..11a5e7c 100644
+--- a/ncat/Makefile.in
++++ b/ncat/Makefile.in
+@@ -166,11 +166,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
+ 
+ install: $(TARGET)
+ 	@echo Installing Ncat;
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
+ 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
+ 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
+ 	if [ -n "$(DATAFILES)" ]; then \
+-		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
++		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
+ 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
+ 	fi
+ 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
new file mode 100644
index 0000000000..b940124f98
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
@@ -0,0 +1,76 @@
+From e9d876bedc8a7bc96856ecf38bbeeafee2d5b206 Mon Sep 17 00:00:00 2001
+From: Peiran Hong <peiran.hong@windriver.com>
+Date: Fri, 20 Sep 2019 15:02:45 -0400
+Subject: [PATCH] Include time.h header to pass clang compilation
+
+Upstream-Status: Pending
+
+Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
+---
+ nmap_error.cc       | 11 +----------
+ nping/EchoServer.cc |  1 +
+ osscan2.cc          |  1 +
+ service_scan.cc     |  1 +
+ 4 files changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/nmap_error.cc b/nmap_error.cc
+index 5ec938f..83ba6cc 100644
+--- a/nmap_error.cc
++++ b/nmap_error.cc
+@@ -67,16 +67,7 @@
+ #include "xml.h"
+ 
+ #include <errno.h>
+-#if TIME_WITH_SYS_TIME
+-# include <sys/time.h>
+-# include <time.h>
+-#else
+-# if HAVE_SYS_TIME_H
+-#  include <sys/time.h>
+-# else
+-#  include <time.h>
+-# endif
+-#endif
++#include <time.h>
+ 
+ extern NmapOps o;
+ 
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index dea2851..c80efb4 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -69,6 +69,7 @@
+ #include "NpingOps.h"
+ #include "ProbeMode.h"
+ #include <signal.h>
++#include <time.h>
+ 
+ extern NpingOps o;
+ extern EchoServer es;
+diff --git a/osscan2.cc b/osscan2.cc
+index efe6da0..392c65f 100644
+--- a/osscan2.cc
++++ b/osscan2.cc
+@@ -80,6 +80,7 @@
+ 
+ #include <list>
+ #include <math.h>
++#include <time.h>
+ 
+ extern NmapOps o;
+ #ifdef WIN32
+diff --git a/service_scan.cc b/service_scan.cc
+index 66e0d92..161f2a1 100644
+--- a/service_scan.cc
++++ b/service_scan.cc
+@@ -77,6 +77,7 @@
+ #include "nmap_tty.h"
+ 
+ #include <errno.h>
++#include <time.h>
+ 
+ #if HAVE_OPENSSL
+ /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
new file mode 100644
index 0000000000..295abe6d50
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
@@ -0,0 +1,79 @@
+From 4c54b00e6f3749924532c2636eae01daff9e4bcd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 23:11:56 -0800
+Subject: [PATCH] Fix building with libc++
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nping/EchoServer.cc | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index c80efb4..914bd54 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -214,14 +214,14 @@ int EchoServer::nep_listen_socket(){
+         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
+     #endif
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr6.sin6_addr = in6addr_any;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+-            }else{ 
++            }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+             }
+         }
+@@ -252,12 +252,12 @@ int EchoServer::nep_listen_socket(){
+ #endif
+ 
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr4.sin_addr.s_addr=INADDR_ANY;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+             }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+@@ -493,7 +493,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                             nping_print(DBG_3, ";");
+                             /* The payload magic may affect the score only between
+                              * zero and 4 bytes. This is done to prevent long
+-                             * common strings like "GET / HTTP/1.1\r\n" 
++                             * common strings like "GET / HTTP/1.1\r\n"
+                              * increasing the score a lot and cause problems for
+                              * the matching logic. */
+                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
+@@ -503,7 +503,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                     default:
+                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
+                     break;
+-                }           
++                }
+             } /* End of field specifiers loop */
+ 
+             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
+@@ -582,7 +582,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
+                 }else{
+                     if( (tcplen=tcp.validate())==OP_FAILURE){
+                         return CLIENT_NOT_FOUND;
+-                    }else{                        
++                    }else{
+                         if( (int)pktlen > (iplen+tcplen) ){
+                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
+                                payload_included=true;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
new file mode 100644
index 0000000000..f660719640
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
@@ -0,0 +1,55 @@
+From c1b436da46a7e3089b657f3f92308defc0ebb735 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 9 Feb 2025 00:45:36 +0000
+Subject: [PATCH] fix racing between build-ncat and build-lua
+
+There are two build-lua rules, one in Makefile.in, another in
+ncat/Makefile.in which is required by build-ncat
+
+Build them may cause potential racing
+
+$ bitbake lib32-nmap
+$ grep -e "Compiling liblua" -e 'nmap-7.95/liblua' -e ": error" -n patch-to/temp/log.do_compile
+Compiling liblua
+make[1]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/recipe-sysroot-native/usr/bin/i686-wrsmllib32-linux/../../libexec/i686-wrsmllib32-linux/gcc/i686-wrsmllib32-linux/14.2.0/ld: ./../liblua/liblua.a: error adding symbols: no more archived files
+collect2: error: ld returned 1 exit status
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+
+Explicitly make build-ncat depends on build-lua to avoid racing,
+after applying the patch
+...
+Compiling liblua
+make[1]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+...
+
+Upstream-Status: Submitted [https://github.com/nmap/nmap/pull/3025]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6b25d27..b0a2719 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -159,7 +159,7 @@ build-netutil: libnetutil/Makefile
+ 	@echo Compiling libnetutil;
+ 	cd libnetutil && $(MAKE)
+ 
+-build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock $(NCATDIR)/ncat.h @PCAP_BUILD@
++build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock build-lua $(NCATDIR)/ncat.h @PCAP_BUILD@
+ 	cd $(NCATDIR) && $(MAKE)
+ 
+ build-lua: $(LIBLUADIR)/Makefile
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
new file mode 100644
index 0000000000..4ee4a7295e
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
@@ -0,0 +1,47 @@
+From ba7b4a8cc570f0ce154f186fbe840f0ac23b2b96 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 28 Apr 2025 10:04:46 +0800
+Subject: [PATCH] Fix build with libpcap 1.10.5
+
+Fixes:
+In file included from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap/pcap.h:130,
+                 from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap.h:43,
+                 from tcpip.h:72,
+                 from nse_nsock.cc:4:
+nse_nsock.cc:36:3: error: expected identifier before 'int'
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |   ^~~~~~~~~~~
+nse_nsock.cc:36:3: error: expected '}' before 'int'
+nse_nsock.cc:33:6: note: to match this '{'
+   33 | enum {
+      |      ^
+nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |               ^
+nse_nsock.cc:40:1: error: expected declaration before '}' token
+   40 | };
+      | ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ nse_nsock.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nse_nsock.cc b/nse_nsock.cc
+index 75ddeb6..a3c5186 100644
+--- a/nse_nsock.cc
++++ b/nse_nsock.cc
+@@ -29,6 +29,8 @@
+ 
+ #define DEFAULT_TIMEOUT 30000
+ 
++#undef PCAP_SOCKET
++
+ /* Upvalues for library variables */
+ enum {
+   NSOCK_POOL = lua_upvalueindex(1),
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.92.bb b/meta-oe/recipes-security/nmap/nmap_7.92.bb
new file mode 100644
index 0000000000..98969fe001
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap_7.92.bb
@@ -0,0 +1,66 @@
+SUMMARY = "network auditing tool"
+DESCRIPTION = "Nmap (Network Mapper) is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
+SECTION = "security"
+LICENSE = "GPL-2.0-only"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8823a06822788010eae05b4f5e921b3"
+
+SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
+           file://0001-redefine-the-python-library-install-dir.patch \
+           file://0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch \
+           file://0003-Include-time.h-header-to-pass-clang-compilation.patch \
+           file://0004-Fix-building-with-libc.patch \
+           file://0005-fix-racing-between-build-ncat-and-build-lua.patch \
+           file://0006-Fix-build-with-libpcap-1.10.5.patch \
+           "
+SRC_URI[sha256sum] = "a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1" 
+
+UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit autotools-brokensep pkgconfig python3native
+
+PACKAGECONFIG ?= "pcre ncat nping pcap"
+
+PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
+PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
+PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
+PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
+PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
+
+# disable/enable packages
+PACKAGECONFIG[nping] = ",--without-nping,"
+PACKAGECONFIG[ncat] = ",--without-ncat,"
+PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3 python3-setuptools-native"
+PACKAGECONFIG[update] = ",--without-nmap-update,"
+
+EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
+
+# zenmap needs python-pygtk which has been removed
+# it also only works with python2
+# disable for now until py3 is supported
+EXTRA_OECONF += "--without-zenmap"
+
+export PYTHON_SITEPACKAGES_DIR
+
+do_configure() {
+    autoconf
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+    oe_runconf
+}
+
+do_install:append() {
+    for f in ndiff uninstall_ndiff; do
+        if [ -f ${D}${bindir}/$f ]; then
+            sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$f
+        fi
+    done
+}
+
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
+
+RDEPENDS:${PN} += " \
+    python3-difflib \
+    python3-asyncio \
+    python3-xml \
+"
-- 
2.34.1


