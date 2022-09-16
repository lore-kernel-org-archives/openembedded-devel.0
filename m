Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99560ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 13:33:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6017.1663335227696361215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ockXYFRV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6258341ae8=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28GDX9IX017052
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:33:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hQ1rjmtS7SC4wD6ygJdhYTabxepg7ObW9PQDJ60iCCk=;
 b=ockXYFRV+sMoQ4XvWMelAWsW5yilVCbRbftzBXVPvXosLb7n29ByKVASSygLvG4TOy7x
 +rhfue8r1GReFB1SZnbw0Q3VRG4xGCQ0AmUhmvwRV+aHJm5zGsZihCJNgVuasHx5Mc93
 MK5Og0d/RBJ8bA2D73yjC/FMUN3mngC84pYCB00VGZDBXTfqfPH9Xte0kFeab+xLhjG+
 3Fi8nm7Z5a6H9ai7KVLjXy6lFLVx2SwhX7BwEuKJw9aK7clYXC818Ydpl4sUBITAWHY0
 mR1Uf0ZcY0gbMUbRbnviZJTil2R3Doc7zdDducz+IYU2KPTw7f/unCO67LcuhydsfRBX bQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydrpt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:33:47 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GDXksQ020656
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:33:46 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydrpt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gadgrf9GeVh4C72AnJYFcqztBODqBT8tgo+eWxby3+xQ7KR98NX/cTa/1stFrP5A39cX+ztyA5VBWF6jiGW00rV1EDVmCTHE5eUyEIHGFg+9/bcirsSKdcSkHy2NssfpeVv4kKKLORUAxx+iFap3WSU7wgsw3+jho7L76/iRGnsiKmysVJMS3gCme4VGjIwCEqJB5irv2atdJkyMuRGLkzKmA55KZz0Rr95mCICvXM7MRWYE++BFVByp0VUdbynToEAAl43hYoK83ssc3+TR6FK5PW5LvO8jFrI//dS1ObMlftQJF8L2BXePMGW5aBptrIwbNHKTF8UgOnob3nraaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ1rjmtS7SC4wD6ygJdhYTabxepg7ObW9PQDJ60iCCk=;
 b=hdLi2t3FUykHvlXu8WZinE5ph1WIsLmSX1sayFCR8w/XwgOLL8SRJN20YEaxI+8UOii1cKsj+FXekrux69sH306EEprHlqBxbM0DfHg+njmpc+CY6bfVtZo8odHPcLXCzCZRJdxRIFZbU1ZReREIV0Lr07V6pDw+W/xa/AIu/w6uwAKlZGCNfZHdMeBiPEBAKB0oDtsEBLK/xp6KycJAatIqq1WfBCzxgJjegdsjYQTVjTc/3JRHj+SH75LHqQqU1P2LGEntaD47ajsLLGP037nLdQQmODgVt+ms/4YsrG+3Tg6xKoDkXkcYHy/eCtnQLAMLjmN0w5ZyLz7AVRO6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 13:33:43 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%7]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 13:33:43 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com, zheng.qiu@windriver.com, ross.burton@arm.com
