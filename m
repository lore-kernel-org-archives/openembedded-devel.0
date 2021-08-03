Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1141.1627966673223106881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 21:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Yk2RjHDb;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38491ef679=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1734fvLn030901
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Aug 2021 04:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=W4ef6gJBzGcwvsVsdk5Kx7fNFXgE5npjee8Xv+qIw4Q=;
 b=Yk2RjHDbbwfhEEOHMgBwpAGI+vFU/gyZwl2dE7XGkdVS7ft1I9cJU3GQemeL+O6cO83A
 UXLCfp2rD36t9GO4gjy9LgIL75y42Nm7HseGSXCoW8ejUC0KN/Fa7W67B35Ej9Zk2IHL
 fbBJ5vKMTXzFA+H1VXjawt9jFA+4B2LHRGsQRUck1an5l01pgS2C1HaUG1rLg6JMXVBb
 aIfO6JCudn1pb+PaT5ngymiTrfoPFfiK3dtQlPR+b6fAqnc3grRykPowTbfGhVJ3hp8q
 AyS/STvcQ16ukqU9mxtcl84Q9yIPP2YebhKljiNa57rWO+C8H3O5DvSwl2JWzp9vCl8y mA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a62carxv3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 04:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6hEorIU6VjUghXW4PCWH0m0Gnk5IdCb1kV5NYeGShpyArn+WzRKaCkYi2b3Ozpoh0dCSHhxTU+/4WL5wM337cYoCl6fybEmbLueWWsBDXCPcC5jefD6tbsGyu3XPdY9jYwKoATDS/pM9KD8HuZWWWcyNjnhsYeykpi/tQdYE77x0/hE57nph3m605q/qIb2wWcgke0oKgejr0CDZlexmsBuSnxd+nppYoWH6Z5Gr0OqTtdS1X8Z6/fd592+1wIE/spUFZ1u8AVNQVtaGEH0QUo3CgfFnvUuDxyiRZitMCe/lImhWH2zQsHulNnOa8vO8IRjXCblIG7vkQPVnEIVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4ef6gJBzGcwvsVsdk5Kx7fNFXgE5npjee8Xv+qIw4Q=;
 b=EcZqAQk1LVaEWinvc2OKQkQwSJ38jK4en92/tJFT3W/1i582oXUx3rOppVr09BZ4JvW5EeY9d1wqiNbYuVX3T4I4HbJ2Riu0Qr6Onob3OXvuiqGmJM130g9cUOCNqAUNvENW9ql68J5w1xGUW4vi1GY2H1eYiT9IqslOcMQ6ziVb5cxOeEjl/jgCYCnE24fxhXUexQiQvK2qX4WpD1VAtqidnH0unq3icqjYcsXlW2Twi7hmUHarjSiggj27KbRoxtI7kubItkAxE2ySAmEyXYFDUIruXGZE0kCSJKVLZh9l4kP1WiKLJS/DW0ee27FeVYWgBadobBW6tKYREGMYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1854.namprd11.prod.outlook.com (2603:10b6:300:10c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 04:57:51 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 04:57:51 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] audit: fix compile error for 2.8.5
