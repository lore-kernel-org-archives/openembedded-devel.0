Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A730FC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 05:21:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13303.1724217662472455619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8963e5002e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L4OTHk001709
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 05:21:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6ur2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 05:21:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47L5L0Ia018152
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 05:21:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6ur29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 05:21:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mx4jkUe3LvXj8i0Z3f/MUuW3kgfVgecaxus1lrXnHNgWk4otUuBoS7ufdyFvMUcyIeWkaJGvz+KzHHiNVQi9JhNEYII1bboZCCAmLvNOaxoEopoJST/LJ7hwbfD8VI73SRcSW/CkbHutuaKvJSH33OZBmIzp93P8JkIx77XBpBQjlVYU1jYfaehIKKI33n6w9AKlEjl2A4WeC9sshZg5Kx4JdxPRKb4AX7U4XZRrqO71dnvf0rCYsgqR5EHXpR+w9oGKFdrAeN865HBKf5T/AQ6AzUjQZVecMw20Hcc+c7l9f0/cGuLdxFhK2X7tNtSEDMl3S0i3eVaMULEugfHPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My92yvLbGN5ZcWU/qYW3Tv6dLf60mOwDMCrV8591ry8=;
 b=Li47IwfR10b6mzeJnzLKYa+Ooz7HDisjWHc4X5DpVVAIvdg4fll+1IkAETdLEH9WYtwD2vUYBwdPF07L5Z71JphERfrTVmJaxSypgklUC7AJDonFiQh/+An0Lj6wzNYTi69gute0teDZYhGD0FngtIydXZfWt9Cwlnjhx+5+PHM9I1yCbu5GRgZCeS/uUBfBBo3E6tzwqIBVqM1Qa9WY9A+ZGmqeXNEeqo7tJrf/hp19gnHMncBjRlFUp6RmNSqcl7x7Gc73GB/fLe+LSuyVQ45WzXlD/AdIyyGetWQCJx46APD6Bg7wajoaVHPv2WKzNQ6hesZr+Ma35lnP6lG0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 05:20:55 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:20:55 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [meta-oe][PATCH V2] nodejs: support cross compile without qemu user conditionally
