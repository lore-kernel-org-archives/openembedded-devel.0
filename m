Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2ABC433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 07:07:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30474.1642316866627042462
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 23:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xs9mmfwt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80153ccd67=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20G77jcc031009
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 07:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/u+6naPpSOWw/Wh7pJ3AByrw5E0W/7aR4k7twpuHGdQ=;
 b=Xs9mmfwtGothXzozADML0NYQ9m3wySeJ7yfiVyhXXejK0EopS4YOS1j4//SJwxHwA5f0
 3BxT0MXPJU1VPIQoC+XLGMljhtdeKEKxZriKDd1GA+xnxwatFF377VKS3Djb5/Uzl6Sb
 Ev+4xXV3UGy8sdt1oMEycxA2y6hH7JfhacL/Xv75HnVP13Dca0NqiLOiNajvHp30Lo5W
 NoGLeac9fi9nQllUmfN1y1wvqTqyMrRnNQjlVhQ0uCt3GB5k280lqTEiaEurziguta5w
 +C7zVM/ztnF57pNp+FK+2INe27PoSbLrPK3U8oMm/GpV/4XcmWx70hXj9aHv5+/R/Z0K TA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkqa3rkn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 07:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFWZvS1eQl00ntdNR43EGVzpTjy8rcW+84Euu3awgz4gAfxFA+QeAEhTAOrJpbguBdTOrAkztJeOwNzLX7pUdNlujRy4MYrzYxX9tQ+4goXOdrmPKhIguif5hRAtvy3T3J+2ZGTRXz/nAp45Gs6/Yg3rVDsTE/dONmymuxKWr4QAJfcbYKEJy0OR06dnWJxLr6z/1vSONYjq+2ZsTdFD44aDcvIfyJRK8skrMsKIQiJ8CrImegkqPEs62rrfh1tEaScjW5zPDE7IX6wt0srXf9mdxFcZ6lpP3SbaVJmPR8W4D/2urWH7LFYX+nNVmFqRxXCIUrDGbeu3OhsSGoLLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/u+6naPpSOWw/Wh7pJ3AByrw5E0W/7aR4k7twpuHGdQ=;
 b=NPULqZRJ8ZfWKX+V/ntoT/2ipuTlA+BkLl2vNfn9RYk0a+ncSIvJe2x5GEYJnjA777xbBgJQFoZKLZBigChQmgEmE9CcLNaWOIqJn/YTmIMWjnubcbquYEXKURO9prWNnJt/PVLkQb1AZ1AoU8hbnem1NbCVUMKKvuOpJhV5IFcJkK93bVpuz8QVAkKA+q9WN18yXczV6MgZcpDuzwP6+NOOc2IJ2682POp6agcn0E31p6SZgOxSOZNkP7/3mVV3kalgJ7BeRoJG2dqCV4MkoyH8Iph7Gz+aAdiJnGDtWyYOzYsF768CS6pNV1qaR5j4ICk/WpoP/gCevkRjwQBKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR11MB4177.namprd11.prod.outlook.com (2603:10b6:405:83::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sun, 16 Jan
 2022 07:07:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%5]) with mapi id 15.20.4888.013; Sun, 16 Jan 2022
 07:07:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.6.3 -> 3.6.4
