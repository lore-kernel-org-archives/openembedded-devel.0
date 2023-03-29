Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18B9C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:08:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20732.1680084516458938246
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34523aef51=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TA7vKw002201
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php644nkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TA4vWT028253
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:35 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php644nk7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 10:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yzkd4E+yh+zf61k9kG/8jCgsCICQz1+5D+ekfI0JZRWHyoRXl/tghvIgYn3fgsJE6BlvCxgoGkeeh79CLxvHEFHuvz0yj7w1QtWpUhXcPR9G3RqfLGg6KZPq3x6xwyYIUIzYWdy5Dn9IB8UrLb7Ds9WqsXbsoQcHZ+v1jmuNlSaVUyy8CyJbFIL9rmQ/A730IERadfj4YCdH3FEqc7K7PootwLZu7h8jHxIGm1MLpPQI7O+Olhk1Ylub4K7j25ZX2UYNGtb/KxHQkWAJgKbf0EHr+FRqeizRjxk/K+A8qNT1/4YsYO6uJI/GfGAtxhn/Q4GWHRGBCLlbLUT6L9ACHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+Oc8CkknwVqS2ZgrCctP9K5H/P7hizJe2Y0MzW1IAU=;
 b=WgUmajjVpscLRLTC9L0tYufBEsgjwwpO4ySxZJmp55G/MgktXjv2V1jiB56tjlWooY6qnYmmRVs/iNEIho7ImRL7l0RiUYE2lRH4hs6RPBh71WNieeonfxAR3VD2U7Y4IipHKrETE190aRGWya99USk8AX0Z+dL1Gia/ZYOKMAA2HWl9RTYdUL3X4zQX/P6UH/huXujkADIRhNAywLoYWPR4HCv7AazumoiFbQ/6LHmdhQ0eUMlnuGbQDbCit3Udgh0/a6mZuXq/VW6wVNfghw245xrm8WfGoHDSe6o+Q4+WkRtNF5TrWtfGukq7veO+YEC+drjZFwvvtzJyqSMmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:08:29 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 10:08:29 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v3 2/3] protobuf-c: add support of protobuf 4.22.x
