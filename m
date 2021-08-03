Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1853.1627973782832279867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 23:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mZPqZTb7;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38491ef679=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1736rfF8010759
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Aug 2021 06:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=uwJtBzVlLrBFAJnKUUmtK+p78+659Bhi4xKxmeejyu4=;
 b=mZPqZTb7OFGjRFB606qfwRyjbeg2LUjuvKJ/fRzYNq6ZLCkM7URB6s/6ek1X9+ccU5SY
 wXco8U2b3CFCaJxY4WiiafOAtKW6kKDkMBOf+Zm8tqvhNBi87TePkFXaMbpA7Ua+FjQU
 aV6CWfBIMNmFZoM5ke2sX4rDpIhet8znVKjyE+sHhveo7Gsau6I64cV+D1Us0mXb5cAS
 pOfeu0+ZOb9fVOAvIokncNRwGHKAv06KlghakEvJ9SZgsBwbL7TRVMuFTO+BTdsT/rsU
 F2K4MiVH5Nm3V4WweRKAxsf2vri2hBXTn9wUGjujpy4u70xg77g/TNoJmd6wpa0OMqy7 4A== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a6x4782uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 06:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhndxpVI8SPkd9LM+/yLizNEnNv/fpf241cofsXhQJoYjQZj1+EXTJmedfTHzsmZ/iwSfgHtXeXtk3jm3JTIHHfSIEvwidiAecaNf+54o1PxrwsWIXqWqet6qz5BsxnoiAAs84Lqxiaz6eVPPLLZVE5b8+B7Y57gMuf6OybUnmdPY304Sp/NFD8+a+hkoAx78Q2dyJCq8dRPyFnJ08m8vdC+onOlD4pajddCcJkfomItH97wME8KeAiAiEBxtNH1Dq8xozKMfAdh76KhOoe3NqyyOqky1KKTpexblv/4/dCNFoMWtgYFT5WFoNrX36XO7FNaE67ft393vYR0PuaTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwJtBzVlLrBFAJnKUUmtK+p78+659Bhi4xKxmeejyu4=;
 b=mhNHnTwhNsYqiroeu7ZKKXZDWci2r7yJ5L8hAwTVOwaoLj5W6DI8xi4xsT465PiA6ajey+e/fuwUGUd+cIyHz/mL3yzHU8KwjxZIuOMJXw0wKWHpFEnO5m/V3N/hrHyp/k6VDEkuWSkuS8SwURBZMGWrRQM1OoLr/ANiw6mSZuYZTxLva7Sa7UJjlaiiYwDqw6wO8MiDDaBmb5xQiikTJyQsLPLOpbprQ5uk/wlV8Var6VRXXPHubfIoRT+xjzTUE4ADXAFxR1Pal4b94g+Rbxv4/syQrUyOn2YHLP/4r1Hsdz9OhQ02uwQoYWYr8fiaAtscjh3YvKVmBi0RbxuGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2239.namprd11.prod.outlook.com (2603:10b6:301:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 06:56:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 06:56:20 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2 V2] audit: fix compile error for 2.8.5
