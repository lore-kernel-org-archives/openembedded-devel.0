Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC72C3ABCB
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 04:06:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13560.1726545974144510450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 21:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=999099458e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H3pJ6H012261
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9ahf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsxsw/bgXcVNJPNLpsFvw07qbb46GMJj//3+In2E8LCv68JQXccs4EbwClGMa4fbOHjppclFFANIxecUDKqoNrxcrDK2S9uxIyhOcngiMk31FkQly1kZr2Dl1YkCpsni2uUaAiiPA4v3hVJgXWAU2j1AEYh8moKiKxtwRnAPQuOMsh8UYHF51Fpgg0EqC2CpUR5Gy18lKRCb65WcE84rs8K4r914xSYpN3mMtrF1pPi9gyVLYjencnRGHqzXk1RrJq4qqp9D+WcfHKyEyN1cuqGtunrEy9+s5Phx3ZWb9mlxZCfLkVWhgoY1Xuez+4uurOZDKt3eewgx+j1ge1nOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErWNfar5euJ7gq+S16iJ4l8Rra6YymFdDTT0tCwZgtA=;
 b=e/k4EAd3emTlJ+DFACSFQtgf9e2tMO+WmIIYCuD6ZkXaa5Zd/QM9SN3V966bqKclrPFnR/BZYNMri3Dg+puWzr6ijuqjIGlnCtsHMfu8r3pbW73/vibz1ZLXyV3vSpeIf0tk6z5JyExcBHtYGBDDzR6EjrAvEYEF17d0qaG5dL17qr/8tmPgXBrI8v1DGT9oT4X1YFglL+jaz1a54ImW+awoIBOrVJEwIPN4lRcGtf7Gv/gmlxwKmPcNDJIIl6B/TkEP3/UWkQVEQxzhJYXRWGvyYi4OAx/56kQhG1R8vHQtuzAsHl/RhG3scv4P82yMCyz4/kNTobCT3eUD/Db2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 04:06:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:06:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] tbb: upgrade 2021.11.0 -> 2021.13.0
