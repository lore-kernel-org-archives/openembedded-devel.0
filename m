Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23DCCDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:56:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9282.1697111798607293854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 04:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aFbDi5KY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86490ded89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39CAUnfs011211
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=qttNHbSECqw5cGbB3YXB4XgTocFiTOWZg6vNtOwWZ5o=; b=
	aFbDi5KY2jCVc4jccDPGt3whjuSn7zSWVI+s6OEnhMOktl4D5qKevZ2osVrRTUo5
	vNFu6yFY2feuC74stkzdx6Fm6JEzCH3zT4vQ66A8HyjlcJGptD9ZJc5RTK0iO46S
	4klkP8tEO83kn3QF8Yr+vJZMu42rdHQMLJN3+hF8D7ziUhSr/mVZZU3XB6iDhRyX
	ZLpKE4l0/swdqc4+9f6s5K3WFUSYWKUTNjzih0A5GM5gZqqOuq+DhlJ5bVSu4R9y
	btwo1UANbOCezJrnHOtbSsdZujqoLmB1mX4RnhLfkShAQoLj9P6t2GeDx0hd8tDH
	qFde7cn4aaWgfVM90gHgzw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhuehcf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBs13shOXdEqO/DVJUMVtO0wUleUgzcmyJIJP1pnSlg2BRJVxk6Qg0yiVkXaAU7XqgHaePCE9TQErk6dz9baV8AYrqSZNTLqGKLrO0P9m4Fx1s+WBo0CMvIfoxFFlgxokX2z9lOEmAFIfHH0ZnCvEwzJmIjhEXSeeEtDrRu3iaiGBNPpxApzg6ZOw/TAsS+0SHQxr/SbUl0b7STO4Cb/EP2XeR5qyfAqMnY0Ip13QMI9ZLQui8kugTtCrTEnxFA1rIbwcmM9UPpswralx/MkZsh6q7oa/Ik9ZF0kRhB6AJAk5VaLsjO+fThKinS5NwmPf+VRYbtunR+r2BJH7hdZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qttNHbSECqw5cGbB3YXB4XgTocFiTOWZg6vNtOwWZ5o=;
 b=QK0b6yyzx4FbfkG+hlpJkeGIl56jgcYp4XlFzeE+gHO/Tw3Nm4dkK+XY7G5CmlqmJsfkAHYw7c+o0UaBX+l63NaJ8SSkPfYm0BEJa8dwpKMMBZXKlWGlxaYwUgJdRu6HLNAROGJgFxTwylczjBoFSie9yexFqZIBKjORu8qbvdF4Ek0AqXO9ogroSLJXmfQZS9wSg0/zCcRqJhToNeKz0oGs+8EhUEJl68UgkNW0lh1xP8l+sjkwcbzQDYe70XFoQt5SfqB04jAmlzoq5o4AMvEAYJmiiFHRhQRXhW2YeZay+eYKuqDyqyjOi7EWO+LJUIj6oQuqMKkKkFK0mDW5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 11:56:34 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:56:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] libldb: add ptest
