Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B95E7718F
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 23:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24812.1735774293236175089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 15:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30963dfe0d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501NU3ui005852
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jan 2025 15:31:32 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq3bcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 15:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7YEtg9Jt+7dfzmDEeLPgbEUN2XhRF4r8NmAl8gEaKSRam6uzZTtVsLYmmBvUqZv7U7oAj/WxNmc4IwfcFjYUbA6UbqdUbKIjIuwpLsRTAveMooNGagOcPtqM0HuFxx1DNCktgK4Tfipis7QsQjKsp2Ju7QZrXwVyBYHi1X4+vKixkbbW8jJHyUllqim9CaTGAIwyG6G9Ue7t1Jm/IbLiBqwV7rJOFjDbjRR+SHRBKRyrwRguF/92O6fThMnl4vLW2Awekka152w7n1LKPV2BPii5/0WmUGGyBVbtsNidZpiJBUDyLjCmHK8SOyaSrkcRaGiNbDJvu8e6GwkzhbiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njtViCJvQR/bPAKxFq6Q/9sfoBOeFZ0NV2JnsHs4zjg=;
 b=IhzHnu37Ra28AGqdR2Y1vgfW2jCtK++si2Ck0AaKEyK8zEixyWaXE0LIOSn9Y903D914cHYJsbEB+gIoOWa18pwI4/joPgs413HYnXBoaN/z06G905P2SFjuJzIWhZjwET3xWMW/eUfSk53ypX39OR936pXleY3X4K78yMRwZz6VFJ70iz+K6zqCiB2DPw5OxeU0zSIw/fdLBb1MwkJ2Pot97xfPVszG9LyisX1rCRFcIz6ZpOXn+JcrgJbiultIhryRb5HKJZOLvI432t5oBHAu1UVw7BGCTXZu9SlOqeIb0MCLrN9gynompKDJ4dSeBB8tvnc9XeTlWfRNZL+sdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Wed, 1 Jan
 2025 23:31:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 23:31:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] frr: upgrade 10.2 -> 10.2.1
