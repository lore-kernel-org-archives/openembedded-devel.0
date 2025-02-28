Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B452C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 04:20:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8694.1740716403907222067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 20:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4154738708=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S21QHj028877
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 04:20:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453401r36e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 04:20:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB9nkLAqdbBMeqb5xpFMsC+QHhsT7qUNP2UokeV0sQPp45U4Vctx9zHvXtc8ZxX+AbzD+d9ikHg/jT208K5VMZQ6jd78wORT8A+82i+j7WIGvBKN7W/zzORtIZXBNTRi5EVUDWWAdNQBS96/JASFPzIyev0cXanAJdp21Pyyc0+yAu6A5AJ0y+cVFL8tbckiASkbvWydRuN2GJB4JmCDBXZSPU4upf94vmYvPHEdcxU61+rEEpGm5WPQH9TYgZVzk9tLLnjRbEdVAYiigk6kixpA3xEgP4jLx8GBB5v4hNzFGuJOrjOA4J/r76uXzRw4Vj5e7wLFN/VnppirBKMC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTZ00YCcv6fBTTr+/fe836dB0BXrHWTFy1YJBrqak+c=;
 b=gNJ6TgH9FwC+i9J2LVhe1d/2pHmGGzwdX7tn+6P8+SGdJEO2mCAM0kqbdOSQgHvFT/UeQAUWjtBMYW3uzA5bkn9wfxX7T6KwmBm3RHH9LhDz2n2aZRLVcrdetNQcRXNay0Evl9gHGhLPsqB7yR9Troy/FR3nJo3R5wis5RSCWN5ZmFb2AaFJ+fD19OdqKAQEN3L7LxsEaGOguZoIISVsxADDagGLssnyMb07XZzhSgLJ/XO56asPtk9Pe6UEXWWvO1WhbVCz9K9Uf7XoV9rGteMnW5TDq/23fsUA/5Yz8j+ByGa93quaGFi04D+jYlsJljNOKJLAiwYY2JIOT94mLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 04:19:58 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 04:19:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] gperftools: upgrade from 2.15 to 2.16
