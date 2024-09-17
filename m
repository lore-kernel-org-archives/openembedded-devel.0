Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACA4C3ABD0
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 04:06:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13512.1726545970502420058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 21:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=999099458e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H41FmM006034
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1tk20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8nWGX6lmXFCFYyr8VWcU1vtVUDkA395pkKDc8mJWiAQ/4tB4gKHJz0UwqvTEHVeb4WyEV+qUFjEBXNshPB19emq4GEkW3iMyl+WXUBXeAcj5/4SnrvmyNj0Lk3dV53v1Qv/QSKCGbeXft4lHCMUhJ95R7RMNJGKemEyNBNLfqLlhUopRXhuGWrqpq4tDMP60qwSHxTuoPQXsP06eNH3HiW6HcVLXysoTbqy18lkwFZ08YEjPF2eQ3+uLXorkp0vcBAX6ont4O4Zy3I93w7R3uzPCtud8FlLxtZ8BSqczIyLTglo5RLKBsRFzUcEWbrdDSactwhql1/qzYK5EHkQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipzLgkOIinVq2xhPpq+9h1Gzy5wCYB8eWAc2ios6RB4=;
 b=AeKMwFOgDhIuuT2BLVbAGbJ9JuKn67zNizS7p8O9ZwtJkbh0qieZHOYh/T0rZeRrimx0yw+wTy09WS6OZLqXcfjNr/DPAHgQ9NoJW3vWqBhNz7RVF5pOI2jC2EIJ/W3sNnfr/mfLe1qwcAI3Wya6jX17HMCeBDYbUl73j11VeJicdv3udUl4BHizPiT0Lsm8GxFMIcW3SGu2VqxSuKNOp2F/Y/bYegDCyZCXZLQbiOm2P7dzn9JmgzV/da4TXsfCnxOiebSS625cKNofcx04BXVjwWIBCarAJ+//7N86MmV72iFRfC9LYM+yGGxUxIeV7OAGTryF+gUrEYQNkprHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 04:06:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:06:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] v4l-utils: upgrade 1.26.1 -> 1.28.1
