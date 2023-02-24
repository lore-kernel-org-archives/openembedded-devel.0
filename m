Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F30C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 11:12:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15216.1677237131541708271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Feb 2023 03:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L9BFwUyF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14194d500f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OB3Lgu004565
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 03:12:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0ZR3ThnYrcySds7CJWU5j9gRJDv2Njq9xmCjdE8mXfw=;
 b=L9BFwUyF6dOnzZbuvPNlAcSc2N/ynvlC5l8M+DGcygcJDCnliU2cm/vLnkF2ehQjS++V
 fiIL+8tcPueByH5kd7R8f03pdfDXrpRv+OYP3g8fovJDXgCud7zu8i/ar5QlxG8Dx2WB
 769CrWh+je28y8CR+pM9BS1wj1F0dJBuEPR2sgj4o+XmS5nXfJH1TNS/+Wp89yBe1z3G
 N1Lqbd2o47lABpqkWB5AjTUccyey4BfCK88hlSia1nipmf+SrcU3snhfeb+TEHDeA9Uf
 3I6WPLqOW09S8jm7DMVn972yHM1giqqTr+BBayO7LaGR58fykhAn/dvHc25rqx+3UyK1 4A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6wp8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 03:12:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZFIytZgVw7IpV2/y/3sha0N2J95WSizH5aQnFk3dRXDJoUd1H/1c2Lyga6yx9zskN0uZ3aT8aW9NgT9p4sfAbAHfKyp3H9re8Z80EZKcPG4m2VuKasKqKhT5KyecTlwnHfbU30HRE0HWTWRZ8hlx9tF5XD368eaKCTThKzJapLMU+1TSBQ5ID2BdLuhv86gb9UWEJ9PZOiyzd/Pmf6XFbCx0fo5QAT9nblh7FZ6HCdij703PqQbgrT612QOyLfmdP/NhkiUuE6Ga1TUrfQl6pLmEuPrzXcsJbY5cyNmy9RWrRO9BN3WjzlKVRWHmujWyJkP023GS4eOhpT0yojJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZR3ThnYrcySds7CJWU5j9gRJDv2Njq9xmCjdE8mXfw=;
 b=SivItE5zlHxfXuu/qg4GbfVa9TCz2LteCkjPdrymeg1ByMZJoL0LsxuaO0lx8sM9xwPpexWBkcWGILrXwhYoXTdMJy8+BoNoV0GlaK+wObrzlw8EfWFo1uJxQFg36XVnSCup17M66v7HBNfkYUIkBt8j4/+lSXZRCgekljE6gFFTf/YwfTxxlw2wnNiExq5RVVfOTurZGX6+HEMGr+5KCUboxariZ22UTQMWOH0yGiEeRd+N66ZZdg6vGQ/fse5KDRgNT9BxlUW/ADgUltaEyJPx6w1P5pVeDqAJMvjUBceYn5kRmSWHN6FMU2at43ytcOtDEdr1vOFvRdboOCjZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 11:12:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 11:12:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ufs-utils: upgrade 1.9 -> 3.12.3
