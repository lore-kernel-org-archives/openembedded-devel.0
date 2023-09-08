Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72032EE57E5
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 08:39:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34813.1694162347675573978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 01:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D+eiCGGv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761564e7d4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3888020Z006245
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Sep 2023 01:39:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=j/QTZeAGO74PCoeSnu
	zG7m++cT0fV1PbqJsvR6SvwUw=; b=D+eiCGGvQCnNPKlcmk7dcuDf7NGmlNcMrL
	vnzHFqr08BSWnt02K2dBo5BBeTtE8iikH+4M3wkU22rf0rNvCecMdchZhwD/t+rN
	BkOcE4GlQhVHN6xHVYcP3yh8iduZOqRy4E2Qr6JpBUsbcnSj8FHaa5TbLGXHEBsa
	W6pC6SKN5RtJgSJmDdXEqXWNVwZRRaPC3ijrdYxGXLvzv+8zLIRODgxc2ektZtfj
	lajo5G3PNhLaAg2ojFCQWzhJcbhE4IC3d9h/5oJ/a7nXTilJMY6NGAFQ9nZT7k+O
	/JBwOakFRw1SPobXnokqKfnt9sGya5A0C6keTjz4XDrw8JCQeM2g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b05aen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 01:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyiD8ZVmb1ifBKgiMWXzshJdxSrdTRMXz9FAOOtAeyqKxuop8oOWR7ocIGJBMhIW7jbxqsttL44DJsQdp+vQ6/1e2uZCP1L3rpDtCmZcQRCn9W/ZTf5tZVHVmSKKvP6FiIUE+VCouXK82FsD98HimTRcO3EnWIzrUCX2b2f+ZWm6FdadD3cgY8JlO6FiQ60f98Dr+rP8I7btfav/8mI8y5aFvLtWEy3cb7tPJ3c0puWkKEFZWg+oiYEFqy58yKwCi2vBd++OfEyZAS6ZLBObL/ivCunvaJ1QtrBs+NFgiqYuPt+zgPJv4xzNRo+kx9Nnksdq/5mZT+5cvpmGnmfT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/QTZeAGO74PCoeSnuzG7m++cT0fV1PbqJsvR6SvwUw=;
 b=YOzWKv4mx+D7/S/eITim0LkDKFe5OxSqTAXS1/RGOwm66E16tsWDQ1Q4msLOMRWhb/DHVENNti1YCP32TP83kSea2Ci3CyMewfiF1deJntmzR1Up5Jn4DatYFe/wQxfZL3dyKiVfOpZha5a8HUkjmEkI4iO3gWxXJRInNBIFf2rcS1uFzP4D1qvOoZR5+3ilOTN13jNev+QmKi5esB4UCXbAplipH2dto819jV31ijOXsAFCoCyfee348eurY9qTdfgcE7yzew/N3NNGe/UNm6TSB62W1WMN9TBuAenovFN1zyS6HGrk2kxISl5etR8OmP7t6QNI4rwHIglLQtnVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 08:39:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 08:39:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.1.1 -> 3.1.2
