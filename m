Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918A0CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:56:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9203.1697111794554135209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 04:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bc/UvUxp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86490ded89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39C9sH2e027166
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=J0epU2kt4Xnu4lJt2XzP/B5rqFb3i/GJJLNlY90+gz8=; b=
	bc/UvUxpxiWwmIRgrs+WAeQTriIzVdm/adqnP2WNt4351nixuLaXYjk9mPcfAW2r
	ySJocKSX/sESStwkPdNMfXJUUKEWopsp8krt2JoDP/6Nx5qVMgf9bHVQjo3jOQvH
	SehY0oSMgVl+sAktOZ4ISb0Ubz/6YktAWy96aYK70IXHbcEEogmXiCatBHzOKwt2
	7whpYwb2NuE8+DTs/v7fe2wx3mQigr7Kn3SYvTH5OdUViJ3HD0Sf0fQ+ZdpE3TTe
	uTh5wtqYn19hhMegwcy4FaENgNOpiskD4ZLvcuW/OphZ9uffyWZuz1av+SwQY6mK
	iqnB4n199UDnZkGjFTz5Qg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4scce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKYmO2S0738VGV3h0cFyFvkeG6lUyk1xOsUm9VuLxYxR2YUc2hXvD11MCXYJ8xGjEpO0+nmxyqAJ9zeDffcW0+qWzq0iBY2deyxWwkYWuL3zGQASe46K+35jECgbSfPuFKfNZ4V72Qi/8bcogkgy7JxHXqJUkOpzmGtdNehY6fGOTJUhAL0yDwYJWIdciKlNfKdf+7XZ1GC0M0kIwKZNefkQ3R5Ms7epK9tBjKgKx48r5N7OQX8p2dy3sSdAOeBK1/Si1bnbQmvstl+BAEeyC75ngEOqAt4YGDv1wlNez1HwkSjdkwYpRite6Q5f8063b2ku4KhxgzTTq1kVdI+A6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0epU2kt4Xnu4lJt2XzP/B5rqFb3i/GJJLNlY90+gz8=;
 b=hdcztavCOqlFJdhz0dhE53DLB4hzJxkIZfitkPY/3EesXVlLrJHFJ8xIKx8scoCiw6Eh9gqEFXPp9Cgw3BC/n1rK/DTAZCdboxpwwYkDDTna1vZMFHRjqlkI7B9b+7YJ5nUjOPS593JTUYAJlf1KcWVxgVz7gQG9AxSTPNNlC7y0YMtj6dIVUzKxgpgns7c3RD869yq/QH5SmfZwzwWPc9LtGHuKn2MYB2Dh8TDoDitx/pb7XQYKqDcIuy7/TNocHwyvvDIqyYcX5DI3l+3zXz6TEl65lz+4MioVBc6OqDEQOhe1DsTI/G3va+I3gX6AeX+Ud66mTdLzzz7fHYw1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 11:56:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:56:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] libtevent: fix ptest