Date: Thu,  2 Jan 2025 07:31:11 +0800
Message-Id: <20250101233112.2219927-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc3f417-e335-4a8e-7812-08dd2abc68c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wfmbI8vxjO0F7yv0y8IcBr/SbbLFIQxmmHaOJKlt7DdlTFclCoWHioGb95c/?=
 =?us-ascii?Q?wWiHpvROQizU4Ye0r+SsZgM4q3CPQZ+gygHO08+vsjY7JRPCN4QaUnCSO/rp?=
 =?us-ascii?Q?mWexDNj4TDngMGFy74teMxexkHwyvcGJ2OU2ADhml9rs9iBQ8ogZ4/XqT/1E?=
 =?us-ascii?Q?owArepfaTBMReahEqubERXkinQZY7SHRQniIro4zNxG07xGemT9usxRevnPc?=
 =?us-ascii?Q?z8rc3+t6b5oM/9MANFL32QQbHjrC5c3ITSUadYo8wIQV4jaFbroLc4PRJC/C?=
 =?us-ascii?Q?c3cSS/0+FLRgzraq0ue/pd8hma8QnSehrArFnGRHe3YVzmHoBevEab2j+8yg?=
 =?us-ascii?Q?akh+nQrbdeyqEeOIGmMbWFAQxLf/N0V9Es5uRvW21mYLGiGR795D++qasuRQ?=
 =?us-ascii?Q?ssFrFMNtdhocN468INCCWtBMkNP09Fdzous52r/4g9lkEOSg3Mt89+IWA76e?=
 =?us-ascii?Q?EkEtaVbSRrbisSEqHHSs7nphN4hmKtduBwh4EWVE0GsNoRSQtIM9tXsVv5Y1?=
 =?us-ascii?Q?phz4rM6x0IY9QImeyJc9PYbUwBdXP2mx7bSO3cath/+iRp5eDhzorrVm41qp?=
 =?us-ascii?Q?yGtgIsj9+NWr3KZY/VMBWzpi6q0kOaglq2gb+e5fdyGBvrgaSBnfpR3GS6l4?=
 =?us-ascii?Q?h9y9Q0bz3Fm893uugBMhtgukNXu4dxXNAQlR8aWvsUHJ5KygJqtpWMIoidEU?=
 =?us-ascii?Q?UOkP9pKrmdGhLQ6KCVw6Gi81t7vvHv4Tls7mNHIISfYVxVkstsOwwOSFlIm/?=
 =?us-ascii?Q?zLEqxWmhCA5ZWgOsoPuEkYgRzFDZ6eTA5AyWizSp3Vn1IrUj/edcWYdrglPm?=
 =?us-ascii?Q?SRiIJolfcXqOeAo3ykRc2hL/nvw9bVnG2CURbPQvLU6uFtXE3zFO41gSqOdU?=
 =?us-ascii?Q?ftLoVAXcWdI6bzycme9x3bovqm0bSc0x0Zp9KjUTgxzJRGxH4JnNU4+Minj2?=
 =?us-ascii?Q?2/ZduAyM2qTm5lwxrg/J1ETgdZbbbeGXMgP1sOTP38XPZMVNOdxnLWgkW8Dc?=
 =?us-ascii?Q?0iQ/ze1NgCNZkLHlocmJrl15vZ1/xa4ThP7XfqZFQGj2Vs1c+vjtZ0pLm2QL?=
 =?us-ascii?Q?eM1cHYBJoXlA6DrzXalXzbsb+sSBpOH+di0p3qmhn7vHNZI/H6SZF9zPrOIo?=
 =?us-ascii?Q?2P04KV80PtJWveKiyAuIzZ2Z+f1amym7B3C2ViTd+xVVcCUCfAGt+hyCxQnT?=
 =?us-ascii?Q?BtzDn8y/DcJHeWdh36FlFiRj7HHgBcQ9JnJYEtDeDwwq/t8r9u4Rh/rIVM4D?=
 =?us-ascii?Q?EVqdqVv9UUicAVzjDXII6U54D6JVKQl2Ah6K7ZDHZaRxck7FnvgL9HjZggVN?=
 =?us-ascii?Q?rxaOWIDtzD49EyvW5vnO5ppeWWpnen5M4YoiCWtAbVPTS+AZw4ZD5+lRpE55?=
 =?us-ascii?Q?zv9tUu+A+9c5hdgL/bIQsY+l1hjFUP2eDvHD0oGggVfGkr1eBUGlLNp87yNL?=
 =?us-ascii?Q?ZRVGsgrg9gohVLjFR6zkASBR0mPnwFO1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EUZW6+vkx/3PL/aaNTmRd3Nn18kZ/uIk59TOdgN+c0MVWLOPZFrj/hCe4OqE?=
 =?us-ascii?Q?EQh5S7JUN7BkykmcByy3xlGYCW0vj10KwqfxErk9P3gT/KPrtR5TxSJjMr6O?=
 =?us-ascii?Q?OnqMV7h2Pg3Qo7dt3KB2eOA2n4VcPb4mZ/s/Wf7cv9O9rqHmOYj0oj3/+Ani?=
 =?us-ascii?Q?n7CgbJdBIZMGWtDC3ztpqW5gleW5IXlV1bDLBMmWUp++Ma9GTaO9fDtaRyUv?=
 =?us-ascii?Q?zOI2LhWYsBWbzRI0YJOXRmDGbJ86N2UByNDWqIF4umhBQehEiJ3z5fFUliVG?=
 =?us-ascii?Q?UVu5GnbdTRZ4DTNZ78m0WVSmKBl9mD04DOhJbfDzWhv6nVrj4OhqBfuoFZkl?=
 =?us-ascii?Q?ebsvRaSusdfnOAKk0hjGj6aJC8R3WvU7eIFaPN+WSz8DYLanrczUN/1UvE2L?=
 =?us-ascii?Q?riKWk91T/NbeZfoccJiH+AhHPSXz+bUx24ideaFzHmAoqIuBq8x6SdhAuLOP?=
 =?us-ascii?Q?W+06PlzFdYF7n0XfILnjYmX6saa0ZsEo++zE2ebF8JuaxYRvW6lwIemsVInZ?=
 =?us-ascii?Q?Rim3KPV0NE1uj+DhsGVUiaimJUiglx7Y5TVet+aouMSfpPclQARN6FK6QjQh?=
 =?us-ascii?Q?+jF4teo587nZWsWDcFq/IEOa5ER+BTV+ASA6C72qPwlsMoDQale5cVCliHUb?=
 =?us-ascii?Q?QnYiNJE5XxWEOxP0LdbcsixWTddkCdJ0qUt1YsOgBSfqglj3ARAGr9ieVv/L?=
 =?us-ascii?Q?jjQyQ5VjIQDidRRONNg/GFCAsvmbBQTJAHzhoybPY+nUqiExB471IVeEJ9oX?=
 =?us-ascii?Q?q08V/JxzoJnWLZbrzLNcN1Gp5cFoNGmHONU/xW9IYEQQx7dLgjrzR78PCZL3?=
 =?us-ascii?Q?8c9iMyRNus7E9AqZue5bO0MScmlk3GFbnZGolQCq6bER0iTjnv2pBVM2MUYQ?=
 =?us-ascii?Q?w4XxxvntfnYoHqM4yfJCPxkRQcynr6Ue7WnfbfK2FdYip0K9Jo0xBzNAVaar?=
 =?us-ascii?Q?iVRFtqJItEewg1q3+zjSSyOjcPwLoAM5Bu+BA3WCsGHPSPLEn6seKmFcqe1y?=
 =?us-ascii?Q?u2EfJS5HEk9AXsxCj98+zwuj0cU65ABhKwX6/PFpOpnwGOrUz6Ro9AnQ4lKG?=
 =?us-ascii?Q?ToP7d/PMgD38NT3nqsKw7SCpeDOL2ir1m4gvaKoMy05oF7CFM132s/mjp0i6?=
 =?us-ascii?Q?N12uAUKa4KV1xp/l/WoliHnvobihsMCIQUCwjnv6yZmY6NfqXHNvpf3E9WUa?=
 =?us-ascii?Q?lg8+Yvg/KsenvO73bIdFLHDeaNy/5BI3gAKc0YGZN5o+YYkJl95wff7lzFpi?=
 =?us-ascii?Q?8aiQGIIdzNok8Cl3s5uer7RdseQ18fcJ8+zvaj7jLapeuIFYBX+bI3Gjuhnm?=
 =?us-ascii?Q?FkE3qEKbZAgoTp8+Kwo1+9D5I7xVDdPun7WTA++ZY4KayisE586DTzwZ8lEG?=
 =?us-ascii?Q?TgZYOvieRmEgWgCdjWxhppPJAWWVN7jBIZtQmgaIi0UEtVMlTtpiVDzL266O?=
 =?us-ascii?Q?B+BwDjgsFsMHro0Dp9STm+YTfkQe7hXxzl9w0fqnflQpKVFPHdl+6koJXM3h?=
 =?us-ascii?Q?SB2EwjdLUgUzMTRNet+DxPD1IKon5kjzqssqxBl34nsEo4+bzQt1+hNVXkDC?=
 =?us-ascii?Q?noe9daKWeUkKjXTgZOUrwl/AFaa/yc1MDxdI8eAf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc3f417-e335-4a8e-7812-08dd2abc68c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2025 23:31:25.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5EKQeWmT6X7RWOGQqlqirupLRxxDHDvw8EKdLwgrQyT3GXeBESHkTKXzpfu2H/cgV6DHdqoarZ76G6AveYFXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6775d054 cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=tWN7FjWbCjdojg0kz0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: s2-6oXjyzcrsiTmK6tz2ukQTJlJksHMM
X-Proofpoint-ORIG-GUID: s2-6oXjyzcrsiTmK6tz2ukQTJlJksHMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-01_10,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501010210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114610

ChangeLog:
https://github.com/FRRouting/frr/commit/5f0beaa0fdd00b7a60c1765067d1b6fa65ce96c0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_10.2.bb => frr_10.2.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.2.bb => frr_10.2.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.2.bb b/meta-networking/recipes-protocols/frr/frr_10.2.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.2.bb
rename to meta-networking/recipes-protocols/frr/frr_10.2.1.bb
index 06d604168e..e6b35f6d75 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.2.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.2
            file://frr.pam \
            "
 
-SRCREV = "22746b8d59e6e6cb77ced61bc9e0cff2ead227b5"
+SRCREV = "5f0beaa0fdd00b7a60c1765067d1b6fa65ce96c0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.25.1


