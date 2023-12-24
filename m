Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68854C46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 07:29:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23255.1703402935993487582
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 23:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C8ZcY1lN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0722ee0bab=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BO7LGiF019811
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 23:28:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=IfLObhfwlPAMInQmcf
	JgNImEgchfYbq0JMYtgtOx8Yw=; b=C8ZcY1lNA/1iDKh+mgZ4gBLXN/X5Y2/fN6
	bMmL/qha4eLq7+CQCfbOujxS1uBYXIxXfEMHBtBUBW9aW0ynnBlg23Zh1/3PrYkA
	up3pR3riIgggH9mrTD29CTFlCCOJvPSeHT5bsz46dDoJcaTrNyfeptgBbiWqmUw7
	GDmTwPYsGZUps7Fh06RqjklugpJsSmY/Oi0DmQQl/+wN7yfgcxmeDnDn9e+bf5t/
	mxLtsBsnNUiZ0NuZUp61JWeh9juv8oHZU2vVSHqd7yacymkRiuWJCFtLx+c4m20o
	48AAyMEyvhmdh04ORDeKl3H23ZmeXcBuYjjisTJZINvKBA6W7QBA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4gjfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 23:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3P6C/q2DldBEs/9fZsVuAMorkKQQEJcmxTbZexCdEXltFLhXPrzXiYl3vTYMUlcwvTSkpGLqZeqoY4cpOUQ/Xcuu2uI4vEKshN6xAYnYzT3fg5LzdiJMjWLOcuqeDTKhIC9OCnZxO/tVm4RajNsEa1QaRV/MMTUT8W2FG/fMiOqI3X/o97y2myfCVhbXzVF40fSu2SSjY276fgqhfl6hGA7Ii4TMS/Bxb/xAn59SuaT+pWgBR5J/y2tRjMxdaA4OwxYHQpMNAt6a0Zs9IyEFb8rQ01UG6e702RYbfAFi/3ghMKez0+6Sa3l5hEoedr1TPUDMIbXCVr0gS7PV5bP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfLObhfwlPAMInQmcfJgNImEgchfYbq0JMYtgtOx8Yw=;
 b=TvXceiI3JpvFbUBBVXNwOOJSzmcRRNzCjeOP5/jOL9vpuM5liwGvgOWV8/P9gHwfR6iK58UE73zhmGLn8LZcDO/z9vXDNY6qQRka1j6xdPW+aKG0r1WX4z7A5cATdDikX7EC0vPAyttMPXWwih+Yk1b+4yMgOdBXk5LGIGV0MsjeAgcvUuR3clYD3T14p82+2CvaK9fG0i/U91mWSGxnG+aub3GRili7TGRtc7HqotX2JMdkxIuVVuq5TjO+15bYw2vbMG+tZBVZf2IA4Rfq8K3/ytLXQx8tW3mMOeKMHMQcsOETLv5kz/tZY5XmyJ5SKsjE/wbkidGUpPNWUe++uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Sun, 24 Dec
 2023 07:28:51 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7113.023; Sun, 24 Dec 2023
 07:28:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] open-vm-tools: upgrade 12.1.5 -> 12.3.5