Date: Wed, 29 Mar 2023 18:08:09 +0800
Message-Id: <20230329100810.705855-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
References: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bff2019-07af-445c-b31c-08db303d8b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pn74tigUy0lOucYoCPzhctr0XV2cB0kGJnpKmUCcc8x7NFU8PFf4r0JPyLkl11T8ngQ8RAssIFzVRdSkBrjpBNudIXyU4Ht76iTHWinKLNYSa2UPMKiw3JQAP8sV0i8Bx30vt0KXtQowk/Nf6CX+AvzVxtInYeN+CGOS0MAhg/lMBMFO0n5irBn2SwB5jm26BuA82BY1JX5ZjJAPe3VRzf+By0SVnKxLty9uwanLXTC4ZbEXwyM7h+7gHsHkMh4K0hAMzUBceP7W4R5sjD6PiwqoH9D+xUVV/dyWLO7qhyy0PDfIVSLaZizG33nVODCB5XBSuuRpo5Pbzl3lCinoz7AJ7o3uF+4qV91vfcJ0tD04l+LzV7XKWH8PHlp5PCcKX3DVNN4EZUq4CAdxWQqZU8z9+MYJHKut74G/jUcPnzjAjoRou7t4ujUwNyuUFAWJx6Hl/75qvNsOWoqC9tttoecAnXYZTQbWY5EbKhryKZRZHbNZJoW/l3KXQ16GuBXUkny8PcOnFoapfhEbIQzHgwpafjpgt4UJz67SD08BAAuEzty+hJwn/cWLWZa/sOLrJvRglL6i6E96HjhvpQ0TmPr7N3qA8a6pUNLEnXmn4TM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(451199021)(83380400001)(6666004)(26005)(1076003)(478600001)(83170400001)(52116002)(316002)(6506007)(6512007)(8676002)(66476007)(66556008)(66946007)(41300700001)(2616005)(6486002)(38350700002)(38100700002)(30864003)(8936002)(44832011)(5660300002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9PKrKtcpH7UZys3TSgPE+KqvvmqL7IdwB03Ky9fx0LCmvLumm0MUi9YTh6dd?=
 =?us-ascii?Q?wjbFhbg0WR3IzsFAPfhUqJryC+xtqy0+lGOEot5YicpNLJZLCzqCIsDuI++1?=
 =?us-ascii?Q?IxaCDxRMKPMRTBixKvNqSB4PgGG855wln30Ahzx4lEMb/54Iri3ZeIOqV7lf?=
 =?us-ascii?Q?Q/qWepSHbF8eXYBHVdqQeX4IG5TOJDDGbp0y1cFQArMnLWABK3Gb2vYgdCVh?=
 =?us-ascii?Q?HQqFvYa31qDx8K/yzs3dEz6DzEqMGjIDiwkpVZoX7nGGlUcofDtW7+Wyy5dt?=
 =?us-ascii?Q?SRzT09027NZU5LuypzeYjNT1CTqoPq2oLIYuHUchvUpvQxvDAo6Tua4IS/GJ?=
 =?us-ascii?Q?KbFzmJtLvSsrv70PzqSzJ7qv2HLHlg19yiFKg+hXUq4Pr8Vppve5E8Y8a5KS?=
 =?us-ascii?Q?8n5PrwfPUI75Zmv2/5/lQmSk+8rAUTkDnTKB9u9wqA0bA6Y/Pf/MmICTBW+c?=
 =?us-ascii?Q?Zj9goenM0IREn842QIofdnOioJaGsynpSkKAR5DiLwcY1wlR7X7/PFjphwoX?=
 =?us-ascii?Q?OpttF9ejIFewzsjP8y/JBR0cwv8IGkJUZKsCfRdsZsyjll2SNNXyF6BhJsM7?=
 =?us-ascii?Q?CCcv4XMvZlbCs2htmGKZwGkMn2MD43YFG7ONPRaCWe8UJtEbwX1DcXgrHnG9?=
 =?us-ascii?Q?FTyGneEfGBCGaYnqQaR4B82TJBpbP7wriZMIKqvLilv/oLpE5QB1RQuhPNNr?=
 =?us-ascii?Q?3B9zY/NFJ187qTsuZwkU6emRmDWvkir5cSShox/vFmxnRlor3dkC8Af0T3sg?=
 =?us-ascii?Q?SuzhMI/F5BaF196fsCemCPL/dDTUJ6nOc15rYTXGwm5LnS55SyBGlc5mesDi?=
 =?us-ascii?Q?6CQJanwYbIte7IGFTHlUx+nQ637FEl7MkDD14oMLzDjW1QPjavUXC00IwoEG?=
 =?us-ascii?Q?trMiaIlA9xsVxPQWOFe1MwBvK60Dwl/hdiTBJMDdcaOkjeLS2Bou1wQpSW4j?=
 =?us-ascii?Q?z5J7+XUoE+tNm2Amn68TBdTYR3vSxRRB7Dtns10ypnWsR++TMw/wDq16U2TE?=
 =?us-ascii?Q?mWdZoEkxcBSCKtwsNQnZ3tz2fnY7yrr3TgQsxIR0GtmeYbNdrgB4uO+bFDSV?=
 =?us-ascii?Q?PLT4H7kvvZP+U0gpdlQE0hPqzcKT5PllbAiEUOhXBaWKFPpCCohj/Qkhz97f?=
 =?us-ascii?Q?xH0G0Szlh1Q1hP3BzTm36nl3KWwPgLkI3b3hoFFuDzEbr3f5A34+1Hcr2lSu?=
 =?us-ascii?Q?KXDpDhBwfxB26svuIkZYB2Tkp6nBkJCAH4exmT9RxvBDQYXsu2gCxl6G0NxZ?=
 =?us-ascii?Q?sj8u43b4ePVmrvxFYsFc3zUv/qoy9UaaGvJJjGxFsHVKm3krRWigHTu6ClpB?=
 =?us-ascii?Q?phVpCOj2KjgzqCU+lCm3G6YM3jcLV3r/FR9jWhIVln+eIlVdfonPlosF5FAz?=
 =?us-ascii?Q?xpAYhaLr+5GhIJUg0+bXL/upB6mT0QvPozT7JM4XT59vF5j/rwMuUnXzA/m+?=
 =?us-ascii?Q?gZdnkO5Fkl96A4o789+Y3+sPLYH1LD1qRfn1RdmxRqZkOHNp8W9KlK3Vh2q2?=
 =?us-ascii?Q?1yODcnQLtdm9d2fvRZVWnpXi/DT/cfrhSBfhYB4Q2/BQqSuHTkyOhmfzewFn?=
 =?us-ascii?Q?PtU3CYigG0dK92ZZLa2ZuZKBzLHIhpbuDOw3t9zO4/8UaPWPw1wQVDdeM7xs?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bff2019-07af-445c-b31c-08db303d8b53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:08:29.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nedvYBnHMXAGtf7o7qKBP/T1Do08qqTwqwBvMp7f/2ENYYs3I9Xf6ehyj9WNpNhc15r+ydBWyKwKYnhPxaMtUAgYRKnTiidSkk+JssTiXXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-Proofpoint-ORIG-GUID: ERQqJLNR60srQyaTi2lu07DIDszUTL4F
X-Proofpoint-GUID: rjjtZQt_2KJJBJuiFzDL3cweFWjNrF7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_04,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101815

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   5 +-
 2 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
new file mode 100644
index 000000000..075b7044c
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
@@ -0,0 +1,315 @@
+From 66a0b0d205224f63f19dd8f96abf9dcdc2112331 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 29 Mar 2023 14:25:17 +0800
+Subject: [PATCH] add support of protobuf 4.22.x
+
+after upgrade the protobuf to 4.22.x, the protobuf-c cannot compile anymore (#544) due to following changes:
+1.protobuf using c++14, that cause the command_line_interface.h report error
+2.protobuf using abseil-cpp library instead the trace API with GOOGLE_ header
+3. removed GOOGLE_DISALLOW_EVIL_CONSTRUCTORS
+
+Upstream-Status: Pending [https://github.com/protobuf-c/protobuf-c/pull/548]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am                   | 2 +-
+ configure.ac                  | 8 ++++++++
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
+ 18 files changed, 17 insertions(+), 28 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c7339ef..3b0d1d6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ AM_CPPFLAGS = \
+ 	-I${top_builddir} \
+ 	-I${top_srcdir}
+ AM_CFLAGS = ${my_CFLAGS}
+-AM_LDFLAGS =
++AM_LDFLAGS = ${ABSL_LOG_INTERNAL_CHECK_OP_LIBS} ${ABSL_LOG_RAW_HASH_SET_LIBS}
+ 
+ # code coverage
+ 
+diff --git a/configure.ac b/configure.ac
+index f5a0261..8ed549a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -78,6 +78,14 @@ if test "x$enable_protoc" != "xno"; then
+ 
+   AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
+ 
++# now checking 4.22.x protobuf, if so, set cxx as 14
++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],[AX_CXX_COMPILE_STDCXX(14, noext, mandatory)])
++
++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++    [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_internal_check_op],
++       [PKG_CHECK_MODULES([ABSL_LOG_RAW_HASH_SET], [absl_raw_hash_set], [], [AC_MSG_ERROR([Missing absl_raw_hash_set library.])])],
++       [AC_MSG_ERROR([Missing absl_log_internal_check_op library.])])])
++
+   PKG_CHECK_MODULES([protobuf], [protobuf >= 3.0.0],
+     [proto3_supported=yes],
+     [PKG_CHECK_MODULES([protobuf], [protobuf >= 2.6.0])]
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


