Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA271C3601B
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 07:45:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7898.1743666332513548496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 00:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6188a6bf9a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5335gIxL021007
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 07:45:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0q8cv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 07:45:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI7O87qUVTO7lK2Bo+bCX/gIMgNf/menpMKDVJ7yd5rjEAjFhDvtrCQ7v0X8AZHpfeKZVwv8blAq7IwX7t68235RHgjJNdDSlq4b5QmO3vNsXvf+GvF8cWpioItaObjv13X6k4eSrP54xnMUoWkSN8dj8cWnsK2DG0xfA33c4qiyc6/+a7HSckDUbA6asY2/SlAuVblf18B7cyKLVT4oBu9SoEwlMs7c1kI+f/xky3zPGMRp+4nHFR/I62vXb+fuiFuKMgnngEu+2FYFoUq0rMvCuNYIuKzeKI1akeoWkqS8W6iTC+lk3wlEDfa//oZEH9FgEQsmTaqMwU2wpyi8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwvubhr4MqJDvyhKZc/isHa2CS4YkmQfQEMrXabc/GU=;
 b=dbFsuEMj4N7bC+Xm0Dw0pwqu4AUpnCvS+G0JR7SeV+o1jiRa1CLrkcPLSt75svGNaSe0LhD/o/OhwesKo9PpkaxFhHBBvSEkugV80sreyVxeS+f1RXk1ZBk6wiGHz1NfbLZNULtID0Vm9sKg1ZDIEyIWse6bvyl5mFBx+wueo0XzlrXbGV/AYTleHJLppq0LJwzpZPwuHHEyFDgtED66l/IUlbfjOu7qCXaJ+Dr+czfzhm943dWm55CVR100Tx6oC/HeBA49UkSeGsxtHozphOVPczrNM7iqdTpkraPk5eR811RmptRJFzlRCAwNBKbvCVg6iSFJlzaEG6TR83fY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 07:45:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:45:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] version-check.conf: add mechanism for checking version mismatch
