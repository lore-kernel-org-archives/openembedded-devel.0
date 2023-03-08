Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DFDC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:49:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7317.1678283381591127359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R0MQzaui;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24318e24f8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328AmgjX017287
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 05:49:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AjCPcaLgpQM4GuXPMeml0bz7w8G1t6cuyznMhp23dl4=;
 b=R0MQzauiwP1eYu6XSJ2A1bOA3qkW1X5UQaYPA5K5Mue38jXR197yMTkNDQnAQraTpx9s
 as3qUZcqIZD69HuCDnwCOPkVFQKYkDAgVIzTkgyynSS3g/sp5QAhnXS/c0qQTHG48HGt
 xAR1xvXiQFuRqtU7+jEFBJkc4mcXu0auwsJAahJiHXyDYcK2yW+X9bEeB4874KnJTzV/
 8iUMV+tf4kSM7PZK5UM02Y3Givk5Sk4enOvD/4uGR2JxpkIBASF7u41bW3pdLt2XAe45
 mXKDIf8zi7Zz+pb+Pgu4qVLuvcJv4tEzzSxdMaOhNJoTbuKxpflvM0q4urxvv1OAuCC9 kw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd0h59-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 05:49:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx+ovWnjicKjvEzE38vXWjdhytPai7i2gqc/Ns1vZkuJICpOsI5WyKHnr2jWwLFTkeZYIcVIk0JlfGY+Xrw84tOYHzeRBHOVY6ifx6n3GzfoAD1K7mwwZxDdbS4uqtE+pAABI0cLNk6Bzn0M2OEjpTkKbsGtUPezFo1e5BVN0Gq0cV5n3USsd2CAAl1AwAphF2bGfhUgzlr1lrS57RYAZgk9xDJ5KOGmdnR3MHVJUHeOQWW6ssom6L84iTpKiBVV7LWDD/UFGHDsmDL5JvUTQdKxJPmI0ka9fn/9/CSgfzzRBVvaGLmyLLF8Gj902KhYn67EssKSydc4d73zGddhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjCPcaLgpQM4GuXPMeml0bz7w8G1t6cuyznMhp23dl4=;
 b=NHvO22HK1uoqbuKZTCHfrzsFjezgE+tcoNxXBNOVFQnwbiZ9CdlgeP9BheaBn5DZfgZQ4Xl3xywFMk/OOfTjqspAP5cTVz1htKWhYw4OEzUTWT7NfrOrXlWao76B0Nzkc23jBaHbkmPoiP4H+I15oukrM0hmh0h0USFzE3Fe91X1ntaJgOdte7Ey2XszYNBfUJIVb86UwkEc3NXwxVkDIQOkKnRnVIKkLLktkcovp8gOkf5TBy4zGGuy1QRbgQdEck4u5HWzlszJw8dVHl8/0XFxVllPYEJvtua6p4MJ44kKp+1N1ole5i9APJ8V1CiyUMx3a8LPGsZOj6C5IS32cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:49:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 13:49:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] libyang: fix ptest
