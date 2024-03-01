Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7482BC48BF6
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 01:15:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12284.1709255723953108637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 17:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3790e67170=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4210sKol025884
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 01:15:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx6678-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 01:15:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG1NJRPWsYbupWI33q3TmotVRXVPrJG7iKMLGl1xGIJNinLCa/s24Hr1TmYwSdBMR2n4i30C03pXQDAk9Fb2SmV5VPzFWUfbj3zYzBfejirb25g0RhV8JHZKC/MB/JLo+HLi3kXjU8b+uzt06gnLdienM3V4mhMs/CUn9ryGhB3AB+HArMZfPj6W/0UerQb/YG9XgyMIIKVgt+4nn6wuAMRI7kCV6eW4/xRZUirqQhdr+Rksm6kLPoH6LBPUu2M2+CXsKFlh871uPMLxsmJRfsmN4OvWhZr13jnKZWNANDbzrIlw/JuD7wVp9/Mw58fyEukgiPqBJG2Q59Dgx8JUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FgjU2tkDvI4rwtkg+sUSIqUbbWw2w+WJPnWW1WAXSk=;
 b=GpnqZc+bOW7hraRN1tLQ7gOrrUic5LBCzUAY4jLekeaxb8/lc3WpuePsbo+It/CI1p/SzXrmFIvLj6LsqmQc58GTm8dcXx0mZo6aVeLjrmoagCMGkthfCkqa6UOcImhr56SuX0VORtXi5DeLSHtzksyJdhs0LTnJ5Gtjqr+FaKXqhhrtUlw7nddBFFJoQF1PIyIh4Eg/6mfoqll4jVJmTWe163j6UCF9gL2h6hMjtwrJSl29oZD05dwewOJQh4SbjXGYJYjT5EcMIQh2IrjmK7W+E8LnngUbV3iP+RaldSCE6HwXFPu9CpmoZwC/oiwWg9yDAX2TuhbGX8MLTOznjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 01:15:18 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Fri, 1 Mar 2024
 01:15:18 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] iperf3: upgrade 3.15 -> 3.16
