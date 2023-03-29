Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2E2C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:08:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20769.1680084516003055013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34523aef51=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T9wHq8012379
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php644nka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TA4vWR028253
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php644nk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 10:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqMZB8T5iTnYpjHejaOw1M7vRKjrDdMwZ4NGHwk1qcQ7FNKgUCX1k2Vb1bGDZ35INMZrRRPA7ckMmUnkcKOdCrnl6E2FALMwjrAhRfrFMa5d9/Z5FlDHUByBQs8RDGabqDY222dA/tMwcGOxmJ80c194+SHC6O9YmrSKVXKrmZqFsoVh8hf2r7EEG7N0QWlK1PKSyQdyxv/Z+mY2ORdmbtRUEi8ecpey+j2ZtcO+mqWnm2U/g/pUJ83uBGsfP1Y70l8FRqVw3YLvt/3/Am00VmJZal7miEX+HpDrWOfBjrOQ57ijFSMZ/EQDOrIV+xJ889xMVn9aWX5hgfJfX1WVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXla3TXP+Pseh6R2GDLIDF4avGpX4ZnG2E5v4j1peVY=;
 b=ecwjjN/XXC2fS6jsgQc9O96f92HjAeMrKA+6f7H1005UA4iqbNuvHRdB9+TLdKkIXWhGsH8VLqVLFPyIZvBc3BL5V+s004aPiAcIkidFw6LUfui6IEZHreVVj4O5hX0P5E8Kp5KLDx3sfrUEAfR3fhfN+sNaMyctGIbN/5dJh9i7eqf9q5KsIk8um4Ex13iCNEcn7PZ5YMTFoLqXWlDW1qUR8W9YpDvbMJfQE2Vmw4OgdkFFqPRatx2ryfHBcTwqel4T7w7StgnAyPmTWf5SKwooJ4nrONnTvZTNYg7f9yzGBLMsetiLydXbZOsDItMgFB4/rHtUki/hekiCx0oKsg==
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
Subject: [oe][meta-oe][PATCH v3 1/3] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Wed, 29 Mar 2023 18:08:08 +0800
Message-Id: <20230329100810.705855-2-xiangyu.chen@eng.windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6bcdb631-3e26-4bd8-c50b-08db303d8a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	boJQvuCuxV+Ows20aIOU7dkjqu7MPYkG761T1T8kURy3rIT4E7qZ1x9RSohM+t93MbOSNMJpuaO3vdUrzhwYQA7ZNnQcC5kdqjmLXqNd8uRmhFGxOjPSpHRlPvRQb1MV340B33hOw9tglu1RqXzxCBnxbZ0ZatQIAk9T8SHY2hqjQygizEZYX2ko16Js2327irhOOtyA+F2v4u9AFZFZnytCdBS6ZKcKrcO9wRP6I3a+jx2n/2/nmLB9Pxpsnul/nbL6/6QOggs1x9lB/JkcgZVP6cFJwUw/Jf1wlIb4D6LtuvJxSOsi71zpiZyrzFWWNBR89vtnnZyGQbVKro9UTIzGrvTTxLnofE8zgyMNv+5WCLmyHIpZbuTtIaofQkR1YP5/2tY3vOPQNTj9AoEkboC8gxdC9fquBoXQcwcNsYGgh7Uze7pHUjEefEn/i+CxEE90vF/wI8ZycahNzxbHHHilwVLfu4i2SoXOJUcR/d7Rm1FAPLT6Cz/J72D5jNg0nHXEsT1f22tO8lA69XB67Ra+tjwdSoljmb/eaEbLDK52mBefKaeQ9sScyLZMqqcpomUVDvLiak9YrA2kRMxJuT5t6LCpHgydC1oPHGXjpOFu1DEDrq8eI0innA64j9ep
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(451199021)(83380400001)(6666004)(26005)(1076003)(478600001)(83170400001)(52116002)(316002)(6506007)(6512007)(8676002)(66476007)(66556008)(66946007)(41300700001)(2616005)(6486002)(38350700002)(38100700002)(8936002)(44832011)(5660300002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LB4X8VpTTYaGVI/MD60gPl/SxPo2Hi0fL0YOHOD+n/uoouusQLf8z36uSQb/?=
 =?us-ascii?Q?iYDdOUIg5Y1TfWprrI71aKbf5ua+LCgizoBYaYm9bji/PZDSebT9OdeIyW4h?=
 =?us-ascii?Q?tF2lwFv63rELZunlc7MMtsH/L3JYfn7CJARHeUKGbwP2+SECAIcw1/aISTtw?=
 =?us-ascii?Q?bnv9xPjborKsPAuc96cSs9xUfAo+79hMEgekO5E6mqJ7a+qvj5hUxm/CyG5V?=
 =?us-ascii?Q?sGySf2d5Hxy1JYNkDBuo01GI4elNhZTqI3DM72bAm0t3LQbLwUqaDdvSC/gK?=
 =?us-ascii?Q?17NvTySpecx0iIEyIvJqGuDuFs9uI1oqN5KUzmSKVTHQ8xDuaShN28cKeWJp?=
 =?us-ascii?Q?31dC1x3YY8mZBf3sU7PLqLB6gud4iuCH0VrVF6BvR1XrRRGPsCj4zF6DxO2R?=
 =?us-ascii?Q?Hb/cyitAjugsTvmtyfwimzBEIB5a+AIeUgqYP9BLmD48eb/MOD98TOBzf9FJ?=
 =?us-ascii?Q?jKN8NlaqdNC6Yjpa5Ek8orxUKOV30Xfwnr7YkPtGOQbJi+c832CS/7l8WPC/?=
 =?us-ascii?Q?VI0R+4E4u71Oik/xN+4OehV+H98fax+MIbkbh+n4OpB9HJ/y8SOIKDJ7qzfF?=
 =?us-ascii?Q?ERsygtE3kHrAUaeE8N+H7KB/sIoLFxM1F0qj4jqX5v/X+c63+JqaDtnewNU4?=
 =?us-ascii?Q?yOo4YShBIf1ax4G0QRRx89cYQ9Py2xj9GtWA+hOCFc0vB4vjB/oLvCfskjMZ?=
 =?us-ascii?Q?tMfZgT84gy7dTJhasYHY1YqRQNFkZ8OLZ1kuviTHiJdl1AQyiL6fy1dHKyPg?=
 =?us-ascii?Q?h5TM34w7b9uOvuH+ltBKLpMyIPsCW/9+5ja7Dyp+q2gswgq0ETGzB/EYcFhU?=
 =?us-ascii?Q?UjSo+ETT/HOgRj8OXp/lSPOaQWc7HPskO8NmXGbrAGE6Z5qZjLowqP0rLzXu?=
 =?us-ascii?Q?EFu8gPzbti8qxnRPf0Xw+ZSxyKkPvrcDGmTrl5Xl04yJZ3U7EWf/aZ46D7QQ?=
 =?us-ascii?Q?eluENrMiXoB0HBnKZHSZoQnMtA1DGJzKdqzNo3WBerB+fqkZ6aOUnnZ9cy7P?=
 =?us-ascii?Q?F6uVksvhr6YASmcZnl6AOx7i7eFrqE2v+dHapeqhcp/MxGWbr0+EMpBBs/6E?=
 =?us-ascii?Q?9pRIfzZTG2xadsQ2NTKMXxBIaBDlhPLax+zE/mcO3rYaYH5tIZYEgyLQ3v0K?=
 =?us-ascii?Q?EOqIxW/xARdCDLKC7A/83jV15K6S0ki8WiIvnHT0kkEiwzomjUMIi98Bqqm+?=
 =?us-ascii?Q?++tRHr9eKIG5UlwfA9DPtd6ECzFwlh51TLkw9OKz+M1dIuyzuW6lks6qX2fD?=
 =?us-ascii?Q?W6ySaf9wMWvTK2CDGvgybHFTEP0aoO0XivBlagRTRZndjxFHelv67LK3rAEA?=
 =?us-ascii?Q?wDNWwoV423IG9u2faAcoKfkVpAy94jX1jf8K+1pV8l+xXHtsijC+bETG/c15?=
 =?us-ascii?Q?bddkeks9tyWxIBOKwZGD1LvgvQDdyF/g92bqk2+PAQ4Y8Q1FhmXv7URWOPYX?=
 =?us-ascii?Q?nSI6LJFXlBUsmNSW6qz+UN+mhSkm2RipiC3VxOsPsSsbbjJkVA97h9baEXlU?=
 =?us-ascii?Q?IXPRCrf+bCMA2uaBoZf9GjQGZ+e8PwDHzPRwfpAhMrdmb//+p4T5eSmPk5xV?=
 =?us-ascii?Q?MxR63QkPHOh7+LxCsgXLu/VHP/nKV9H6KF3YhvOBgTMw0gBFcEtQ6EAZRka4?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcdb631-3e26-4bd8-c50b-08db303d8a99
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:08:28.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHlmj0owOAzVRWCnHJbX4YqTYKBW34KI9CX9Uooso5R1n8ZpF5Ms9FwN2WmkQVlJ4U2vAb3U0VTFug9UKpP/uvxeeFlzxKOW1QTf/t+jGUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-Proofpoint-ORIG-GUID: 24zqr30ErX5r4GzN_yDv1f9EgdCzzANP
X-Proofpoint-GUID: FKsuiGG8fGb1U7s5RxQo4-0rOqkViujd
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101814

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


