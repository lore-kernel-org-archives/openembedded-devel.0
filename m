Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F131DC74A5B
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 02:37:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26083.1679884671106119684
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 19:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2450feaf8c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R2RVTr017149
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 02:37:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbsfsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 02:37:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTvd6xe8el1XBsEMVZ1yqbroxziD2uqbbwguqeM7fJjuaOsVPwCnB+70XvGD0LfzWGph3p2sQVz20X0kC1eqmOOHe453RqR2QTwGyTYnm9dVMDX9mIGCXcTMoCt7C2tMK2g1mR4KFQTzYREewZzjPdz4labKuPR+lViA7Tev+F4R2UoUbU11Nwn1kwXX9+jtJ9w8munSKYyHX9VGCicvPyRY0ecscnaimMBRl/8ZTtsq6QiTD9Z/qFvMB6fx4eIuCH88TgIoCJYgxmvvX5Vl68/FNOtZLGgxFi6b9YAFYcSnbx4LgcR+mBA4K9I8rsqxsVXtU7larPShbgipdqDT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXla3TXP+Pseh6R2GDLIDF4avGpX4ZnG2E5v4j1peVY=;
 b=Jt0aI1XHbyA0uoKJR0IjnI50nb8gvYKgx02x1QAjmz1sWfMdb3C0s84GiNrHMYybKIbNwWnHcvP2oIZFKu3qWciuRkCFuf0OxiPiAJ4gr8v2PYnmo2flEEHh2yip7Z8wNG1vKZ686WiKTc/lqsGLhnhAe0wQosVVQ6hdscoteo0/Bj9H5QvUCMs44MB3hiO8hP35Pult5EDGY3vhYcDkWAh1PW+aZmJG8dQBtH1ROWwQ8sOQ7YVIcWQNz/ho+o6S7u60KtPcTCxyGQrnOzX29h42SdyThC8TFqMxuybwAuJJ/jsWI2/T+qWVqx2prPs1ya0zD3bLhgIKrIgkrzle+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 02:37:47 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 02:37:47 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Mon, 27 Mar 2023 10:37:28 +0800