Date: Thu, 12 Oct 2023 19:56:14 +0800
Message-Id: <20231012115614.3133797-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012115614.3133797-1-yi.zhao@windriver.com>
References: <20231012115614.3133797-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: b23c6db6-81f5-4da5-d6ea-08dbcb1a4664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/cBPVxaTzsDIueSAAp0Y2DaGcfuZeLCy81iBS/tlIS8dhX86rtsWWN9uz00Me7NHkwJffpN131PLZvto75kdYpn0KWFtctrFS7v1rXZWA/qrTFgFjn8ggzXCZ2c5Cigm51SkwodOo5/U2Az8jCw/bdJtuqjVoVsxL8M5VGJFv46B5qLJoP6CM44VNnFgpY+Fher4yWpy/kRSb+tHoasyqKxO0mpR9+DI1/Eu/s7ftJur239KtlZpaUxPRDkNe9Fe+fNIof2Ynzd4L94A0Nw9e1W01rrX/mKBVnx+y8QYJC6TQXw7dLKNSDo+n225/NTm+Yt8rlPsgx5H4nEsU11eHYGxe+rbnUetUAOnJblzPYlyKPg98RX0MmDXL7GciHPfrE/gk+J3bffwtU4dh/d1qPfNrLGLiM8GcGbSZkQQ1qUIRF5pisIInb/gtgXyyw2TDiUKSZYY4y4G89OyjSqZLVcxGAM+hvxonNLBXSNdKLeM2dCZbnqHoxOlKJsBMjdO0qXa4Y9evHRuy/A8h1W+hSB0NCEjfF5SzpfHL/rZdSagN5Mb/tK3Fs3AYU8iFpfsniWyxMQtz4jUjg1aZeJwsbmRJsvFA9szegflQTJ2USI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39850400004)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(26005)(66946007)(66556008)(66476007)(83380400001)(316002)(6916009)(2616005)(1076003)(44832011)(5660300002)(478600001)(86362001)(6506007)(52116002)(6666004)(6486002)(8936002)(8676002)(2906002)(38350700002)(38100700002)(6512007)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H4GdB1OXReRW8lWjqEGT1wZC6RnXsbHqV2SyUaY9EEPzvSZpG+LeJP3eKCFd?=
 =?us-ascii?Q?jEv//XNPO7Z7yCsFKbE0msG38YTBMlXHIiQMdMSLPfwuuI7VwDRIzplMupUA?=
 =?us-ascii?Q?iYW6Bic7/QSDfOpvOxoVv2uGYwxSOCbqZPEJPVf8ypK/Prkxao7v60edR4MK?=
 =?us-ascii?Q?391VhqOQ0fTS59+OQxE+F0iuTeAImwSdpQmDdvKyw1B9Jh3H6T9fMjASZsbH?=
 =?us-ascii?Q?eSdS/JTZs9LbN+NzusKFk8+fRflBqjn7BoaQfnrmjY9HSbrdgQuChHhjHIAx?=
 =?us-ascii?Q?zU3emjAOVdh8V1Yhju6UUPIw3wEnYc5jx7SoVD8lDHLeB9w++YFk1QvgYIKW?=
 =?us-ascii?Q?kGbcKMet6iJNUoVRY7lcA243dz4H+QAyaQE1LV1LHrBQiL1Lro5SBTnL8mY0?=
 =?us-ascii?Q?C8PjrOb9FlmqzyZ/sl1+XzBQHoSdqEfr508CzWvGXSk0N5ifzdtQuHNwkZ9T?=
 =?us-ascii?Q?7R5EF1SKKUJosOzgK5dfb/5n+PoVmwIT+f3sUxBNdDnqWAn8PHNNnK6pzNjo?=
 =?us-ascii?Q?WKSrRAbQDAi2903VHutwJiG5TuwZi8/07QWDK0mxUqm04qnUizTpJKe+nrtU?=
 =?us-ascii?Q?sKJcjvMeyubUgdEg2R8ifie9jz08UdhiWavxe5azOvPvCO/OFgTiGBv4kNA8?=
 =?us-ascii?Q?0kWDVoAXgxmPTcuV+VyIsny9HMxDhy5hEL+Opffn9tKI5LK9oWex1OOEZCIU?=
 =?us-ascii?Q?0HuZZ0ZxQ7cR2AyfR42WD0cjKMhSbaHiFTNLU2uQWv9w8i94gMsaKNhSe+Jy?=
 =?us-ascii?Q?O9E7LU98jA8TpIMF+MbI4titGfcy7TJBFMYq1XXDnfB548EinKHghkSnH9IO?=
 =?us-ascii?Q?y2Hbobg6z/imMIHwrh9wL6pxcGy0FXq01T66l7jDJRCCDeWHEQCzlOKRPB30?=
 =?us-ascii?Q?Ev92Wfh5CHCcpwDBRB8fP6Y/ve6Jr9QJwviDjdDmbOhx5NQ3I5QwL1MudHXG?=
 =?us-ascii?Q?N1Mr6WvlLb31kBarmQwwSP3X7PLUGTutvf+ZNRlAXTCNBrfEWK68IA7oqRMq?=
 =?us-ascii?Q?4zinEjgbEAWJcHUsvDXaGumyQRHfifpp3nncKlT/FYy2syYvW3sy2VnpxAE2?=
 =?us-ascii?Q?OQhnm6x/rbDjqLeeYl/I3npyFyC+1d+OASH8vwTmEJXDRWbSFq4m3/KCKsHP?=
 =?us-ascii?Q?DaOdrA+eEVfE1gzE+v4Rg88mmdDfhTa9DfHmG//rn+6yRDYhWEYxX6aAG5pR?=
 =?us-ascii?Q?6QkEkxiX1Hykzv1/vMFaHuDYoIGIAsGcTpQi4HQNQE6f1HrdLbLivUCuag4X?=
 =?us-ascii?Q?jbj26ERXQ5N8j6cEdcc/CrZmQ1ySrPB/WXfWpZ5L3/7adu0V4mpn9dt+liGd?=
 =?us-ascii?Q?Xk668/J7QyBlq9AiW/bbV+Z8UQxAYf/3S4B2ZG9qwgSgBJqmKZTBBa1wZPVf?=
 =?us-ascii?Q?XUgzHQUZDBCqnxgyLzoXqZ9c4YbLFS2vle2B+3JivMy9tj3xcbWvp43A+6V5?=
 =?us-ascii?Q?woyLM3HbdA2gRW33scIHS60GYFIZcPsX6UiLlxbkbFByQlLZP99qrWKttKxz?=
 =?us-ascii?Q?q+BIEk9Nin2P6UQD1WvxlSXyVEUaYgx8Z0V1gh1/bzpCYqW1ittkYOCdRsD9?=
 =?us-ascii?Q?acIaPGJ+sfrxxWBqfg3GrclHQ1/sRFEhR9BymiMp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23c6db6-81f5-4da5-d6ea-08dbcb1a4664
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:56:31.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWGA6MuZyIj2sNWFBcG5r5xTdAsiOWgXHKEaHHedBH2EEKZ1Bk7D7hwzJprluGuXoq7DEMjuGClwAHTpES8nRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
X-Proofpoint-GUID: UzfNByXckFWEi81M1o5DmPcO0XievK0G
X-Proofpoint-ORIG-GUID: UzfNByXckFWEi81M1o5DmPcO0XievK0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310120098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105448

