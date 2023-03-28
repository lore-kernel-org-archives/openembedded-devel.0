Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94249C77B61
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:43:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.60166.1679985789475495951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2451043720=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S4xOGD020276
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbtt65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:08 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S6h88E006409
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbtt64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 06:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUh1OGmvmj2NkJ38rAFfYiEi4KEoJnWamPsdWVL1C/BNgNqnmsXtxHIBrZy3Ydj0BLpmFx4j7hq0kBvTvR6cK8w5VXwyfY8X1S74aWnu1GUYJR8zSHhDbFH4cmoim2IGUbT+RG2owHOOtcEj6+QOB/ywJ9Zl3X39OB/G3b1TxE8L/8Y9gaeM8lZSm2s8577rKJKhW/x4hcDC+a3GHg9FVUoszbQj7WgapznSwyHnnpcrY7B2qAK87tTMAGcnbdrkTBd2zkv2EgYBCFYdhjSaIHB7QCAFcsm/VH3H0K8FUkMpmz9E4Cg7AGzwt+48k/51TJ/aJwRQuEXw9AQeFwEU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXla3TXP+Pseh6R2GDLIDF4avGpX4ZnG2E5v4j1peVY=;
 b=CPJNNzRa94zaoAR+ajTgxCMW3Ly+nv/Fq4UqoiAIZ/PcA3b0SxToiq6OVKQMg47Ci2mmqBTqgAq7wTfn5cZLmswGPp+SfWHUBmGRyVJgpjFqCx7aLveSJAa8fYF8HZEwU0BvifVfZv3e89aaDjHYDey62nsZugRPSnq8sS3/pETW4CBC2Evvz3E0L2AbLSXIYAZRndCnYFOa/7hMMar98igSG4c1g9do2n+OerQK1/6Hsyow79NSavMvKzOafKW9HHMVSxZqlkOhhiXkxnceGQW4CN03pgPhSdPGEw3VIAysO0/RxGDjFA8leMitNodv88/hHVfRmkG+l++ycYcLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 06:43:06 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 06:43:06 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 1/2] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Tue, 28 Mar 2023 14:42:47 +0800