Subject: [meta-oe][PATCH v3] jq: add ptest
Date: Fri, 16 Sep 2022 09:33:16 -0400
Message-Id: <20220916133316.36893-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::28) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: ccefe3f1-ee89-4813-9462-08da97e812d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhiQ4PYPnr1yFMQ5Wlf7wenSx3Wbd0GYgWR1sjmk42yWBNJcyFX6q/kEonPf+Hbj8jhmyfSvkNvrBSz8upT+Lkn4XnGF7p+j9HQG7EnSi9POijsSVlKTvqfVa/CppWSMcaVFO+gywtmCcH2te7gggQ1ZDQmVi4yZIKLm2gWFM2MoxuPCwOJtudZlC40V/cT2beD/mx2ITVexBf4ZELJWqQVCR9+IiR7vO6TtQRRRSZ5MUxkz0q095P9MonC+qtMt/Ih8gslE/9QXOnf3LLdY8sZWPteCacnwpxkZ9mCv7e9yJnZoRzmyi7CTkOPapqsFvVPSCNscoRqKJVW8VZuhuZZXw/AOLV2YG1xQsDoI3+szbPJA3YHGoBxvHbmt6ZzRxtLdnZ016prx28ohPo0YCMi8uCkzMKGNyRHdJ//SXLZ76XjB7Co2qI87HqSCkAGcP88YuJC1p51M3fIiyMGOqua3r/KleXHpk4pCQdKGdsH9QzOV2RqbTcZdrqcLvRmzme69ReivB4z6yW51UrdLXhZDQbSZnbxC0IH7dEvpdwGcs2cTczc5OoR1+xrlNbyvJUL+JdzzWAvGf/z3mayMwzBsxoSLaYYIm0dQN9i9RuPGmF0A/932ocbkustqZb2i2+53mzdwb6gt0UbXwjuyw1ft6iiamUD7UYtqDYGZN43afuhw0haudCaHvT9I6OXttgZOeDPA9xTMmA4QJuzvMU2WEi4lBxEnGpl+z1SXqChF3OhgXqjvWX/V4wMAVzWq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(451199015)(478600001)(38100700002)(38350700002)(36756003)(86362001)(44832011)(6486002)(2906002)(4326008)(66946007)(66476007)(66556008)(8936002)(316002)(5660300002)(6916009)(83380400001)(186003)(1076003)(41300700001)(6666004)(52116002)(26005)(2616005)(6512007)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X9hvMRbf9NQJYJv680R2vvi2iWl/mVjOPDcm96B88tvV8+6WhX8n+M/rS4PK?=
 =?us-ascii?Q?12aEsW+ZqZTlgJSUg7DVTFzy+NSQAR+3FETDUzJ/gkXVpmc4ntRGsvrE4qaI?=
 =?us-ascii?Q?0zCFNtsX6OUMpG9jcSZ+/zZbc9Cov4g9dEpjcZADcrqEkj4SFpPkeAOR1wa0?=
 =?us-ascii?Q?4y2PdxkIcE44BFQ/gkgpJjdYOq5ZNmyGJzu6O83mEfqlsB5Fv0DfUcubPBXB?=
 =?us-ascii?Q?Nz0Thmws2bqGl3vm2bcYBLIcmCfB+KxGs73G2tYsRY2t9GzxQxM/XRXrXJ0Y?=
 =?us-ascii?Q?fkv5dY5nCtVw0tiIVZpSGpvaIbqtiyDpVLgnDNGhlhThk1bRefVNBrbm4VPI?=
 =?us-ascii?Q?74vaEKuaFBL3irUTDCA1FTtqg5QIKpdvyov1gUWcZoFq9aIY6MH3vWX+485n?=
 =?us-ascii?Q?XkkTRCnHLdk0vK49p7pVekkxTva2+hXNbDhOywShxCWdkbulFSAkTRscATtH?=
 =?us-ascii?Q?6IA4KnxxN5ULL593y68vWV3ZCj8Dj/wrwe5/v1oPmdDJCXnQKfphtuWtd3r/?=
 =?us-ascii?Q?LonoWSs9GKxGLvywBG1RUKowVYCO0q2efWmttgU/yJU13WflnTHc73gwRhbO?=
 =?us-ascii?Q?aOtwZ3ohl5HUaq/f/jEDJfEpWYyw+qGR0Pu47Fvl+asfZW1GJwttlZ8zGBOS?=
 =?us-ascii?Q?l5xxT5TVjETXb1uZxSoLoczBdDjzwAQxD4/PV1Tt2uLao0GCi8nvBzaCl7KY?=
 =?us-ascii?Q?FgJLYR7D+37bYPA4rN8J18exc66+rErj3r/pDe+smLLxZOcRtLGXmPlwtrqg?=
 =?us-ascii?Q?rUMshbBzxHb7Ey5WFNUXC0IDFMovwW2/gv7sagKq8s/C/FQ+Wx+f1gogGFze?=
 =?us-ascii?Q?F71Iw3acQ8MSUhA19RZZysYIZfk58xDymAC1Er4m5CPLshFhxdtnA2SukpW+?=
 =?us-ascii?Q?aFvEcBvWf+Mp0vfRnjcOD5dK1D4wsxMWNz0YYe6p9Fiyhq6k5qfYLLY7Lun4?=
 =?us-ascii?Q?VMYdlWmylumqmCNZ2hjc63mZGeAoS9Hs1dLzUlJWIvUtWL5cpsF1LTVm8F7X?=
 =?us-ascii?Q?YEK2vChqO7IBX5W39tLGdHvRN/eZCxUAmMcok2MTX1P9fFFa0GzXaOS/49w1?=
 =?us-ascii?Q?5ahOTGFS4j57HD0BwCfV2a0jFJNgW3ivVTzYfiTbruMF5LgSOGe3T3oIs42C?=
 =?us-ascii?Q?Zp3sgJENeAgI4iNdhnZeSQVMyfGzUoNK9hyFaB1U1+8WeE2Qq2R939WI2rlA?=
 =?us-ascii?Q?nRaPpV+q+BLyCQG6Bsp/CPLq2zVVaAd07O1aqFLqKuaGaibgTp3iS47ios3a?=
 =?us-ascii?Q?9XgpAwh0EpWq7MHYadM2yl6TsfQ6/hHOk3iNJC+4eXyVtFxUtO8Voi4C/MPc?=
 =?us-ascii?Q?5n89nwh9EQ4cFTkjjJlQXFGdgt3pZSR6tg2ECjTqw1r0+g4NyuplaGAMDs0G?=
 =?us-ascii?Q?rKx3PQs6Fi38++Ckkgpwvs7/94awFdIfm7hNTDCKAQkNLaWszA8R0Iz/7GeS?=
 =?us-ascii?Q?32aQR1WN0AWzkK3t7mjHgz+VoRrqO8pqxZT+0rG2yozhZ1o/yJYWLEVr8JQU?=
 =?us-ascii?Q?zLDnUFRMqGyqBzzQOO7yebpauIu7Y9pNK9hvt+E3BqqB1lVQ+jx+UDQu+dh5?=
 =?us-ascii?Q?H83k/X4hwjiR1Fg439bpgFPGwghzYr8ZQSInrxfg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccefe3f1-ee89-4813-9462-08da97e812d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 13:33:43.1412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ertLyyjsGiGuQ5uHLxZ0Vnp+D3kIBIX7178Mzb8jOHHkDbf9557VLSae1KCAsFRzXvpZ9RaPUESbK+H8ks1rNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-Proofpoint-GUID: 5kv6wCjVKRpDvn7GLqaq-SD2c1Xg3UoF
