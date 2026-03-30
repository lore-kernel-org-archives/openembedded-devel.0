Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC00FF4953
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 06:32:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45004.1774852324327007065
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 23:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=flMKZaFi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8549bf16ac=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5efua411066
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/yPPg7C3Hu2LZdEdP1TM82/YXuKc3tfCr2EWjy6jbJ4=; b=flMKZaFiA70Y
	Mcah3xEbjAjD1QWoqV5dM0GgEDL/LFBDqI675CSYGB8xlEUxq5G1cUuMe/MFk8Dh
	3TgV4/CDH1HGHWj+VFCBLE/TNZUiDvUzIFOS7U2856E4jhG5C2VN4HFKTkYBkQ0m
	zdKiohWGoxSt0T62VfZZGlmVgO0mgRkJKx32a8OJEhfwV1sYMXMxWH2nVCPeJ6qx
	FxpKUocL2vDsxpj5z5HIgRWUBl+wZ40G4ofU23pufV8Rb2vxDu5/JVs2eLTCZxqY
	l1Tfxwgj9kHA2+y6MNNp850CaKbN9RFtw4sVd0OEJUhzMwWJWfXaS/5dQPqLLYwb
	9v37oYscUQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbsbcj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3z4zunig/pZfEgHHDUSLLF8pCaEFFOQUn9QDbO54EKjXBVKpRa6bffUJuaojm0ef3xxKqqCeW6W/n7Qkn93XoyUA5gGrFf/w5QkAtnoJ8gjTwmZPEpXt35v/YI+CcgqKt6VJoZuX92WvLUiTI5crY0lLemV4i7S28TJV0Z0H+Sf3pnyPnL8zk7TpUSVeGmOrNkeTVG0XPorXwBSrjUpvV2rC9QIbMibTCVKcCLdd+wS3nXznbx0LMsw15IAAa9WRXQb8mZYAvW5OpZocstkKWOMf52DnqYtePEADWaPDwdnqlL+mKUEm/AoFkrnYvfAnYq1ThsJ9xNwFvXZ1244Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yPPg7C3Hu2LZdEdP1TM82/YXuKc3tfCr2EWjy6jbJ4=;
 b=Ndfue9bNQbt1L92hshBI6GgkK2abiEHM6SL0Cox/ai+32pXfkuVihH30sE1JMMD0p+so2+K/NNvUWDJ6q4YCsNSxD5RMEX6c1Jt6coLUCWZoWiL52A9GmLAGlFd/uv87W7Mycw8T8XHOWUjK+R25hICPnjJZs9Az9qSKSwb3XQ6Cj/liNBZIlzkgT7Zv7MYrCyOGREMrJ5V2nmDH1Z1xg+22RkC+hArswjeXL59ZS5SupnHfer4r+WTgxkSzV4QqFPdYdSQP2reLxh60eE9CazF8UqDjA26YZmvUAD8VBdKyzQg+ORx5TcPXgP2pEe6KfEP63lVRsqt5KX9zkzEGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Mon, 30 Mar
 2026 06:32:02 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 06:32:01 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] ostree: drop soup2 option
