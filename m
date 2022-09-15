Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8166DC6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 15:12:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11523.1663254724790549323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 08:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dNpK1uHm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6257311d64=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28FC04iV012402
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 15:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d585t6OiCtT4B7vIR4ZkJHc/Z3m735+Z52zxka2LwXE=;
 b=dNpK1uHmNX4yrfkTYl5h/CJ8bSjnFFg7NGqc137COMquLNcYAmJGZYnOS0Fbmn46swuV
 NnKAdJXts5qWKpEB2UGke/pSzK7rjFED91w81QmiZIyzW6lyO072P+i1rz9n4fTSNQAQ
 SWcO0fXX0jMUwFrSQIRHvS7FJIBR/vIrXE7bOX1esb/b/7xcbGc1GP15dB79YqEaYo/b
 SXIE4zf1kCYLUntKhyZm7HdREhUwrMOfiNPOdJYsPj6DPBMIBGpCf9Tp2nTa9iNmBbMf
 cx6dst+XdpqttPHfMvDjb5mdX7oz1Ta4lm6U7tVthf0e41x13h3RhHztW1I5Snt+hcbC nA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4tnhfpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 15:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqhE4jBaqrgP+R5Gdg9vjumDuDG1aFOrlnfNxNkckvZd6lDmYGOott6CTFXhaQf9JOfHR5zHVccxwP27PfPT0sGMnaJS9VLktbsD0aBr2d4wGFbcjdZrHe7+BvgesBMuF5v3+tvHijNhJMRMm90bF/k7mYaSWqflv15/LKLKT+M2ECp8xP7Rhm4OOJQqcG05NlaUzsEyC6EfCEL064QTYVWN7PNz/bY1t2W0WzZ3qAW1Z00o2ndmT3eDzr+wPB0gwuszE2vHDNCSHqhkCJmbUjgu7BsU8KV2Wkx8H99R3ymafIROhIz3jXPDARiPdMJOsgigTp/A0lbdZ4HzpA0zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d585t6OiCtT4B7vIR4ZkJHc/Z3m735+Z52zxka2LwXE=;
 b=h9DKXMNHBU48tPWcz84TqSX9rKKtjGwIpTw1yxnoI8ARAvvg7YAnyqnSTmdXKG2tXL2AC9KnRnKEaCeEm3uip+INNDJHwJyOisajPpHdY2lLtxMzAd4gYsxvQ7eH5Zch7T4SfPo3aUluKElfNUg981dE65l8Dd8FHjaR0bwUaiFdG6VfVX2lZANzlQwOVeCPNOkhsgNwC9hibqHRqYYbdOAZMPOZzRq0/SMf3hJuzTP8n1z/q6b7oCAHLkbJsKijgKZ8TQluib9loLAAbqTybhlT4Wwbf4om2kmC9ndxBkKSrc6JYXKolzt6l2EutMoRefOkqQbAtQp2XyRJODvJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 15:12:00 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%7]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 15:12:00 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com, zheng.qiu@windriver.com
