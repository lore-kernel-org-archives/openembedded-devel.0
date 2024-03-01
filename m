Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBE9C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 04:14:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15223.1709266455858780054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 20:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790e67170=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42140Ufk016733
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 20:14:15 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755g0ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 20:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAlt3eM094PCk5VUEG4z35C/RAcYg/Sk3hkWhQqFoF2M9/lxVveX5+7yTagJ1pwthiu8TiUmGDqi7tdocxFua28NNaVVzORLG9x8D4VWHmJ4Yxhg0latYee4HgVtEeIsLsV7hoZ/GpSZI2vWhN5zpcKd2N+aetcqsul5WnIQNoesOspj8zYKIeQ5CEOiCAn7eKQI99Hescjsi7155ZMHaTyTM7aqVpakku1r+3xKIwTUz7temH5lYmxEr8L/Y7wnfCMhTi/nk1D8gebKPinGZidi4y7RYTCCwmesJW+elIvKzgx63c7ifP9UBgDSBhqcgIOFUO2p8PGWVs8ztXJfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9XD6epXAcgGqDoLFX1EySluhspArQ/k0554/DUvyS4=;
 b=Lv8fUST0eugwvOhrUsjAAXovK+PbObIouP+9vB2c9D5AK0FSssCnZX672FTpgGYt7y7ss+kTLMkjG4uLlqB+CZzPMFLzpQS1Y2w0emO6mziIJU026esyi0x+9yoe/uPPTftd3BAD5SU+/O+JHXTSc4vTH1Cv9wS/PN/mdDCYGk13m3AGSLPpScjpwQdmpegTM5HNuyuKzvD7JIh3wk1QsHa58aQfAAKE0sIZO/di1bDo8Y6XvykGYVrrj3bvwtsGKznmxi28mDy2/eCJgb7jPubkO6d9lcM1grSbNQOaXoyGuvzcqnZm778KNLbm9XJdyVJNxykORPN0a9Niqlc5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.14; Fri, 1 Mar
 2024 04:14:12 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Fri, 1 Mar 2024
 04:14:12 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] drbd-utils: upgrade 9.22.0 -> 9.27.0
