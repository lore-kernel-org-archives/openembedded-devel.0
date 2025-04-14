Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDFCC3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 07:04:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44169.1744614236976050744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 00:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6199942b86=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5R5Jr019928
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 00:03:56 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3hhsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 00:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POBdrR4PV6bf+nnI0UY3FDOPTdA9tkrLPT//RgGVTLiVECECX+I6cHjY9bx99StBigLoRMQyytk0A+25P9S4vKe2a2V74VMSG0W2KC4PANhnmnMsX06VFaAIF8EHlAny2DXIXsOb4pqJUmzmXvnQYIYJEGLJQ4aNqj3YTmIjwPJmHZGRW9DjPekAVT4W0kWa7T2nzmth6DFzbqbqIiS0bD0jDR0NxEj+AZVY0Psh//RHXgsBlQKe3gYgCTpGONIUD3HVnnigfVjLq4foj9xAA1WhPPOLg9gQE4najIrgs9Fm4mAdEnRZsijcxIXtd3XHRKSh2iL3aBy8tcpxW3Gmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZwXmgS9eh89w1VJvucajaH8yPPi8JsBm0gFuoVqjAI=;
 b=chB7d2dNrJIupxER0Vji/5zGzo3fM5r3Yqm4vd4FU70TK6KqIfmoWqhsuLYl+icsZEhJIRD5zk4Cf7FPFRn2XhPCXzteMT7PpRfC8gZsu/Y/xyoiK8UcMhw5iKe8AT/tug7Ez8UgBzkZxaY/1G8MGeEcdg46bu2dI3fnb+sA0NR4E0oZfK/HUdIfBU+E/H4z1Q4ohAmOKP3AMFcIQV57C4lQ5d4lXjv1uCqvngkTp8V5aMZc1FjpOkPf9V1+Ut3AP9oZLZswYEPwmXigJyQjzFuaPpdyGf8cpuc+vawEyM1H/DnciG79E2P/VxbXZ4UGtuz+AL9xO0u4FTiX2ldFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.30; Mon, 14 Apr 2025 07:03:53 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 07:03:53 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH] netplan: Fix CVE-2022-4968