Date: Sun, 16 Jan 2022 15:07:30 +0800
Message-Id: <20220116070730.452478-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53216e8e-e513-48d7-f9c9-08d9d8bee35f
X-MS-TrafficTypeDiagnostic: BN6PR11MB4177:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB417768B663790C4F4CFEC670F9569@BN6PR11MB4177.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6xnfqJdvlR3CYTGyZc8ifAdQAThYFb+fLiHpbYN1l3iwlwl0fJmiZSsEVMHceLZ4fcqdsLEGeZNRdtdOFZAstedL4JNUAAqCgEq7EWqK+cvqS/ixYhhDXYjOpee2R40LNDDL/QKbRyeAIlOub4cP5JI/+QT2S4tEExQXqXPNnbFnt1OcBNlaGPwET1AxcroIbZLWuIayrDiSiFGrpQGUx6yR9qOS+Fe9SY0aMkw41a8tLqAYiyUnO8WQTwbxvvwZmoLvOVhc3jKPGNfv/QG24RMDjV3QLx4NsV3ihUqMYbkUw6fo0TiDeRbwJYkpUXMt5YdA+ELGU/kRW9GTXSRERfLXsc+0u/hGZ8G8ZiyfWSblZ/CwJf3N02lPxhHHk++YuJ17CNWx2LJckn4L2jtT0YVuhMFxsl2tndtQTKpbjiFrcbi4ZJDjOL0CAyobBjeozbReitEnb4RboMM9yfrIqgeRicENO060JQFg9uC2Zdt7cphlBeZCB8syKTcNU8W641x+rgHISMPhgaLoF8DtR2fZ+rd97BEQQX5I4ry3oWbgn9QKxe7iBUNiFdi6mAjywis74j4aIF5lNfydhgHvdwhOx9v53qU8mKbLidygVxmcspSViDx9ZhRLgcGO6uifW85FVhF1n6t9q8G+ZNOFeO4zPWgduV7gqNc1QyWPRZcVLglevB+QiCFXYT00wEGbooHQpMjPfu2thubaZJySkY96C+IUjcCjJio6Id7ZmDe8/pQ0x1In9PYJIkEWrRIkoLpAJ3VCScjz+M4j027m8XNflX3F/2vtyWMLGK9C3KWsLLWc8duQFKAzddo/8G+J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6916009)(6486002)(2906002)(38350700002)(83380400001)(38100700002)(44832011)(1076003)(36756003)(30864003)(2616005)(26005)(84970400001)(6666004)(6506007)(52116002)(66946007)(53546011)(8676002)(6512007)(66476007)(5660300002)(316002)(66556008)(86362001)(186003)(8936002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jecs9oaZ1YV1mxSgzmXmaCcKgc4h0tLV2Fh8Xarr0t9t75EPuiK5LaxNmgxj?=
 =?us-ascii?Q?H9svXh7LlVkbsamEaj+R9eK0MgpW3d/P29vfJxpnzdbP1/RlaZU9xVjaRhSu?=
 =?us-ascii?Q?KrY7N0YyO2Pv8tdaimQo7oNW82Hon+sAUkm5F93XuHpgFfhluF3gD5ZWl2cS?=
 =?us-ascii?Q?1M+jim30SUMlVLUISLmA8WNPNHwT9vERrianeGYj5FWqgV6Hw/UYgvZauJV5?=
 =?us-ascii?Q?5gKmSIAz6fE9dCAcSUyFQ/2wkgCnpwDRH+S17MP5lwpkilJqgjVzjrTyIioe?=
 =?us-ascii?Q?+N77WyAlyCACNZqg5RXqzJ+oE9vlV4r3c0yxc8nXyQkKC/H884dj2AHGKwPt?=
 =?us-ascii?Q?rM6WiSYjFkyEC/livfS3S46hMxxvkd4TJQ3TMWX6UBlBxGufpXNOPXiBJDxR?=
 =?us-ascii?Q?NveyPDXC9ptinu6lfi270F3knza3ynCrDYBWH4fqeyklKw8XnBt7t51bgkVl?=
 =?us-ascii?Q?pqWmsXutUfixkZWdwk08K3lTocYj4GVpmtv8jxHeJIXim4RuVhKXy7rKvnPK?=
 =?us-ascii?Q?JYAq54I9QMBgaSc8JIDjeA4NG9wBTEpxml8/Tk6WFvTYJ1GoaSfEX5rTKvIZ?=
 =?us-ascii?Q?cLokedOaqrsqYFGUbqzQp9I5zKf4XC1fj3c3V6ti+AUAGO0oPX3vbHuhgHYi?=
 =?us-ascii?Q?d9m9CcUGnjB/0whC+BEA+E59Eg72ATbUi3qwJhgiFxLYANzafKNsILmOPrzD?=
 =?us-ascii?Q?m+G8ykGeHeFJFOm0KKAv4qAVkGkN/BqvA0fNOmaHFH5AENL38nUZTJriQ5W7?=
 =?us-ascii?Q?MUAORzylzd2NS09GVmPFgi7IOv8MZSYO5REqzZdS4oVq3nfCB5g5szNFNKkB?=
 =?us-ascii?Q?wOKPIBh+M0lGm+/j0h58Vxs0knn5WotYPHlsT4r0vtF+RZXtSQu2KpNrqqPS?=
 =?us-ascii?Q?0btb3q56GUjL8NRlBXoqpvdj2S38V1Q6ath4ydyxf8FkienmXmKLWK6fpkLm?=
 =?us-ascii?Q?QhnnRm1zBTer3fzFlzPM0ESeTjOpCgCCjrD/qxKIPkYu9x+IvZVBK4Uj8LFe?=
 =?us-ascii?Q?LkpAW0p0QaysGh1TK+MokmZVPZulXNXtR6U5cDcwCk+Fg6AQlpyoEVOijVnX?=
 =?us-ascii?Q?Xgiiswdy27j8xtEH7ZbULOdSPFWGpsJz3SYRjNTLsMI/GeaMm5+RMfTrq1ky?=
 =?us-ascii?Q?2qQgEOvl7m4HaTdLHg6R89s97LG3r359TBymPD0oBoCAnGsP6tNLm/YjGDYI?=
 =?us-ascii?Q?nyJXmv2h5kwX/GTfoXE9WpHPW/0qR/+O5bQZHsz6MrkpJodSsrG0YBkY++CT?=
 =?us-ascii?Q?LNSTZIM16QABGyJ7HhlyjK9wn99VU8t3LZHhNa3N7r83kY9NekugKfX23zUv?=
 =?us-ascii?Q?V18tCBYxZC/TfXOTMkAo9PEmXGp5AmXdLlu2AlSpSStye9fANFOTz9VxIM6p?=
 =?us-ascii?Q?pFg9TcjW2eJNasGBGcIYRkalJazGiHt4vylcpfkZG32X/V4j236+pYYtz+YK?=
 =?us-ascii?Q?2Iyfkl9P+i77G0OkWmiAAQ42QQq2uwNG3o3o7J48JQNdpCKVK/w5yTbC16Mn?=
 =?us-ascii?Q?DvxN8OA6jNqZoJV0W2jOXj4hrWprlPv6/4hEe+pT0msVFE+Uj4ROCTxQHFyz?=
 =?us-ascii?Q?v8PEwloEGUONZnrWqID0AZDYdtpowGaOI7AIxxXSCRA5UTOoHmniIaiLLjkQ?=
 =?us-ascii?Q?QXjl1ldKT8ejLnQNswydR6M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53216e8e-e513-48d7-f9c9-08d9d8bee35f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 07:07:42.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +KDV/3KjuR5vBUYzfGpB/7F1XF4O4jOyLczg/3EaUlyoBP8kSc0HAAXD0C070iXDgnNJH2o92tqQVwR6e/y6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4177
X-Proofpoint-GUID: zDHlGUtq2QkL8PzD1DoEI78Y4IKT79-P
X-Proofpoint-ORIG-GUID: zDHlGUtq2QkL8PzD1DoEI78Y4IKT79-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 07:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94883

Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...makedefs.patch => 0001-Fix-makedefs.patch} | 23 ++++++-----
 ...conf-to-a-variable-for-cross-compil.patch} | 40 +++++++++++++------
 ...ive-compiler-to-build-makedefs.test.patch} | 16 ++++----
 ...config.patch => 0004-Fix-icu-config.patch} | 21 +++++++---
 ...l-and-lresolv-to-SYSLIBS-by-default.patch} | 10 ++---
 ...-correct-signature-of-closefrom-API.patch} |  5 ++-
 .../recipes-daemons/postfix/files/aliasesdb   |  0
 .../postfix/files/check_hostname.sh           |  0
 .../recipes-daemons/postfix/files/postfix     |  0
 .../postfix/files/postfix-install.patch       | 26 ------------
 .../recipes-daemons/postfix/postfix_3.6.3.bb  | 19 ---------
 .../recipes-daemons/postfix/postfix_3.6.4.bb  | 18 +++++++++
 12 files changed, 90 insertions(+), 88 deletions(-)
 rename meta-networking/recipes-daemons/postfix/files/{makedefs.patch => 0001-Fix-makedefs.patch} (86%)
 rename meta-networking/recipes-daemons/postfix/files/{install.patch => 0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch} (68%)
 rename meta-networking/recipes-daemons/postfix/files/{0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch => 0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch} (83%)
 rename meta-networking/recipes-daemons/postfix/files/{icu-config.patch => 0004-Fix-icu-config.patch} (61%)
 rename meta-networking/recipes-daemons/postfix/files/{0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch => 0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch} (88%)
 rename meta-networking/recipes-daemons/postfix/files/{0007-correct-signature-of-closefrom-API.patch => 0006-correct-signature-of-closefrom-API.patch} (97%)
 mode change 100755 => 100644 meta-networking/recipes-daemons/postfix/files/aliasesdb
 mode change 100755 => 100644 meta-networking/recipes-daemons/postfix/files/check_hostname.sh
 mode change 100755 => 100644 meta-networking/recipes-daemons/postfix/files/postfix
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/postfix-install.patch
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
 create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb

diff --git a/meta-networking/recipes-daemons/postfix/files/makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
similarity index 86%
rename from meta-networking/recipes-daemons/postfix/files/makedefs.patch
rename to meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 98d5f7ed6..e83085d20 100644
--- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,8 +1,9 @@
-From 4f49e2ce420fb3c17415937530493158ef312733 Mon Sep 17 00:00:00 2001
+From 9000ee4d8bb5c5e0bcc588e9bec86eb56f4285e1 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
-Subject: [PATCH] 1)remove RANLIB, SYSLIBS, AR and get them from env.
+Subject: [PATCH] Fix makedefs
 
+1)remove RANLIB, SYSLIBS, AR and get them from env.
 2)reference sysroot when searching header files
 3)include sysroot path instead of absolute include path
 for Linux2 and Linux3 systems.
@@ -18,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 8b84e47..893fb0d 100644
+index 3448c1e..78e0717 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -170,9 +170,6 @@ echo "# pie=$pie"
+@@ -197,9 +197,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -31,7 +32,7 @@ index 8b84e47..893fb0d 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -424,12 +421,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -492,12 +489,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -47,7 +48,7 @@ index 8b84e47..893fb0d 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -438,12 +435,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -506,12 +503,12 @@ case "$SYSTEM.$RELEASE" in
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -62,7 +63,7 @@ index 8b84e47..893fb0d 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -463,7 +460,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -531,7 +528,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -71,7 +72,7 @@ index 8b84e47..893fb0d 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -487,8 +484,6 @@ int     main(int argc, char **argv)
+@@ -555,8 +552,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -80,7 +81,7 @@ index 8b84e47..893fb0d 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -504,12 +499,12 @@ EOF
+@@ -572,12 +567,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -96,7 +97,7 @@ index 8b84e47..893fb0d 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -517,12 +512,12 @@ EOF
+@@ -585,12 +580,12 @@ EOF
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -112,5 +113,5 @@ index 8b84e47..893fb0d 100644
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
 -- 