Date: Mon, 30 Mar 2026 14:31:44 +0800
Message-Id: <20260330063145.94013-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330063145.94013-1-changqing.li@windriver.com>
References: <20260330063145.94013-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fecb09-2d2e-4e74-0b65-08de8e260d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9gUb3L0owbf31DB5ocjRl9iZcCbqgxbsR4fetGzPyL7gp5td09Z5arS6ne4h1y3SaRMYQK9RQfMVJuyq6tud60QwanrOQnHSz602RGORG4G1wKBDa1CtKZkdjzpEJ5Vr6iL6426jdjG0eY2yI+YsZmYH1Kt4Pz2XPbpmcHHzKJO4Mk9or14O+raNYWrCSJh5Z/MgYZoYrlTwwFmLOnEloAQq1bBgerAypUmeZvwWdv5US5/x0iGbk/cVjh3rQmM1kdNWbBVy5Af3DOX1D/Tfv+5fP1AbptxE/Kq7m5A39DVH8w7vgpXFHbQAhBYpCKzfB2Vaa89Adr/tFJeBjuY8/sE/X/N2dh+sxfOCxUtkk5c2fWZDUQT82pLaVsuSXNCpG2nFe4BBuNfxVyRo+68MVfEZl9vDnHdU64cv/p4bOyhe/Hn8Bh2REUz9YXb5JhfBA6eSUK16aisS5TFd7CwyMloa1BiDBc22vn5OD+NNkCDZStsybcXJSG+lWlYzQZBdWjDf7X8TiimYX88gAzBOYE6jJfo8SywpZu+6qDKaQ7hI0LKnFChx9GbUqC9BqPN1LNqJOYlAOEGN5ZHgRAtqY8KwEbeJhXQqPPWUPyHVrtKo09hYNtOgRufZ/tNvf9sT/8gxV82EgZurrI5uaVe5zo66OsMMcFhKOP++D1tOLysTKpryy8mH+vBKRlBQTqD4zeAbPdZlR0wTzV87FIJA66bICafwUvGKOhHQY6SRMppnZM8nFsP8NJUio1+5HL2gqINYodn7oSiZqcTyjaTiQKn2SN7EiciQKsw4rpc32fg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5heShvTvF5C7+yHvLRPDzYySHdM7mSjoJo+Bqv5qBKawHhI6b0WytCaBWHLZ?=
 =?us-ascii?Q?ulOM9nBKLoZvrIxTWwcmrWR62swvatuazzBYKYTAPBGElN+ggWGzUZwASnJU?=
 =?us-ascii?Q?BTA3Dfaj0jZ48KKbF6FcBVcsDObzcqztC5u1mj5W7MuAOXUS1DLHCnO3xflX?=
 =?us-ascii?Q?W/+1e9lexwiHQbPMRikNq9sVB/jq2Vey0EcEHUp2MOojHuaSfiR5rAo/7cej?=
 =?us-ascii?Q?2ux98rI2lzlaC6VVaO97IXDzpYyM+tHjUv3jeaIqxPAm0dc0odxNyWjoxxkv?=
 =?us-ascii?Q?Sm+juf75QIipN/XsjwqSar5xNSy37uKFP07n7pweZoJt8ZyeZd06XAHkpNRo?=
 =?us-ascii?Q?YSxao5ZUH/4pDeMA55hVQ51xwJiOZcbX1Cx/L/yr3FvXD/76mBGpcQGhToHM?=
 =?us-ascii?Q?Rlx2AvyUO7gAVk6hRotpv46gu8XRpzGcoTGITLk00PLq1uHm7pTCQMDuEMs1?=
 =?us-ascii?Q?SXP9h+Z1ObHT3coRMIKpy7m0tH/FPiQTEMUN6YxhOTGRWvFyNBem5KEx4Haq?=
 =?us-ascii?Q?TPYWh4+oxYMGQdoKrSgGJPf9jKKMBlchgwDdCubQVDS4fNSxDFPCfQCXW3jp?=
 =?us-ascii?Q?BVTW4x2rGTV2NWryM34Vc9uFNlqMjKEldbMmrFe4MKywubGGFdGl34JDVWZj?=
 =?us-ascii?Q?wJWIqcEyOFmKtQDZZNT+qGDJwORl/NqYCZtp9a1HV5CG11s4aeXX+Qqo+e8B?=
 =?us-ascii?Q?YAGDhlkLQ2VKOvg011bi5AVVfQP61XtoPvouXzwz1MP/6evGKcc7TcDWy2ub?=
 =?us-ascii?Q?KSmmvDQGXr4Ee+GwllJp2ff7JEES7qOmIHBuQvlBk79HJyRSadHEY+zmcFFz?=
 =?us-ascii?Q?X8uT+eO0wKkXXt/CMlx0dFK3VapJ3633s/4xcqUAOC9ElXvM46zY1P/rdKfb?=
 =?us-ascii?Q?70IqbP0NxSiZIpMfY0RQTro6R5JleuVdVzLfDvzvAo+ognUwTcDuHNmu08Oz?=
 =?us-ascii?Q?zLbGO5GJXZsd9SutcJc2ksY9898EysFlBY2g33IWsgvB7lGMlqYyOqYO8rsy?=
 =?us-ascii?Q?uULU+Brd3htmt/QAwyx13jL65Qmnm9KL+mWzWY0Jw8dTX3rx/LRLgWxmXgVq?=
 =?us-ascii?Q?Yz2huP9aatF1I73WcQg9ohgR/uJUWMZhFq2nwSN2uLtEdskPWr9XVo2qNKHT?=
 =?us-ascii?Q?vqIiYZIfvGetJBPA20tXSxcJlOvTxFPren6/CO+wZYcCNBE0TnBIhf3/CjCy?=
 =?us-ascii?Q?uTugj1FaVHPxsVgBNsvpd/x3I2RtyRhNF7Yviogm/ZY/qIk3tu2mrLkHFmBK?=
 =?us-ascii?Q?7sJ8lzgBnok2IF11nKU+bZsBQiH9vqkQBQMtZpYlQ19/689a93FYWSTA+CWZ?=
 =?us-ascii?Q?w/c/ZidN4YOYUDWbkl3FKqfZXAPl6feV4Sa/X9pzB5+bozKVyLy7pRxfHZef?=
 =?us-ascii?Q?AovC5764/oSwAdD5Whzh2b/cK/bDJMzP6Q9kILFJLtcNBF/ukRXQ6l+xxDDH?=
 =?us-ascii?Q?FgrL3PlsIqgDD86QuJzskD1K6b00BlRBg0S1sDppC04NNSjlscrYiELnbvaX?=
 =?us-ascii?Q?jGmFQiMPHeS8hXu15+NS1wzG7cCB/C4ASQgAIZKsSGCPq5jpyS8eCqXb6shk?=
 =?us-ascii?Q?ZfeDDnDxLo5KET2KWRR61L7vk7F7GWItIrIeJzTqSJGgmFa0jvz6bfhRwLrm?=
 =?us-ascii?Q?1RR1n8xO8aS43GDHKOFH2drG3A8cdPpa7xgvb4D7X1gHPYsE4o+gN7hfJuiz?=
 =?us-ascii?Q?qQfqCXTtbOnejDifjVZ0beR7cOGVrNvakVaPaOWz7m2VNIjU+oNJbt6TfJhx?=
 =?us-ascii?Q?9PSIzui6ZxzY1lgC7cCvZ7KKMgtX5FM=3D?=
