Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21896C7115A
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 02:44:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1053.1750387490386657690
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 19:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82661b579a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K1o6Z8013929
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 19:44:50 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2088.outbound.protection.outlook.com [40.107.95.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80s18eu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 19:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uazxi6EH4eYjwoCbAVMoXpEP6GosE7HME3z+pgg0venJYjVjoO6xWHnheoSO8/xeGS8G6WlCpB79vSFkcyFuKebGAm7OK0pSS5MAh9+unEM+hCGLvT6oaHl2hJ17Y8+hW8i8lVja/zEFefM8ZVsJZppX9SAHi93+s3jL9P2eJ/5GUoQoGpnWglFm/F1VMJbzbMuIkJBcNfMjkUSZxh09P/lDFyIxlW0iVxhih39KJ1B2FBsojmW5KpKIu5rALaoK0kACxlT3oO4SvTJ6HhgITZD+QTEpz/Apnd74j4GLhlNnvl2Ad8hh9fPt2Oxe1Fw/bWjn/yQ0TGcJhIzVYKRk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ntn6I30Nn8VXMptXIh8A5ZM6SFUZzQ4/0TrKXaiCHA=;
 b=rtNWH0AprEnR9g9pK8jIXz3uxgOd1Z93Gl+UWtdLrd842PWJdlKChucSSmAliDO6ms9lZG4Zv3AIlF4mj6R394uht7ol9uhHwEmc37DiCswB43jhBDWV3iiXbH4USWrANtINuKzExxROzZGa+IXJVo+aWUYm3AKmzZjPOV7S5IH0S3rk2IRYO014ncOt+BRFIT67QNoqHgZlANBq2JQYxkAGeSVCHyJwiBfHwLq8qwIm5bSTGDuILzNobDEdri0YwAIetbNVf2fHBBALUEV7aDuApOeQGLrnrfPLa8j9ihWXwfMHd6syLcbiyaZB65lqOXnVPvTJev/ZweTNiAJBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 02:44:47 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 02:44:47 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/2] glade: fix CVE-2020-36774
