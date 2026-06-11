Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F95ECD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 12:33:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44274.1781181184798139014
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 05:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UA2CISZG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06223ef276=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA5cV53295264
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fjXiAHT5q
	PCp1rrOhuPs1u25rsvThbIwMRQLyQiu55s=; b=UA2CISZGUPIdxkmzr85Q2iTpj
	0R55hppAHCxINJPUI4WY4bZeZwjsObnMllD+AMMa8CltvZpJplDzTJRBBkSywByO
	bxf6+U4N1qkS6bs89LR/9gKn2vNF5Jqd8Co99FJoavLAdrOVi2A+xxhCtIGXTYpS
	HSVGnG8RPPSy2FHcf/1f+15IG8ugD8Q6zaqXZWX2vjA3al+iZH3FQNbwRpmQJ6zn
	OncBV4g3fRGN4gkjZHC5LEWP5GlaCoTYtQyEkFs01J1jp6kCy/b1Fay5CbSTSFnq
	x+BK0NgnQWCPYmTg6FJmEYMwWc14CUxYkaIk8CPC17+F7wwMCRXGZLRY1d/Yw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7frxbq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:33:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP6nhoR+VYLALakF+lNr8zScY0cmSA+IV+X2iEd8L7BMCJqblWS1p+CFeIhPqIlEtBKvRRdNxVx2TyplrFvEJUfJBb5XCJl6kcIRo/ZaNyxYuFvuwDvqrrVKF1F9jk4RX0pfrYv5BKKjxozL3oDVQVVK2JlL2H3dc1rTy7quFh3DRLLxFzl4TZVD6dZPhURjJC9DwTq5JoxAP98fgrHSKvdIDnN2qJ654jU5NNpPMgrCv3EnD3fYmw5Eu3DHqf4laXxkLbMJ/6MjhN33Q0Y/KAMP45DvoRq9ul8EfkG4Kx54RzmdAKFW31jfQYWlq7c/3Ka4cPf5U6yym8aLHDTwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjXiAHT5qPCp1rrOhuPs1u25rsvThbIwMRQLyQiu55s=;
 b=oSF02jmCV5H1n/1earXfVTcoJ2WdOWSDo1z4Me+wRHfK42dBfMN82SW2sxpG3Sv9yCk/WKeYNtOZjLLj+Ss72xNqx0D6XOaPQBO438aBN4BzEa3jxvO5nPuvb/sweqBx/LLzVqqZp4EJNLFgPt1OFIvUtauEUgCaFOk+7sSSIFiRt6hO1lCrN1qQ05OhRb8lmgRPQY76hN2hMPgtY8PKG2uKKPFFe118R/AQJErtexR9ijdup9qC4do/GK7cItwUukRUHZWEfJyenq45VgrhWCm8aajgU4OqemjentrehKSGm9HYHJ9bXSzlhJOgw9SwWgxgIfod8UrFoZdh5xdcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 12:33:01 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 12:33:01 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH] directfb: fix build with GCC 16
