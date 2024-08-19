Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A83C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 02:29:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.201975.1724034564281363520
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 19:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8961ed9ef1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J1e2gw001596
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 02:29:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6s9vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 02:29:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA9RFuue0tDC7drIXkrnvz+jd9C5olQNnkyF1GR4i2y2W+o7e3REHk7HJQoOSrqg87VWp0Mls5iI+etYExjbMi8/dv5/42udcacQGDwC3BxTV+GwxYcIF7QkdQ9fLlq7I71NbwkPyLavh6oPuC/VKmHO2Ys6/ih5HYEuR/UcKRD4ufH8tUEAvteIlaGndm3fJL7+F6tAf0cBZv/povhKewJfaz3lZOusmIAPdE51MAZuWrzGq5VnGF9bz5nDkg9exR+90cyqNd5G/9qx1JXfSSxYSs+9yH/2gCyqsHbbawIQWJPcT0PWr+bVuODDlG/rociQ5kGlaXyWhBf0+FmVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMRE0YdhsqogOv/EuhWpXpqfGlq8qZtC/9iBcPP2rwo=;
 b=UF95i9sPxE7YmbHhoxy5alxyQqJC7nXwt+ikwk9vT1ywOlc4Wh2YamAeLUQDjUrV0lBzclHb3MHEQZyCbMjfT10OTtGJJ/vNQYulFWk3lF4y7Dy4cd8LoE6hnoaNdBWN2Ttd+5InF7GkJ9psNaKPf+M+CqJ+0xX5ViBsQNz1YTCh0lTl89oJ6VI/dMlSBAEomGmgtxEx6lLqG31FuCdgvHnef0Z+V/HR1jUxaX9BRZLL2kzvF4Xdd37fF0e6ZjAMZwgQiHx5h+pYYAPS0q/cCAqeYjCaLny9SL6Qi6fWDCqR9+innv5CkXIbvV0cfWEk/+8/9gJbULCtqCUDORz3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 19 Aug
 2024 02:29:20 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 02:29:20 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nodejs: support cross compile without qemu user conditionally