Date: Tue, 17 Sep 2024 12:05:58 +0800
Message-Id: <20240917040558.2231178-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917040558.2231178-1-yi.zhao@windriver.com>
References: <20240917040558.2231178-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: af2c2999-ee1d-4c7e-0f64-08dcd6ce0f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fGdZ3w7F3pJFa9f3YpKr3P8pzSm/4Hv095Jy7AOGr6Os4KplUog6JS6ghqC1?=
 =?us-ascii?Q?D6Ec5doBB9FFTvoH1LX8JehpBae0hFhy0B1/ewVPW4bZQl+uzH6yvr7zj1LR?=
 =?us-ascii?Q?zrD2Dj4NkSZNQPAylkdbxlwkTRa0sV4uMTzpVgG/gsbxaGKpOVLiXGKHlvuG?=
 =?us-ascii?Q?CWJAFP4dAHZPqeXx3okZ0WLl2iYATq30dB27XxErqNGnJbaYuHWhV09XTsMM?=
 =?us-ascii?Q?Y6FiH5PHhodCdkvy1GAo8uypURpwVBP9mhGa5C3ji8p+QTnjnpHvnogPmECJ?=
 =?us-ascii?Q?re/poiUwuJSEDFeDWhu9V0Ca9dTKR+871rf5ro1SIubbEf7vZcOTKcpSEePt?=
 =?us-ascii?Q?1JQdJgKoGfnLbIVuloWP3BtDKgTpnjdC3QLFTEl8kjcO+Kikwv3TCHuzVKEX?=
 =?us-ascii?Q?u8Yv03mqZPuFbviWXbCk3Z5ebkrl2gTP3f69+bwuNeN45Rpy3FzSH61uLNsm?=
 =?us-ascii?Q?3Hvc1RLexsmJjFofQLYlMm5RmvYycmZAlV9NBJNGJDe69yToQq5wA5bxQpnp?=
 =?us-ascii?Q?Um1x3BhtOwcZZEsejnRa85hMyQzdtN6RYQTD7EBrgl/PEcYsHXGfA80m8wrf?=
 =?us-ascii?Q?DB0C6H9qmSOqcasUxRkqH78TJpk2EEmkDrG+RBweao/db2XDzlsI+6zF+jLa?=
 =?us-ascii?Q?opBfG2e1ghV0jML3Y9VitA4FZs2OczXfdMw9jJHYuw9agigQjWze6L9SZCGB?=
 =?us-ascii?Q?wpqo0eQEiSuOt96Vry0/fDtOGHF4WuTJBW6JC5k+GbGj0IurOxTzxf+jjiXP?=
 =?us-ascii?Q?ojavtKyiaomJCqTsH4ys6PjR//Pk+mPO/89rzJyDWGcRQX2cxEQnRQrpNu34?=
 =?us-ascii?Q?dSa/RLaiwd5RDJXz+klrFuyuLFUYIWnXa/x1z2B4GwSLvcOnnHTWmhose6Q/?=
 =?us-ascii?Q?ifaXBWTBohTH0dVaIJXmtpygMbSBpljyZF/9lR/mmC1UjTLWCfgaI26rFnls?=
 =?us-ascii?Q?1AdRNJ9btKXgD6jPqvWhg5Ym7Zu+CgQ+4MWs/2VhNvOqfDTY+CWTJQS9NHMT?=
 =?us-ascii?Q?8HOVw576F+rJyPHzBKXNWi+D/E1bkHwZRMM5fVfOQUSnME4k3DJfRCnWGvOi?=
 =?us-ascii?Q?QtGWYAceKNqmtJABM8RPdcMU1X6fZKBwS9Noyfp9RLq4+0+YkaD7jC9IBWvi?=
 =?us-ascii?Q?1W+sloyWKKA3a4dIbQFNNN3oLGPjam8f07drUCtWAdxaQqwdicbYYFwMbWGa?=
 =?us-ascii?Q?QMc19L5WftxvAm+pVtaVpBod4+Um1NjFQAx03qOtmhB22vIssoLp2uhY5j4g?=
 =?us-ascii?Q?ptK1yWdvjYfEHrHBzgJIvT9GUlEDfxlcodcJVMDeAlYfGtMFvq1ntbwHcGyL?=
 =?us-ascii?Q?Y22WJippJpAEuLn8QNsozl0tSQkh0gWVYpoDrmDRbIEuJ63RLoqAqEPeJ+bx?=
 =?us-ascii?Q?DHNV4RyfCijkR3IVsO9tsUU0AsdItnA0W15H2iiE2eaLIaToN/jifrxXoZ6/?=
 =?us-ascii?Q?jCSylEATfsQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FcQuI5vkuP61lPJKJ4GahyYVfACFhOkdg3kbMe5F7eCnpZ0QVZf8WS9fxSBE?=
 =?us-ascii?Q?SkVBsO77QpuUuNxkZfemxN7uUosTpkkUNV7xMZ+tSD6b7YahzAJkrPsOLNtp?=
 =?us-ascii?Q?9VZ4hgoa6jjYXakvpnPgL74pkcbC25M7VvqTa67xYgpHRLDR65pJQEiGKzes?=
 =?us-ascii?Q?ZXd2qjPG3sHMOHjStOz+bG9AIEGMJJWeuU/YFG/3e0kXZclManlNR6hTRo+r?=
 =?us-ascii?Q?66e1kaZszbr9rlNaxKV1FDN9UUIiUz/K16QEidslZWBnpxc3+1QJ2Klv0bhY?=
 =?us-ascii?Q?YgeLY6ZsN+pctb/uvq56pWiCWcrjZ1a6hEbJc9ZLIoP7MfDmu4jK9LvDSYKy?=
 =?us-ascii?Q?u31m8wItraPd865aaXs0iu7qkYCjmPJX3Yr8f8Mb0K8MOmzg/rJWIwofhFhL?=
 =?us-ascii?Q?1c3QHPIbMtYIvCu6tUrJQcdYtsG6SPe5HfelUrLFGx3ycDjKjusjcxrTW4cS?=
 =?us-ascii?Q?MwahUBEQdqj3XrjAzRUpLVdbYBaevF/GeVkjotSwqfZEUZu9SUmZMFLBatCp?=
 =?us-ascii?Q?vsXDVuQ8Y9rg37zUNodIgcSHgp8oYts5rr6IGCw84M7MUaGsntc1cw3LtOyj?=
 =?us-ascii?Q?HaxnT61wZR5RYJhalkwLfwezcCcGCPBw3AqbFHjnjoeTTqh1vER6djhSKZqQ?=
 =?us-ascii?Q?8Y+shyp0+pNm5NqDfBAUpeThb0pRXnXUWY3MjgZZcAamFnPUgorik429DAvS?=
 =?us-ascii?Q?CkShU5mMCnNWm34ebbF2yAmODDm2t4aLxM+Fx5+Nr5cvSV7TB5iXsuCzOC1N?=
 =?us-ascii?Q?QJuOqFSaTjUjEehURYuhCIp9mQlO76SzH5m2Ndls0LyonamAYLq3BqkVOgAG?=
 =?us-ascii?Q?K51UEMJOJD9N1hX5C4JKbuV9y9jTMmiA0zb8oOms/8De/xJCBytH4xyJ4jJ8?=
 =?us-ascii?Q?gEV/fZX2cXXhXHiEf5BBFBi+NcdDKeTqVaLeNLC9LekbR1rOetw3e/tcavRw?=
 =?us-ascii?Q?35amaajPH+rgrEd6HopMEhPiRMvQ6cjYsqPSTlp4pjZ/pumijhemkw+xYjum?=
 =?us-ascii?Q?8AFbjv8GKk2XJchL+bN3FF1MTC2OGo9BvyFEPCLTa+cyx1eYmoNYGNiZg7+s?=
 =?us-ascii?Q?JCs20ED9Vj9ofcXYjPSLLKtMX0XHoBsP5OlgZa0RQCQUQX7tYkJ3OI5kZUTU?=
 =?us-ascii?Q?raI61MrNN35vYPq+rlz7t9mWk0BNxGydHrHh07yxi0wNfib2IxI4d1d7kPjT?=
 =?us-ascii?Q?aSbnofHVl6gJRFcvLJT5rCNhuHEro+Gst2MdghHPV2ayYg1RjHhyyXJEKLK1?=
 =?us-ascii?Q?Q4StTRHWl7TknwaR5r1BAz/pMFccdXF4EKJ1Gyq7c6G3XI5dEoy/9meFx1bN?=
 =?us-ascii?Q?tIs/mP08LSwhTbXCg2JJeZMD7iO+PNYNvoE5G8rH1ZVxiidnUW6ogpXhsF+A?=
 =?us-ascii?Q?oRkorgvqM8FJaQJf4eWqWVdoRMun5asWTvcATY26eg58ilXYNAD76EGfj5Cn?=
 =?us-ascii?Q?+B+BkXniV12LHfej69dQB8TS+W0CMQd7DUQ6gBFK+eJxtcHXV26MpM/ZCF0I?=
 =?us-ascii?Q?GMbrQE9sv8cFw0XsFsKtKgCos9sTAOwz2WOVd9GaNkTX5WnGB0wsh8F66tch?=
 =?us-ascii?Q?R9TzBJ/ka+3JCRqFmpF5+MKZKV4a9CBcQk7QzHJ4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2c2999-ee1d-4c7e-0f64-08dcd6ce0f97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:06:09.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9zvaPYm++rtzqlK4F/BUYEzULLgzTNfOOZXUyQld8kzX3rkQohJbMCFlSjxb4lxSjYf30KGfrR7pSkmbh9QZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-Proofpoint-ORIG-GUID: 9LduzpfEnrBumURV0EbksT5q4NKhs-7Q
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66e90034 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=QZU2eOASiD42MdWpBWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9LduzpfEnrBumURV0EbksT5q4NKhs-7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_01,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409170028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112325