Date: Fri, 24 Feb 2023 19:11:58 +0800
Message-Id: <20230224111158.3787799-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BL1PR11MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: b9dac948-d782-4145-22bb-08db1657f83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KPzDsn2AHuaZJzqd6AwD6nGQ6dLzWzShdHFgYL8xaP+PvGdlz1Gn+a5k62vlL4EE9nL1k/Fi3nUTQTO3R2+Nr6eINCkeLA3qKUQCHP3ExzcrreKP3Rc+aKhhyXR0MYcpKPoGsz/tczDR5c8oBf2zWMqzDSSW5nQhICroTmDIC6skSFQA/QI00jhgbsYrF3U7oJDjXfb8ebkCXkQyHl42E8kVByX/t3Up/gWIz1oopoQCJq9ud1Mra4Jo0JSdQ1PdKjTkSPfXnPkFuuliYxybP13n6aMzEC3Q32GbjS30tZPwCq4PGgpjpMQuHgWEp7hkyXKjiIJFjImMDY6B+7n9WJYObKlnHkH0w6mmUxo0zuHVCkNW+eK+vGywMq1dXcwn9wowSj4UQ99L79yNwaJxz+f2LwBs7OU9pJCXDMPh96Px3AqVaETnpqhGL1+R7+MUAPZY29SxYLy7KQEtaCMofzwSH0cgVlOmN9zEgOvEMLN0wPvwu17HELvWdu+VTWtnBkSr2oTT9573XfFboEbJv0moOzcCPCl6xThXOZ9Yi8We996R3yU08/FS6dZuOwG35JClmK27ENrCfbZIZGKShwivk95xPgN0tI3gTooPocpLF5U2oRcpQWArcnGekibhrkH0Ag4ACA64G94Jj9VKRcNFJAGu8pkSXHRgL7GamOap+vCh96946uCjGnUdux20
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(451199018)(36756003)(86362001)(44832011)(41300700001)(8936002)(5660300002)(2906002)(83380400001)(38100700002)(38350700002)(478600001)(66556008)(66946007)(66476007)(52116002)(6486002)(6512007)(186003)(26005)(2616005)(6916009)(8676002)(316002)(6506007)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nPlRAJ7uU5l3zYcVkkBnvy4J3/i8fyl/lboTL2NRBZIkoFZEo27O+4jhELoe?=
 =?us-ascii?Q?mvtdumzcWSA5tT5Q4e2B/+WYP7MS4/7K7NhxYwAVqVDnuYf5l2bfVDEqPbuP?=
 =?us-ascii?Q?JHkh+jC3WtPI0HjsQJmF4NehEPltOvAHBi+xjtWXpFzeZ3gpRoPYZmL9BdSB?=
 =?us-ascii?Q?rMj3M+FQdwN+/AZirVBK4eSO1CwqO7OYr8Gr7cqutHOkzh6hFohMzoFXSv0J?=
 =?us-ascii?Q?li8VhoNlt6AeTqXjwiffTnba4Ax1vQgmMssNrc5Oi610fe9E5jl/JFgO3qUA?=
 =?us-ascii?Q?E8W2mu+mY2uJo86RoXDgYVgZKuAYS9bAUkud5WvkdTtqomo3yt6XrDpLuw8H?=
 =?us-ascii?Q?hesey7wMG+3N5O0kCGVErJlSarKS1wG3WA1DbePbSMslcokONFiNICK3ZNhb?=
 =?us-ascii?Q?/hvgohHPeh67i0PUTDAHxjY1OgmVedU3kKHkAd+9kn8HbKoytbWjdy/j9V4O?=
 =?us-ascii?Q?fEc5QHJnHvwhAUh5NaXjeZjUDCzJyx0loJ45GxaNW6/qWiS1ri6XnRlRJaQ/?=
 =?us-ascii?Q?YZX8jO1lErIlelD8LZj19ppO1S/y1tcD86VDI+AJoeKA7zsuTuqBZWc7U2b8?=
 =?us-ascii?Q?+N5RDizp9vaRS5bLTzt8awQSVLLzRC2FWkjXUMx7yi6sjOAIyb+oXlCZNqEJ?=
 =?us-ascii?Q?lAptk7V//c5QEA3usZTuNJjTe4IlY/hlqaD15TBG/bbvp/WtDtur9/Ksema1?=
 =?us-ascii?Q?f6rt5SGHW8OvdO5+AxNN8UMhUrj4LmqvnA14jqTgHwtmZRCisHX/fZi2lkTA?=
 =?us-ascii?Q?aObAgddcOgvOPKkd+uQ4hMf3h4ZxhnBT+boYjzmpAsKgOTQRsWOwNhOWljHZ?=
 =?us-ascii?Q?BLXhs9fOm8ad4mFlGQatIrd6BgcuBL5OqNSYp2HCqABRiZJk2F7ml6pdgpn+?=
 =?us-ascii?Q?+G0MF3pQsiYQSRBWxZzCDdoyU5Jiea9WBdV85oiJoktvJeEv86jZghucX/ze?=
 =?us-ascii?Q?ha8NsFp5wnYAX2jimJ5bTSpoQrNwX7ooXEjTYF+Y9NkcMhiL5FAuekP4PWop?=
 =?us-ascii?Q?81h8YFajtRVYIdLxh800aCeCvZaWHQKxbFa/5ecZtkAMmh70VZ2XMaL15G3k?=
 =?us-ascii?Q?mlbs2G1HjHYH/sCExpoP7tKAFMQq8VEGFkBoyZXEaBGRe3GGtLKDbpPAFdJY?=
 =?us-ascii?Q?a9lt+obPeTXSDAo6S/0sg4h9KC2IP2UGVeANMknyhsRCmmJf/yT79+E/c5yI?=
 =?us-ascii?Q?DvzZFfmfnlZb9ULBBMj4BP45QCaQIqweZTsn2MblL/3iZ5RkvmmJZhss7uVF?=
 =?us-ascii?Q?rFrdvJg5LCgcMwLiYKzG9kjQ40AWAVmNYMAy9/XcJKWgracEdxvOKQrkNOYc?=
 =?us-ascii?Q?dZwZckoIGLbq+KcgkUpU00tZ7zFrQy94is1GT6mBMJ/5E54K+MLxcaLOxVxj?=
 =?us-ascii?Q?jMaaNvADFQG6HuJFUa5b2TM8dUzaLQW7+l8Q63f0jZRiEVcA27o68PK1qSIF?=
 =?us-ascii?Q?Txp6apL57Z8FqSNp6lfPmC9W7gMRrkF39W71+7DrPVgBBvMNN+lJT0c9XENU?=
 =?us-ascii?Q?TBZkPxjkQWtFECYO11UGXWFy0sSgk33rfd57z6waf/bGNZ+0DdbfqbpBJ5Po?=
 =?us-ascii?Q?2OdIiC62uRIOHVkm/YSd+Xzbgqf0jr1FsF3E8hTBrcGZ6j1bQ+P4xU7Y6hIG?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dac948-d782-4145-22bb-08db1657f83b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 11:12:08.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUh+28u3kEWS+06sTvwqKOM8aGrmyNXxGVggdnhYD7EhV7Wj0mYkqhUSYXfu8FA61Ol3M2Uw/8y6whnPevEppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5525
