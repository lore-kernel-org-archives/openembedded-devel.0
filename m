Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C0D41C0B
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 06:49:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6003.1731480552428285751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 22:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1047842519=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD4W2XR004596
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 22:49:12 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpmhn27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 22:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5PIDvWIp61ozbmunuNReVybnM6tv/DBpjNkzitlhG0eR6qHQuMxg7tg6sW9kPkKobwor1RgVscBIYHI230/9FC7oRK2B5ihCd7IXLScDkwOdCj64qjKbtzim40WlOU3a5c0hBSUcVuoPpM2YO/gV58cPU/W+c2mABbzCk/NXF7hLv8SEhQPCg47wEg7HhKspbcxvmv3bbuvyRxMWykObgmz+9M+5nYDzB8uX0LUEnu4U/h/ynSb0UTcBo50UXrB5+xLpDox/idxVQdB/EDFg9o4BqvQuGu4tbTT1NrobQDwTsZIo45iUbeOjOOltPV5c9pABGZS5llFb1bRbSVW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPj8RoBjKd4pK+5ktdAf6HqkrzvrtIu2tKb9pO8osk0=;
 b=TzO0X2LEYnwSVLuguk0htTXLgXJMoqq066/FBkv1cK8t/wGvJ+OShJ3j6cig3x+bbfsCBkM+Ow853RKGORBCX1cwiLdqoc+QJEvgvIdm65XkSwaIy9CuLpxzMFUMaEA99QfktFJMwbyFj8yt1HNUUpFesHiAcxiP388YX+wYkebkPqhz847tC5XXFoqLw6wj36/vLCWZv5jwe2xzqKGYxvxggp7wIKsRN1+u2YtMwhM3XDBOck2sSZ79fxegKoQpyddHI6coVqROn7iG+v74iGDgOGkWUE5koXJUXS6q/8ytiI2Luoa1K6vs7vYIDh5h0KxPpiDIUVaTpEGRzU2o8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 06:49:07 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 06:49:06 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] openvpn: upgrade 2.5.6 -> 2.5.11
