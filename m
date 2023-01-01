Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26119C5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 07:28:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7306.1672558073312656315
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 23:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tAoOJUvX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017PQ2U005202
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=sGI2hOLKyZql/C4VaFTmW+5Sxc84MCAVt6onD/PgofU=;
 b=tAoOJUvXDPVbyL3CUXXq3Fv40r/S5vHYwcs57ojImn+lV1DxikCfAPEttFs8FG1ZlDti
 FfNFuWhtXv7e46v4y7tBHENW2UFMqWXIIeFTSaBKphUSQV90HoDPrHuBhmzeXCsT/nKx
 TQsWOFfKRmBmo6FqGChQnGTS5VDkLCvnOYe/cNIdXZ+DIxUrBKY917JYiGw8aDynBMpu
 oW4m5u6mto2Tdg5tfKmoMz3uDne0RM1E162BuJUh7REeD7EwtYa60Plxlp3vZ2tM1xs/
 Pf7z5tduPged8wbEJYLSw9MIDcukaOS2p8Z90YS+Oph2l4Wb7JEbdrajfQ3l4C9eE3wM PA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87rd7s-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTF1EF4GAbbpfSbuMFtZyXlPIiYHgn+edNh7dqPtZsWGoPrZ0hQKeprIQx+bKWGrTu9umT99fR2GKSkByY8x0/DwUWPqBaMMnn42fToxPlOBSiFsmnfuVn1UAJ0XrxUsFOpVI6RHL/CpElh970G5XdqrE6k2Zl7aFz2JC/FGvB5bodOxDQqHo4VCoGqMoiANpA15K5sRFrTqhOwi2I9fK5kCjaqZHT2BT66Njj5oV7eyY52y+0QieWLMLspSZsxmWIiwSyq3xe97hP9OqxCi2roiVyCTITnaQYcVPv1HEmniaJB7XhvnQ6flkS0m+MOGA92UPCEgacQf46LXrFHldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGI2hOLKyZql/C4VaFTmW+5Sxc84MCAVt6onD/PgofU=;
 b=V3P+uz1jFgYOzh71ADT8FSvmFOZXSe4VkEQxsqOvd44i3+tYLtt5PX1DV8OcECMr3G4PZSolxkvBCcoRft9s9/jRRsw9eMHuSgUTonhN6m1bK/c1Xehg8tiH9IqgcyTbSS27OSPq7jlnvbD8nSC+Q4LMJUlWNpe6q+gQ8GsIT1QymTxdWIp5fozaZ9fMLsZXZBpaCdIcmQNIt6fMMninHKnJdubErGPhzd/ReFlReoEvZvVfoN4dvZeJB/+sIgPahW0dMnq+jb5qaHHpulXB4SfT7uj2LPN4VHbWr0GoRG1IURYybd5jKjWDBLzogN5nGQNH9AMQGKERyb6F7C6P3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 07:27:51 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 07:27:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/5] libtevent: upgrade 0.10.2 -> 0.13.0