X-Proofpoint-ORIG-GUID: CFiYQKUEOScVy5EK9hOmywjEKFlX68vr
X-Proofpoint-GUID: CFiYQKUEOScVy5EK9hOmywjEKFlX68vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_06,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=929 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302240091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 11:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101249

Drop 0001-Use-asm-type.h-for-kernel-types.patch as it has been merged
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...0001-Use-asm-type.h-for-kernel-types.patch | 65 -------------------
 .../{ufs-utils_1.9.bb => ufs-utils_3.12.3.bb} |  5 +-
 2 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_1.9.bb => ufs-utils_3.12.3.bb} (85%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
deleted file mode 100644
index 08cf87016..000000000
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 517f841ccac59b0579e706dd768d6c7b1a7e7552 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 12 Mar 2021 10:37:21 -0800
-Subject: [PATCH] Use asm/type.h for kernel types
-
-This ensures that right headers for types is included otherwise it can
-conflict for some platforms e.g. ppc64 where it includes the underlying
-files conditionally
-
-asm/types.h is
-
-if !defined(__SANE_USERSPACE_TYPES__) && defined(__powerpc64__) && !defined(__KERNEL__)
- include <asm-generic/int-l64.h>
-else
- include <asm-generic/int-ll64.h>
-endif
-
-Upstream-Status: Submitted [https://github.com/westerndigitalcorporation/ufs-utils/pull/29]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ufs.h      | 1 -
- ufs_cmds.h | 2 +-
- ufs_ffu.c  | 1 -
- 3 files changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/ufs.h b/ufs.h
-index dc51367..0321c54 100644
---- a/ufs.h
-+++ b/ufs.h
-@@ -4,7 +4,6 @@
- 
- #ifndef UFS_H_
- #define UFS_H_
--#include <asm-generic/int-ll64.h>
- #include "ioctl.h"
- #include "scsi_bsg_util.h"
- 
-diff --git a/ufs_cmds.h b/ufs_cmds.h
-index 1e7e24d..5c5b045 100644
---- a/ufs_cmds.h
-+++ b/ufs_cmds.h
-@@ -5,7 +5,7 @@
- #define UFS_CMNDS_H_
- 
- #include "options.h"
--#include <asm-generic/int-ll64.h>
-+#include <asm/types.h>
- 
- 
- enum field_width {
-diff --git a/ufs_ffu.c b/ufs_ffu.c
-index 2bcec44..99b479c 100644
---- a/ufs_ffu.c
-+++ b/ufs_ffu.c
-@@ -12,7 +12,6 @@
- #include <unistd.h>
- #include <stdint.h>
- #include <errno.h>
--#include <asm-generic/int-ll64.h>
- 
- #include "ufs.h"
- #include "ufs_cmds.h"
--- 
-2.30.2
-
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
similarity index 85%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
index f6aa872fd..342661c9a 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
@@ -4,11 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "517c0b01e47d4441cc45be351509fb4c96843d5a"
+SRCREV = "40c0bdfa7f4e922a4bcdf431ef72b321648d2d9f"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
-           file://0001-Use-asm-type.h-for-kernel-types.patch \
-"
+          "
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.25.1


