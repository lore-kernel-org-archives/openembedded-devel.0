Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD92C77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.50607.1680255729292296573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=345418c051=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V6vZbG007525
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 02:42:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85yhav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 02:42:08 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V9g1hF024819
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 02:42:08 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85yhar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 02:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drxA6xwqkTAZqEXj+W68ZoJgBBSzTQzrbIn1sfet/aVaw7Pn6PF3E+7TgJmsorPJgkD3l+uTNcZDpx/LkWmruuU6Oe2o9N0NWkFKDMF32l59gyFGIAcpRZvPYoMQ/1+1iEkWTnDkK3KN76CnwCFF7G8oP3v/ocBbAi8x7taVQfjjRREk/Jj5y3tjEd9OfLkv36dhTGR2KjQGI1ZGnWB4GZukDTj9FZl1Ylx3HoPbQPWBTDihlv9IL/6rrpu1Ff1INVRoOJpLzNgBSOR2LvW03nxZqggAI0irFf1gHxM794M4uoQJXS0SWqM0CZrCa4NyvyOuYXZcnRq4fJcYFwEEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Jyv8E51dn1atQVMa7eQcgafYynbiBVme/orhVJ3gXg=;
 b=k81ilh/hjG92yaF/zAMFCs5cW9JSaLTHOGn0m9PRwH9zMH43HGBt8VqRj5Qhi3A5FV2sERwUqh/ZBVkeE8DagcapOYZ7N3PiS1FY7IO5KrdVihhwPphZJQSKNq1IQVh+kBMnNpaPCC/lS3vycnFUMV8GBgszG/F5L4HVCME1E/N3gQ2ZH2X0lWLLrhQkbG57ONNZxe6zLwbe1Jp4K8DwXVkg1fhvfNSa25Vzf/9ZC/AtEn+NeKRx1/o3IoRXHRWxrrMhu073iDCs1DLTjtVZTMHYgJFtjntTyx7ZwSB3sI/VEFLNHSwjcFSzk/D7heXQVwbkx1H2nQZAg98irygqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:42:05 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a%6]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 09:42:05 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-oe][PATCH v4 2/3] protobuf-c: add support of protobuf 4.22.x
