Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AECEE57FD
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38551.1726109171357210995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C00xV0015368
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:11 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da1w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldeOCs1k857i/Brf1S0gOzvrb85OC0wdll6FTa4qNwxxRkP3X3vGL0bxj9+l01xjoV5SR6xiVEsECTyeURiLmNGxzYEpbR8Y5eps6tUxFOsIDqgF/Rvs27lh9wCdu8GCzHszeITTPCfwKX16R1YDiG5oJ6khblgydWNEdBkphTxPfx257kss3JS3EfRFoxh4OKGdS65gz8DAlB2gXHB+HWw9N7qN24IxR1SAq+b+i6IirxX6TuOhUa47LlGlRW2pvbdsxN+Y5SJ+sZd27xeDtbYW41mFGBd5GBWyQEh9O2UGtIONqsYT1FgVJskmPEl/JX0CQ7gKmdZuodWj5sNwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nC7e9OpI2PKr4b7x0NN2ncZF7f4uv8lf9CP56Tb5co=;
 b=qCtc9bl+FvqC/NcrP7+tXg0niNpq5auWcHyPadPjw4sIFBg4yZg5kagP7EBFLtmpxy/kUbH8p88xy+qhxroFPKbmC/Zg8TwfuyUbzS2dxaBmr2wQ4oYyXVKv4mCSjvZ6cklp1zmBh/l3WzEwpG+TmOl1EMKJWFFnKAR520UHm7wO0n6jrWCjpvaK/NvdOQDWJUxAfR3f2hPwSGRAcgNmcIkaRcsIx9GYHLUY1An9gFjxoVx7Y0larb63k8ERFoJG+jRcYdu225eIf1XL4RkBF8bZrxjg0GT3tjYKEtBqPCIt6QsjvQR5alugl/IKy4MNRfX0bPHs6pVelmAgkC+0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/7] lvm2: upgrade 2.03.25 -> 2.03.26