Date: Thu, 27 Feb 2025 20:19:45 -0800
Message-Id: <20250228041945.898633-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fc68ee-8134-4ed4-e2a2-08dd57af28f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gVf6VPteyqsCT2zEP0bb7OqFVAvzb60W+6LL/j7GBQ02x0OJGYR1iIEqPTkR?=
 =?us-ascii?Q?MxUvNGVW9WzjAimnKnJCza+HwR1cmX8oG749CbmVWvxLpObC6d67Hx/HCzCD?=
 =?us-ascii?Q?1aK+hFux5kf3q8iVGlMyV0LL08B72mpHkxqecDJXzf7nJhjDJtYR4n1H5j3z?=
 =?us-ascii?Q?bY+2uX+uhNIsxsvDUU9d+6zED4IDPeYtoGI6yYLJreLEGjJ0dbeC+6eDT4TC?=
 =?us-ascii?Q?7ie9wV6dHOD1ToieWgZmfhWr3d558+0Hhhv5yS5WPOTeoCANMTSAIo3VMhja?=
 =?us-ascii?Q?RhmYYAvBJTyW/HldFnb8Syrk73LvWWP/9FZ+M/C0mslmEzztaWDbzBvFNO3i?=
 =?us-ascii?Q?PXgFhFK9C0NUdAFi/jSM5H1zDg6t7Ud6p9CvJ3lxrtWuUldcTbOHxdWFYCtv?=
 =?us-ascii?Q?8FfGrVSCc9dpe5bvUj/aAVr57+b9EGSys7Vq8M/v9+yQEv2rOgRuF5bdj3BC?=
 =?us-ascii?Q?neYsgUIybP2rrvo1g84vWVj7gv5NsuP7XygOtYFDjJeG9eTQmOzfuGfFIzWg?=
 =?us-ascii?Q?SoqnJ+ZNwB5J5ez4eXAGgToviqZW8WYj72IRjFlk9QXTLCx20vqriFbO96Y9?=
 =?us-ascii?Q?d/0CnkwAwJ/MFIcWBMwKlDTcSq248FrH+3r/H7+mdVB8rGseDWdj+2Et9CvE?=
 =?us-ascii?Q?mrHH5XUQVOVCRrsm3JnUWOKwDuBwwWZK3LAebbLbxyxjcYn8Slv2W2KRBq7v?=
 =?us-ascii?Q?zDfdcq4DyFmMW2Ygberw92KwrqRZzUXatbyr/E74jvOW0SO9CNwvJ36c+QO0?=
 =?us-ascii?Q?lAZ0lVxIVpfQO8B87g/VsfJ+CVjmgPMRbpE0kFhedA4Hty0sx8QVFmMe1pJQ?=
 =?us-ascii?Q?rQbemfjiQQ1qdMY2dA6jO0Oddg0MGX1KmAGV4arQ5ouAcFJhixU0cNYW2Dn3?=
 =?us-ascii?Q?su4jCcVV3wPsQSN2Ct3grlO7svToIuhV3RRkWQPonY6aQcJJwX+FlFd4dnsm?=
 =?us-ascii?Q?vGS0bduZT/I6zoxQFvDJGfy/DZQJVouT7mdxDpiv+nJFgjMFBpE3UToJqDKL?=
 =?us-ascii?Q?+OfD3yMywlkxJrIAIzXFwEtLNvoCLa7GRxgYwYpNQ8kTzIBStsvJZWo91XTX?=
 =?us-ascii?Q?YBnu8gZUVZWWfmxeaSc+/W2E6DF+sF16vqjWZKjN/TmsccDOdpxut527PKaB?=
 =?us-ascii?Q?u8Pl8Z6BSAPsDh3oWDa5TtM58cGyySRva83ReaNC/RjuKlowDq/x0PNv44Nv?=
 =?us-ascii?Q?WSpZGEDTIfImgeQ9E+3Dk4eLbeYahJ/6WwEdWiC0YVDkRCKb661HA3ctr7T4?=
 =?us-ascii?Q?C+VWqBnZ7KsnWhDRgU6l4Cf9Ln0cipZRs48bqLLn+IhciqPtNfyo0nWY194p?=
 =?us-ascii?Q?VC11Isi3n5N32hfEQnw/sMIUNcv9650NR1Kwta9Cq9N5I0k8zE1YLWJ4RpUR?=
 =?us-ascii?Q?AwJqUL3mh7qm8JYh6D2mslZ4M/FQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YHIEilOM5c/YWyQGmjLwo34MRkfQk6fyuwdne3FBLDK4XvRWN+Ad4Wf+2NlD?=
 =?us-ascii?Q?f0j6oqHV7RMTZV6Vh5EM53tgatWlls9yBnksHplApFBblLEAjDRso8uziFOt?=
 =?us-ascii?Q?0w1XfS07dEGnoWAFXH3cDhV5uXQOGreGPap8aoSf409OH+DDi99ffxJz0xPI?=
 =?us-ascii?Q?3Mp4mKbH1S8S233xOzWyEj8hOcK7fpVdRlAJhWf7dNY3uFF/ry/xKakG01/w?=
 =?us-ascii?Q?0iUTnsPPJp/YFEmuS5QlboDOvXZmw0W3UyluWPG97/MbsMbVCWeUyNUiXXml?=
 =?us-ascii?Q?LdPuqsx1JoHrwLiyoA7wRMrz8th37O0jE/jEVd6hvN/XODU3iHH+CCLM21+5?=
 =?us-ascii?Q?rlghreR77JCtGboc3N21UAlp3rRNaiqyTFexWQKUUYjTAnLXYiZhWQpVnlnA?=
 =?us-ascii?Q?HKtQx+Uzkm9I4FaUqmFWYhx0XXlR42jRVUmwX44qrc1i9fjlHOGGtTZ5WskG?=
 =?us-ascii?Q?sj5miEY/IrDT1wr2j8GkzQOg2N2sTD/ZgrLB13EhADIEguL23q9NNvu9s0Ke?=
 =?us-ascii?Q?YX/nEugdDgjS8i2L0M6/AWn+/PMEM4jYjKFkzBHBfZN/D5hNmriTWL+gfZcv?=
 =?us-ascii?Q?nvDt8VOjU6eCpzOnc78mwLmnbMPHe2U6MubTRLcE3c306GDJcC8ua5TSGQ9I?=
 =?us-ascii?Q?+K0URM3KKways+Zi1XVG92EXw1iMkINQeBtQVqZvRpwWJGtYAnVsGfeO9mFF?=
 =?us-ascii?Q?36Nd1Dkr2HccntRZU3F/g3Tm36+CHUlhFYPRFI4MDEboDxta81aeyEduWJjg?=
 =?us-ascii?Q?2QyjwEMitZaKDmWylwtfJWfPrlYJ6G34vfh4WdV/kNkbYyDpw9M10bGRht8Y?=
 =?us-ascii?Q?d743eANlDR5xeAkd+twBjlnRiBCcgpYebHl8Sk//Umce4R4lMNd6jAXXaSsO?=
 =?us-ascii?Q?2p0UGR0qt7AHgE1hjbB1NXAhA/xud7PbWG7rZn3vAcTXTHLWRH+oG47L9mGg?=
 =?us-ascii?Q?vKc3CSbqFVB7o9V/xTZdJmkmijuzRjm6EKRCX5zhVBXFqjEfMrJz26jBhdWL?=
 =?us-ascii?Q?rG6ekYhjvJj+JQVlJCP8ICRJK6m6dbfzNzkWVDR/+jMWFYYi/OSWZUc78q76?=
 =?us-ascii?Q?/jovZjIasQrLksaFAdE97GEGZEW/sbvGpvHqk8ZlWypays9MigioY6Yf/cJr?=
 =?us-ascii?Q?jgssLvEWD3uIktJObVVoqa1T+Wh8cXvrD2mzSWaeMUXKZ16p+rlOFNI6tV4f?=
 =?us-ascii?Q?0Ls9ceTAtmKy38WkIWwCfjJvgdHWMMExWzN4b6E8/W1gtoPc8oAkkR05kb/k?=
 =?us-ascii?Q?mpQ1Yo4FgariEJ4hIMT7fw5ipQuswiceGSSE7s1P1SivW2Ld7XWlTeeP0PbM?=
 =?us-ascii?Q?gVLXi26YeG09geeyTZqxzDgx7yHktz7K34/T1MwhxLQEz9c0kiLGp0uJu1cf?=
 =?us-ascii?Q?nTIXGJ5a7WVIaslhkaOyzNnc9doJI0+BZtpHcwwuAXWdYSPK8T5cCnNLwZ0K?=
 =?us-ascii?Q?yFqWySwGgys997fMm6/tHx1Hb7KNR5EdQchF2r5IthcaJ1Al7qDXPNXOo5h0?=
 =?us-ascii?Q?ne8iC22Mkr8QpVZQzPWH9Keilb1eXU4dG0/whAFVQjMnHCxLM/QdU1I4564G?=
 =?us-ascii?Q?ged+IDaDyvMtxvRrvZJFCKMwrksqJZC5gklDqlL3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fc68ee-8134-4ed4-e2a2-08dd57af28f4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 04:19:57.6723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18bBg5pOWry3bvSxRNe9sPiupT/lS4rCu5/x5YBSbXPKu1P0RpezlNZyqoSbtPThPFvR/nXd6iEKm1L9ue5K4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