-1.8.4.2
+2.17.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/install.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
similarity index 68%
rename from meta-networking/recipes-daemons/postfix/files/install.patch
rename to meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d023680f3..347b9de0a 100644
--- a/meta-networking/recipes-daemons/postfix/files/install.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 190650e1cd5700cd6950ead3fcb17ebcec192a2e Mon Sep 17 00:00:00 2001
+From cb69ffda0c2cbde6acdc8b01c8d5ff78d81a84fc Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -7,14 +7,28 @@ Upstreamstatus: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
+ Makefile.in     |  2 +-
  postfix-install | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
+ 2 files changed, 11 insertions(+), 9 deletions(-)
 
+diff --git a/Makefile.in b/Makefile.in
+index 65e7911..40295be 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+ EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
+ 	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
+ SHLIB_DIR_OVERRIDE = \
+-	$${shlib_directory:-`$(SHLIB_ENV) bin/postconf -dhx shlib_directory`}
++	$${shlib_directory:-`$(SHLIB_ENV) $(POSTCONF) -dhx shlib_directory`}
+ 
+ default: update
+ 
 diff --git a/postfix-install b/postfix-install
-index 1662c3d..d11fa12 100644
+index e498cd3..8049f43 100644
 --- a/postfix-install
 +++ b/postfix-install
-@@ -226,8 +226,8 @@ test -z "$non_interactive" -a ! -t 0 && {
+@@ -244,8 +244,8 @@ test -z "$non_interactive" -a ! -t 0 && {
      exit 1
  }
  
@@ -25,7 +39,7 @@ index 1662c3d..d11fa12 100644
      exit 1
  }
  
-@@ -248,7 +248,7 @@ do
+@@ -266,7 +266,7 @@ do
      case "$junk" in
      *MAIL_VERSION*) 
  	case "$mail_version" in
@@ -34,7 +48,7 @@ index 1662c3d..d11fa12 100644
  	esac
  	val=`echo "$junk" | sed 's/MAIL_VERSION$/'"$mail_version/g"` || exit 1
  	case "$val" in
-@@ -434,7 +434,7 @@ template files main.cf.proto and master.cf.proto."
+@@ -454,7 +454,7 @@ template files main.cf.proto and master.cf.proto."
  
  : ${install_root=/}
  : ${tempdir=`pwd`}
@@ -43,7 +57,7 @@ index 1662c3d..d11fa12 100644
  
  # Find out the location of installed configuration files.
  
-@@ -500,7 +500,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
+@@ -520,7 +520,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
  	case "$junk" in
  	"") eval unset $name;;
  	esac
