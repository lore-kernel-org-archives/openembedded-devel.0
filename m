Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588EEC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:42:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50662.1680255726686586395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345418c051=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V9dTMk022998
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php647qp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:05 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V9g5CO028210
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php647qnw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 09:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpql81gWepHBlJXMjzKQU8r1CtGGN1LIvJZlWwje6PAuUWZ0rq33bkoNOQKiX5OI9ffkA1vOzTLkTenegpNJoxT8TJgFEFq3w6u4Zz4ums3NhYbvvBdOZrHGLCS07IuJWzVkhCYPRNrk5Z1eHadp76TKk1AbMOKqSeYYCE4d/4OCmOs3lPfbm/JKz8RLWhp8Gtm5Y+kHsmuX7OLcib2H73Mu+Wo0tAuE4u2Ruk7KN4GP5qv64m3RREGJxsstAyhM8nDxUd39HBvkkFRq42kqNY+MB2fk+YMktt5/fkn+xMo8y4vuZ649aCbfEcqkL9Wb21k4IVVoyhxA7LUHHOB+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZUrgn9HbixK6GiTTJSvT4kYtDKvLhYuMGVv0yL2yJo=;
 b=Pxe3MjE5zx80d5ThQzPuul22coY7P1XMks4DDHhOL345fPVlJEC8Hb1oit8ILdwA3CIhIvXJTtpprvsHm66dPNpZwXUAdZeoeoF/a4xAQlO/+TobJq5aIL0MALGE5AYNZbBQfGj29yFxqI7mNO6SXeF6viNIp/soc3CD3Qw/m6KYoVDTP05LZd9mPDHck1c1yB0Jlp3UI+PqHgJLYWJ/rnXVXUUfB0ex1RCWZW3gHUh1hESxeO3STIBj52Zd5dMkDATNwwXJYqNX85qkdFgZWI5ULN+EHHpEj4OkmihtHSRJ7mIkbBS+/sxPvz83O8dLMHO4ZJpkQ343uEUxCQCqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:42:03 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a%6]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 09:42:03 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-oe][PATCH v4 1/3] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Fri, 31 Mar 2023 17:41:43 +0800