Date: Fri,  1 Mar 2024 09:54:42 +0800
Message-Id: <20240301015442.2392559-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0227.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd7da6a-6000-4a32-9d00-08dc398d0f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XYFYyIDc66g+uLOU7WNpoKhKAczq3kg+z6yVSB6vLT9Vm6UXO9EfV4tZgatOVhU34MjgJ/8QMMmKskjXvkFPSaJDdOiFTos3/s4ajn2S1Z0rB9bZ3LeQ8qVxorCAMbssCQndyKbUEhd+OCxsekVH5VrSiEmuYSrxHnPkQiUdjQQobYsXwQ1ZGeJstel2HzoJweyQqF6ImNDrje8vmlS1AHWRE02jLaPpXuGHDQSMlOiTyH9pmc6BzdFlx7ROznImhCnI8iS/5cONeG20av0wBLVE57vTWSQJa+vip9vqEeeS5AeG62RbXcZDAuvXXZuXR4f83piogST3FGbQnk80B1MOGIIbxLQwjjyNMCcG+y2Xassa7lH8qtRJchDTThabSPC4YuQS2nNo35tHrFG7k09gfYzUxziZjswV9hRpx+p/cEaqxGZrbiwXeE7kEV5IiGlOjT4irWasEDNAg4l7v9SFxHESKYr7Gs5QTkqFfPBPdOCWhY8lLhFi6YCZ7WdujKup5CQErzPpj3VFrD3Usmzy25tcifs7fGkEApSj01GG7/0iHGfZaOnxIjVgW1eQ+Y7k9eW4EBOtNYJb0I9IvLaVTJIpRNnk4OspcghF3TlK/N9Uap3BFwtHypDqCJlppFjQzen44psTW2WR0NStQBdT47tK0cf4SjylgN92OYBPsYfBCR4EeTnZXt6FpCvJZu1t0Wu8n/QOFSXPZQUeBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lo+F/kcJHb3+xp9tUgckVTaPbfmud6mEIKSZOVY4gbtizSIR40kGqQaBau/Y?=
 =?us-ascii?Q?54lM87K+k3kvY8yO3e6G5qDaT/w4+Lj8cCJXwBSzo/uS4MpzwRzrQHyrR8jy?=
 =?us-ascii?Q?3v73Oma24SsaLtEltNsNMjMhxx81l5glR+AhA7I9vWQ8pGEtO+WhqK7Gz98Y?=
 =?us-ascii?Q?Gi56T4EiQ188nderpZtCH/YDu1fmK7EOeSzoRhQ/enxk0bvwJ5zlsb9WSmQW?=
 =?us-ascii?Q?1B2BIoccqG4WZC9Yfk3JJLqti2+cI18qPk3SAqcXAOhdL3uOgZgC10p9K+Km?=
 =?us-ascii?Q?5dkrFUFeXBMLIgW+uh5O4jidjhOW+UbmWKWSyxStLqkaBFMNC95I2NP3MpNc?=
 =?us-ascii?Q?bBf73v/ASBIP98WHbb3pSDyvusboyCcOpfUeysXGIRRTcPnaoY5Nbhh9Jcmp?=
 =?us-ascii?Q?sEPu/4J56W7h8qHH3Ar0M0AkvXVmKUqXuPBjtho6j3AdzTIKXOz9MN4rhOQ4?=
 =?us-ascii?Q?MKM8z/RpBPZonY6fiSz8jSOua8kVQE3fgf6NHffx5hOSUplcjq044iy565Lt?=
 =?us-ascii?Q?06WJS2DS5i/Ltz9hFTYOh6vWFkouWfOvQWOtIR176JpV51avNXmKstz+cp3c?=
 =?us-ascii?Q?j2Z3YtQI126Lw6PZTtDIQNuKRpya+ArtA1ayC4jAMWqkMIBDUwVqjYI6OJ+W?=
 =?us-ascii?Q?v800+ap65zu5Fn1BapYLXjqGq7Jr4hHpcB2nkSEGHUe5j+yOJtWbBHNhBNyr?=
 =?us-ascii?Q?xmSMlfbksRFTD59nQxE0wpLo6AcJf1Po1AkIcEDxiRAKEcbx5RyQjCQwcgmc?=
 =?us-ascii?Q?YPv+1bD5TJ89+qHRosCN33zP95VMaw/c5Qn/9fqb3jfQlqvrYWvHA4MxnQLB?=
 =?us-ascii?Q?/QzW479cSrhsXluDDnjoCRBea8mFe/IXjLT0BnZI2/5EOCrCZu1FIHIbgLtl?=
 =?us-ascii?Q?/mApjBWrbdkMsGc3o50eb3Iox60cWubspZgMqsClTW9Jr538EmdImnHduO1W?=
 =?us-ascii?Q?/eNx6/2ux9K5v7xLCH+4DU5GxnFspM0TYc2nlF65itXHUrpXeXeVuOD9pO+c?=
 =?us-ascii?Q?qrFnNI1Nxzpm6whvdgJBAvUparNKNCxt4/qqTTOAbfzHNReOaHk98UdHNvsD?=
 =?us-ascii?Q?nWlfqVAzJ2SRgsiDIWEc4SLOjQReGts4HsuHOcNAseh/Zs7LX9kFclqLF58b?=
 =?us-ascii?Q?iJzvkqoE7ko/kDR26CYEfIe26zoUbkOQ8zs4dFeSeZEq/7Gr7ZZRQ6YQup9Y?=
 =?us-ascii?Q?rJBmNfix1cD1Ov+1b82aX435q/IkXEMiZdVFTT21qiFIjyeatsfAl4s2ABMg?=
 =?us-ascii?Q?gEIMxLNZMvegQnyjR20LdFIUpjVteyfKCftcxaerVtkuvQMoYQiAhcQPK035?=
 =?us-ascii?Q?Pg+gO+VdC/9BH8+wtKBp4/i6v9/k9u+gz8giBDRbWjvI6f5iCbI1Zoy5xIur?=
 =?us-ascii?Q?jD+bfRPHtsK7xTjMmgOZGQ1VSCpRVt1mCeVcjpr6x7vCov1Hxo/3hcCmolEN?=
 =?us-ascii?Q?akXdmezVbqMI5+XANuoaQachTSj+UncOgxDVS5ojrNPc2fUgXwZIaGbLMLP+?=
 =?us-ascii?Q?GXL3s7arr0QOSYjklWBHp2M4py/JduGTHcDSs5emXLqk33SprOr1510JIu9S?=
 =?us-ascii?Q?Sytct5PBPEUZ3nCNNSrZ8X4nZiD1e6p93gyRkQWnhNH/2ZLaUoF3D4uDQtuI?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd7da6a-6000-4a32-9d00-08dc398d0f13
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 01:15:18.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjEx56CC8ciFcaoLToXsxLTiRc1HzGmhf7hGLbQlEYJNClF6pfbF7rrKi0cJaHKWSx69np+XLRzZHf8SAFd3KfaCDqN+RDoCdibcu+qw5xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-Proofpoint-GUID: 8Et_VQfkTACW8HjrLM4XL6z3XC-1eEHR
X-Proofpoint-ORIG-GUID: 8Et_VQfkTACW8HjrLM4XL6z3XC-1eEHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_07,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 01:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109064

