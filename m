Return-Path: <johnathanx.mantey@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BE6C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web11.37623.1698946069528239421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PKmorZMd;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: johnathanx.mantey@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698946071; x=1730482071;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=LHJ1ApWNkc05HVAUMc1HusKNz+stVmjMcBdSqh7WTUQ=;
  b=PKmorZMdBTk8OR12m/cdGa25LPSaMRt/sdANX9AyIpcNohInIzQvMkJi
   btlmhY1GM+bfi02w+lyEdF7WdhL3uT+2zYLPL3mRmzXZA4wTaXL+GVzhP
   FN+O26mPXlP+QUQw26OCEBoi+3FpoQ5tHjyS42ZR9dm/WXT2Am8ucEGby
   KC3bo1JUIyYeOLLp9o3AEkPZgQgOSbjTf/XZIE0pHEvSXfdXaV50XuUGb
   FUZgTBZ10XjYW9xfcvhbE7I0pdJyrxv8Jw5gZii5IZ9cDWi6o/lrR4D9z
   HvqPtlq4ALby6t1F8Gi45CvDWHpsVMSW6NEdFnqmK7byRbuPF6aP2/r2U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1698527"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1698527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9469636"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 10:27:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 10:27:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 10:27:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 10:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTKxIEheVvzFV+dJz004DToEooqwdMg11ibWzF895e+G8Z98MD9wl5yauzyHdLSRiCwgThZwkehZCZQEYmLiUY5ADNuQvnTHl10kMg7yEEA4D1HLp6YOQxKMh6QMeGZqP1ipSSq/6riunT6k6OvIQZt9UgbDpAeXvYu3ERobrHiVK0DQUdSKOxlsIWcNc7mKZlGkL1XLq/zvJZ2Hl0mVG7G4M9dEZsJOKw0YVWrbqrBUMw06SnAF0EbzUPKaexzCFtmR+nG6WbdpjD8wcMeUJImWQteeIMh4VZeU51BaWtZVKjHc4Id9dznCL/2So4C35RBSaFoQ66A7n28EodkvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWQGX6haDYaP00F9sR3q6bDyP8YP2/skjXLFzL6CTuM=;
 b=QcggKKS8oSTxeHbyp/HGw2oNPRPYILcaqsMlhQJQmOh+tQHnor3JdxgsQR6cgPs+zPAHwri0guWxTUbWdzLvAbUZfvQy5Ywy0c91BliNWGIYBKWGh4kxcYv8UWf7Twq3znkaqmSp1VUCw6Acgmr5NW6hLxvetFvW1ji2/6scze5taIFh6CmsWDNIx3Xr8Rtn5LD04sXV2wty/+0bjHsCMV+53hENuVEtAmci+uS+78qKqi9ZX/NN+znE9a5+81TI+D+0EK5IJZf/nuvBAup97bqfwUMr+0Ba/zvWuxPNNoQwqsP6F4aQOBSmq9pxkuN9usMuJeaFS8wdTVwuEqlr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 17:27:39 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6%6]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 17:27:39 +0000
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] Update ipmitool to eliminate unneeded patch
Date: Thu, 2 Nov 2023 10:27:36 -0700
Message-ID: <20231102172736.221038-1-johnathanx.mantey@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ac916e-9730-4545-10c1-08dbdbc90305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/1TYVaJzaPgbGQ3jeUuyFgt8UXxUQBWGarTbD/l5rAoJrkjSgd3ZkwVKiLY4O03hadjVh1JqEezRCRnZMNftMOWK4iGNpvZUn5uwXvJMQSVE5NxV/jjyLjzIn9NxYDKh6cD1gbk++OpahbmvwJE5SVeiTJV/j8hHT7XC4WuNyenkSSLvIU1zApRIu1uWfxW9LbHVwMA6/sMn4Du1wxdJU15aeUt3dBydpKpKs3qSap14rHCFTOEB4H2HRJFdDa6niRVIMTG0iEl7RMfOMzYdcBEzXP8EptLHRTCpgGb04ivw/0nwLnPVGEwYUfJz6fLKj9fdM/jRSmS4KAPxede6DgTzdi+1kVYw0fGH9VMfScGegCs5KRqYmmHMjfgHxKKGdpQjzbtBuWwgefZpg9pnzAmaXFkeUssmI9x2aQIJckByGLz7kb3p9USejeiziRARDh9IQruELhIOmZBdwgBucAmEgJZa5jBI7ze+mvTUfu62QdsJKOcQIaOF8oBDpthExu8OUKALj+i08Y/QVwTZ1rKPaeg5uAoisoDJaeBJ6ZmHNwVv1XPTnFx4WBLH0JX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(478600001)(8676002)(8936002)(15650500001)(5660300002)(2906002)(41300700001)(66946007)(316002)(66476007)(6916009)(66556008)(36756003)(86362001)(83380400001)(1076003)(26005)(82960400001)(6666004)(6506007)(38100700002)(6512007)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIvELB2su994HBNy3UoEwtNsSY7KQNxBSV9kPCn93Ym8P9+B63OFGlo51xFk?=
 =?us-ascii?Q?1F2z01BXFEvaDy3eZm0H+teEsj6ciqhHRW9Y4uQekeNuqzZFFgu6pbCFMn0A?=
 =?us-ascii?Q?MGTTaY22jcnYdqHvDBvLy1JS7lW0UUkfKofb/yyjOdxivTNeBgb6FFWgKCVA?=
 =?us-ascii?Q?fYddefuNfHnja9Vw1RAWWooauRnuH2VgNHv233Kq/0vF2mFfRKGTe/BQltG6?=
 =?us-ascii?Q?9QJeNX0pUWvE0uMMVzCDI/W34UVUlztTHz3EOPEq/1IeRukBB0v9bfzZ0A9j?=
 =?us-ascii?Q?t3b9wxrUR1hK5gorq0EkQyGvoniDm2phfNlVlzQIMJK/Dh/P82FlhY8XtEX8?=
 =?us-ascii?Q?x+Lfy51+5jKL8j4NEPwwJOxk/4fLGi0YleU5ogQyfRaDbF4DxUr8gUug0o+1?=
 =?us-ascii?Q?M00OAWOWs6XctEJtA/ieJYtJJKY2bQdoaeiuBR2dZKb6xorYAGddjD4Eb2ZR?=
 =?us-ascii?Q?950laLSVZ9z6IbS0eADQsy1VTkGPQPmprED00uKIp1LtCjjRJEpBh6UVaOtG?=
 =?us-ascii?Q?8Wgl4H/tKA7fe8JlwRGu1hB3zajTJcDTSwLrQY6PP1j1mCbq7BsPcISj3azR?=
 =?us-ascii?Q?8rO5ywgm98zHTyogUdGNIaCZ0EGWriT49C3xUesrXppA2J5KIQJJkZQAAvUi?=
 =?us-ascii?Q?r0npjDv3G9y6E2FaK6CrG+JeDaEvhl2ktUDWJwaz0cyRNc93eFNCI5lDdw78?=
 =?us-ascii?Q?iePfD787cXsYLXD/mPmk+jivFdHJulUgVdy4SmWz6yDM/G201VKvuCH6eiNF?=
 =?us-ascii?Q?s3HLbAzWEK71fbrVwTqtfWkG1VT1Y0sOgKRq6JHUmNNtEFoXwa0L/htab5/l?=
 =?us-ascii?Q?VfFAEG+v8WC4f6I3P7e/Dd57O8FYYnFJLUjE3r+BURtQ/pyFQOF09Aea9swz?=
 =?us-ascii?Q?lSKQCNF6ddlGEbwSe/Gol9Ry3dj/Om8nTicH1iAkHWEPXIvJjcCCieRveP9i?=
 =?us-ascii?Q?1zr98CPP5w56mmoaVTYKp5CrdjY2HuCm0RClbYLJvN8xhoLLW53t0AriIIo7?=
 =?us-ascii?Q?jZbKvIdpS7MJHw/1Oz1bm5uVIsn1S1JhcGfYMwx69s4EfIfyHhqWWb+y5kBc?=
 =?us-ascii?Q?EN5HKdKwxBUHbM5qxT2Wx11QLzz6DgTv1wcqx2mpBGll1j5NVIezzPpqcDfq?=
 =?us-ascii?Q?3XEK9eIWzM5qlp1W5KyjoMWKqzNRwoDu0T9aNztzEvcWOs7gMknsXo9Cg9h7?=
 =?us-ascii?Q?LUrps+JoIh770dU8yZ3+dGGJuKdi4D7KETSCBvTKGpWR5BLShshp53Emo7+Y?=
 =?us-ascii?Q?Wf8S5+YtAgcz49PB+upR8YvAQjb7ouWOPwRjpVKGv7POiP2yeoFKN9nE1axj?=
 =?us-ascii?Q?3Fk/dq2aLhOBhviLioAVClAr77GyWo44uv4gOoLEcjqYZ/wpd18IgPRBNF6s?=
 =?us-ascii?Q?mXLKCN4XRF5rDCh06NYALFDsdpIZ+YzD4gFSwDdRSR/NJYK0Iw/5mLDhzkij?=
 =?us-ascii?Q?4ddF0Bw3vCPTegwcG7gE9rFxquNdWhXFqo0CynKIBH+W3cUo73y5fDtQRgGo?=
 =?us-ascii?Q?vA5kWBRFkeKxjWvf4dlQVlaapui/QWEzotV6ZJ0FavoqdLY8zVeaTDsESbfR?=
 =?us-ascii?Q?PlQMHWeY7aR7h2RuwdwFncyIefEM6baPXtiXBtuJC5bJizbfK6d2BzWQBegA?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ac916e-9730-4545-10c1-08dbdbc90305
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 17:27:39.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pc/7rWnt7UCs6f2d7PWDDI4t3v95y2rofjgySnP3/x7LFcQx5O1dNFNnSdR8byLyo1EJu6lx4hryTJPVEn8fDhWkaax7zsRhIZstEmdOzOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 17:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105842