Date: Fri, 20 Jun 2025 10:44:36 +0800
Message-Id: <20250620024436.2107776-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620024436.2107776-1-peng.zhang1.cn@windriver.com>
References: <20250620024436.2107776-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a29d548-af2d-4ccf-f73c-08ddafa46ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3vyQIVzY+LHs3deKp+XLYtWtwb2UUWD9eVAmVfaW8PtsU/z5TjuylnH6YFBv?=
 =?us-ascii?Q?iPVUdF2JB/RA/w702DB13ixqXHenE54Why6U5tAVft+EaIn3kP7vaKhwSZWM?=
 =?us-ascii?Q?QK3z+nRjwVnzQrw8bit9WUXQV+jb58PblpWXEG969guKmZW4VYE1qJ3fmQvS?=
 =?us-ascii?Q?VRhTidIGCNJNE2g7xibrLtHOnGqdEPF8v4Pxau8A2F/saGMq0Acu1nKbD6ob?=
 =?us-ascii?Q?EhsI2dW4iIlItedIjF202gB5uyuvgRLYUu7l99PhTmvOxme5XcHdLzR9zCnx?=
 =?us-ascii?Q?HQYol8xWRpGJn4owNchW0HvqWrD2B93r6/duTgmltpVrXsYgZoixPCrQ+ZCG?=
 =?us-ascii?Q?pUzpzLAi+cGq0N+vEyYLhaUeUTVvmx+KTvMc8/rFsXHtmOAi4BDf9I+63Nlg?=
 =?us-ascii?Q?kZWAWz+Z5p+Npcs1Use9SmuNbhsDSKJ/GoTvNgLV6FCJBrmFtyfDuxIkcZEf?=
 =?us-ascii?Q?LE2JO3i2OFSTbeNqtf12H9cEer97smFF3wEGfJtVa+ChaQ3+5LE1YMLMEIsO?=
 =?us-ascii?Q?y3F2sgCeDW3Wkm/Pz6UogfHbxjQeOtrmQq2cjixpUXgYL5ibRNsz38oYCSk9?=
 =?us-ascii?Q?fm0BXgV7BPkgESXrsKlZBwLXuL/WqZTYOhOQ2dxNygKBp7RnY7Gy33CqOmQI?=
 =?us-ascii?Q?7WDHg/od+OW0pO+mJCgnLJt1+ddOARs3OuOCjkEPlHtkzCFTN8oyMX/FCbOo?=
 =?us-ascii?Q?taSEcEemhysXMYBEClUV6njtinQsyXVeOlNj4W/92vU6HCyxfQogoSh7hJUF?=
 =?us-ascii?Q?RsIB4nRN/0vpmLWPVzaI3KgX4pNdwG3J9e1KzhsuYjD5IKrkCuzbj/trVO7o?=
 =?us-ascii?Q?DIh+2/avAS72gmu7YQYk91lwF2hgjAnRV+pkNJGp12j5EGWkPO1X/Q/Or62g?=
 =?us-ascii?Q?qa33znesPzE4+BDkbFLi7pCD9bStlnxEDTsnoR3lyH1EoqfsGDJLhFjKKAea?=
 =?us-ascii?Q?bD3ZzlHyr2WHpL1abIuP+289JOeIpEglHKGtwM+OR8HzGCJmwqLzA8BbkqlZ?=
 =?us-ascii?Q?D6erLdPKeJwsTcgLfmxhxZVf2r4GgoywRVu3W4QhI2xzo6f5GSu7lBF+MkOX?=
 =?us-ascii?Q?IrweRy2UBKuTTdvFB8vz01RUvOtS/yr/51dfsDOBNgX+Eb0ZZMJ4lRtIIHp8?=
 =?us-ascii?Q?EajhKNCnvFyfk7s/lJGnRQdXqusFAVYGIozXGvf2ovNrIsGiQLSyBgh+aZ+5?=
 =?us-ascii?Q?IW5jS40yhks7FdApjzFt98LkJJsD2HhyzwkTzK2skIGz2y47QkcX7Q5X4MAH?=
 =?us-ascii?Q?QfiJHYhhiiIo8UFLHrvM6NSlSczS1iqgGyT5Fn1qe3baub0M2vb4m3yivLs/?=
 =?us-ascii?Q?ymtp4L0ck8+0+cbw7B2UF13gDHcoIiio8N/CCVFEXfxwynp73f/l5DSjmehx?=
 =?us-ascii?Q?x/XX4CJWw2xp1UvRT26nutgnboaLs/v2udI3uzeKRVaWr+aIeey3kPI3tkxm?=
 =?us-ascii?Q?S8lTthAUWNI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p/m5l6A3/4D56xSVeX5SHrj98ydcuw5rx5IXt4bHXCkY9EOoTL+JPSLzHQ6M?=
 =?us-ascii?Q?IgZj+udoSijHeJmJORT04bLhf8GzYSjMoEhwh+WNuWPHbs/SkK2xKD8jNxS8?=
 =?us-ascii?Q?xGMcaTAcBMklwI+Lf4gwXstSELA7iwY/obBNWhOb2eByHUH2vjg8EsDsuwQI?=
 =?us-ascii?Q?m6ISUys5mVN2cz7fgye5Ya7EOHFVVksRbv/RCpL/z5D0qDATFfb9EYDB6IFB?=
 =?us-ascii?Q?Y1LDsTFJ+NVjEtd6QrFw33zZoOLOCUvwF34pGegW+LY/Q55IWzGX4Bdy8DgY?=
 =?us-ascii?Q?7aMZGGs/fVeYKb22uF4+6RtJqD/qY2kxjm4qTgm2Fezi9fKb1APVjqUYtBnk?=
 =?us-ascii?Q?SP+DLDqBHf0qL+xkYHs/+mcr4jxQU0kZ590HqxxkJRB+zyfZ20T95437cGSo?=
 =?us-ascii?Q?vTJKGt3/gEY0gMqXicH1iOESY3kvE9KLmpwIDkDw5UxNCOiUZItq0Ce1lh5a?=
 =?us-ascii?Q?FW1jb8434SHoZVbVfSvH5G5fuIHqW3NuoQWet7bvebiEesAy1df4GPK9G6Rh?=
 =?us-ascii?Q?1nRNNZ45DzJjvIIoYsnuvvshdAmzDO23UCIKpohRub6g32mKyHaYtFmx/nRL?=
 =?us-ascii?Q?lDUcvn5OctRrXRe/UCZb10ME9BUTxfk2q+cjrBfYDyQM5ZH6jNXuGkMmsWKQ?=
 =?us-ascii?Q?xhZ3w6Qoqzmd9vmvK5r7JDZ4RxgRZTrPTy30DQojb9xV9zPih1OuyNxMI8y1?=
 =?us-ascii?Q?PRArM0VIPOrgIjlIaKyGLfaCxqyjmFPaxOPAv3O5JnSpmn+8pTo/4UY+SQ5a?=
 =?us-ascii?Q?5j49jZun1jJBEVv17foOoWfMyzHX8sYPk4T2FN2LMGInbzLGtWJhfe033K/e?=
 =?us-ascii?Q?pMB+oy2y3KMNlEGUuWT5ptKCIE4gqlyAeoQC3KMRDymURAgt6kOkGTSQNHUd?=
 =?us-ascii?Q?2LJtoFxp9LjoStHs6zScjPFPDqs1+/8qKusyDGCMhONrNEOwSO2HuboaERFx?=
 =?us-ascii?Q?noD9JQjAabmMVeVPv5r3n4gp5dSa+8E24CsWvy0L2qXVtYD0IJpHiFbdCoZ1?=
 =?us-ascii?Q?y8tm5V700IpcS8V5Z+F0i9ckM7C1RyEoHZQmAqQt5gd6etZoc3LGa3TbJcmB?=
 =?us-ascii?Q?9pvUE1uJ2L1sYDGR/5V092QygDJHLmRaETBR7+V0nSF2yAoA2nI8wjd5LEi7?=
 =?us-ascii?Q?PVURp0FqA/NUR1l1gs1/OOzKpSFaU11p5TnQC3dcp9lhUMZu74qN/DffX3b3?=
 =?us-ascii?Q?ursitc0sLIas0O+jmY5bhdosgHZHQgtW7lNo+oPXcEd5YHQZrkb/f2vPD/qo?=
 =?us-ascii?Q?MC2apvB0OccgOvcRTPpofKCr82Rddd3K15RlFNfOS/cOGbCIwTS+1DaT/g2m?=
 =?us-ascii?Q?mcQcAYLcvKqwoi/ZVXmM4wv1sPH2nykX7PVhRkBl+odHj8GUbbgJEMFAJQzI?=
 =?us-ascii?Q?6SgrOOW1CtH0TDAyXwLYYGrNe5E3IvjtjiYOL+OmpghJK6gDlRYbYXVl7ZYf?=
 =?us-ascii?Q?L6LLXdSWffVoBiZlMEcjW/NK6Rp5iIIt9bQCY6zG6sJvLlGPqw3ofq6Iuqhe?=
 =?us-ascii?Q?HcjKUwZJ9thdrNlt4rDislbzm3jmnjgMX4eMMB45K9p6JdSkOGN/v1nlyWb0?=
 =?us-ascii?Q?BDU8zooIaYE3X0GjOJmh4g99V09Ptc7m7XKGXHOE/QNI/rSSKjFTaDswZoEv?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a29d548-af2d-4ccf-f73c-08ddafa46ba4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:44:47.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3C6Q56grb//BXojL9E4gNi393REEjTJLhOcNTzeEtjgCAk+wyB6dyhHjpsHgYa1ZxAIUVQdIpepaQ7FgNrF1rkekBWpaW1XSVZ8DDQ/9hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