Date: Wed, 21 Aug 2024 13:20:43 +0800
Message-Id: <20240821052043.3425841-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAMKF1so7iQw2tmu-+9N4FzKCnBaP---gcyecOjizXzEBBRXQXw@mail.gmail.com>
References: <CAMKF1so7iQw2tmu-+9N4FzKCnBaP---gcyecOjizXzEBBRXQXw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 09be4884-e31f-4608-d6f3-08dcc1a1083f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n8xC0mx+sZVHesGW9gqsgArnqNFPCGdmhXg2Zt7avee89xi95ylLVfVTXyd8?=
 =?us-ascii?Q?BLKv7TfAPsUWVOAqlzXDOx9p15cVX1XSXSBWLqxb08zVyYGb5F9XgxVjle3H?=
 =?us-ascii?Q?QLWLk6vbyjxdscSVUBo1NdfvCOGEy5fJwL+qto2nUDVpHloRBqPyJeBmt9Zj?=
 =?us-ascii?Q?szNqyhbRo8Y090AUIfpn5NEv3IWYYwMzir3HLIr1vIsaD8DL6FewURuzb+u3?=
 =?us-ascii?Q?5SItcGcTfzozFw29Lfnu0uW/nYS0bGahGa/FZKS4mcFxXjX1aEKNyVDHHmry?=
 =?us-ascii?Q?TgPPkYOQqUedlDfGKlsyi34e246FutFIHatRWyYhNSwu6yBrv55TusnUvQh0?=
 =?us-ascii?Q?Me8tliSlyCtMpREZo2bVW/15iJXgFTpmtDZN1bTxyI8UvfC60WVA2yqcF5Vk?=
 =?us-ascii?Q?I+DFmE0nGZMMrAhsSQ67cUBqd/ec7jdsNHt0rSXDdfXNSruThl5K+NAmXJ2H?=
 =?us-ascii?Q?9xnqAePsTziwC3RmlgwjMW7yS5VoWDQWUjPVvd0TyQyK2q+ZaCp39y1xKlka?=
 =?us-ascii?Q?WRnTcTSGhUaNXAk1Z0oZA9vZsMNVFjyK7zRqgHEdhadBBZMHJGrjVwHfSVY1?=
 =?us-ascii?Q?L7ZGsgu9ehsR0uRw8tcb1jD+MBFNdHiGbAiktHzvLOJ8Jfv6jspjID4Nz6Tn?=
 =?us-ascii?Q?razfB8ToyzEFNJUBUfIt1vFsrVYyakWlcDEvK78iH8zBlIBMMbJIkh2zITFE?=
 =?us-ascii?Q?6x88F13XnzziFT7V2x6Mhtwt8a2fcLxqzZEeV5u+URt0Anfko75SbENJh6Nh?=
 =?us-ascii?Q?YP6G3Bi7gRvRVvtZoCh/bHZz5epFO+I53Cy2tVH6iCbIWGG9xravOlXFrEQl?=
 =?us-ascii?Q?2d9r1K8ORC+SfGv9QTC1md+aMxLA8aH99jJ0ZS7264GEaGXkqrCO5hD5k4V2?=
 =?us-ascii?Q?/8o4tHbdVnrVB8VenORV1rvlltIBL6vpD6z1yLXyOBhxcPTXZlxpiDXHGJIb?=
 =?us-ascii?Q?PvCbpye1Yw0S7miGY+oQRcNORfaXqsWYyoUHhOh+tIIkfJHrhhEKqHW6BiSo?=
 =?us-ascii?Q?qGwpd3sIUvLHRoxa7Q2o/J8ePpETKAEFyzPiY5yiqZphYmQSYMN4MIdtTpsQ?=
 =?us-ascii?Q?VgX9FDAFkkDpNyNtMWjsYlrKCVHA1OWp/4VpVwcWPVoLTtWoSoR0R9eHCvpW?=
 =?us-ascii?Q?4AHNpB48IUEw9LaiZFdR2xfp2b2YPyU1P64HsYbMROQoVGs/7ZNLv7sqiq2L?=
 =?us-ascii?Q?/MjuNBdWYFGzXonzfKkr3HDNEc64zWQH0/QJL5lMH00daVigGleFFDxJJatT?=
 =?us-ascii?Q?tKPkG6nNgiBWeHJaROwrqFFQsoaxtMBDmLNQtKJvHKv0JnLQfPzGZdVeXhiL?=
 =?us-ascii?Q?UpmqvXIc7zorwrlZi/qiIe6lpYrljMMZGw/jUfiMy89wEHvRR/V8alm67HGc?=
 =?us-ascii?Q?VpwzAC0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UHIMOoISXlHEM/PlA1AOxrHXHbrMkcSXrwZ+RErOIueaWKsQ6Gn6LS6VaTSx?=
 =?us-ascii?Q?l6tfUMFh+ESNJR43EEjaDZQcPh7NN28p4o5qPiY99Wl7w6Jthpn7iPl3OogO?=
 =?us-ascii?Q?nhEAwr1mBvuVLhLAutAVptfNQgyHObBHlfPpNHoSkr1bWPbt2v1lPsPvTWeo?=
 =?us-ascii?Q?o7x+IN+O6GSJG0xFzWoeDn3Ggufgczpr59erF0TF3ZUWVjvwiURZrQE+SQoM?=
 =?us-ascii?Q?yMrBZ4+A+NQvkP84wuaq9pnVb2GP8hl3yuH3KAASqbsyQrkApVtsuTqO9bK4?=
 =?us-ascii?Q?rQVRyI6GLY07sFy7PYusU0mTKmKcxyF3beIzqWoOGrW/b8bxMhuNTlfC3FBU?=
 =?us-ascii?Q?S2j3mZXCSSlIwyuzyb1smE0lEmssh4vgmUiDGL4wDiSWFrkBpLpwOL0TZX7o?=
 =?us-ascii?Q?maL7/JDmGYK//sK7F4pbGwo0IH/po4POgq3nmUqlG/vkWl1rUsOJaTtsXTRz?=
 =?us-ascii?Q?9DQyR6ravG0zHY2svUjKHLtzcwTLGdF2jLsFq9X1O1zmc1u3nd1W8ieICIL/?=
 =?us-ascii?Q?Qy1dpHumUYXeC3bGgcH8vnrKLLd+dIhzbJJzlFj+L+ETWUoFYPuMC529pPps?=
 =?us-ascii?Q?QBhmcoS97W1sx/EQCLMCirnQR1Xz+r9srAA479Xzem+EJy8cLt8Q08kv3CS3?=
 =?us-ascii?Q?0Rz3bQG3VOAhc9dDPqnK3uo39GNW62KPoW8GOm1hJii7v7ZxSGxW9ons7liH?=
 =?us-ascii?Q?QoZe8nBGoV0KBEy5u/TuOkycHiXDgY0QbTvgVWDa0OORiavaRELGH5dTN2sS?=
 =?us-ascii?Q?sjfSpWBe/QUisSJSR7m8mSbwSkulTsuF38q0zDrECMlLFFDrr40JTzyci22T?=
 =?us-ascii?Q?MCaT2z60PekZeVgKunw3LtuT1oilBPtRXDyBOxlLUKuAkguFyOmDIkDeMTf1?=
 =?us-ascii?Q?1llp83CIWwAShr3ItluX25rQwSNWmS8z4RMSlQ6etMtCS6l+EzZ385erQBtA?=
 =?us-ascii?Q?/hLrjGsiocq7OMpO0Wrog5RqtxO51GfpND4dbXxPn+M5wHVaxwzWQvic1Iv+?=
 =?us-ascii?Q?L/tlkTWPrW4vZNbzL4qMwJTKp9RawegdMUoQYA9bzmqVFhEsOVvAXcInmpKf?=
 =?us-ascii?Q?2Yh8NdV9ph0p6AKRgeBP6wcYNkczDnk2Pcd+E/i0mFQnijvLUsxNSQrCEB2G?=
 =?us-ascii?Q?EDSluuaADTM4sCM3zz9LjXn0jzlVrRSOnG0o7UKlnavXifXVG22J/SIIcnd9?=
 =?us-ascii?Q?gCvYj+x++ekhRd+gTAa3BNlrOGCxzJtHEq6EOt6rnHzSiyLZJNpjopADk1AI?=
 =?us-ascii?Q?oegzdWmiaU4ZSkk/RRFy/6LNShJz/N3ECX3AQ4pj0dLRx2s4xjSCnd/9FDMR?=
 =?us-ascii?Q?/h4/4oy76WN1b5VTi/7C/X/ixT69mHB35Ua7RulKIfsT+rFrY+SyPK0k9F/z?=
 =?us-ascii?Q?tvC8+44PBSQYCpYUJWQ283zKCH88J+AuTFv9QyggbsHZlryQYv/HYfYxCTQu?=
 =?us-ascii?Q?TgPnlqAnfNS3Bh2RR1BGzSXcHcPtdvGSC3puSyQ1uXmdv6THX3EspoEfh051?=
 =?us-ascii?Q?MZq5pI09XARtwxoB7lln7kR/8jeGzyRggLVg6otM2I/vNKU5FWRXrPtMulgc?=
 =?us-ascii?Q?3wvmv5iVTYkv71gK2aBriL+r80WJdO/WjNIcIdF20tawjDowmFFivR2Pcbue?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09be4884-e31f-4608-d6f3-08dcc1a1083f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 05:20:55.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tSgqG2qKeiNLEKkkMVz3ldF8NoRB2PUJtlXQZQeWz+I+fJG7hgnJj20QijIE4jcH2QaYvYCvJr16YzS0/EnUSwFzqVMpVZCvGVYW3qdvZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