X-Proofpoint-ORIG-GUID: ZrIs-KgFRb4rFSFfICrMfDQ2uEhgT57Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=562
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 13:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98836

Add run-ptest to run the 7 tests provided by jq.

In do_install_ptest, add a soft link to jq in the ptest directory to avoid
having to patch the jq setup script.

While the jq tests can use valgrind, it is out of scope for integration
testing.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta-oe/recipes-devtools/jq/jq/run-ptest | 11 +++++++++++
 meta-oe/recipes-devtools/jq/jq_git.bb    | 11 ++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/run-ptest

diff --git a/meta-oe/recipes-devtools/jq/jq/run-ptest b/meta-oe/recipes-devtools/jq/jq/run-ptest
new file mode 100644
index 000000000..0e4c707e9
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+for test in optionaltest mantest jqtest onigtest shtest utf8test base64test; do
+	./tests/${test}
+	if [ $? -eq 0 ]; then
+		echo "PASS: ${test}"
+	else
+		echo "FAIL: ${test}"
+	fi
+done
+
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index f69b435e5..c6634cd30 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -12,11 +12,12 @@ PV = "1.6+git${SRCPV}"
 SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master \
     file://0001-configure-Pass-_XOPEN_SOURCE-when-checking-for-strpt.patch \
     file://0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch \
+    file://run-ptest \
     "
 SRCREV = "cff5336ec71b6fee396a95bb0e4bea365e0cd1e8"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ?= "oniguruma"
 
@@ -28,4 +29,12 @@ EXTRA_OECONF += " \
     --disable-valgrind \
 "
 
+do_install_ptest() {
+    cp -rf ${B}/tests ${D}${PTEST_PATH}
+    cp -rf ${B}/.libs ${D}${PTEST_PATH}
+    # libjq.so.* is packaged in the main jq component, so remove it from ptest
+    rm -f ${D}${PTEST_PATH}/.libs/libjq.so.*
+    ln -sf ${bindir}/jq ${D}${PTEST_PATH}
+}
+
 BBCLASSEXTEND = "native"
-- 
2.33.0