@@ -52,7 +66,7 @@ index 1662c3d..d11fa12 100644
  	    exit 1
      done
  }
-@@ -513,7 +513,7 @@ do
+@@ -533,7 +533,7 @@ do
      case "$junk" in
      "") eval unset $name;;
      esac
@@ -61,7 +75,7 @@ index 1662c3d..d11fa12 100644
  done
  
  # Override settings manually.
-@@ -639,6 +639,8 @@ README_DIRECTORY=$install_root$readme_directory
+@@ -670,6 +670,8 @@ README_DIRECTORY=$install_root$readme_directory
  SHLIB_DIRECTORY=$install_root$shlib_directory
  META_DIRECTORY=$install_root$meta_directory
  
@@ -70,16 +84,16 @@ index 1662c3d..d11fa12 100644
  # Avoid repeated tests for existence of these; default permissions suffice.
  
  test -d $DAEMON_DIRECTORY || mkdir -p $DAEMON_DIRECTORY || exit 1
-@@ -810,7 +812,7 @@ IFS="$BACKUP_IFS"
+@@ -841,7 +843,7 @@ IFS="$BACKUP_IFS"
  # the wrong place when Postfix is being upgraded.
  
  case "$mail_version" in
 -"") mail_version="`bin/postconf -dhx mail_version`" || exit 1
-+"") mail_version="`$POSTCONF -dhx mail_version`" || exit 1
++"") mail_version="`$POSTCONF -c $CONFIG_DIRECTORY -dhx mail_version`" || exit 1
  esac
  
  # Undo MAIL_VERSION expansion at the end of a parameter value. If
-@@ -830,7 +832,7 @@ do
+@@ -861,7 +863,7 @@ do
      esac
  done
  
@@ -89,5 +103,5 @@ index 1662c3d..d11fa12 100644
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
 -- 
-1.8.4.2
+2.17.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
similarity index 83%
rename from meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
rename to meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 763a4a9b9..0fc938e13 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a0d0de10e4c5ab55bc2fa48798079e2876b1211d Mon Sep 17 00:00:00 2001
+From 995bddd9563b1aecca2369f2f9c675f88bdc0053 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 9fd4bc2..5ee7747 100644
+index 78e0717..3299eba 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -526,7 +526,7 @@ int     main(int argc, char **argv)
+@@ -551,7 +551,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -23,7 +23,7 @@ index 9fd4bc2..5ee7747 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -762,7 +762,7 @@ int     main(int argc, char **argv)
+@@ -787,7 +787,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -32,7 +32,7 @@ index 9fd4bc2..5ee7747 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -796,7 +796,7 @@ int main(int argc, char **argv)
+@@ -823,7 +823,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -41,7 +41,7 @@ index 9fd4bc2..5ee7747 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -911,7 +911,7 @@ int     main(void)
+@@ -938,7 +938,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -50,7 +50,7 @@ index 9fd4bc2..5ee7747 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1067,7 +1067,7 @@ int     main(void)
+@@ -1094,7 +1094,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -60,5 +60,5 @@ index 9fd4bc2..5ee7747 100644
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
 -- 
-2.14.1
+2.17.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
similarity index 61%
rename from meta-networking/recipes-daemons/postfix/files/icu-config.patch
rename to meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 9bd9c2f03..6b4a5f7a0 100644
--- a/meta-networking/recipes-daemons/postfix/files/icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,3 +1,8 @@
+From afef4a9391e6bb1a6c3e73d370f240577ed8b0dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jan 2022 11:21:54 +0800
+Subject: [PATCH] Fix icu config
+
 do not entertain cppflags from icu, this is because
 icu-config feeds the -I path without sysroot which
 caused native headers to be included and build is
@@ -6,12 +11,15 @@ to the CCARGS which we loose nothing if its not
 entertained.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ makedefs | 1 -
+ 1 file changed, 1 deletion(-)
 