Date: Thu, 12 Sep 2024 10:45:53 +0800
Message-Id: <20240912024558.3998529-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912024558.3998529-1-yi.zhao@windriver.com>
References: <20240912024558.3998529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c74344-5d5f-485b-8c73-08dcd2d50e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r5XfHKzcohC9pQK4oHyiwAuasscglnpApCsRYNLNx6qUvp+R9Td7WczRcppZ?=
 =?us-ascii?Q?80Sy1njC5GmYzFDr7dV7uhK9x9nbBFQifgJn9mnJseChOYlVr4QSEtZo8kLx?=
 =?us-ascii?Q?vavJJGIy9zR22qU6zZ8LqMvjsYFCaM7QGR3U1PWau4E4hBKgynbWpgL3eXW3?=
 =?us-ascii?Q?ZAyLLA1q3BDRpy69Q7FDbL7TUvKby3th/DmZxqdAXDuf49EYCtlKKYWtP3he?=
 =?us-ascii?Q?zz9kkgxBnpNxw4WjjwrjUme0nuIKQwGF5jE+DoJt1hb7ClDVyASZrJS1po/o?=
 =?us-ascii?Q?EWxaeZYTrhOZXtr+41CG0pT7kKUw2iC1eqF4e6vK1//PdHSKpf96lYZA431X?=
 =?us-ascii?Q?307aJvuy4i7wZtmnXsWOhINbWdxk7c46OqJUQdTPJfQr0waOKmUFK6sn7Sv/?=
 =?us-ascii?Q?c9i54ARjrSaV08Qtf1EXMtJ3y2ndIOFx0HfrehHenDyO18qzYVMShg2vB8QX?=
 =?us-ascii?Q?11DGlVXOjqTN4HYiBSl/oBISw4n/HbU0+s6T6WJQpR1r9gnSPfwfzOnllxRF?=
 =?us-ascii?Q?izUc/+qcIlgYe8sVKLlsHNFyRRBzVG6xn3lBAkM70/neKTq3gAifaOM+YTG2?=
 =?us-ascii?Q?LZLjFWfeEApgR7ZxCl5TwIPrh7nknQBREZwNCXuascHDHG1PwIFIVvnFiozZ?=
 =?us-ascii?Q?QiF7l7LSHYWuUqTPLsn3OOEg/RqMjwLyQW64bqS6vdmCHJbRRlTki6zlIyNt?=
 =?us-ascii?Q?425SniWcFT1hph6YG0BMn+9hZwkfFcmiMO7uK6lpS5VyBOSXfB8j89hLtg46?=
 =?us-ascii?Q?U0cecuaxUIAOaCb7qkVYX0Ro4EKRz2j4VIZl2C7qpPBx4Gric8ipKWuw+Lwr?=
 =?us-ascii?Q?gE1rlIg6uusrVCthKM60rFuWN2q7YannfTfPEQoZ6tfhdlRz25hsxGTDykau?=
 =?us-ascii?Q?cANYe2NMCIPVc7w9mTeVqC2xm5dlFHSfdxheKJnagDQjWeLrD6gRp4SxUdgJ?=
 =?us-ascii?Q?ysKYzGTez2V9MtA4VHDjdzNgyZJ3yyMMUCMir07kcafsZj4Mf0E77Diec5yV?=
 =?us-ascii?Q?iNzaQy0zeg16xWm9miUqVFFDUsblYhJ5Wd7kuJrB+c45hd0WoUi/d1Eq+35d?=
 =?us-ascii?Q?F4lfapOBC3ygwORDW9D4MTalwzH3QUFVmvSijQ5q4OFZdHh+IZ2HMJR6Vv0h?=
 =?us-ascii?Q?hLvPnqA+ITlqdr/TXYYqdP5zHugouJLc5rMr0UNLEXQq41zqBF+qQ4Afi11X?=
 =?us-ascii?Q?Tj7xoIJr3I85nAoJuvvBfgclxqHrQZYAXYScpjnjYneOBZUzYx0PpW38r2w2?=
 =?us-ascii?Q?Gq1pKWJjWe1627sEYTX8QG3S4NrueeHucCmqOBF43jd+dMWhwz5NRx/EoD6Q?=
 =?us-ascii?Q?CLx6XOvi/iU9vcYXg+q880r6lRVp2iWbCstqQkL4nWpNPWTnlqjTIr0M2+Ph?=
 =?us-ascii?Q?y/eTymiCTCbvSv7//t+1kUhUaSeRww8n3UbB6VNB0M3K4VxP7pJkE+swMdjJ?=
 =?us-ascii?Q?GnKd5aVrJ2g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MdmPtJolCPPdOLhNCYy17nffkGkzQ6BdMq56m9fXHQXQeCA/sjHk9gp14JR5?=
 =?us-ascii?Q?E1ss50VXHReHaFkqvtgK0wSMRyxCXZ1P7bCGxMKh+97qSusi+Fn7mBXzmS8Y?=
 =?us-ascii?Q?8y1jgfDcLJC1E67Co+NLsRoKVelRmMWHCckDm/QcSo28s7lB2gQpz9w57idm?=
 =?us-ascii?Q?Y47cVo0FMyt1lhBvFpypnAH7rEbZ91aBcl2QIKjaLjIjAfAM6OJfB7+Md++O?=
 =?us-ascii?Q?qqIYMdHgY041xXDk00ebUZyxjH+aokZ++xasFVXhZrpbt8B3ovXYuyY9qTL3?=
 =?us-ascii?Q?23hGQEv89na0WqL24OMfnMYWir/fTjQ4UBCWWDvGgeJ5a/pV8U8NrHoTYQGI?=
 =?us-ascii?Q?aVYTRrkjET0/mCOUAVhSLQC1B/QUARnQzE+cG7DBL5jOrLnh2UCKxZjWYCHa?=
 =?us-ascii?Q?ne1q0MpOMk5VT4gXl7m0sZAJ/YciAqZZmyWSxKd9TO4HVLAdTAZF4lu2uZ4v?=
 =?us-ascii?Q?pCR3WRfFEaLKzdWXzpzmYxxfNjmcdiga1TVDBGHL2Pg6Zcrw0zeu6Zw4bos7?=
 =?us-ascii?Q?cJxGxQcI4Uyn3AIi6cKXc4IGYGd+RiZyANb8+5cE2W9iERQx1VeF5aie1flZ?=
 =?us-ascii?Q?GLmBCakqqtQq5WMWge0R3xBFP2vnKc99rjlG8h6tkefGjk1gzhyNVaxxCtrv?=
 =?us-ascii?Q?70AMsO3cXftErHkNciZ4/tWtm738wpaEoTEmxlgYbUSMje2jmaQjFz87Ur7u?=
 =?us-ascii?Q?jf9G4n0ynNEVCecCiyUEF4GDsE/9iX//RN7BhMwQE05+S9+/S5weI8hdu9uw?=
 =?us-ascii?Q?SpAGc7SZW5Akem6qhCSpXUqTsxIxdi8YYzyx0eqOufAaRYEDRIDMUavmy6hm?=
 =?us-ascii?Q?7hLsK3mATiGDexb43I4mKZvOV21T+ukvxegbpwjjADXJvEtFq9hsQIwp7D9v?=
 =?us-ascii?Q?WzDGzcaMIU3KwNGpSB9+kTU1/qXL7JV0RR2RPWurvuvYTNUeTKD7N5MUUddo?=
 =?us-ascii?Q?zDQjaYwEUmyulMnQ0j1L8IhBJtVL/AbyA+R2hdb1NyFHNNiZtR8J7qmICop3?=
 =?us-ascii?Q?cVGtN9mS84z4RNO/dor6OCkZtYbdqU+lVO2gAEV0NEFlvPDzpf3bFoqog+pq?=
 =?us-ascii?Q?mEobw1RbmzRmu0BZHP51JmWg82wPkVS1mBS75A2NwSxB15DAemxR390YWSDQ?=
 =?us-ascii?Q?ShZEI/xtmMXhqFIdAGmQU2dYJSyYSW/J7Flm/SvPM2VZfTFdci3L8+zWlk9M?=
 =?us-ascii?Q?u+p+7YMmpxrbigKTVPJ7sEJG99hU/5KGt8RtxQ8lOSOqqZ4dHvkVZfl+Q5D8?=
 =?us-ascii?Q?tPMKH8rzlO0nECxDpwpFegUU11gwryUWO4m51k7agTGibqYfpsONw+ATFVJ3?=
 =?us-ascii?Q?VjTVwD6vTPNDwkDEcKEc7mmEncvi78r5tveURuFRh4x47STNmOKD7cBcsITB?=
 =?us-ascii?Q?FvsC23Aaj2gEFuSA4r+Uhp5UL7KJIRciaXt+iCmMC5Cf2KDq/fx9a0Ug9TBe?=
 =?us-ascii?Q?mqHHRhMo3F1mlUc41QuX3nExoR5g7nt2rb+hPhtXXXVJelozRJsYY+gwIlGf?=
 =?us-ascii?Q?SwjKmUzPEZ6RzNPPLWbkFbQ4hWNoQdBqYagAunlDOU/estNXElZ1kxSXOllr?=
 =?us-ascii?Q?m/ZAh692f6Y0YXBKeBCvX3Q96l47kv6P2PzJ2E+Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c74344-5d5f-485b-8c73-08dcd2d50e48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:09.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ffy685cBreeyGwswZKNv0DM8Nx/FcBCm1/Av27oQYaSmQTUvyQ1Rp57yu8SeKFCwJTHMcetfkf9MS1mb8mpEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: w3zm8u_-AGuxDHo_ssEn1S0CdSDJ1rG0
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f2 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=EYefwe9Q9EMfsElqQXUA:9 a=CEsIH-8HjQcA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: w3zm8u_-AGuxDHo_ssEn1S0CdSDJ1rG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112248