Date: Sun,  1 Jan 2023 15:27:37 +0800
Message-Id: <20230101072739.75462-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230101072739.75462-1-yi.zhao@windriver.com>
References: <20230101072739.75462-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd24fa8-4e78-45f6-d00c-08daebc9b08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sePJ0+5CJcKVc3AAx9yZaQ67/cDFrtNb5rbjlBnHWFlrn0teLuENZnGh08buRDvXbqPM1qP9x+KaBbaBcCqJCDYdbMHkkyJozLumEQfRpOa/OePP4BDYd7ZCe1YNvAzKiyr1V/BvG1FKhYKoPTnNZikALMz4ZX+/slN7lWG8VMT6LTLZGEQZ6e/NCrRs1uGPsFzJaMO/y9PABgivFTyBz7ReToifA32IMU3XH6aAFlqwbxSegNm0Bx3xNE11VKqqWCnTav9HRhzxm67hxonqS97wcSJQK0Y40L38s0DbBIiBJXeeAoCN+PBEHCHoubxm83Q9tUHgot0KQsqjYG+CA4HOSJAUMYFmleiC8VCAq1J1YGI4unurc1CiXJU3IJIpsnhZrEtV9Px51y27gWSLf5VYDWMdAHveFyatx0c4VHK+6VKcQAfS+LLqZxEY6IU1BtO/mjjZjzAY6E7G+87uPeGZ4XHZElKw9tRBrpkRBnQl+H21VwmgCKl9r7dfCPP6/ejZimsYp6DWhosVYehBtLoBAhT6WsLzDXLIIMMuGgrxReoZV6Bet0Q/79mvn2KhqiPt29WcDfQ88MgcW78K49AwhIsFU2myLfJ472Sqc20yYW067ilXX6M8kmtJ1nAVWH3GAyQB4iotybjhk0TQ2vldwrF1SMPICR40Bo4qN1dSp0OfwDmV4VP71JuupnMcvqWCboDqP5U+CWLNrVAEaJMxq41fnHoE8/JV6/tYZXb+UvEIJR1Bxq0GTHZN523Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(6666004)(8936002)(53546011)(38350700002)(478600001)(6506007)(38100700002)(6916009)(52116002)(2906002)(86362001)(41300700001)(2616005)(26005)(186003)(6512007)(36756003)(44832011)(66556008)(30864003)(83380400001)(66476007)(5660300002)(316002)(6486002)(66946007)(1076003)(8676002)(22166003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V2KB0x8WDlsyO0W66tDk333PDcY/05h870yDSYhVFFXiPaG/egcRBW8L844m?=
 =?us-ascii?Q?sKXUpwJ87jpA49D64kLaSH9+HmxzupEQfKHw9Gg3ZWoOrs7NqdlE90KjrVK4?=
 =?us-ascii?Q?aSl9QmXUmE7avq7ZjxD+fM/COfppa+PxWgEoVocCxLDecMuIaUw6K6C2ol8u?=
 =?us-ascii?Q?PDWZlPkaoCkNwBmptMB0/OSShzXdD1OPPgh8BJcPacm01PlhdcKtxgGOG25m?=
 =?us-ascii?Q?Ea47wMGFMp/8f2i8nxZ2rsfUQun1e/9Mxo+ysn/f2Rdi1aiS01r0jR6I9z+C?=
 =?us-ascii?Q?2y27iBt4ZNWw0e5zbOR/FEnUBHtam7RBFsqKtvuOmJA08RVTc6wHFnHUy127?=
 =?us-ascii?Q?aWbBGg4LYWYAtQ6ElVEj4P0QgU4fIh+dl5dPlBi1CXvqNdrQj8E3LrUKxl35?=
 =?us-ascii?Q?Bpbl6EfIvXhVOYqLL4G2aGn3sI7oudRNraV09iia6TkRK5gAbUBm6r+aWjKx?=
 =?us-ascii?Q?5vABkEPzUR0kdH+XTi9bOzxUcLRHtMfmVBRGLf3mYx1wiendr78paTR0vsG1?=
 =?us-ascii?Q?xBkfF+DaC3EBkeYeFNJvs0jFUKpWSIdKrUGThpfn5LnsMCKow9qpVLlcCcxQ?=
 =?us-ascii?Q?wClQFOYukTdKhT+Mp7LV0PcsyAC0JnObPfPCPv/94+ASPaciganr0cp/2Rvt?=
 =?us-ascii?Q?p5att65DvFrT8fpSORr4tNvKillQ9YROQVS7/LVJ9WdKx+UUTM9GfrWSlsMW?=
 =?us-ascii?Q?b0pnDSrdLPy78Iqfq1SVbm3zKFteAK0JyfJiIFXBLOghpurfJ/8wXR83Fply?=
 =?us-ascii?Q?FmUEhsLijurPOKBzyTnzG0mIlmfy69lCwK1ju596voTYs81+dMosqYGgPEZ+?=
 =?us-ascii?Q?NESUGo1qfjhU1zjH0WblvJ/PvK3mUJwMMH/QPMBCHaKOK5gwgmH9XeNLkf4R?=
 =?us-ascii?Q?yrx4W4W1rt2zF1Rvob+OXzc+58M09uAcvFFEMHmJTqOiIYsRYXr42hIh2QOg?=
 =?us-ascii?Q?kAf95EIXXd9+c5ETCMkIoS5atR4J+v+mV8QDE5/V7p7zGcomBz5nPTJ0YOd8?=
 =?us-ascii?Q?0iPzVQMmjs/Tp1ibuNGhP4NXUJPHG4nzUb3kUNS31yfMmw9BDA5/NZ6FsANq?=
 =?us-ascii?Q?XPjwRhN1LGexGzHe4hmQetW+yHwYl0Vm/+KF32fKYctR1xmOid2QY/P5m5xx?=
 =?us-ascii?Q?INVuOArK4ni800X9seeQAmP8+g/mYijojF36NahtRb6k0QFR6O/PVZxbqBHG?=
 =?us-ascii?Q?LcBqzCD7QFzvqmOT2jHFQ/52swKCQ5mzplIM/ph1+YNtsscCtN7Zcv/OZl2S?=
 =?us-ascii?Q?rMkjryhFU89aTglPK60yu3o09DXaw2pQBqqP4gbpD2QXXb53mfC5T6CmudKU?=
 =?us-ascii?Q?c6HgJU5s5Frw2+TbmLtKoct40xobP6aPYDdD8+OqWfVCKL9EX7TL1u2mMkfR?=
 =?us-ascii?Q?7i534conbAEDDVDPkhT5r+WWXMFmXslHe7vAK5C6BHDvLN4KP1A7lLqcde4C?=
 =?us-ascii?Q?IqqGfzNqjM2ufKFBK5VGaqekWQ/t1Buk7soWVHuuQw2zJSfCCtbhM7BH/YF8?=
 =?us-ascii?Q?ch9V20U1Z8uDdesfI2OAsPowoURoODOnWA5mQxEyAn+TWm7/hury5KM4AcZQ?=
 =?us-ascii?Q?JOQ3AnG5ZaTbYXjk5NSuPB5mG10vmbfxIkHmq4fw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd24fa8-4e78-45f6-d00c-08daebc9b08d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 07:27:51.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 125U4lNdsp6UIMFcm4gTV4g55jCyJBp5E9sWHI8OWjOd2QukWTSP8X36RF7ubaU0yGOMYdIUasH3lkwZ5fk/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-Proofpoint-ORIG-GUID: c3fYWFaaeDXJDosP6ME588IUuMdRgKj6
X-Proofpoint-GUID: c3fYWFaaeDXJDosP6ME588IUuMdRgKj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_16,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301010068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 07:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100332

License-Update: Remove trailing whitespace

* Refresh patches
* Add a patch to skip checking PYTHONHASHSEED
* Enable cmocka bundled library to fix build error

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Add-configure-options-for-packages.patch} | 16 +++----
 ...ibtevent-fix-musl-libc-compile-error.patch | 32 -------------
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 ++---
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++
 .../libtevent/avoid-attr-unless-wanted.patch  | 12 ++---
 ...ix-musl-libc-conflicting-types-error.patch | 45 +++++++++++++++++++
 ...ibtevent_0.10.2.bb => libtevent_0.13.0.bb} | 23 ++++++----
 7 files changed, 108 insertions(+), 60 deletions(-)
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.10.0.patch => 0001-Add-configure-options-for-packages.patch} (95%)
 delete mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
 rename meta-networking/recipes-support/libtevent/libtevent/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (83%)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
 rename meta-networking/recipes-support/libtevent/{libtevent_0.10.2.bb => libtevent_0.13.0.bb} (68%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
rename to meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
index 42da2468f..d98559b4e 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/options-0.10.0.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From c012aa03613e6e74a0598185b222c7b531df1e2d Mon Sep 17 00:00:00 2001
+From d9fd1c52d1646254944bfee37be611e04d4daddb Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 15:03:17 +0900
 Subject: [PATCH] Add configure options for packages
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 73 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index a2bc604..e4642e8 100644
+index 4c774d9..21a746a 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -72,7 +72,7 @@ index a2bc604..e4642e8 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -34,12 +69,25 @@ def configure(conf):
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -86,7 +86,7 @@ index a2bc604..e4642e8 100644
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
-+    
++
 +    if Options.options.enable_acl:
 +        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
 +
@@ -102,7 +102,7 @@ index a2bc604..e4642e8 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -121,8 +169,9 @@ def configure(conf):
+@@ -110,8 +158,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -114,7 +114,7 @@ index a2bc604..e4642e8 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -418,20 +467,18 @@ def configure(conf):
+@@ -434,20 +483,18 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -148,10 +148,10 @@ index a2bc604..e4642e8 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 93af416..a0898b1 100644
+index 5c6f02c..75eecd4 100644
 --- a/wscript
 +++ b/wscript
-@@ -25,6 +25,12 @@ def options(opt):
+@@ -28,6 +28,12 @@ def options(opt):
      opt.RECURSE('lib/replace')
      opt.RECURSE('lib/talloc')
  
diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
deleted file mode 100644
index e3aeda9c3..000000000
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ba1de909c587b6773a39ba9f6f9890987f35b24 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 11:30:53 +0800
-Subject: [PATCH] libtevent: fix musl libc compile error
-
-libldb depend on libtevent,  build libldb with musl libc,
-will report error:
-tevent.h:1440:8: error: unknown type name 'pid_t'; did you mean 'div_t'?
-
-add missing headers to fix it.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tevent.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tevent.h b/tevent.h
-index aa6fe0d..2572696 100644
---- a/tevent.h
-+++ b/tevent.h
-@@ -32,6 +32,8 @@
- #include <talloc.h>
- #include <sys/time.h>
- #include <stdbool.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- 
- struct tevent_context;
- struct tevent_ops;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 83%
rename from meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 81abac83a..ba3f4ca7a 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 96ddbe6653f87670e4a0bbff229276bbe0aa822a Mon Sep 17 00:00:00 2001
+From da1dc659fd351ff6283f843eeba5e0b3f7b2d584 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,18 +25,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index 7c45a76..c9a90f7 100644
+index a23bd01..af202e0 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
 @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
- 		env[x] = conf.environ[x] = dct[x]
--	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
+ 		env[x] = conf.environ[x] = str(dct[x])
+-	env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
 +	env.pyext_PATTERN = '%s.so'
  
  
  	# Try to get pythonX.Y-config
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent/0003-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libtevent/libtevent/0003-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 000000000..b334d51a3
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/0003-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From 406bb14337c71403c100ad8692e1fe99308030b7 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Dec 2022 16:31:05 +0800
+Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
+
+Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ buildtools/wafsamba/wscript | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b08..a4d6f3e 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -8,10 +8,6 @@ import wafsamba
+ from samba_utils import symlink
+ from optparse import SUPPRESS_HELP
+ 
+-phs = os.environ.get("PYTHONHASHSEED", None)
+-if phs != "1":
+-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
+-
+ # this forces configure to be re-run if any of the configure
+ # sections of the build scripts change. We have to check
+ # for this in sys.argv as options have not yet been parsed when
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
index b71192b7d..1e340f369 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
@@ -1,17 +1,17 @@
-From 6c4a634cdf70147f773bb1806692c78bbb95c6f2 Mon Sep 17 00:00:00 2001
+From 82dc31b72e77f263574645092ba1597a8f1152e7 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 15:10:58 +0900
-Subject: [PATCH] test
+Subject: [PATCH] avoid attr unless wanted
 
 ---
  lib/replace/wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index e4642e8..163e94d 100644
+index 21a746a..6be3276 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -945,8 +945,6 @@ def build(bld):
+@@ -968,8 +968,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -20,10 +20,10 @@ index e4642e8..163e94d 100644
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -960,7 +958,7 @@ def build(bld):
-                       # at the moment:
+@@ -984,7 +982,7 @@ def build(bld):
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
+                       provide_builtin_linking=True,
 -                      deps='dl attr' + extra_libs)
 +                      deps='dl' + extra_libs)
  