The upstream ipmitool code has implemented an autoconfig control to
enable and disable dynamic fetching of the IANA numbers file. As a
result the patch removing the code that blocks fetching the IANA numbers is
no longer relevant.

The patch being removed explicitlly blocks downloading the IANA
numbers file. Maintain this behavior at this level by using the
--disable-registry-download feature.

In order for that autoconfig switch to work, the recipe must inherit
the pkgconfig feature. Without the pkgconfig dependency the code in
the configure.ac file causes a compile time error.

Tested:
IANA numbers file isn't downloaded.
Manually downloaded IANA file is installed in /usr/share/misc
Enabling registry download enables dynamic download of IANA numbers

Signed-off-by: Johnathan Mantey <johnathanx.mantey@intel.com>
---
 ...-the-logic-to-download-IANA-PEN-data.patch | 41 -------------------
 .../ipmitool/ipmitool_1.8.19.bb               |  8 ++--
 2 files changed, 5 insertions(+), 44 deletions(-)
 delete mode 100644 meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch

diff --git a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch
deleted file mode 100644
index 442f132718..0000000000
--- a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 63d72f97bd106dd2101cd7fdac6df4f7a053d67c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 08:27:39 -0700
-Subject: [PATCH] configure: Remove the logic to download IANA PEN database
- during configure
-
-OE will do all downloading before it starts to configure therefore this
-step is moved out into bitbake recipe, so we can make it immutable build
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,21 +56,7 @@ if test "x$exec_prefix" = "xNONE"; then
- 	exec_prefix="$prefix"
- fi
- 
--if test "x$WGET" = "x"; then
--	if test "x$CURL" = "x"; then
--		AC_MSG_WARN([** Neither wget nor curl could be found.])
--		AC_MSG_WARN([** IANA PEN database will not be installed by `make install` !])
--	else
--		DOWNLOAD="$CURL --location --progress-bar"
--		AM_CONDITIONAL([DOWNLOAD], [true])
--	fi
--else
--	DOWNLOAD="$WGET -c -nd -O -"
--	AM_CONDITIONAL([DOWNLOAD], [true])
--fi
--
--AC_MSG_WARN([** Download is:])
--AC_MSG_WARN($DOWNLOAD)
-+AM_CONDITIONAL([DOWNLOAD], [false])
- AC_SUBST(DOWNLOAD, $DOWNLOAD)
- 
- dnl
diff --git a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index ab9074bba5..1c541faf8c 100644
--- a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -21,10 +21,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
 
 DEPENDS = "openssl readline ncurses"
-SRCREV = "19d78782d795d0cf4ceefe655f616210c9143e62"
+SRCREV = "ab5ce5baff097ebb6e2a17a171858be213ee68d3"
 SRC_URI = "git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
-           file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
            "
 IANA_ENTERPRISE_NUMBERS ?= ""
 
@@ -34,7 +33,7 @@ IANA_ENTERPRISE_NUMBERS ?= ""
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install:append() {
         if [ -e ${WORKDIR}/iana-enterprise-numbers ]; then
@@ -50,5 +49,8 @@ FILES:${PN} += "${datadir}/misc"
 # --enable-file-security adds some security checks
 # --disable-intf-free disables FreeIPMI support - we don't want to depend on
 #   FreeIPMI libraries, FreeIPMI has its own ipmitoool-like utility.
+# --disable-registry-download prevents the IANA numbers from being fetched
+#   at build time, as it is not repeatable.
 #
 EXTRA_OECONF = "--disable-dependency-tracking --enable-file-security --disable-intf-free"
+EXTRA_OECONF:append = " --disable-registry-download "
-- 
2.41.0