Date: Thu,  3 Apr 2025 00:45:11 -0700
Message-ID: <20250403074511.966440-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a972dca-ad18-40a3-e604-08dd72837e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j4djMhocJFUp9hmsvaTobP+5tVJgj+QiBlcuFHpimppgcgSvmSp7YZ41H50Y?=
 =?us-ascii?Q?PfTLgwjOkwxm6n8H+Ng+88xeEI8acjlYoN34VRVgM4Sc4dbXkI849bwVgcPD?=
 =?us-ascii?Q?e1OTuc1aoFrQi3GqVmHJKkbTlLuTIYrBRDKekEkjWKFmpo41hz+UBA29kLz3?=
 =?us-ascii?Q?a+2PdlaMUbOCp/NA/X6Tj0lmLZ77Ysb/a3Iz7IJ99waxNwjISuQvF/HUgZe9?=
 =?us-ascii?Q?5lExt5DBQYFtdHrBHDbpwEtaf2CSV6YlonA21TVk9ec9Qm2H08XXndEB8akn?=
 =?us-ascii?Q?xvj2TfJ8ilFeYc0p0ecC8Ll3SzfBfQ0X93txR+KLol9E5Q0f1n/RXWHOS9PT?=
 =?us-ascii?Q?Uqp/A387DrI/Xf9eBGcSmzbxF0NL5g73KTscUYvkUftljv8uxZHNIecEuUTH?=
 =?us-ascii?Q?2/Del5cWEdqEJHeSCvCVB8An9MITeaq95/esEDtv2hG3x5kii0gZ9xSzL0/D?=
 =?us-ascii?Q?l/XRJCVlVbIWVCClPf7Ua53VuEFG/zUVi81r+lBwvtKjeKJSgYA5aQ+eNNNq?=
 =?us-ascii?Q?c1y4aks7IiM+W/iwL3GW2Au68LZXJS3H/EzhOMJF2eQmY/3Umd2HVZO/FKo2?=
 =?us-ascii?Q?gk10jVcqkP5RC8zuVmUsR4zCiKYVzNVIaerMEO2kK2rDy2qQhHPM0scIKWnQ?=
 =?us-ascii?Q?Ukiuj7A13CDMGfPDSN/hYRxUVxV02ZqQBJDH5WLOkpBpXWFzpPRbN7Xi+As2?=
 =?us-ascii?Q?fUnXTxwMCYIiYzwOWEZKfunuQNoqlRyMPY1XV+fdRduoaMdafQVDAMHOffr3?=
 =?us-ascii?Q?Qe4y42sLXHp2BxPyHjDvWaZ8J1njD8heLKLLwIrxnp2PPTh6AafzfXUjdsb/?=
 =?us-ascii?Q?ATQkBZ/y2ZEIpK6e9SSOPNawaAxIzdp8xJQErZHbD6LjxNnwUaQUvPyk+xnB?=
 =?us-ascii?Q?A9DnEfhp3t10m5hrhH2LrfnpO7wwlsawMVS6b908HlEXullMkjz3d8WJTuMv?=
 =?us-ascii?Q?sCSjskBF121mvQiRAo7ZUzACvXo/0gq4ZGH8nii7+CJSOwOKvsWR2WdlDsb5?=
 =?us-ascii?Q?eQ2LGMj2b4VuSyNaglGN9KlVQjopyQhwS3V9iBNGszxKYXA3s9BHrHCpa/hA?=
 =?us-ascii?Q?Bu8cl3MOFDePai7zYMwhLnGC5lb4UAI/OH/rJI8xYdsZMoadesy94F9+6Eyw?=
 =?us-ascii?Q?8dz0ja+32xTN8zZLpUOoTznQppfJfjOGZ6R2rSgfmBUYOhjGQ+eiQOoGR7G1?=
 =?us-ascii?Q?dsClllCD0h6Q2CLuXBZZtmnzPPuzE4i12OYCUa2zrlqY7EGOLqsfCYk8JKZ1?=
 =?us-ascii?Q?3PSmky0Mi9VTnqtAuNEdPV/fWgwvsMsESjeyofTSxoPJ8ZMQ4OlZ/PIzBiBm?=
 =?us-ascii?Q?jcfbBhrOVr8sw0C++tVXEVy3cx36ry5MZrIlIx4hLTWY5yAE5faOgct8ETLM?=
 =?us-ascii?Q?oAqcZvUU/Eg8v5c2aAMJNXkWRf7+Xuxoz7jjlw920b+oEsPUr1RWsHpJ0Jh8?=
 =?us-ascii?Q?HTtPVzyMKVPUlMTOUmwTOimxaPVJsdA4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vQw0c5Gu6yRweRcWo5VfMi5eoij/ksgoSqb0X1US/SLZnxuQ0Wwx6N/d6Ttz?=
 =?us-ascii?Q?slEOaKOBzAXb3piyhXrmhUSOj6VPddY+9eVlXWwU64U4gZ693X2kOCghmQhd?=
 =?us-ascii?Q?D0PMNxqdqO3/EVAffBkPj16QVUECAsDTO7u6haUFSirFqoVwubYI4rYLht2e?=
 =?us-ascii?Q?XHQiCUmfge1IUxMlwz42RB+8XMDcpMA0uRKkz8UBsU9tm/cCwwvhCHCnstQ2?=
 =?us-ascii?Q?WvxDUIsoVkXhuHGh9FPf6E9bmE59Q1mgyS07L+u91YEwajatOudnTewsYU2D?=
 =?us-ascii?Q?5IZzSpaCg1agGdTQVYYCJUcvFFRGyAcY3cEH/NroEmO5GkmscXrInOQgTr/A?=
 =?us-ascii?Q?3UmEG46wuzYezlYPghXrhaMGtIiudPsSF7gzEs9qsFfGhZwG2td1x+cMCMff?=
 =?us-ascii?Q?+yOtI8SSg64ps1w3IziuzBnOOzIs+TUYY1Yxdx/MrAgOTK3rMMv/Rde4SXQI?=
 =?us-ascii?Q?ODgmJJk1MyyFNP30kz6DB7Ar7sgaDZhBZa8EVTiDFl4m6UDGy1tM3reLh8ny?=
 =?us-ascii?Q?03kQlW7nMON2peWtIal9s6my3cAHCflmHIJZypgYpI/MnDQfHkYpkBdvX5Ar?=
 =?us-ascii?Q?LbWhwPpH4wHofq1UcFyc0n8U9LRSAdNp9D+1fNHoTcS7+E2ZE/OqbmnujWBs?=
 =?us-ascii?Q?Jc7TSorfNkEFSB37E5DUrKKL63BcSVI5LeyfY1MT5YRCxOfg76QNHL7kfUrs?=
 =?us-ascii?Q?uO54Y5o20jTtHFMEXoBFt3xbzfRTfhZIFisL9GN+Hw1zL6Z1CXC3E3PH0Sch?=
 =?us-ascii?Q?lMXUljt6hK+NWOP1brEgZRnXUdAFk1ABIfnDCEKzOtFyWxV5w/ypQ0qaj2FJ?=
 =?us-ascii?Q?7MNbIGIL/18yhyeR0Pa57E46HFDg2nBPkVgRNz8mJksMUzRfdLlo6H7wCRtA?=
 =?us-ascii?Q?vlR+foSQsmjRT6vt4LBIggxGq7W9grh1PPWYZc1mZBOspKrcm8RDxVz2irsx?=
 =?us-ascii?Q?g9RCuV282uOZ2oWDTfov9Zc9bRk7WdSbUPI4p9g/S+Qf3Scw0ZZ2dyV3ljRx?=
 =?us-ascii?Q?xaV7j4ZQktHcIop7U0vSYvOuYHVOSNZQ4H2nnfIr6p2f/xjhcGjDan/zfnm8?=
 =?us-ascii?Q?dwAAB04jYt4ygIXwtv2OBWE/ro0E7WIUnoC8s5rT/Kgibs9O8CFxdYpQTl3t?=
 =?us-ascii?Q?aMPscaENjYv/m7uS/MLZsETAtO/ZOWOG1erCbVZ0lHwAnjrEaLtJoEdiZpBa?=
 =?us-ascii?Q?+7r5CYWpP0uGo4+rSNgI+qq53Upu7c6cRBoKd88Ap0BAzI51H8ZR8fKcW8vX?=
 =?us-ascii?Q?6/UE/RkNrg0kmTy806uyEnrKYvkFfXpw3Mty9SJJ5MYV5UOYbsCIGDwksj7X?=
 =?us-ascii?Q?sJuo3DqHe8Gaj1pldWurIj2ZJdRdLc/MrP1ANR56x8k9Uya9EVIB5UogBlgS?=
 =?us-ascii?Q?qwLp6SAhEATEEGn0onAnv7BCZtP7uNKKMKKxRzbhpfFUrjSyNAnvonyXzS68?=
 =?us-ascii?Q?r/SBTFDy73FE/ZIHc4Xrc3cEpa92b54G7/y72c4n5QWZPXrM+Ez8IpmVugRH?=
 =?us-ascii?Q?xGp968p0ormu6DVS8c7i63S4iDaPm0K1mzXA5jwzrnqI3yDPk5HYSurq9CF6?=
 =?us-ascii?Q?CxN9meH91uFa1ER8qEwAEuSysPM20/CH4BHB/uYU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a972dca-ad18-40a3-e604-08dd72837e91
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:45:24.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlPTJBOSwEC8tzNU4BIEbOTVFTW+rDe22CTVpEjP72t+yrEZu5GfY3/YrIoUuhnUq0bYyQgujDEcjPCMh7iy+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Proofpoint-GUID: Vcs5ETuUZjLJAl4tAteFOmoq09hFCIFX
X-Proofpoint-ORIG-GUID: Vcs5ETuUZjLJAl4tAteFOmoq09hFCIFX
X-Authority-Analysis: v=2.4 cv=G+4cE8k5 c=1 sm=1 tr=0 ts=67ee3c9b cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=iX_doNFVrK8UyYuocnMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116532