Date: Thu, 12 Oct 2023 19:56:13 +0800
Message-Id: <20231012115614.3133797-3-yi.zhao@windriver.com>
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcb61fb-f002-4012-718c-08dbcb1a45b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rEsEvy5Pe0oaSEFfiqoUA2kDZPtYmVggbPRwh5CzRLH425/tO7SiSifCPSOaFdTCnbtTwrdJdwR65VAm1CXLR1VJ2sjRscrvzftcPxVNHEjTVhUZiq+8Xsxv5+W1LFhyqvOLL+6m+6N+e+pqXHTh9yeJ4QZpCUxiWyj5WJI14/CtIW8nNYTEostmKCmZQTH/nJeXMXsoYqED7XiZ2sfwDi9D8nx0B/DR3QuEQtDp48GSJW4+XqV5+PPJt7j7SzNAPJmgNIYt/Drh8X0NNCaEDYNnogeOwqG9v3xKyCE+12rgXBaGoiVBnAbHPwHnC8fL0PN9zmjafpO+gAiV+mIC7X1CIqu5Jcn8gVUjiiacf6KzLbT9IEh5gO7nA9qYuhXRZsp0xeMUUUiGIKzirSEOLD6f+wFkSen8G4WajRa17q5T4VCGcM71F+hSXYt+u3QcenbpD7vBKa1dzYBMZKYIHe8LQL2VZXsCJNjB7udUYpovtUuP1lDmqnJDY0Qk4MWGkef+/Hl+fg3EBdB3qSkzZAcVXgrhX7pjbAzZHvNb22B0hX/MdalQDGWU9I4jEc5rgtlIoxivkT9krP+B2mF9X2Pa5DKRIi13lxQZ9PT6MWA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(136003)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(2616005)(83380400001)(26005)(6512007)(5660300002)(44832011)(66476007)(66556008)(316002)(38100700002)(6916009)(8936002)(8676002)(66946007)(2906002)(6666004)(41300700001)(38350700002)(478600001)(52116002)(6506007)(36756003)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8dUU4TFiDANOUU0+1jJcHL2MZyi3A4pHUgNwmtNr5eIgv42E8hDlTsU5xa9F?=
 =?us-ascii?Q?PUz3+3ijpDho+wMHcLoWEN9IrtNzMFrwf2lSdYL8ofxbl1xYSMjnuejhhFa5?=
 =?us-ascii?Q?J6SPTqu5ovVZAIcOaYdbIZOW+WWOesb/rSiHGF6vC68N+eyM+4Z5eSuAyygV?=
 =?us-ascii?Q?WFLyNV5/mz/PPunQkL5HLpYlUFl9yfYWAvGg3rnLD10nkNa42rGnJpzmqaQz?=
 =?us-ascii?Q?jnExJ9kUByOMHPzMkanDsgS9Bi6b2XxU5lbkLQ9322fNzm/BVQIszAV1iyAH?=
 =?us-ascii?Q?A2be7WPUwILEr7I8/uD021Hk6s4zbz7dR+aqET1ZxpE32sgItv+YVZot6lt3?=
 =?us-ascii?Q?WpTorsNYfEdWbMqdr4j4P7V0wzOk2bqyzXKhSgJHoAkVe8nwMfrcSf579rVz?=
 =?us-ascii?Q?Qu2Ka+mz16EbmhazWhPis0k4ydDuYXnvahw/V/siy5k+65o2N0TyRY2osoko?=
 =?us-ascii?Q?klGQf1d6YjRolOEHtzsaKmsbpBy3M+TKR40zjV/fE3Ou9xyEHyl8cyK8o5jX?=
 =?us-ascii?Q?Ajg8fRs8XG+CQRLaDdtUl4edc75I2Twm1y18/M3KdSsqRPpUZH3QbM/brtzf?=
 =?us-ascii?Q?nDiQQiYC/0wuHo2rgppxbfBuZ2owq4RuuOiTKU96Wuxg5/nAB7UPBl8tRR8A?=
 =?us-ascii?Q?SWFPXs7E7QUkEyNqdXtWRhvzgWaGGDfQAhmQ14D5PWOq4Ev4mszCO/ySI1Nq?=
 =?us-ascii?Q?b7sJkGQXi+UOrUJvf41mIUAi86BEur16A53R56NWdodAakpfFW5mWYfzdtK2?=
 =?us-ascii?Q?u+/3OmuOfIkdeoegQKOjHvnbkasik5ONJflZ2CaxisI8qmbxkyv1upW+fxu4?=
 =?us-ascii?Q?fsjuUxYvXxCcQoPE17GMpd6rk1iDMxAAAO6xXuYoKHfheAytlzoRqVuRS34s?=
 =?us-ascii?Q?q8B5sXrf8pxFNLYXc/4+2/faVtNrB/QstujUuafh6ay08xBEv6/4BxwTJef/?=
 =?us-ascii?Q?zKqmgdfyzX/q34NTQeto8R+qfg77PJ0IETZXycJLLnM/zR1auuhAD3M7nTet?=
 =?us-ascii?Q?r8QG5ByhUmbkvOSw5J+0R9zKCC/vdR5cwsJPqLGP0Zzl5rwtPdjrqBFyyyx5?=
 =?us-ascii?Q?bwveh3I8jt08odfcnWmpuKFh1uPW4XkYCUN3zD30sSKLaMuYkbj96ch6Q2YO?=
 =?us-ascii?Q?VeyakrAE1w+HVVnCXiNQxBmKdJ/wQfUSR3Sc2RL10mRpVF9gxQd70Jp1Yrl0?=
 =?us-ascii?Q?oEPRqbsM8A3Ca/bELYDGncXM8WkiDA95/PaS6x6Q9HhMSl+6r3uRWz5+krG/?=
 =?us-ascii?Q?e4lqa99BSp5WlEu2u/cNXAFNp66VmEDh3iMugszjpj6ICu+BbhMXfvquhd5/?=
 =?us-ascii?Q?Dbe+sftRN8QJc+1EsFo5F2J6uc8bv8bW/CLlShklYhs57w2BLnMJG21/YMNL?=
 =?us-ascii?Q?h5LpaUezyR+vsl3J8+7AiRKSPteEsE7Noll2A10JRp09k3QhM5IEjQCVmZj+?=
 =?us-ascii?Q?nycRZufqlWWlepFIF3GhFRQIOKekICnT9qSmoHTgQNhskGRMx5A3dcaLRnjT?=
 =?us-ascii?Q?TzLy8DLZAMdIf92/TWvDJbkzh74aKi5EJer3NnAJEhjw+inr38SAGCK/nkT+?=
 =?us-ascii?Q?+Xc8/6U+e7XBFEjwH/LAzqgtZMkrbX3+UgNyN+fy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcb61fb-f002-4012-718c-08dbcb1a45b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:56:30.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxnz/RYIas7QRLU7mZ9eCk02wV5z1wnL3hcMkyeGzjT/O1+cFUeNkj5TzeuGLnh1Vuub5BLqtv7JjsxzSCJ8mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-Proofpoint-GUID: BRgciVGroxW4AX0au7VzSYHW_KsFm2ot
