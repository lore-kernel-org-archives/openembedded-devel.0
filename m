Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3A7E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 08:45:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26558.1735893942549110498
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 00:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3098ebf39c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Q5e0024298
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jan 2025 00:45:42 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg7cv34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 00:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXpBzYzoU3ROVZBYYrii7h/VyZZKBlvT65eeFywcJWqSG2FJzz9Sb6N4/kNm8MKN/nkYXlry4cGulSM06fEVTc0PArzynXI2r34u2yPI6VUcjcE+Cfar/70gA7029OvsdeygXJ+HTe0zZUgBMraWbWagthgm3hFMcWz4BGZLZV51pkpS/Jbn+ROi6qQerlbETHqqIMg+5ULgqre9Ceqe8ggcy/dcx0DZVUZpskfgfDh1HVw1lXsmOAbUKLUQJSXTEcDhhUVq/R2P9SwwaLwLbEV4U+XCaa3TM1mf5Rk1GBIGnmAE9crmVWocBqHz4evKA6ovfkFnp09XtZCboplM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpfVQFMy/4EfT3aeMGtoCb6jNpuE9I0YIilk3MYTG3Y=;
 b=JLNTpUZKd4qRBJy+n8ZwAvxUGv01TPykGfGxvVNtJGof8ThKWjl/s6M68CXm67tTw8T+Ys5IDsOqlw6Y4NwYh2R4jp17+rh8DtKQhAPATb3uviThX9KX3QTWuADjcUx78fzYYebgN8eOSG7wmO/5rdbGZgYdpwRsvLdXJZi8w0BzfsaKGqq0YTjv0vpsRRoIlokgDQSRKqkUizVdwOizHwduujNHDqbB8COw42mQwiMD71WlhT+44YP+CDUpLBsaxQEU+oveokFP7ey8w8hINfFxHpbCDl86iEfYdAfQSlrh/C6EXlp/xcagQabz6bes9xB1dDn+ephClHddbq1FyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 08:45:35 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 08:45:35 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lapack: fix TMPDIR reference in do_package_qa
