Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1FFC3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:42:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1587.1748590944498605784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 May 2025 00:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82456d971c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5uplh020206
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 07:42:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53969dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 07:42:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md/VMQi4wZBduyYcddO/A/e2Z8XWAx74LPhYhZSb8zYpHM2xSB9EIfVmgps3L6l6msVfMD5p/QIxJ/dDAheHYZjM0fZjOumafg1/5k77kaEw+Z73cyQDrOvZDVxhZEZ3orTX+Ftk1tSn//vhUWNN9cSB88rdN6XMRzC7KHJ3aRtJVBt+QUFQFqf4xBYrHYIuJx271J/FSSi7rnliHFS93yPjQ3sMsoDFJBMmd7XFZF6Vcqa4PfnybmSa5tCdWBoRnILr0Iu3S3uD+J9vdH9KEqD5V936NWIsla3Oz7hDAt5EtPx0qhL4GsRvhvehl+Ju5ML7SpYyGkMZYPwyt1i5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BROPxyh25FRme7znEtvYRFOh0ehld2oaY6fM/RnuhC4=;
 b=apnu1QQMCPFQt8GVbq6z8EUCm0vR2Qhgw9DufHIpFqCxogsR8KFAp+YcNXWbXr3hnVEtoXtm2ErNIfNAmG7Ujs1rtbJA/o/MrwX/nj9uzEzVz+CU/aNlUAe++cmfwjxoAaB8zvJ0QCbz6agNNob0yEII0Qb9+nmkhzEAY6rtaRkV2w9X40GEk59rwTXtWH5Bas8fnkjxnPBPSCESFTMBzVQDTb6yDRArHJk2nx1jNzKDydr7ApBegQEsrLxE5oyfuYJD7SfEHTzOsihBAC8O6FHEpxOK4o3zKCrpOeQdGs4HlTWEZM1PkIOw1ATTbknnQTLRKc+bhm08RBBGgjiSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 07:42:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 07:42:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] check-version-mismatch.bbclass: make it work for walnascar