Date: Fri,  8 Sep 2023 16:38:51 +0800
Message-Id: <20230908083851.3544948-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|IA0PR11MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eff37bb-257d-4d57-57cd-08dbb0470d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1XwrsNTLOoQ8HjGcAfbyu2roABrtkAYaYzyYHz1mcIIxthMj75hGK5EH6OBpHkw0nwJ2z97KwziwPodWRrzW42VT4WNGp4xQwtwegxrhPIm7gXYF9+iBoV70XKnAD8TP9bVScEtG1Q5moTwXFAPYOIhs9tDDV537ojKAzn8jsGtqPWL0PDXkIgluT2aI5J7+1X1A9F3218D0qMWAqnjUSoPJsryb0lfbD2yCUnAqA69h6wk72RZphyEXeqHsYrl1O3LFUaAH5BQpZvEYRNN1m2ZfKCn2jYlK4JkpV3MwaaDSwAo7yxLqoeMSwW7ymXyYfF5XMh6KRDKuJlzV8ts5ozZiN6QgdHCsoAdSuJwmPY0qxnMCYkwRsUlhEw9psfwPVS71bSAeNE2M9HB2+sQWVR/BDh1yozcsRptvhloBYUUb78CpwCjalTw9+B6dHYDjRVVVTMuX69KqRgCpvzgj2kJ6s7Zk6bO3uQMpuBUjzwLSvz2RB7Sq2yMyVWgn+myZzRrXLtMtsmqWwXufYlhJoVdCoe5i9rIbGfzxWytJQsoIj+pmIMAq6SeFkQBW4qblqlvC0xpfLe69gaFYom6mrUS0HBNSZwNsxoFH+bBAObPAFwNJ4W2MqxpbosuTfjsua541iAkT0lKvmBx622vBVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199024)(186009)(1800799009)(6486002)(6506007)(52116002)(6666004)(966005)(6512007)(83380400001)(2616005)(26005)(478600001)(2906002)(66556008)(66946007)(6916009)(66476007)(44832011)(8936002)(5660300002)(41300700001)(8676002)(316002)(36756003)(38100700002)(86362001)(38350700002)(1076003)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q8bk5mVmuRaQ7RtAHLtdQIa7JafONjF/jmTPF4ryX3ctoylWmXMILfz+Jr8i?=
 =?us-ascii?Q?K1QLFJ8KNzFTzKLK6T43rNSbeZ+43g+oy75TaMymSSqBBc1gFxykclB6GrNX?=
 =?us-ascii?Q?VcEzui/IDa2hOH4jN5C/cnqO4wkgnzQZ4wdFBbFqKyejoTYgJ+fdUd8MGJZb?=
 =?us-ascii?Q?FDCF+StjPbQb97XkpKGZuE9tfj6EpVtkzDOcuXwvxkgX/7+02zT9XFnsc9Zc?=
 =?us-ascii?Q?B9EK9OESayRwgl0iq+YbBZriQCyGPHsx+IfE5zF5KT3RKHqwuj0stMuxqBvS?=
 =?us-ascii?Q?oBPpNwXo0nnIZbO0Y9BzcoFG2ZvbZ2BHNXBC1K/52L7X3mIIy/sxCTQvyL3S?=
 =?us-ascii?Q?/og4O2koWyIdf3qayG33/MzKHuOKUk0axP19rS9vLpz0jDNdx36GLkhWxCr3?=
 =?us-ascii?Q?w8QRCok5UKfQsSyPhhNrbg+LOb9++tiLv7V1QEdGeq3+iAPfYXB/q7N1b0vx?=
 =?us-ascii?Q?dJ4kdP96if1PyIfqsWsS5U84LmY9lfEj54axclvdqQuAFjlBcHb83McxMCQ9?=
 =?us-ascii?Q?4MjW/nxuUHAItFLlLQaIICbAFY9sDc8yC29QIaWMAaamiCTR+amJqhlikltk?=
 =?us-ascii?Q?gm945o3qghKWZ6BgLNmKM9czBCJ8FR0xZX/KwRnMWvhDqo80pFoDmVafqMIN?=
 =?us-ascii?Q?jV2vHIolABhNrkfbkh/zC8MZOTt/dyVKLAetBHt5fdxSEsTgiWManMS27s2j?=
 =?us-ascii?Q?DzM02qXDLA1h0HonSgboko8iULiHbvn2LD3zqp9VQ6+ZYql6WNvj4sVz7SP9?=
 =?us-ascii?Q?725NGOMYE83P6mavOBKp170UuMtKRcsWq63iMaji87iU8IOsrsYe3Atlq/GS?=
 =?us-ascii?Q?tMAFBtQJe6kEW1Ay5bE96Gk9yAGfZXacw2nKRsJ4ktDJFYIo/xEU8jGlgo1O?=
 =?us-ascii?Q?tRlTILYUUd0RANH2h69DFJnWR4ZcoYIvB+72r98nCZ6r+CKwP9rlOVj6joPM?=
 =?us-ascii?Q?xnk2YhqigQl0MgehDkER3SroV4heiEd4sHvEFtJOzjccZJmM1aqnN0+uzjcF?=
 =?us-ascii?Q?/8mZwr3ScadCU5F8Y5LYl1uetkYuU6kM8viQDdi4SgejdVcMr9n7WPiLiEHZ?=
 =?us-ascii?Q?yXfMoc10RDqIdLIwAfo5Mb1D3Ra0VQ34Wu/e2bdP5xHB3KLZjKrHKNaRy+Lw?=
 =?us-ascii?Q?TrD5EpHDEx3ZBwR3jZiFmh9VAcK5JOobECN2E17zasq8+eFHLYsh/v9yOEnX?=
 =?us-ascii?Q?ay6bM8QwHLiTO4ORkCt4Og1H/QkG+KXUWi+fDmy9yEiM9j2fP8U9sx6iUaWB?=
 =?us-ascii?Q?7BoZel7pQaU+5OIbY630mzvasaCizRu/i+rbaBsgj/VfYcO/Hqw4MwxN9dcp?=
 =?us-ascii?Q?JWmu/4flGa9LigIlK4yvHwrpYo01OzzdiFLVmmNalYMNct4Mo6YCyvi9uBKB?=
 =?us-ascii?Q?uuHE8DTYN6PPb4YK3WE3eYUStr5DCXzCluFySCps1AXlrm2iRlhSuH/Hd4jW?=
 =?us-ascii?Q?cfNwqBv8ph0hxiF34IH5voOONywnLwlbQNDHqXuQ6tWtT/SM8O5S0sjmP9wn?=
 =?us-ascii?Q?7KysnpHL0XN0OeY30cNauBSgjbtrodWOjzQfYFTtO0QTvK2m0eL9U3eAuqkm?=
 =?us-ascii?Q?7pJoIAlLmxost2wHFrCyvI/ife1YmX0U/9OAOK/f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eff37bb-257d-4d57-57cd-08dbb0470d79
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 08:39:01.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W1K+PI11s4hBDvqdqiVzUigLhEvXFTH1N4IfYcVyfQOOEPE++xLzhnT0outkRSkfsXGFgL66XNZQ1IgOQ1dcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
X-Proofpoint-ORIG-GUID: xX3moeBj_LGp3V7YM5SzkgJTUsaFjxTh
X-Proofpoint-GUID: xX3moeBj_LGp3V7YM5SzkgJTUsaFjxTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 08:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104800