X-Proofpoint-ORIG-GUID: CGI-5Rl7WhKh1nOGIl4MSesLgY6Pc1Li
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c5793d cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=-LCu6K_DAAAA:8 a=iGHA9ds3AAAA:8 a=4ZzBncWrDg-36LrfSScA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=J-JL0wFkX4TZ9yyCLs2E:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: St_hmzAxp0zhyB55DtgPoy2WuTceQ4zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_05,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 05:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111877

Due to the scope of supported BSPs by qemu-user is limited, such
as a segment fault on armv9 after qemu apply commit [target/arm:
Convert LDAPR/STLR (imm) to decodetree][1]
```
|tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1/out/
Release/v8-qemu-wrapper.sh: line 7: 3179613 Segmentation fault      (core dumped)
PSEUDO_UNLOAD=1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-crypto-wrs-linux/
nodejs/20.5.1/recipe-sysroot/usr/lib64 "$@"
```

Upstream nodejs have cross compile support, but it needs host and target
have same bit width (e.g. a x86_64 host targeting arrch64 to produce a
64-bit binary). So:
1. If host and target have different bit width, build with QEMU user as usual;

2. If host and target have same bit width, enable notejs cross compile support:
- The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
  CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
  which is separated with target build [3]
- Satisfy layer compatibility, set GYP variables in prefuncs of do_configure,
  do_compile and do_install other than in recipe parsing