Date: Sun, 24 Dec 2023 15:28:39 +0800
Message-Id: <20231224072839.3247254-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: e1794932-3530-4065-ab1e-08dc0451fa03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ifiQ+5gI+RyF3AlaZALAGg4oNJf1XU9GWlYBmJrN98YXC4w1kNiHRuPW7VgCEgU2ZrgJyr1M6UwBEKS65fBr9LR+G3kXV2HifS8CZIWOUOd0/kyzp0Psfn6gxZ8Pa2E7BAk/XVlUea5WFBF2wOqkBnOHKtxJrw0gmzP6PGPt9PdZ9+4EM/Au/0HvOH2H5goTIWxb1YbE+4pK3DaGdqs74BKN3vscParJnniOlckalm4/Xn3KDPatxiPJugJIQyQJm/RkE/9sEHwP00GlR2E2aHCfJRivTjgNbn+xRgAyF5mR4qJayacCN3r4LdlRGteUDcIFx/Ozy+RqGcfw/HG0kh1b0B9n/n44mIuzejtJ03SHsDhQTsaj65nq0OR1KmiCTMr4oy/acuVKhW0QpSXGK2lXN+0fODlfi2waV5aVTdUIxS6+sYT8pVlEEqaC7oa0LIY4pRKmScg5Fo77FPvWecgVZ6+0y4EZlEKOpv26kOq2TWPH3y6NUrbIcS+mt0utIPc6Jtjwi1DrhGpBoITSSyqstRFT7j/xEk5wyVdurZlQTCK6uP6k+LyxpE3dSsP98+F1CnDxWS8ZDeCHuJ1fqsdA6JY67Cm8Oujsh8lTCpYse7Qd19j7kngL2Q5tcrcOJKXi1bTV9Oe6VKlc9sxSB3RZDuKalelIu0QWzr1cqfs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39840400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1076003)(26005)(2616005)(8936002)(44832011)(5660300002)(6486002)(30864003)(8676002)(38350700005)(316002)(66476007)(66556008)(66946007)(6916009)(36756003)(966005)(2906002)(6666004)(86362001)(6512007)(6506007)(52116002)(53546011)(41300700001)(478600001)(38100700002)(83380400001)(46800400005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?se8MO8e6CzZD6ZrBxHQUugOT1bCTj//GXURGciG4rmzzTQN0ZPd1tll9CFjk?=
 =?us-ascii?Q?82zaayISif8/UFGl/XlLv+1a3pwaNDe4lhRx+ajJwkRErYwASrsBE0V66vHe?=
 =?us-ascii?Q?ZqcGp8jGMLoeB65hDNn7xI2GxMH34QT0aGzK3tlNnDQTGwfMoRoQbj2U4UPC?=
 =?us-ascii?Q?vKZO139tGUKHa+Eg8HluRMDuA+ZPrWItuBKZB/PFc/e+J5fuO/pzcc4sVekX?=
 =?us-ascii?Q?FOUxdiwIktR4KKGOEuz1FNTFwjw5Ou5bzf92evK2yDw8FsVou0OSG4RR5VRl?=
 =?us-ascii?Q?zm6DMbi9giwWHAFqSpsHknjJlEv/54kfapMAFDDOYvwSInwc0hgX6Q7ao+5W?=
 =?us-ascii?Q?znQRVkBi6zHOlMPxvB7f7StyIZfZree+bT46ORwMxIDU+l1D5vNLvWVQl7MT?=
 =?us-ascii?Q?oQ6bdsOSJx7XJ9opEejFhFpQ4vRHvRXZFL9jyFzi980xyZcTcWZzMH370qDu?=
 =?us-ascii?Q?i2KDst+RzwCcFGMXbCba8H3WRBZONn/JEZEJSejU8ecF1O+BS8sBbKlC9hR+?=
 =?us-ascii?Q?4IDdEEc22ztSG3hRl0bA6wnnbPWzHwg8nKbaoQLRlXQtWEsLc3KZ/3hAT4nn?=
 =?us-ascii?Q?kmC+u+llEwaVCuvBB0Vpq489K096AjBZ2qly28Ghs1+BFA1Vk/tfy9QKkMWc?=
 =?us-ascii?Q?wCWvk6SkUMAdBXNWXTX+GRvwY7WR/6VgKRBnm1CMP3wKAsde2ckMGWkLNkT7?=
 =?us-ascii?Q?R5Q8eDfwIwknxS33yK7RtKo2cTBxYgKXHMtfygsuV+2DRpqd9QEjuLIWmbLF?=
 =?us-ascii?Q?ktscIdQ204V/TZR3KrwX28KYDKJxFGc+pI21hEi5hBTXhjPPBzKAlQ16hngN?=
 =?us-ascii?Q?ye+JL5QGA9fFKtUBGdu/3CdNoCqzNll/Ax68oOHPwAqrceqi3Hiw1uCMnLwc?=
 =?us-ascii?Q?h45l6yJyckXPwPMaZFv0z8PnbqOtAR5FAwwX+lWBpuGMEGb8F1NxAxh3O/0d?=
 =?us-ascii?Q?NgvOaO08ZXj3DGzidwMrTlnlcSkYBZBQFejYllCSCmTp1t329xY/7FoL5Hpx?=
 =?us-ascii?Q?RfqD+8Wg1WohMOvXOrhKKQXRVjRThgjCq0C+x6R7iNLHt3f6HGrLWQ+K2cCc?=
 =?us-ascii?Q?Lua9h64T9B7hr6BWze3I6s3shun0TmbGn5uoWVRWqysrv4rwqEUzTKAxeTkH?=
 =?us-ascii?Q?3oNZf54fyeTJo6jLCG1GDNBm1YVfuGSmY9qYDEZtV27H25t5tHPuEcdI6rq7?=
 =?us-ascii?Q?wi6IYCJ/AljW2KApbXGVGwzpj3b+xIkRvsnCTU00MJEOvftbNS8JuG0PCagg?=
 =?us-ascii?Q?m0vrd/fZ+q5U9KsOifvhBtSKPsM/cWb2icy3QIlq547t/YL9Yp0MZmpMA0S8?=
 =?us-ascii?Q?0ui74J4bvQLS4mnAs/UBWwKcvJ+tUAtXdlatvqlmvmlyHVC2wqVVWEGtUgpx?=
 =?us-ascii?Q?hGJ+eWBcCtU43ihEbzyqUISNc8uM6NGVFEyv79+jgA4BOEN5I4IQU6i5ubKK?=
 =?us-ascii?Q?y4/KzMfArI/IdcU4HBbPbso5iXe7DlGSEs24zQKeG3+0TgTmvVlOez6R5W6l?=
 =?us-ascii?Q?Tgb5B+P9ULzvB4Mf1b9oPi1sfTh3RpzoQXOm5ZnjhH5DVLeJLYivaxjDxM3O?=
 =?us-ascii?Q?3FgZ/ePDcIbjrVSJsT4sIl8mJkCbkeqmwBm68VeS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1794932-3530-4065-ab1e-08dc0451fa03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2023 07:28:51.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+7pBi7bpZ2tPMwNAEZYDhgw/d6nQ7VzLGPIBIf/gn6CUHxsIg/TN6tTnDhLEuK2mpoQ1P9SlfF3fsp86yDJ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
X-Proofpoint-GUID: tJy_XDRUrO_ZPDNlM0sL_uIrLzAGH6PQ
X-Proofpoint-ORIG-GUID: tJy_XDRUrO_ZPDNlM0sL_uIrLzAGH6PQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312240058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 07:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107777

Release Notes:
https://github.com/vmware/open-vm-tools/blob/stable-12.3.5/ReleaseNotes.md
ChangeLog:
https://github.com/vmware/open-vm-tools/blob/stable-12.3.5/open-vm-tools/ChangeLog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 Change: fix build with clang
V3 Change: fix typo in subject

 ...-Add-resolv_compat.h-for-musl-builds.patch |   4 +-
 ...1-configure.ac-don-t-use-dnet-config.patch |   4 +-
 ...e-configure-test-for-struct-timespec.patch |   8 +-
 ...finition-of-ALLPERMS-and-ACCESSPERMS.patch |   8 +-
 ...-test-for-feature-instead-of-platfor.patch |  21 +--
 ...onfigure-test-for-sys-stat.h-include.patch |   8 +-
 ...6-Fix-subdir-objects-configure-error.patch |   8 +-
 ...include-poll.h-instead-of-sys-poll.h.patch |   8 +-
 .../0008-Rename-poll.h-to-vm_poll.h.patch     |  16 +-
 ...strerror_r-unless-on-gnu-libc-system.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  10 +-
 ...011-Use-off64_t-instead-of-__off64_t.patch |   3 +-
 ...ux-Consider-64bit-time_t-possibility.patch |   8 +-
 ...ools-Correct-include-path-for-poll.h.patch |   5 +-
 ...-Portable-way-to-print-64bit-time_t.patch} |   5 +-
 .../open-vm-tools/CVE-2023-20867.patch        | 163 ------------------
 ...ools_12.1.5.bb => open-vm-tools_12.3.5.bb} |   9 +-
 17 files changed, 67 insertions(+), 227 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/open-vm-tools/{0001-timeSync-Portable-way-to-print-64bit-time_t.patch => 0014-timeSync-Portable-way-to-print-64bit-time_t.patch} (97%)
 delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.1.5.bb => open-vm-tools_12.3.5.bb} (95%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
index 4a97c2618..96270f860 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
@@ -1,4 +1,4 @@
-From c1ee0b0a0a05379d0e6475dfceaaf41876192640 Mon Sep 17 00:00:00 2001
+From 148aadcc1b61da6f6b9ee4bcd35c38b7fbaeb8a8 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Wed, 14 Apr 2021 10:24:52 -0400
 Subject: [PATCH] Add resolv_compat.h for musl builds
@@ -17,7 +17,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  create mode 100644 open-vm-tools/lib/nicInfo/resolv_compat.h
 
 diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
-index c56b73cfe..8ae3b2f74 100644
+index 6f20547b2..f5064a9c0 100644
 --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -70,6 +70,10 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
index 3aa21e3ec..69c825311 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
@@ -1,4 +1,4 @@
-From c953564b9f029b31381a2c630b47133ffe6a33e7 Mon Sep 17 00:00:00 2001
+From 547d05ca417c6b75ad06bf3119e1df8869742a70 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 7 Apr 2017 15:20:30 -0700
 Subject: [PATCH] configure.ac: don't use dnet-config
@@ -15,7 +15,7 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 3c058135a..124781f99 100644
+index 26bfdb682..9e2a1d6e3 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
 @@ -1227,7 +1227,7 @@ if test "$with_dnet" = "yes"; then
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
index c6af3d5ff..1029252c7 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
@@ -1,4 +1,4 @@
-From 6384b37cdef4ea868c3cee27bb627e4cfbab7b50 Mon Sep 17 00:00:00 2001
+From 74ab6b05fcba32031255624a31676e2aa0db133f Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:03:00 +0000
 Subject: [PATCH] Use configure test for struct timespec
@@ -6,16 +6,16 @@ Subject: [PATCH] Use configure test for struct timespec
 Use the configure script to test for struct time spec instead of trying
 to keep track of what platforms has it.
 
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
 Upstream-Status: Pending
 
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
  open-vm-tools/configure.ac           | 1 +
  open-vm-tools/lib/include/hgfsUtil.h | 8 +-------
  2 files changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 124781f99..05f37f275 100644
+index 9e2a1d6e3..2f34f6eda 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
 @@ -1441,6 +1441,7 @@ AC_TYPE_OFF_T
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
index 4b6e089ac..b4bd646d6 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -1,4 +1,4 @@
-From 6be6cda5aea42b951212ec5f8a72778b1ef9c2da Mon Sep 17 00:00:00 2001
+From ef466581b53a1e64f53d4839bdacfab1d65cc6b9 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:10:14 +0000
 Subject: [PATCH] Fix definition of ALLPERMS and ACCESSPERMS
@@ -8,16 +8,16 @@ assume it is not there instead of testing for specific implementations.
 
 This is needed for musl libc.
 
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
 Upstream-Status: Pending
 
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c      | 8 +++++---
  open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c | 3 +--
  2 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index 63c4e65f0..87d419a7b 100644
+index 4a0bc9378..6ed49e2b7 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 @@ -105,11 +105,13 @@ typedef struct DirectoryEntry {
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
index 9fe0126d3..f23235e90 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -1,4 +1,4 @@
-From 9d22fba096cd77101fc45420c918ec748d2cc31b Mon Sep 17 00:00:00 2001
+From 4462efefdd61bff1e39e946b917b01433898be88 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:05:07 +0000
 Subject: [PATCH] Use configure to test for feature instead of platform
@@ -18,20 +18,20 @@ The features we test for are:
 
 This is needed for musl libc.
 
+Upstream-Status: Pending
+
 Refit patch of open-vm-tools/lib/nicInfo/nicInfoPosix.c
 
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
 ---
-Upstream-Status: Pending
-
  open-vm-tools/configure.ac               |  4 ++++
  open-vm-tools/lib/misc/idLinux.c         | 30 +++++++++++-------------
  open-vm-tools/lib/nicInfo/nicInfoPosix.c |  6 ++++-
  3 files changed, 23 insertions(+), 17 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 05f37f275..9a0c63cf6 100644
+index 2f34f6eda..daa0939c3 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
 @@ -1169,6 +1169,7 @@ AC_CHECK_FUNCS(
@@ -57,7 +57,7 @@ index 05f37f275..9a0c63cf6 100644
  AC_CHECK_HEADERS([sys/io.h])
  AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
 diff --git a/open-vm-tools/lib/misc/idLinux.c b/open-vm-tools/lib/misc/idLinux.c
-index 1bb86f483..41c670cfc 100644
+index 3d7d1e303..0e12ac5bd 100644
 --- a/open-vm-tools/lib/misc/idLinux.c
 +++ b/open-vm-tools/lib/misc/idLinux.c
 @@ -27,12 +27,9 @@
@@ -74,7 +74,7 @@ index 1bb86f483..41c670cfc 100644
  #ifdef __APPLE__
  #include <sys/socket.h>
  #include <TargetConditionals.h>
-@@ -1025,31 +1022,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
+@@ -1025,24 +1022,23 @@ Id_EndSuperUser(uid_t uid)  // IN:
  static Bool
  IdIsSetUGid(void)
  {
@@ -108,10 +108,11 @@ index 1bb86f483..41c670cfc 100644
 +#elif HAVE___SECURE_GETENV
     static const char envName[] = "VMW_SETUGID_TEST";
  
-    if (setenv(envName, "1", TRUE) == -1) {
-       return TRUE; /* Conservative */
+    /*
+@@ -1062,7 +1058,9 @@ IdIsSetUGid(void)
+       return secure_getenv(envName) == NULL;
     }
-    return __secure_getenv(envName) == NULL;
+    return TRUE;
 -#endif
 +#else
 +   /* Android does not have a secure_getenv, so be conservative. */
@@ -120,7 +121,7 @@ index 1bb86f483..41c670cfc 100644
  }
  #endif
 diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
-index de57a4a90..c56b73cfe 100644
+index 0135e6a09..6f20547b2 100644
 --- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 +++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -35,9 +35,13 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
index ec9aa7d2e..fda4c37e5 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
@@ -1,19 +1,19 @@
-From 2bc09bc7d933bc3d91c687e1cc2befdaa38d2c86 Mon Sep 17 00:00:00 2001
+From 79675399124b61f4e3da1f64f4b265f83dd26cdc Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:41:01 +0000
 Subject: [PATCH] Use configure test for sys/stat.h include
 
 This is needed for musl libc.
 
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
 Upstream-Status: Pending
 
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
  open-vm-tools/services/plugins/vix/vixTools.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
-index 34f3125d2..cebf4dd8d 100644
+index 75d24a29e..d11c42178 100644
 --- a/open-vm-tools/services/plugins/vix/vixTools.c
 +++ b/open-vm-tools/services/plugins/vix/vixTools.c
 @@ -66,7 +66,7 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
index e83fb3621..4c6f6ce02 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
@@ -1,19 +1,19 @@
-From dbe0943011c24d48de3df5a95f4e4606be0ef250 Mon Sep 17 00:00:00 2001
+From 37ad9845b5b8ab7170a2aaba31a505b2a36ba0f8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:48:04 -0700
 Subject: [PATCH] Fix subdir objects configure error
 
 Fix build on musl while here
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  open-vm-tools/configure.ac | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 9a0c63cf6..5845490f6 100644
+index daa0939c3..497e9459a 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
 @@ -326,7 +326,6 @@ AC_ARG_ENABLE(
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
index 7eac04ab5..fc0ce961c 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
@@ -1,19 +1,19 @@
-From 8c7f5895ed1f98bfc4101f8cfb93af3d13fd6bce Mon Sep 17 00:00:00 2001
+From d138b808a8b47a02a370b411149ef8ce7883ca6f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:02:50 -0700
 Subject: [PATCH] include poll.h instead of sys/poll.h
 
 including sys/poll.h is deprecated
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  open-vm-tools/lib/asyncsocket/asyncsocket.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-index 2bf97b549..b285c59c6 100644
+index 26aee553a..4f413db73 100644
 --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
 +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -70,8 +70,8 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
index d9000b4f1..265476709 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
@@ -1,4 +1,4 @@
-From 0c695d910b3e136e116cdbe0bfc6231dfac255a1 Mon Sep 17 00:00:00 2001
+From e86d7b309bdf5b7c6c38faeded157e220d4ccc78 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Wed, 24 Mar 2021 16:21:35 -0400
 Subject: [PATCH] Rename poll.h to vm_poll.h
@@ -13,12 +13,12 @@ we rename poll.h to vm_poll.h.
 
 Update for open-vm-tools-11.2.5.
 
+Upstream-Status: Pending
+
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
-Upstream-Status: Pending
-
  open-vm-tools/lib/asyncsocket/asyncsocket.c     | 2 +-
  open-vm-tools/lib/hgfsServer/hgfsServer.c       | 2 +-
  open-vm-tools/lib/include/asyncsocket.h         | 2 +-
@@ -29,7 +29,7 @@ Upstream-Status: Pending
  rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
 
 diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-index b285c59c6..5c528820d 100644
+index 4f413db73..684008d34 100644
 --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
 +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -87,7 +87,7 @@
@@ -42,7 +42,7 @@ index b285c59c6..5c528820d 100644
  #include "err.h"
  #include "hostinfo.h"
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
-index 98f5b3f06..b436f0c7e 100644
+index c7b4cdd0f..d6e0cdc0e 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
 @@ -51,7 +51,7 @@
@@ -55,10 +55,10 @@ index 98f5b3f06..b436f0c7e 100644
  #include "vm_basic_asm.h"
  #include "unicodeOperations.h"
 diff --git a/open-vm-tools/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
-index dad848093..b61a2561f 100644
+index 09947002e..3800f5971 100644
 --- a/open-vm-tools/lib/include/asyncsocket.h
 +++ b/open-vm-tools/lib/include/asyncsocket.h
-@@ -171,7 +171,7 @@ typedef struct AsyncSocket AsyncSocket;
+@@ -177,7 +177,7 @@ typedef struct AsyncSocket AsyncSocket;
   * Or the client can specify its favorite poll class and locking behavior.
   * Use of IVmdbPoll is only supported for regular sockets and for Attach.
   */
@@ -97,7 +97,7 @@ index ade356b9f..8759fb960 100644
  #endif
  #ifdef __ANDROID__
 diff --git a/open-vm-tools/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
-index 8b1fe759d..f22fcd402 100644
+index f1709fe03..c1a5dfdba 100644
 --- a/open-vm-tools/lib/rpcIn/rpcin.c
 +++ b/open-vm-tools/lib/rpcIn/rpcin.c
 @@ -57,7 +57,7 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
index 980019492..a6638adb9 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
@@ -1,12 +1,12 @@
-From 921621a098f242953117747f5852d7e3136ae6c4 Mon Sep 17 00:00:00 2001
+From 666a043be7d6fe07a36599260f7214cbd29a79e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:16:53 -0700
 Subject: [PATCH] use posix strerror_r unless on gnu libc system
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  open-vm-tools/lib/err/errPosix.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
index d3c9149f7..6d0f8a3ae 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From b44d1d4e4ba77f1d9cf7de73a3bd210d02b5ff36 Mon Sep 17 00:00:00 2001
+From b294005f3748c6caee002fd7588964f7bf9b1d09 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Mar 2021 17:26:53 -0400
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -7,22 +7,22 @@ rlimit types are not representable with long or long long
 formats, therefore use uintmax_t to typecast rlim_t types
 and use %j to print it
 
+Upstream-Status: Pending
+
 Refit patch for open-vm-tools-11.2.5.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
-Upstream-Status: Pending
-
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index 87d419a7b..f5cc80b76 100644
+index 6ed49e2b7..0cc7c4094 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-@@ -5301,8 +5301,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
+@@ -5294,8 +5294,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
        goto exit;
     }
  
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
index 98eecebcf..c6ab4d44d 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0011-Use-off64_t-instead-of-__off64_t.patch
@@ -1,4 +1,4 @@
-From 39a59ab7efe98c880c783b2ccf43e5a137d2b222 Mon Sep 17 00:00:00 2001
+From a8ef33b0623ba3494594a040ff5c77771168fdd6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 27 Aug 2018 23:22:21 -0700
 Subject: [PATCH] Use off64_t instead of __off64_t
@@ -7,6 +7,7 @@ Fixes
 unknown type name '__off64_t'
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  open-vm-tools/lib/file/fileIOPosix.c | 4 ++--
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
index c7e62da7e..388857fc1 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch
@@ -1,4 +1,4 @@
-From 859c21b9a21c53d936301b05044d0c649d6cf32b Mon Sep 17 00:00:00 2001
+From 2904454f3408a3abe3f2b0681504a66ea5ce713c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 24 Mar 2021 17:36:26 -0400
 Subject: [PATCH] hgfsServerLinux: Consider 64bit time_t possibility
@@ -15,15 +15,15 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 14 deletions(-)
 
 diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-index f5cc80b76..5a79d6451 100644
+index 0cc7c4094..445a53881 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-@@ -2566,20 +2566,6 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
+@@ -2559,20 +2559,6 @@ HgfsStatToFileAttr(struct stat *stats,       // IN: stat information
     LOG(4, "%s: done, permissions %o%o%o%o, size %"FMT64"u\n", __FUNCTION__,
         attr->specialPerms, attr->ownerPerms, attr->groupPerms,
         attr->otherPerms, attr->size);
 -#ifdef __FreeBSD__
--#   if !defined(VM_X86_64) && !defined(VM_ARM_64) && __FreeBSD_version >= 500043
+-#   if !defined(VM_X86_64) && !defined(VM_ARM_64)
 -#      define FMTTIMET ""
 -#   else
 -#      define FMTTIMET "l"
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
index 83687460b..f2f6893db 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0013-open-vm-tools-Correct-include-path-for-poll.h.patch
@@ -1,4 +1,4 @@
-From 7f7e00ce582d72013cb54278548d3320e032b0dc Mon Sep 17 00:00:00 2001
+From eae0a65a9d6c9df20d05b4208aee23656915480b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Feb 2022 13:32:32 -0800
 Subject: [PATCH] open-vm-tools: Correct include path for poll.h
@@ -13,13 +13,14 @@ Fixes
 | 1 error generated.
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  open-vm-tools/services/plugins/gdp/gdpPlugin.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/open-vm-tools/services/plugins/gdp/gdpPlugin.c b/open-vm-tools/services/plugins/gdp/gdpPlugin.c
-index 2bba2937e..025339595 100644
+index 96e6d717b..0b8a583b8 100644
 --- a/open-vm-tools/services/plugins/gdp/gdpPlugin.c
 +++ b/open-vm-tools/services/plugins/gdp/gdpPlugin.c
 @@ -32,7 +32,7 @@
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0014-timeSync-Portable-way-to-print-64bit-time_t.patch
similarity index 97%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools/0014-timeSync-Portable-way-to-print-64bit-time_t.patch
index 4a4fae116..39eea767a 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0014-timeSync-Portable-way-to-print-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From dcb5d3e5d47b1e01fdcde575badc51825d4f4681 Mon Sep 17 00:00:00 2001
+From 09cc01b2fa15e319afafa13d7365b399a60f443c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 13:36:01 -0800
 Subject: [PATCH] timeSync: Portable way to print 64bit time_t
@@ -12,6 +12,7 @@ pllLinux.c:43:20: error: format specifies type 'long' but the argument has type
 |                    ^~~~~~~~~~
 
 Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/631]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  open-vm-tools/services/plugins/timeSync/pllLinux.c  | 8 ++++----
@@ -50,5 +51,5 @@ index 1ab6e3584..0c304b5d7 100644
     return TRUE;
  }
 -- 
-2.39.0
+2.25.1
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
deleted file mode 100644
index 170dddf68..000000000
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 3028cdd4c0b2461b904cbe5a5868c8e591aa0941 Mon Sep 17 00:00:00 2001
-From: John Wolfe <jwolfe@vmware.com>
-Date: Mon, 8 May 2023 19:04:57 -0700
-Subject: [PATCH] Remove some dead code.
-
-Address CVE-2023-20867.
-Remove some authentication types which were deprecated long
-ago and are no longer in use. These are dead code.
-
-CVE: CVE-2023-20867
-
-Upstream-Status: Backport
-[https://github.com/vmware/open-vm-tools/blob/CVE-2023-20867.patch/2023-20867-Remove-some-dead-code.patch]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- open-vm-tools/services/plugins/vix/vixTools.c | 102 --------------------------
- 1 file changed, 102 deletions(-)
-
-diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
-index 9f376a7..85c5ba7 100644
---- a/open-vm-tools/services/plugins/vix/vixTools.c
-+++ b/open-vm-tools/services/plugins/vix/vixTools.c
-@@ -254,8 +254,6 @@ char *gImpersonatedUsername = NULL;
- #define  VIX_TOOLS_CONFIG_API_AUTHENTICATION          "Authentication"
- #define  VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS             "InfrastructureAgents"
- 
--#define VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT  TRUE
--
- /*
-  * The switch that controls all APIs
-  */
-@@ -730,9 +728,6 @@ VixError GuestAuthSAMLAuthenticateAndImpersonate(
- 
- void GuestAuthUnimpersonate();
- 
--static Bool VixToolsCheckIfAuthenticationTypeEnabled(GKeyFile *confDictRef,
--                                                     const char *typeName);
--
- #if SUPPORT_VGAUTH
- 
- VGAuthError TheVGAuthContext(VGAuthContext **ctx);
-@@ -8013,29 +8008,6 @@ VixToolsImpersonateUser(VixCommandRequestHeader *requestMsg,   // IN
-                                           userToken);
-       break;
-    }
--   case VIX_USER_CREDENTIAL_ROOT:
--   {
--      if ((requestMsg->requestFlags & VIX_REQUESTMSG_HAS_HASHED_SHARED_SECRET) &&
--          !VixToolsCheckIfAuthenticationTypeEnabled(gConfDictRef,
--                                            VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS)) {
--          /*
--           * Don't accept hashed shared secret if disabled.
--           */
--          g_message("%s: Requested authentication type has been disabled.\n",
--                    __FUNCTION__);
--          err = VIX_E_GUEST_AUTHTYPE_DISABLED;
--          goto done;
--      }
--   }
--   // fall through
--
--   case VIX_USER_CREDENTIAL_CONSOLE_USER:
--      err = VixToolsImpersonateUserImplEx(NULL,
--                                          credentialType,
--                                          NULL,
--                                          loadUserProfile,
--                                          userToken);
--      break;
-    case VIX_USER_CREDENTIAL_NAME_PASSWORD:
-    case VIX_USER_CREDENTIAL_NAME_PASSWORD_OBFUSCATED:
-    case VIX_USER_CREDENTIAL_NAMED_INTERACTIVE_USER:
-@@ -8205,36 +8177,6 @@ VixToolsImpersonateUserImplEx(char const *credentialTypeStr,         // IN
-       }
- 
-       /*
--       * If the VMX asks to be root, then we allow them.
--       * The VMX will make sure that only it will pass this value in,
--       * and only when the VM and host are configured to allow this.
--       */
--      if ((VIX_USER_CREDENTIAL_ROOT == credentialType)
--            && (thisProcessRunsAsRoot)) {
--         *userToken = PROCESS_CREATOR_USER_TOKEN;
--
--         gImpersonatedUsername = Util_SafeStrdup("_ROOT_");
--         err = VIX_OK;
--         goto quit;
--      }
--
--      /*
--       * If the VMX asks to be root, then we allow them.
--       * The VMX will make sure that only it will pass this value in,
--       * and only when the VM and host are configured to allow this.
--       *
--       * XXX This has been deprecated XXX
--       */
--      if ((VIX_USER_CREDENTIAL_CONSOLE_USER == credentialType)
--            && ((allowConsoleUserOps) || !(thisProcessRunsAsRoot))) {
--         *userToken = PROCESS_CREATOR_USER_TOKEN;
--
--         gImpersonatedUsername = Util_SafeStrdup("_CONSOLE_USER_NAME_");
--         err = VIX_OK;
--         goto quit;
--      }
--
--      /*
-        * If the VMX asks us to run commands in the context of the current
-        * user, make sure that the user who requested the command is the
-        * same as the current user.
-@@ -10917,50 +10859,6 @@ VixToolsCheckIfVixCommandEnabled(int opcode,                          // IN
- /*
-  *-----------------------------------------------------------------------------
-  *
-- * VixToolsCheckIfAuthenticationTypeEnabled --
-- *
-- *    Checks to see if a given authentication type has been
-- *    disabled via the tools configuration.
-- *
-- * Return value:
-- *    TRUE if enabled, FALSE otherwise.
-- *
-- * Side effects:
-- *    None
-- *
-- *-----------------------------------------------------------------------------
-- */
--
--static Bool
--VixToolsCheckIfAuthenticationTypeEnabled(GKeyFile *confDictRef,     // IN
--                                         const char *typeName)      // IN
--{
--   char authnDisabledName[64]; // Authentication.<AuthenticationType>.disabled
--   gboolean disabled;
--
--   Str_Snprintf(authnDisabledName, sizeof(authnDisabledName),
--                VIX_TOOLS_CONFIG_API_AUTHENTICATION ".%s.disabled",
--                typeName);
--
--   ASSERT(confDictRef != NULL);
--
--   /*
--    * XXX Skip doing the strcmp() to verify the auth type since we only
--    * have the one typeName (VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS), and default
--    * it to VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT.
--    */
--   disabled = VMTools_ConfigGetBoolean(confDictRef,
--                                       VIX_TOOLS_CONFIG_API_GROUPNAME,
--                                       authnDisabledName,
--                                       VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT);
--
--   return !disabled;
--}
--
--
--/*
-- *-----------------------------------------------------------------------------
-- *
-  * VixTools_ProcessVixCommand --
-  *
-  *
--- 
-2.6.2
-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
similarity index 95%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 4873e9d89..6696e552c 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.1.x \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.3.x \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -42,8 +42,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0011-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
-           file://0001-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
-           file://CVE-2023-20867.patch;patchdir=.. \
+           file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
@@ -51,7 +50,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "30339ef6ded308f0147fe80f89b9bca3ace1aef9"
+SRCREV = "1b362b9eb449fb5de3809aaea4a636ece30ee5b7"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
@@ -77,7 +76,7 @@ PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 # fuse gets implicitly detected; there is no --without-fuse option.
 PACKAGECONFIG[fuse] = ",,fuse"
 
-CFLAGS:append:toolchain-clang = " -Wno-address-of-packed-member"
+CFLAGS:append:toolchain-clang = " -Wno-address-of-packed-member -Wno-error=unused-function"
 FILES:${PN} += "\
     ${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
     ${libdir}/open-vm-tools/plugins/common/lib*.so \
-- 
2.25.1