Date: Fri,  1 Mar 2024 12:53:38 +0800
Message-Id: <20240301045338.2655388-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a5f189-56b7-4fcf-26cd-08dc39a60cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xiko7wuCrKaj6CywhuFmuc3UT4kornNKrmoZE+qz7+LTDzzkWyqf6hNzoY3BNFd2dGVUNPCe/255k1jcSoyMiy8EbUr+CtRCd+v/x7e3v0M9t6dlpbntAKHGcTZGdkWXtESPJDQw4SDgOVagaJZhZ5NSWima59PNi63VM6i7xUVV5Cwe8MDwJR/l0ZGSxYFu1xrWQOb9SQ9EGM9iA3sToZI9XyHP6yqihRgUyO1gsxRRd6RXT0SLiEswxxZA/pi3sgTkK71/2LN7+MJhN3aWMg//YZ3g5+9aV2WIPrx79fFrOUoy0x56HkgR/53v2D3Hww07yhS9Q4C6RzZCDuwaBNBbSxZ775x4+qWtsOoZvz2Y3C22QNXK3G39OIdPoRdvJvamuYGrw4Z1dEgMF/QzJnb5cLrH+uBn0wUiprJlwjseqS8fxmfSX+plCtDDFqrYMBbyXLzQvRs/YmA+N82eTPG6MupSVrfrEH9u0AQRaYrKrCXF3LktqR9WJj0W/ngwtpPnZ/0OWNM3P/I1z0J7LOReycrvELv5BUk/Y2tB8Mz5g+bH1566IHGlsGVMziDD8cuLAlCot+An0nsdcTSk+b7J2mwh7xZV2CksXvUnzGA2owRBB86r/uD1N1ZzeJkRCPz+QOPtKznHQcRGD72U1DoYXG1NZ6QOAV0D0AC5dMc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wLpnC6yfH99FbrtiYcTJFUWBMkaJIsas78QtFEkDZ1XtGSeNmo8P/e16jh26?=
 =?us-ascii?Q?fb3qk0TKj/LaMzjFfpEA0D+BWwzWousWMOK+WU0kJo9hPf0Gj+zMn6oV0a4O?=
 =?us-ascii?Q?ki/gnoj5VJo6+nYyDrM4kaHO8rFNCLDnsOOLn7f2LnR2wRML+jarkOM2pHjO?=
 =?us-ascii?Q?6YDs+Lj3xM90/MsbsEj3R2cxn4X9/Q4RtXLWz8C7oxz+L57TmRODysvUPfR+?=
 =?us-ascii?Q?C6pCizs1G2zscA5z0EzgKKiPHPK2E+OfPmjaZ57WkHkla8yez3NZS54oKvlS?=
 =?us-ascii?Q?xH6FyswrZT23+YUuV0LM2Lhmzua+YoTNU0MXmioruzYWcEUzkWtEcOb162V7?=
 =?us-ascii?Q?XZ9F/H0kpnhPHVfGTg9kwIC/RZnjlOKipIoL2NLBuXBte4izo+C+uiIqqbBI?=
 =?us-ascii?Q?w3I0qsO4CYkdNneau5sGMuLvJ4WjmRs1QTOP/aFi5S12sBr5JcVwsSFQU6QA?=
 =?us-ascii?Q?9E4491Bl7W7C+rSCA5rGwq+Psx2uQLLOxUvM02/lH3jAL/0AgLbJApRfL0GF?=
 =?us-ascii?Q?0baDJ2cVnKEpd7uuohgvwPO9vZJTLwHNSJW62CpuPujPKLUKirYuHlmxqAMw?=
 =?us-ascii?Q?kP7JKd6b9nC6X4m76mBuBHYurWcvNpYsXIJvawCAcPgoWeb/+WGG0vOKaG8Q?=
 =?us-ascii?Q?NjqP/0G61bwvU9Sxxpm/0tXOlZ3F0brHQfxqr0ye87IBsqvIBhjIEqGoCj/Y?=
 =?us-ascii?Q?Ohuo5zl+mMAl+9h8quVVWXC5HZOLo5+LM/Nb76Dx3r0HY/UsIM3bgwiql/dy?=
 =?us-ascii?Q?9/LSwmoaalMidulI6Ao5Wr3+6Xhs2Pxq50cTVYQaIAGRbCF2U9p+cUSMigBa?=
 =?us-ascii?Q?+gJL5bzfzUxWC1nMf8CVdMJJCerpekXrjTTeR9ZLjvi0X6T1wmGFYZAxSdhK?=
 =?us-ascii?Q?P+f3+meP0oYvO6+aQF4pyG2GODG7h+CGrZtlryl+PXuDcYnVXuhCVxnwixfa?=
 =?us-ascii?Q?FAZ0LCn0jtyp/xqG+PJpBpwr0x92i8fErUKYL1lhLbGvz2KTIdahNBhVRpgl?=
 =?us-ascii?Q?U/LzWJi6fWdtZRF/7DJQKTGQ/A3a84xr7vcoTuOaviRVQzQnsj4XWIPD8X/g?=
 =?us-ascii?Q?iPel28lmPVBwf5ICdczRGnsGOYOzR18zs+Y6Qr4WH3ckIgU2OJymLLnq89UG?=
 =?us-ascii?Q?KbVVb7Jfp+T8LSUUWVMAArfu8IiQaCVAuQDrGFau8w12fLD/AzFQ9MHTPZbv?=
 =?us-ascii?Q?ASV+uWg8fkHEXzsbDCZ6in/U/C2LKfXeY0nRWPQRhPUbok4twBMDF/yZCAl9?=
 =?us-ascii?Q?0PwcWktVNnRQsgfKAPDloZrnFhE959+x3fa0HDHiUtwsCQ44eNd+OHVGSHL/?=
 =?us-ascii?Q?xlxg5J6pTJgmMC/8SnRGC32vU6hKAwbJh5FkJNABSCue1EgR6rVZcqWmqzFL?=
 =?us-ascii?Q?2eNeyq/ezwcXOFe6QstaAJ3UIwACV5irwcinMVYyeIKvKIsuybu/0GtUzVcF?=
 =?us-ascii?Q?nfejKjhe4oKZsx2Aqg16ge5erWUsWYWvAwem7pdlyn7SAgUdzTUcTcPignM1?=
 =?us-ascii?Q?ruka7glht+AjDlD0SI611MVAqY2KJDtOm573FphlK0TRLYlqU2enREMKL3E1?=
 =?us-ascii?Q?qztWh0aSalne5pvbhLlXxsaH4LtiAo93FSa4c1VFy2wylCZf19dYppkpvi3O?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a5f189-56b7-4fcf-26cd-08dc39a60cd3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 04:14:12.4616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ+kiqRLQ34FvbYWqPPwGoj77Ux5tRyIX2L02qHVZhcX1zqQWvmEKWT/bWQiyqoPghxazIC+b3BDRSgLvuAHvdlT/YPlw0+ElO9ZM1121X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-Proofpoint-ORIG-GUID: XJpEMknxiQPbBZzqJJypLJOLGQPGvdRR