Date: Tue, 17 Sep 2024 12:05:56 +0800
Message-Id: <20240917040558.2231178-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fbed2d-aa81-4a95-9a48-08dcd6ce0e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CoDY/u7kOrxG8ah+b9vMp2C0Qst/sgWCBYhe0Acq4YU+xJr8hmhgIfXhE15g?=
 =?us-ascii?Q?lKdoktplIjJqQ8ycDY2/SfS78Kq4We2GiCOXqklE2ND7NB4Fb/ZQjkz7eWt9?=
 =?us-ascii?Q?NOc28Lp6dALCAKTlWcv3mwDBmoL4uzrP9aoDh1x/85uC4ARD0IcPTOgkUO+Z?=
 =?us-ascii?Q?jxytdG6rcDtf0IFwxMjhYis/qymdJzkKZj4BwAHNIXqG2+a7ISxSmJLAM/8I?=
 =?us-ascii?Q?TYZX//HC4cZXPdw64lmQ4aN8JFBv81DqHX48WzU3gz0sejuIIybsrE00K2kg?=
 =?us-ascii?Q?zMzfqXwVe7D18p3BBlEUfScpzmGbfUJNkNzcFQsCnNx1ORN+hU+BvB+BsX3a?=
 =?us-ascii?Q?o1N07BVRRVjsdVSfhUPp7/rRAJGWEvJng52S0JUF2hfmdbTsOkNUSGGM2tdp?=
 =?us-ascii?Q?Xqm8FUGwgEbJQ7TcR2F2QtBwBWSX5vgMEIT0mW3CqhMBpK0gOrBWceh8MZaH?=
 =?us-ascii?Q?69W4TRDNN4gkzUH9WSkWlc50MMgKYt3htAdGYpq676LtVmPy4Ex7LMRtrT7j?=
 =?us-ascii?Q?TB8SZHBw5xD2G7BilI1BB0VczeYjGG5CONxmAE5zxbwAiUyC8HRPZWEOSVvt?=
 =?us-ascii?Q?FADKBPRRmYdzdxa55MPij2YNCm+rpo4bI7IXSAPXxCiPt6ssiV8MAoUoySbd?=
 =?us-ascii?Q?qL7bha+r5pgNCplVg1YpTvTxGGIE8b32bgQXMYnhU1ALJLuro7bgrOJuRgB9?=
 =?us-ascii?Q?bpSme17ox1QB1XqKH8ciIdIoX4d/PSfNJCcmkOVOFN+G+YwUVvzOCw+gleum?=
 =?us-ascii?Q?Q79OitKOJZwBOzimT+5f0GabJmXTfrRjggSNUQL9ogOSs+QjeWP3TPRa8QZ3?=
 =?us-ascii?Q?8410ZImFUP5/WXhtqQkQKP5K9gXpo97/V9s/oPKhgUX/wOWPaQ1R94+lE5VO?=
 =?us-ascii?Q?b+a3UawkXsfIGdnzthsNgnDnK2T2sKAYUiDYKaj8CDvAjA5SinIf8TBoBd7d?=
 =?us-ascii?Q?7Ru+PDxF/GYjaQr0sEYkHMHy6WQE+zZ/PuygmhqFQZWHTWSch6PhexbD5LPJ?=
 =?us-ascii?Q?1Srst7i7N0b7FKxyGdkNwbSU5/THZ6sAXRJthWBHkSUt9PkB+TBvXaWFXsVV?=
 =?us-ascii?Q?Afia8NuiEskA2YFZfOqNU3Q03aTIyYfXBSD6jW5RgzKCrpbzSpFK1cwIAJzR?=
 =?us-ascii?Q?k+rcpxZfbhAQ4WAVPgain2hK9+AdRYJtUYd8k+4oJ6lvCYpVrJ6ou/lvS1Np?=
 =?us-ascii?Q?DHRCNmP7IwiSrIS2fpUOTZ6B5vleCn/1GQ1pzLAOx0TL4eqBxnz6VkxkU+UI?=
 =?us-ascii?Q?Vp9RqFdBcywDiDUSGGwoh1rgk4ashTeQTeaMZoqwbWj5nMvsc5P/9S38K88g?=
 =?us-ascii?Q?dSKL3rrjtTQJPOm+9sW7zO+6M3a9qMAOn5vyx3hZ+/063Siij5Qc9ONRqHSG?=
 =?us-ascii?Q?t07gZQg0GzvRpVGvJHc9CFO7v4SnvnM157FfKfzi6JcW7tXEwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AP/uzpmoBAobwQsQ2mRvz3cfNgisMmjDt5Z5/Y88+LEJjUU8XXRtZbuaKPBp?=
 =?us-ascii?Q?921tEkW2NqP3zj+sHkqu7fAVtFhyRafUvJXUWIhzsnjaithhYET4L6VY5h/n?=
 =?us-ascii?Q?ZtXRhLgdQ5emnl67/QceutJ5yGoskwAf8bwc6YHM7g2pfQzQnXOJDdtX4Ru4?=
 =?us-ascii?Q?4Vfc/sXWjoypUPixHH5VOtcIRKup4m6KSEeNgAOrktM0t072YRTqMnMVkJV/?=
 =?us-ascii?Q?A98u+mo0Ymtz32nJ8IfAlkUHo8N/HhfGAAOTK4my+GmNV3zwdUXtuKnTfQ30?=
 =?us-ascii?Q?f+wHp+uhrm72yFe4hDaEnNNN++XUntfLiZUi3lzcvy1BfRqKU4SMEzIgSvqM?=
 =?us-ascii?Q?59dByUy1fDLmM985vqqiEWipNZMxmX5CEHRqE2MLAN7CKH6ptjHt1ttyoyZ7?=
 =?us-ascii?Q?chp4kPWQ1BhnEDBqKXqThOWomIlsetuQwRfHBHcO9JP3b/RXVIAFXtkt11SE?=
 =?us-ascii?Q?+TAzxiH2NwqcbGVVzKppX25Rplc+Pm8k+wT5qWVoN3lbZMz8nPYEOXest3xL?=
 =?us-ascii?Q?OAH68FjBZ3R7+V2OXjI15z3RF80fZP/ZkL32eM0jfopKdb9eNjstlfYBQXvf?=
 =?us-ascii?Q?3lZmxyGu9pDVi/27YbeNoFlKgT7Wgmq33LuPrdJ3hOudysnDb1956Nvp4aD/?=
 =?us-ascii?Q?913C3XzOOCbnZCOFA+uBm+DACac4sfi0h67PmNMLz8sOBc2FpRqi0gLqFJKy?=
 =?us-ascii?Q?IJOm1EFQNV6/lbN4vB7+w+Skb21ogwA93mdtwdHArenuX2tVhV6VMDEpRBqg?=
 =?us-ascii?Q?XjTyyQh5oVznqC9la/LMoD5MmNgKu1P8I4PSg70/qwlzP9KRsodzVf3sXbOS?=
 =?us-ascii?Q?JY+ubC3mrTkfuaAyvQgGfAgG6SJc7EocT+PxcmSZewnZfZC7YlPvtNvp/I7F?=
 =?us-ascii?Q?jpgEcKsgCyN9Yd01caeFRQDjLI2fMy+j+O4/6L7qxJw/iBE6y5D4kdi1JPoK?=
 =?us-ascii?Q?97k2BQQeT/1Dl86NlAuk7EqPy/41G+AXj+sHlhm6IGppqR5RUgOmzx/v/u6j?=
 =?us-ascii?Q?aFdPTAscO6aMyvj5AD1b20x+AzjJEqJnAfunp9GPaEbQSBzbBZ3Y9SWjbf+P?=
 =?us-ascii?Q?rZc/M2Zy6/TfT+v7KuGotX0XjzzKFA8Wdve/kLLQ0FWbL82FxnrFv74OJ37B?=
 =?us-ascii?Q?a3uzv6z4kVCpxWIl9A0XQWpDHmgGcKPsk/BBgaClFR5DdFcewi766MJjxRcR?=
 =?us-ascii?Q?DWlaH5A5hA+Qu2wQT7hlRCuJ7oySVR8zF8lDTWPgESvAz8QAfwtwwpGpd1Pd?=
 =?us-ascii?Q?jdAD4ElfJaeuJxnUEIK9wk79rS2PgjrEoPkCNfsugx/hurVyBAfrjOtSr55o?=
 =?us-ascii?Q?IOAdiS2dgAF6dRx9oXLKjSgy6+IxIsJeanJlT5xNi04Qz8c1DL+JhK/bCslg?=
 =?us-ascii?Q?jO3qGWTwqU2vEEyE0DVQJ8JLt0Aqf1LVxT3yRWhgHK3M9R4bxV0sWfoUN2H4?=
 =?us-ascii?Q?6LgL6wAORS3GHfX49znrDvHFFiz5L4Ib33HTs0YRbZIJFPYX7UYbjz/Yfgwc?=
 =?us-ascii?Q?em9h/aDnqeDzQeDu4OG71hg+8PtQ8HWHU9Q4TEGoJRUzetVZmEbyXAqGcqyu?=
 =?us-ascii?Q?IS6C10fA/B3Sy3kYiZhDUVSLKbisyXJEEKMVslJe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fbed2d-aa81-4a95-9a48-08dcd6ce0e32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:06:07.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjEnsoQ57tC6g3A3csz1zfNW5bz+r8idmCBN87GneMdf4gYCmOr1JvFSzryKpxp7LmODY939l6c2iXd9RwRgrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e90031 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=xq3W2uTSAAAA:8 a=t7CeM3EgAAAA:8 a=xGAvDSoXAAAA:8
 a=NEAV23lmAAAA:8 a=hDRx_iO2LUVl1rjlVbYA:9 a=P5L7wpMTXyg1GfFA3Gwx:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I9AbH5bZuplaqbmfSwNo:22
