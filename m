Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A35C32771
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 20:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15214.1663272571540325760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mYmBwyJf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6257311d64=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28FI1hJV004549
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 20:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VcOambtrYcK1YRGtA7lFLRYnZeHsP3nrPF55mbrtf7w=;
 b=mYmBwyJfr4dyHgxqa7acFZg4uj9l3yl8k8Za1wvwIxLCcZhtP1u7iit5O8Wx7YkRFBdg
 1EjfDctOwWY7Ggulq8i7M2wIinc1qqaEdv0jEcjcYvwsgpMIHX0JoZaxb5oPOvP/6Nfn
 c1WC/udT4BHWVPMSwYFDD+ST5nKbA26oezQwrsjgKTsBZgIopfFpIKMNuc/gm+evwqzm
 iRAI6AwCO+agm8IinVNgBA3KHrRJu2WCT/LiqQaV52kONUmGp0HG1NVWXTaskinT6ym9
 731G001OLlsMXuTc9kgUjsdLmn+113Of2Y2W7wtcnzLHIKX6mCzycLiphZe17JuTuD5c jQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8yfg33y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 20:09:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28FK9UxP013713
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 20:09:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8yfg33v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 20:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4yX/Ohnr+x+0WCSOIhePw/PBlwGInfqA+cmqFS+h+mNDW0FOaZiatBAV2niZBUn5d8lcgZqTLaGEHoSY0+rijOUoXnXsatujiaGWGsp8Fl9BP+r6TbqXaypwk49MfQQ7makJzYSeljchXDJdc9eU+I4goR+jOerexwxvoT9aC0GhWqVMiCmeqYGew0O6SIjI/b5ajdNJw4EdtqfXDdETmBEeT2MeHr4xTjIqd4pYCFs7cfZ9eoZa87L75aS7Ec0na/BpU0P12wWsHpr8eBg95BOSM8CZLp8yJKSfz6hO94o75chqdXSf2RrmJZcPwWDA51//1uV3g70bQFkR4U9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcOambtrYcK1YRGtA7lFLRYnZeHsP3nrPF55mbrtf7w=;
 b=eErqlO0Os5x3z2p3zQQhX8tFpWCteBOCrQOpTOnTwP6srkBNw0PtCvlGEPa0MksjqSfb4riweZqI08Qe6ceOU++gNg6vxGrArvAH6YebfqARIVgB8E3ZBEw8IFx5WAqmNkEJFMsMQF2qOCMaV9fjTgBmVFA5GsKiDdVg7nTTIwc38DTA7SEORVMFVxVxie5s6Mv2J7xLIOK9DgtGP4BduCphWP4wn8BGFj25vLNEmFuo0K0u7VQXvdstk2OCNjj+34I7pFwinqQYckmIbiejvQf9ZSxUcuie9dclOEm8bzB1UekPgzMex//lf8KThtKywgsPgbxXAr4CobRVitQe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM4PR11MB5552.namprd11.prod.outlook.com (2603:10b6:5:399::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 20:09:28 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%7]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 20:09:28 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com, zheng.qiu@windriver.com, ross.burton@arm.com