ChangeLog:
https://gitlab.com/lvmteam/lvm2/-/tags/v2_03_26

Drop 0001-configure.ac-check-egrep.patch as the issue has been fixed
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-configure.ac-check-egrep.patch | 33 -------------------
 meta-oe/recipes-support/lvm2/lvm2.inc         |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch b/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch
deleted file mode 100644
index f4b0f913d..000000000
--- a/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f261b2f1bc16c32a55a22e28bf1b2f15ac6c7a88 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 6 Dec 2023 10:24:46 +0800
-Subject: [PATCH] configure.ac: check egrep
-
-The macro AC_HEADER_STDC which requires AC_PROG_EGREP has been removed
-from configure.ac, then it fails to substitute '@EGREP@':
-
-|     [GEN] command-lines-input.h
-| /bin/bash: line 2: @EGREP@: command not found
-|     [GEN] command-count.h
-
-Call AC_PROG_EGREP to fix the error.
-
-Upstream-Status: Submitted [https://gitlab.com/lvmteam/lvm2/-/merge_requests/4]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index c2dbf3c9f..d9e7964c3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -88,6 +88,7 @@ AC_PROG_EGREP
- AC_PROG_MAKE_SET
- AC_PROG_MKDIR_P
- AC_PROG_RANLIB
-+AC_PROG_EGREP
- AC_CHECK_TOOL([READELF], [readelf])
- AC_CHECK_TOOL(AR, ar)
- AC_PATH_TOOL(CFLOW_CMD, cflow)
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3f90bf278..059ab6999 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,13 +15,12 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            file://reproducible-build.patch \
-           file://0001-configure.ac-check-egrep.patch \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "0eef5ab6e14a45e6d2eacbc0bb744dbb33c16a7a"
+SRCREV = "6de3937ac517a3ecfd6d8d90f3f055dab631157e"
 S = "${WORKDIR}/git"
-PV = "2.03.25"
+PV = "2.03.26"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.25.1