Date: Tue,  3 Aug 2021 12:57:39 +0800
Message-Id: <20210803045739.276613-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803045739.276613-1-yi.zhao@windriver.com>
References: <20210803045739.276613-1-yi.zhao@windriver.com>
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 04:57:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3a08bfd-7839-4fa3-aa98-08d9563b3f10
X-MS-TrafficTypeDiagnostic: MWHPR11MB1854:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1854D36C6B6C2327C5388AAAF9F09@MWHPR11MB1854.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nmULcTpQDVyA6I/ROEDYEdWKXJL2nL4pKtj04ZggcbC7zdDtsB1SxrMgEv3iNxYXIVwymHtpSYUx0c6a/k9v5qM6SALToiuSK60GJf3vP2kAk6bAl0LugCTpkWI0/Gwj1NqMZHYh64hmCey/zlYCjIJ9zu+py+iHQwpfwFuDzb514GjivAX+Kav1UnyRx3lAHE0FDe/ttdgb9ltqD2jqF/Mr+wUg8XOSs4UvJPuuTLNFSQ/tomv+rZ7h3Iau+iUPwiHD8FgD3lhHUtiVFnji0BJpXarJGFAu64GowVE5wBhE9W9qN6lZbJ1vcsZVd1e22mrG1Dhp9328nYSjyf3+MnIdCKoJcOr9LDzxc3axrCr/wr/4YyD3lgQCBUMo9DYTaFcigo71Jm1cnqKbxDQH41x1YjFLk+LdZo+maU5D7vm5tK0E6NXAgK4dr48ScEQ9oJwfBWQwLob75/AvVgR7v9PaRTGzJOcbORevmm83/GbPT1X/fF0WtyhWKdkM9RbXT5ACuh+9WvmDPPqsx4/P1vKz+yj0w6ErhANiQdlAXKiHF1ydZKYnuLBEeVp2wowL1T8Yugg+WJaQa88SoTYSxwHjsF3iW8u3uaNGzBMaOw5jCC/4azzSkbraX3Fc8BEp+LQieksxHwn0P1d0QVeruGHHZzMg56TckheozZ43yb7x2Xv9sYTLwJD2Fc/hR2Orusca6vA2wLb5ZQ9voRl5v77EmYzRTwNG+o4h6MAz7syK/y25HFT7eVArt/eYcub3XvdoxCRHMXe+LUa+PpsIjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(6486002)(36756003)(8936002)(86362001)(66556008)(66476007)(38100700002)(38350700002)(6512007)(44832011)(8676002)(5660300002)(6666004)(316002)(2906002)(6506007)(53546011)(956004)(2616005)(66946007)(26005)(6916009)(478600001)(1076003)(83380400001)(186003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tbwR50aWDP5gJ49asO9KTbjAHzGKaf0epwSsruYpY1TwDKccNt2bNpfqPOoB?=
 =?us-ascii?Q?/tLFO0NWqlU6el2Cy5bm/V/ZRw0VqpgY0U6VbJsz5wY1wuKtqdUAZvW/J1LD?=
 =?us-ascii?Q?2iiayXZDf9pvhZY64ViM2iqR2GaGU9GtCfXChHqKAlNmXBtHHsc1U5WxWWgB?=
 =?us-ascii?Q?N2YJSzhP6ab2dKiCEXhJUq00OrQ1IN1zMrgpIVrLKW2Z6/TqRaoxmejolnRw?=
 =?us-ascii?Q?QNEf1s67VpJbq5UYU7FO1NA65/tj33B0ZjJewBsOQxWjCLAWKziwQ+fG6rH6?=
 =?us-ascii?Q?+FegUtPzJLbfxGDQrFQaSLwhHIQKKyzT0Lzev8Yg7mgJUHHNHI8vHgFB0+0B?=
 =?us-ascii?Q?Z13cZn2GwXVfjUTbl3eQ/bhbd12ZG1VvevydnOftMHQ+AG7+bbDZxdsEdwFl?=
 =?us-ascii?Q?B4hQeUPsdUpb5VZO1wD1ca5ygILv/kDsaGCBbs5st0v8vjA+/N6T+kZk8G5j?=
 =?us-ascii?Q?krDID4/OA2I1Y++xSVbF9Gk8+CcPWcH14Q15bXI84LJPnJ+xf3In5lP1UomX?=
 =?us-ascii?Q?/moFBm8tIJ0mz03D4LhFItAcszeRzafYFGP5b3o0HzeMQ1d5tO/dIILr35GF?=
 =?us-ascii?Q?x6f+3PDuEvjh/bpEegXznk2arKV5VATVV7onqU8XSkdXZiqt7Tmz/jDtFhme?=
 =?us-ascii?Q?aZ2QzKSBcEysMhyhsWfR2ndn4MHun3VkTwYUnyDKJ0hjGkKe3V8K4f1wiTXt?=
 =?us-ascii?Q?PxkeMN/Twn318OT3Wzxt7G64m5K8NShftLiFXtoUhOEr7N+P8MkbqeO7FfdO?=
 =?us-ascii?Q?866xqFAfhdNB5FXLHpLVXvLzBPjWMOiV05/IFO9l7yEyCXhncAiHhF7grp0d?=
 =?us-ascii?Q?jUEdg0Ac33GpQ6Rj5cgG5R1f74PR2JNWVkkJD8XDY5Dwd31gPjoSUh/8G4BJ?=
 =?us-ascii?Q?OrzVwgfWKSKzyL9N1YLqsceiTNRmpUzuXcbv6FQ8fV/M0UJOY7B4aJ2bi4wT?=
 =?us-ascii?Q?Z+AQGorE2tLv3oaysDKzemLskLNdePFxytwIPBWRgE9ZbMohwIhetIQOmluj?=
 =?us-ascii?Q?TYIgkjtGl5zmJNaT1zO2ExxlhN3dV8TOVpXpm4p9z40OkoPqSBTnzEFtMHo6?=
 =?us-ascii?Q?TZbA5r+DOrQr07379QsKD0hY/F5tEdp1MYHyMURD9xVH0AzqNaqb4XgPiQa3?=
 =?us-ascii?Q?T62/dfEByYEAp6alzcBmBzjQJ34t2XKLvbT4MCkdin5qlFalUAaCCU2fAiXV?=
 =?us-ascii?Q?YntTlBL8JE9SSQcqRcQv1fyRyE7AIrlQFo/hlD3LnMS7YTrBfWLCnD++vDRn?=
 =?us-ascii?Q?wU/M5ZG26sgLt8YebMGy/q0/lq+51HaQTfUpC66UGkbvnjhEm7iQxlbq6kQ0?=
 =?us-ascii?Q?F8JbgmSWoX+9x6WlWehqL6fE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a08bfd-7839-4fa3-aa98-08d9563b3f10
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 04:57:51.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Px9gtia+3A8Rkeyp4RdNLEuv4+Ldk+fHjjxmoFcMddS6mx8h4yN38iZ4KxVbSn54vlryt0bFpk6jE1MIFJYyIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1854
X-Proofpoint-ORIG-GUID: eOAZw2SOmwdg0BtyoaaDHF_jaaw_QRPb
X-Proofpoint-GUID: eOAZw2SOmwdg0BtyoaaDHF_jaaw_QRPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_10,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030030
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport a patch to fix the compile error and refresh the patches to fix
the patch-fuzz warning.

Fixes:
tmp/work/core2-64-poky-linux/audit/2.8.5-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/11.1.1/ld:
ausearch-checkpt.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: multiple definition of `event_node_list';
ausearch.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: first defined here

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ue-functions-for-strndupa-rawmemchr.patch} |  6 +-
 ...-Fixed-swig-host-contamination-issue.patch | 57 +++++++++++++++++++
 ...ns-need-to-be-external-when-building.patch | 30 ++++++++++
 meta-oe/recipes-security/audit/audit_2.8.5.bb |  9 +--
 4 files changed, 95 insertions(+), 7 deletions(-)
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
index ee3b3b5e0..ec04a0444 100644
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
@@ -39,9 +40,9 @@ EXTRA_OECONF += "--without-prelude \
         --without-python \
         --without-golang \
         --disable-zos-remote \
+        --with-arm=yes \
+        --with-aarch64=yes \
         "
-EXTRA_OECONF_append_arm = " --with-arm=yes"
-EXTRA_OECONF_append_aarch64 = " --with-aarch64=yes"
 
 EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
-- 
2.25.1