Message-Id: <20230327023728.2125172-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f1bda6-ec99-4e99-5978-08db2e6c4025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5WZLgy/WfjnILs1ERxIomobRUPuzaXGTuPT1GN2tbtc9NQjDF2iHp4QEpzEDxs8uX0IwB4JPsBt/R3HEz67GSGkI1eoEWjVwT3vI9CUBHNJ0dYmUMK1dA7ZirP3RlNXftHpCTX+3VE5KHH1enL/bCxzppq/l7EoLfXAue7StrymT7KG+0Zfuv11GRqPWPvn52Hvg2zyh+OEwscu5R6BvMiY8QxPC/KSD5WV8dIADGQicDAyzEvj2K7ybr8qHoPu5cvpj0hoGiP1gld7nTnaAnCV7V+CWd9qdUzmaxfMWDmN5WwFxBjBXL9UcLjrT61AeK5Cf3Hh5dIc6f2UuRwqm7LqW8IWSUkoekk3dWMllH54lF/o4HGrd3B/3XdWBRj7fg1noy5xFSSleYxH1pJGKTJgCzJiIlPYLPMqQrrGAjj29Nh5WW7z89QfY36/R8t4QpuBsyO6zP+ygVRrL4yrDoq2NwRfMp+KXLe+a3xhwu+1QgrQWLWo4tWNNYarixZWtCFeR5BhWyZqpLW8kXDZPjRcHPAeEcedsqk+aq6ykrXGYhmqxCjq0yINRq9I5jkb/4rfsE9mtWeZcxtMKS099t5Xu6nCHUWHof6GZXTkr9HlkHCVPygCKECSRMuyrDSba
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39840400004)(396003)(376002)(346002)(451199021)(6512007)(6506007)(1076003)(26005)(41300700001)(6666004)(186003)(6486002)(52116002)(2616005)(83380400001)(478600001)(316002)(38350700002)(38100700002)(44832011)(2906002)(66476007)(6916009)(8676002)(66556008)(66946007)(83170400001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nM0GnXz7syMH/FcBsWHFoUqEJi8QdcZIa/IWTvrPbRPC5dV4hzvvfdfuDJvP?=
 =?us-ascii?Q?1IfbEhFGusx/At1RyYQqRG17qqG0kafC9lTGf8SJxRQKQ0/zoM+wzul5LJ34?=
 =?us-ascii?Q?cCx8+uiomK/VhJKdPCRRQ/DtHsOWj6wtxwjWyGWY6xgvWKxCXv9FCQiEGtjh?=
 =?us-ascii?Q?JV3kN8lvF9m5qHVqc3AWpw43oZULvEuiC6JL6ce8d30gWhJM/YAD5dWxd+D3?=
 =?us-ascii?Q?4Fh9aXq/crAzrgJzeBKXstGVUqXChWa4KOMfN0dGEa7zv56jyAfU26GUswu0?=
 =?us-ascii?Q?ce5DFo9MxvDTFs4ZedA2xkRe0hGUtrQPB4xGUYVqamvFvxhcCqXoN3rr60nU?=
 =?us-ascii?Q?3rnqXMNiyvt8YH/aka33qwZE0CQDCAdbGOEPTudOKZ/M1Hq40tcXfn3xnX75?=
 =?us-ascii?Q?FgkEdleUpSogFvmrEU2QBhlR2asleMqVGESrciWQiIp9Ote5fWho8iMkNuSC?=
 =?us-ascii?Q?+HIugcfxa2M8DayI7E9TQ+piyDukVsyyaGl91/68x97FN1XVqUuezR6GWlsi?=
 =?us-ascii?Q?jaiSifUIoWzHI8aU5xW270KzMDVMRE6nDYNrElOKa1PyPsT+l83cYF4jo7y/?=
 =?us-ascii?Q?sKRGF39aWIY3qb8Efd5kbdZPLvDKJWe8C1Wf45R244eNw0ayju/AF0p5JPHC?=
 =?us-ascii?Q?nOLRwQuKr7TVVUsjhrGgNDH2PUB1eFSpeEkn7ubtNI/aQhwPR6W37aYe17Eg?=
 =?us-ascii?Q?vWJwY3OxU4fG56wkwOflX/7ILkLMMT7TTC6C6LePAgZOeVGEBgCsHAxo+bl6?=
 =?us-ascii?Q?HUqmGiV2hVqaMBER8yrQLlkHjL3dy8vkI04mSNMxFJ2J/3/6dNbcC5Vag+w3?=
 =?us-ascii?Q?9/E2/+I+7RTsvbDj6sTygmuP6gKkHneBcQRYbzRLMAGj8jOriG/lPeaECpAH?=
 =?us-ascii?Q?vz9o9k4gKc6uMsQmED//NQSuex2vAxV3j0g0gsU+AyYLHwhXOrAzHYmiFwFb?=
 =?us-ascii?Q?pYbxkb8nQTNY083c2L1LBjiiUtLu2RFPaVUeN96JedH2WnTq6T7ZB5pEaaLi?=
 =?us-ascii?Q?JSTxVOIma8vFFOZMYdwliesXkdnUnlNq3Z7tvzyiVVMRemrQJwH6lWTYq1wM?=
 =?us-ascii?Q?lU2phrT8NQtuuK5lrZjpxstedD6qOfKP0o+hDz9wosBb5DNlFJ4DOpdgPWE4?=
 =?us-ascii?Q?kUaQ6lqYO93OreyBRYGtMIPdjffv2NPxWuMcFrNmKLwBPKqML+rIpyyYWlEO?=
 =?us-ascii?Q?HpJycta9Ka7iz6svS40i7xr9MIl0pRFGFFUuFC/yVGKk7yawhCbWFQ3liyNs?=
 =?us-ascii?Q?DOrOjugGGZ/MOQXpQzR9kXSKrxAqa5QTt9CFIEe/l6LIdTFo/0DxrJa1QZl3?=
 =?us-ascii?Q?vAdtOQldzzVhtA03V6VJd7PPlC9Y6VJpiVWK0lpoFb3QpmBi1ka2Z4AD6KCy?=
 =?us-ascii?Q?V9weBnJ9u5DOj00Td2kwo1zUoM9pdbXDZ2NLGOd6Kh+TX9Lq96Iju4wBZrqS?=
 =?us-ascii?Q?2odCtqFi6HzU9aHu3859iVjXtuU0o8cxIDXc/oqvaFcHGGHzTcAPxDLKsl2p?=
 =?us-ascii?Q?A1Wn//PkLsbYNafPIX13LmXnf14CvBr4FZ4xfi/RHEj3fsQkxtVpt1nm4ooS?=
 =?us-ascii?Q?EpfSyFx7r5crJyjeb/sq6cYXEeDMpKT7dEaNetZFgV9+FgYa6v3baiRE+TH8?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f1bda6-ec99-4e99-5978-08db2e6c4025
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 02:37:47.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxl6RBZtE/vlsLiGO8QevDSFg4qikRHzLGp+GXSR7jSdqntd1ZQryOZZFTbhiu4YDsqYNp0gsTjLhvgGbmFZuBA+RWaUJ1DMjJEqzLDrY44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-Proofpoint-GUID: eB9C-kbX5eQY-pCiCGvqCFabOkNmJnb_
X-Proofpoint-ORIG-GUID: eB9C-kbX5eQY-pCiCGvqCFabOkNmJnb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 02:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101753

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


