Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB1FCF07AA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 06:01:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36996.1728540079629268502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 23:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0013e89f0e=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A5EpfS008095
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:01:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp45dck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:01:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbHd15YgIvHq8bUVZysu8IpHOfdhPioRrI0zyTPpCekmlllQ5xMzYbIkPdgs7Hbyh/KQ61dUB8aN1t2ta6eNS8izAXnwBsM41lJYR4KIPpYK9SHsAtr9HpxYf58u/5evNcsnGN3VMUpqRbUtp+/NDGqIKGQICrPKzLflKfwOW2IyzyEztVbaPuHU+qJazyTp7oWxOsBBA0sdqnodMzovdMV71hMx4J7YmHdEPN7bvkWU0H/jA4fjOVnEjTVLBjSocKi8hm618lvIvmBJC48jHbQvXZM1VW/W2t0ZuP9zP9ZhS7ZI/d2946nwPsfKNXr43jaCiFb4Tdwc1/uNikfa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLjki6A1Yx811PYJlJTAYbpmGoXxI9siaHpNxyVYX28=;
 b=MEtw25XQyUa1W6sVRBgC/16OhXKIWyD3vBFxzKoaJVy5y4+jsBkGDvMR0Br0uMjBdGaWgrqUqFWuGpketGBWSUpcp49EwY0fK5d1H3Se11qmZa2+O2ms0kZVwXLU5PqSb9vtCLKDG+utL05aBcX5djUiwMWAmSvBO4yRsakgbL51x0a8FuiO0Oo8d390Mlf1zBgyYwFiDTzOFysjA6j8SC8frCnChFxaAzwDWbZprHK1gQsLO4mqPGsGlfpwqf5qGWf3gVrvRuj2PHnG0CYV1x71SG1KTVS1LwRwRN/tADmGE+tFRUDoRhPkwiATSsGAtuGPM/8ia2bbX4MVSKmH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 06:01:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 06:01:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jansson: add JSON_INTEGER_IS_LONG_LONG for cmake