Subject: [meta-oe][PATCH v2] jq: add ptest
Date: Thu, 15 Sep 2022 16:09:11 -0400
Message-Id: <20220915200911.37577-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::29) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DM4PR11MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6a13ed-ebe4-41f0-8752-08da975631d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hJWYKiAhWHZuNtKdOpc23Hch6erkb5nPEDv/m3WvBGeIzXwR7bkWq0mvGElibSpUmObP96ez317L4yhZExUPTPAcP5Db49ktYsxqTGKqtJ9KN/aBYpLc+mlHGlmsRhEqtkfDAnJjcRxgMEsrjMzX0BIgeWLnOsfX+TmcIAAjV5UswL/SzaFJ0mHwrMnkmxxY3xi72Gym8w7EPLI55VYj1U4JoMxlC/EsD9o+OLXneGXyqCClqANW/49dytEdF8lJh9Ccr7b46TXy7CeFT5y/2u81p2fkBANOPqQUa1x3b8u2g83r4MDueX90BUTG5UQkKyJI7vFyEJqCMSRho2dD4zAGi8xMEXAROyx3FbI+jXbTvYx+m2ESeh28Mj4p2BgmHX4xkI3Y53T85fHxZCaAGnNZg7dvOXHrAVwgcqTOop8XProPqrDjwHqLm5b61ASKLs2AcGVyg7nHsag1ubl1f/Bj5arhJj+Vl9KcoiQIGP2lOdrehMSsWZaOo/GiBuHRH8bCkhY3imALqp30iI/MoALoPfkn5P0+sWJULDOvMy42L12y3Rv9vrsuTvGlQ0kgw2HbnkErB3/vKEh7PkgGtKcwYvVO3UiIzWJ4GSY54gQyRjd3h5vFk93yjvbdUOzPFoBXiOil3gxpNIeLnzi2IZNQ/HYjh4knZd2lCPJgBuJsr/jl07IydWfDUq+tNCxKyE5DzylQ1HxDSme3W0j6Ow2Mc6BrgZF8g8cKW1kqamT3D2b4OxK+fBtuqXbW1gVm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(451199015)(8676002)(6916009)(316002)(38100700002)(5660300002)(38350700002)(36756003)(44832011)(86362001)(4326008)(66476007)(66946007)(66556008)(8936002)(2906002)(41300700001)(2616005)(186003)(478600001)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(52116002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6UxiTOjRKv5vaJc8lIcmujrVWeaTk0qva72vtvnLb1nvNnh3sQ9LkiV8MBMZ?=
 =?us-ascii?Q?9kYylj30OMqqVJqUXbaGT6uGdmDFY+Af9WuDVk+nOS1s9SzmodA/yATX4a9h?=
 =?us-ascii?Q?YmjVhUbnsuFmVxILdaz7BIcSzBsCgp9nfRIWJH7ae9nnD+FumZ+XiOEJZe6g?=
 =?us-ascii?Q?BfbT8ch3bf7doQiCA1VRbfpxaBbBvF1ko2NQh/FPL0NFZYds9zMJKl4Cq5gp?=
 =?us-ascii?Q?OAp3bAkgOTehsW8RLFBHd22aFTM0VX0dEaqx3wahzzWh8WwlLQvJl7o7iAcT?=
 =?us-ascii?Q?Id6YWnppbY6O+qe4CjiaHEnuTwslGk9bwArKJH7Ti5wyXsV/wTyvERaOzXDt?=
 =?us-ascii?Q?j82TPpTHuFY7tzSA+66aQkC4bSv+dx4S/56EYpd/9rOnRoMtogaX5yDlz9k/?=
 =?us-ascii?Q?cgNbM0XpR0yMYt0rGLzdOyJSj67KPzCL/Yc0CJDf5PzAGpUWUEkBrDSN8nHt?=
 =?us-ascii?Q?ZXVZxQYO84bcs6FxfZBBTm//V0H30RBDbXBJO9x6L+W3ZyRAknu0d0fYCGUP?=
 =?us-ascii?Q?bkP26PSqAi5AXcKKUDTrLawI+xL9YhQ3Q62kmQ+nMxJwnp/tBZXEqze55oqp?=
 =?us-ascii?Q?qbzpsKD2lZiVQGZYUKEpr3Z7viO3DeighB3f/EcPzG4eRFWc3gGDiN8zt1Zw?=
 =?us-ascii?Q?hvZsoItBEJFoQDQGiXmkt41sOkEyk4nM+6nK+3gDU1TUY8WWQ6sGNaKaSie/?=
 =?us-ascii?Q?uG6do/zDrI5TcUPJxEXE5/KQGPs7Tx2se5LLliGUsmRQPf5ZRLU7QUeZiCUi?=
 =?us-ascii?Q?4/4if8uNlrZDIGaPnbp09BKbNqjqehPCRhVP1TdBUfP2SzNrVqO3M+iRc8p3?=
 =?us-ascii?Q?oUqX4VRfa6C+SwZWRHbG0wVFETeNQbuSBeNDceTVK28pqwkBGFRzFuTingIh?=
 =?us-ascii?Q?f7C/iFGQWZG79X8bECFFuix0RUHTTs0h2W+fL6g6ZgF5jk/76X1aAst3OYYX?=
 =?us-ascii?Q?L9Qfy8tTauruCC+r+Wd6CUeRANCRgki0x5N84A94Uw0OVFbCboQEY4ETz5/Z?=
 =?us-ascii?Q?4uVAbctw/FUUcrHfjrfdJwQOj2QIecbovniPa2mBbUvHw3iANwVceqMqUoP/?=
 =?us-ascii?Q?NqQcdcUyMzs317e2a3iFiOOosiufMIhv5VXrEX+ldXLTX1sQNMksz1C6/sIj?=
 =?us-ascii?Q?lUScv6a+0eUCVkOKmbg9e5ykL8jDwzzLwpXq2e5ysIM8n1IAYLBj0VuNOqxu?=
 =?us-ascii?Q?ULoB36Fy0iDgC5LAluPCg7zuGi+XLile/m6RlDbO3KFctcSZn8rwZiKze6w8?=
 =?us-ascii?Q?9VmFJiaDhFffxM+RCjxOykdsOFKoTaP1UwGzgqdYKMBcjn95B0sPnKpLnRUB?=
 =?us-ascii?Q?oRZEPn5rr1OaJx3ighDAe0+BA29gfMqC33PcmGeTqOfT0qEJSjf6uv9bsAmh?=
 =?us-ascii?Q?y3n50XC0PzPP/DtWveGXami20V1/HCopqVkRSjTrWlqB14NZU/f1bPizu7tF?=
 =?us-ascii?Q?INkHgRQLV8mXvx1+G9I+Cr5QdHANVmHMAG5rARfsVCjcUkgmqUl61qNYFqpm?=
 =?us-ascii?Q?krylwweyjIUuDqM9FBiNuj8y/+/hhOY4LIIrAIjaLufIHMCVMJI5CUWAPiIQ?=
 =?us-ascii?Q?8QaevWwxmjtXkl4Kfat7Mzh5xg6Qin1yfr2UnOAo/YChkXHqGljv/sqySZLs?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca6a13ed-ebe4-41f0-8752-08da975631d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 20:09:28.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8Y+Jcxy5Bzgmg+xEa46fdSL02cWJC8Es0b7QPyog3puax9MRLvag6I4g7kOMouPAexJ4XYW6XXSUzf0x/7PraQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5552
X-Proofpoint-GUID: 3tp9Lnl-YDwSjGpSebD8Fp8nvx2HJAap
X-Proofpoint-ORIG-GUID: AQrMIjdrvtuZsP79bX3ibXboJfm7jxDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=537 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209150124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 20:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98826

Add run-ptest to run the 7 tests provided by jq.

In do_install_ptest, add a soft link to jq in the ptest directory to avoid
having to patch the jq setup script.

While the jq tests can use valgrind, it is out of scope for integration
testing.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta-oe/recipes-devtools/jq/jq/run-ptest | 11 +++++++++++
 meta-oe/recipes-devtools/jq/jq_git.bb    | 12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
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
index f69b435e5..3e4f60348 100644
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
 
@@ -27,5 +28,14 @@ PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 EXTRA_OECONF += " \
     --disable-valgrind \
 "
+RDEPENDS:${PN}-ptest += " valgrind"
+
+do_install_ptest() {
+    cp -rf ${B}/tests ${D}${PTEST_PATH}
+    cp -rf ${B}/.libs ${D}${PTEST_PATH}
+    # libjq.so.* is packaged in the main jq component, so remove it from ptest
+    rm -f ${D}${PTEST_PATH}/.libs/libjq.so.*
+}
+
 
 BBCLASSEXTEND = "native"
-- 
2.33.0


