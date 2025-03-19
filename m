Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B866BC35FF3
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 03:14:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4303.1742354075739106407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 20:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517397307f=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J2QvxC004413
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 03:14:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0v5tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 03:14:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlbdgcD/nE2AfHLjhYx5Fgw/awQhsypbArULeDJwnNZUQynp1Q3C1NRRMVwO293hSD/1c0jFK3YYz/lIL4qPEM/3vgjQyotUHQLVZocOhriyad5VbRIufrKl3UMD+wItoVQxwGAh1hWifb/dc4xl7a9dx/k3UCof9BhQtWWfmK0gVfO/k/wt/NeXcsaUTLJ2vOSMNw2aS7OefYb2VVDeznBU7KuX7mh4SNZ6CgMZLfLcp4nMKpxjSr6AeYAl0ZetmTlPM0qL2JzErNfov02g3FFlk/aUa4g/Tr8ijQhkZqlQiO+wPhljM0XTXwan913/aigmdgfv5cluWWfNiTFr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nxdx60YuTLIHuFpvCaVGX9IY3PnkQtopa2dMiciLQf0=;
 b=Hloz84hP8Zz/l/KuNti6irfI4W2PSu/sCNu1fDXw4nkNcmbFOpu3OWKe6hFfmDLHDrbpaLDhdVAtscIhmTl4a16HR/eEt3tWTI61OHMvy+BfpaUKiI1YxkosIlADfmALk/ddiNJhBx0tcYEcYo3l4Uuu26PlMQwBEeex2ilwd96lT7zgDAlqMDQ0uZjqV0shQglUkeI7I51e83NMclP7Zw4L8/VDYTEev039mVxy1D4NveuaF8yZRoCIFyy8HU4DuWwh4YFcJS4XvpLMbAG0hgQYLHZu/JcvP6/jaejm43z0s0dT73KCQOHceZYusSjmk/ujT2TqUPCtLrezUZylzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 03:14:31 +0000
Received: from BN9PR11MB5531.namprd11.prod.outlook.com
 ([fe80::2d59:8261:c261:1d9e]) by BN9PR11MB5531.namprd11.prod.outlook.com
 ([fe80::2d59:8261:c261:1d9e%7]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 03:14:31 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] netplan: Fix CVE-2022-4968