X-Proofpoint-GUID: uByjzUyA6pqYT9eKKQKV-am7ZxaCd2Yw
X-Proofpoint-ORIG-GUID: uByjzUyA6pqYT9eKKQKV-am7ZxaCd2Yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_01,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409170028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112323

ChangeLog:
https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.28.1

* Drop backport patch
* Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...estrict-the-installation-of-50-rc_ke.patch | 46 -------------------
 ...4l-utils_1.26.1.bb => v4l-utils_1.28.1.bb} |  9 ++--
 2 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.26.1.bb => v4l-utils_1.28.1.bb} (95%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
deleted file mode 100644
index 64c01e497..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 502c0302827cec3d2b2a69fb25189646685ef2ff Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@denx.de>
-Date: Fri, 12 Jan 2024 00:17:14 -0300
-Subject: [PATCH] keytable: meson: Restrict the installation of
- 50-rc_keymap.conf
-
-Currently, meson tries to install 50-rc_keymap.conf even if systemd
-is not used.
-
-Commit 01f2c6c58e6f ("keytable: restrict installation of 50-rc_keymap.conf"),
-only allowed 50-rc_keymap.conf to be installed when both BPF and systemd
-were used.
-
-Apply the same logic in meson to fix the problem.
-
-Signed-off-by: Fabio Estevam <festevam@denx.de>
-Signed-off-by: Sean Young <sean@mess.org>
-Upstream-Status: Backport [https://git.linuxtv.org/v4l-utils.git/commit/?id=a21924ec424c4744af6f2a794e0677eba35dd168]
----
- utils/keytable/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
-index 4130a4bea514..76ce329eae8e 100644
---- a/utils/keytable/meson.build
-+++ b/utils/keytable/meson.build
-@@ -69,6 +69,8 @@ ir_keytable_udev_rules = files(
- install_data(ir_keytable_udev_rules,
-              install_dir : ir_keytable_system_dir / 'rules.d')
-
-+if ir_bpf_enabled
-+if dep_systemd.found()
- if have_udevdsyscallfilter
-     ir_keytable_systemd_files = files(
-         '50-rc_keymap.conf',
-@@ -76,6 +78,8 @@ if have_udevdsyscallfilter
-     install_data(ir_keytable_systemd_files,
-                  install_dir : systemd_systemdir / 'systemd-udevd.service.d')
- endif
-+endif
-+endif
-
- # Install non-existing directory to create empty directory structure
- # See: https://github.com/mesonbuild/meson/issues/2904
---
-2.34.1
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
similarity index 95%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index 8ab96760a..afe217e1f 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -26,18 +26,17 @@ PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
 PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
 
 SRC_URI = "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
-    file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
     file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
 "
 
-SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
-
-PV .= "+git"
+SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
 
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v4l-utils-(?P<pver>\d+(\.\d+)+)"
+
 EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
 
 # Disable the erroneous installation of gconv-modules that would break glib
-- 
2.25.1