Date: Fri,  3 Jan 2025 16:45:25 +0800
Message-Id: <20250103084525.1990937-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 552d57b8-25a0-4ecd-6701-08dd2bd2fd46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+8tfkdz6+UUuv1CkZvMOG43ygJGeqBrPhVAXWo2V7K76zBMVSLfFdQIx9H4p?=
 =?us-ascii?Q?yvP85E3lWt52Jf01nGiKNTzgm3dyAwr57Eb6CYGgekrv9JliZLMP2d1Q1AMo?=
 =?us-ascii?Q?hjfejOFUy2mScnX6nkY3ySbRUyjV1OqgTZSSQeUbK6MSlfgLti+S5il0owcY?=
 =?us-ascii?Q?6F0mKZ3s+aWD0tcSg8Pbx/HDhYEjleDukhIYaADwhIE6bfdf6TH+lfsbdoih?=
 =?us-ascii?Q?sOQZ7RikV9B7K2m9JSS5YrMvQTByY2xaPMlRj1BFFH22YGK7fpmvVklvbK3G?=
 =?us-ascii?Q?+rrdEQsbeleLAi+xrapqNZfZTzBJE4u/hg8hvUCFq5FkmW3TwDI31FbgE1a+?=
 =?us-ascii?Q?73N6ppf9l3HE2Lw/9kpwGPIjoRbVLpkhBFBgH1xkMRrTFWA78TdP3asf6yPg?=
 =?us-ascii?Q?JEjo0BIc3ZblmPR6YzJn48qMoC7v5duOJMymzMSqxAtteS3EXPSp7W50fiw2?=
 =?us-ascii?Q?fB3krKhRMq4LRYdBa9tM57lvZUaRDFOMgqq660eTfrjldNNvrX1v8hqWXeYS?=
 =?us-ascii?Q?5APj2CjujdA4uLD0cPAwi33TKo7UuRbeCenGK4zIdYaANn2Cx6HVah1rPeg4?=
 =?us-ascii?Q?N078cftdAbSKZrdr9ZEw9WCFe49QSf0XS8rspeZf2XgqtYuFHBICoHNnAq22?=
 =?us-ascii?Q?DTpkPnaN+hDmlSu2mBPgv1ncIRhO5OGhf2Q+HGVYPbxTzngy9J6xDzbaj0Od?=
 =?us-ascii?Q?lbxOLZgc6z/60j2ICfEOc9sRLXfmr39TFJUYbbIKDBhzNVLLauSJC5XQ6IrL?=
 =?us-ascii?Q?NtV7wxT4Fs7RfWEOa3SW84qtTbx0IFWlyRwrAI4smIiL8AFOWvNKsVo8U3yy?=
 =?us-ascii?Q?EV3TcEQzvgGz8KEMipcSCv4W3S1bckDyuuE7OwjhzFfn9o5FwSgu2KN/OCjr?=
 =?us-ascii?Q?NvSkKQgKF3EVUMS+MypYweq9XLJLcISIA7a1iwAbD5kzWPHe0AcFNXQ3OA36?=
 =?us-ascii?Q?B9DpZOMpwuvgPTMM2hGIhzTS97woe9ZkWmI8WXI3hRQcMMHqUN/Q8KAMVr1i?=
 =?us-ascii?Q?K0kJwxqoTFXxjQnBJkAQeML6FRHnIR7/J4mz2c1nLNCqpHlzfEo2x1pmwp6O?=
 =?us-ascii?Q?ZHgmxkDKbyNC+pjk6J8ZvF5d19Corx/Nz84qpmCb5TPCp2sr9F6kVWgKaP2o?=
 =?us-ascii?Q?I8glTPYJGeaIA2CofFEAcYVZuggZX9lbclE2pi2DQJ29Os4M7GGJ/V2e4eYq?=
 =?us-ascii?Q?wErKQw/vlF2DlW6Al+Bi2zIYBBxbj+/y3DIMKU9aoZxEOGqzOAC8Xqx0crbe?=
 =?us-ascii?Q?nrpov/w0ZWWqsDmm/psfQiRdzaaPuHd86GZqeB4dPZ53pMFzGlU//ejGWY6Q?=
 =?us-ascii?Q?Gkbnr2irPjC5FaKcuInK4him0XsaKNg8w2VetvZRZQmMsd44MJ7+wKY241JZ?=
 =?us-ascii?Q?US1WIf3YlzBFjjHMIkQMCVGEv5pEkC5tFz0d6p+vW4ymRVd6cPBQ1eMXWR6m?=
 =?us-ascii?Q?zt5qho4wVyz0TTEa8ZLDIf6PLTYmMWuB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YzPfgh+XbxcD+O3lhKtjL/xlIdvWDYxqtgTQ8qgGaSnFOO+1FQuDn5n1TR7j?=
 =?us-ascii?Q?l+A4E++tSf9q5xI3u408Kh5uJH6IxEcw8eCuJfrXVbVAvVl/P7HFnfmSeY03?=
 =?us-ascii?Q?pZ2zxKHBCDvuJ8xsi4cpVKlpDRdQKXfmfY32y+JT9CqcFf2UHAZRnGYVPlWa?=
 =?us-ascii?Q?r9KvM1QZ9IRM+/Rw20i6WcDf6WwXUaMPv2WjgB/Et/MGfRoqeagA2VQq4VCV?=
 =?us-ascii?Q?RgLuQWaCGOq/JFFLlkHrI4aXcZFC3TmOp55p9T2Ws1LUTkx6iwSNx6l5hF94?=
 =?us-ascii?Q?rwOx/f00V9Jz6+E3jz7MCEOmoXM5tD1FSe45x5aQYWzQcJvbZTOJfqsk82Hs?=
 =?us-ascii?Q?k8TZ/UNnxoKIPBDpI4FcbbzMKTfko5XxcNyBIh5KNVewRjp4c+y9YgZdHeeB?=
 =?us-ascii?Q?P9MLEoRydh5Z93HhU9l0uLhKpY5Vr4n64u/NAveN5fwLuQzNxaH0b+dVm1VJ?=
 =?us-ascii?Q?JEUq3zSFhl683CcYXHXajc39IXoWqmkX4fEVsw+6Blr6lXx97n83AQPOsA4t?=
 =?us-ascii?Q?pucf/3FTGyE3s0yEhB9PUFDoH+5RuGsSl7s0mEr0H2ziKEqNYWqtjUI+6sbz?=
 =?us-ascii?Q?wOtUgPV1Ybv/R91PzCfJIsvhywi5ynZ0zO+d9WsGPgPEszHrDCeOgGl+rwxN?=
 =?us-ascii?Q?33SrfKMxJzhJnEF9/9qoE04W9J1v+GM5vRI9M8piv7eV8IvpIoyNd9HDGJiY?=
 =?us-ascii?Q?e9YMTNfE63+IkSJeQEWAyNvyzLQL2ROL180z12MpyuXdFf8TYdeA5TyMgCLT?=
 =?us-ascii?Q?qmozSY/vBF/qkJyoPZ0XyWNPZXJ0sYUsiwBfPDSqxUB+69BPcebgJTJUGn0N?=
 =?us-ascii?Q?1FO8qGcyUDvTkdRizyRLL+qokgqcsWJOKykBNr0ZlKmB+CDMTSQkLcYRxbbW?=
 =?us-ascii?Q?o0B8GqBfr0aoFC0r/vEAyBTIy4tS+pvbDHkLX4Rc0MK3QPX/TiDAOByvh9YB?=
 =?us-ascii?Q?R1xwr+xvonRvY9P/l+fIM3pezhhZRUBeYX2nGQvdlCFv9+0VHWzxT/5yTcEa?=
 =?us-ascii?Q?DYodpheqqdryhnAaLkLz4BwIrHMEMygw3hMe+F7DaunGcvi7Fi7MGnoya3WO?=
 =?us-ascii?Q?Abm9xXK2yaf9nOdKZM+jpyVQdzbccYqJMBxJNhaDZ3egomLV+Aaaq2dwC8sC?=
 =?us-ascii?Q?uMgE73lr0DfaY/r8yiG2nI9F3RYTLJ1OHp/t/lBpa3JsaM3VxxNDmYoYcbjk?=
 =?us-ascii?Q?bwTtw/QR1zIHSDFilGtn0wbSoTohVgrazKODluhZ6CwViB92BxP9Ih96fpIC?=
 =?us-ascii?Q?ogaotr7n/Cm3l7moczLkRdW2moXLbJLTQfA3IDjzD0aIykAT8tWni4ggxmTU?=
 =?us-ascii?Q?QgRLKbYK+Y+tZW/JImKG33LWCrd3sEegTi5B3T43T+xyklIt/9U32G4w8Ene?=
 =?us-ascii?Q?H25du+gvLz1I7HlwKA+9Re3S1AHdtvrV9C1IcH+7B28Ly/LBtPExb4u5d3T0?=
 =?us-ascii?Q?SoLwpI7vFNvcaettZYjQH6/fJwtnbt28dh7MG6cGc1rXhatNiiPxl1VjmwO8?=
 =?us-ascii?Q?yAFJmw9KwK4GeBFo/u0J2Erq6g2Wk7ffj5L4WHwGYyU7mMpUvd4850tBzM3n?=
 =?us-ascii?Q?8w8JW7dCYlbX+5WPC8Bi+g3N5XpCrOdIH32sgxRMdEhfpLrK338QIPXYmz0N?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552d57b8-25a0-4ecd-6701-08dd2bd2fd46
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:45:35.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GOBN8h7tUM9ULR4FiZxRnR6ogoQ7QNt3zaJS+D8xSHNnq3a8rHW00OmSzuj2V8us/NIK4S4FX8cl1BxMSxpkszvULPjBBzaNru86rk1KQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
X-Proofpoint-ORIG-GUID: dwVs5zRQChEN-zOZF2lVm70zZHeFUT7o
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=6777a3b5 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=d1uV1jnDQPEVv3YhUksA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dwVs5zRQChEN-zOZF2lVm70zZHeFUT7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501030075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 08:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114623

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When building the `lapack` package, the following QA error occurs:
"File /usr/lib64/libblas.so.3.12.0 in package lapack contains reference to TMPDIR [buildpaths]"

