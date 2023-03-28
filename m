Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941B7C761A6
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:43:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.59997.1679985791096775989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2451043720=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6dvMY003911
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 23:43:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn2gw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 23:43:10 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S6h9WA012886
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 23:43:09 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn2gw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 23:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVAvsnecTFz+qHz+9/jnl49qIi6Lvt+lNdCIT9wgpTmp9sp9Be6FE750R/h/wjaRadYykeaQTHiI+f4CJihNJvv8IwSu/IqSqwMFdJ5+bLIAf1X+69NhEQLrOTLta5bjz3uboaYg/Q+qsJR/91I1GjVSBxs5NgvtwPym52aOE6h8Q4ueXOAZC2EKJCsdI2DMUIjTr4XxJXFpdOqQeiXhn4LdDt8+MXJq8+rpHw7kdQ9U9FDUCizxxYrYV9nfN+l093EKS9dMcMBYW02S1vst9a7oaW0w9EwHYFVgu0BDgsf30UyCQTb/TXrgryQzHNi6oXgRZ4y1iV/mlxWcGopLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEPq/+FX06teouCml/1DTJIqr7CU4U9T8Lb6cBZtIUc=;
 b=TLSY3GcaKa0ATEXP3vI/SO4ZvoUEj5/B9UiLVrjT8i8na6fH1f73FaCDf2yOl7qW45MsOIsw0SG6Rr5S0xD/EfoR9pYxQKeZvf45Pb03eGBzfNxBlODKPmQqimORuulW4IBE1kcwMTlDOsv9T/SvP3e9psRJEzGzOWRk4vM2nB/XQjux2VXjItl9Aox4A7W7JJ9LU9ocurqksT8W9nZABcpbKq7j4JQEDO+fKn6CqjI1iNSPvoQH65th3PKIyQoJthA4onasPcZk1vV7Y0F3Js3LcnjwUCqoSDHQcllg+F2/sUpp17NXNvPbgcPOsN+FOJVC47mjWxYkdm/8lxqFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 06:43:08 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 06:43:08 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 2/2] protobuf-c: add support of protobuf-4.22.x