- Add missing native packages to fix library missing on host build
- Rework libatomic.patch, explicitly link to libatomic for clang
  conditionally

[1] https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7585dc78
[2] https://github.com/nodejs/node-gyp
[3] https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentation.md#cross-compiling

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++----
 .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 85 +++++++++++-------
 2 files changed, 126 insertions(+), 45 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index cb0237309..bc51f99d8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -1,21 +1,77 @@
-Link mksnapshot with libatomic on x86
+From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 17 Aug 2024 21:33:18 +0800
+Subject: [PATCH] link libatomic for clang conditionally
 
-Clang-12 on x86 emits atomic builtins
+Clang emits atomic builtin, explicitly link libatomic conditionally:
+- For target build, always link -latomic for clang as usual
+- For host build, if host and target have same bit width, cross compiling
+  is enabled, and host toolchain is gcc which does not link -latomic;
+  if host and target have different bit width, no cross compiling,
+  host build is the same with target build that requires to link
+  -latomic;
 
-Fixes
-| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteCompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8CountersEiNS2_19CompileBaselineOnlyE+0x558): un
-defined reference to `__atomic_load'
+Fix:
+|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/Release/node_js2c: error while loading shared libraries: libatomic.so.1: cannot open shared object file: No such file or directory
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE specific]
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ node.gyp                 | 13 ++++++++++++-
+ tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/node.gyp b/node.gyp
+index b425f443..f296f35c 100644
+--- a/node.gyp
++++ b/node.gyp
+@@ -487,7 +487,18 @@
+         ],
+       }],
+       ['OS == "linux" and llvm_version != "0.0"', {
+-        'libraries': ['-latomic'],
++        'target_conditions': [
++           ['_toolset=="host"', {
++             'conditions': [
++               ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=="0"', {
++                 'libraries': ['-latomic'],
++               }],
++             ],
++           }],
++           ['_toolset=="target"', {
++             'libraries': ['-latomic'],
++           }],
++        ],
+       }],
+     ],
+   },
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index b23263cf..dcabf4ca 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1436,6 +1436,7 @@
-     {
-       'target_name': 'mksnapshot',
-       'type': 'executable',
-+      'libraries': [ '-latomic' ],
-       'dependencies': [
-         'v8_base_without_compiler',
-         'v8_compiler_for_mksnapshot',
+@@ -1100,9 +1100,18 @@
+         # Platforms that don't have Compare-And-Swap (CAS) support need to link atomic library
+         # to implement atomic memory access
+         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "riscv64", "loong64"]', {
+-          'link_settings': {
+-            'libraries': ['-latomic', ],
+-          },
++          'target_conditions': [
++             ['_toolset=="host"', {
++               'conditions': [
++                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=="0"', {
++                   'libraries': ['-latomic'],
++                 }],
++               ],
++             }],
++             ['_toolset=="target"', {
++               'libraries': ['-latomic', ],
++             }],
++           ],
+         }],
+       ],
+     },  # v8_base_without_compiler
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
index fe7121156..3b277c2d6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
 
 CVE_PRODUCT = "nodejs node.js"
 
-DEPENDS = "openssl file-replacement-native python3-packaging-native"
+DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest
+inherit pkgconfig python3native qemu ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -24,15 +24,12 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://libatomic.patch \
            file://run-ptest \
            "
-
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
            "
-SRC_URI:append:toolchain-clang:x86 = " \
-           file://libatomic.patch \
-           "
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
@@ -66,28 +63,14 @@ ARCHFLAGS ?= ""
 
 PACKAGECONFIG ??= "ares brotli icu zlib"
 
-PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
-PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
-PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+PACKAGECONFIG[ares] = "--shared-cares,,c-ares c-ares-native"
+PACKAGECONFIG[brotli] = "--shared-brotli,,brotli brotli-native"
+PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu icu-native"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[shared] = "--shared"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
-# We don't want to cross-compile during target compile,
-# and we need to use the right flags during host compile,
-# too.
-EXTRA_OEMAKE = "\
-    CC.host='${CC} -pie -fPIE' \
-    CFLAGS.host='${CPPFLAGS} ${CFLAGS}' \
-    CXX.host='${CXX} -pie -fPIE' \
-    CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
-    LDFLAGS.host='${LDFLAGS}' \
-    AR.host='${AR}' \
-    \
-    builddir_name=./ \
-"
-
 EXTRANATIVEPATH += "file-native"
 
 python prune_sources() {
@@ -110,9 +93,11 @@ do_unpack[postfuncs] += "prune_sources"
 # V8's JIT infrastructure requires binaries such as mksnapshot and
 # mkpeephole to be run in the host during the build. However, these
 # binaries must have the same bit-width as the target (e.g. a x86_64
-# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
-# depending on a third Yocto toolchain, we just build those binaries
-# for the target and run them on the host with QEMU.
+# host targeting ARMv6 needs to produce a 32-bit binary).
+# 1. If host and target have the different bit width, run those
+#    binaries for the target and run them on the host with QEMU.
+# 2. If host and target have the same bit width, enable upstream
+#    cross crompile support and no QEMU
 python do_create_v8_qemu_wrapper () {
     """Creates a small wrapper that invokes QEMU to run some target V8 binaries
     on the host."""
@@ -120,6 +105,10 @@ python do_create_v8_qemu_wrapper () {
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
     qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
                                     qemu_libdirs)
+
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
+        qemu_cmd = ""
+
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
         wrapper_file.write("""#!/bin/sh
@@ -138,6 +127,14 @@ addtask create_v8_qemu_wrapper after do_configure before do_compile
 
 LDFLAGS:append:x86 = " -latomic"
 
+export CC_host
+export CFLAGS_host
+export CXX_host
+export CXXFLAGS_host
+export LDFLAGS_host
+export AR_host
+export HOST_AND_TARGET_SAME_WIDTH
+
 CROSS_FLAGS = "--cross-compiling"
 CROSS_FLAGS:class-native = "--no-cross-compiling"
 
@@ -179,8 +176,36 @@ RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
 PACKAGES =+ "${PN}-systemtap"
 FILES:${PN}-systemtap = "${datadir}/systemtap"
 
-BBCLASSEXTEND = "native"
+do_configure[prefuncs] += "set_gyp_variables"
+do_compile[prefuncs] += "set_gyp_variables"
+do_install[prefuncs] += "set_gyp_variables"
+python set_gyp_variables () {
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
+        # We don't want to cross-compile during target compile,
+        # and we need to use the right flags during host compile,
+        # too.
+        d.setVar("CC_host", d.getVar("CC") + " -pie -fPIE")
+        d.setVar("CFLAGS_host", d.getVar("CFLAGS"))
+        d.setVar("CXX_host", d.getVar("CXX") + " -pie -fPIE")
+        d.setVar("CXXFLAGS_host", d.getVar("CXXFLAGS"))
+        d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
+        d.setVar("AR_host", d.getVar("AR"))
+    elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
+        # Enable upstream cross crompile support
+        d.setVar("CC_host", d.getVar("BUILD_CC"))
+        d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
+        d.setVar("CXX_host", d.getVar("BUILD_CXX"))
+        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
+        d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
+        d.setVar("AR_host", d.getVar("BUILD_AR"))
+}
 
-# http://errors.yoctoproject.org/Errors/Details/766923/
-# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/out/Release/v8-qemu-wrapper.sh: line 7: 252447 Illegal instruction     (core dumped) PSEUDO_UNLOAD=1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=false -L TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot -E LD_LIBRARY_PATH=TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot/usr/lib "$@"
-# TODO: Fix with gcc-14
+python __anonymous () {
+    # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
+    if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+    else:
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
+}
+
+BBCLASSEXTEND = "native"
-- 
2.27.0