X-Proofpoint-GUID: XJpEMknxiQPbBZzqJJypLJOLGQPGvdRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_01,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 04:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109066

From: Xiangyu Chen <xiangyu.chen@windriver.com>

rebased patches:
0001-drbd-utils-support-usrmerge.patch
0001-drbdmon-add-LDFLAGS-when-linking.patch

removed patches that already in upstream code repository
0001-replace-off64_t-with-off_t.patch
0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch

add keyutils depends

Change log
==========
 9.27.0
 * adjust,v9: retry for diskless primaries
 * tests: sanitize env (e.g., TZ)
 * drbdmeta: dump and restore the members field
 9.26.0
 * config,v9: new config option load-balance-paths
 * config,v9: new config options rdma-ctrls-(snd|rcv)buf-size
 * drbdadm,v9: fix segfault if proxy has no path
 * drbd: increase maximum CPU mask size
 * systemd: introduce drbd-graceful-shutdown.service
 * drbdmeta,v9: fix regression, allow attach after offline resize
 * drbdsetup,v9: add path established information to JSON status
 * events2: terminate on module unload even under --poll
 * events2: specif exit code if module unload
 * docs: add spdx license file
 * drbdmon: various smaller improvements
 * drbdsetup,v9: support for TLS/kTLS
 9.25.0
 * drbdsetup,v9,show: fix meta disk format for json
 * drbdmon: various updates
 * build: fix RHEL6 spec builds
 * drbdmeta: {hex,}dump superblock
 * drbdmon: major rewrite
 * build: gcc v12 cleanups
 * misc: put locks into separate dir
 * selinux: add fowner fsetsid, they dropped a global noaudit rule
 9.24.0
