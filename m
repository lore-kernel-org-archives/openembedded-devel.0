Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4051.1628131410388543180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AlSH7jBK;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38513e44b3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1752OH2G013042
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 19:43:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d20cIMYonUqNyGihi+q+EI52i8gfZr+/f0yCtU9eR48=;
 b=AlSH7jBKkBE5Fs4TohUVknhg9mfSo6NCTmxGGQcbeoPUW0Q+STbdFBlrhAOXRB+XXUMh
 mQ5gnRgPx3TVnTiKNwRhiQz3YKneeYZGfUiDcT/FUt02EtrOoymAkl2xBKWcTrMVxQlY
 Ijzc2C4ZfOTv9nieFiWZd1kSzz9+HMdn7WjGJNgxJEfFz+OYFh7PbF/qjpOt0QDXZtfz
 lP1o7Ngpc5vQU/DZzRzSIl+4DDbcDKf8g0k92lv7vUYcMqJ+8rd+NxsnUddT5msNChRg
 loLt/C5+s2yrQeRmrYBM5Y+rAkKj7J60x4eNt7zEgOT1vG+9nFKA898r5RZMtrj6ldfg 8g== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a800vr8fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBt2FPksbOGEf5fW6PB+m6vvmOQ3cTu61RMEIaSZcrwVRPW+fFTyKQnOkZODHYRMsIldpcRESYD2+imAV+WXhDL0W0hSA8rSpkHRvNlerIi98EMQ1M/rr6GhpinbnZYJ43xUmdwnL0nKEsLF4uajiQF8wiz+q6mSM0q2KayUfNrlRbl7lYYrkpCME7ZrIpxKj44IDKpUn+jB8jMDTRcWm1d+h7lziJivg4rdyUgPy1/obvPX2r9I7BOkb0zKfRlpvM2hPrQ/A5E4YvC3Q3BqiJv/x0idp3CofZDL6Il54MGXBgNK9J0veMU4D8mC1kK7gbPQmCTr6hC9MJ6yDIf8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d20cIMYonUqNyGihi+q+EI52i8gfZr+/f0yCtU9eR48=;
 b=NXq2hPd7FSbdcrhSvsyoETMG/6/OvLts8l4iUtHXM5bzdzU0CWK6svo0VgRcu1LJiFnVRkGnUYu0uqRwBtthOgk1EIgl0K3NCItTnCq7KXD1wzQAXBh5F89eujwX5fNXyFEOFWhC5P/L+7OsG+HqT5JZuX4b0RTYKn3IGgtnkJKpMyVj+DaTQCXtwMzFrraSL/O5sh9EcQBizi8SHiDQz/ow/k3i3GAeGcSv3AWQVGb0LMbXBk6XH06EzcvJJcizVuapPH7Q9fapsYGictijHTMRKkkeHc+o2B83u2NaExb+n13b2EPUaICD9KT0c9DEllIVNkuIKVYx09qfTsEzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 02:43:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 02:43:27 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V3] audit: fix compile error for 2.8.5