From: Chen Qi <Qi.Chen@windriver.com>

Add a mechanism to check mismatch between runtime version and build time version.

To use, add the following line to local.conf:

  include conf/version-check.conf

Ideally, layers will have their own conf/version-check.conf to establish
some baseline, so that any future warning indicates some error. In such
case, users can use include_all:

  include_all conf/version-check.conf

The basic idea is to use qemu to run executables at build time, extract
possible versions, and check if there's a mismatch found.

Python meta data and .pc files are also checked for quick match. This
is because such info are also easy to be checked by users.

check-version-mismatch.bbclass is the class that does the actual work.
A new variable, CHECK_VERSION_PV, is introduced. It defaults to ${PKGV},
but also allows override. This allows us to handle special cases in each
layer.

version-check.conf is the configuration file that makes this functionality
easier to use and draws some baseline. It contains some override settings
for some recipes. With these overrides, all recipes in oe-core are handled
well. All warnings are valid warnings.

Note that 'ps' is added to HOSTTOOLS in version-check.conf. This is because
we need 'ps' to find stale processes and then clean them.

The warnings are like below:

  WARNING: time-1.9-r0 do_package_check_version_mismatch: Possible runtime versions ['UNKNOWN'] do not match recipe version 1.9
  WARNING: python3-unittest-automake-output-0.2-r0 do_package_check_version_mismatch: Possible runtime versions ['0.1'] do not match recipe version 0.2
  WARNING: pinentry-1.3.1-r0 do_package_check_version_mismatch: Possible runtime versions ['1.3.1-unknown'] do not match recipe version 1.3.1
  ...