X-Exchange-RoutingPolicyChecked: 
	rLFD2y04bu9QTL1s5rSXJMjbPIo8BvDpu6maiYd54WQqPBPHmGQBCtICYegr//sIfYWnWJ4KaFV+r1LGbToLq5F6qF32eIUM2Sk3UB2lV1Bvv1TC2FpXVlIFREEym91v+A8pOqI7FPmX+2BdcLWYVi8OKTnrlw8Y0sUHS2/kz8r3U0sk/01npTUxl3r5TppldVNDxX7/+8uqC8HxCCv0iBDuwhofxim48l0PAbVq8KmkmTWjz7nfF4E4hiOOJ7EdBsFPq1FI54Q20j88yeQMxnCSXWSw8FFckU2znSsfrofJM98uh57kKVaKy9BPuGa1XDNlJCJnop+qrYN0RymEPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fecb09-2d2e-4e74-0b65-08de8e260d55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:32:01.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wszZEMdisgd9yZA/SsQ+cJD5vxruJpBtxjqG6/8qtcEm0Ni5sP++Q5GuqH/DhxOij5QwOviaR8FkgQNdRGabdyFiCPIcf/KqE3/hoVCFdN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0OSBTYWx0ZWRfXycp3Idz32B2F
 rKHr9b5HNzdgxuH9CRf/CUjEZ3EFywP069aJfiQePWpkIkro1Z6MC+bh1M6CgDTk+7TIfbvCvqB
 R7HSJ2wivlwthWii8sQgS1k24nue9XeHVy5sHHwPb4Wu8J1jSyk0GzvteRRn3kTxX5nKB7zAD8L
 4cFOiOQPZHyyno/HA9FTy5g8NrP+qYXX5usy6+T7HgNhaGAQXEv0+MBOswftEcrqOIQ3L2bmOR/
 YYktiSDXdvnqD2Ge/xmInUpWjVk2Whjmuw5ktltBiotOpes0c/IeqXJjbNuKFETFcNGs4hEU0HR
 ayskvVuE2Q0h+zEfibMHjNy/QWMvYCCIq0HLuydsU4AovBVR7Zq8/scIyLgR6YqzffRMxB7315a
 /uU+ZKZT8lqYATTzSp4ufWNMoe8ZCXs6M1Ifw6YCOR96q0JK7mUzwWZgwLhOpnJqS5Z67v+SH5v
 RRfxwo1HsFPLzQnF8SQ==
X-Proofpoint-ORIG-GUID: fL4NEMulM7xhdRskeNAJSC1ck2FTy3XB
X-Proofpoint-GUID: fL4NEMulM7xhdRskeNAJSC1ck2FTy3XB
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69ca18e3 cx=c_pps
 a=eZ5Ua+8tQ3RPWrQJUiaIvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=dDYjRZACXro9N1CdzxgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 06:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125830

* libsoup-2.4 is deprecated, and some recipes already stop support of
  soup2, soup2 and soup3 cannot be used together
* ostree upstream already stop test of soup2, refer [1]
* Remove unnecessary comments, PACKAGECONFIG for ptest already set in bb

[1] https://github.com/ostreedev/ostree/pull/3531

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-extended/ostree/ostree_2025.7.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
index 764daa8e37..a2094f68c3 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
@@ -39,9 +39,7 @@ BUILD_OPTIMIZATION:remove = "-Og"
 BUILD_OPTIMIZATION:append = " -O2"
 
 # Package configuration - match ostree defaults, but without rofiles-fuse
-# otherwise we introduce a dependendency on meta-filesystems and swap
-# soup for curl to avoid bringing in deprecated libsoup2 (though
-# to run ptest requires that you have soup2 or soup3).
+# otherwise we introduce a dependendency on meta-filesystems
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
@@ -87,13 +85,13 @@ PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
 PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse3"
 PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux, bubblewrap"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
-PACKAGECONFIG[soup2] = "--with-soup, --without-soup, libsoup-2.4, , , soup3"
-PACKAGECONFIG[soup3] = "--with-soup3, --without-soup3, libsoup, , , soup2"
+PACKAGECONFIG[soup3] = "--with-soup3, --without-soup3, libsoup"
 PACKAGECONFIG[static] = ""
 PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-libsystemd, systemd"
 
 EXTRA_OECONF = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'static', '--with-static-compiler=\'${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}\'', '', d)} \
+    --without-soup \
 "
 
 # Makefile-libostree.am overrides this to avoid a build problem with clang,
@@ -185,7 +183,6 @@ RDEPENDS:${PN}:class-target = " \
 #
 # Something like this in your local.conf:
 #
-# PACKAGECONFIG:append:pn-ostree = " static soup3"
 # KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
 # TARGET_CFLAGS:append:pn-busybox = " -static"
 #
-- 
2.34.1