X-Proofpoint-ORIG-GUID: BRgciVGroxW4AX0au7VzSYHW_KsFm2ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=980 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310120098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105447

* use external cmocka instead of bundled cmocka
* add run-ptest script

Ptest results:
$ ./run-ptest
PASS: replace_testsuite
PASS: test_tevent_tag
PASS: test_tevent_trace

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ix-musl-libc-conflicting-types-error.patch | 45 -------------------
 .../libtevent/libtevent/run-ptest             | 17 +++++++
 .../libtevent/libtevent_0.14.1.bb             | 20 +++------
 3 files changed, 24 insertions(+), 58 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/run-ptest

diff --git a/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch b/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
deleted file mode 100644
index 5795ff3bd..000000000
--- a/meta-networking/recipes-support/libtevent/libtevent/cmocka-fix-musl-libc-conflicting-types-error.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1d4dedab5039bb671f44566d8573ee3532ba7176 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-networking/recipes-support/libtevent/libtevent/run-ptest b/meta-networking/recipes-support/libtevent/libtevent/run-ptest
new file mode 100644
index 000000000..19f7a4a3a
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests="replace_testsuite test_tevent_tag test_tevent_trace"
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
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
index b34c186ca..9a2b5ede2 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later"
 
-DEPENDS += "libtalloc libtirpc"
+DEPENDS += "libtalloc libtirpc cmocka"
 RDEPENDS:python3-tevent = "python3"
 
 export PYTHONHASHSEED="1"
@@ -11,10 +11,9 @@ export PYTHONHASHSEED="1"
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://0001-Add-configure-options-for-packages.patch \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://run-ptest \
           "
 
-SRC_URI:append:libc-musl = " file://cmocka-fix-musl-libc-conflicting-types-error.patch"
-
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
 SRC_URI[sha256sum] = "ef85fcaa80ffd2351036ba4b347630fef2a1ac3da964a7f1820466bad03cd00d"
@@ -42,27 +41,22 @@ export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
-                 --bundled-libraries=cmocka \
+                 --bundled-libraries=NONE \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                  --without-gettext \
                 "
 
-do_install:append() {
-    install -Dm 0755 ${B}/bin/test_tevent_trace ${D}${bindir}/test_tevent_trace
-    install -Dm 0755 ${B}/bin/test_tevent_tag ${D}${bindir}/test_tevent_tag
-    install -Dm 0755 ${B}/bin/replace_testsuite ${D}${bindir}/replace_testsuite
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/bin/test_tevent_* ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/bin/replace_testsuite ${D}${PTEST_PATH}/tests/
 }
 
 PACKAGES += "python3-tevent"
 
 RPROVIDES:${PN}-dbg += "python3-tevent-dbg"
 
-FILES:${PN} += "${libdir}/tevent/*"
-FILES:${PN}-ptest += "${bindir}/replace_testsuite \
-                      ${bindir}/test_tevent_tag \
-                      ${bindir}/test_tevent_trace \
-                      ${libdir}/libcmocka-tevent.so"
 FILES:python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 
 INSANE_SKIP:${MLPREFIX}python3-tevent = "dev-so"
-- 
2.25.1


