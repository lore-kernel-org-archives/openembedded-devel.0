Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB19E95A8D
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 03:24:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53241.1696821883835118276
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Oct 2023 20:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cNOClT5J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8646830cd7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3993K21E003795
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Oct 2023 03:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=rgLziJaTh7msEviV1m
	KOklmXvwiFYMm5Zre85wHwuw0=; b=cNOClT5J5X3MXTNe5T2fGIY6QQG+MkJO2z
	8h9NtpV6v/kw0/BgbHG6acG/icFy8I3vAFCC8tqr8TEwfECGWRNSlc7OBLDohgcO
	m2fykMDZ6HFqL2wYjRiUeuBiFKRq+DxB6AVUUaA2OAF5h/zJjpsA+VAPqbcAsGAq
	HD2R+aAJ9m+OYEMuvIBklw5YLlYSKrJ648jEelK3OvhdmZsBSjsf3friDorbZ2cJ
	rs1r4LXLVeOzLUSw2bsJte1tAmv59s5L6excq9q6Qu2Ktf9UB7j5Oxj9agLneYsS
	5iT4SD7qojZyXpK3zW4PUWxwYSn2sXtabi8hprGL9c5OxYKIh81g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tjxa69ddr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 03:24:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TznlB8F0Ht99gtENW8jn9wz+lCGSBJk6GJ6ssv62GC76Ith7tj1vGM5SF2qDCErtq2NUQOyhhSCtYGsrY4CFFqQWkRbgcKxlumQBwBGkUSjP86L42i20X1eegr9nHb/8SepHD8VnlQLwcyul/bNcGF4iLnmsk3SV9A3h8uIrVO/IFyVNzVf6vusiWsQrOLgrl/eOpur/MpMnPUwa0vbSa3++k8EST2SXp0HD21BFRFDjsRQW4JY87C5ISN5DfNxVZB/YbSVwE1Q2T4d4XaHLRDPs86TNhUD38/7tlAiEJMkkk+TxArfTyvnav7C/vwYRsMQ5SPkAJWh/7uO+XEteCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgLziJaTh7msEviV1mKOklmXvwiFYMm5Zre85wHwuw0=;
 b=h6Tw2FTuaCfCaLhsobolCEqjUad5OeLZFhrD37SV2tx+QD4c1kEP8APc89rqaR0YddQqM1fVOTGguWt0xg5K782B11/xfSyQiQhyGfXUgwxtMgNhrBr1Tnqot0aWiXD/LqmChXjs4mWuE0nkGwNKwrPd1MNzbFdC6gl+N7za59ChKIfBbxmim7rT6SJUSXaMkDjpTBM5NHf9TK2yojNgM/1uj2/dg/8NVorQnp35q1Eq2RDrXhcVU9ViKrTMqIdrt5JUTHKzmhwTaCFTgRU4Dl8Yd/fRX7tOjMtmOgAqnyRQDNJf+uEMNCAfxB5U6dRUmkjg1TKBc0YIue45g6T4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 9 Oct
 2023 03:24:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d5cb:40c:7bef:89c3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d5cb:40c:7bef:89c3%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 03:24:40 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libblockdev: fix QA error in case of multilib