* use external cmocka instead of bundled cmocka
* add run-ptest script

Ptest results:
$ ptest-runner libldb
START: ptest-runner
2023-10-12T11:49
BEGIN: /usr/lib/libldb/ptest
PASS: test_ldb_dn
PASS: test_ldb_qsort
DURATION: 0
END: /usr/lib/libldb/ptest
2023-10-12T11:49
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ix-musl-libc-conflicting-types-error.patch | 45 -------------------
 .../recipes-support/libldb/libldb/run-ptest   | 17 +++++++
 .../recipes-support/libldb/libldb_2.7.2.bb    | 14 +++---
 3 files changed, 26 insertions(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
 create mode 100644 meta-networking/recipes-support/libldb/libldb/run-ptest

diff --git a/meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch b/meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
deleted file mode 100644
index 8e756d8d3..000000000
--- a/meta-networking/recipes-support/libldb/libldb/cmocka-fix-musl-libc-conflicting-types-error.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a37eb0a46669592e32ed4e004abb2698ee4f90c5 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 25 Jul 2018 09:55:25 +0800
-Subject: [PATCH] cmocka: fix musl libc conflicting types error
-
-/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
-            typedef unsigned int uintptr_t;
-                                 ^~~~~~~~~
-use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- third_party/cmocka/cmocka.h | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
-index e6861c8..238201d 100644
---- a/third_party/cmocka/cmocka.h
-+++ b/third_party/cmocka/cmocka.h
-@@ -111,7 +111,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(__DEFINED_uintptr_t)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
-@@ -135,9 +135,8 @@ typedef uintmax_t LargestIntegralType;
- #  endif /* __WORDSIZE */
- # endif /* _WIN32 */
- 
--# define _UINTPTR_T
--# define _UINTPTR_T_DEFINED
--#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
-+# define __DEFINED_uintptr_t
-+#endif /* !defined(__DEFINED_uintptr_t) */
- 
- /* Perform an unsigned cast to uintptr_t. */
- #define cast_to_pointer_integral_type(value) \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/libldb/libldb/run-ptest b/meta-networking/recipes-support/libldb/libldb/run-ptest
new file mode 100644
index 000000000..f0de0578c
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests="test_ldb_dn test_ldb_qsort"
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-support/libldb/libldb_2.7.2.bb b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
index daf0f73b8..c4b7602bf 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 
-DEPENDS += "libtdb libtalloc libtevent popt"
+DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
 
 export PYTHONHASHSEED="1"
@@ -12,10 +12,9 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
            file://0003-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://run-ptest \
           "
 
-SRC_URI:append:libc-musl = " file://cmocka-fix-musl-libc-conflicting-types-error.patch"
-
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
@@ -37,7 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 
 SRC_URI[sha256sum] = "26ee72d647854e662d99643eb2b2d341655abf31f4990838d6650fb5cf9209c8"
 
-inherit pkgconfig waf-samba
+inherit pkgconfig waf-samba ptest
 
 S = "${WORKDIR}/ldb-${PV}"
 
@@ -47,7 +46,7 @@ export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
-                 --bundled-libraries=cmocka \
+                 --bundled-libraries=NONE \
                  --builtin-libraries=replace \
                  --with-modulesdir=${libdir}/ldb/modules \
                  --with-privatelibdir=${libdir}/ldb \
@@ -81,3 +80,8 @@ do_configure:prepend() {
     # For a clean rebuild
     rm -fr bin/
 }
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/bin/test_ldb_* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