-Index: postfix-3.2.2/makedefs
-===================================================================
---- postfix-3.2.2.orig/makedefs
-+++ postfix-3.2.2/makedefs
-@@ -799,7 +799,6 @@ EOF
+diff --git a/makedefs b/makedefs
+index 3299eba..2a76f20 100644
+--- a/makedefs
++++ b/makedefs
+@@ -826,7 +826,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -19,3 +27,6 @@ Index: postfix-3.2.2/makedefs
  			SYSLIBS="$SYSLIBS $icu_ldflags"
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
similarity index 88%
rename from meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
rename to meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 565098400..b425cf843 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 4caa18feb70f8f3d133657c1250a53f4e292bb42 Mon Sep 17 00:00:00 2001
+From 545d4a79b50caa5698622c0c1905ae154197a16f Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 2683bce..8f1b3f4 100644
+index 2a76f20..9d5db9f 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -484,16 +484,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -506,16 +506,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index 2683bce..8f1b3f4 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -561,16 +552,7 @@ EOF
+@@ -583,16 +574,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -54,5 +54,5 @@ index 2683bce..8f1b3f4 100644
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch b/meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
similarity index 97%
rename from meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch
rename to meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
index e583354cc..95ca03b22 100644
--- a/meta-networking/recipes-daemons/postfix/files/0007-correct-signature-of-closefrom-API.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
@@ -1,4 +1,4 @@
-From 1e451ddc15af1a4e19318c8b1ced46c5c41610d3 Mon Sep 17 00:00:00 2001
+From 56bec31c4117fddee3a141bcca6c585aa8ddbbe2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Jul 2021 18:08:30 -0700
 Subject: [PATCH] correct signature of closefrom() API
@@ -99,3 +99,6 @@ index 2e1c953..515de6c 100644
    * XXX The (unsigned char) casts in isalnum() etc arguments are unnecessary
    * because the ISASCII() guard already ensures that the values are
    * non-negative; the casts are done anyway to shut up chatty compilers.
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/aliasesdb b/meta-networking/recipes-daemons/postfix/files/aliasesdb
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-daemons/postfix/files/check_hostname.sh b/meta-networking/recipes-daemons/postfix/files/check_hostname.sh
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix b/meta-networking/recipes-daemons/postfix/files/postfix
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix-install.patch b/meta-networking/recipes-daemons/postfix/files/postfix-install.patch
deleted file mode 100644
index 45479bd52..000000000
--- a/meta-networking/recipes-daemons/postfix/files/postfix-install.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: postfix-3.2.2/postfix-install
-===================================================================
---- postfix-3.2.2.orig/postfix-install
-+++ postfix-3.2.2/postfix-install
-@@ -843,7 +843,7 @@ IFS="$BACKUP_IFS"
- # the wrong place when Postfix is being upgraded.
- 
- case "$mail_version" in
--"") mail_version="`$POSTCONF -dhx mail_version`" || exit 1
-+"") mail_version="`$POSTCONF -c $CONFIG_DIRECTORY -dhx mail_version`" || exit 1
- esac
- 
- # Undo MAIL_VERSION expansion at the end of a parameter value. If
-Index: postfix-3.2.2/Makefile.in
-===================================================================
---- postfix-3.2.2.orig/Makefile.in
-+++ postfix-3.2.2/Makefile.in
-@@ -20,7 +20,7 @@ META	= meta/main.cf.proto meta/master.cf
- EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
- 	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
- SHLIB_DIR_OVERRIDE = \
--	$${shlib_directory:-`$(SHLIB_ENV) bin/postconf -dhx shlib_directory`}
-+	$${shlib_directory:-`$(SHLIB_ENV) $(POSTCONF) -dhx shlib_directory`}
- 
- default: update
- 
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
deleted file mode 100644
index 98005797d..000000000
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require postfix.inc
-
-SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
-           file://makedefs.patch \
-           file://install.patch \
-           file://main.cf \
-           file://postfix \
-           file://internal_recipient \
-           file://postfix.service \
-           file://aliasesdb \
-           file://check_hostname.sh \
-           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
-           file://postfix-install.patch \
-           file://icu-config.patch \
-           file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0007-correct-signature-of-closefrom-API.patch \
-           "
-SRC_URI[sha256sum] = "0f1241d456a0158e0c418abf62c52c2ff83f8f1dcf2fbdd4c40765b67789b1bc"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb
new file mode 100644
index 000000000..54c8eab5c
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb
@@ -0,0 +1,18 @@
+require postfix.inc
+
+SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+            file://main.cf \
+            file://postfix \
+            file://internal_recipient \
+            file://postfix.service \
+            file://aliasesdb \
+            file://check_hostname.sh \
+            file://0001-Fix-makedefs.patch \
+            file://0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch \
+            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+            file://0004-Fix-icu-config.patch \
+            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+            file://0006-correct-signature-of-closefrom-API.patch \
+           "
+SRC_URI[sha256sum] = "8de0619dcf2fa7c215a80cf84b82ab71631d4d4722cba0949725ce3e18031d4e"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1