X-Authority-Analysis: v=2.4 cv=ZIgtmW7b c=1 sm=1 tr=0 ts=67c13972 cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=JMnnF-g5AAAA:8 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=XnolhBs0zUJzNUTT2YoA:9 a=MIlUOSWcqtxlsnWNI7We:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XMMvpowtLobnFt23VmUEe8ZK3PMxkA0b
X-Proofpoint-GUID: XMMvpowtLobnFt23VmUEe8ZK3PMxkA0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502280028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 04:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115708

From: Chen Qi <Qi.Chen@windriver.com>

disable_libunwind_aarch64.patch is dropped because from my runtime
testing, this patch is no longer needed.

0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch is
dropped because I don't see it necessary now. Things still build
without it.

0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch is dropped
because this oe specific patch is no longer needed because of the
following two commits:
02adc8c also disable _TIME_BITS in mmap_hook.cc
198b3dd disable _FILE_OFFSET_BITS in mmap_hook.cc

ppc-musl.patch is rebased.

0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch is added
to fix build failure for musl + ppc64.

0003-Makefile.am-disable-building-noinst-tests-for-musl.patch is
added as a workaround to fix build failure on musl + ppc64.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...checkers-and-debug-allocator-on-musl.patch | 26 --------
 ..._hook.cc-Fix-build-for-32bit-machine.patch | 59 -------------------
 ...-elf_mem_image.cc-fix-build-for-musl.patch | 35 +++++++++++
 ...sable-building-noinst-tests-for-musl.patch | 32 ++++++++++
 .../disable_libunwind_aarch64.patch           | 28 ---------
 .../gperftools/gperftools/ppc-musl.patch      | 14 +++--
 ...{gperftools_2.15.bb => gperftools_2.16.bb} | 14 ++---
 7 files changed, 83 insertions(+), 125 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
 rename meta-oe/recipes-support/gperftools/{gperftools_2.15.bb => gperftools_2.16.bb} (86%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
deleted file mode 100644
index 2ea54e48c9..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 06605158852f9364519391fa11070ba5ec4303e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 08:07:17 -0700
-Subject: [PATCH] disbale heap checkers and debug allocator on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 68fd51c..4cb71fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,6 +53,8 @@ case "$host" in
-              need_nanosleep=no;;
-    *-cygwin*) default_enable_cpu_profiler=no;;
-    *-linux*) default_enable_heap_checker=yes; heap_checker_supported=yes;;
-+   *-musl*) default_enable_heap_checker=no; default_enable_heap_profiler=no;
-+            default_enable_debugalloc=no; default_enable_libunwind=no;
- esac
- 
- # Currently only backtrace works on s390 and OSX.
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
deleted file mode 100644
index 1142df0be9..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d675808d300278a9e7143428cfecf3fda61cc9a2 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 21 Mar 2024 10:59:29 +0000
-Subject: [PATCH] src/mmap_hook.cc: Fix build for 32bit machine
-
-Fixed build error on 32bit machine:
-
-../git/src/mmap_hook.cc:309:31: error: static assertion failed
- 309 | static_assert(sizeof(int32_t) == sizeof(off_t), "");
-
-This is because oe's off_t is 64bit on both 32 and 64bit system, which is the
-default value of glibc, so the assertion would be failed on 32bit system, and
-remove mmap() and mmap64() to fix the redefined error.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/mmap_hook.cc | 22 ----------------------
- 1 file changed, 22 deletions(-)
-
-diff --git a/src/mmap_hook.cc b/src/mmap_hook.cc
-index 0a0f62f..27425e4 100644
---- a/src/mmap_hook.cc
-+++ b/src/mmap_hook.cc
-@@ -302,30 +302,8 @@ void* mmap(void* start, size_t length, int prot, int flags, int fd, off_t off) _
- 
- #define HOOKED_MMAP
- 
--#elif defined(DEFINED_DO_MMAP) && defined(__linux__) && !GOOD_LINUX_SYSTEM
--// Linuxes with 32-bit off_t. We're being careful with mmap64 being
--// 64-bit and mmap being 32-bit.
--
--static_assert(sizeof(int32_t) == sizeof(off_t), "");
--
--extern "C" void* mmap64(void* start, size_t length, int prot, int flags, int fd, int64_t off)
--  __THROW ATTRIBUTE_SECTION(malloc_hook);
--extern "C" void* mmap(void* start, size_t length, int prot, int flags, int fd, off_t off)
--  __THROW ATTRIBUTE_SECTION(malloc_hook);
--
--void* mmap(void *start, size_t length, int prot, int flags, int fd, off_t off) __THROW {
--  return do_mmap_with_hooks(start, length, prot, flags, fd, off);
--}
--
--void* mmap64(void *start, size_t length, int prot, int flags, int fd, int64_t off) __THROW {
--  return do_mmap_with_hooks(start, length, prot, flags, fd, off);
--}
--
--#define HOOKED_MMAP
--
- #endif  // Linux/32-bit off_t case
- 
--
- #ifdef HOOKED_MMAP
- 
- extern "C" int munmap(void* start, size_t length) __THROW ATTRIBUTE_SECTION(malloc_hook);
--- 
-2.35.5
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
new file mode 100644
index 0000000000..eae71be8fc
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
@@ -0,0 +1,35 @@
+From 02ff9fcc74ba64aeb22fcc553f30657bd2b62930 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 26 Feb 2025 23:46:56 -0800
+Subject: [PATCH 2/3] src/base/elf_mem_image.cc: fix build for musl
+
+Include header file for musl to avoid error below:
+
+  error: '__WORDSIZE' was not declared in this scope
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/base/elf_mem_image.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/base/elf_mem_image.cc b/src/base/elf_mem_image.cc
+index d2ca1a5..89dc0e4 100644
+--- a/src/base/elf_mem_image.cc
++++ b/src/base/elf_mem_image.cc
+@@ -38,6 +38,11 @@
+ 
+ #ifdef HAVE_ELF_MEM_IMAGE  // defined in elf_mem_image.h
+ 
++// for musl __WORDSIZE definition
++#if !defined(__GLIBC__)
++#include <sys/reg.h>
++#endif
++
+ #include <stddef.h>   // for size_t, ptrdiff_t
+ #include "base/logging.h"
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
new file mode 100644
index 0000000000..01ecdd5336
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
@@ -0,0 +1,32 @@
+From 3bb5707c6a6a0d2061c79c556cbe4a87efea02ab Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 27 Feb 2025 00:44:34 -0800
+Subject: [PATCH 3/3] Makefile.am: disable building noinst tests for musl
+
+Build fails for musl + qemuppc64 about ld failing to find
+symbols in libucontext. Until a real solution is found,
+we need this workaround.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9fa24c0..7dd1b60 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -938,7 +938,7 @@ endif WITH_HEAP_PROFILER_OR_CHECKER
+ # This should always include $(TESTS), but may also include other
+ # binaries that you compile but don't want automatically installed.
+ # We'll add to this later, on a library-by-library basis
+-noinst_PROGRAMS += $(TESTS)
++#noinst_PROGRAMS += $(TESTS)
+ 
+ # http://linux.die.net/man/1/pkg-config, http://pkg-config.freedesktop.org/wiki
+ pkgconfigdir = $(libdir)/pkgconfig
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
deleted file mode 100644
index 15eacc8993..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 564f800e3e24647c095f7a321bf3ebdccfbf762d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 12:02:04 -0700
-Subject: [PATCH] Disable libunwind on aarch64
-
-Fixes hangs when using libtcmalloc.so
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,6 +76,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [re
-                   [default_enable_libunwind=yes
-                    default_tcmalloc_pagesize=8])
- 
-+# Disable libunwind linking on aarch64 by default.
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [return __aarch64__])],
-+                  [default_enable_libunwind=no],
-+                  [default_enable_libunwind=yes])
-+
- AC_ARG_ENABLE([cpu-profiler],
-               [AS_HELP_STRING([--disable-cpu-profiler],
-                               [do not build the cpu profiler])],
diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
index 800fa3a84f..e5061840bc 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
@@ -1,20 +1,21 @@
-From 328805fd16930deefda400a77e9c2c5d17d04d29 Mon Sep 17 00:00:00 2001
+From 1526be49b8c49719459ef15c93090fdbdc10f3cb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Mar 2021 00:42:25 -0800
-Subject: [PATCH] Compatibility fixes for musl.
+Subject: [PATCH 1/3] Compatibility fixes for musl.
 
----
 Upstream-Status: Pending
 
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
  src/getpc.h                        | 4 ++++
  src/stacktrace_powerpc-linux-inl.h | 8 ++++++--
  2 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/src/getpc.h b/src/getpc.h
-index 87d18b6..c569731 100644
+index c14c9d0..cf4866b 100644
 --- a/src/getpc.h
 +++ b/src/getpc.h
-@@ -68,6 +68,10 @@
+@@ -61,6 +61,10 @@
  typedef ucontext ucontext_t;
  #endif
  
@@ -59,3 +60,6 @@ index 883e7d2..212bd25 100644
        }
  #endif
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.15.bb b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
similarity index 86%
rename from meta-oe/recipes-support/gperftools/gperftools_2.15.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.16.bb
index bd3b2afaea..2b0fb534b3 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.15.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "365060c4213a48adb27f63d5dfad41b3dfbdd62e"
-SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https \
-           file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
-           file://disable_libunwind_aarch64.patch \
-           file://0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch \
-           "
+SRCREV = "e1014dead2029b341d06027b4f2b5562d799d5b1"
+SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https"
 
-SRC_URI:append:libc-musl = " file://ppc-musl.patch"
+SRC_URI:append:libc-musl = " \
+        file://ppc-musl.patch \
+        file://0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch \
+        file://0003-Makefile.am-disable-building-noinst-tests-for-musl.patch \
+        "
 
 inherit autotools
 
-- 
2.25.1