Changelog:
https://github.com/linux-audit/audit-userspace/releases/tag/v3.1.2

Refresh local patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...Fixed-swig-host-contamination-issue.patch} | 21 ++++++++++++-------
 ...te_malloc__-with-__attribute__-__ma.patch} | 15 +++++++------
 .../audit/{audit_3.1.1.bb => audit_3.1.2.bb}  |  6 +++---
 3 files changed, 24 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-security/audit/audit/{Fixed-swig-host-contamination-issue.patch => 0001-Fixed-swig-host-contamination-issue.patch} (73%)
 rename meta-oe/recipes-security/audit/audit/{0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch => 0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch} (81%)
 rename meta-oe/recipes-security/audit/{audit_3.1.1.bb => audit_3.1.2.bb} (95%)

diff --git a/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
similarity index 73%
rename from meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
rename to meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
index b023c80ae..5f2ecc141 100644
--- a/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
@@ -1,7 +1,7 @@
-From 3d13f92c1bb293523670ba01aea7e655b00a6709 Mon Sep 17 00:00:00 2001
+From 9a32d42dfc6713fd0085dd4563a934afc30ec097 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sun, 19 Jul 2015 02:42:58 +0900
-Subject: [PATCH] audit: Fixed swig host contamination issue
+Subject: [PATCH] Fixed swig host contamination issue
 
 The audit build uses swig to generate a python wrapper.
 Unfortunately, the swig info file references host include