diff --git a/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch b/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
new file mode 100644
index 000000000..5795ff3bd
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
@@ -0,0 +1,45 @@
+From 1d4dedab5039bb671f44566d8573ee3532ba7176 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Jul 2018 09:55:25 +0800
+Subject: [PATCH] cmocka: fix musl libc conflicting types error
+
+/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
+            typedef unsigned int uintptr_t;
+                                 ^~~~~~~~~
+use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ third_party/cmocka/cmocka.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
+index e6861c8..238201d 100644
+--- a/third_party/cmocka/cmocka.h
++++ b/third_party/cmocka/cmocka.h
+@@ -111,7 +111,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
++#if !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -135,9 +135,8 @@ typedef uintmax_t LargestIntegralType;
+ #  endif /* __WORDSIZE */
+ # endif /* _WIN32 */
+ 
+-# define _UINTPTR_T
+-# define _UINTPTR_T_DEFINED
+-#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
++# define __DEFINED_uintptr_t
++#endif /* !defined(__DEFINED_uintptr_t) */
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+ #define cast_to_pointer_integral_type(value) \
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
similarity index 68%
rename from meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
index 732880e96..bae200b7a 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
-HOMEPAGE = "http://tevent.samba.org"
+HOMEPAGE = "https://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later"
 