Date: Mon, 19 Aug 2024 10:29:06 +0800
Message-Id: <20240819022906.999604-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 94751d59-b711-4ea2-dabd-08dcbff6bac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yBqM5UQzxnioxNhCK5Q6lHWhwXt4FrxefGJfQbQsi2gnF7Z5TVCOrw7rm8Jl?=
 =?us-ascii?Q?6DgpQTPGA46olYsbU+xN9hd/lR/nsf+NXSBbmewjT7bRUzrmIyDkMSyH7YHp?=
 =?us-ascii?Q?8VQrg0ghCXvtBz3TfVutHzPkCsSZPD89IbFd0Z7JiNz3sEyu80Nk4K7dVzWW?=
 =?us-ascii?Q?/bY04vAPRkIXrikiRc3XunuSQZoBIwuWnFcp3ttxm5mU52pLkGTnH8xM4C/z?=
 =?us-ascii?Q?FlJW5Ze5dwOMXTdsDutuL3zqcmLjL1S+cBAXesSWiaVFrOx24uJ5+fnvaJcU?=
 =?us-ascii?Q?qKwumWOsKkPia3fP5J388pUDPYkYrNjiP3ze5PtbE/bKEP3xq4uTEW6TbB20?=
 =?us-ascii?Q?omeySupdjGdX963d///EcuYW9LSidDc6wEjYkQAs/38xYzJkLtcqIGTh3gOa?=
 =?us-ascii?Q?IG9bSOml9TnT5gfEXuEtxQUiYwxq/MYRb0qxb5cXEgVK2VsuovKIZ8PcNZzJ?=
 =?us-ascii?Q?Ee0K344e7mQy/DNIp/DWW1cy2yEvBHPpvy7Ny2G4escOYQZkW6jb+7gmIYdb?=
 =?us-ascii?Q?9Eob1O33ckOPTMLOgXt46IsXHracIMXxmdeRG6Nm4aQBuFG14cSgWDU3x0hs?=
 =?us-ascii?Q?pJIE6w40xSZrrshF2ESTdGS05fHJ/fqe212lU/gwRBDuLRZ+gSbvuGU8fREJ?=
 =?us-ascii?Q?DIMRlgmmQqqNNsslkFzeu/BjgaAszK3Z9iXAGLz2/wldu8Of4m08DFC4/+JU?=
 =?us-ascii?Q?LF4WFguNHeuxUIwknZ38r6VWvqSBoOv5sJQLxQ62fYjJvToEH+xXlMo71rAJ?=
 =?us-ascii?Q?JwCpkm+UsKLF9uCx9tmKT/iqr/TIzQBd19LtRWq3JWLegmJfUAZAHymw8ArK?=
 =?us-ascii?Q?wO5GrQ+FVYkWP9DfAU8ZZzn/PY4uW793io1P8I/QRwzrEWQ3ORjIcEDZg2Q/?=
 =?us-ascii?Q?gEJD0AfOELvuhsqMauf8EcvRQiVRSzMXI675XH9qOgnM31qXs8z0NjVGUHcs?=
 =?us-ascii?Q?4ib64T6r60OjNJQHbFq21x4Mto2TbAspXYeFE1W9ZGwqg6UpMCeHb7CdWh5y?=
 =?us-ascii?Q?AIFu+5bjX1ZYiR5enimOz9MWwYaQBCu6qMvDmuODQdgG3gxMp6DzQiE/WBHh?=
 =?us-ascii?Q?CToN3vBnTM2yuWEE801P/w0Qff+/d6W+/0UWdUsmqXj5pa2lcC3y30aEAP8+?=
 =?us-ascii?Q?61gY2x5ClPJXCVfMawIZayW+uHEZ6bpAl3Drer8/dFnA1nSPw772PUK80/3D?=
 =?us-ascii?Q?mx/NMkVSXisXVqhZJrU0luOOrviLrbuqImoFtWA9drKR5i+sLs1dzHW510/c?=
 =?us-ascii?Q?UgjGkKm0GdnIvKVoyh8aMH6oeZ9YK5fSau5FLgPc+QEDK+k4G/2k3++1ue0U?=
 =?us-ascii?Q?eQKIZ7DwTg1bEPQK6LjdtC+1qyLZk+tzDtxMLPwGvJZB8Vjpq/KS0M3PfkN2?=
 =?us-ascii?Q?5gZqrNc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F2/N8EbkABwQuOU7ozznWt8eKnkvLtCrI8ffHX1nXI4G75JHdT8/c3z5DeAm?=
 =?us-ascii?Q?Nygo2svbtgbHZEWBwNsUFxSyL2p0gRJ4v0y1g91/5n8B6Sk6gpVG+LipjIVg?=
 =?us-ascii?Q?d245rlTDujudakhxhs0Q2/FXoZOLh01kAW5ZVzv1sDEdsQMi09hu5QLLzYDi?=
 =?us-ascii?Q?/54EcFGviyFbyU2P8pkiigyMXtx4Y+N69fakm2gxK9soZ6WliZ0UrhO3+irS?=
 =?us-ascii?Q?fOOMarKeC36ex8Ms0F6GdOX0ppUm9phVASnzxlJVVb5Zm1dQrMAl1Wv5y3of?=
 =?us-ascii?Q?BDwQyt5p7sFXouOnYyf8PA1ICYfjg2L3LipnPcAiaII5SgdEAI6486kdnLSJ?=
 =?us-ascii?Q?Z3qQCV8k1XaMev4HkijyDwR3oJK+Ce8UrzgBsa71Mp42T1YHCHpKUojqbd7b?=
 =?us-ascii?Q?BC/TQtOqADYShVhbFYE33MrhWpwZptDb7Zpn4z7JfA96NGbkOj96DxRsJbNV?=
 =?us-ascii?Q?A3ie6iCjH6gvrEBQr/dbkXB0z5+lcpYDzr7xwdNyk/J4+5dwQ22tBXeDtUYe?=
 =?us-ascii?Q?kcQZxRF5v1gsH/bpF0SKI2443/vX7DQ49sFzuj0ZJQGyArVcfaembb7pbWQt?=
 =?us-ascii?Q?aDcl1vGUOLYVtGEdsDFsSxv5rHl5QPK3wrY28bF3q0EVks+/lDik+JBm4RJz?=
 =?us-ascii?Q?AEQBl8CUJtZGjVQZoz9fFcDj63MdRDdPCufrqtyWpEc6rogwICQ/bD+6tHSQ?=
 =?us-ascii?Q?8GppdiEVnBcOTmQa9nXA8ZyfsMTUy1hhvJ1V4GbVXVOM7lUCqLoXoX30pfD9?=
 =?us-ascii?Q?6EFXdTQ0hf7UnpTFgRuattmeEC0UppNj0dPlBNLa9jFC7i1h0tO6+C6OrCeW?=
 =?us-ascii?Q?tQ3lpfibG8g9VL3pSHFxKVUMMuIab+2sleqbISWqZKboinmx2qHlHhzzihGW?=
 =?us-ascii?Q?z4K6p9QQ2lM8USWTej9vnu5jQxzwLTGIE1of4FHROq7EvaGVdQjGobWgMUZ1?=
 =?us-ascii?Q?i0Q/N1VhKB9m/dWyFrNOynsk0Np4NMnaIVBMvJzwQUWcFhf3lLI1swEkhBnr?=
 =?us-ascii?Q?6yCIeI/QZXbBEeDMt+sCZ9FHhJovpBNoyg6IS156vuB4e7CrhvCE79XS1jTH?=
 =?us-ascii?Q?udRfCjYc0rBuc3HaCVur+q9eJtupPdTZg0DfihkWLxKhiweJFGgNJvnvFEZd?=
 =?us-ascii?Q?H9RGxDAn7arwj4VJ+qIvJBzI2/pb3XF3W1nIZB3m8CXWsNx0IgEvIwgfmT56?=
 =?us-ascii?Q?RlxwgzuVuPmshM92JXlGEUMc0t17oVNbsiS1AzFvT6H/wE7w07/FSm5JfFIa?=
 =?us-ascii?Q?zVw/n8WZT9f1BkvPZUABhMbe1USkKW3hUunjY/7ArxBgOL404ctTJOFVFakx?=
 =?us-ascii?Q?bRcQIwQk/5ehxuKJ0xnV3MRN5PVwJTmOEGuzY4wfB2y6JCbqdbT1oPrBD3JJ?=
 =?us-ascii?Q?S3ZfGcNX2Op33SxwT2FJH+V8SuztrX9tydka87i8lyAPhlECjkX8jzUXR6Lo?=
 =?us-ascii?Q?Xkb1nb1Kn0qVoxoqlkDtapf1+Hamv8b82SLAGOu/lfj9isoAUzXzlXYn1LnS?=
 =?us-ascii?Q?Jgh+adPMe5n6057GUEDCtZnTNu8ai3c1/KDvbb6sN6XV7uFmI+DDfRqu0hwq?=
 =?us-ascii?Q?Rz6AKqgm/M7draw5PCUqEQGKhcmwPxzxFdOqk6d9pqeaDSeh/B3RFPiu2kNh?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94751d59-b711-4ea2-dabd-08dcbff6bac6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 02:29:19.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKOl6tDCWQVO4B1f9xzshIQ/MVGt+jbpmq85gTAV6oE9QdBIYx202bNfJ8Pvftqo1IOHTqkbrpU6k0I94e3L1zyN3sudqA1h7Es+Wr/dP+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