Date: Wed, 13 Nov 2024 14:48:51 +0800
Message-Id: <20241113064851.363960-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ade748-ecaf-485a-2b69-08dd03af449a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yZxz64BUXTOhyoJ/TBKCQAA3CkxzZHYkoRpqS0dvoFDjlbwpz9DWrZcp0BS4?=
 =?us-ascii?Q?oP/PETEZCegpDFlHYdlVJDrVxxvkO2qGCJt91rW2kxgva3wBtkX4FBWbE/KN?=
 =?us-ascii?Q?9kizfDSpPrPxb0wOS9GFENUJtTowXHFKaM5+sWHEIkIG5o+djaWeuY7YPips?=
 =?us-ascii?Q?GAGijBAGo10Brb+UzsMNvwBbkX/n+y2lDQKxnfZIpqDEddAgZNL9TY6AkPna?=
 =?us-ascii?Q?QP3dR56NwWgFZPpYEpd6muLte6GtZ24AatqZosK6iKsG2bSrRsNIUOMnZ0oj?=
 =?us-ascii?Q?xo8VMtkBZ07kBwOw3SMtzNBpecNN5Jj+84fjlRtOh7mpwqPBysYEO657mjUe?=
 =?us-ascii?Q?zeV4+V33/ua6ljT7ZQI5P8X/IJnD0zMeSqNd98sIXcyqEwGV5Fmkv0EbzHWJ?=
 =?us-ascii?Q?SLpl93MG0xCzqRbcj5dR5fWXJlzY21PmpiTJH58RwKeErs8icofKjhtR7/nj?=
 =?us-ascii?Q?vEfG/CaUEsvhBpw2+/H1mvReXPMfxhwMnxVQwDAdywmzWFHDzpq68A47LcIg?=
 =?us-ascii?Q?b/KNzwrUqbQsNgZUyKBgSpgpBaoQrPgQPrgermTrv0joeCReh733/MDS3FXx?=
 =?us-ascii?Q?XNOzx+Nzl52tOX9+j0OmVoYGmiKzVfHbtOirgGDxX1r3PtrF5Q+dcssNAYSo?=
 =?us-ascii?Q?6rUDgIraWvCkoa/B88lD9wmh2DUnMV/xK9XqUos5geLTE4tIjq4H0UmxLA7h?=
 =?us-ascii?Q?RXyKHVXUpX3p9k2IrSvI7OnYZ30Wc+hHJNYsOK+4NCKs46zJM0zfwSuQw7cI?=
 =?us-ascii?Q?BeVWJRlgj1qOUqxv6RzmoySbppYujSSW+bPZ9aMhpdPsmxB1zRSqqJzmZvM8?=
 =?us-ascii?Q?p9X0g1hvsYls46JwbbGXM07qxrtzuBUB9WNikvqjwY58nq6tji3Wb1fHa2XJ?=
 =?us-ascii?Q?aNC5yZf7JcJDQK4fkJzvWsIDPjCikW+kYvgqcq0tm+HMKTa13g6Cnnjgr5zw?=
 =?us-ascii?Q?Ac/R/D/b/54FMZgI31Vgu9w1TEfEJOxadZ8R2MQC6JppgWMhxNQ5nSQZdd26?=
 =?us-ascii?Q?3M90zqSLcI1tMP9GuLmJ/5VUHrBvs7lnqtklPJiDc0n3m6QMti8MwycyFBfc?=
 =?us-ascii?Q?rbMB2wC3GHvn49oW/FVrdpPRHJd7XiBEC3UcwpBgczPwKyWmcJELOEFYSXvR?=
 =?us-ascii?Q?CVMWaTWFjktoyh4E1SZPPXwbDG3dNSLM9kf84RndYuT9eTmOATWTJz4dFYPb?=
 =?us-ascii?Q?ljwkwwpZ83dv9Gx3uwG359CYt1dsDYm4PIZA6cmSGqelRo1jVNARaJH/Rl+t?=
 =?us-ascii?Q?WDzL+ofga46IXeSxthHmQAqgdsWtJFCsn9OjNiYLm2cE2MZJFgSv6lz3QPuw?=
 =?us-ascii?Q?f9j/9TEVjVOgqa5zcpQP1kRC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/cX2LRjxJJYfFWrRDVoZZb+hUqIGZXkgHfVS4co2vp66gnBzYfTHPcK7sMDM?=
 =?us-ascii?Q?DBptLmR76aFe05g4yEnSQ8xA609C+6BxcTB9VvUO9acY+PY/6L4wXRPvobqI?=
 =?us-ascii?Q?0AuHslqHv23tZg/+aGNtEr5/0VkYr4+SYqHQt2bj3dZPTGcyeO1kWrRa//uA?=
 =?us-ascii?Q?bu6ub+UwVK6kaRzGK0r7LvTQWaJpSjZHKg8R4OBjwP4Igh/S0/aKfIF6Axzk?=
 =?us-ascii?Q?kchU3v0uQHtISp+bJEEtg1e01CJzZc7DDLo1fyJWQJYfRy8jyD1YXEJSDLCE?=
 =?us-ascii?Q?dsZiWy6TTLCXNC4+SWUdoMIMsSr01ww9hvgnbECriXgB8v7epSBs/DB4uPzK?=
 =?us-ascii?Q?ftdIof0/r8EmIBFLpj3T0CmdyXERS3NfP2kIBgkWFBQLgrHuOQjlSZT9vDiw?=
 =?us-ascii?Q?q2opzoL6oxqClrQD273RFf+9i7xE0wMZn/ID9FJfsc7BB0Cix1PLz8JNfkj9?=
 =?us-ascii?Q?ApFpm1Q9idVoiP3p2AJPx7wSDLmXHFcHNPXNju5WseosSDd4WVCIYmNqi+OC?=
 =?us-ascii?Q?q2Fzv/OGV+bZm8HdBQCH2mFVuViWBI2Bxt3x0pgGKHFi5zLTGkZqprRrKqMA?=
 =?us-ascii?Q?pqeG49xk5Jvm9zBd42LdcrYNd7rJbvd2rBaa5o6uwrDHE1xdqaNU4JgZsbIG?=
 =?us-ascii?Q?6kPOYh3KKWgN5p511FaNPE9ac92hv5zMVgULrtJ2+Ud3JvFEeiLr5A/uS4Tv?=
 =?us-ascii?Q?vlFL4YEJsa0dfED9jUdzeQKC9BT/D66SvLuyjI0SdSVsFwIslJhyWphyu9Lk?=
 =?us-ascii?Q?lU0xfa+NCG12eXsqYBYGHygDIRkhurCX1dAT0LmXSlU37DAs4cDOrS9M+XNg?=
 =?us-ascii?Q?lTBV83UHO1nKgmg4rSTxu1tFCE37QlHSfWH/2/xQKtopabMlJ1HFQGhjXazT?=
 =?us-ascii?Q?Pms2uMMcaTBPcMwJVaSiM7NtSCZmd1CJdgIahT5ulIhtoEc913SLR4F7Ed5b?=
 =?us-ascii?Q?SJEgyGDBLEhFI9LHdhjTaW6hIsM5o343CrVSS2NsAihuvfOeOlzmAS4O2+QR?=
 =?us-ascii?Q?zbfWGRuNf+ZELc4oCTXjVWZMQrRg0RTaS01HG4XrLSYwUsJhPURrsTTN0AS1?=
 =?us-ascii?Q?ZR/hRJHRiBmM+E4DzcIafAPsCdXg3BxoTUzAq9EBG8Z7Qu+rVxXZh7RoncjZ?=
 =?us-ascii?Q?MPZVDw6x+K8jOmC1E2zN6dOadH47IlTLyCYPM1oP1cZTJpY6RfsbNzENnxfB?=
 =?us-ascii?Q?4x0oxi0YBB5HlzU3m+8bQG8v0/ktDiNZlW4D46KXkoZMwm48bfuV63kxXAo8?=
 =?us-ascii?Q?GB6BBs57YQzfuUclGcEuCArktEYrzuPh+IKiMGUgzBzogjX59gi3xgPD8gSu?=
 =?us-ascii?Q?l/X4x5msQ/ldF49YUmSNF1ahka3SiYpA6mN+rv3nk6se97rWvlzMLLovN+KZ?=
 =?us-ascii?Q?Mw35wb7EMLsq0LqK029QQVUwNZ3rYVbPgINjjx1D47bb+c0ycuz8CCAtGB55?=
 =?us-ascii?Q?ncGIavzD8ce1QBPqEuU+SRnQsCNo/75U4ucAiU3zXLfbLsomIWS29OrA4Grr?=
 =?us-ascii?Q?HdkjqyPQ59DVH52DrsVoJNYb+rHfikXLEjIuv/1VPQeLw9jsUNyKognlc6at?=
 =?us-ascii?Q?mXGd/Mb1U7QRm3NMTDFNTADDce4RucuN2s3KD/N0+PT5WIicw574edPkd8T7?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ade748-ecaf-485a-2b69-08dd03af449a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 06:49:06.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUgtoXlDwUKpxMrMGMkZkCv/aoeADPGWvgHkHa88vOkHpALnQ0Qdh3myQeHDjr6xiqh7+/ZWZn+Xbg9adcH3VxlzjqUnrdmN5vQ+1t2+4+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