Date: Tue, 28 Mar 2023 14:42:48 +0800
Message-Id: <20230328064248.4049456-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
References: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CYYPR11MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dac514-17e9-45c8-deb0-08db2f57b0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+3DA2seGkPa9EPD4HXtcZCFOdhL1t7w7a/01XpZpo75N1zuwWTmJScriD51akQULzKZGe3+F5EzXlhnY/0/oYgkCcWpi70BV6wXc0N5vhDkVlfIsLOniQrM2kFcjevUzaRkle3T8OJqyH9gnNM1v+P8QjeJPH4vddZMgujRYeG0C3i1AjGwXON9QEZg7yJzD5Hp+N6W1g6oeAeaV5FcBpT1oeim8uCDYJMdWSmyF4gjAXg65vY6UMorUOgW3nwmySKXIHp0NA3G70K5kz6p6B8F2M9TGlwHR1AZ1JKn0eBj8N+AxB6rI7DbhdyHq1mGBFlAJxpIUax6PA/glWpn9idrneewDB7a1LNnQ/haEwTb9LbHb6+p+yEmcNhQBOSNRhXmZQGUoGCilWwyTsBF7KCx241rOmEIOzNFuqz5wn8t8y7E3+JZ1gYcaZK2luOIGge2ULmyyW+GR/QkocCTkzrMGKuOtlcaxn1NlIex8ljcdOmrXkc4P7D570+VVJBJfYZ8Fgmq82Q6HPf7jZSNkiLoIdrK4xR7dqrkLhvP5TQYfHcLz/BdDLwR/Nir/2eXCUSDYnzRgD178t4Ce46aDV8WyrMQ+ZnoBg040chmvBn0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(451199021)(52116002)(8676002)(316002)(66556008)(66476007)(66946007)(478600001)(38350700002)(38100700002)(2906002)(186003)(6506007)(1076003)(26005)(44832011)(6512007)(83380400001)(30864003)(2616005)(83170400001)(6666004)(5660300002)(41300700001)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LRRbqQF2sUVw+ztPu9JzeINUquwyKkVFV11/BUnTMtMG7MODSL/tW5XkndEP?=
 =?us-ascii?Q?CFqr6w+b7IVII4gE0ULOzSdTXML340PNken6YVPObhD7elPIbK1xVvLiCa5y?=
 =?us-ascii?Q?FzRXKfgJ7Cr1FHmlg+YqsPGmOBpadJY6zXeoATW/xbQlbL0pkj0FKn5tM2/x?=
 =?us-ascii?Q?93M4whycISzsdpdCncHf22ezEMCvbFVTohmZmt+R0hZuS0emXkw8Z71xQg5R?=
 =?us-ascii?Q?iaFcgZCI8W7dwgiFJZTviaSRHc4KtCc/dcslOXlSRdaKfGlYF6ck2MOCiuJu?=
 =?us-ascii?Q?gtW4Q5bCTxoXyFSGR8YDH8k1yNaTo3DyGT6RlZcsSWMMA/34yub2/GEGrLJs?=
 =?us-ascii?Q?yam+LfuIksrQ4Wi5RWYHuRs5RWA1PNP8bFWkQ25puazzSylBbNiu9JLdukCX?=
 =?us-ascii?Q?39KpUZRTgcRuhWSSXDqMJ94aYXVLUWb3GLqO4VQo2VdzUCjMOzTfEjRVfH5G?=
 =?us-ascii?Q?f0odZ4QeAEJfOykyZOuDVhcBu/tCJzu989Q1cQBw03LrPaSF5I1l8SXGUeyv?=
 =?us-ascii?Q?JTI9QFlckI1swtcjmZsU25FgIRAfIzFY1xxtyZa4pRordSZoq1PTV0rb63SP?=
 =?us-ascii?Q?6mw5e/YoPSa76+9FDe2jf36Uer/vFu4CvWTxdYRQr4Q8oaWRZ3krbxKOo+9R?=
 =?us-ascii?Q?81OOOIpBzz5GGF6rpDhp/UfvKYFxBNECaQ7Apayc1nibgkClKcXAlDCQY1qC?=
 =?us-ascii?Q?XvwAjmxOuUM6WNyrf0SCSICOgZlvPmsgqICllMA/PxcWmm/I0DuQpTRr8ZdP?=
 =?us-ascii?Q?B/pxjA/p48oShMIPqSPhIYcCdDPvJFFM7eaIPiWsnepMT9oen0q9y809VP/c?=
 =?us-ascii?Q?sFn97dvQ8lw59d8uZp14wDIVXWwSc8offuYlOilx/cITJU8o5mNbTf5mdysq?=
 =?us-ascii?Q?BBv0AvLBw/LQtfwZUZjdflxB8KAO1co6Qhj9yNes8pl34TTtVzCMZTMCB0Zr?=
 =?us-ascii?Q?hhsgqTs8Fvl/CXyLn/AZIWOYLaYJnya2LsrxC5r3J0jlXGDLDGpZBneMza9e?=
 =?us-ascii?Q?h1LGnQ2f8ORX+RdFdit90bVVxyq1Jg3Sh7QHd27u2zdSVhkRWtsHZ1rlpM4Y?=
 =?us-ascii?Q?NMgeC1garmHNOS/s3zv/yJhy1m02CYDNyVJkjm6+6Y+2c/IMqHBgs4lBcuLW?=
 =?us-ascii?Q?mYht+mXWN3vwPCRcBzvte3TFofXGJEZstnL3gRp1VK8zq8JxEVRa49cGCocf?=
 =?us-ascii?Q?kzNr0DlLp/Xly5e+kxFjmLuzWlN8RNYr8zOBAZMAQr2rsTr2VBqlUQ6NgSsT?=
 =?us-ascii?Q?YD2pKvIPQHxRU/RHWPK2+2A+ObJBmvFDSjjghATtfKAcmhA3ChTNz/Glmcgl?=
 =?us-ascii?Q?CRsSAeAv2mrSLYJEJ2YJOxwNhRag1lVmhJP3mauPXgVL2Jxz4FkTb53Y33N5?=
 =?us-ascii?Q?Hp+vKh3W7abna4pVgoA6zQdw58fkgF/Rdu3svhIcYyo8W7n/Et7hmdhZZUgq?=
 =?us-ascii?Q?g0HGeSTIUzRXSxuvdlbmQMuK8t/ZwU4OvyQXfVDIYLPqyD/5XsmiH66RfeOM?=
 =?us-ascii?Q?w8D/9sCavaVIwzjOeu2o2ZJvtkmho73ONJvpJorW6iNh7LQakgSWzF8rDouf?=
 =?us-ascii?Q?lUj7VqAuR0Q5kzh/EP1vPcYoth7L5n9tTbaCCEc94nwcBm70tNgPjMBcuJKk?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dac514-17e9-45c8-deb0-08db2f57b0df
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 06:43:08.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stS6HrljG0nv5ktqtsj4Xb0repG21Yc7B2R/Fu//iqRXHCLpvSmSgmdwCuaozXuvgjHxoT8AJIG1MLja/LeNdgczt7mEu+mTlZ65XH4mwKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
X-Proofpoint-ORIG-GUID: P0JXzjg6LLz3RQLsh6nT_X0DZf4cknt8
X-Proofpoint-GUID: 7wwbpoVO0zQNv8XGCihC9AsIrAfHo1XN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101797

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../0001-add-support-of-protobuf-4.22.x.patch | 332 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   5 +-
 2 files changed, 336 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