Date: Tue,  3 Aug 2021 14:56:08 +0800
Message-Id: <20210803065608.281061-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:202:2::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 06:56:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1adea46d-ec77-4347-bf9d-08d9564bcc27
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2239:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2239EB620B5F55D0BAF9A185F9F09@MWHPR1101MB2239.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M+F85EySMIMPam3eKz42xtdsSjYImZjNRxceom64WkIAppUkCECAuZTBtellCaKHE4SBGnZdsFmoiFz+SB3GI8zHSUkZkDxv2XH4mJzTwZcCXrQ9nvbbJ23POcfcMJz8Bu3AWR8OgtSCyy9Wf/Ml2LYy/bWq6kioGRsHZdKmamq/oX36cFa1zA8grpFTK8RoTAhPkNPUMdF423Gi8MHqd96dwHy3dAOc5ByJQjjSSuvegBJpaIrvoExKkbKncKnjffkFowyuVHnVEo4H/a77dh8fhBiM7eqlpXq9CBMHZfrgdJUSot92IkvlUf4DVrfWYW12d7SoW89J6HlZmsF7Ai2vmnyQddpttM7cXs4Xql2FwleBd8CKGA6eGziD7RF/wUBn2jvkNI7xsulUjxYCVNwhAAVpv0JOtX6rA/ad1gpQfn+L7ucPXWO93O2SSbzsbmt4pYGeMsr3a1xG31hK97/+3fRrohzT2EEWpkV0ISCcMN14m9QcX1SvDhrtab+KywILVGk/Btj31myUJCtPFH0LLcNE1HxkRaoEBeZjrxwV9Nrvz1t/qrx5/nUQTdHJY6S2CODOe4tPBclgekCdqLXOHyaxbRRjIGobV6nUPGnpMWoHlufmh6bAN7cSUGp4zVf/wufLF32wFmSXhpaHzMSx0hdSbTRO8bDjnOMmJMEILleX3EtLlycmSdCZYwUL9gT95BWscZ/Oj7YVv6kOaWJsV6CwZcDbkwbirqwfKIWTMT48yZkWUTwdejIAMMQ85V/+QaD3JLAKr5JoPOhqUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(6916009)(66946007)(38100700002)(66476007)(66556008)(83380400001)(6512007)(44832011)(86362001)(2616005)(36756003)(30864003)(52116002)(186003)(5660300002)(26005)(2906002)(956004)(6666004)(38350700002)(6506007)(53546011)(8936002)(6486002)(1076003)(316002)(478600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3w4egL3LHuFDn+Z1g9MC6EKVqH99j9yvSEwlOJcGydxLVbyqeRIqtGfyiJOA?=
 =?us-ascii?Q?RPZo28cBHDlZooMqgCiFUzhLBqxlulrHRMkoF+5WrQgsxawUBWcKPNzAkzeb?=
 =?us-ascii?Q?yYhhu8qupvbXIKEaaArtOof7t92R8zlEm+bshzF7Vp5Bsjwn8sHCH+lS22Qo?=
 =?us-ascii?Q?Fx6dJ4877uNAJ1lYNmGx6IAbvClqfozaY/QmAzBEnpk+WG91AUtf9niQwf2G?=
 =?us-ascii?Q?1kfHeChaJvfWw8wr70Wz6AHBJuniZLdFQ+vafQH9uJc92A+LfkNpYdq72Wwc?=
 =?us-ascii?Q?L5lcKaFN4MrDcr42AvBuPx7SG7EKO5y1rKCFAe9kEnUHnRqUerBQwjgZ6X6R?=
 =?us-ascii?Q?MHpFXiBF8bAT/RTSUwZcTd4HnzK2yCPjBfFRqmvjSeNCIcl2WrEfMmZ9aCC7?=
 =?us-ascii?Q?zUk4VBe1SSwkfJvnJit59sfMaoXHGvZKZA0g7DzxjsRFCAfTBvbpHbA0ExAt?=
 =?us-ascii?Q?gPIIzmr7/vG7stImVR4AevtQAgizcfaFq+GG1XpwDwYC/GT41V1w0vvNMvFk?=
 =?us-ascii?Q?5ObfyZbsFGw2HCZM89RR9gttsypRkTAmRVP8RGk5Q0kD1U+GY2YZ+XpEUJvX?=
 =?us-ascii?Q?hmfJk6iX8faz+IW8HIpeKcZKnxHFNgC0IrjpJw32pSEiD0BipFynxGyqFLIj?=
 =?us-ascii?Q?hpOLwB3YJ0rrj7lb2Bq+sP7XrREtCQZ6UtwF8FyeTOW74i9f6GZhnjTzTEyy?=
 =?us-ascii?Q?FJqrIpSygBpjn6WWQt2L4NHYrZ95Vy6IxnbJ5gzQ9PhvcTuLDnW7mQ7LaRU7?=
 =?us-ascii?Q?qMFTze3zSVphbESheL5/ezEt1bOLf6vi3SVat6Uc090QljqB8cvrXreAAFbW?=
 =?us-ascii?Q?eUykj3ruxiepp3tNsl0qn6QX4VfUnYE02zr9eZsczjPkD2GR5aDhqfUGmE8r?=
 =?us-ascii?Q?wZXjQ5o5zmPpylJ3xJgh+3CZIGvqDpUTqw8mDUOEgDIRU0qLJw0np9rcd+G8?=
 =?us-ascii?Q?aFrmeYf7CANM6lngDTHiRWPnIkJLFreE/WC9xRDaTDP6x8psOPfyKOOpRaPC?=
 =?us-ascii?Q?3oROK76Tw9t9f46UvExVGwx5GCBtIaxNz8IkpwVr82OOdf7TkKB62R20oF+6?=
 =?us-ascii?Q?DGEle5B5NMcjFwWw9GIKYI7tzwFM8vxkxsaI2q6yJCXfq4wQoekSHnbnDcM8?=
 =?us-ascii?Q?r37spfr8pqCiZc+8sP2RW+fi26kcLzniuex8w/TFkA5cXxtr7X53Qjdkdd3+?=
 =?us-ascii?Q?l/tZr3eiJq4IGF0EUhZP4E2hSpy7qrWGd306yLISgYCnAsdgyN+6jks5zEoQ?=
 =?us-ascii?Q?FPscdMxEt2S2Bzxt43Q0H13hO2h/vnxkkA7+7wjaeTQnAk+bmtlV86SBLygG?=
 =?us-ascii?Q?L13J56xez0IKh7zK/bAQCOEP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adea46d-ec77-4347-bf9d-08d9564bcc27
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 06:56:20.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk9F5kyzTnTScKVKQw4MfxwREqP2+e7meHJ7+ax+V+9v9oLlTgqWYlZ3TbJn5R5E5PUGsxP3fYKb7mu76A4qXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2239
X-Proofpoint-GUID: mX3EJa23_KKFeiWT6trMAzHp7fTrdO5P
X-Proofpoint-ORIG-GUID: mX3EJa23_KKFeiWT6trMAzHp7fTrdO5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-03_02,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108030046
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Backport a patch to fix the compile error.
* Refresh the patches to fix the patch-fuzz warning.
* Minor tweaks to the recipe with reference to 3.0 bb file.

Fixes:
tmp/work/core2-64-poky-linux/audit/2.8.5-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/11.1.1/ld:
ausearch-checkpt.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: multiple definition of `event_node_list';
ausearch.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: first defined here

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ue-functions-for-strndupa-rawmemchr.patch} |  6 +-
 ...-Fixed-swig-host-contamination-issue.patch | 57 +++++++++++++++++++
 ...ns-need-to-be-external-when-building.patch | 30 ++++++++++
 meta-oe/recipes-security/audit/audit_2.8.5.bb | 36 ++++++------
 4 files changed, 110 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-security/audit/audit/{Add-substitue-functions-for-strndupa-rawmemchr.patch => 0001-Add-substitue-functions-for-strndupa-rawmemchr.patch} (97%)
 create mode 100644 meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
 create mode 100644 meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch

diff --git a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
similarity index 97%
rename from meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
rename to meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
index bb6c61e80..ed1c0e2b5 100644
--- a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
@@ -1,4 +1,4 @@
-From bdcdc3dff4469aac88e718bd15958d5ed4b9392a Mon Sep 17 00:00:00 2001
+From d5a4b800a696b8b8d2c0f0bad098b1a8ff94333f Mon Sep 17 00:00:00 2001
 From: Steve Grubb <sgrubb@redhat.com>
 Date: Tue, 26 Feb 2019 18:33:33 -0500
 Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
@@ -68,7 +68,7 @@ index 51c4a5e..67b7b77 100644
  				break;
  			*ptr = ' ';
 diff --git a/configure.ac b/configure.ac
-index 54bdbf1..aef07fb 100644
+index 6e345f1..6f3007e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,7 +1,7 @@
@@ -129,5 +129,5 @@ index 5d17a72..758c33e 100644
   * This function will look at the line and pick out pieces of it.
   */
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
new file mode 100644
index 000000000..4a1b97997
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
@@ -0,0 +1,57 @@
+From 3467abce1f3cfc96f9bdace7c09d95218cbcaeb1 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sun, 19 Jul 2015 02:42:58 +0900
+Subject: [PATCH] audit: Fixed swig host contamination issue
+
+The audit build uses swig to generate a python wrapper.
+Unfortunately, the swig info file references host include
+directories.  Some of these were previously noticed and
+eliminated, but the one fixed here was not.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
+Signed-off-by: Joe Slater <jslater@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bindings/swig/python3/Makefile.am | 3 ++-
+ bindings/swig/src/auditswig.i     | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
+index 9938418..fa46aac 100644
+--- a/bindings/swig/python3/Makefile.am
++++ b/bindings/swig/python3/Makefile.am
+@@ -22,6 +22,7 @@
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
+ AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
++STDINC ?= /usr/include
+ LIBS = $(top_builddir)/lib/libaudit.la
+ SWIG_FLAGS = -python -py3 -modern
+ SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
+@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
+ _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
+ nodist__audit_la_SOURCES  = audit_wrap.c
+ audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
+-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i 
++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
+ 
+ CLEANFILES = audit.py* audit_wrap.c *~
+ 
+diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
+index 7ebb373..424fb68 100644
+--- a/bindings/swig/src/auditswig.i
++++ b/bindings/swig/src/auditswig.i
+@@ -39,7 +39,7 @@ signed
+ #define __attribute(X) /*nothing*/
+ typedef unsigned __u32;
+ typedef unsigned uid_t;
+-%include "/usr/include/linux/audit.h"
++%include "linux/audit.h"
+ #define __extension__ /*nothing*/
+ #include <stdint.h>
+ %include "../lib/libaudit.h"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
new file mode 100644
index 000000000..f209e560b
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
@@ -0,0 +1,30 @@
+From 2938f46d318df4a09565db837b60bafd0300f858 Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Fri, 10 Jan 2020 21:13:50 -0500
+Subject: [PATCH] Header definitions need to be external when building with
+ -fno-common (which is default in GCC 10) - Tony Jones
+
+Upstream-Status: Backport
+[https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f]
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/ausearch-common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ausearch-common.h b/src/ausearch-common.h
+index 6669203..3040547 100644
+--- a/src/ausearch-common.h
++++ b/src/ausearch-common.h
+@@ -50,7 +50,7 @@ extern pid_t event_pid;
+ extern int event_exact_match;
+ extern uid_t event_uid, event_euid, event_loginuid;
+ extern const char *event_tuid, *event_teuid, *event_tauid;
+-slist *event_node_list;
++extern slist *event_node_list;
+ extern const char *event_comm;
+ extern const char *event_filename;
+ extern const char *event_hostname;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
index ee3b3b5e0..4fc14a591 100644
--- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
+++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
@@ -8,8 +8,9 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance \
-           file://Add-substitue-functions-for-strndupa-rawmemchr.patch \
-           file://Fixed-swig-host-contamination-issue.patch \
+           file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch \
+           file://0002-Fixed-swig-host-contamination-issue.patch \
+           file://0003-Header-definitions-need-to-be-external-when-building.patch \
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
@@ -27,9 +28,9 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_PACKAGES = "auditd"
 SYSTEMD_SERVICE_auditd = "auditd.service"
 
-DEPENDS += "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
+DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
 
-EXTRA_OECONF += "--without-prelude \
+EXTRA_OECONF = "--without-prelude \
         --with-libwrap \
         --enable-gssapi-krb5=no \
         --with-libcap-ng=yes \
@@ -39,11 +40,11 @@ EXTRA_OECONF += "--without-prelude \
         --without-python \
         --without-golang \
         --disable-zos-remote \
+        --with-arm=yes \
+        --with-aarch64=yes \
         "
-EXTRA_OECONF_append_arm = " --with-arm=yes"
-EXTRA_OECONF_append_aarch64 = " --with-aarch64=yes"
 
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
+EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
 	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
 	STDINC='${STAGING_INCDIR}' \
@@ -60,16 +61,16 @@ PACKAGES =+ "audispd-plugins"
 PACKAGES += "auditd ${PN}-python"
 
 FILES_${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
-FILES_auditd += "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
-FILES_audispd-plugins += "${sysconfdir}/audisp/audisp-remote.conf \
+FILES_auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
+FILES_audispd-plugins = "${sysconfdir}/audisp/audisp-remote.conf \
 	${sysconfdir}/audisp/plugins.d/au-remote.conf \
-	${sbindir}/audisp-remote ${localstatedir}/spool/audit \
+	${base_sbindir}/audisp-remote ${localstatedir}/spool/audit \
 	"
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 
-CONFFILES_auditd += "${sysconfdir}/audit/audit.rules"
-RDEPENDS_auditd += "bash"
+CONFFILES_auditd = "${sysconfdir}/audit/audit.rules"
+RDEPENDS_auditd = "bash"
 
 do_install_append() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
@@ -85,14 +86,14 @@ do_install_append() {
 	rm -rf ${D}/etc/rc.d
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		# install systemd unit files
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
+
 		install -d ${D}${sysconfdir}/tmpfiles.d/
 		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 	fi
 
-	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
-
 	# audit-2.5 doesn't install any rules by default, so we do that here
 	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
 	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
@@ -102,4 +103,7 @@ do_install_append() {
 
 	# Based on the audit.spec "Copy default rules into place on new installation"
 	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
+
+	# Create /var/spool/audit directory for audisp-remote
+	install -m 0700 -d ${D}${localstatedir}/spool/audit
 }
-- 
2.25.1