Message-Id: <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: f64fed67-679a-48bc-980a-08db2f57afff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UKcru0ADcxr1fRLvc7invi873Str+wAKHr52A9hqYS89Emanle4ZhbxfEySQg410u1JKwt2lV1rUtpmNei/ksGJZQD2V/GDtN4YvOkFybALoT3OU4nE/hhmp2WhoajBllGMqtjMe/XIdY4C8lG7/wUQxtAWTbA7r4wLgu9fBxx+JD844W+n+w9ObeezzUPKydYjdNLUnfPAoTr/4L8KRjuIT+sSNPuWl5Ez+wm31dDp4DzbfxELqVEDs3cl+saBYSp/vnP5LNsfBVNzfDbhebZqaen26gxbLn5ue7fObrDe76oOZR+lESreVNPSiv/zvJ9Voj4XsXxoL886kcESnPAibT3vHmouuiKIgfdyIsW5gNT3bGNv2d9xaPk9Cfpquk0dDe80Yigq2aKAMOv2lQnVeocTShmtxON1jmZfoo+rSNJGtbEtfm90w9Y81BDqjqj0dxKXb6R4MxqMPpOFAA3mGkNoDGV7kLXODrDF36SW7L2aLAWKH7GfVrUxOeIv17RrWRqw1Rg+pZMZzCj9m2FXkbYVE1AUaRw6ET0eTGw5mLM3qp8TbnmcGe/DdSASyZdyItrfjyftWb420m7ahjfvVr6kuCiS4KWLRNAAIUFQKLvMQhiclq4geRFMVEDJ3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(451199021)(52116002)(8676002)(316002)(66556008)(66476007)(66946007)(478600001)(38350700002)(38100700002)(2906002)(186003)(6506007)(1076003)(26005)(44832011)(6512007)(83380400001)(2616005)(83170400001)(6666004)(5660300002)(41300700001)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pZ7ImsrJA34dyvK+vejt9Iz+uFzvZkBG+EwmPD7N1/aCK40GgiRDUwSTMS+5?=
 =?us-ascii?Q?w2QocDooCKgUNWFQ5MOj1YFfwRCzX0ZjnGSLA8/QYIdZpqTB4s+OI+Oz9lCm?=
 =?us-ascii?Q?wlR4lhB3v4+0NOPMloHkXlgvkotD9O/DqUn3DSuOyzZ0XOeQc6/zTynNbXqO?=
 =?us-ascii?Q?BnHpjRfn5N+0Ovr6xnQwEFRoIYufTcNqaP8SosOK4tCHR2uMfdioMqJOH2nS?=
 =?us-ascii?Q?UBuax/ntUK8skvEh13+B2XNv3cPiIaZvGBCbB5mzNByISiGCTCHBhRXRkATc?=
 =?us-ascii?Q?V//p99aimVvojHplrsRH4GDAh+OnPDmwT9J923biS9DHnoJB9t6lo/WsSEv4?=
 =?us-ascii?Q?YKfS2lIq1UxfENK7n/mpkX7zXWhiCxiXZZN74lNeZEWJMtHLFgpYfWPgPQdh?=
 =?us-ascii?Q?CheXlFbE616n2u/TA1zYPFvUvjOSCsj4LaY2Td6JOLqDiD3cX/aLNSTIqHc1?=
 =?us-ascii?Q?PnLXocDBOiI5tKXlXRZu1P171sub2LJEPbYOr8U8xo6PiDqDCTXV740PBg8F?=
 =?us-ascii?Q?0kOEB5Yw7odPTsh5F5iM37ykvjlAzUnn54TKMkekckr856+B73BY9o7TdUcJ?=
 =?us-ascii?Q?BrK0dxSwqMjoOw6OOMsrw0xrkHSBeIQctgoQwwKmdcuSdg1+kI3uxNbHy3Q+?=
 =?us-ascii?Q?Dz2QtQECFKZLLqUuxnlY4p1SjCZTFCE3LW9Aew19EKte7yFBmVobmtNArvYI?=
 =?us-ascii?Q?lH5jOFO88BIqXmHaUl0qwZ+zYqoXcHA7fVhRkb/pEBvZvTWdN7EKZALb2njA?=
 =?us-ascii?Q?odOZR3YJFTCRCwjY2YAavpzAWTUo2iJMyg3NKCar02NSZCBRdil1rvqBnzGu?=
 =?us-ascii?Q?FywCQOTCWyoa0Se6h2ArSXN4/397G5j13anvJCSxQNBKzTAhsqexC6QK6ZTN?=
 =?us-ascii?Q?DAVjh2N/Kwh5pOfumeyaH0SxIuwFDJQ1NyLzS+J1KqeGbzwiqCMPc53UQuKd?=
 =?us-ascii?Q?RR4oO3yYe9n1yAAhruG0oQar9lOcKmxqrIIYROi1saAlAUQkhxSoEeMQbfWq?=
 =?us-ascii?Q?w4ytgnXNtB6zf5PQr0FI6bgFIktVuoWYvOjFUHLWZm1nFaTq2cgefMSxO9B6?=
 =?us-ascii?Q?2cKfUT8/i9g2b6c4jx+5Pn5C8NL81SlXR8OSAL9222KG9IG59/6EZGR8jmog?=
 =?us-ascii?Q?SVOugCRl4xVWwX8gQ4Gh9jiosHB5e8ulk11Hvy+nFO2WyxPlnTJJhiBO3BNv?=
 =?us-ascii?Q?aOLnTk0zW4KfuJeOmp9QCcTQcxHrmkfHAQHFz7K1ak7t1WMyJA3ye5AhMTvS?=
 =?us-ascii?Q?+n5hj/t7Q5kbdVAHeG8KgTHhypXmB4BVRL0LfoeQDfBcqGwJq2i7Ki/ItCAr?=
 =?us-ascii?Q?AqMQdklnydImeLfidO4dMMNPRqRhQfFj7RiaL/JN4MvbrlF6yA/cxiKBkVUa?=
 =?us-ascii?Q?PoyEutw7kLrzjgrbH+vH3b7TjPTxIxOMMGSDOwjf9cagcfkZNxUOn5hjBgLY?=
 =?us-ascii?Q?l8i+gGV7EMjrWyFCooHtcgm9KhqOReia56QAFwYNuUeuqBk682fctUngs9hg?=
 =?us-ascii?Q?CPjHpT5Xocf0KDK3+QmkfIvb4MwnXYh9S7RyI/NnzjY/6rgQxxk75Cnvs2JP?=
 =?us-ascii?Q?xZ+WpeQbbHnkWGnP/v80sQyjcLlsyJ5g3amHRDQds0MrQ0t/BOTkmJDPOl3W?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64fed67-679a-48bc-980a-08db2f57afff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 06:43:06.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykYgB5clXcp3KjJtSwT1/v0cNos+fW80f/4pYOQeG6h2UNPHp/PwdOk8tyV4uUZx9rjG26msUCoRPhrMg2qU730HL7mQhxfbKgBD3BsQxB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
X-Proofpoint-GUID: -YxKceX_78D9wA4NlcRljD90TkIHgshL
X-Proofpoint-ORIG-GUID: TX5Mzj4-gn2m1hVhEAh79j8sFxVqHVQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101796

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++------
 .../{protobuf_3.21.12.bb => protobuf_4.22.2.bb}   | 11 ++++++++---
 2 files changed, 17 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 36c3c597a..7c4bf260e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 1c7ec8d63..85f591231 100644
+index ef7a4ef58..7206e14e1 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
  all: cpp java python
  
  cpp:    add_person_cpp    list_people_cpp
-@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
+@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
+-	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
+-	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
+--
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
similarity index 86%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
index 343933033..0c6b446dc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
@@ -7,12 +7,12 @@ SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
+SRCREV = "81f89d509d6771dcccb619cbe26ac86cec472582"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
+SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=22.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
@@ -35,6 +35,7 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_LIBPROTOC=ON \
     -Dprotobuf_BUILD_TESTS=OFF \
     -Dprotobuf_BUILD_EXAMPLES=OFF \
+    -Dprotobuf_ABSL_PROVIDER="package" \
 "
 
 TEST_SRC_DIR = "examples"
@@ -52,7 +53,11 @@ do_compile_ptest() {
 	cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot-native${includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot-native/usr/lib|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	# Until out-of-tree build of examples is supported, we have to use this approach
 	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
-- 
2.34.1