X-Authority-Analysis: v=2.4 cv=edg9f6EH c=1 sm=1 tr=0 ts=6854cb21 cx=c_pps a=aZuVfPrC45A246xPil/Ifw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=n1dRnMMuAAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Vw2-W0St5DFLPkctPREA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAxOSBTYWx0ZWRfX1EaTARfcUUI5 x6xPtRFMfHHuuG6W8AU8u5JX67fT58HfWVdiDqJ8mBAzHtRiTj/U2zzkdkVC2SOa1ReauR2gy7j D2O7zgK2+K5yXqTI0MrhYWpKrkxVGX44NueQKQ3677+DAcADbcNDfbEN4oDjDZy1viz5wHo5rCV
 OiZYJ8j4ri9AYqErc1dvxJS0fQ2E9R2yhYsGAPr/cgLPnldgr1Ce2IOkuM7iV3HJf4PFUplsGG3 twaFTpoeKhZ3SbehwOMapA+PfMR/qGH5VNzaBzNdYabYlRIzITKg+5kRzzZxUQZN5KAz+6WD3Et oJpW3JDV4aWWKDi/yhbB5zpWhgG6JzcQwWpM4R7ordldvrPiS2gsAU6BH+VWjK390V/N1gzunqx
 NuuXbrUDkmshK9Z3S7tkfB7imfY+KQuMP3EiP5d+E08Oyu1DkBrU/fbiTOh3VUpg8VmzdPIc