Date: Wed, 19 Mar 2025 11:14:11 +0800
Message-Id: <20250319031411.3194592-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::11) To BN9PR11MB5531.namprd11.prod.outlook.com
 (2603:10b6:408:104::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5531:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 064ee4c0-1e07-42bc-d384-08dd66942a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8/DaxtBvtYXKIQUafirOzMVxNjOM1cVPU9C7bLRNcfrUaWTSsiNAR0lbIUMu?=
 =?us-ascii?Q?FmTbt56KmA2P9SBgany+7eFOmGLSfuTSc7qMwwUx3U8+8UlnPpOCCTG02j8v?=
 =?us-ascii?Q?I6ofd+X5pBbrd2s6y9fqfA/rnVyINar2vAnMAQuidQCAPJC/ycTW/W0p6AzI?=
 =?us-ascii?Q?WwrD157ZbLJgjyoo0SlI3Pcq34M7yCHsUY9GfjqsVLPGzcgHhk2z8Xoo04tT?=
 =?us-ascii?Q?EHrvGNF8c2dQpRPt50rpGsSP8IcmxzBJ38EPAHN5jhvlgM57ImYjFls0v6y1?=
 =?us-ascii?Q?BQWCR46wQcX3CiQsSa03H3hOoxNlGlHj8Qatz2Qb1uCZM6JKc+aflhS/Rj2u?=
 =?us-ascii?Q?1y81Dx+AGzu6F+PHeiyoAsvixy5jpEAr5/OdVq8GRRXR8VDihTkNYFCMZAIE?=
 =?us-ascii?Q?sZpfMtuT8Qarp4vf1pyNbL/86H8XMliDrajBSDRPYPMcjBUJrCgazh/PrU9T?=
 =?us-ascii?Q?rSa/A2A5PygP1RYTUpeYVNM48nOvciu6qp4gNG72OYjJkUcbbU1ogu/cOr2R?=
 =?us-ascii?Q?YHd8q5Sl67jxUFFDoZRoEQcnkqz8clV/47EB8w1h6hGfAxvC+SCF8tLibsru?=
 =?us-ascii?Q?BsFz/jpK7y5YZKPo4nUUVr8xfDkD8juV804uctE+Q2zUiswI32MBZq7TRnsy?=
 =?us-ascii?Q?pwds59z/GU3GdjYA1HmXL6HSrV0G5MD+DqqCE8ahRVvWdCp0rOOtV4Z9t6EE?=
 =?us-ascii?Q?JDGLsJuLpqgDm7/eZ6DTSEXHb2DcFVnrH6V++Sze2ucBsS5VlA291yTWRmls?=
 =?us-ascii?Q?+yFWYTRFgy+HPhVyFno/8eM4A33tRzuAL836xrm+aOOGDRgnSvDPxsLWnNdb?=
 =?us-ascii?Q?gvq/M6+AYiEH+yMESwIGmHUROwRRtnYZh4OEbwTjjSIDMkoRiA14CwKtNAk7?=
 =?us-ascii?Q?GBFqhWsYVLEVTGOYCkF9KeE7sxZzeaegFp0bG6++OGsyBSFoHubwche7XqCY?=
 =?us-ascii?Q?6f13O/IvBqhUGgylM8lze7vOTlH1AJqg4QOUClJf1g9oNFKoiQNyhJzySwCq?=
 =?us-ascii?Q?OBXBLWTSJQjLGohsw0Yzu2U6+0lQRWdB34/ToB/1g4tk1gjxvLO5QP+k2MbY?=
 =?us-ascii?Q?OBT+DmCkfqZNQ2V/Zy8yQ0OB3lBvrrQnmVGEE0//UuqBKmIzNT9UIsArYdIv?=
 =?us-ascii?Q?DSFy1YXOzH7xyw/WxP47d+iBXi9Iwad+CZMKv+8OLew8DcUSp89CTZFibbmi?=
 =?us-ascii?Q?MZb8S5sPBoG4+NcGm3xxq7iIMcefY5nj930G8KTjFXAH6tp6Vn7zd329+yBN?=
 =?us-ascii?Q?vbK9G0TkpB0RYhMjS1Vje5VoGN/dYgW6DJIvEyxLrcBq8J9f9dkNUBMisAP9?=
 =?us-ascii?Q?dEv6bdt6uLw56uWDdQ37DdcBfNBXygvsyM5pK3uLETS/5LOlLF/WjPl/sCoC?=
 =?us-ascii?Q?F9lz4IUkegvhqMuvOeuHUOCqSX5WeReFYxOuUDGrHzTVfb7wAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MN/m1N9tk7Hfqrmd+66cSLWXPKcu+brTlEtxQxDWdTRvXxM0AHIGWIu+a7hM?=
 =?us-ascii?Q?6aMMcWPtd4DmLXw4vZtKOZIWAQWmhaQtsMHw4g6KHR2fIri9PmBxxJMQPJ+m?=
 =?us-ascii?Q?1Y0gNI1ZFQmIiZBGg6uWVb0Ewu3Q9dHDQFfin04vdg3ShM9G8aKb00F9EQl2?=
 =?us-ascii?Q?fHdcFpKhNVelQgk3H/7cvq4yPhMEWeb4T/s6UwvUIO03nj2M9R3Fi3ypwGX3?=
 =?us-ascii?Q?dlVdx7bmzFX42lQ2W64vP8pwMkc4mjUuKLTrSyhCEWbCXIv+tZXGcDbQyCYO?=
 =?us-ascii?Q?gPF+XdetEDyHno5/o4pbOXw3pfiBGLznwC33wOGT4N9iJ7iuGop+67gCx0Jy?=
 =?us-ascii?Q?ZVbh+qvPeK2j5SpErHp00SSXEXPabg9fZElFS07mXvo7PYqnc1HcdsOXYQ7t?=
 =?us-ascii?Q?7qa5i1IkRbhlslOre6SjT3X3IKiER1K6F752dEb5UQQo8RJbVnTqxwrPnxwp?=
 =?us-ascii?Q?QqX5+07tGbvRcwKJhu17w/WACJ+wdSolSXv6LehPTYf3JZNMY0K97BSeytCe?=
 =?us-ascii?Q?h8yhTYb58CWEokBkY+U9oi864EWuNCJUMjt5IQ8U+T0jWBFxCbRFiE9NUkZa?=
 =?us-ascii?Q?LmspaVB8brSLxEusnbcq/ADlD8t72oIQ4kN3qoRIDSMb0v+cNxdGOsYFufwP?=
 =?us-ascii?Q?X95aN7otgMcG4zEwVHkuM7fBUXKa3JP3fStkxrT2YGrbzwUmEal4PH4O42gZ?=
 =?us-ascii?Q?uO1s2l5e+djGZO+B6uVUFerWZgvNN9CnP9oWuovRME18j73L/suFkPbAA3ur?=
 =?us-ascii?Q?bBeS1Kuf14ZHmT2sS11zfavgk/qDhuR9/mGVzZh1KVR0mrk4UOkeTI/YTnEH?=
 =?us-ascii?Q?TU88Kq04/PS9diwvKDJG4VMsMoa5CW7AhoH/N/AfqZL4WIM9/GZEkqdDZdiL?=
 =?us-ascii?Q?EI5war5s7nGGrwBtNPfMKA/tRa/pLrC5GS3uGkP9g6Jf6pgHS/g0D29oyPW7?=
 =?us-ascii?Q?jAaSLoAeNj1DPSEvNwiTIBcOL4wtIzX5srGsFVoyuBfdct+8dEFC/HQ7W4FX?=
 =?us-ascii?Q?feKPGrBfYf2nb/jz2kHLq/dvCyvs91cnIfPovLv7zeOJp62ap+IPGWXRBdRy?=
 =?us-ascii?Q?42GJFMQG/fBa0VpVnfaW+BqunLNvo0wGAUt0vbwIEUoff72KpyaVZWXVjfPX?=
 =?us-ascii?Q?d5Fbcp5rkoF0mrP6XDI7fDTtrlSrLHqGbUrBgm7w4rrIgelfpXN32sPYvQKv?=
 =?us-ascii?Q?wmKjxJoJu+pDFHGRYHyQaw5cmBdn2MCS25ICCjbAbxxQ0gEtrDejedzKtpEz?=
 =?us-ascii?Q?PqDF3TlnF/7NmJ52v3vqqqzZ6LTrQuFT6zVeJVTl/h+fJXHzItcwYUpMwQsU?=
 =?us-ascii?Q?MAnURvchu00AfRyJ7lLjhsgaVYrbCP7l3nCuyBD/pBDQKEke8FhmmDCokcxx?=
 =?us-ascii?Q?/LDHJt5OoSuu2jupCMMOxeCjkrxti/yIn+DL09yh0URgmTONgSlXhXYPo9hN?=
 =?us-ascii?Q?NMNFC4AIjAM+9n3+LuYcw0i873rP3AzitN7d92TLjTf/uV9kPKVumbj9Qsaj?=
 =?us-ascii?Q?RbIWd6dckXNAxbJvAlvGVxnWs52vHqLLrMBrvXKbQs88bdNMfTL0FmU1VLUZ?=
 =?us-ascii?Q?zR2bZDchBzmCl6zdjVHRRfqMvZ0AgoGDdMrwpF8ab/itBIPBM5D0Uq+HFWAv?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064ee4c0-1e07-42bc-d384-08dd66942a98
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:14:31.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkfrSH354ytuttcY68cFu5ui+EU4FW4vfedC4hONBswTrEGOgb0hzgiksCmwa/+B5/4h4FoHhgdwDIaJiELe8iHxehBmh8Y4psvl/E/7lAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
X-Proofpoint-ORIG-GUID: Qvsfeo35G_gQrnUWQq44jk0uhO2RI7Pr
X-Proofpoint-GUID: Qvsfeo35G_gQrnUWQq44jk0uhO2RI7Pr
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67da369a cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=OsAU_ew6WyES5pdP810A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 03:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116063

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-4968

Upstream-patch:
https://github.com/canonical/netplan/commit/4c39b75b5c6ae7d976bda6da68da60d9a7f085ee

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../netplan/netplan/CVE-2022-4968.patch       | 452 ++++++++++++++++++
 .../netplan/netplan_1.0.bb                    |   1 +
 2 files changed, 453 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
new file mode 100644
index 0000000000..a7a3c28f3f
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
@@ -0,0 +1,452 @@
+From 9d9a67b00b18708ce190b806686065a6c7b73527 Mon Sep 17 00:00:00 2001
+From: Danilo Egea Gondolfo <danilogondolfo@gmail.com>
+Date: Wed, 22 May 2024 15:44:16 +0100
+Subject: [PATCH] libnetplan: use more restrictive file permissions
+
+A new util.c:_netplan_g_string_free_to_file_with_permissions() was added
+and accepts the owner, group and file mode as arguments. When these
+properties can't be set, when the generator is called by a non-root user
+for example, it will not hard-fail. This function is called by unit
+tests where we can't set the owner to a privileged account for example.
+
+When generating backend files, use more restrictive permissions:
+
+networkd related files will be owned by root:systemd-network and have
+mode 0640.
+
+service unit files will be owned by root:root and have mode 0640.
+udevd files will be owned by root:root with mode 0640.
+
+wpa_supplicant and Network Manager files will continue with the existing
+permissions.
+
+Autopkgtests will check if the permissions are set as expected when
+calling the generator.
+
+CVE: CVE-2022-4968
+
+Upstream-Status: Backport [https://github.com/canonical/netplan/commit/4c39b75b5c6ae7d976bda6da68da60d9a7f085ee]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ src/networkd.c                | 36 +++------------
+ src/networkd.h                |  2 +
+ src/nm.c                      |  4 +-
+ src/openvswitch.c             |  2 +-
+ src/sriov.c                   |  4 +-
+ src/util-internal.h           |  3 ++
+ src/util.c                    | 46 +++++++++++++++++++
+ tests/generator/test_auth.py  |  2 +-
+ tests/generator/test_wifis.py |  2 +-
+ tests/integration/base.py     | 85 +++++++++++++++++++++++++++++++++++
+ 10 files changed, 150 insertions(+), 36 deletions(-)
+
+diff --git a/src/networkd.c b/src/networkd.c
+index 25121c4..a051c6f 100644
+--- a/src/networkd.c
++++ b/src/networkd.c
+@@ -221,7 +221,6 @@ STATIC void
+ write_link_file(const NetplanNetDefinition* def, const char* rootdir, const char* path)
+ {
+     GString* s = NULL;
+-    mode_t orig_umask;
+ 
+     /* Don't write .link files for virtual devices; they use .netdev instead.
+      * Don't write .link files for MODEM devices, as they aren't supported by networkd.
+@@ -293,9 +292,7 @@ write_link_file(const NetplanNetDefinition* def, const char* rootdir, const char
+         g_string_append_printf(s, "LargeReceiveOffload=%s\n",
+         (def->large_receive_offload ? "true" : "false"));
+ 
+-    orig_umask = umask(022);
+-    _netplan_g_string_free_to_file(s, rootdir, path, ".link");
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".link", "root", "root", 0640);
+ }
+ 
+ STATIC gboolean
+@@ -313,7 +310,7 @@ write_regdom(const NetplanNetDefinition* def, const char* rootdir, GError** erro
+     g_string_append(s, "\n[Service]\nType=oneshot\n");
+     g_string_append_printf(s, "ExecStart="SBINDIR"/iw reg set %s\n", def->regulatory_domain);
+ 
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+     _netplan_safe_mkdir_p_dir(link);
+     if (symlink(path, link) < 0 && errno != EEXIST) {
+         // LCOV_EXCL_START
+@@ -493,7 +490,6 @@ STATIC void
+ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const char* path)
+ {
+     GString* s = NULL;
+-    mode_t orig_umask;
+ 
+     g_assert(def->type >= NETPLAN_DEF_TYPE_VIRTUAL);
+ 
+@@ -589,11 +585,7 @@ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const ch
+         default: g_assert_not_reached(); // LCOV_EXCL_LINE
+     }
+ 
+-    /* these do not contain secrets and need to be readable by
+-     * systemd-networkd - LP: #1736965 */
+-    orig_umask = umask(022);
+-    _netplan_g_string_free_to_file(s, rootdir, path, ".netdev");
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".netdev", "root", NETWORKD_GROUP, 0640);
+ }
+ 
+ STATIC void
+@@ -737,7 +729,6 @@ _netplan_netdef_write_network_file(
+     g_autoptr(GString) network = NULL;
+     g_autoptr(GString) link = NULL;
+     GString* s = NULL;
+-    mode_t orig_umask;
+     gboolean is_optional = def->optional;
+ 
+     SET_OPT_OUT_PTR(has_been_written, FALSE);
+@@ -993,11 +984,7 @@ _netplan_netdef_write_network_file(
+         if (network->len > 0)
+             g_string_append_printf(s, "\n[Network]\n%s", network->str);
+ 
+-        /* these do not contain secrets and need to be readable by
+-         * systemd-networkd - LP: #1736965 */
+-        orig_umask = umask(022);
+-        _netplan_g_string_free_to_file(s, rootdir, path, ".network");
+-        umask(orig_umask);
++        _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".network", "root", NETWORKD_GROUP, 0640);
+     }
+ 
+     SET_OPT_OUT_PTR(has_been_written, TRUE);
+@@ -1009,7 +996,6 @@ write_rules_file(const NetplanNetDefinition* def, const char* rootdir)
+ {
+     GString* s = NULL;
+     g_autofree char* path = g_strjoin(NULL, "run/udev/rules.d/99-netplan-", def->id, ".rules", NULL);
+-    mode_t orig_umask;
+ 
+     /* do we need to write a .rules file?
+      * It's only required for reliably setting the name of a physical device
+@@ -1043,9 +1029,7 @@ write_rules_file(const NetplanNetDefinition* def, const char* rootdir)
+ 
+     g_string_append_printf(s, "NAME=\"%s\"\n", def->set_name);
+ 
+-    orig_umask = umask(022);
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ }
+ 
+ STATIC gboolean
+@@ -1194,7 +1178,6 @@ STATIC void
+ write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
+ {
+     g_autofree gchar *stdouth = NULL;
+-    mode_t orig_umask;
+ 
+     stdouth = systemd_escape(def->id);
+ 
+@@ -1213,9 +1196,7 @@ write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
+     } else {
+         g_string_append(s, " -Dnl80211,wext\n");
+     }
+-    orig_umask = umask(022);
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ }
+ 
+ STATIC gboolean
+@@ -1224,7 +1205,6 @@ write_wpa_conf(const NetplanNetDefinition* def, const char* rootdir, GError** er
+     GHashTableIter iter;
+     GString* s = g_string_new("ctrl_interface=/run/wpa_supplicant\n\n");
+     g_autofree char* path = g_strjoin(NULL, "run/netplan/wpa-", def->id, ".conf", NULL);
+-    mode_t orig_umask;
+ 
+     g_debug("%s: Creating wpa_supplicant configuration file %s", def->id, path);
+     if (def->type == NETPLAN_DEF_TYPE_WIFI) {
+@@ -1313,9 +1293,7 @@ write_wpa_conf(const NetplanNetDefinition* def, const char* rootdir, GError** er
+     }
+ 
+     /* use tight permissions as this contains secrets */
+-    orig_umask = umask(077);
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0600);
+     return TRUE;
+ }
+ 
+diff --git a/src/networkd.h b/src/networkd.h
+index 2bd0848..36c34b3 100644
+--- a/src/networkd.h
++++ b/src/networkd.h
+@@ -20,6 +20,8 @@
+ #include "netplan.h"
+ #include <glib.h>
+ 
++#define NETWORKD_GROUP "systemd-network"
++
+ NETPLAN_INTERNAL gboolean
+ _netplan_netdef_write_networkd(
+         const NetplanState* np_state,
+diff --git a/src/nm.c b/src/nm.c
+index 2b850af..8f1bf05 100644
+--- a/src/nm.c
++++ b/src/nm.c
+@@ -1150,13 +1150,13 @@ netplan_state_finish_nm_write(
+ 
+     /* write generated NetworkManager drop-in config */
+     if (nm_conf->len > 0)
+-        _netplan_g_string_free_to_file(nm_conf, rootdir, "run/NetworkManager/conf.d/netplan.conf", NULL);
++        _netplan_g_string_free_to_file_with_permissions(nm_conf, rootdir, "run/NetworkManager/conf.d/netplan.conf", NULL, "root", "root", 0640);
+     else
+         g_string_free(nm_conf, TRUE);
+ 
+     /* write generated udev rules */
+     if (udev_rules->len > 0)
+-        _netplan_g_string_free_to_file(udev_rules, rootdir, "run/udev/rules.d/90-netplan.rules", NULL);
++        _netplan_g_string_free_to_file_with_permissions(udev_rules, rootdir, "run/udev/rules.d/90-netplan.rules", NULL, "root", "root", 0640);
+     else
+         g_string_free(udev_rules, TRUE);
+ 
+diff --git a/src/openvswitch.c b/src/openvswitch.c
+index 6eb0688..2ab77e7 100644
+--- a/src/openvswitch.c
++++ b/src/openvswitch.c
+@@ -66,7 +66,7 @@ write_ovs_systemd_unit(const char* id, const GString* cmds, const char* rootdir,
+         g_string_append(s, "StartLimitBurst=0\n");
+     g_string_append(s, cmds->str);
+ 
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ 
+     _netplan_safe_mkdir_p_dir(link);
+     if (symlink(path, link) < 0 && errno != EEXIST) {
+diff --git a/src/sriov.c b/src/sriov.c
+index 1534c94..213f124 100644
+--- a/src/sriov.c
++++ b/src/sriov.c
+@@ -54,7 +54,7 @@ write_sriov_rebind_systemd_unit(GHashTable* pfs, const char* rootdir, GError** e
+     g_string_truncate(interfaces, interfaces->len-1); /* cut trailing whitespace */
+     g_string_append_printf(s, "ExecStart=" SBINDIR "/netplan rebind --debug %s\n", interfaces->str);
+ 
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+     g_string_free(interfaces, TRUE);
+ 
+     _netplan_safe_mkdir_p_dir(link);
+@@ -90,7 +90,7 @@ write_sriov_apply_systemd_unit(GHashTable* pfs, const char* rootdir, GError** er
+     g_string_append(s, "\n[Service]\nType=oneshot\n");
+     g_string_append_printf(s, "ExecStart=" SBINDIR "/netplan apply --sriov-only\n");
+ 
+-    _netplan_g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ 
+     _netplan_safe_mkdir_p_dir(link);
+     if (symlink(path, link) < 0 && errno != EEXIST) {
+diff --git a/src/util-internal.h b/src/util-internal.h
+index 86bd1b7..7454e77 100644
+--- a/src/util-internal.h
++++ b/src/util-internal.h
+@@ -40,6 +40,9 @@ _netplan_safe_mkdir_p_dir(const char* file_path);
+ NETPLAN_INTERNAL void
+ _netplan_g_string_free_to_file(GString* s, const char* rootdir, const char* path, const char* suffix);
+ 
++void
++_netplan_g_string_free_to_file_with_permissions(GString* s, const char* rootdir, const char* path, const char* suffix, const char* owner, const char* group, mode_t mode);
++
+ NETPLAN_INTERNAL void
+ _netplan_unlink_glob(const char* rootdir, const char* _glob);
+ 
+diff --git a/src/util.c b/src/util.c
+index 36eb896..c2f9494 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -23,6 +23,9 @@
+ #include <regex.h>
+ #include <string.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
++#include <pwd.h>
++#include <grp.h>
+ 
+ #include <glib.h>
+ #include <glib/gprintf.h>
+@@ -87,6 +90,49 @@ void _netplan_g_string_free_to_file(GString* s, const char* rootdir, const char*
+     }
+ }
+ 
++void _netplan_g_string_free_to_file_with_permissions(GString* s, const char* rootdir, const char* path, const char* suffix, const char* owner, const char* group, mode_t mode)
++{
++    g_autofree char* full_path = NULL;
++    g_autofree char* path_suffix = NULL;
++    g_autofree char* contents = g_string_free(s, FALSE);
++    GError* error = NULL;
++    struct passwd* pw = NULL;
++    struct group* gr = NULL;
++    int ret = 0;
++
++    path_suffix = g_strjoin(NULL, path, suffix, NULL);
++    full_path = g_build_path(G_DIR_SEPARATOR_S, rootdir ?: G_DIR_SEPARATOR_S, path_suffix, NULL);
++    _netplan_safe_mkdir_p_dir(full_path);
++    if (!g_file_set_contents_full(full_path, contents, -1, G_FILE_SET_CONTENTS_CONSISTENT | G_FILE_SET_CONTENTS_ONLY_EXISTING, mode, &error)) {
++        /* the mkdir() just succeeded, there is no sensible
++         * method to test this without root privileges, bind mounts, and
++         * simulating ENOSPC */
++        // LCOV_EXCL_START
++        g_fprintf(stderr, "ERROR: cannot create file %s: %s\n", path, error->message);
++        exit(1);
++        // LCOV_EXCL_STOP
++    }
++
++    /* Here we take the owner and group names and look up for their IDs in the passwd and group files.
++     * It's OK to fail to set the owners and mode as this code will be called from unit tests.
++     * The autopkgtests will check if the owner/group and mode are correctly set.
++     */
++    pw = getpwnam(owner);
++    if (!pw) {
++        g_debug("Failed to determine the UID of user %s: %s", owner, strerror(errno)); // LCOV_EXCL_LINE
++    }
++    gr = getgrnam(group);
++    if (!gr) {
++        g_debug("Failed to determine the GID of group %s: %s", group, strerror(errno)); // LCOV_EXCL_LINE
++    }
++    if (pw && gr) {
++        ret = chown(full_path, pw->pw_uid, gr->gr_gid);
++        if (ret != 0) {
++            g_debug("Failed to set owner and group for file %s: %s", full_path, strerror(errno));
++        }
++    }
++}
++
+ /**
+  * Remove all files matching given glob.
+  */
+diff --git a/tests/generator/test_auth.py b/tests/generator/test_auth.py
+index de23adb..d3d886c 100644
+--- a/tests/generator/test_auth.py
++++ b/tests/generator/test_auth.py
+@@ -226,7 +226,7 @@ network={
+ 
+         with open(os.path.join(self.workdir.name, 'run/systemd/system/netplan-wpa-eth0.service')) as f:
+             self.assertEqual(f.read(), SD_WPA % {'iface': 'eth0', 'drivers': 'wired'})
+-            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o644)
++            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o640)
+         self.assertTrue(os.path.islink(os.path.join(
+             self.workdir.name, 'run/systemd/system/systemd-networkd.service.wants/netplan-wpa-eth0.service')))
+ 
+diff --git a/tests/generator/test_wifis.py b/tests/generator/test_wifis.py
+index b875172..610782a 100644
+--- a/tests/generator/test_wifis.py
++++ b/tests/generator/test_wifis.py
+@@ -140,7 +140,7 @@ network={
+             self.workdir.name, 'run/systemd/system/netplan-wpa-wl0.service')))
+         with open(os.path.join(self.workdir.name, 'run/systemd/system/netplan-wpa-wl0.service')) as f:
+             self.assertEqual(f.read(), SD_WPA % {'iface': 'wl0', 'drivers': 'nl80211,wext'})
+-            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o644)
++            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o640)
+         self.assertTrue(os.path.islink(os.path.join(
+             self.workdir.name, 'run/systemd/system/systemd-networkd.service.wants/netplan-wpa-wl0.service')))
+ 
+diff --git a/tests/integration/base.py b/tests/integration/base.py
+index e9c366c..74f0682 100644
+--- a/tests/integration/base.py
++++ b/tests/integration/base.py
+@@ -32,6 +32,8 @@ import shutil
+ import gi
+ import glob
+ import json
++import pwd
++import grp
+ 
+ # make sure we point to libnetplan properly.
+ os.environ.update({'LD_LIBRARY_PATH': '.:{}'.format(os.environ.get('LD_LIBRARY_PATH'))})
+@@ -367,6 +369,89 @@ class IntegrationTestsBase(unittest.TestCase):
+             if state:
+                 self.wait_output(['ip', 'addr', 'show', iface], state, 30)
+ 
++        # Assert file permissions
++        self.assert_file_permissions()
++
++    def assert_file_permissions(self):
++        """ Check if the generated files have the expected permissions """
++
++        nd_expected_mode = 0o100640
++        nd_expected_owner = 'root'
++        nd_expected_group = 'systemd-network'
++
++        sd_expected_mode = 0o100640
++        sd_expected_owner = 'root'
++        sd_expected_group = 'root'
++
++        udev_expected_mode = 0o100640
++        udev_expected_owner = 'root'
++        udev_expected_group = 'root'
++
++        nm_expected_mode = 0o100600
++        nm_expected_owner = 'root'
++        nm_expected_group = 'root'
++
++        wpa_expected_mode = 0o100600
++        wpa_expected_owner = 'root'
++        wpa_expected_group = 'root'
++
++        # Check systemd-networkd files
++        base_path = '/run/systemd/network'
++        files = glob.glob(f'{base_path}/*.network') + glob.glob(f'{base_path}/*.netdev')
++        for file in files:
++            res = os.stat(file)
++            user = pwd.getpwuid(res.st_uid)
++            group = grp.getgrgid(res.st_gid)
++            self.assertEqual(res.st_mode, nd_expected_mode, f'file {file}')
++            self.assertEqual(user.pw_name, nd_expected_owner, f'file {file}')
++            self.assertEqual(group.gr_name, nd_expected_group, f'file {file}')
++
++        # Check Network Manager files
++        base_path = '/run/NetworkManager/system-connections'
++        files = glob.glob(f'{base_path}/*.nmconnection')
++        for file in files:
++            res = os.stat(file)
++            user = pwd.getpwuid(res.st_uid)
++            group = grp.getgrgid(res.st_gid)
++            self.assertEqual(res.st_mode, nm_expected_mode, f'file {file}')
++            self.assertEqual(user.pw_name, nm_expected_owner, f'file {file}')
++            self.assertEqual(group.gr_name, nm_expected_group, f'file {file}')
++
++        # Check wpa_supplicant configuration files
++        base_path = '/run/netplan'
++        files = glob.glob(f'{base_path}/wpa-*.conf')
++        for file in files:
++            res = os.stat(file)
++            user = pwd.getpwuid(res.st_uid)
++            group = grp.getgrgid(res.st_gid)
++            self.assertEqual(res.st_mode, wpa_expected_mode, f'file {file}')
++            self.assertEqual(user.pw_name, wpa_expected_owner, f'file {file}')
++            self.assertEqual(group.gr_name, wpa_expected_group, f'file {file}')
++
++        # Check systemd service unit files
++        base_path = '/run/systemd/system/'
++        files = glob.glob(f'{base_path}/netplan-*.service')
++        files += glob.glob(f'{base_path}/systemd-networkd-wait-online.service.d/*.conf')
++        for file in files:
++            res = os.stat(file)
++            user = pwd.getpwuid(res.st_uid)
++            group = grp.getgrgid(res.st_gid)
++            self.assertEqual(res.st_mode, sd_expected_mode, f'file {file}')
++            self.assertEqual(user.pw_name, sd_expected_owner, f'file {file}')
++            self.assertEqual(group.gr_name, sd_expected_group, f'file {file}')
++
++        # Check systemd-udevd files
++        udev_path = '/run/udev/rules.d'
++        link_path = '/run/systemd/network'
++        files = glob.glob(f'{udev_path}/*-netplan*.rules') + glob.glob(f'{link_path}/*.link')
++        for file in files:
++            res = os.stat(file)
++            user = pwd.getpwuid(res.st_uid)
++            group = grp.getgrgid(res.st_gid)
++            self.assertEqual(res.st_mode, udev_expected_mode, f'file {file}')
++            self.assertEqual(user.pw_name, udev_expected_owner, f'file {file}')
++            self.assertEqual(group.gr_name, udev_expected_group, f'file {file}')
++
+     def state(self, iface, state):
+         '''Tell generate_and_settle() to wait for a specific state'''
+         return iface + '/' + state
+-- 
+2.44.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
index cf8d6d19e7..752acc23c3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
@@ -17,6 +17,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
            file://0001-meson.build-drop-unnecessary-build-dependencies.patch \
            file://0002-meson.build-do-not-use-Werror.patch \
+           file://CVE-2022-4968.patch \
           "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-- 
2.34.1