new file mode 100644
index 000000000..80808273d
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
@@ -0,0 +1,332 @@
+From 0bf2e81d7196fcc5538a82da9da339657b3fae9a Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 28 Mar 2023 14:21:53 +0800
+Subject: [PATCH] add support of protobuf 4.22.x
+
+After upgrading the protobuf to  4.22.x, the protobuf-c cannot compile anymore due to following changes: 
+1. protobuf using c++14, that cause the command_line_interface.h report error 
+2. protobuf using abseil-cpp library instead the trace API with GOOGLE_ header
+3. removed GOOGLE_DISALLOW_EVIL_CONSTRUCTORS
+
+Upstream-Status: Pending [https://github.com/protobuf-c/protobuf-c/pull/548]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am                   | 2 +-
+ configure.ac                  | 9 +++++----
+ protoc-c/c_bytes_field.h      | 1 -
+ protoc-c/c_enum.h             | 1 -
+ protoc-c/c_enum_field.h       | 1 -
+ protoc-c/c_extension.h        | 1 -
+ protoc-c/c_field.cc           | 2 +-
+ protoc-c/c_field.h            | 3 ---
+ protoc-c/c_file.h             | 1 -
+ protoc-c/c_generator.h        | 2 --
+ protoc-c/c_helpers.cc         | 4 ++--
+ protoc-c/c_message.cc         | 4 ++--
+ protoc-c/c_message.h          | 1 -
+ protoc-c/c_message_field.h    | 3 ---
+ protoc-c/c_primitive_field.cc | 6 +++---
+ protoc-c/c_primitive_field.h  | 3 ---
+ protoc-c/c_service.h          | 1 -
+ protoc-c/c_string_field.h     | 1 -
+ 18 files changed, 14 insertions(+), 32 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c7339ef..884b5eb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ AM_CPPFLAGS = \
+ 	-I${top_builddir} \
+ 	-I${top_srcdir}
+ AM_CFLAGS = ${my_CFLAGS}
+-AM_LDFLAGS =
++AM_LDFLAGS = ${my_LDFLAGS}
+ 
+ # code coverage
+ 
+diff --git a/configure.ac b/configure.ac
+index f5a0261..0717934 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ LT_INIT
+ 
+ AC_CONFIG_HEADERS(config.h)
+ AC_CONFIG_FILES([Makefile protobuf-c/libprotobuf-c.pc])
+-
++my_LDFLAGS=""
+ my_CFLAGS="\
+ -Wall \
+ -Wchar-subscripts \
+@@ -76,11 +76,10 @@ AC_ARG_ENABLE([protoc],
+ if test "x$enable_protoc" != "xno"; then
+   AC_LANG_PUSH([C++])
+ 
+-  AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
++  AX_CXX_COMPILE_STDCXX(14, noext, mandatory)
+ 
+   PKG_CHECK_MODULES([protobuf], [protobuf >= 3.0.0],
+-    [proto3_supported=yes],
+-    [PKG_CHECK_MODULES([protobuf], [protobuf >= 2.6.0])]
++    [my_LDFLAGS="-Wl,--copy-dt-needed-entries"]
+   )
+ 
+   save_CPPFLAGS="$CPPFLAGS"
+@@ -109,6 +108,8 @@ AM_CONDITIONAL([CROSS_COMPILING], [test "x$cross_compiling" != "xno"])
+ 
+ AM_COND_IF([BUILD_PROTO3], [AC_DEFINE([HAVE_PROTO3], [1], [Support proto3 syntax])])
+ 
++AC_SUBST([my_LDFLAGS])
++
+ gl_LD_VERSION_SCRIPT
+ 
+ gl_VALGRIND_TESTS
+diff --git a/protoc-c/c_bytes_field.h b/protoc-c/c_bytes_field.h
+index bf873f0..8fc63d3 100644
+--- a/protoc-c/c_bytes_field.h
++++ b/protoc-c/c_bytes_field.h
+@@ -88,7 +88,6 @@ class BytesFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(BytesFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_enum.h b/protoc-c/c_enum.h
+index 9c34b69..d5e58f0 100644
+--- a/protoc-c/c_enum.h
++++ b/protoc-c/c_enum.h
+@@ -107,7 +107,6 @@ class EnumGenerator {
+   const EnumDescriptor* descriptor_;
+   std::string dllexport_decl_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_enum_field.h b/protoc-c/c_enum_field.h
+index 3f8c005..03eb402 100644
+--- a/protoc-c/c_enum_field.h
++++ b/protoc-c/c_enum_field.h
+@@ -86,7 +86,6 @@ class EnumFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_extension.h b/protoc-c/c_extension.h
+index 9541388..9c5797d 100644
+--- a/protoc-c/c_extension.h
++++ b/protoc-c/c_extension.h
+@@ -99,7 +99,6 @@ class ExtensionGenerator {
+   std::string type_traits_;
+   std::string dllexport_decl_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ExtensionGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
+index 0716744..4abdc6d 100644
+--- a/protoc-c/c_field.cc
++++ b/protoc-c/c_field.cc
+@@ -231,7 +231,7 @@ FieldGeneratorMap::~FieldGeneratorMap() {}
+ 
+ const FieldGenerator& FieldGeneratorMap::get(
+     const FieldDescriptor* field) const {
+-  GOOGLE_CHECK_EQ(field->containing_type(), descriptor_);
++  ABSL_CHECK_EQ(field->containing_type(), descriptor_);
+   return *field_generators_[field->index()];
+ }
+ 
+diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
+index 3cad35d..76d3b0b 100644
+--- a/protoc-c/c_field.h
++++ b/protoc-c/c_field.h
+@@ -104,8 +104,6 @@ class FieldGenerator {
+                                             const std::string &descriptor_addr) const;
+   const FieldDescriptor *descriptor_;
+ 
+- private:
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGenerator);
+ };
+ 
+ // Convenience class which constructs FieldGenerators for a Descriptor.
+@@ -122,7 +120,6 @@ class FieldGeneratorMap {
+ 
+   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGeneratorMap);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
+index 8dfd8ba..ec55906 100644
+--- a/protoc-c/c_file.h
++++ b/protoc-c/c_file.h
+@@ -104,7 +104,6 @@ class FileGenerator {
+   std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
+   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
+index ac1ffaf..9260116 100644
+--- a/protoc-c/c_generator.h
++++ b/protoc-c/c_generator.h
+@@ -94,8 +94,6 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
+                 OutputDirectory* output_directory,
+                 std::string* error) const;
+ 
+- private:
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(CGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
+index 6fd0cd3..1eaeeb4 100644
+--- a/protoc-c/c_helpers.cc
++++ b/protoc-c/c_helpers.cc
+@@ -286,7 +286,7 @@ const char* const kKeywordList[] = {
+ 
+ std::set<std::string> MakeKeywordsMap() {
+   std::set<std::string> result;
+-  for (int i = 0; i < GOOGLE_ARRAYSIZE(kKeywordList); i++) {
++  for (int i = 0; i < ABSL_ARRAYSIZE(kKeywordList); i++) {
+     result.insert(kKeywordList[i]);
+   }
+   return result;
+@@ -548,7 +548,7 @@ std::string CEscape(const std::string& src) {
+   std::unique_ptr<char[]> dest(new char[dest_length]);
+   const int len = CEscapeInternal(src.data(), src.size(),
+                                   dest.get(), dest_length, false);
+-  GOOGLE_DCHECK_GE(len, 0);
++  ABSL_DCHECK_GE(len, 0);
+   return std::string(dest.get(), len);
+ }
+ 
+diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
+index 37e8bf8..c7e8515 100755
+--- a/protoc-c/c_message.cc
++++ b/protoc-c/c_message.cc
+@@ -499,7 +499,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
+ 	  // NOTE: not supported by protobuf
+ 	  vars["maybe_static"] = "";
+ 	  vars["field_dv_ctype"] = "{ ... }";
+-	  GOOGLE_LOG(DFATAL) << "Messages can't have default values!";
++	  ABSL_LOG(FATAL) << "Messages can't have default values!";
+ 	  break;
+ 	case FieldDescriptor::CPPTYPE_STRING:
+ 	  if (fd->type() == FieldDescriptor::TYPE_BYTES || opt.string_as_bytes())
+@@ -521,7 +521,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
+ 	    break;
+ 	  }
+ 	default:
+-	  GOOGLE_LOG(DFATAL) << "Unknown CPPTYPE";
++	  ABSL_LOG(FATAL) << "Unknown CPPTYPE";
+ 	  break;
+ 	}
+ 	if (!already_defined)
+diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
+index ea1c3ab..e90782b 100644
+--- a/protoc-c/c_message.h
++++ b/protoc-c/c_message.h
+@@ -137,7 +137,6 @@ class MessageGenerator {
+   std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
+   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_message_field.h b/protoc-c/c_message_field.h
+index 39b8d99..42efe36 100644
+--- a/protoc-c/c_message_field.h
++++ b/protoc-c/c_message_field.h
+@@ -83,9 +83,6 @@ class MessageFieldGenerator : public FieldGenerator {
+   std::string GetDefaultValue(void) const;
+   void GenerateStaticInit(io::Printer* printer) const;
+ 
+- private:
+-
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_primitive_field.cc b/protoc-c/c_primitive_field.cc
+index 6990893..d5a7b60 100644
+--- a/protoc-c/c_primitive_field.cc
++++ b/protoc-c/c_primitive_field.cc
+@@ -99,7 +99,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(io::Printer* printer) const
+     case FieldDescriptor::TYPE_STRING  :
+     case FieldDescriptor::TYPE_BYTES   :
+     case FieldDescriptor::TYPE_GROUP   :
+-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
+ 
+     // No default because we want the compiler to complain if any new
+     // types are added.
+@@ -143,7 +143,7 @@ std::string PrimitiveFieldGenerator::GetDefaultValue() const
+     case FieldDescriptor::CPPTYPE_BOOL:
+       return descriptor_->default_value_bool() ? "1" : "0";
+     default:
+-      GOOGLE_LOG(DFATAL) << "unexpected CPPTYPE in c_primitive_field";
++      ABSL_LOG(FATAL) << "unexpected CPPTYPE in c_primitive_field";
+       return "UNEXPECTED_CPPTYPE";
+   }
+ }
+@@ -197,7 +197,7 @@ void PrimitiveFieldGenerator::GenerateDescriptorInitializer(io::Printer* printer
+     case FieldDescriptor::TYPE_STRING  :
+     case FieldDescriptor::TYPE_BYTES   :
+     case FieldDescriptor::TYPE_GROUP   :
+-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
+ 
+     // No default because we want the compiler to complain if any new
+     // types are added.
+diff --git a/protoc-c/c_primitive_field.h b/protoc-c/c_primitive_field.h
+index a9eb893..d2bb724 100644
+--- a/protoc-c/c_primitive_field.h
++++ b/protoc-c/c_primitive_field.h
+@@ -83,9 +83,6 @@ class PrimitiveFieldGenerator : public FieldGenerator {
+   std::string GetDefaultValue(void) const;
+   void GenerateStaticInit(io::Printer* printer) const;
+ 
+- private:
+-
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(PrimitiveFieldGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_service.h b/protoc-c/c_service.h
+index 27125a6..4737ff3 100644
+--- a/protoc-c/c_service.h
++++ b/protoc-c/c_service.h
+@@ -101,7 +101,6 @@ class ServiceGenerator {
+   const ServiceDescriptor* descriptor_;
+   std::map<std::string, std::string> vars_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ServiceGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_string_field.h b/protoc-c/c_string_field.h
+index 513cea7..ba258e4 100644
+--- a/protoc-c/c_string_field.h
++++ b/protoc-c/c_string_field.h
+@@ -88,7 +88,6 @@ class StringFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(StringFieldGenerator);
+ };
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
index d724287d6..bdaf43a54 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
+           file://0001-add-support-of-protobuf-4.22.x.patch \
+           "
+
 SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