From: Xiangyu Chen <xiangyu.chen@windriver.com>

rebase patch 0001-configure.ac-check-for-CPP-prog.patch for iperf3.16

Changelog:
===========
    Multiple test streams started with -P/--parallel will now be
    serviced by different threads. This allows iperf3 to take
    advantage of multiple CPU cores on modern processors, and will
    generally result in significant throughput increases (PR #1591).

    OpenSSL 3 is now detected at build time. If OpenSSL 3 is found,
    various older, deprecated, APIs will not be used. iperf3 will
    continue to work with OpenSSL 1.1.1. OpenSSL is used as a part
    of the iperf3 authentication functionality (Issue #1300, PR#1589).

    The authorized users file used by the authentication functionality
    is now checked for accessibility much earlier during the program
    startup, as opposed to being checked near the start of a test (Issue #1583, PR #1585).

    Iperf3 now requires pthreads and C atomic variables to compile and run.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../iperf3/0001-configure.ac-check-for-CPP-prog.patch | 11 +++++------
 .../iperf3/{iperf3_3.15.bb => iperf3_3.16.bb}         |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.15.bb => iperf3_3.16.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
index 09e3d9ca9c..a67be4d4f6 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
@@ -1,4 +1,4 @@
-From 4801363fbff12bf1019aaf90142981702cecff92 Mon Sep 17 00:00:00 2001
+From 80d208e47a525c915e3961efa61ccf91120ffafa Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Wed, 3 Feb 2021 20:44:34 +0000
 Subject: [PATCH] configure.ac: check for CPP prog
@@ -10,20 +10,19 @@ Absence of check for CPP_PROG causes following build errors:
 
 Upstream-Status: Pending
 Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
-
 ---
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index 53a4db4..3462b3e 100644
+index 2594b39..559b160 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -48,6 +48,7 @@ AC_CANONICAL_HOST
+@@ -49,6 +49,7 @@ AC_CANONICAL_HOST
  # Checks for tools: c compiler, ranlib (used for creating static libraries),
  # symlinks and libtool
  AC_PROG_CC
 +AC_PROG_CPP
- AC_PROG_RANLIB
  AC_PROG_LN_S
- LT_INIT
+ 
+ # Add -Wall if we are using GCC.
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
index 156bb5a3e4..5cec4c6874 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "917d2f02188f6f4cdc443df7923a4bde72017d92"
+SRCREV = "f9481e1cd35159929458513692e4a8f9fdd1bd6f"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.5