X-Proofpoint-GUID: Iq_AexuEdN6NmRMx4P2lrjtI5kqex7Lv
X-Proofpoint-ORIG-GUID: Iq_AexuEdN6NmRMx4P2lrjtI5kqex7Lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117959

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2020-36774:
plugins/gtk+/glade-gtk-box.c in GNOME Glade before 3.38.1 and 3.39.x
before 3.40.0 mishandles widget rebuilding for GladeGtkBox, leading to a
denial of service (application crash).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2020-36774]

Upstream patches:
[https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../glade/glade/CVE-2020-36774.patch          | 54 +++++++++++++++++++
 .../recipes-devtools/glade/glade_3.36.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
new file mode 100644
index 0000000000..ae44862ccf
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
@@ -0,0 +1,54 @@
+From 8f1ed202ad21c787ec406f531905b4cda64fb13c Mon Sep 17 00:00:00 2001
+From: Juan Pablo Ugarte <juanpablougarte@gmail.com>
+Date: Fri, 2 Oct 2020 16:08:23 -0300
+Subject: [PATCH] GladeGtkBox: fix glade_gtk_box_post_create
+
+Some widgets with contruct properties like GtkMessageDialog get
+rebuilt right after they are created on project loading so we need
+to check glade_project_is_loading() intead of GLADE_CREATE_LOAD
+and use the object ad the connect data to make sure it gets disconected
+if it was the object being rebuilt
+
+Fix issue #479 "Glade 3.36.0 segfaults when opening a file"
+
+CVE: CVE-2020-36774
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]
+
+Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
+---
+ plugins/gtk+/glade-gtk-box.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/plugins/gtk+/glade-gtk-box.c b/plugins/gtk+/glade-gtk-box.c
+index 1153c957..c995524e 100644
+--- a/plugins/gtk+/glade-gtk-box.c
++++ b/plugins/gtk+/glade-gtk-box.c
+@@ -57,9 +57,9 @@ glade_gtk_box_create_editable (GladeWidgetAdaptor *adaptor,
+ }
+ 
+ static void
+-glade_gtk_box_parse_finished (GladeProject *project, GladeWidget *gbox)
++glade_gtk_box_parse_finished (GladeProject *project, GObject *box)
+ {
+-  GObject *box = glade_widget_get_object (gbox);
++  GladeWidget *gbox = glade_widget_get_from_gobject (box);
+ 
+   glade_widget_property_set (gbox, "use-center-child",
+                              gtk_box_get_center_widget (GTK_BOX (box)) != NULL);
+@@ -86,11 +86,11 @@ glade_gtk_box_post_create (GladeWidgetAdaptor *adaptor,
+   g_signal_connect (G_OBJECT (gwidget), "configure-end",
+                     G_CALLBACK (glade_gtk_box_configure_end), container);
+ 
+-  if (reason == GLADE_CREATE_LOAD)
++  if (glade_project_is_loading (project))
+     {
+       g_signal_connect_object (project, "parse-finished",
+                                G_CALLBACK (glade_gtk_box_parse_finished),
+-                               gwidget, 0);
++                               container, 0);
+     }
+ }
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
index 85f85a4612..01f0792ca9 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -17,6 +17,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.36/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
+           file://CVE-2020-36774.patch \
           "
 SRC_URI[sha256sum] = "19b546b527cc46213ccfc8022d49ec57e618fe2caa9aa51db2d2862233ea6f08"
 
-- 
2.34.1