The issue arises because the `xerbla.o` object file embeds the absolute host path of `xerbla.f`.
This occurs during compilation, where the build command in `build.make` (generated by CMake) specifies:
`gfortran -c <absolute path>/xerbla.f -o`.

As a result, the absolute path is included in `xerbla.o`. Unfortunately, `gfortran` does not support
flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such paths.

To resolve this, the fix involves replacing the absolute path of `xerbla.f` in the generated
`build.make` file with a relative path before the compilation step. This ensures that the
resulting `xerbla.o` does not contain any references to TMPDIR, passing the `do_package_qa` check.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index fef9d3a80e..ef5726eeaa 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -33,6 +33,29 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD = "1"
 
+# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the options
+# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfortran does not support them.
+# To address this issue, we manually replace the absolute path with a relative path
+# in the generated `build.make` file.
+#
+# An issue has been reported: https://github.com/Reference-LAPACK/lapack/issues/1087,
+# requesting a fix in the source code.
+#
+# This workaround resolves the TMPDIR [buildpaths] issue by converting the absolute path
+# of `xerbla.f` to a relative path. The steps are as follows:
+#
+# 1. Locate all `build.make` files after the `do_configure` step is completed.
+# 2. Compute the relative path for `xerbla.f` based on the current build directory.
+# 3. Replace the absolute path with the calculated relative path in the `build.make` files
+
+do_configure:append(){
+    for file in `find ${B} -name build.make`; do
+        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbla\.f' $file | awk -F'cd ' '{print $2}'| \
+                awk '{src=$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, ""); obj=$0; print src, obj}' | \
+                while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
+        done
+}
+
 do_install_ptest () {
     rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
           --exclude CMakeFiles \
-- 
2.34.1