Date: Mon, 14 Apr 2025 15:03:36 +0800
Message-Id: <20250414070336.2731623-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 13236928-538c-4338-c592-08dd7b2283d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XyLOq6SWjnyxxzLzH61tpCF+H/3+JjJzVl0X64+SgIWokUu9hfD/BQhom/pJ?=
 =?us-ascii?Q?tRhV0SBPXUFoZNEnEaSr8e129UyYh/yMCZ95z7MbaWHvftPKw0JsKmsC3adu?=
 =?us-ascii?Q?BRl89kFFcPwiMEHGZ9JkPnldprSulAlxj7zSr0AlJkPsnnKPSIdxIttv9z15?=
 =?us-ascii?Q?nhHk/t+LyIsRAkqsNzrmL14IQWUSUNq96pOqRmroVMrLvlbSPFxnR/5ertfg?=
 =?us-ascii?Q?eh9PFwtoe1E1piR75rgarMqV2nt4faXNpsltnC5IWt3goiELw19sE/ZXBqrU?=
 =?us-ascii?Q?I31DkG/nOTkwPAq4VtQ8OiEz6qWcETlpx4P+rXFvFMjh2iXm9jhETxTzT+IF?=
 =?us-ascii?Q?fe7iULg+Pk83buT0hH+bM3x0WBrVJVXj+c8fIFNNt2F0qe1fAT5q5qQAzYMb?=
 =?us-ascii?Q?1GozrKQqoxPzR3BIHfyYuuPvXj61Y6I8dPDF80lVcXWWRNLZJwr3cw8ZCajA?=
 =?us-ascii?Q?NgVX1vQviGxeZzOMtgo19iX46lr4NcGR/qfoYSyEaRt+sM/TboyqGmn+DwH6?=
 =?us-ascii?Q?a1Bksux3s130Lt/JKsbb0IZIXCcNsysnDNegWNRew7C16nwQr0LlMEand36L?=
 =?us-ascii?Q?zozL8mZ8JA3HK1gni2Kzfa4xTKdTRAfaK9U3CxysWBXGKLf6Ta2u4YwwbhVC?=
 =?us-ascii?Q?wtW1vRnRVc+mOd9SYfsCH9J7qdHL0zHIc/g4o7mYc/WwPPhcOEWrsz65XfWV?=
 =?us-ascii?Q?N4qeiUyQ8CbYOtUOs7AJeRsEXWYcU8cnmOBHVzIeaMEv1PRduN9vK96WNLEe?=
 =?us-ascii?Q?bjV+C6dao+LOX7I89eRe/0DRAx+tDbKOVTV3VtlZ03rIeTJzLj3Lc/gyhZYT?=
 =?us-ascii?Q?VWNN7rldL/Bb9ibZQzX8ZJdvbaGoWvfpPJggsD/hvQcJQ0KfaMF35v7rdPJn?=
 =?us-ascii?Q?r9I/3f4GZKjY28aBKC4KGG2c1j9RVnzIGssU1ughRGE0eLlF2vGo4RAzj5rq?=
 =?us-ascii?Q?wx3vy/Lb3okG2lYVdIMIAF9giDUQg4JCUhuhPkHiLOSPjaPpnt6IjXuOOb2t?=
 =?us-ascii?Q?RQvnRbUJmBjKN5fNp34qwS55IldrpOqKkMlZ2dwp/WFm1fvCa/jTq67OcN0p?=
 =?us-ascii?Q?O9LRE1xdg9zhVE9zdETOsSLVLAJpIzJP/EZ1hdU35mHSbphuNe1Nn8ENLbng?=
 =?us-ascii?Q?qMm2XqVJftX/CprdmO5tyfq6penRk0FkJ67ng+hNSzcxVXllCsgRzO5mYBD+?=
 =?us-ascii?Q?Y3FUFQHb/mAms6LqCdw7BshLYwisIYRfag+qCjf4oW2bZ2cTUz49GORWB3Ng?=
 =?us-ascii?Q?1Hg7ef7+EbCsqIvzm5QfS4uVZwL+OcqEiy6MDiC+7W6eOlnjCZYfiN/vGp6t?=
 =?us-ascii?Q?KL4vhWm3sHet84lYCNaZRhplYndIh1HpeS2xM1XeHBW9fjixiXk6/6PaOCyW?=
 =?us-ascii?Q?4attOsosT3XLf2nli41vQeqw5U6gA1SgiI1jUwMfeuPj/6TutUaTXfKDItFv?=
 =?us-ascii?Q?6VUoOk8UeHl5gjuSn2AsKn4GSMBAXj/W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T50oKKqU452VfIsGk5C9UUiTD0BwqCMuNs0xDZlkLuIr67ZkXyqXpkT9ltxN?=
 =?us-ascii?Q?BGi2kWLsPxC7tcwSCqmAuno5wohBjfrHgbuMgZqiNh7u4gtu7Vwqjl+OcfoQ?=
 =?us-ascii?Q?l0+8yFQas4+rHfNfeWw3IOdDxKVxnjaAuP1yggi3DntySMvwsjSjrkzPi6T0?=
 =?us-ascii?Q?25uAm/zhiSXd/le/rOBRl20F0a9Kf71qF9QCzLbw1W8othi+4jUk7Ax6Y0Fp?=
 =?us-ascii?Q?I6K4UPfqebzUw1F6RslcegBEfQsVw1Vzx0+nL5jmCgZAuEbLdjTZTxAu6gl+?=
 =?us-ascii?Q?UZkCss8SE6flmOSYmgc9z+ZL47DjdtYaTYCtPCNVT1Eqx8rEjesQZBuyi9UH?=
 =?us-ascii?Q?lVh1GvyBpu38YtjztiXVpVq8Rvq+CMtCWFvQrFZ1YlSqk7pEug0rqx36Ptxu?=
 =?us-ascii?Q?sBN694g+SrFu7rpuO9C05DUXg6vpfFGot1ecb0eUVKoBQsu5Yuowk7hEw55+?=
 =?us-ascii?Q?iWFj7ctE7TEnDZPFgffCzQtCAwSJXOvpvNtvHl1eI/fm/cFmah4KKZXCQfqA?=
 =?us-ascii?Q?cCoALh6V6E29gHZJddElyGenErBYeu2PsMTzjNVjlzzHkWpJZNLBI/yUmGMR?=
 =?us-ascii?Q?7c/GnC3hRa2lFpSVNONIjirrdsOsG+abm7g6V7fIG4+bDRdsJQ3uz2w3JOGx?=
 =?us-ascii?Q?Z1hBXN0c+KJhm3fYS5T6tTh5e7wZ92Oi80kxmbX5NWXzbOeiDGdhL5K2qpC8?=
 =?us-ascii?Q?oVBUhCaekpP/NgY8teALnNwqiQqNM1DmvI+HR18xNTQlwRQSazWzI+lEZCok?=
 =?us-ascii?Q?o56XyCz0otdxZhD3oTXh9sSdTqMAUSGf0oHTY2R0ZiwhMLvkQM9c+W1GsHWL?=
 =?us-ascii?Q?Wm/FC4peCN5G5AtnhuDamStQgVD4IJSyWLnIoK6BZaj2kz2SFIWFVk5+8OzU?=
 =?us-ascii?Q?/zp0wnxL1wE1PRQrKg6E2r3sezCrRDR9TtnF8WD1MdtgPD75C1tvmf/7PmhO?=
 =?us-ascii?Q?3qJwaSVDYBdItCG4tVODDCkNZSWQNjtHNGpgAXLApOMZ+vflFN919Q1VQAmv?=
 =?us-ascii?Q?1kwDOL6yPLifvnYOwTI8K/zJP+HYS7qWwyJJ0MO8tea4qEruOpJkwCliIR/Y?=
 =?us-ascii?Q?9hFdi57vZDYTZ25tBx+w81xbtVUhxln1jdKZfDu616GVrfCEPBB0Z2lO/Upv?=
 =?us-ascii?Q?JChpmizk8PFcRJ5J5ECPmYeGvr3ZLHDmDg1NPdUkwk2sKZ1rBJlzu5S+Adlq?=
 =?us-ascii?Q?75finsNpNDPGjE9+gcwiZtd1iFnTQK5MMjrX80eiov5G25t9vfS4DfwdKV/m?=
 =?us-ascii?Q?tM1D/7dqJeE9kx25exPf16cLyBd/raVAO3a+jHp9Ssl5tmQghiI0g6qRCQvJ?=
 =?us-ascii?Q?AWQYQk8gxOHFd3JlxQ0rhSFC5+XmixxgJLu+wcZHoqOTvEv+vXz8tC4OVD4I?=
 =?us-ascii?Q?kUpJgr9Maqlkev4RQ93zzsMQd+sfDDnoKvA+3ooHSfIOF/THpBgIB2zunKRE?=
 =?us-ascii?Q?DZtaCPDSLqqOK/7nfFA/Pw/C/d0ApmWUtztc8kvczre+3G/2/MOHS2QqHeZX?=
 =?us-ascii?Q?qwaqwMluM+PpD2k4CEkmcad6JFq1WpEXzyGFmd6wO5Xq7l075c6fdld8lJt/?=
 =?us-ascii?Q?YZWFoaJWe06eSBVRu8lCqMWDAJDtdrQ+9F0ysrBVAiJMd1JkhKDwiYFFIx/V?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13236928-538c-4338-c592-08dd7b2283d9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:03:53.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lAUbaYSNZ0EeBrfffARl5pJClj8EFw09geNhMJr9vwVcWba2kjVSiB5DITXylB6p4Hbn0zqAifA0gEKoI4V7tSTf+9y9j7iAUGksmwA2Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