@@ -7,14 +7,17 @@ DEPENDS += "libtalloc libtirpc"
 RDEPENDS:python3-tevent = "python3"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
-           file://options-0.10.0.patch \
-           file://0001-libtevent-fix-musl-libc-compile-error.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
-"
-LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
+           file://0001-Add-configure-options-for-packages.patch \
+           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
+          "
+
+SRC_URI:append:libc-musl = " file://cmocka-fix-musl-libc-conflicting-types-error.patch"
+
+LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[md5sum] = "105c7a4dbb96f1751eb27dfd05e7fa84"
-SRC_URI[sha256sum] = "f8427822e5b2878fb8b28d6f50d96848734f3f3130612fb574fdd2d2148a6696"
+SRC_URI[md5sum] = "9f413f3184f79a4deecd9444242a5dca"
+SRC_URI[sha256sum] = "b9437a917fa55344361beb64ec9e0042e99cae8879882a62dd38f6abe2371d0c"
 
 inherit pkgconfig waf-samba
 
@@ -38,7 +41,8 @@ S = "${WORKDIR}/tevent-${PV}"
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
-                 --bundled-libraries=NONE \
+                 --disable-rpath-install \
+                 --bundled-libraries=cmocka \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                  --without-gettext \
@@ -48,6 +52,7 @@ PACKAGES += "python3-tevent"
 
 RPROVIDES:${PN}-dbg += "python3-tevent-dbg"
 
+FILES:${PN} += "${libdir}/tevent/*"
 FILES:python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 
 INSANE_SKIP:${MLPREFIX}python3-tevent = "dev-so"
-- 
2.25.1