ChangeLog:
https://github.com/oneapi-src/oneTBB/releases/tag/v2021.12.0
https://github.com/oneapi-src/oneTBB/releases/tag/v2021.13.0

Drop 0001-hwloc_detection.cmake-remove-cross-compiation-check.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ....cmake-remove-cross-compiation-check.patch | 33 -------------------
 .../{tbb_2021.11.0.bb => tbb_2021.13.0.bb}    |  6 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.11.0.bb => tbb_2021.13.0.bb} (95%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch b/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
deleted file mode 100644
index 640b13170..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7ffc1eba8596544d6e3af0fd5f4004fff6d56f84 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 29 Nov 2023 15:48:57 +0800
-Subject: [PATCH] hwloc_detection.cmake: remove cross-compiation check
-
-This check is preventing pkgconfig to
-search for hwloc under cross-compilation.
-
-pkgconfig able to find hwloc pkg from sysroot.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- cmake/hwloc_detection.cmake | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/cmake/hwloc_detection.cmake b/cmake/hwloc_detection.cmake
-index 47233b17..5a7e84c3 100644
---- a/cmake/hwloc_detection.cmake
-+++ b/cmake/hwloc_detection.cmake
-@@ -46,8 +46,6 @@ endforeach()
- unset(HWLOC_TARGET_NAME)
- 
- if (NOT HWLOC_TARGET_EXPLICITLY_DEFINED AND
--    # No hwloc auto detection for cross compilation
--    NOT CMAKE_CROSSCOMPILING AND
-     NOT TBB_DISABLE_HWLOC_AUTOMATIC_SEARCH
- )
-     find_package(PkgConfig QUIET)
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
similarity index 95%
rename from meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
index 0f9f02655..e2b7543c0 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
@@ -13,10 +13,10 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "8b829acc65569019edb896c5150d427f288e8aba"
+SRCREV = "1c4c93fc5398c4a1acb3492c02db4699f3048dea"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-            file://0001-hwloc_detection.cmake-remove-cross-compiation-check.patch \
-"
+          "
+
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
-- 
2.25.1