* windrbd: various fixes
 * v9: Support user-defined block-size
 * doc,v9: improvements all over the place
 * drbdadm,v9: implement drbdadm role <res:peer>
 * drbdadm,v9: pass --verbose/--statistics to drbdsetup status
 * drbd{adm,meta}: add repair-md subcommand
 9.23.1
 * drbdadm,v9,resync-after: fix too strict check
 9.23.0
 * drbdadm,v9,floating: fixup fake uname for 9.2.x strict_names=1
 * drbdadm,v9,parser: fixup globs, also rm GNU libc specific extensions
 * drbdadm,v9,parser: allow via outside-address for NATed peers

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../0001-drbd-utils-support-usrmerge.patch    | 17 ++--
 ...001-drbdmon-add-LDFLAGS-when-linking.patch | 14 +--
 .../0001-replace-off64_t-with-off_t.patch     | 48 ----------
 ...-of-GLOB_MAGCHAR-use-strchr-heuristi.patch | 96 -------------------
 ...d-utils_9.22.0.bb => drbd-utils_9.27.0.bb} |  8 +-
 5 files changed, 18 insertions(+), 165 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.22.0.bb => drbd-utils_9.27.0.bb} (90%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
index 4e1f68be09..27f0a9b54a 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
@@ -1,4 +1,4 @@
-From 69011c7227ad1aaf08d5ab28e46f85dac951c597 Mon Sep 17 00:00:00 2001
+From 264ae7b062ac52a5545a8a562b51001f7ce7369d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 21 Apr 2022 17:22:35 +0800
 Subject: [PATCH] drbd-utils: support usermerge
@@ -21,10 +21,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  10 files changed, 32 insertions(+), 32 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ae575586..3d7deeae 100644
+index f1d69ea3..3289ac7d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -180,7 +180,7 @@ AC_ARG_WITH(tmpfilesdir,
+@@ -183,7 +183,7 @@ AC_ARG_WITH(tmpfilesdir,
  AC_SUBST(tmpfilesdir)
  
  # set default early
@@ -34,12 +34,12 @@ index ae575586..3d7deeae 100644
     test x"$with_udev" = xyes ; then
  	if test x"$PKG_CONFIG" != x; then
 diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index fcd298e9..bab441a5 100644
+index aca15a22..a1cd2ffe 100644
 --- a/scripts/Makefile.in
 +++ b/scripts/Makefile.in
-@@ -88,11 +88,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
+@@ -91,11 +91,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
  	install -d $(DESTDIR)$(systemdunitdir)
- 	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
+ 	install -m 644 $(SYSTEMD_UNITS) $(DESTDIR)$(systemdunitdir)/
  	install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
 -	install -d $(DESTDIR)/lib/drbd/scripts
 -	install -m 755 drbd $(DESTDIR)/lib/drbd/scripts
@@ -110,7 +110,7 @@ index 96c599e7..c81e95a6 100644
  [Install]
  WantedBy=multi-user.target
 diff --git a/scripts/drbd@.service b/scripts/drbd@.service
-index 76514c5b..e2e500ba 100644
+index 0fad10be..556f3857 100644
 --- a/scripts/drbd@.service
 +++ b/scripts/drbd@.service
 @@ -35,8 +35,8 @@ RemainAfterExit=yes
@@ -199,6 +199,3 @@ index 0fcefc5f..81f7d5ec 100644
  
  spell:
  	for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
index 0bf4b2fce1..c7766067a1 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
@@ -1,15 +1,17 @@
-From a61b9ff2d2cb7387a5cd347b2201535ee45a46ee Mon Sep 17 00:00:00 2001
+From bb044160faf4ae7615ddfdb17641dd88c33cde57 Mon Sep 17 00:00:00 2001
 From: Sakib Sajal <sakib.sajal@windriver.com>
 Date: Thu, 31 Mar 2022 15:09:58 -0400
 Subject: [PATCH] drbdmon: add LDFLAGS when linking
 
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
 Upstream-Status: Pending
 
- user/drbdmon/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ user/drbdmon/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/user/drbdmon/Makefile.in b/user/drbdmon/Makefile.in
+index 7bd8987e..115a81b8 100644
 --- a/user/drbdmon/Makefile.in
 +++ b/user/drbdmon/Makefile.in
 @@ -1,6 +1,6 @@
@@ -20,7 +22,7 @@ Upstream-Status: Pending
  CXX = @CXX@
  LIBS = @LIBS@
  
-@@ -51,7 +51,7 @@ $(dsaext-obj): $(basename $(dsaext-obj))
+@@ -72,7 +72,7 @@ $(dsaext-obj): $(basename $(dsaext-obj)).cpp $(basename $(dsaext-obj)).h
  $(integerparse-obj): $(basename $(integerparse-obj)).cpp $(basename $(integerparse-obj)).h
  
  drbdmon: $(ls-obj)
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
deleted file mode 100644
index 2841d0feaf..0000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5adae6737e919d957a08df437951ccb6996f9882 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Dec 2022 19:16:03 -0800
-Subject: [PATCH 1/2] replace off64_t with off_t
-
-off_t is already 64-bits when _FILE_OFFSET_BITS=64
-using off_t also makes it portable on musl systems
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- user/v9/drbdadm_main.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/user/v9/drbdadm_main.c b/user/v9/drbdadm_main.c
-index 91e9507d..2030946c 100644
---- a/user/v9/drbdadm_main.c
-+++ b/user/v9/drbdadm_main.c
-@@ -1264,11 +1264,11 @@ static int adm_resource(const struct cfg_ctx *ctx)
- 	return ex;
- }
- 
--static off64_t read_drbd_dev_size(int minor)
-+static off_t read_drbd_dev_size(int minor)
- {
- 	char *path;
- 	FILE *file;
--	off64_t val;
-+	off_t val;
- 	int r;
- 
- 	m_asprintf(&path, "/sys/block/drbd%d/size", minor);
-@@ -1289,9 +1289,9 @@ int adm_resize(const struct cfg_ctx *ctx)
- 	char *argv[MAX_ARGS];
- 	struct d_option *opt;
- 	bool is_resize = !strcmp(ctx->cmd->name, "resize");
--	off64_t old_size = -1;
--	off64_t target_size = 0;
--	off64_t new_size;
-+	off_t old_size = -1;
-+	off_t target_size = 0;
-+	off_t new_size;
- 	int argc = 0;
- 	int silent;
- 	int ex;
--- 
-2.39.0
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch b/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
deleted file mode 100644
index 45f7d6d415..0000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From b70e5bf5bfa5fa2c2fffe08bcf300da1d3583602 Mon Sep 17 00:00:00 2001
-From: Lars Ellenberg <lars.ellenberg@linbit.com>
-Date: Wed, 9 Nov 2022 11:01:54 +0100
-Subject: [PATCH 2/2] drbdadm: drop use of GLOB_MAGCHAR, use strchr heuristic only
-
-Fixup for
-2022-09-05 4a1b5900 drbdadm: allow files from an expanded include glob to vanish
-
-When using the `include` statement, if the glob did not match any file,
-there is nothing to do, silently ignore.  Unless it was no glob, but a literal,
-which we would expect to exist.
-
-Also, there is a race between expanding a glob and accessing the file.
-That also should not happen for literals, though.
-
-Since we still had the heuristic anyways, because apparently |GLOB_MAGCHAR
-does not happen for GLOB_NOMATCH returns, and there exist non-GNU libc that
-don't (and likely won't) implement that extension, just forget about
-(gl_flags & GLOB_MAGCHAR) but use the incomplete strchr heuristic only.
-
-Sourced From Alpine: https://git.alpinelinux.org/aports/tree/main/drbd-utils/drop_use_of_GLOB_MAGCHAR.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- user/v9/drbdadm_parser.c | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
-
-diff --git a/user/v9/drbdadm_parser.c b/user/v9/drbdadm_parser.c
-index b2f6ed8a..9a0a775d 100644
---- a/user/v9/drbdadm_parser.c
-+++ b/user/v9/drbdadm_parser.c
-@@ -1947,14 +1947,29 @@ void include_stmt(char *str)
- 	size_t i;
- 	int r;
- 
--	cwd = pushd_to_current_config_file_unless_stdin();
--
--	/* """
-+	/*
-+	 * If the glob did not match any file,
-+	 * there is nothing to do, silently ignore.
-+	 * Unless it was no glob, but a literal,
-+	 * which we would expect to exist.
-+	 *
-+	 * """
- 	 * As a GNU extension, pglob->gl_flags is set to the
- 	 * flags specified, ored with GLOB_MAGCHAR if any
- 	 * metacharacters were found.
- 	 * """
-+	 *
-+	 * But apparently |GLOB_MAGCHAR does not happen for GLOB_NOMATCH returns,
-+	 * at least not consistently :-(
-+	 * Also, there exist non-GNU libc
-+	 * So we have this incomplete strchr heuristic anyways.
- 	 */
-+	bool contains_glob_magic_char =
-+			strchr(str, '*') ||
-+			strchr(str, '?') ||
-+			strchr(str, '[');
-+
-+	cwd = pushd_to_current_config_file_unless_stdin();
- 	r = glob(str, 0, NULL, &glob_buf);
- 	if (r == 0) {
- 		for (i=0; i<glob_buf.gl_pathc; i++) {
-@@ -1965,7 +1980,7 @@ void include_stmt(char *str)
- 			if (f) {
- 				include_file(f, strdup(glob_buf.gl_pathv[i]));
- 				fclose(f);
--			} else if (errno == ENOENT && glob_buf.gl_flags & GLOB_MAGCHAR) {
-+			} else if (errno == ENOENT && contains_glob_magic_char) {
- 				/* Noisily ignore race between glob expansion
- 				 * and actual open. */
- 				err("%s:%d: include file vanished after glob expansion '%s'.\n",
-@@ -1979,17 +1994,7 @@ void include_stmt(char *str)
- 		}
- 		globfree(&glob_buf);
- 	} else if (r == GLOB_NOMATCH) {
--		/*
--		 * If the glob did not match any file,
--		 * there is nothing to do, silently ignore.
--		 * Unless it was no glob, but a literal,
--		 * which we would expect to exist.
--		 * Apparently |GLOB_MAGCHAR does not happen for GLOB_NOMATCH returns,
--		 * at least not consistently :-(
--		 * So we have this strchr heuristic anyways.
--		 */
--		/* if (!(glob_buf.gl_flags & GLOB_MAGCHAR)) { */
--		if (!strchr(str, '?') && !strchr(str, '*') && !strchr(str, '[')) {
-+		if (!contains_glob_magic_char) {
- 			err("%s:%d: Failed to open include file '%s'.\n",
- 			    config_save, line, str);
- 			config_valid = 0;
--- 
-2.39.0
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
similarity index 90%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
index 89bf529165..c50d326224 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;protocol=https \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
-           file://0001-replace-off64_t-with-off_t.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            "
-SRC_URI:append:libc-musl = " file://0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch "
-SRCREV_drbd-utils = "409097fe02187f83790b88ac3e0d94f3c167adab"
-SRCREV_drbd-headers = "9a0f151fa0085f57910a2dcbbd658d6069554f62"
+SRCREV_drbd-utils = "fdd9a4d603a9dc99d110d8bd0e288d7c0b6f586e"
+SRCREV_drbd-headers = "0349f00825b4198d4ec3248f43884114a187676a"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
@@ -27,7 +25,7 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
 SYSTEMD_SERVICE:${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-DEPENDS = "flex-native"
+DEPENDS = "flex-native keyutils"
 
 inherit autotools-brokensep systemd
 
-- 
2.35.5