Subject: [PATCH] jq: add ptest
Date: Thu, 15 Sep 2022 11:11:46 -0400
Message-Id: <20220915151146.29844-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 802acda7-118e-490c-718e-08da972ca371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HlrxL3VJkqhPlN4Kk68H6XqPLf7U8ai9PYyV4Z+KdErkv0p2olAhjoB2KeDf6YIy4RHBrfjWHPMBaKhLQqzyzMmJ2eGYamL+Qz9SywPCzwucOWFot8H/uknzAJcDJb3iVC7xjnqJbC1YlOtBx6TG48DNfTHJ9+rtGnACtWW9ZNydZdChqkkSDXhHNUCnd5K+D3KDLDIA4oeMXu+jWya/+/eR22MCAXTFH+62lAUW9ZIyjF7GnmP27pZnYEMQsLLlL4rEXV98VMTtFFRW6mbldLa9QFX6GtNx6LWU8f35Aakn6IIXjgdSbMIYKYRh5lIkeLMb1Nw7P+9cnjgB/oZTTd498z0fc88m4i9JxbbRZw+x9avkRYwAfYKnQyFmab9Sk6yJzioHRBIiLN15UkEMHxqZOCMPCB7Al2EX2uu2xYEAYTNc4usWgf9GfEiyZiMuiGtOs4z+C/gvZhEBf2PWQHDPjTBYzj6rNUFT5Irbl8F1dduEV6GIytMq3DWerOIFdQ5vxmJwIB+T3w0HfIuxCsxCKkQ2IUS8a+OywZGLky+iCc7QI5orp64CppuuaaaDwZrP9bhJpsYBi+N9CT97Vyqx71G2R1hHnUuPxK4ooqqGMzjNswXCQHIEMLbEtUmylpPhjcw9FAzgHyNpFaFduATcfXl2THB+VCYlR9jjEHQI7131jIRws5AifoDh3qxWRaMe8RMjvlW9tX7lk7gKO4dKcj1drYal+LMc48ywiqZatA80i8kZU53miNcrIyvr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(451199015)(86362001)(38350700002)(38100700002)(8676002)(66946007)(66556008)(66476007)(6916009)(4326008)(316002)(8936002)(2616005)(5660300002)(44832011)(2906002)(1076003)(186003)(83380400001)(478600001)(6486002)(41300700001)(52116002)(6506007)(6512007)(26005)(107886003)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YdiD5zCqhF1t8OSABHNcwiPkUKOny6MeE2Z0Z0YBu2HAQwHIksao0+tQWIt4?=
 =?us-ascii?Q?CIbeaBNbadepQ37D8bwuqr6ZHXJH+TXMMQM0zPQlIphMX6Lj6PuBnSqEpJ7g?=
 =?us-ascii?Q?NlOly5jL3bXEutTzdXGst3Anai2Uwkae0ucXpXBAl94yafoXyeK8uo0pN3Mc?=
 =?us-ascii?Q?1c/q3AC712l/KFYJLVc+Xcp0d0YhbY6u8g4SFNXea5RHij30Mqg8tk37CQQO?=
 =?us-ascii?Q?+WjMVBPwONj6/owY6T+jlcei71Cek02wGi4pIFlihKJxsF/ARzQJyP6Irsri?=
 =?us-ascii?Q?tFLdwPqAO8c9dXRhXKV50uivFziXU1VklleN7OBpz1jyIhposGd8nRThW3KX?=
 =?us-ascii?Q?sYmLGGTLap84RBKVKD8DIhb+bo2vXdWJlp3EMktsqC08zmnNRmLd+EY3n6FT?=
 =?us-ascii?Q?fCFMYkQ98iiCkI4BFGKZEGVyfkp1UOJhCH3kQsXGUc8kjOhL+TunV1JeipaD?=
 =?us-ascii?Q?rczPTS7q8Yac3uINSbEsUoHizm3jkYNIZtyEYGbMJgWTwgyQocT3UYCz4gRW?=
 =?us-ascii?Q?3xDLQ8Mww6smSj720IF/qrjIgoTSOaV7rOj/jwI2dT66yafOlN2dS5grThiZ?=
 =?us-ascii?Q?S6rlhG9OS9X/iJDKz0FTebSezw5hNG9C1aM8eWJ1RhPsTqJ+MHBTWCQu3rNg?=
 =?us-ascii?Q?VcOixKnfjgxldYkuLxOButEND9jklx6euqvGZIOdRqFbGqHvWa29CyK+tm+H?=
 =?us-ascii?Q?IqUiPfwUQcQXJRM0yogjH9bQQ/kg9uVdo1CN7RXbadpIndf7JM96sdXr2J7g?=
 =?us-ascii?Q?LEkPbzwhZYUq7zaTj7e7u08MN32Py1GWKutiJesOm3qW4Khgtw1jFM8dy5gW?=
 =?us-ascii?Q?W+VnJDAGfX48AyIW3gZ25+PWOOoRwzZK6KOrJB2AIyIpRhaZ1pqWpBCD5qc6?=
 =?us-ascii?Q?4zwwzzlYNUrn84zjIvCGMpcjpsA0+PV5iLLFstgGfRsKkn3JT7zwT8GiGDMp?=
 =?us-ascii?Q?NG0vV/FWxdOqMgoNXay7txeJiORIueMCa0IFs3SGC2RKzyE2pvryi6YnlCCy?=
 =?us-ascii?Q?dYaOzMMCa3CRUX8KsfY9Y5W0R64Z1po2k2IV4HDkNr5Q1htXhrDGKDRVLGSE?=
 =?us-ascii?Q?n1sKxyFLiw8dWE7+/BWdUusbTHdlst40pJyzjB3OiQnYWaXZJi6SQ1Qx8hGA?=
 =?us-ascii?Q?Ve3NW6ksvWAqsNM4DVXrUiZpo+e/gjmrqeic7uAUr0c/9yxH2zyJ0r5Wntap?=
 =?us-ascii?Q?XDBcjtbW5mcnAjIpqiHtVWlRquWaMCeZLiMYtCbYWFji8z6bNOnfAWCq0Es8?=
 =?us-ascii?Q?lkogsCMdKMAmN0ZXS30yXEXUYtMAmQGs/xUunDzIDij80xCR0fIwYVkrsH36?=
 =?us-ascii?Q?0QRkM1bP1/5P6SzrIl9q6rbrjKPZZ/tZJ3sYf3RL0qJiVAeQdEeBxD/IDsr6?=
 =?us-ascii?Q?FdSP/xneGSAASukbVlchfVGi8JlS2qjENPUzQjWdXAviJy+hJIE6s/tMq2We?=
 =?us-ascii?Q?vYgOj3UI2qbwrZi5O2muhPH0Y95OQlGhsEov5HlgXuLaa9ufaxLjNW3DQmwS?=
 =?us-ascii?Q?gpY09U+ou/lqD0XQjzV4+x3e3Tav09vIuPz55jFm8hn/jGd7bbYSw3IjASdd?=
 =?us-ascii?Q?rqGODsq3/PjPe9xWuHNocVsOHg5juM5mKYHAvd/s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 802acda7-118e-490c-718e-08da972ca371
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:12:00.4072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4Xnkpafux/IK5CNeJbZM0kjsuNGzBOtzvWBRhu+M8IoXnNSmacklDxCmqiA8/N/PzIHQp5vfJbcKSuHpKF3TeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
X-Proofpoint-GUID: ysoxKDJyEDrLdE-RkKkDUwiRRFsM7rXp
X-Proofpoint-ORIG-GUID: ysoxKDJyEDrLdE-RkKkDUwiRRFsM7rXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_09,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=288
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 15:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98823