Date: Fri, 30 May 2025 15:42:03 +0800
Message-Id: <20250530074203.1691370-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb00b62-4f2b-4c89-5875-08dd9f4d8204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BfN1X6N05YZUNOfyQ28RFYdQ5CTbrnkT3XibfbEFohGANYdy3hZ9I9XNU7hS?=
 =?us-ascii?Q?IUOVItHxUAZ6VsgTHvprphw9RitmCYqGx52CRBj1Z8cDsIsAn6jkgMtfqofb?=
 =?us-ascii?Q?h/CPb5/JsKzkoDwEKDm2UvTIhCYnUu+xESmg9tHZrryf3qITIUSKUE2Xnsbn?=
 =?us-ascii?Q?DfMmWYHUZO1NaZ3BgGvgp558M7SiFH8QriSZNfD2ZAaPioTiqNql/e9tcycY?=
 =?us-ascii?Q?AivQDSnsvM6MYHPjgvhgIdH+4yhP20PMxWjRFRpbN7b4S19xRl199EBlULK4?=
 =?us-ascii?Q?1N0uQvEeoo64YXYXE17HUG5VYtAWI7g7zDnFXMMxOIkB8zD/HAk2bg4uoDBl?=
 =?us-ascii?Q?geMOdLgSc/KeGNUUGZ+IQ+QsRvgW5FUjBAU8JuVs6WBJ8noV/dRRsXJQI4f9?=
 =?us-ascii?Q?7PN8okA+FqRwJ3/dNy2cEnZF3gg7E4PRrhknKssUbUSU6INMTWfDC42xbvME?=
 =?us-ascii?Q?g4iIxV/mfJ3+AhzYKfALRCjYEH8G3W5VUpPeQzVh2X2sfmQa2AqGyAwCBbto?=
 =?us-ascii?Q?JrP6be0rsMIRyWEsOFhwiCiTT3ZbkL24n+YcoADCb+ko38V5B7L7zODNnc0U?=
 =?us-ascii?Q?+GMGveEqQiuj1Iqmi0684qWuvGGe6n2iKTQeZ2/bcZP/DdL/wPFGkmYzsld9?=
 =?us-ascii?Q?qyFvtDJuKHQd3nQxxR/BSZ6i6hPIymgNtBq9GZ0fmOEq1+8sbk333j7tkHJe?=
 =?us-ascii?Q?LIES/RD7tC4t7SLpxtCpJMaYym+lSx9FuaKQ0EUbGUwi1Q2PERjmZRoweAs3?=
 =?us-ascii?Q?pOscvQ0FYuiJQmXV1bPge7FMY4zKqN8tXIdVX3Y6rpFb6FOTcXeJ/MRWHuGb?=
 =?us-ascii?Q?g9l9AJ7uRIKUYMJgDGDOPTpvyl9YxEBTY7oFE2vIApB/Aa8O7x8gct2N1ggi?=
 =?us-ascii?Q?FJx9VXje457s9aFOVRaMR76cZmCOKPiELoc2ffEOs8Bc4znM3qTZOQtxm7LN?=
 =?us-ascii?Q?h0P2tFC7/gn31WuEowjeXuwrBIQDgbcw95Xi7xQAJdIVpcEvvc+mMGQZsUxC?=
 =?us-ascii?Q?6td52RIR18Wz/M14gN0D07fS7jXd67sCX4JQvY+pzhEDxoP1lryx/gwwR/fg?=
 =?us-ascii?Q?QvkQyLVBQZ9iyUw4vBgHsUJymdZgb+JyPo/rQzugxMzPxPZq17xkHrnwVJYh?=
 =?us-ascii?Q?7XEjUi+uRei5BLJIvMB2sdqZOR9Mtr25kj6WeiPik+Qnn9qfIJ15IuMGr/eN?=
 =?us-ascii?Q?qMgznLcUYPbMWKmsb3Sgru6v4OPfQnqCPFxMXvBi71R0n0/hk17MwWM1atGY?=
 =?us-ascii?Q?FBANCuEEasRJYGzBCkpoANo5GKDU2dhKKCiwjgMVk0CKBVLGtl9l7LJ1Yyqb?=
 =?us-ascii?Q?u5/ZaTXL7kAc+OjDgeQpwBh8MXei9mLoALnOoQZ+8ntZC/Iy5SmWVNYPk4rU?=
 =?us-ascii?Q?VajJ6ERaCqVxr6+f3PXWZndaU9vvwDGRF9xLU8SSJ6U/TS4aYVTM+d5QAC/7?=
 =?us-ascii?Q?2gfACjvygG7jHXAdmUQvvPMiDyLEGxgWYi1jLjM8nlNc7pzhbUYdzA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KqR9cXNJ4aAEP3S6zlZQDm/4hx9qsTfQth4Cu7/bRtsoqEkblapg1n6w/pIU?=
 =?us-ascii?Q?qBxOqDv+JfEB7p4QVc3ReoyjXN1gMO+q6q7G57a+APBbzXDtqe9gP2M2+ULg?=
 =?us-ascii?Q?u8rwrHhpyab5qUtyUEWNZY9R/LRpsXcb2YP3FdZSCsZ5hv54ptf0FP6fxxGk?=
 =?us-ascii?Q?tFmrMSxvQcTPduBQXoD+RrM2gp5yrRJJ8UznAqpFOvbhTPyIBXc3j7soBMsN?=
 =?us-ascii?Q?ytZNFGBRu3wlTyFiY+BXyEz27QYVraXa/PXzp9uvNH5U9SCvMf9cOBIr46k3?=
 =?us-ascii?Q?9i0WmI3pMlKxKKBobMi3ZncZ1IAWLQ6WsYcvUkBecW96MlFT8aLiYnleOGLZ?=
 =?us-ascii?Q?kb+JGi7WqTtBrtmClPi21GJ+5dZlZ9HEYa/v8dv+LEU0AMqVevx+gVRcx5X9?=
 =?us-ascii?Q?1+iGae//Fqm39a4PrrgL9tyiPYQHkXE+hMnnZuIh5XvISSHvW47w7G+cb8h4?=
 =?us-ascii?Q?avMHRasZfw7y9g4O6xR/LetPioo7p5f46jhLaQtNizMRaaZl5A3PVTHVu43A?=
 =?us-ascii?Q?7NhlXw0WQzvDXOzTzghtXnk4vbEf4PH/60Cn/z+vQzXIy/9B9TXkWooUHQ+u?=
 =?us-ascii?Q?y5elL+n/4KRLyul2raCdQOUndpx4GLRjkXMp2QG+Q+bil/mzEQUZc6bnM29T?=
 =?us-ascii?Q?G0F4ADfzYOdftHAqG5zsXfQX3cMyazCCEWr0Ok4WDjIqqmaMjlM4l0LexhGA?=
 =?us-ascii?Q?Hpb89CnKzX9gZ++S240E6wMoTIEQYE1D9jmoR3qcuLovQ4oHUFweL2tuNRsc?=
 =?us-ascii?Q?cn1/Iu4vNBj+zz+J7h6lP4AxSu0mE140XkSa2mu2jaBLgiGfocx2KwHu7SUw?=
 =?us-ascii?Q?lpSt+ntPduHOfb8V3ozc75flG7EkzQHP1ySQaggUA0Yaf4pzR2MpmGB5Jk7e?=
 =?us-ascii?Q?5BRj+U0+SRbO/RD9RwG7Nf/4IjWMY9BvYz64iWvS5LMfnz6QIUVeaOuRINNw?=
 =?us-ascii?Q?6ccIEre2yee5OmjlQwAeuYkqvovYABnEfWn/mjhbwU/VmelvDz1kS8iOJsm8?=
 =?us-ascii?Q?6eNKwcITmGYwEoegkA+m6JmY7TH5W08Fh+QYn6fncUZFoqruG99ZxGb047cY?=
 =?us-ascii?Q?C2KOTqbhLTNAmuUSqW/upn+2YEWprDBcO9S+UWG92cjweq+JvzBkNxTauGti?=
 =?us-ascii?Q?3t5q/HSOHSyYlFY9GTH6z5+oggnpIGBy5Id6ppdbGGY3F1HEJ4kzHzdzO4jc?=
 =?us-ascii?Q?RxJ7qUMoraQyTvcI3jrQAxonVcu4P3LRiiE+2veuM/jxlBGsklubekGHk+WG?=
 =?us-ascii?Q?QezbMrzt4J6uFjsgkIFdEUitAYHN82YG8OjiSsVdXgQ3weNJcZkWgEB5OJzr?=
 =?us-ascii?Q?xtRoWBA/sWWkDM4Ps9lFr45dviIjYjL/B6unjPyGDQdhzNpefipFHTaqgT7i?=
 =?us-ascii?Q?SfW2tJlJtULs/RqQ5PqlPFs0gniCDKv1XQzt1c0lCfwv9pY5hNoXdx9y14zT?=
 =?us-ascii?Q?ri6bWpwPIQgwl2ZKN8BEXcs+ihrPW4Bcy+O/vPK4USscceEHAwq89c2jQGN8?=
 =?us-ascii?Q?TcO6rGJaQ1Ehw/b3UaiMFVVv4ARQBgWV97DJFxQzkuWpWLjAkkLF1fWkqNvL?=
 =?us-ascii?Q?FUp97NfLq2zkQoUuFHO0OYHyJz+M7t51PtzTCK1A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb00b62-4f2b-4c89-5875-08dd9f4d8204
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 07:42:20.1207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef2sVsv03RGvRQyD2np+2Ke0PA4fBISq7nVLK2EO9DzRSUHbehJAKfbh5wBoTHdKINX45s0+vWmp1eCLO2Gtmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA2MyBTYWx0ZWRfXxV72vx6jxMEd cGZFqQ3iudFYm3gceBiSPdT3V2rZMUofcQrBRBx1xSdq+WOr5LzfPLSQ5+veWjlXFJ/64VZUuzG hsQAVFHQTLflyYa39Ad007EAEuyauOiu0uwmT8sYPkwYXiKsXpznG5bhpW3T6wwEpzZLUWxpqoU
 aOHRvc4h8N4w6Jqoq8JcadDwX10p1faHaJnYknahScbnYH0Hc0591v0KxLOMoY9qqPYZ7Ky17jn Sv22ZtJaZg4HHlRQp3eIgv+LCZBC7tr4DdMR+dVrew8REtlhqSO7nT5iniw9zAErA9/cDg2BJHW 76kLTItfcqybkFua+xfHyCgU+ZBLOtE1/qRHRWYPSRNIz7m3bMOgRj+p0lFeW9/0zKmq2YTeZMq
 +6vWwLulGruExdb79WV2P5PlNrWGTyH6KN5keIqEXn3kC2R/Gi8VEu3MCtT6sb1L6kCyAP6/
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6839615f cx=c_pps a=gu6RomWtnwV9OjqK3d0IpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=UFPMlIoCnxD1ginCLscA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OtYP0IAorlYXFEd9x73C7DWFDBoKkrmg
X-Proofpoint-GUID: OtYP0IAorlYXFEd9x73C7DWFDBoKkrmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=832
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 07:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117671

From: Chen Qi <Qi.Chen@windriver.com>

The oe-core master has qemu.bbclass refactoring, but walnascar does
not. So we will need to copy all the needed functions and settings
from qemu.bbclass here to make things work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../classes/check-version-mismatch.bbclass    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 7b46151b03..c023d3c71d 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,4 +1,35 @@
-inherit qemu
+def qemu_target_binary(data):
+    package_arch = data.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = data.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
+    import string
+
+    qemu_binary = qemu_target_binary(data)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    qemu_options = data.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
 
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
-- 
2.34.1