X-Proofpoint-ORIG-GUID: BJGjPa2Z_9oqkWDLldDpCV4FDWfKGgeX
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c2ae03 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=-LCu6K_DAAAA:8 a=iGHA9ds3AAAA:8 a=4ZzBncWrDg-36LrfSScA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=J-JL0wFkX4TZ9yyCLs2E:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: BJGjPa2Z_9oqkWDLldDpCV4FDWfKGgeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_24,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111844

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
- Add missing native packages to fix library missing on host build
- Rework libatomic.patch, explicitly link to libatomic for clang
  conditionally

BTW, enable riscv64 build

[1] https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7585dc78
[2] https://github.com/nodejs/node-gyp
[3] https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentation.md#cross-compiling

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++----
 .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 81 ++++++++++-------
 2 files changed, 121 insertions(+), 46 deletions(-)

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
index fe7121156..34ec8ad80 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
@@ -5,17 +5,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
 
 CVE_PRODUCT = "nodejs node.js"
 
-DEPENDS = "openssl file-replacement-native python3-packaging-native"
+DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest
+inherit pkgconfig python3native qemu ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE:mips64 = "(!.*mips64).*"
 
-COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 
@@ -24,15 +23,12 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
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
@@ -66,28 +62,14 @@ ARCHFLAGS ?= ""
 
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
@@ -110,9 +92,11 @@ do_unpack[postfuncs] += "prune_sources"
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
@@ -120,6 +104,10 @@ python do_create_v8_qemu_wrapper () {
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
@@ -138,6 +126,14 @@ addtask create_v8_qemu_wrapper after do_configure before do_compile
 
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
 
@@ -179,8 +175,31 @@ RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
 PACKAGES =+ "${PN}-systemtap"
 FILES:${PN}-systemtap = "${datadir}/systemtap"
 
-BBCLASSEXTEND = "native"
+python __anonymous () {
+    # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
+    if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+    else:
+        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
+
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
+BBCLASSEXTEND = "native"
-- 
2.27.0