Date: Wed,  8 Mar 2023 21:49:21 +0800
Message-Id: <20230308134923.783985-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: e88e5ac3-2fc1-4188-9897-08db1fdbf3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fx105ZUKcrab3/UULWSuMEhPk6sFMo2G0gNsjcC9zMpzf06w6xrIbu+dzKGSEzWds0mymWoW/BrFNahVPkoKeUb7ESknE2vUjDvQ3NXJ6uvTLJgksIhk/EI31CzlsQu4Tj5/mKS75erd+qcNrbtI5DJjfQDQ2iOinbTYY+ErC/AagU7qZG3Dd/yV5UEmrapE9sJULARq1Jkr5+YAEU/NSYViShxAsdCwmLx7YhiAkTBxxKr8kimdXuwm3yPJ5hvmOCPhVs9EKOLPZLYy2ztZzuYk7fRbGwCJrgHtHXO40EqqcmoZMz+PJHPx/zjR+t6X6/RRxcQvyAq2kI26mos7GQY5Z5SNB0djmaRQmTpRMK48ivFpxYwKYDLLXdfaDhdiS7D5LkSmmPFUMIWixKwfg8W5+Iou4xWVsob8E7zzv/noHUbWjbb8CJjYpRFg0y4SpfGMbf9BnKtbegm/pjcmVlI7hY0Wwdec76xWxk3JqLl7kEiwB/vCMv8JoJ0r74O08uf3ADTKKt7oVAUMZtdHXjg4aRpkmdXCwpUV3BCPC8QDDXkaft7wLr2c9ufcqKf8jOxG54hMLtuIR19L9KcqEWwuAI8IUpYKkDk7vL6cgEHvleDisXB7ZEIhzrSrx2IwmZpW6KNvAYOd4LQOJi7Zn1j9vf+bKbCAcqnDV+qpi8L9mZHIQsNUkS0M5d8hEdWNtjkU64JleHZ6luMcEo4m6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(39850400004)(346002)(136003)(451199018)(66476007)(66946007)(66556008)(8676002)(44832011)(6916009)(2616005)(6666004)(6486002)(36756003)(5660300002)(52116002)(83380400001)(316002)(86362001)(8936002)(38100700002)(478600001)(38350700002)(186003)(2906002)(41300700001)(26005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qBy8TdFS4GQOjIn2a15nDV5Tg/OkqcB+T0nUSx8RrRkrMivUwjzWCmuWtRMJ?=
 =?us-ascii?Q?9AE4bmFQTS7bgSPXRxZ2tQ12rBxG1X1RWnqRR49zi0xWAlZLkfzCg65h601q?=
 =?us-ascii?Q?Fr5opXtOimZmHRPq0iigH2wmmtS5j4tm9VzLxyIdwFy0IMGFt1HT43h2W4QU?=
 =?us-ascii?Q?TJNfqzksbA4D/sKX8gw3DIoAeJmkqG4ADGLn3Gt2iaAMjC9pLzNyhUKSrcCr?=
 =?us-ascii?Q?c/Wx3fpmOi+mn0T0bFn/fIziQb3g665uJ88ezb3yTv00mA+ydMmNnBDGdY+h?=
 =?us-ascii?Q?jfOqM1DkXClLI+k662no63iIV+Ss6wdEU5dRWXQqIksq45oAHbvpq3J1UW3A?=
 =?us-ascii?Q?zHdFY7LmwLYq1JfKVtwHzwYtDTpnSavwLX4c+QEKBcSjopz0/ZbiKnbACzN8?=
 =?us-ascii?Q?S7a8CZjvtHg2JhgoTPxYKP08RKB0C1EJ0f953Rv8JZpQPHnUNC2ifclyZtP5?=
 =?us-ascii?Q?WYcsjGVFLGoArnI0c72esze3MDZLgMb7Q2Rcu4UvNyikSF/zUJRuqdQrroUy?=
 =?us-ascii?Q?csaLGUWB7Bf3P2ITogZXgKcyowVuoTTmODCV8yee2rRu7pywU9ejg+aN1LBV?=
 =?us-ascii?Q?lPPwwkC5VMsylpEaYhkP4VyPxxjPy2vHw1sk2HRETu4kNmJ/PLVnzFdKGpf3?=
 =?us-ascii?Q?R9pxL7VNN/1ZiaAOWfPWTFBGWvzgjtuYKaZvWtyWF3uIuBzM7jllaxVBxHCN?=
 =?us-ascii?Q?2PLZlsWeRUzae7a2uCCxBnpb7IZk507dJ6yn6KUXv7hv8rzfHoEPoNEwgy69?=
 =?us-ascii?Q?okM/yohaTOw0g4ilPOmIDDwaueD4CRNHdx6uejIROps7Lf9P7hr3rWEua2h2?=
 =?us-ascii?Q?5sGsDwe4n+hjsPToyhjo4nC+b4CPGnmSl2nMrxlwpelSTueeuaGD/+C3q79z?=
 =?us-ascii?Q?7JBePvyqchkRZ5PaQXpBVywdFglQ+ak8XUY0twTSpQlB5wS6l697hzTR4pnW?=
 =?us-ascii?Q?IrIIwIjHX5bCvEdPRUijTapvYSj8NFdYixEmOF1w+Z7QBbTR2OTdwiZskJav?=
 =?us-ascii?Q?WMiV/s22WpgZAX30rMr+/N4GgtFMAao74laJ6cLUfMhS3l3uj+uTE+Iy/Kvd?=
 =?us-ascii?Q?k8RsIz5ljcQn0aLaHKA6+FDBf8x1Sc+e8C90Wh4TB0IVx09SlLy6MSzPaqTr?=
 =?us-ascii?Q?zYwCEQYofCI4YOov1wkn85LVeZUPyD+MnrqaH+By91ZyHXFMMkaBZUWKfroX?=
 =?us-ascii?Q?wHCG4lr700Q5YgRXLMMR44zAjldzJxM9Eaq64wAGcse6kBNJphy+bhnAEccd?=
 =?us-ascii?Q?t8HhZS1f8Qca8cjAagfPkYDsAXYAtAWxuZIV5++1Pqg98tCX1AXGWNMO0B4Y?=
 =?us-ascii?Q?M5RxM+4VZj3L8/8DlROh08T43Hb4nyriKZQYkVNSfn6iWJ8ECL37fJFr0roS?=
 =?us-ascii?Q?1GNLYg/QGBvrS0VKsHl1kVyokKnLWOW3fv94gKKLDVGCPE0P0JS99S/QChlI?=
 =?us-ascii?Q?iQBbuMI+9tWwAOdKm69M4UxVJeMoTVvA96RNDx9VWHQUEW+tsbx+Zdjy+p/z?=
 =?us-ascii?Q?XaZJpwEIxvMeODc/7I5GEoPDDqdC/tZ7YufgJI/sJo4ZXq8WEJhFmwcBOOKh?=
 =?us-ascii?Q?lz4VB4EP7v0z4Z9h8B7KAoYzQlXEG2Pxlwh04o09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88e5ac3-2fc1-4188-9897-08db1fdbf3ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:49:35.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW4cnsMSFeCtcktXnkPR5SIMIkN0l8lDTpkr7jtRrQgPmkNkz3Gg7xj/HlA8Lg3YULA+dNmVEKctRpvEC7anNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-Proofpoint-GUID: XQuBnC5vw2cKXXTav1JJibFzw4TGe5VZ
X-Proofpoint-ORIG-GUID: XQuBnC5vw2cKXXTav1JJibFzw4TGe5VZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=983
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101422

* Disable valgrind tests to get rid of valgrind runtime dependency. Then
  libyang can support more arches.
* Only copy test cases to ptest directory, not the entire build
  directory.
* Fix buildpaths issue for test cases.
* Update ptest cases list

Result:
$ ptest-runner libyang
START: ptest-runner
2023-03-08T07:10
BEGIN: /usr/lib/libyang/ptest
PASS: utest_binary
PASS: utest_bits
PASS: utest_boolean
PASS: utest_common
PASS: utest_decimal64
PASS: utest_diff
PASS: utest_empty
PASS: utest_enumeration
PASS: utest_hash_table
PASS: utest_identityref
PASS: utest_inet_types
PASS: utest_inout
PASS: utest_instanceid
PASS: utest_int16
PASS: utest_int32
PASS: utest_int64
PASS: utest_int8
PASS: utest_json
PASS: utest_leafref
PASS: utest_list
PASS: utest_lyb
PASS: utest_merge
PASS: utest_metadata
PASS: utest_nacm
PASS: utest_new
PASS: utest_parser_json
PASS: utest_parser_xml
PASS: utest_parser_yang
PASS: utest_parser_yin
PASS: utest_pattern
PASS: utest_printer_tree
PASS: utest_printer_xml
PASS: utest_printer_yang
PASS: utest_printer_yin
PASS: utest_plugins
PASS: utest_range
PASS: utest_schema
PASS: utest_schema_mount
PASS: utest_set
PASS: utest_string
PASS: utest_tree_data
PASS: utest_tree_schema_compile
PASS: utest_uint16
PASS: utest_uint32
PASS: utest_uint64
PASS: utest_uint8
PASS: utest_union
PASS: utest_validation
PASS: utest_xml
PASS: utest_xpath
PASS: utest_yangdata
PASS: utest_yang_types
PASS: utest_yanglib
DURATION: 12
END: /usr/lib/libyang/ptest
2023-03-08T07:10
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libyang/libyang/run-ptest                 | 29 ++++++++++++++++++-
 .../libyang/libyang_2.0.194.bb                | 24 ++++++++-------
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
index 1c9f8f47f..4517725b4 100644
--- a/meta-oe/recipes-extended/libyang/libyang/run-ptest
+++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
@@ -2,28 +2,55 @@
 # Valid tests to run
 tests="utest_binary \
        utest_bits \
+       utest_boolean \
        utest_common \
+       utest_decimal64 \
+       utest_diff \
+       utest_empty \
+       utest_enumeration \
        utest_hash_table \
+       utest_identityref \
        utest_inet_types \
+       utest_inout \
+       utest_instanceid \
+       utest_int16 \
+       utest_int32 \
+       utest_int64 \
        utest_int8 \
        utest_json \
+       utest_leafref \
        utest_list \
+       utest_lyb \
        utest_merge \
        utest_metadata \
+       utest_nacm \
+       utest_new \
+       utest_parser_json \
+       utest_parser_xml \
        utest_parser_yang \
        utest_parser_yin \
        utest_pattern \
+       utest_printer_tree \
+       utest_printer_xml \
        utest_printer_yang \
        utest_printer_yin \
+       utest_plugins \
        utest_range \
        utest_schema \
+       utest_schema_mount \
        utest_set \
        utest_string \
        utest_tree_data \
        utest_tree_schema_compile \
-       utest_types \
+       utest_uint16 \
+       utest_uint32 \
+       utest_uint64 \
+       utest_uint8 \
+       utest_union \
+       utest_validation \
        utest_xml \
        utest_xpath \
+       utest_yangdata \
        utest_yang_types \
        utest_yanglib"
 
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
index 548dcdd2f..16630a715 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
@@ -15,23 +15,25 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
 
 S = "${WORKDIR}/git"
 
-# Due to valgrind not supported on these arches:
-COMPATIBLE_HOST:riscv32 = "null"
-COMPATIBLE_HOST:armv5 = "null"
-COMPATIBLE_HOST:riscv64 = "null"
-
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest
 DEPENDS = "libpcre2"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
 
-# Ptest dependencies
-RDEPENDS:${PN}-ptest += "valgrind"
-
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
-EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON', '', d)}"
+EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
 
-do_install_ptest () {
-    cp -fR ${B}/tests/ ${D}${PTEST_PATH}/
+do_compile:prepend () {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
+        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
+    fi
 }
 
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
+    cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/plugins
+    cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
+}
-- 
2.25.1