Date: Sun,  8 Oct 2023 20:24:27 -0700
Message-ID: <20231009032427.2100493-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4759:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c1ee9e-b93d-4a00-3b57-08dbc877462b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nAzKB3/tz+fir3oFZL2DhcPykjRlL31V27BvcH0jYhZEfRZt+mpmoCdNKXg6OFUalBfHEZna1IOrqr/WElWSFHvlM2h+ZWQluauUAr3MP2TymsV5rUwS6SSFCYdNxxQFGMyB9nD29+vSEDGLQ9zhALik1JsVzCW/6QXjrlP0zTzef8KGku/VaMnbJv7rYwdQrXrQvQqYCObLcGw/CgT60UwmIhW6eR3aDF3H1812AKwJt2nvuT/Shq6J2jW/cqbjr/w77XfDD3XTLw4PXAlA/Lfjadhi8xQaZiHDPycQpavQ0DTyDVDXVkYGoafAiTpDFPQQU7KnkfN+4YPsUwYz/UbtuMCPxjRX5T6H9SD3og6B0uydS5j/fBcRw7SYYUuFGXn6EYgKv6VZJtupTprkbRKAVj4jl6tj9gimzuRj4o4Is2zNZs/Khc5vEm6FBPh0pollK9FjLmcPvxdbdyQ8khCFmvuTwoCvEKWcWPw/hTsROzEWy/sqaRjG2qq6zzkhGGJ7mzJgrELe9SdKKSrPdqg57ICtTLIHxlelVQLgm0ZRYrT5ryyu9/VanBmOaMCAY4CE5fLWgPR72GCico0Ng3rOj+deBmZHLzipfby9ek8Sp8X85zmQyUn8seyaPgPD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(478600001)(6486002)(26005)(83380400001)(38350700002)(38100700002)(36756003)(6506007)(6666004)(52116002)(6512007)(1076003)(2616005)(41300700001)(316002)(66946007)(6916009)(66476007)(66556008)(5660300002)(8936002)(8676002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X2i66HALnQpjfeM9JNigdIv/fo0dYxB77Z6FXXWSDBU4oRlBwBoBkq/T9DCv?=
 =?us-ascii?Q?0ZC/F2KlqSRsfjmsmvFlMu4UOzxb5RXCQSv/+tgW6pVz5UrW0nNMeLwgiU8T?=
 =?us-ascii?Q?3kP5udyenhLCmC4C84K9y7C75WUa9Z9mA+q/Ccy7lvqltZo3ITjKT1JJjACW?=
 =?us-ascii?Q?P65SfZKnIpztLDbGDA3RgaRW+FlExDWX+cjCjZNlcrp1mMLkxLaYwqi0w7nk?=
 =?us-ascii?Q?SPl35gcjqxE24JGcSwYl4SKPmNttd/UKShX62/ZEo15an0uY4gDKweHq9buc?=
 =?us-ascii?Q?09VdBRyU70o1dqHE7rJRZQCM7gEpJr+1F7Iqk/REA6TgjVcZy7ooPNKcoLFR?=
 =?us-ascii?Q?4vujLa4eS/TuwipVy/vWd26BpVjk69E0IrgesQmU//OQsXrxmIYQk63eZUsb?=
 =?us-ascii?Q?TIilG8198wPkAU7bNAS9rxFgpvC7050dlQ7TEXNz/DxmyiXsGC4kdlgZM7F5?=
 =?us-ascii?Q?CIf6M251s5D2JEiOZpMaZITzdGKwCtnnJJJ0Kn+9GYB9MjXB8Ed3IgJK2hLQ?=
 =?us-ascii?Q?PcLWHVG6LSTRcu3FowVy6vUVFlGGN0dZOpz7LxIM2daj2GuL3L4zoga6lKkR?=
 =?us-ascii?Q?xT1Si+CPK/ya/lIU2d53KLeu2crI8vcoghUN5UwP2pE+6apcBLTdqCGKwTo4?=
 =?us-ascii?Q?t9/eyj6v+EvvmUEcdJtygZW6BKBhw3qc97LtR6WeHnRHj4/1WBM10zcLRZgL?=
 =?us-ascii?Q?NA7LaparM2Q/C+9fzut2Lbza+otAdW95XMOG5sio3L3Ugl5iMZ6bNI7YMYys?=
 =?us-ascii?Q?V1TU4eVYgCoDGBVV9PLbzAVTk2gA+hAbyiiq/qLfFCuGiA+4igMS7c1Bs8Af?=
 =?us-ascii?Q?fR/RoFjXGEEpn3ANIwrOOhTYmGh5EKa2xuy6cHXKEfRs3dnttgt6tbvVIXK6?=
 =?us-ascii?Q?CyhMe3LkWs++H2mPtDDGvYc2hjYhVM0Qmc+wF5tYcZLXi21k3sqQS9Pvb3aB?=
 =?us-ascii?Q?fW5vRsew34iy0af3c9vA1VPXf52zFSF5s7yfjnkn5R6AbQf3aYF1Rj6ar5NQ?=
 =?us-ascii?Q?DU4HkKfthoPC7JZ9wk4z2B4P/zCaIzUCXF8fX6pDsRr64F0T5LfUYBZPioeY?=
 =?us-ascii?Q?2l7uy1kP50gAFPelE4csleir2nJNXEpg52WYinCDYAZag6seQ69iaalgR8+I?=
 =?us-ascii?Q?lHCT602tEqyLTOZ7PqkMSgYffHK948TnMgALaSVJPWaC2y1tm58Ng2bBVEBA?=
 =?us-ascii?Q?O5Tg69X6evlvMwaT8lS0YvJCSsM2aQ0J4ULLR63d7RPc8+lQtuHWpPnT3MdJ?=
 =?us-ascii?Q?4UR+rOOohIR79qIbivlvzgLTbYNWSzUGwrP0iGUhGcHTExkfwh7dRfDbVSyn?=
 =?us-ascii?Q?Ud5t1Z48Dct6atrCTW8chfWllz0BM3xCSSbWqq9svJnZaWpR4ZtfUyqMKUvp?=
 =?us-ascii?Q?OPZMYAP4/snqdrfEb7C8X9/yxf1mKSluvc/FUjQ2rBLLI+MmCAQZCpaV/KJT?=
 =?us-ascii?Q?+23Yn2ngD60fHxSmPLjN0orhKCfCnKYhgVEIHYG8jkacEkmBXijeiq5sQD4o?=
 =?us-ascii?Q?yXTl31IGzJTE1/1eNBlVcrRCiM6B0zjOIyQusU13oSEaWejmX6BwiZFvtCLO?=
 =?us-ascii?Q?mEQEKmsDCOS9SQeBUJEPDWA4OYdtXHxPNZL/uRFD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c1ee9e-b93d-4a00-3b57-08dbc877462b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 03:24:40.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbfUyvCir1puJQ7PO0EsF6oq1LfYE9IuVCsLkKfBm5NqTgIIqcmDbn5ocAoqkSabFr39UoQTX/7WTWzvctsUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
X-Proofpoint-GUID: wtKhl0BM-C9s1FX6V51ljBaYrYMK1G_D
X-Proofpoint-ORIG-GUID: wtKhl0BM-C9s1FX6V51ljBaYrYMK1G_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_01,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxlogscore=957 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310090028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 03:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105388

Fix the following QA error.

ERROR: QA Issue: libblockdev: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.11
  /usr/lib/python3.11/site-packages
  /usr/lib/python3.11/site-packages/gi
  /usr/lib/python3.11/site-packages/gi/overrides
  /usr/lib/python3.11/site-packages/gi/overrides/BlockDev.py

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ir-for-multilib-when-cross-compiling.patch | 32 +++++++++++++++++++
 .../libblockdev/libblockdev_3.03.bb           |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-fix-pythondir-for-multilib-when-cross-compiling.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-fix-pythondir-for-multilib-when-cross-compiling.patch b/meta-oe/recipes-extended/libblockdev/files/0001-fix-pythondir-for-multilib-when-cross-compiling.patch
new file mode 100644
index 0000000000..ec3a9fe470
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/0001-fix-pythondir-for-multilib-when-cross-compiling.patch
@@ -0,0 +1,32 @@
+From 297abed277ce3aa0cf12adbfda3c8581afdba850 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 8 Oct 2023 19:30:29 -0700
+Subject: [PATCH] fix pythondir for multilib when cross compiling
+
+In case of cross compiling + multilib, the 'shell python3' line is
+not likely to give out correct result. Make use of pythondir instead.
+
+This patch is related to meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
+in oe-core, so this one is marked as oe specific.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/python/gi/overrides/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/python/gi/overrides/Makefile.am b/src/python/gi/overrides/Makefile.am
+index 5e8e75f7..7c30601c 100644
+--- a/src/python/gi/overrides/Makefile.am
++++ b/src/python/gi/overrides/Makefile.am
+@@ -1,5 +1,5 @@
+ if WITH_PYTHON3
+-py3libdir = $(shell python3 -c "import sysconfig; print(sysconfig.get_path('platlib', vars={'platbase': '${exec_prefix}'}))")
++py3libdir = $(pythondir)
+ py3overridesdir = $(py3libdir)/gi/overrides
+ dist_py3overrides_DATA = BlockDev.py
+ endif
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
index 670bebd37b..99175e6112 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
@@ -13,7 +13,8 @@ inherit autotools gobject-introspection pkgconfig lib_package
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
-"
+           file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
+           "
 SRCREV = "38378931d285b91333ff2e2a391b1fe91072f9bb"
 S = "${WORKDIR}/git"
 
-- 
2.42.0