X-Proofpoint-ORIG-GUID: JSAj0Vq4QhwZLs_FlMUvJfBiDgRSUVpF
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=67fcb35c cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=2So96EklbHVIg_qB25wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JSAj0Vq4QhwZLs_FlMUvJfBiDgRSUVpF
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 07:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116843

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport patch[1] to fix CVE-2022-4968.

[1] https://github.com/canonical/netplan/commit/4c39b75b5c6ae7d976bda6da68da60d9a7f085ee

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../netplan/netplan/CVE-2022-4968.patch       | 442 ++++++++++++++++++
 .../netplan/netplan_0.104.bb                  |   1 +
 2 files changed, 443 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch b/meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
new file mode 100644
index 0000000000..0942309cb1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
@@ -0,0 +1,442 @@
+From 78bfd2429a64452cb8023ec1a56837874c641f5f Mon Sep 17 00:00:00 2001
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
+This fix addresses CVE-2022-4968
+
+Fix conflicts according to:
+https://git.launchpad.net/~ubuntu-core-dev/netplan/+git/ubuntu/diff/debian/patches/lp2065738/0013-libnetplan-use-more-restrictive-file-permissions.patch?id=ed684b8a3eb282b9bc7c0f18ad6b2249e7f3ef30
+
+CVE: CVE-2022-4968
+
+Upstream-Status: Backport [https://github.com/canonical/netplan/commit/4c39b75b5c6ae7d976bda6da68da60d9a7f085ee]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+
+update
+---
+ src/networkd.c                | 34 +++-----------
+ src/networkd.h                |  2 +
+ src/nm.c                      |  4 +-
+ src/openvswitch.c             |  2 +-
+ src/sriov.c                   |  2 +-
+ src/util-internal.h           |  3 ++
+ src/util.c                    | 46 +++++++++++++++++++
+ tests/generator/test_auth.py  |  2 +-
+ tests/generator/test_wifis.py |  2 +-
+ tests/integration/base.py     | 86 +++++++++++++++++++++++++++++++++++
+ 10 files changed, 149 insertions(+), 34 deletions(-)
+
+diff --git a/src/networkd.c b/src/networkd.c
+index 6d26047c..56e6e6ed 100644
+--- a/src/networkd.c
++++ b/src/networkd.c
+@@ -231,7 +231,6 @@ static void
+ write_link_file(const NetplanNetDefinition* def, const char* rootdir, const char* path)
+ {
+     GString* s = NULL;
+-    mode_t orig_umask;
+ 
+     /* Don't write .link files for virtual devices; they use .netdev instead.
+      * Don't write .link files for MODEM devices, as they aren't supported by networkd.
+@@ -286,9 +285,7 @@ write_link_file(const NetplanNetDefinition* def, const char* rootdir, const char
+     if (def->large_receive_offload)
+         g_string_append_printf(s, "LargeReceiveOffload=%u\n", def->large_receive_offload);
+ 
+-    orig_umask = umask(022);
+-    g_string_free_to_file(s, rootdir, path, ".link");
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".link", "root", "root", 0640);
+ }
+ 
+ 
+@@ -387,7 +384,6 @@ static void
+ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const char* path)
+ {
+     GString* s = NULL;
+-    mode_t orig_umask;
+ 
+     g_assert(def->type >= NETPLAN_DEF_TYPE_VIRTUAL);
+ 
+@@ -454,11 +450,7 @@ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const ch
+         default: g_assert_not_reached(); // LCOV_EXCL_LINE
+     }
+ 
+-    /* these do not contain secrets and need to be readable by
+-     * systemd-networkd - LP: #1736965 */
+-    orig_umask = umask(022);
+-    g_string_free_to_file(s, rootdir, path, ".netdev");
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".netdev", "root", NETWORKD_GROUP, 0640);
+ }
+ 
+ static void
+@@ -602,7 +594,6 @@ netplan_netdef_write_network_file(
+     GString* network = NULL;
+     GString* link = NULL;
+     GString* s = NULL;
+-    mode_t orig_umask;
+     gboolean is_optional = def->optional;
+ 
+     SET_OPT_OUT_PTR(has_been_written, FALSE);
+@@ -827,11 +818,7 @@ netplan_netdef_write_network_file(
+         g_string_free(link, TRUE);
+         g_string_free(network, TRUE);
+ 
+-        /* these do not contain secrets and need to be readable by
+-         * systemd-networkd - LP: #1736965 */
+-        orig_umask = umask(022);
+-        g_string_free_to_file(s, rootdir, path, ".network");
+-        umask(orig_umask);
++        _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, ".network", "root", NETWORKD_GROUP, 0640);
+     }
+ 
+     SET_OPT_OUT_PTR(has_been_written, TRUE);
+@@ -843,7 +830,6 @@ write_rules_file(const NetplanNetDefinition* def, const char* rootdir)
+ {
+     GString* s = NULL;
+     g_autofree char* path = g_strjoin(NULL, "run/udev/rules.d/99-netplan-", def->id, ".rules", NULL);
+-    mode_t orig_umask;
+ 
+     /* do we need to write a .rules file?
+      * It's only required for reliably setting the name of a physical device
+@@ -877,9 +863,7 @@ write_rules_file(const NetplanNetDefinition* def, const char* rootdir)
+ 
+     g_string_append_printf(s, "NAME=\"%s\"\n", def->set_name);
+ 
+-    orig_umask = umask(022);
+-    g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ }
+ 
+ static gboolean
+@@ -981,7 +965,6 @@ static void
+ write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
+ {
+     g_autofree gchar *stdouth = NULL;
+-    mode_t orig_umask;
+ 
+     stdouth = systemd_escape(def->id);
+ 
+@@ -1000,9 +983,7 @@ write_wpa_unit(const NetplanNetDefinition* def, const char* rootdir)
+     } else {
+         g_string_append(s, " -Dnl80211,wext\n");
+     }
+-    orig_umask = umask(022);
+-    g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ }
+ 
+ static gboolean
+@@ -1011,7 +992,6 @@ write_wpa_conf(const NetplanNetDefinition* def, const char* rootdir, GError** er
+     GHashTableIter iter;
+     GString* s = g_string_new("ctrl_interface=/run/wpa_supplicant\n\n");
+     g_autofree char* path = g_strjoin(NULL, "run/netplan/wpa-", def->id, ".conf", NULL);
+-    mode_t orig_umask;
+ 
+     g_debug("%s: Creating wpa_supplicant configuration file %s", def->id, path);
+     if (def->type == NETPLAN_DEF_TYPE_WIFI) {
+@@ -1087,9 +1067,7 @@ write_wpa_conf(const NetplanNetDefinition* def, const char* rootdir, GError** er
+     }
+ 
+     /* use tight permissions as this contains secrets */
+-    orig_umask = umask(077);
+-    g_string_free_to_file(s, rootdir, path, NULL);
+-    umask(orig_umask);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0600);
+     return TRUE;
+ }
+ 
+diff --git a/src/networkd.h b/src/networkd.h
+index a7092b2c..0214e43b 100644
+--- a/src/networkd.h
++++ b/src/networkd.h
+@@ -20,6 +20,8 @@
+ #include "netplan.h"
+ #include <glib.h>
+ 
++#define NETWORKD_GROUP "systemd-network"
++
+ NETPLAN_INTERNAL gboolean
+ netplan_netdef_write_networkd(
+         const NetplanState* np_state,
+diff --git a/src/nm.c b/src/nm.c
+index 319a80ba..7770a574 100644
+--- a/src/nm.c
++++ b/src/nm.c
+@@ -996,13 +996,13 @@ netplan_state_finish_nm_write(
+     len = s->len;
+     g_list_foreach(np_state->netdefs_ordered, nd_append_non_nm_ids, s);
+     if (s->len > len)
+-        g_string_free_to_file(s, rootdir, "run/NetworkManager/conf.d/netplan.conf", NULL);
++        _netplan_g_string_free_to_file_with_permissions(s, rootdir, "run/NetworkManager/conf.d/netplan.conf", NULL, "root", "root", 0640);
+     else
+         g_string_free(s, TRUE);
+ 
+     /* write generated udev rules */
+     if (udev_rules)
+-        g_string_free_to_file(udev_rules, rootdir, "run/udev/rules.d/90-netplan.rules", NULL);
++        _netplan_g_string_free_to_file_with_permissions(udev_rules, rootdir, "run/udev/rules.d/90-netplan.rules", NULL, "root", "root", 0640);
+     return TRUE;
+ }
+ 
+diff --git a/src/openvswitch.c b/src/openvswitch.c
+index 7479267d..d8b2fefb 100644
+--- a/src/openvswitch.c
++++ b/src/openvswitch.c
+@@ -62,7 +62,7 @@ write_ovs_systemd_unit(const char* id, const GString* cmds, const char* rootdir,
+     g_string_append(s, "\n[Service]\nType=oneshot\n");
+     g_string_append(s, cmds->str);
+ 
+-    g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ 
+     safe_mkdir_p_dir(link);
+     if (symlink(path, link) < 0 && errno != EEXIST) {
+diff --git a/src/sriov.c b/src/sriov.c
+index 966718f4..1b8af8a6 100644
+--- a/src/sriov.c
++++ b/src/sriov.c
+@@ -48,7 +48,7 @@ write_sriov_rebind_systemd_unit(const GString* pfs, const char* rootdir, GError*
+     g_string_append(s, "\n[Service]\nType=oneshot\n");
+     g_string_append_printf(s, "ExecStart=" SBINDIR "/netplan rebind %s\n", pfs->str);
+ 
+-    g_string_free_to_file(s, rootdir, path, NULL);
++    _netplan_g_string_free_to_file_with_permissions(s, rootdir, path, NULL, "root", "root", 0640);
+ 
+     safe_mkdir_p_dir(link);
+     if (symlink(path, link) < 0 && errno != EEXIST) {
+diff --git a/src/util-internal.h b/src/util-internal.h
+index d7875530..4a17219e 100644
+--- a/src/util-internal.h
++++ b/src/util-internal.h
+@@ -39,6 +39,9 @@ safe_mkdir_p_dir(const char* file_path);
+ NETPLAN_INTERNAL void
+ g_string_free_to_file(GString* s, const char* rootdir, const char* path, const char* suffix);
+ 
++void
++_netplan_g_string_free_to_file_with_permissions(GString* s, const char* rootdir, const char* path, const char* suffix, const char* owner, const char* group, mode_t mode);
++
+ NETPLAN_INTERNAL void
+ unlink_glob(const char* rootdir, const char* _glob);
+ 
+diff --git a/src/util.c b/src/util.c
+index 841ec120..e6d8c99b 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -19,6 +19,9 @@
+ #include <unistd.h>
+ #include <arpa/inet.h>
+ #include <errno.h>
++#include <sys/types.h>
++#include <pwd.h>
++#include <grp.h>
+ 
+ #include <glib.h>
+ #include <glib/gprintf.h>
+@@ -81,6 +84,49 @@ void g_string_free_to_file(GString* s, const char* rootdir, const char* path, co
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
++    safe_mkdir_p_dir(full_path);
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
+index 3d201092..9bbc0b1c 100644
+--- a/tests/generator/test_auth.py
++++ b/tests/generator/test_auth.py
+@@ -228,7 +228,7 @@ network={
+ 
+         with open(os.path.join(self.workdir.name, 'run/systemd/system/netplan-wpa-eth0.service')) as f:
+             self.assertEqual(f.read(), SD_WPA % {'iface': 'eth0', 'drivers': 'wired'})
+-            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o644)
++            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o640)
+         self.assertTrue(os.path.islink(os.path.join(
+             self.workdir.name, 'run/systemd/system/systemd-networkd.service.wants/netplan-wpa-eth0.service')))
+ 
+diff --git a/tests/generator/test_wifis.py b/tests/generator/test_wifis.py
+index 1a4ead23..0130a6eb 100644
+--- a/tests/generator/test_wifis.py
++++ b/tests/generator/test_wifis.py
+@@ -136,7 +136,7 @@ network={
+             self.workdir.name, 'run/systemd/system/netplan-wpa-wl0.service')))
+         with open(os.path.join(self.workdir.name, 'run/systemd/system/netplan-wpa-wl0.service')) as f:
+             self.assertEqual(f.read(), SD_WPA % {'iface': 'wl0', 'drivers': 'nl80211,wext'})
+-            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o644)
++            self.assertEqual(stat.S_IMODE(os.fstat(f.fileno()).st_mode), 0o640)
+         self.assertTrue(os.path.islink(os.path.join(
+             self.workdir.name, 'run/systemd/system/systemd-networkd.service.wants/netplan-wpa-wl0.service')))
+ 
+diff --git a/tests/integration/base.py b/tests/integration/base.py
+index b0863854..0606b1e3 100644
+--- a/tests/integration/base.py
++++ b/tests/integration/base.py
+@@ -31,6 +31,9 @@ import unittest
+ import shutil
+ import gi
+ import glob
++import json
++import pwd
++import grp
+ 
+ # make sure we point to libnetplan properly.
+ os.environ.update({'LD_LIBRARY_PATH': '.:{}'.format(os.environ.get('LD_LIBRARY_PATH'))})
+@@ -321,6 +324,89 @@ class IntegrationTestsBase(unittest.TestCase):
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
+2.34.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
index ea944fa9db..c59797c219 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
@@ -17,6 +17,7 @@ PV = "0.104"
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
            file://0001-Makefile-do-not-use-Werror.patch \
            file://0001-Makefile-fix-parallel-build-failure.patch \
+           file://CVE-2022-4968.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-- 
2.34.1