There will be a data directory containing all details: tmp/check-version-mismatch.
This directory contains detailed data for each recipe that is built.
If users don't want it, they can set DEBUG_VERSION_MISMATCH_CHECK to 0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../classes/check-version-mismatch.bbclass    | 399 ++++++++++++++++++
 meta-oe/conf/version-check.conf               |  22 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta-oe/classes/check-version-mismatch.bbclass
 create mode 100644 meta-oe/conf/version-check.conf

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
new file mode 100644
index 0000000000..7b46151b03
--- /dev/null
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -0,0 +1,399 @@
+inherit qemu
+
+ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
+DEBUG_VERSION_MISMATCH_CHECK ?= "1"
+CHECK_VERSION_PV ?= ""
+
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
+
+QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+
+python do_package_check_version_mismatch() {
+    import re
+    import subprocess
+    import shutil
+    import signal
+
+    classes_skip = ["nopackage", "image", "native", "cross", "crosssdk", "cross-canadian"]
+    for cs in classes_skip:
+        if bb.data.inherits_class(cs, d):
+            bb.note(f"Skip do_package_check_version_mismatch as {cs} is inherited.")
+            return
+
+    if not bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')):
+        bb.note("Skip do_package_check_version_mismatch as ENABLE_VERSION_MISMATCH_CHECK is disabled.")
+        return
+
+    __regexp_version_broad_match__ = re.compile(r"(?:\s|^|-|_|/|=| go|\()" +
+                                                r"(?P<version>v?[0-9][0-9.][0-9+.\-_~\(\)]*?|UNKNOWN)" +
+                                                r"(?:[+\-]release.*|[+\-]stable.*|)" +
+                                                r"(?P<extra>[+\-]unknown|[+\-]dirty|[+\-]rc?\d{1,3}|\+cargo-[0-9.]+|" +
+                                                r"[a-z]|-?[pP][0-9]{1,3}|-?beta[^\s]*|-?alpha[^\s]*|)" +
+                                                r"(?P<extra2>[+\-]dev|[+\-]devel|)" +
+                                                r"(?:,|:|\.|\)|-[0-9a-g]{6,42}|)" +
+                                                r"(?=\s|$)"
+                                                )
+    __regexp_exclude_year__ = re.compile(r"^(19|20)[0-9]{2}$")
+    __regexp_single_number_ending_with_dot__ = re.compile(r"^\d\.$")
+
+    def is_shared_library(filepath):
+        return re.match(r'.*\.so(\.\d+)*$', filepath) is not None
+
+    def get_possible_versions(output_contents, full_cmd=None, max_lines=None):
+        #
+        # Algorithm:
+        #   1. Check version line by line.
+        #   2. Skip some lines which we know that do not contain version information, e.g., License, Copyright.
+        #   3. Do broad match, finding all possible versions.
+        #   4. If there's a version found by any match, do exclude match (e.g., exclude years)
+        #   5. If there's a valid version, do stripping and converting and then add to possible_versions.
+        #   6. Return possible_versions
+        #
+        possible_versions = []
+        content_lines = output_contents.split("\n")
+        if max_lines:
+            content_lines = content_lines[0:max_lines]
+        if full_cmd:
+            base_cmd = os.path.basename(full_cmd)
+        __regex_help_format__ = re.compile(r"-[^\s].*")
+        for line in content_lines:
+            line = line.strip()
+            # skip help lines
+            if __regex_help_format__.match(line):
+                continue
+            # avoid command itself affecting output
+            if full_cmd:
+                if line.startswith(base_cmd):
+                    line = line[len(base_cmd):]
+                elif line.startswith(full_cmd):
+                    line = line[len(full_cmd):]
+            # skip specific lines
+            skip_keywords_start = ["copyright", "license", "compiled", "build", "built"]
+            skip_line = False
+            for sks in skip_keywords_start:
+                if line.lower().startswith(sks):
+                    skip_line = True
+                    break
+            if skip_line:
+                continue
+
+            # try broad match
+            for match in __regexp_version_broad_match__.finditer(line):
+                version = match.group("version")
+                #print(f"version = {version}")
+                # do exclude match
+                exclude_match = __regexp_exclude_year__.match(version)
+                if exclude_match:
+                    continue
+                exclude_match = __regexp_single_number_ending_with_dot__.match(version)
+                if exclude_match:
+                    continue
+                # do some stripping and converting
+                if version.startswith("("):
+                    version = version[1:-1]
+                if version.startswith("v"):
+                    version = version[1:]
+                if version.endswith(")") and "(" not in version:
+                    version = version[:-1]
+                # handle extra version info
+                version = version + match.group("extra") + match.group("extra2")
+                possible_versions.append(version)
+        return possible_versions
+
+    def is_version_mismatch(rvs, pv):
+        got_match = False
+        if pv.startswith("git"):
+            return False
+        if "-pre" in pv:
+            pv = pv.split("-pre")[0]
+        if pv.startswith("v"):
+            pv = pv[1:]
+        for rv in rvs:
+            if rv == pv:
+                got_match = True
+                break
+            pv = pv.split("+git")[0]
+            # handle % character in pv which means matching any chars
+            if '%' in pv:
+                escaped_pv = re.escape(pv)
+                regex_pattern = escaped_pv.replace('%', '.*')
+                regex_pattern = f'^{regex_pattern}$'
+                if re.fullmatch(regex_pattern, rv):
+                    got_match = True
+                    break
+                else:
+                    continue
+            # handle cases such as 2.36.0-r0 v.s. 2.36.0
+            if "-r" in rv:
+                rv = rv.split("-r")[0]
+            chars_to_replace = ["-", "+", "_", "~"]
+            # convert to use "." as the version seperator
+            for cr in chars_to_replace:
+                rv = rv.replace(cr, ".")
+                pv = pv.replace(cr, ".")
+            if rv == pv:
+                got_match = True
+                break
+            # handle case such as 5.2.37(1) v.s. 5.2.37
+            if "(" in rv:
+                rv = rv.split("(")[0]
+                if rv == pv:
+                    got_match = True
+                    break
+            # handle case such as 4.4.3p1
+            if "p" in pv and "p" in rv.lower():
+                pv = pv.lower().replace(".p", "p")
+                rv = rv.lower().replace(".p", "p")
+                if pv == rv:
+                    got_match = True
+                    break
+            # handle cases such as 6.00 v.s. 6.0
+            if rv.startswith(pv):
+                if rv == pv + "0" or rv == pv + ".0":
+                    got_match = True
+                    break
+            elif pv.startswith(rv):
+                if pv == rv + "0" or pv == rv + ".0":
+                    got_match = True
+                    break
+            # handle cases such as 21306 v.s. 2.13.6
+            if "." in pv and not "." in rv:
+                pv_components = pv.split(".")
+                if rv.startswith(pv_components[0]):
+                    pv_num = 0
+                    for i in range(0, len(pv_components)):
+                        pv_num = pv_num * 100 + int(pv_components[i])
+                    if pv_num == int(rv):
+                        got_match = True
+                        break
+        if got_match:
+            return False
+        else:
+            return True
+
+    # helper function to get PKGV, useful for recipes such as perf
+    def get_pkgv(pn):
+        pkgdestwork = d.getVar("PKGDESTWORK")
+        recipe_data_fn = pkgdestwork + "/" + pn
+        pn_data = oe.packagedata.read_pkgdatafile(recipe_data_fn)
+        if not "PACKAGES" in pn_data:
+            return d.getVar("PV")
+        packages = pn_data["PACKAGES"].split()
+        for pkg in packages:
+            pkg_fn = pkgdestwork + "/runtime/" + pkg
+            pkg_data = oe.packagedata.read_pkgdatafile(pkg_fn)
+            if "PKGV" in pkg_data:
+                return pkg_data["PKGV"]
+
+    #
+    # traverse PKGD, find executables and run them to get runtime version information and compare it with recipe version information
+    #
+    enable_debug = bb.utils.to_boolean(d.getVar("DEBUG_VERSION_MISMATCH_CHECK"))
+    pkgd = d.getVar("PKGD")
+    pn = d.getVar("PN")
+    pv = d.getVar("CHECK_VERSION_PV")
+    if not pv:
+        pv = get_pkgv(pn)
+    qemu_exec = d.getVar("QEMU_EXEC").strip()
+    executables = []
+    possible_versions_all = []
+    data_lines = []
+
+    if enable_debug:
+        debug_directory = d.getVar("TMPDIR") + "/check-version-mismatch"
+        debug_data_file = debug_directory + "/" + pn
+        os.makedirs(debug_directory, exist_ok=True)
+        data_lines.append("pv: %s\n" % pv)
+
+    got_quick_match_result = False
+    # handle python3-xxx recipes quickly
+    __regex_python_module_version__ = re.compile(r"(?:^|.*:)Version: (?P<version>.*)$")
+    if "python3-" in pn:
+        version_check_cmd = "find %s -name 'METADATA' | xargs grep '^Version: '" % pkgd
+        try:
+            output = subprocess.check_output(version_check_cmd, shell=True).decode("utf-8")
+            data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+            data_lines.append("output:\n'''\n%s'''\n" % output)
+            possible_versions = []
+            for line in output.split("\n"):
+                match = __regex_python_module_version__.match(line)
+                if match:
+                    possible_versions.append(match.group("version"))
+            possible_versions = sorted(set(possible_versions))
+            data_lines.append("possible versions: %s\n" % possible_versions)
+            if is_version_mismatch(possible_versions, pv):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions, pv))
+            else:
+                data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+            got_quick_match_result = True
+        except:
+            data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+            data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    # handle .pc files
+    version_check_cmd = "find %s -name '*.pc' | xargs grep -i version" % pkgd
+    try:
+        output = subprocess.check_output(version_check_cmd, shell=True).decode("utf-8")
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("output:\n'''\n%s'''\n" % output)
+        possible_versions = get_possible_versions(output)
+        possible_versions = sorted(set(possible_versions))
+        data_lines.append("possible versions: %s\n" % possible_versions)
+        if is_version_mismatch(possible_versions, pv):
+            if pn.startswith("lib"):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions, pv))
+                got_quick_match_result = True
+            else:
+                data_lines.append("result: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+        else:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+            got_quick_match_result = True
+    except:
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    skipped_directories = [".debug", "ptest", "installed-tests", "tests", "test", "__pycache__", "testcases"]
+    pkgd_libdir = pkgd + d.getVar("libdir")
+    pkgd_base_libdir = pkgd + d.getVar("base_libdir")
+    extra_exec_libdirs = []
+    for root, dirs, files in os.walk(pkgd):
+        for dname in dirs:
+            fdir = os.path.join(root, dname)
+            if os.path.isdir(fdir) and fdir != pkgd_libdir and fdir != pkgd_base_libdir:
+                if fdir.startswith(pkgd_libdir) or fdir.startswith(pkgd_base_libdir):
+                    for sd in skipped_directories:
+                        if fdir.endswith("/" + sd) or ("/" + sd + "/") in fdir:
+                            break
+                    else:
+                        extra_exec_libdirs.append(fdir)
+        for fname in files:
+            fpath = os.path.join(root, fname)
+            if os.path.isfile(fpath) and os.access(fpath, os.X_OK):
+                for sd in skipped_directories:
+                    if ("/" + sd + "/") in fpath:
+                        break
+                else:
+                    if is_shared_library(fpath):
+                        # we don't check shared libraries
+                        continue
+                    else:
+                        executables.append(fpath)
+    if enable_debug:
+        data_lines.append("executables: %s\n" % executables)
+
+    found_match = False
+    some_cmd_succeed = False
+    if not executables:
+        bb.debug(1, "No executable found for %s" % pn)
+        data_lines.append("FINAL RESULT: NO_EXECUTABLE_FOUND\n\n")
+    else:
+        # first we extend qemu_exec to include library path if needed
+        if extra_exec_libdirs:
+            qemu_exec += ":" + ":".join(extra_exec_libdirs)
+        for fexec in executables:
+            for version_option in ["--version", "-V", "-v", "--help"]:
+                version_check_cmd_full = "%s %s %s" % (qemu_exec, fexec, version_option)
+                version_check_cmd = version_check_cmd_full
+                #version_check_cmd = "%s %s" % (os.path.relpath(fexec, pkgd), version_option)
+                
+                try:
+                    cwd_temp = d.getVar("TMPDIR") + "/check-version-mismatch/cwd-temp/" + pn
+                    os.makedirs(cwd_temp, exist_ok=True)
+                    # avoid pseudo to manage any file we create
+                    sp_env = os.environ.copy()
+                    sp_env["PSEUDO_UNLOAD"] = "1"
+                    output = subprocess.check_output(version_check_cmd_full,
+                                                     shell=True,
+                                                     stderr=subprocess.STDOUT,
+                                                     cwd=cwd_temp,
+                                                     timeout=10,
+                                                     env=sp_env).decode("utf-8")
+                    some_cmd_succeed = True
+                    data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+                    data_lines.append("output:\n'''\n%s'''\n" % output)
+                    if version_option == "--help":
+                        max_lines = 5
+                    else:
+                        max_lines = None
+                    possible_versions = get_possible_versions(output, full_cmd=fexec, max_lines=max_lines)
+                    if "." in pv:
+                        possible_versions = [item for item in possible_versions if "." in item or item == "UNKNOWN"]
+                    data_lines.append("possible versions: %s\n" % possible_versions)
+                    if not possible_versions:
+                        data_lines.append("result: NO_RUNTIME_VERSION_FOUND\n\n")
+                        continue
+                    possible_versions_all.extend(possible_versions)
+                    possible_versions_all = sorted(set(possible_versions_all))
+                    if is_version_mismatch(possible_versions, pv):
+                        data_lines.append("result: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                    else:
+                        found_match = True
+                        data_lines.append("result: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                        break
+                except:
+                    data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+                    data_lines.append("result: RUN_FAILED\n\n")
+                finally:
+                    shutil.rmtree(cwd_temp)
+            if found_match:
+                break
+    if executables:
+        if found_match:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n" % (possible_versions_all, pv))
+        elif len(possible_versions_all) == 0:
+            if some_cmd_succeed:
+                bb.debug(1, "No valid runtime version found")
+                data_lines.append("FINAL RESULT: NO_VALID_RUNTIME_VERSION_FOUND\n")
+            else:
+                bb.debug(1, "All version check command failed")
+                data_lines.append("FINAL RESULT: RUN_FAILED\n")
+        else:
+            bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions_all, pv))
+            data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n" % (possible_versions_all, pv))
+
+    if enable_debug:
+        with open(debug_data_file, "w") as f:
+            f.writelines(data_lines)
+
+    # clean up stale processes
+    process_name_common_prefix = "%s %s" % (' '.join(qemu_exec.split()[1:]), pkgd)
+    find_stale_process_cmd = "ps -e -o pid,args | grep -v grep | grep -F '%s'" % process_name_common_prefix
+    try:
+        stale_process_output = subprocess.check_output(find_stale_process_cmd, shell=True).decode("utf-8")
+        stale_process_pids = []
+        for line in stale_process_output.split("\n"):
+            line = line.strip()
+            if not line:
+                continue
+            pid = line.split()[0]
+            stale_process_pids.append(pid)
+        for pid in stale_process_pids:
+            os.kill(int(pid), signal.SIGKILL)
+    except Exception as e:
+        bb.debug(1, "No stale process")
+}
+
+addtask do_package_check_version_mismatch after do_package before do_build
+
+do_build[rdeptask] += "do_package_check_version_mismatch"
+do_rootfs[recrdeptask] += "do_package_check_version_mismatch"
+
+SSTATETASKS += "do_package_check_version_mismatch"
+do_package_check_version_mismatch[sstate-inputdirs] = ""
+do_package_check_version_mismatch[sstate-outputdirs] = ""
+python do_package_check_version_mismatch_setscene () {
+    sstate_setscene(d)
+}
+addtask do_package_check_version_mismatch_setscene
diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
new file mode 100644
index 0000000000..c41df0d496
--- /dev/null
+++ b/meta-oe/conf/version-check.conf
@@ -0,0 +1,22 @@
+INHERIT += "check-version-mismatch"
+# we need ps command to clean stale processes
+HOSTTOOLS += "ps"
+
+# Special cases that need to be handled.
+# % has the same meaning as in bbappend files, that is, match any chars.
+
+# oe-core
+CHECK_VERSION_PV:pn-rust-llvm = "${LLVM_RELEASE}"
+CHECK_VERSION_PV:pn-igt-gpu-tools = "${PV}-${PV}"
+CHECK_VERSION_PV:pn-vim = "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
+CHECK_VERSION_PV:pn-vim-tiny = "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
+CHECK_VERSION_PV:pn-ncurses = "${PV}.%"
+CHECK_VERSION_PV:pn-alsa-tools = "%"
+CHECK_VERSION_PV:pn-gst-examples = "%"
+CHECK_VERSION_PV:pn-libedit = "${@d.getVar('PV').split('-')[1]}"
+
+# meta-oe
+CHECK_VERSION_PV:pn-iozone3 = "3.${PV}"
+CHECK_VERSION_PV:pn-can-utils = "%"
+CHECK_VERSION_PV:pn-luajit = "${PV}.%"
+CHECK_VERSION_PV:pn-sg3-utils = "%"
-- 
2.49.0