Date: Thu, 11 Jun 2026 05:32:22 -0700
Message-ID: <20260611123222.3544579-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR07CA0127.namprd07.prod.outlook.com
 (2603:10b6:5:330::28) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 52356166-cd69-42d1-8167-08dec7b59384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|18002099003|13003099007|38350700014|12006099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Zn9YyuNQNtqJ/3ge1uRGEG4rJDQSy8fWrDkLlYd4uChxV1D9VzBMNSBfNv/skb01blvi8bE+kxNjrtHIhl6aoU4iodZAKIe7gYKCGqZmrfHWVlMHriVqg1hhafkUtZnoMc5RUefzMw8A6t869Cz0l5nEbQxdxnanVK1CNg9xovH3R4BnmlU1o7XT4ABZHFFjOtbR0+oPxROFXG0E69GiTUY8JQ2ga2uPbfmeZHm1hMREEANXv44M3HH6ygNUAC8C409t2BZ6Va8GpnWqxSes1q4Kj6ckhHz/mEyR2975/+rr9lWtaG2aRA+FWgk959OIXH2ReTq7jE4hAulw7PTl0ACl9vjp/H/gKsxLfw3IxGzHPSeusOEAoJinw/Fgou1INvxbrE1eO1ygAL6eJnNgO6PjCDigeCy8Hc3AZpbJcEGHkxf1QLhk0ZUvem7T36AgjPp96xECQwwEgF+MVLPMFdtXkUH4UN2KKUDOiH9Z0EZsb+Pk+ahwaW/fhpTrXUTanAVSxtujwECwbz3DVitLiNRclntzn4X9tkrVh9xAXp11+qX1675BBWNlDhNfEWnwQAXgD0fxny7F24Y6YsVimwxrqTQ8f32jlaeKEDjXaw1LZ72+U3EuvUlRQq9rVMM4MVVYFN+GoURniPBKbCaSQIw6qaVd/DeR4P0xX9QN2Ynb2znf65/UF+WDNS1/SwsjlyPIlMT6UTbEaOGYVZYTK8nfz18iVmfXBCrEL6JEVLrmZggVPhuG+czwmoVY5oaA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(18002099003)(13003099007)(38350700014)(12006099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9yeffsC5Ktlli77fpufBsdXj4olBKCPH/oomLuUo2ysu5ctjzyPiZJdriDW3?=
 =?us-ascii?Q?NrI1UMd6HZLIQLsnmS67gKCZs9yxZiTBY4nos37WNBS8xR6mRccxdUeXkNY8?=
 =?us-ascii?Q?qXK7iCIeXCceRrsOze/vNj7Jz6O1Po6vKEqopEoXXOoEwyyVpdGS2btH+qZP?=
 =?us-ascii?Q?7IlV2Ko6yXgyrQ77EtPMaZnagGiKxV3CiBA8CxjgrKAV4C1BsRGKRDQg8cDb?=
 =?us-ascii?Q?BXgp2LpKHw0vm8CRe9oaLHblg+kl0wWBlMwXSR3iJjfVd0SYH9Ejfwx8m2C2?=
 =?us-ascii?Q?zHgp1I9uT4SnyqshBRL9M24rkmpbo7sYL1KePShcfR81f7O9q8YcRSevRPbr?=
 =?us-ascii?Q?z0Suqq7rsDv8zT+2kKd4Q3Qq2x8xqdXbkSdMxNCPLw8cgcUNEpQvPqsQ9yS9?=
 =?us-ascii?Q?PtAaBdM7In5kAL0urGK8womKlYd5kNzlJdwBsB0spJ52OCzw7WhGtDiqfE0b?=
 =?us-ascii?Q?np5um+kedwuea56ALTd3MONHXVR2EpbhiG/RaFiZuoRQBDDl3EgrB7BjPNH/?=
 =?us-ascii?Q?AhjTc3x4ICg9M3LWf54oiq3JfXYlWf1TnRqTFZDVRcvTVNUSf0bpQNon7hax?=
 =?us-ascii?Q?FytAkUr9rbapDA+pgXu4EuvhlMvDLFkztTUuaP8+4rIUkuLoq5z+Xk2mOcQJ?=
 =?us-ascii?Q?KcPaR7ZetgzLhnqEFASCfNMTANV/QbroM3PWDMnfqRE23AK2xgEPgJ05VOwx?=
 =?us-ascii?Q?+EgSadmeXyFNmkcP9bjXOuriX3ILcuUgESxm2GQNd9eSYMbd/9EtkQuF65gC?=
 =?us-ascii?Q?354O0bfV/kcOrTGWYOiOkAYdEQXsMMyzzRTK+S6LY3saB11m+hr48zd3J2XU?=
 =?us-ascii?Q?eQx0gLPQaSvi45ZLwa6NYIJ2MsDr4BfPIcjz1gZpWEfkOMuzj598IGLbc237?=
 =?us-ascii?Q?4RuDy67RdQngdiLdEK9TEDaK2m5dm/oP+tuWZ9AP7GG3yMw+Fa4ldsT61/DM?=
 =?us-ascii?Q?/5+8/8E0fQA/3fgoz898Dxi/xoVnBljERJsVd0O5TKMFhZui530G3iYKcQdd?=
 =?us-ascii?Q?Y6r5fDO0q2PakgbuouaWfDLmrwsaYWwkQZoSbTxQvaoWLp2NI6i7OkgGun8N?=
 =?us-ascii?Q?gwIoIzSuPocQwiMeJ/9Dwhm1/w8QIoUn1skYsoQMJ8hJlqgVs8Jzna3wP8vh?=
 =?us-ascii?Q?iyxV1+vWplPueFf58Id2qTGMDQ+9gpJyMYi+N/2lgg2bu52pfAbb5Ghh5Uv8?=
 =?us-ascii?Q?Mecu1iBe9TWgf3xCj8whZKkRSZjdYGkEb9AssEDr3NBoQBD1GVhdVpPb7916?=
 =?us-ascii?Q?7EAO80VJKEvBfAe/fm/lpj3D+0vaOl/lisYIrlqexWnx7Jh0d9Tj8fIWmKJE?=
 =?us-ascii?Q?Srtg/eoFPLkec2ZZ+pAlOzdzPUpM1ydHg4fVErrkIv0q7cR7mpksCWRNUYNf?=
 =?us-ascii?Q?iqBHQ0GsGcQXZepwuxWQcCjBBHeiHO3uNsoolNSr37sTgwar5G3i6eXHcn0g?=
 =?us-ascii?Q?uuvOYOfD19puXbhckvygJdttJn+V3VJy3A/0wKZxb15JRbCNcWggJz65Dz5N?=
 =?us-ascii?Q?bZP4H5CYduURK47cPonfoWLbJ5GlfKZB48qr5+uXNKhRvhsN7THtP0WdjtSL?=
 =?us-ascii?Q?VZB6cWxbTrHBROSshGaDgN790+ptPClvrDOKGi4P9N4pBLTWTW5wY7PYGjMR?=
 =?us-ascii?Q?Uwop7C2060wlE+JOIO5/UcOUdjXizWu3EtPamyGZWVZLJhtlboNLXnMapCLH?=
 =?us-ascii?Q?Yus/Nb5KrC6SBy7373XllBAwF5izlCVwXjaQN89gHD3ikCWCHqHyHDv1gcvC?=
 =?us-ascii?Q?aIjNN8W5olG9tvIpJRpuje44dJi4YC0=3D?=
X-Exchange-RoutingPolicyChecked: 
	WKwCbnHZYtHTCmieyyo6db47scx7EN0iSuLrE7M0eGsrK+ucgJnBJjYi1LbfSFJ/qC6+OicQwQUmKyS8PmD2t7JZDWzhC22d9cMyku6TCGbPei6w0US5qBbDibXY/Ri/58ftMJpIrUP8azLSN0FrxzPcAWAZh2BBSeKxJwhY4FCuTKX63Pe9GLaRSNJ4Z7a9IKJILCc90QSQgZQJ8yG5Q4tFOQeiUho5CpB3xDWo8LStEVLA1NUTjo4bz9S2KtyIdseJLcYs9y8XJqWqkcTOgyOgQ6x6aSJ2+a7XHT0H96++FDVE2rUSxBv7H3p1f9aIeZRDcnORXNf7iJV1TGKNeQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52356166-cd69-42d1-8167-08dec7b59384
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:33:01.2230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2Lp+cv8nc6Zuu4gKVpL7ErdcEeK9awk9z5OZqIXBFrcMX/84GE3OsRn4YML6ZthDo42AEU6i+duEUaRDZDXB+lJUj/fAwvXvkQ+TGkqrZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-Authority-Analysis: v=2.4 cv=PKk/P/qC c=1 sm=1 tr=0 ts=6a2aaaff cx=c_pps
 a=PV4nF49JPTCcgS+SffkoNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=K9QRoABbRREJrbt_dMgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3MKzP2NKIqAMRpvK-jDfCKe43IOnZIfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX2vK6HCfb0ygX
 3OceVeEK5HNTH/0K5RAnjSaQ+ewFKRctgmbTKB7Q4QDEimWFrJ9ZAwiE6U/d6eek3sNKnbpA9iH
 vyqq6bBX3TTFUDqu8R7fWw9//soDu5zFaDGzEb5yzY202jF8LYkDUSXdzO7reymSt4sA5Dwgk5K
 vnUK3cvRfQTUrr5YHctP0ofphhlk++h6ZjQbp7lvNakQxwBRKQCg5vhhxgEZ0bpBc8/bNrCsIGL
 8cTw9UKTBxqbR5kFvEyTEX39V6b1HwQEBSve2rgcOOpG2l86Glde/sPMyrdkQ35VA7m1XcNnXC+
 QwxkpEPPLzNEyAOOIbm80WALhZwiXXjEVlPmLlBiMeNbq3p6CtYCUqPqy6CX/FC/8q3cbwfG6Dw
 CqS4XQaP14+VOFt7zzrqhy0hmaeybI8ag2A/nC6VUHb0bKXcJ3h4f7gbmze/nQsWgBvN011W4gq
 OyuWFFKJMCCBQq5vWeg==
X-Proofpoint-ORIG-GUID: 3MKzP2NKIqAMRpvK-jDfCKe43IOnZIfW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX2PLfzCbfKkc3
 rl75URLgFXAAV2Gk1dU8p2gpfY0dzw3ptnV6rijMr4SFO879Y+Mi7WREAKHapZWWBFShm1n1RVD
 RF3xxyb81lOsu/40QFMBwPyQEKQZUWKGt33V6DxMAmluVdbh3tj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127530

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 requires std::set comparators to be callable on a const
comparator object. TaskManager::operator() is used as a comparator
but is not const-qualified, causing the build to fail.

Add the missing const qualifier to restore compatibility with GCC 16.

Link: https://github.com/deniskropp/DirectFB/issues/29

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../recipes-graphics/directfb/directfb.inc    |  3 ++-
 ...01-TaskManager-make-comparator-const.patch | 26 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-TaskManager-make-comparator-const.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 0dc410b2cb..70e1280e2f 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -26,7 +26,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://0001-include-libgen.h-for-basename.patch \
            file://0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch \
            file://0001-libdirect-remove-use-of-keyword-register.patch \
-           "
+	    file://0001-TaskManager-make-comparator-const.patch \
+	    "
 
 S = "${UNPACKDIR}/DirectFB-${PV}"
 
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-TaskManager-make-comparator-const.patch b/meta-oe/recipes-graphics/directfb/directfb/0001-TaskManager-make-comparator-const.patch
new file mode 100644
index 0000000000..3064a4f420
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-TaskManager-make-comparator-const.patch
@@ -0,0 +1,26 @@
+TaskManager: make comparator const for GCC 16
+
+Fixes build failure with GCC 16 due to stricter libstdc++ requirements
+for std::set comparator (must be const-callable).
+
+Upstream-Status: Submitted [https://github.com/deniskropp/DirectFB/issues/29]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ src/core/TaskManager.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/TaskManager.h b/src/core/TaskManager.h
+index 3f2174c..6ac29ee 100644
+--- a/src/core/TaskManager.h
++++ b/src/core/TaskManager.h
+@@ -121,7 +121,7 @@ public:
+      static void       dumpTasks();
+
+
+-     bool operator()( Task *t1, Task *t2 )
++     bool operator()( Task *t1, Task *t2 ) const
+      {
+           return t1->ts_emit < t2->ts_emit;
+      }
+
-- 
2.49.0