Add run-ptest to explicitly call 7 tests provided by jq.
In run-ptest, add a soft link to jq in ptest directory to avoid to
having patch the jq setup script, then remove the soft link before
exiting.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta-oe/recipes-devtools/jq/jq/run-ptest | 48 ++++++++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_git.bb    | 12 +++++-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/run-ptest

diff --git a/meta-oe/recipes-devtools/jq/jq/run-ptest b/meta-oe/recipes-devtools/jq/jq/run-ptest
new file mode 100644
index 000000000..791179936
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/run-ptest
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+cd /usr/lib/jq/ptest
+ln -sf /usr/bin/jq .
+./tests/optionaltest
+if [ $? -eq 0 ]; then
+  echo 'PASS: optionaltest'
+else
+  echo 'FAIL: optionaltest'
+fi
+./tests/mantest
+if [ $? -eq 0 ]; then
+  echo 'PASS: mantest'
+else
+  echo 'FAIL: mantest'
+fi
+./tests/jqtest
+if [ $? -eq 0 ]; then
+  echo 'PASS: jqtest'
+else
+  echo 'FAIL: jqtest'
+fi
+./tests/onigtest
+if [ $? -eq 0 ]; then
+  echo 'PASS: onigtest'
+else
+  echo 'FAIL: onigtest'
+fi
+./tests/shtest
+if [ $? -eq 0 ]; then
+  echo 'PASS: shtest'
+else
+  echo 'FAIL: shtest'
+fi
+./tests/utf8test
+if [ $? -eq 0 ]; then
+  echo 'PASS: utf8test'
+else
+  echo 'FAIL: utf8test'
+fi
+./tests/base64test
+if [ $? -eq 0 ]; then
+  echo 'PASS: base64test'
+else
+  echo 'FAIL: base64test'
+fi
+
+rm /usr/lib/jq/ptest/jq
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