Date: Fri, 31 Mar 2023 17:41:44 +0800
Message-Id: <20230331094145.2362159-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
References: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: aac543ca-1c03-494a-4129-08db31cc2ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IowMGqGg6kZ+ZD4yucud7X9ZipVQsE4JmI234LhG/HvL+csllMe01vHmkHhoSoQYlMIo7MYWbuVsbsjsEAB8AvA/FfMk1sdnu/NQ1/3iywRTb2sgh/ViDrVynG3GgmMS/yE/aZX8+SxF4gSRQutNm6BsWXugtabfzCtEjRoRIbQds+QG7t0j68EbxNoXpx0/OnTiqcvIYgLyrd43Alzze8iT1kX6sZivUue6kqJ9lKhBuGV2zekLrOUlPfgR1TSC+Lm8uJ63QoJ2Gdt7rZr2MEmyOw0LOkWrN+2FJjVnFKQeKDWaLmN3tgb71MMzwO8p3xFNHz8H/kXeaenkQVJpAlOQTX+rzRDUJnUDPZ/1sCBJ8TNqrlNMkVTIwd1sDJdTVLHRzFUWTqKPS65QygXwdQVw6GJW3NGAj7K2Bg6FzrnxKdjgDBlphsc5djwuTWXvAjF/dNG4pRihY5jc5gRAsesEm+n/zqDQF0h7V9SzoR6QsKQNvdHbKu3Gu4vZhKtTuOCvmQJN8LczpIbkTDmazECkuqVj8mSHSedMfQDpffT+IHtHSKSLGqc+8ZBKK66AkPjiPpDCwgjMwspUbXzaVpJfpt41oDYm4BDsBHzl1lQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199021)(83380400001)(2616005)(26005)(6486002)(6512007)(6506007)(1076003)(52116002)(6666004)(478600001)(66476007)(316002)(186003)(83170400001)(66946007)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38350700002)(38100700002)(44832011)(30864003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KAI2jch6Lo6t+qcT4IbTGdFV1yuPUmJnaiVBkv+5hMyY2h9h35HW+00rRZ7j?=
 =?us-ascii?Q?/CRrORsnY2pjL7gEjaCN28OgQYq69/4ap66D85vDn/qTxr+EMmnHiSZU8r/L?=
 =?us-ascii?Q?YVBzSzVZ9ow+OgmRQXMT/dZEUx/SuPd14i4Cnqv9b+XKzi0uHqp3QVqmXZ47?=
 =?us-ascii?Q?ck2hn8Sj6AfNgLDpmTrWP/n29fMlqazvEeiDZeDAt5ljlP8wGrsnrfpUxsI6?=
 =?us-ascii?Q?SLWeF82G5PG1lX+8jUdSW+QyIgMAgvZoRuaJ+XObWHGTYNgDAmTGr3+7+vbS?=
 =?us-ascii?Q?Jn+xiJwnik8CYzsw2hMY1ByXpsD6k4O6Pcl9ylOjsP9IrbtUoUSnFaIjd907?=
 =?us-ascii?Q?XNuC89NGbr41Hzf+N2DMLiIox8hZg0jfr76s5c/SS5bXXxdcNE5XW843Xs27?=
 =?us-ascii?Q?8I29SzG0yQEzntFLn1uNE/wrzUbhlkmMOx13rRQM5kdfaOOY9NKmf0HN2Yb+?=
 =?us-ascii?Q?rSWd5klPS3equ3rrpwEd9m/ksNn5Y21gp/qo/UwNzJ1ePb/+anu+gKv33xla?=
 =?us-ascii?Q?mD1L1S9zkQV1ptSrUajHRcLT2AeQ5RoGB7+CH+wXqD/KqMhrqvWuaZ404y3Z?=
 =?us-ascii?Q?r1t3G6BgdQefhi8femlc+LS6GLJqv/VCfMAfQ4oS4mpI7SV86gV2kfgXH5EC?=
 =?us-ascii?Q?VRxJngM1qQxsQefB1OW1fHIcmAhUuAdfnFZ51dr4bG+iJBteeb0PDO5qx+28?=
 =?us-ascii?Q?oychZmfPQKMQ3msUIDaEVZplg4DIWarnkr98oKwOMNJfs15ub/MC+DbY60sh?=
 =?us-ascii?Q?nAE9Z9W5LHZkC9Fygxx2fzunzR3bvPjh7EGZf1UO9Wr9bXDnIK44lZaMCX0z?=
 =?us-ascii?Q?2bTZVpD9Cc07MC6o7uuIJ3DeDyxRt3fC2YcTJzAiQZ2HniToOQke0YN2QFv+?=
 =?us-ascii?Q?64YLk7zVpONPaxbvCYvm8szcMWwAainwotgsoLW7QAzepruDWqVvNwh8A8oq?=
 =?us-ascii?Q?9odNrYssfKdFOR98XVXrYRmqMlQ6yj7XsaO1sNzYexiHpgI5nunv1Yv5an4W?=
 =?us-ascii?Q?HuSizGZcNfsRdErGRt6+Ov7+qut0drunHQ0p9zHzV7zUf325GZREl/tJx8BB?=
 =?us-ascii?Q?TkNLtc7TjFI7MWSC8zqFbhgSbH5QzUG4bt9SFO8D3xvcoXokilTTVeuMyCNe?=
 =?us-ascii?Q?QhYVRYPwgEM1LyNY/JqO0fIKqb8IZgMEtjN5ywEd5dMr6MPU5UqkzTasUwAF?=
 =?us-ascii?Q?eoKMNdD2ANpOx/DHoICnLt9BiDpmseuYMYqPup0glZo1335er9X4QeiIPVW9?=
 =?us-ascii?Q?IjLIAF4VsyVEhH2IU/b3yFnMotCJLyZ2TiMNMIpPq7D88FYMBxRqpDReZg5o?=
 =?us-ascii?Q?oqO5D/jthFsatS6FTvco9MPMafnCgF12vmb/5UG+LfRV6UmzTKgLh+ZLdQS5?=
 =?us-ascii?Q?wV89xDHruGAVxzF33FaNXBItfDycTPglcPqj3vMWuN4FNIghGAn3AaZVYNS3?=
 =?us-ascii?Q?KotR3XaTtut4h5zoniacIrER/dxNPSD+cVgE3Hynl1LH0brxABK9E2zlVLUA?=
 =?us-ascii?Q?Tm0Z6RDSqCzqPz8yVITQU1pyS5JW3mnTW8yb4zCKrqeFy5ZcpETAjtSxj0ZV?=
 =?us-ascii?Q?mlVmSn/5RScS88VdfuqV+swpuaOPyXFPCZdiOSbjDM4LbX14rD1T2ReFNgNO?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac543ca-1c03-494a-4129-08db31cc2ffd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:42:05.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PSVrNy98+Q6ueWEb/+FKf7h55qroclCrCuJH1ZSCsWdR0bWm5bap9YdE/vNxKrwX/Nw1fXdwnawPcgVyV4jU8NrpH9q6YUPsARGHOlkhVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-GUID: uJBJ-3LNi3uFg9lVMSUHvnM7EwnUCLbk
X-Proofpoint-ORIG-GUID: ZIKbnWct9CdiHheV4RSN6ArnrW3fcrEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_05,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101850

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 3 files changed, 467 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
new file mode 100644
index 000000000..4450a2f62
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
@@ -0,0 +1,147 @@
+From c263360d4f40beb2badd04e5bd084f46fd25595b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Fri, 31 Mar 2023 16:02:50 +0800
+Subject: [PATCH] Makefile.am: do not compile the code which was generated from
+ test-full.proto in protobuf-c-native
+
+Those code was auto generated by protoc command with test-full.proto, those code are not compatible
+with protobuf 4.22.x, so temporarily disable compile those code until protobuf-c upstream adapt
+the test-full.proto with latest version protobuf.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am | 116 ++++++++++++++++++++++++++--------------------------
+ 1 file changed, 58 insertions(+), 58 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3b0d1d6..ff4c196 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -136,64 +136,64 @@ else
+ 
+ LOG_COMPILER = $(VALGRIND)
+ 
+-check_PROGRAMS += \
+-	t/generated-code/test-generated-code \
+-	t/generated-code2/test-generated-code2 \
+-	t/version/version
+-
+-TESTS += \
+-	t/generated-code/test-generated-code \
+-	t/generated-code2/test-generated-code2 \
+-	t/version/version
+-
+-t_generated_code_test_generated_code_SOURCES = \
+-	t/generated-code/test-generated-code.c \
+-	t/test.pb-c.c
+-t_generated_code_test_generated_code_LDADD = \
+-	protobuf-c/libprotobuf-c.la
+-
+-t_generated_code2_test_generated_code2_SOURCES = \
+-	t/generated-code2/test-generated-code2.c \
+-	t/test-full.pb-c.c \
+-	t/test-optimized.pb-c.c
+-t_generated_code2_test_generated_code2_LDADD = \
+-	protobuf-c/libprotobuf-c.la
+-
+-noinst_PROGRAMS += \
+-	t/generated-code2/cxx-generate-packed-data
+-
+-t_generated_code2_cxx_generate_packed_data_SOURCES = \
+-	t/generated-code2/cxx-generate-packed-data.cc \
+-	t/test-full.pb.cc \
+-	protobuf-c/protobuf-c.pb.cc
+-$(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
+-t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
+-	$(AM_CXXFLAGS) \
+-	$(protobuf_CFLAGS)
+-t_generated_code2_cxx_generate_packed_data_LDADD = \
+-	$(protobuf_LIBS)
+-
+-t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
+-
+-t/test-optimized.pb-c.c t/test-optimized.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-optimized.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-optimized.proto
+-
+-t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+-
+-t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
+-	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+-
+-t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
+-	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
+-
+-BUILT_SOURCES += \
+-	t/test.pb-c.c t/test.pb-c.h \
+-	t/test-full.pb-c.c t/test-full.pb-c.h \
+-	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
+-	t/test-full.pb.cc t/test-full.pb.h \
+-	t/generated-code2/test-full-cxx-output.inc
++# check_PROGRAMS += \
++#	t/generated-code/test-generated-code \
++#	t/generated-code2/test-generated-code2 \
++#	t/version/version
++
++# TESTS += \
++#	t/generated-code/test-generated-code \
++#	t/generated-code2/test-generated-code2 \
++#	t/version/version
++
++# t_generated_code_test_generated_code_SOURCES = \
++#	t/generated-code/test-generated-code.c \
++#	t/test.pb-c.c
++# t_generated_code_test_generated_code_LDADD = \
++#	protobuf-c/libprotobuf-c.la
++
++# t_generated_code2_test_generated_code2_SOURCES = \
++#	t/generated-code2/test-generated-code2.c \
++#	t/test-full.pb-c.c \
++#	t/test-optimized.pb-c.c
++# t_generated_code2_test_generated_code2_LDADD = \
++#	protobuf-c/libprotobuf-c.la
++
++# noinst_PROGRAMS += \
++#	t/generated-code2/cxx-generate-packed-data
++
++# t_generated_code2_cxx_generate_packed_data_SOURCES = \
++#	t/generated-code2/cxx-generate-packed-data.cc \
++#	t/test-full.pb.cc \
++#	protobuf-c/protobuf-c.pb.cc
++# $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
++# t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
++#	$(AM_CXXFLAGS) \
++#	$(protobuf_CFLAGS)
++# t_generated_code2_cxx_generate_packed_data_LDADD = \
++#	$(protobuf_LIBS)
++
++# t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
++
++# t/test-optimized.pb-c.c t/test-optimized.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-optimized.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-optimized.proto
++
++# t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
++
++# t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
++#	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
++
++# t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
++#	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
++
++# BUILT_SOURCES += \
++#	t/test.pb-c.c t/test.pb-c.h \
++#	t/test-full.pb-c.c t/test-full.pb-c.h \
++#	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
++#	t/test-full.pb.cc t/test-full.pb.h \
++#	t/generated-code2/test-full-cxx-output.inc
+ 
+ if BUILD_PROTO3
+ 
+-- 
+2.34.1
+
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
index d724287d6..86d83e9cc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
@@ -12,7 +12,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
+           file://0001-add-support-of-protobuf-4.22.x.patch \
+           "
+SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
+
 SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