Message-Id: <20230331094145.2362159-2-xiangyu.chen@eng.windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 896c4f01-4e71-41d4-5e4f-08db31cc2f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MoRxoNe6Stz+q1efa5ps3w1VgudtyPxqSGgKbSkapDV6WK5OUwb3Xm7CYeeRR9/Fou2WNAkV8d1zKc6Zq1g7Mvfvldgws+zltYfVPt6ONco7aN67KEWyn87wnUaS5PXjcvnc0M2qsEvLmFsjOsUDgJ9BVrJFL447l4/1tTY2MTai8UEgZnmkh13aQK1bNz1QR32W2zXTtxR+KFjnuUzPqXcWEclP1D82sD2yYIcA4FpBbO+4gOp2eHIQLS9aFvGachBiM5/JSWco7iFNd3a8amDrKu59qiDwrP7Tr69ZXtbkKn9OBJLUcLUHMMC+l+6GleE4GjB6+LuwNNw19MuPOBISocVa4uZ71hdKPiAHGPVGRzGfiBNqBHEU80HtqZt8hDSr7CS3ABGOEFg/8lx5A66+R9GqhwI5TF6CyX+Fd9XrtP8/JoRB2DPzUIsjtL1iuZXYy7ilkJwo3X0nOqu9fbcnMePjhtPwgpvAh/ST0xZjucqWC/+ANVoDVjku2Ws+t2vIxmXzo0S9KKU8W2o4GyTio3ydsvzf2mrmKpfTvGpy5eziJmxuvprIlTMnoewxO8AU3QiHvIuNGfZriAfHW2bWKL8rW8YMbgs/WovYH1ebmRPm08KQxLIsNg16eBGZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199021)(83380400001)(2616005)(26005)(6486002)(6512007)(6506007)(1076003)(52116002)(6666004)(478600001)(66476007)(316002)(186003)(83170400001)(66946007)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38350700002)(38100700002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M0s8tBneBfbdT61FT2fPOBGZsGxnh7LuMEcDhoFxo+FSW8wXOG31SAP7B32/?=
 =?us-ascii?Q?yJ6YSQwAYrgT68+jo6t96gSghdF1v869X+nbjlb+yiSU0tI2DSppIi5prA4F?=
 =?us-ascii?Q?PT9iowFe6GOy1gEicN4OPUOi/LsskwgmSwL1TH6HbBgiWeSp5aPZ/VbusyJH?=
 =?us-ascii?Q?uX50FafX4MoGqRtPPFxn4isJi+dW1k2ilvw/ngqnmEfTwlak4dkbJ/Qfrl5a?=
 =?us-ascii?Q?iwMfMCMfV6oBo0ax/c0VxKV7LBFqGzxVfePawwirDbwU64X2eTwJRlewtfh+?=
 =?us-ascii?Q?u4NZdHjkTB+5ayHs2+G9aZlcWyRCd6y419V8sJWNSV5/bQPUSlm9aoe3vXDh?=
 =?us-ascii?Q?3IRT/bFw+pZso5Vhf9i8BHV7jsuSn4GW7BKnqTEImM8ZmR1G6TZo2ET5NT5o?=
 =?us-ascii?Q?QF35dVkXr7ppQoYxRcJ0F959DmlZBcrY0b9/bzXWRph9P6s72qhjFne4GI9w?=
 =?us-ascii?Q?8KcSp/eq5WqfJJTlO4dqF+Q4mkiQt3amuPP28YQ44opv1yJmG9FsfAbttjYr?=
 =?us-ascii?Q?g4WzwJv1J5UXUD9bX2PnR7n+j4ZgifPzj6dTOAzaGt3BG77Zd/OLYf9A46vZ?=
 =?us-ascii?Q?5r8BJDxXQPRIAbHNB4yYwzhSeifSwXH5NwJ5mOmFnjYrOUiCAJP+nOtl6r7T?=
 =?us-ascii?Q?hBrTjntJMQ2+O+mpN+H67tQX7TyWzd/fZp2i4Qlh0WvBfqugOcwT/RR9UNht?=
 =?us-ascii?Q?Iz8JL3j/W1vQ9pAR2e15TvHO4ulNdPVIQwkiC8HTWEhXYWWpM7Z+tBGNKD3U?=
 =?us-ascii?Q?Ndw7T291SkvII7J5Z9HScOKWISVxvDVAB8MFxkPHPdov69Ks+9EYeNZdDKb1?=
 =?us-ascii?Q?pCwXJ7+iKzM2Wu3M97nd8m4m0nCagIgNREmPpi2FYVb5+Stm2IzKjXF5a/3B?=
 =?us-ascii?Q?Riz8woFRS8zIHrFOnkqy6AP56m/8jegaUDdNmeb9TWqvpu//mc9CVtc/5gbO?=
 =?us-ascii?Q?YuqDFI+vbQP8ECsL136iPb69dtQzNvkNDOXbJ/nMTeE+ZXIJmEFQZx2CuB2w?=
 =?us-ascii?Q?tNS2jBRefczxhIrtLl4z4jwI1E+ys6NOWNXin5PpW46IwDyo+D2np8vxFGfJ?=
 =?us-ascii?Q?jToVfVhltlm4abqMHmJKxBeNpmm91ecSEJd8aebVgzROdsG2pbsbG0joU/vp?=
 =?us-ascii?Q?dHlJ54YTq1vuNMPpYKlWGrtZC1VozatQu8FXmu1ab/N9mnXfeYvDEpV/bIFW?=
 =?us-ascii?Q?Hoh4uxvEvG37sidX5h1L8IxZZjqFSCsHb92sBLto969qUxY5VWgnVDmC+cgm?=
 =?us-ascii?Q?RjzZGjZN7DG/VDv8skE+WILDCj/t3BAcXCUf6sBTaXjM+EsB2ejzXXniB9Zb?=
 =?us-ascii?Q?MWxMyuz+EFStKlRLuWQTwoZkkzRi2V5Q8UaMog3eAeQETd3yrzAvxbQZ53wM?=
 =?us-ascii?Q?sQI2oSoXi0n2xtgw08jsss9+0wYIji+swe1AoX40QJCAva/5ZLHTeSzVFVP3?=
 =?us-ascii?Q?el0sM5grB/QBAgpmOaGRuPEas2KCYdfkBg0Rno3F9Q+F4aBWojdMttwnHkyO?=
 =?us-ascii?Q?/fyHuo23lEhvMYdN4jCE9wEYoajd0wlW8mZ+SBykMq9gjjxiGGkJPF1hb4Vb?=
 =?us-ascii?Q?5bhvFzwBxlZv+2U6mvU2cBUDWCXsq4HzYOeIBQWccKgSQ+QREGooB8PartUP?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896c4f01-4e71-41d4-5e4f-08db31cc2f00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:42:03.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1B37YuedsF0Un71IrdpFXXmHT9T+W4So2loSRKT/YHOhktuvWFobX5gnN4MpWrLbOoVL5bt3sdllzUIUDKk9NPi91iq2gtRFEFx4NIDTOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-ORIG-GUID: k_KT7NPlSQ_EmOoYAXVQsa8KUrZqXnBg
X-Proofpoint-GUID: qxixGxh8RMNRRE2iJgnWE5R_HgY0CoCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_04,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303310078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101849

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
index 343933033..f99081b01 100644
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
+	sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot{includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	# Until out-of-tree build of examples is supported, we have to use this approach
 	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
-- 
2.34.1