X-Proofpoint-GUID: TStTyoK4ya3jZ06HfuIFMB1PLP9DVu2-
X-Authority-Analysis: v=2.4 cv=ZdlPNdVA c=1 sm=1 tr=0 ts=67344be7 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yU_jQ1hFIRIA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=yMhMjlubAAAA:8 a=uDo-SIiEAAAA:8 a=Vt2AcnKqAAAA:8 a=FP58Ms26AAAA:8 a=9dNbsytUAAAA:8 a=neW7uqNyAoFAEOfBOKMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=gPpeecpFUKP6j8iU7U-x:22
X-Proofpoint-ORIG-GUID: TStTyoK4ya3jZ06HfuIFMB1PLP9DVu2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 06:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113801

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

License-Update: Add Apache2 linking with for new commits [1]

Security fixes:
CVE-2024-5594: control channel: refuse control channel messages with
nonprintable characters in them.
Security scope: a malicious openvpn peer can send garbage to openvpn
log, or cause high CPU load.

[1] https://github.com/OpenVPN/openvpn/commit/4a89a55b8a9d6193957711bef74228796a185179

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../openvpn/openvpn/CVE-2024-24974.patch      |  49 --------
 .../openvpn/openvpn/CVE-2024-27459.patch      |  99 ---------------
 .../openvpn/openvpn/CVE-2024-27903.patch      | 119 ------------------
 .../{openvpn_2.5.6.bb => openvpn_2.5.11.bb}   |   7 +-
 4 files changed, 2 insertions(+), 272 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.6.bb => openvpn_2.5.11.bb} (92%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
deleted file mode 100644
index b42b3040ef34..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2c1de0f0803360c0a6408f754066bd3a6fb28237 Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 17:16:07 +0200
-Subject: [PATCH] interactive.c: disable remote access to the service pipe
-
-Remote access to the service pipe is not needed and might
-be a potential attack vector.
-
-For example, if an attacker manages to get credentials for
-a user which is the member of "OpenVPN Administrators" group
-on a victim machine, an attacker might be able to communicate
-with the privileged interactive service on a victim machine
-and start openvpn processes remotely.
-
-CVE: 2024-24974
-
-Microsoft case number: 85925
-
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Change-Id: I8739c5f127e9ca0683fcdbd099dba9896ae46277
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Heiko Hund <heiko@openvpn.net>
-Message-Id: <20240319151723.936-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28419.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-24974
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/2c1de0f0803360c0a6408f754066bd3a6fb28237]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpnserv/interactive.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive.c
-index 3b120ae..5e3ff12 100644
---- a/src/openvpnserv/interactive.c
-+++ b/src/openvpnserv/interactive.c
-@@ -1994,7 +1994,7 @@ CreateClientPipeInstance(VOID)
-
-     openvpn_sntprintf(pipe_name, _countof(pipe_name), TEXT("\\\\.\\pipe\\" PACKAGE "%s\\service"), service_instance);
-     pipe = CreateNamedPipe(pipe_name, flags,
--                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE,
-+                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE | PIPE_REJECT_REMOTE_CLIENTS,
-                            PIPE_UNLIMITED_INSTANCES, 1024, 1024, 0, NULL);
-     if (pipe == INVALID_HANDLE_VALUE)
-     {
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
deleted file mode 100644
index d04eeb571db2..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 989b22cb6e007fd1addcfaf7d12f4fec9fbc9639 Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 17:27:11 +0200
-Subject: [PATCH] interactive.c: Fix potential stack overflow issue
-When reading message from the pipe, we first peek the pipe to get the size
-of the message waiting to be read and then read the message. A compromised
-OpenVPN process could send an excessively large message, which would result
-in a stack-allocated message buffer overflow.
-
-To address this, we terminate the misbehaving process if the peeked message
-size exceeds the maximum allowable size.
-
-CVE: 2024-27459
-Microsoft case number: 85932
-
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Change-Id: Ib5743cba0741ea11f9ee62c4978b2c6789b81ada
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Heiko Hund <heiko@openvpn.net>
-Message-Id: <20240319152803.1801-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28420.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-27459
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/989b22cb6e007fd1addcfaf7d12f4fec9fbc9639]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpnserv/interactive.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive.c
-index 5e3ff12..f613b99 100644
---- a/src/openvpnserv/interactive.c
-+++ b/src/openvpnserv/interactive.c
-@@ -111,6 +111,18 @@ typedef struct {
-     HANDLE device;
- } ring_buffer_handles_t;
-
-+typedef union {
-+    message_header_t header;
-+    address_message_t address;
-+    route_message_t route;
-+    flush_neighbors_message_t flush_neighbors;
-+    block_dns_message_t block_dns;
-+    dns_cfg_message_t dns;
-+    enable_dhcp_message_t dhcp;
-+    register_ring_buffers_message_t rrb;
-+    set_mtu_message_t mtu;
-+    wins_cfg_message_t wins;
-+} pipe_message_t;
-
- static DWORD
- AddListItem(list_item_t **pfirst, LPVOID data)
-@@ -1444,18 +1456,7 @@ static VOID
- HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_buffer_handles_t *ring_buffer_handles,
-               DWORD bytes, DWORD count, LPHANDLE events, undo_lists_t *lists)
- {
--    DWORD read;
--    union {
--        message_header_t header;
--        address_message_t address;
--        route_message_t route;
--        flush_neighbors_message_t flush_neighbors;
--        block_dns_message_t block_dns;
--        dns_cfg_message_t dns;
--        enable_dhcp_message_t dhcp;
--        register_ring_buffers_message_t rrb;
--        set_mtu_message_t mtu;
--    } msg;
-+    pipe_message_t msg;
-     ack_message_t ack = {
-         .header = {
-             .type = msg_acknowledgement,
-@@ -1465,7 +1466,7 @@ HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_buffer_handles_t *ring_buffer_
-         .error_number = ERROR_MESSAGE_DATA
-     };
-
--    read = ReadPipeAsync(pipe, &msg, bytes, count, events);
-+    DWORD read = ReadPipeAsync(pipe, &msg, bytes, count, events);
-     if (read != bytes || read < sizeof(msg.header) || read != msg.header.size)
-     {
-         goto out;
-@@ -1884,6 +1885,13 @@ RunOpenvpn(LPVOID p)
-             break;
-         }
-
-+	 if (bytes > sizeof(pipe_message_t))
-+        {
-+            /* process at the other side of the pipe is misbehaving, shut it down */
-+            MsgToEventLog(MSG_FLAGS_ERROR, TEXT("OpenVPN process sent too large payload length to the pipe (%lu bytes), it will be terminated"), bytes);
-+            break;
-+        }
-+
-         HandleMessage(ovpn_pipe, proc_info.hProcess, &ring_buffer_handles, bytes, 1, &exit_event, &undo_lists);
-     }
-
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
deleted file mode 100644
index d0726ab35c86..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From aaea545d8a940f761898d736b68bcb067d503b1d Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 15:53:45 +0200
-Subject: [PATCH] win32: Enforce loading of plugins from a trusted directory
-
-Currently, there's a risk associated with allowing plugins to be loaded from
-any location. This update ensures plugins are only loaded from a trusted
-directory, which is either:
-
-    - HKLM\SOFTWARE\OpenVPN\plugin_dir (or if the key is missing,
-    then HKLM\SOFTWARE\OpenVPN, which is installation directory)
-
-    - System directory
-
-Loading from UNC paths is disallowed.
-
-Note: This change affects only Windows environments.
-
-CVE: 2024-27903
-
-Change-Id: I154a4aaad9242c9253a64312a14c5fd2ea95f40d
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Selva Nair <selva.nair@gmail.com>
-Message-Id: <20240319135355.1279-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28416.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-27903
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/aaea545d8a940f761898d736b68bcb067d503b1d]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpn/plugin.c | 18 +++++++++++++++---
- src/openvpn/win32.c  | 21 +++++++++------------
- 2 files changed, 24 insertions(+), 15 deletions(-)
-
-diff --git a/src/openvpn/plugin.c b/src/openvpn/plugin.c
-index ed5d7c0..f7315f4 100644
---- a/src/openvpn/plugin.c
-+++ b/src/openvpn/plugin.c
-@@ -279,11 +279,23 @@ plugin_init_item(struct plugin *p, const struct plugin_option *o)
-
- #else  /* ifndef _WIN32 */
-
--    rel = !platform_absolute_pathname(p->so_pathname);
--    p->module = LoadLibraryW(wide_string(p->so_pathname, &gc));
-+    WCHAR *wpath = wide_string(p->so_pathname, &gc);
-+    WCHAR normalized_plugin_path[MAX_PATH] = {0};
-+    /* Normalize the plugin path, converting any relative paths to absolute paths. */
-+    if (!GetFullPathNameW(wpath, MAX_PATH, normalized_plugin_path, NULL))
-+    {
-+        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls. Failed to normalize plugin path.", wpath);
-+    }
-+
-+    if (!plugin_in_trusted_dir(normalized_plugin_path))
-+    {
-+        msg(M_FATAL, "PLUGIN_INIT: could not load plugin DLL: %ls. The DLL is not in a trusted directory.", normalized_plugin_path);
-+    }
-+
-+    p->module = LoadLibraryW(normalized_plugin_path);
-     if (!p->module)
-     {
--        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %s", p->so_pathname);
-+        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls", normalized_plugin_path);
-     }
-
- #define PLUGIN_SYM(var, name, flags) dll_resolve_symbol(p->module, (void *)&p->var, name, p->so_pathname, flags)
-diff --git a/src/openvpn/win32.c b/src/openvpn/win32.c
-index e91e742..1e61ffa 100644
---- a/src/openvpn/win32.c
-+++ b/src/openvpn/win32.c
-@@ -1532,27 +1532,24 @@ openvpn_swprintf(wchar_t *const str, const size_t size, const wchar_t *const for
-     return (len >= 0 && len < size);
- }
-
--static BOOL
--get_install_path(WCHAR *path, DWORD size)
-+bool
-+get_openvpn_reg_value(const WCHAR *key, WCHAR *value, DWORD size)
- {
-     WCHAR reg_path[256];
--    HKEY key;
--    BOOL res = FALSE;
-+    HKEY hkey;
-     openvpn_swprintf(reg_path, _countof(reg_path), L"SOFTWARE\\" PACKAGE_NAME);
-
--    LONG status = RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_READ, &key);
-+    LONG status = RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_READ, &hkey);
-     if (status != ERROR_SUCCESS)
-     {
--        return res;
-+        return false;
-     }
-
--    /* The default value of REG_KEY is the install path */
--    status = RegGetValueW(key, NULL, NULL, RRF_RT_REG_SZ, NULL, (LPBYTE)path, &size);
--    res = status == ERROR_SUCCESS;
-+    status = RegGetValueW(hkey, NULL, key, RRF_RT_REG_SZ, NULL, (LPBYTE)value, &size);
-
--    RegCloseKey(key);
-+    RegCloseKey(hkey);
-
--    return res;
-+    return status == ERROR_SUCCESS;
- }
-
- static void
-@@ -1561,7 +1558,7 @@ set_openssl_env_vars()
-     const WCHAR *ssl_fallback_dir = L"C:\\Windows\\System32";
-
-     WCHAR install_path[MAX_PATH] = { 0 };
--    if (!get_install_path(install_path, _countof(install_path)))
-+    if (!get_openvpn_reg_value(NULL, install_path, _countof(install_path)))
-     {
-         /* if we cannot find installation path from the registry,
-          * use Windows directory as a fallback
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
similarity index 92%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
index b5ee31078b6a..810a60308b80 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b76abd82c14ee01cc34c4ff5e3627b89"
+LIC_FILES_CHKSUM = "file://COPYING;md5=132de9241e3147d49dbaead12acb0b22"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d
@@ -11,14 +11,11 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf \
-           file://CVE-2024-24974.patch \
-           file://CVE-2024-27459.patch \
-           file://CVE-2024-27903.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d"
+SRC_URI[sha256sum] = "7e2672119bd4639819d560f332a8b9b7e28f562425c77899f36d419fe4265f56"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.34.1