Date: Thu,  5 Aug 2021 10:43:15 +0800
Message-Id: <20210805024315.355444-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BL1PR13CA0430.namprd13.prod.outlook.com (2603:10b6:208:2c3::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend Transport; Thu, 5 Aug 2021 02:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76d764d9-4cdd-4bcf-417d-08d957bacd75
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4804D7BC78C2A0C3331AC13AF9F29@CO1PR11MB4804.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2RgO4dMmgEPWICNvypcIaGCrcQPBNEL7z568RioCxXsatA+WfcBwpaa4zAWreYF9KAr+YeXShuzFrFEVzosbL91F4S9W7cgxrhkcFQnzwaOLko+VIaLKPWOVdGNXtcsJiwAsm6uWnessK8uG4DRFWYT4nvj8Bq+E9geZsBdroO3/pEZDmPaME0+bG/KSx45xgTGkSNnjeuUb29EaGoqtMf11r/VZxXmA8Ad43qqzERu5d92TKcfdIc4FfatRZfKEoaKSBKHrwmXSiQVd110IH2RZ4pkOcZGtm6Blx7Wa/+KPa6Et9FTohrBeywlWbHhbH4jbepBnLKuI61mew9v50BleINo3NNN8lnUcALYCeXwlOoo/ARq5Ri26Ijx1rn/AwYLf1dU3W80yga4VQ2hmz1OYJabm6sdU1sB+7+a6FqIMcj2xoz7hKG1t3xShvEHmPZ/wVKbd97LVzTBIUTyORtxuqLsTK9XEq/l4sp/BLYeO+vLdE4NnVofhS1I6aZmbi7y1Wwj7PSfMqEhZT97InSOJbDagkQaS3u3KOD6DwOwiY96cXb/ncw6gdv34OQZzTwzp9nXijoAMJEVjbQw5fH/EERmKA6aLnFfrjClH5+uG1icqkUgbAkjFQTNbvCF3nsnrPDs3wVEfn/xgsHmjghjh8cHQJ/Q6rz9sU/p/bu/615DukWpoe4+3j1OdPYrpE54LT/6OOXmk5XBg39vmr4V7jODSX7YtfF+aj2N75t2Z844iRcHq0fNYbB+9GuPSqug6i28gx1R3h50lGjp1Mw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(8936002)(38100700002)(38350700002)(53546011)(44832011)(478600001)(6486002)(2616005)(1076003)(186003)(36756003)(956004)(83380400001)(6506007)(6666004)(316002)(86362001)(66556008)(66946007)(8676002)(66476007)(26005)(2906002)(52116002)(6512007)(6916009)(5660300002)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x0IUv20+6O6hcJWFR5Yip5zg5axccEaf0PLb3MRUozUlA+GVwK2pv8p9DkQl?=
 =?us-ascii?Q?kVA/XWdK+bV9nTVvK8ktV7O2dsuOdxoPTk8maD0E3g1sca/89Q0faB9HgItC?=
 =?us-ascii?Q?b02mGdLMa4QbFF/S+77K1AUcX3k7c4NkOFd3AumTCNQ2nb3ipA6/ICRH6sfr?=
 =?us-ascii?Q?r1W3lwkDjqyRMQJzcqVhAhiiTpuDysQLjV1SaTMryeIX94wkDJ0ufTyJEpEV?=
 =?us-ascii?Q?uimv2nGo7DBAM9CURymo/o0qJeHQX16chb0QPkV6U52LyaGZFBbZI+3vFafK?=
 =?us-ascii?Q?l1/OY8ssdZa1y51CWhr5dS4ajWGQSj4ctekkeSp61MrW5hqK+Qxh7vlDlXKF?=
 =?us-ascii?Q?C5QCXoi9KU4anobqeqz8ky9KiaWb48soR/Fck62ASjYq9oqAcS+1KfDYFgGj?=
 =?us-ascii?Q?Wspnewn7rTrg5a49ACX5gq9Jwjf/stSH2KEobZUGnNicL7/oWlsYHKeW2a0D?=
 =?us-ascii?Q?XMrXomEnwi76uYZjAWilx9i+ATLsBuQBNUROelL+jnRjSXOCZXGTpgWQ26bF?=
 =?us-ascii?Q?CkupnfbNUjFcM8micg/LfyvEfOLeXe+sMoaRNaevBfp8lDo0s0qDIADOK6dc?=
 =?us-ascii?Q?FxGVpRYDgznXD4WwWLgWwvs50jUbi081eE5J1G80RVWlob2qni/4niJyixT5?=
 =?us-ascii?Q?j7eEHtn5I86j7CN1jcgouvxCo9ICIblFtr9jxL7HxpgC2Aj9eJA5ochYS/Kq?=
 =?us-ascii?Q?Ay6WpNopbji1piMqhooboxw2tIg8qOlPzERw2z7JiOctg6yYu75HoKQ58c//?=
 =?us-ascii?Q?5wh6/gs7DXmTJMwe73hUyaiC9MJuNfg6ZD1gvlOjYgNnV5f6yZNbzGZ6V1gK?=
 =?us-ascii?Q?2f9vyOcCfxPHQT5EfmRTNE6ZVIfCpBJz3RyBADTuxIJR1yIpGatncGdRxrdR?=
 =?us-ascii?Q?Vczeoldb2Ay3oOFk9kVtwFPUTo8qhgpWSgMxif4oGrzuGGQ29q42EJiwhvzZ?=
 =?us-ascii?Q?gDjtPYh9Hph/7dbX3gMFpCzr8raKfqxuzX+tv12bTa4qE7gaZFhk2NJ7w4wy?=
 =?us-ascii?Q?Lk5qBAJKrduWHTOnFFP8KNAjgzkGDT/2lYHippDHS8ph3q/jqJbGKNNnOiNL?=
 =?us-ascii?Q?jpLeZ/1WRG1/dYx5qfhBqVYE9CfhDucgUZmk4OnCYHnWjG1T9Li5DIr8XHon?=
 =?us-ascii?Q?CtyZlq7TQA0s5uawN+YpXNRYm/h8WU93nviv73dNdu1qr6Fohn2ij3x4hFb0?=
 =?us-ascii?Q?oZ+zXGGNvvGR/b0vWRi4J9+uLqUNjsPy3QZ9IjkUVq/sCB8vDcQcNZuNFGXf?=
 =?us-ascii?Q?N7mwyLqrEeNuk0L5fjUYa69eDjVQExeCYLB1c3KphIFlDZlV0giZLKFKcPEf?=
 =?us-ascii?Q?Ckb1CMggCto0n3C/rIPsHHta?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d764d9-4cdd-4bcf-417d-08d957bacd75
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 02:43:27.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpk818ilDEj4fPUq+hEO8vbZmEJJq6HLHYGgRzMnE/P5Gz8h7wP5iBNxSPpPf/V+OKcsmcBrth/vqPHLjdU6RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-ORIG-GUID: 8vypQWTHBGYK7OCyXEYlbCsX4ulS72nM
X-Proofpoint-GUID: 8vypQWTHBGYK7OCyXEYlbCsX4ulS72nM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_08,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050014
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Backport a patch to fix the compile error
* Refresh the patches to fix the patch-fuzz warning.
* Minor tweaks to the recipe with reference to the 3.0 bb file.

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
index 11ec9e9fc..10c1afbb8 100644
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
 SYSTEMD_SERVICE:auditd = "auditd.service"
 
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
-EXTRA_OECONF:append:arm = " --with-arm=yes"
-EXTRA_OECONF:append:aarch64 = " --with-aarch64=yes"
 
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
+EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
 	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
 	STDINC='${STAGING_INCDIR}' \
@@ -60,16 +61,16 @@ PACKAGES =+ "audispd-plugins"
 PACKAGES += "auditd ${PN}-python"
 
 FILES:${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
-FILES:auditd += "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
-FILES:audispd-plugins += "${sysconfdir}/audisp/audisp-remote.conf \
+FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
+FILES:audispd-plugins = "${sysconfdir}/audisp/audisp-remote.conf \
 	${sysconfdir}/audisp/plugins.d/au-remote.conf \
-	${sbindir}/audisp-remote ${localstatedir}/spool/audit \
+	${base_sbindir}/audisp-remote ${localstatedir}/spool/audit \
 	"
 FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
 FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 
-CONFFILES:auditd += "${sysconfdir}/audit/audit.rules"
-RDEPENDS:auditd += "bash"
+CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
+RDEPENDS:auditd = "bash"
 
 do_install:append() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
@@ -85,14 +86,14 @@ do_install:append() {
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
@@ -102,4 +103,7 @@ do_install:append() {
 
 	# Based on the audit.spec "Copy default rules into place on new installation"
 	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
+
+	# Create /var/spool/audit directory for audisp-remote
+	install -m 0700 -d ${D}${localstatedir}/spool/audit
 }
-- 
2.25.1