@@ -18,6 +18,8 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  bindings/swig/src/auditswig.i     | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
+diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
+index 6131e80d..2fb7207b 100644
 --- a/bindings/swig/python3/Makefile.am
 +++ b/bindings/swig/python3/Makefile.am
 @@ -23,6 +23,7 @@
@@ -28,7 +30,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  LIBS = $(top_builddir)/lib/libaudit.la
  SWIG_FLAGS = -python -py3 -modern
  SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/li
+@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
  _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
  nodist__audit_la_SOURCES  = audit_wrap.c
  audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
@@ -37,14 +39,19 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  
  CLEANFILES = audit.py* audit_wrap.c *~
  
+diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
+index 9a2c5661..6cbb7295 100644
 --- a/bindings/swig/src/auditswig.i
 +++ b/bindings/swig/src/auditswig.i
-@@ -39,7 +39,7 @@ signed
- #define __attribute(X) /*nothing*/
- typedef unsigned __u32;
- typedef unsigned uid_t;
+@@ -43,7 +43,7 @@ typedef unsigned uid_t;
+  * generating setters against them: https://github.com/swig/swig/issues/1699
+  */
+ %ignore audit_rule_data::buf;
 -%include "/usr/include/linux/audit.h"
 +%include "../lib/audit.h"
  #define __extension__ /*nothing*/
  %include <stdint.i>
  %include "../lib/libaudit.h"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
similarity index 81%
rename from meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
rename to meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
index 23747c45f..7f0af74a8 100644
--- a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ b/meta-oe/recipes-security/audit/audit/0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -1,8 +1,7 @@
-From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
+From 679cb57fa93984fed345dd3890cdbcbaa24e8518 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 9 Aug 2022 23:57:03 -0700
-Subject: [PATCH] Replace __attribute_malloc__ with 
- __attribute__((__malloc__))
+Subject: [PATCH] Replace __attribute_malloc__ with __attribute__((__malloc__))
 
 __attribute_malloc__ is not available on musl
 
@@ -11,18 +10,18 @@ Fixes
 |         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
 |         ^
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  auparse/auparse.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 95cf256d..c7dbe5ff 100644
+index 5cb7402e..39156eff 100644
 --- a/auparse/auparse.h
 +++ b/auparse/auparse.h
-@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
+@@ -54,7 +54,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
  void auparse_destroy(auparse_state_t *au);
  void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
  auparse_state_t *auparse_init(ausource_t source, const void *b)
@@ -32,5 +31,5 @@ index 95cf256d..c7dbe5ff 100644
  	__attr_access ((__read_only__, 2, 3));
  int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
 -- 
-2.37.1
+2.25.1
 
diff --git a/meta-oe/recipes-security/audit/audit_3.1.1.bb b/meta-oe/recipes-security/audit/audit_3.1.2.bb
similarity index 95%
rename from meta-oe/recipes-security/audit/audit_3.1.1.bb
rename to meta-oe/recipes-security/audit/audit_3.1.2.bb
index 7ed2fd2de..5380e9022 100644
--- a/meta-oe/recipes-security/audit/audit_3.1.1.bb
+++ b/meta-oe/recipes-security/audit/audit_3.1.2.bb
@@ -8,15 +8,15 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
-           file://Fixed-swig-host-contamination-issue.patch \
-           file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch \
+           file://0001-Fixed-swig-host-contamination-issue.patch \
+           file://0002-Replace-__attribute_malloc__-with-__attribute__-__ma.patch \
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "6e367585a899231da05797c6126f8bb01febb2f5"
+SRCREV = "572eb7d4fe926e7c1c52166d08e78af54877cbc5"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.25.1