Date: Wed,  9 Oct 2024 23:01:01 -0700
Message-ID: <20241010060101.2621699-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR19CA0021.namprd19.prod.outlook.com
 (2603:10b6:930:44::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 3424ff5d-a729-4f09-0f36-08dce8f0f298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?joR+3o9aw+YnxVMTVQrbC3wq/ENfT+qjdx32Wx+S9OMspssgyp3WI5Sb1oqq?=
 =?us-ascii?Q?gghR2Mn6V9wHy6X5l4xh1ZAxpriSGY+gJsgNmE/ZpaEB2ajwE+Vu+NrOtAQ3?=
 =?us-ascii?Q?3qSppTSpmvCXgqNRXmXtl2mof76MTVSMIhCWunjmsJeXTieTvFGjda08s0QN?=
 =?us-ascii?Q?7YJlFOSu4Og9TFxq6jS6tlDFMeAdCAcBCxKN/huPljPJEYBnFN0ZJWZdeBAq?=
 =?us-ascii?Q?qgOy4+HRD7omEmGAtjGyF001vEzyuj58gwWQE7Xh6X2FMa5MMmM8wlpaqTSn?=
 =?us-ascii?Q?jng5wPdClRdO7roxW0bLM1N7K+HOxTiPYdkPufhN9ijMuMG2JiTpCJhBMtkz?=
 =?us-ascii?Q?GdGbWzkvucTcPlG9OSuzJGYNUh2/TwQS+oRuPuGOWg730Aoc88PCAPNqgGqn?=
 =?us-ascii?Q?Awh3gPuqXodk0o7gAFRSCnmLNWgEIq5Cz18PELaGqUCTvDuK0sFqwviqQs5Y?=
 =?us-ascii?Q?2c0qubqa0pzH/QlnvHDxx0Ilg9GjUJbaRzI4dKSGPclaOPLmp9HmO1CT0P/e?=
 =?us-ascii?Q?Wcaqlpc8YkqizIq9Uw/Gz2QPXASUuG0w8CeDSR+H7lqt/jxtfN28ej1rk4D6?=
 =?us-ascii?Q?dUSQMAfeNfCYeiEK8YlsmoSXbqz2wqGYO+xhBig3OfFa5fB2XDVHyMlEJBuN?=
 =?us-ascii?Q?VpYf23gyJSsu1TGyvTzfbGbntWdYx+0cgjziAybFdfdCazYuX4fvFVz1NaZL?=
 =?us-ascii?Q?xEIUDhaSDW3RY/PmIdFg8TrR2Rw/H0Ia8LB3N2JxBIAoUke2DSP9BrIWd8Lb?=
 =?us-ascii?Q?ALhW1klOCDjWf3u8e81BPTVLEd92xg2uvWr1goRi7kNV2KzOI+X3aFa7NMK5?=
 =?us-ascii?Q?2FxNPic0YEtNMxXdMhN1p2Xxr+9u01azooZtEQIlQbr6mibV8h4ChpGiePVX?=
 =?us-ascii?Q?Y9C3f0BV2jBG3DUCkeBl0fNJ8bx/caYG1VJGC5WEVSYD2XkzCqrnvouRY0OH?=
 =?us-ascii?Q?KmFxpDTC5nK05LzyxMziJR7cxBn7mnOT73qeW+PqEuBL0YRuvz9AL0M/Pm+u?=
 =?us-ascii?Q?3Y9giLlr0p6r9UTP3Bw+SQ74xXNNRcDQe6Qqj4bFxMOAyU1Vrl3qRYSpFwo1?=
 =?us-ascii?Q?VSIs5+0qph+UetfucRz2RTsKHnnzRj/WdOvJkN3cSsLpc8IQLAHc7nxM0f3l?=
 =?us-ascii?Q?Fhvz6zRKbxnTjVrTpHj0Lxx1W2FetMh9T0Ju0TKQ70SgYAusBp7GYYOCi+Rf?=
 =?us-ascii?Q?eaYHX1ODUVX+0rlUig0LsFj0rfq2Az9mB1ihuXGt4WX5ze9yNqK0TUvienlm?=
 =?us-ascii?Q?T+y+rnPavMT/X1xiPZvoIBfjTRlqS7Ds6f9KySpOnXD1yX7lo78ad50gVn8U?=
 =?us-ascii?Q?UjEAaKNVuNv8pLz3R1K5qku5YGYTmpn1sD3k+dMY/1WLtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MNkssWOP38JURtdPcdUN/U4sCrt1R+mKim7fROwdeX9Lj18bSL0acywT1DLj?=
 =?us-ascii?Q?TVK0lUFFEjUeDUkmGGyxf3dn14HFke0U5wJKfxXrSAy3cJrrWpwjyLJpS3c/?=
 =?us-ascii?Q?5VS0ZOmttyXXD/fwyqu/ULclm53HpQK0S5d0rXDiZ7q83BZ+F3mlmGRheaDe?=
 =?us-ascii?Q?SxLbN8A4+BVuHIzdBjA2oWiY6UIQLFw6pdpGkX40GKfBfUUxd2ySOUxJn7Ci?=
 =?us-ascii?Q?n/UTCpzaEOTKTQZE8VWhaILnDTGx5v/DMdd/+0ONJM+QTy86gixSXEdRVkD7?=
 =?us-ascii?Q?bZ2SCOadA1UKqPln5l0XfsbnUWeyj6KnnzKeDzg0tWc5kcjVH9ORBw9tlUHQ?=
 =?us-ascii?Q?LW0Nz8MGl/xjy1LMn9lm6KFz0+mzGmo6WEifES2hE6dJY5VnwxZC7DM6QrYM?=
 =?us-ascii?Q?WC5g/6wELhlnvgJkNkncGzmSmVqqyNTm30yQ43L5imPvpswdPM+1WFgQ7aRM?=
 =?us-ascii?Q?pBcjPUPkMY84g7IjyFBN5ajvdp2L0NPcdQXw7AEAFRsUc+k9Qny2vMIQLhOi?=
 =?us-ascii?Q?fJOBRJchgjuvpN/KAkVNwlxqwdJEPc80LAP0kK51U49nDVmRslzm0uFKkRjv?=
 =?us-ascii?Q?EBWYCmtTg5sJrrm4+gm1NnPzIQZd0o7a9sDYPw+gX6SeCETgTWPxPfCPk6rK?=
 =?us-ascii?Q?eMqRaQplCmIj7C980LtM0lahlD1IBFqHnbw98PhVJCQkrEPkEw3/wtyGNOYL?=
 =?us-ascii?Q?qq/3G1Ov1j2J3c+dvxAQxeQ47FKVeGN30+OPYjos2+4ROpwJG89JarRGDyo5?=
 =?us-ascii?Q?6uxW4qpXBLtu48LzxM9eqKrqEhDM9JtEFQVPfrfZ1Itim1kLf9iBBTG0H+Uk?=
 =?us-ascii?Q?sfFzxTHIffJ248TroWGUmxFxCJtnFTnNYNM5rSaBYuSRCaaAfeD4XkXM0B75?=
 =?us-ascii?Q?yYHK48xVDgUpWLuUcTYFugguZtYeUfbmrzfQ0mtZ0187QTMcQ8btrkAMzrCA?=
 =?us-ascii?Q?PILpaZGNuXA3RRhvOGkDpGru3DIf1tG/qQBAPtS/9mOpCabRRAJeGEySo2Jo?=
 =?us-ascii?Q?9Gtidvy9aWzaAt3heUL2Hu/063ENHig9hAfdxpWvCQavrDO+sIwfXLHU1bm5?=
 =?us-ascii?Q?TkyW4njMNPAS12/FXh6a5rhd1rOUiqHEg79q7OWTQ2C8t8xmIjQr429sxsfC?=
 =?us-ascii?Q?hSphpDxH2qG2sFVbwDulW6k8otad4IUasCyODpHI09t5E8XyHuSQgWqsIreN?=
 =?us-ascii?Q?hXgEy58yN/URHxnOgiIgA3Ca2kFnpumD5k/XfEJVdyvpXIdOIvpabid6SK1e?=
 =?us-ascii?Q?3SnaAKbuGVj9mGSRXod+kEjFQc4NAn2k6oU8EbBqLAD0GC1hYAB9y5LWVXH6?=
 =?us-ascii?Q?REJAWTpTxcSkrPIpxCMIFopE1iWrH3hePlTDbrAbeL1Q0mIMSapAF2p1OROS?=
 =?us-ascii?Q?aL4kgDjQvFVIOR+LKLq+z+m+LFjY6QfS56pr9oT/E5B4HRPDcEB1mIrnKbd+?=
 =?us-ascii?Q?eMqcVOTbCCXUUj2+tb4NLnYYghK2QaG/D13+bdViCQCK+TMFMmExZn0U0z4U?=
 =?us-ascii?Q?mj27mN1sDFNKfXxFJU+jyUNxgnaur2oPJSeaWFW45hjE3W3EBU/djP6gwEmE?=
 =?us-ascii?Q?+oqO0bFCDdsYfZg1nNq3ZsmWP6sz37gBascfJ2Cd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3424ff5d-a729-4f09-0f36-08dce8f0f298
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 06:01:14.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6EJbrPZVvbb8kFOe5nCN5qsKkV5/MXUczvWZDSbIw60mSvk1TX6kfqJIR9O5n/BhTTDQ4tHIAVmSFjr5K5NVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-Authority-Analysis: v=2.4 cv=XPtiShhE c=1 sm=1 tr=0 ts=67076dae cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=CBIzlD3vJScPmPMbZ4oA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7XtoypS_95wB4uByYbusKrSNOFR1XMC9
X-Proofpoint-GUID: 7XtoypS_95wB4uByYbusKrSNOFR1XMC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_02,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=921 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410100037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112756

From: Chen Qi <Qi.Chen@windriver.com>

This macro is documented, so it should be consistent across
different build systems. It's defined in autotools, but not
cmake. Add it for cmake.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch | 51 +++++++++++++++++++
 .../recipes-extended/jansson/jansson_2.14.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch b/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
new file mode 100644
index 0000000000..5298cfbefc
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
@@ -0,0 +1,51 @@
+From 521d37abc0ed1178a39298d06d80d8d0e2a43e28 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 10 Sep 2024 00:48:00 -0700
+Subject: [PATCH] add back JSON_INTEGER_IS_LONG_LONG for cmake
+
+For autotools, JSON_INTEGER_IS_LONG_LONG is defined, but for
+cmake, it's not. This means such macro, which is also documented,
+is not consistent across different build systems. This is not
+good, so add it for cmake.
+
+This patch refers 8b975abca1055d40637c90b1dc4585af1d7df76c and is
+part of it. So the upstream-status is marked as 'oe specific'.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ CMakeLists.txt               | 1 +
+ cmake/jansson_config.h.cmake | 4 +---
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 39b9ad3..0e95a94 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -193,6 +193,7 @@ endif ()
+ # detect what to use for the 64 bit type.
+ # Note: I will prefer long long if I can get it, as that is what the automake system aimed for.
+ if (NOT DEFINED JSON_INT_T)
++   set (JSON_INTEGER_IS_LONG_LONG 1)
+    if (HAVE_LONG_LONG_INT AND (LONG_LONG_INT EQUAL 8))
+       set (JSON_INT_T "long long")
+    elseif (HAVE_INT64_T)
+diff --git a/cmake/jansson_config.h.cmake b/cmake/jansson_config.h.cmake
+index 2f248cb..bec64da 100644
+--- a/cmake/jansson_config.h.cmake
++++ b/cmake/jansson_config.h.cmake
+@@ -21,9 +21,7 @@
+ #define JANSSON_USING_CMAKE
+ #endif
+ 
+-/* Note: when using cmake, JSON_INTEGER_IS_LONG_LONG is not defined nor used,
+- * as we will also check for __int64 etc types.
+- * (the definition was used in the automake system) */
++#cmakedefine JSON_INTEGER_IS_LONG_LONG 1
+ 
+ /* Bring in the cmake-detected defines */
+ #cmakedefine HAVE_STDINT_H 1
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index fb42509f36..9f5cdcf4c0 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
            file://0001-Fix-overwriting-linker-flags.patch \
            file://0001-Honour-multilib-paths.patch \
+           file://0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch \
            "
 SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
 
-- 
2.42.0


