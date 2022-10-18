Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EE2C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 20:49:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.271.1666126160838859482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 13:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=osLs04T3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72907dd982=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29IKSsUZ022346
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 20:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=p5SKB8KkgLBAhhQcQWnb6S+JfKvs708FfnLCnR7FYUE=;
 b=osLs04T3iY4PTcNXQlvKrYICmZrmckD0hUUGfS67xJKuTRzVkV3o5H5qe37lvlPLijaz
 WubbuB3PSYcWFJoQg+6ji0TXm3mcpBppBcAgJSqqLLyrCJyFJNMSNrIK+VYOcpUXP1kJ
 v4ndsQMbvYQ/bosmW/2215Ob+rfBxrPxOHWwJ5f0g31VAmV/dwou/YwSJBu3ndqys8BO
 3+ZNkxOypE7bETxVc+nHhhWmf+h+iCVlC4zrZuzuaRoIp5u5aLFyxUvHee5u2DgCwDNv
 /ji7/0C2zV8qvzsaW8+5QP3nV+HSER0DnCYTSQ/GNw9jL6SB/w8UqFBODJoU6Bz9ulNa Ew== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7j322ynp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 20:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbFVn3dENfmyPv/1i24ZC8rwZvA8BLXLnNeac2rbXblNhRUSutNnn1syGHUI99R1/Q1zOXpxVMayJojcO898+6yO1bLNcZQWbc99NxXVU5jHGThLlxShyGNBQEQSgqJhqCZTZPnne+ZIpmCrUyq6EDGNPnWAAvTsXmfYTwv82H1rv/0TH4Btz32WNcn2pfacV3qbFt808nx0sFgQw+cPJohkD52U+GLRWiYw7NlXxSC6AEWimcwu5s3rcRaeOypoeKUtTBRoHpsd+BetC7tyzR/fO5GGSw4jUzhJ7PKwn/p8YGu15AzLysAzvO4aojK0lAzfLZ1pErO9hltjX8Fzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5SKB8KkgLBAhhQcQWnb6S+JfKvs708FfnLCnR7FYUE=;
 b=LSLtT6qgxH7qko12lBfBtE/Xd7952Wkf9ftVe/ybOiw52Liw9Q6p8CL+ermexKBo4phzgwfD43cv/e0GKpWrue7nGEi2EroKsax3diPM1D50OY62owsKDK6QksulhzMzFX7lr7Dpe1rCMfNGmUM92kec4N0wNohwU3lDFHya31HiDCjgf+gQ20lmolQVIKIbPqj5yR7kBOupPINe2OGSMCMBRU7Ho+fdqrkFq7HIgjRwj/QjjiKf5q0YJXxDwWMf+LrqToJFg/enSezludKVFSy9xR1sq4y3V2KLM5+BhfGQHyosfftLj5fN4uKp+WnodqsGvQltaqi7mdg0BkIBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 20:49:14 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14%9]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 20:49:14 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com, zheng.qiu@windriver.com
Subject: [PATCH] jq: improve ptest and disable valgrind by default
Date: Tue, 18 Oct 2022 16:48:51 -0400
Message-Id: <20221018204851.38646-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::17) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 909b3102-2dd1-4956-7d97-08dab14a3777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+wcxWZ2xZkn6+DF9ZcDiOIPFGzy7hYZl90qqgbieB/4+Y2kUu82zM3q8xn/3tlZ1p23Rp7KdpLOpG32F9NlY7PKoCStdVNEyQF2+hWG70XV3ReWiCOTDuhIh7OS9y7yAMfj55BbXew0l66j7q2bjYmmc0taPf1BQjxYeTNPme+mUAaGqfUe6Us6vaUHUKTmOZG2KtYKGLhRR2D40CEHyTKEdYRcQW0d7VJ8yD5HGt7xbRStpLEVIWemvFlnQl03CPAIxX7xpWZT12AKRFZarSu4VFi2U8PdKBE11A3z5MrB+YXWaTwhhCu+pGjiV2RyhM0g9fzD/mt9YrQNKmeWdLFc/gSjKVg6Kh4kwmIU0/HFvjff2BKUN2oGfhqPL+UsxKxwjqigMp6nONsJCoMefaMP8IlQqDZp/eF3CKXlnSC37DEVxpDLDKiC5pNA8CkWtYdtJuKB/3yHxNrWj7mzAI22kiPbqz6b5Trm4nRVEmUO0+OUE2z3yJvB/QsSeHzOscmKj3oz2kE1I8WiuiAb1pk4uRj7C84SXteaTpTE8pXry7C3TydWEo5vYDDMR64R1m47VsSEKimZ6oABSzmJEd4pE1OkZnVH0tWxEI9wA2HFnqG0e4XcWqxUp627GQDXufxsev1Nya1TGJqxv05gw90YBSdL3wHXDdsHnWjejpvRehLat5gu1+lDhIQdw4KcLBzvV+eNpVkp06MuoxgIVzWNUpeBb6Qytq+DHLXItA+R+ji/TrOb6xgGzJZIpdc9An6lIcd3eXi1dk3XyMNFOa4qk/bbIj9xaLpXnQ8l8gEs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(451199015)(1076003)(6486002)(2616005)(186003)(83380400001)(86362001)(38100700002)(38350700002)(5660300002)(2906002)(44832011)(316002)(4326008)(41300700001)(107886003)(8676002)(8936002)(6666004)(52116002)(478600001)(966005)(6512007)(6506007)(66476007)(66946007)(66556008)(6916009)(26005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I0VdsbqDmgFtmTiy2JDKhwj5mIDFEspxtN3IMThmUKAWN32ak9GcQ9bo2Okp?=
 =?us-ascii?Q?ue5qJiskh3ARRtVnmdoEFsLa985MiOdc+2vx49QTHdUQpz6J5FyJy7qT+V7s?=
 =?us-ascii?Q?Ll/CPMqVMVupESsMuNaxxq8/VSrPVMnVbB03lGTDc9o/svOLBUuScRqdHk4z?=
 =?us-ascii?Q?4kOiOCP2B5H0GPKUKOk5GdpIbA20Qdn3S9VZn5RWIacPhRK+Md7rfxwUYMbE?=
 =?us-ascii?Q?gnhOyMzqb5PJL8M1MKSUT/5pkvCcpEolNQYMs4cuizcvUB5CSXDXbEv73CiH?=
 =?us-ascii?Q?F5uM7OtY3Pk/3Ccfk/ybbUje/m9wZDogJ6eH0y9YOuPzgEYILCxK97f9ncTL?=
 =?us-ascii?Q?vN4/HJGWISKjfzj6Q+p1+Fm+JqfaewKfbvB4Yh8TTN64gnq3FNorY+LWOidy?=
 =?us-ascii?Q?c+9sol+61UwiGp0OEsgF2RNauD/FcSUkNWWDDoP/cylQx2j82Yj7057MiAKD?=
 =?us-ascii?Q?/g0B9XSnK7yKkVEKd0v9zNzMHbM+4XYjdzvpHFj91XnYCIrHy1e7XWYs0Rzn?=
 =?us-ascii?Q?x4Q0jmszxx3ZroxXfDNCvfPrJV7G+OnmwOD5IQC3rXw9DHfhx7fCTkmm7k39?=
 =?us-ascii?Q?Vi+pa9QKH1gZXdLU+Y2TV4lBuap1Web6XxhboGebfNgjwQ8sp2++G/KiHeHW?=
 =?us-ascii?Q?YNhUzt3xEPFSwfr/vyHNk6MK6ZfraGhygtq30PxTHkJqDk7n/vT4DcALcsc0?=
 =?us-ascii?Q?gw1zFuD95b02PTv+AOlG0GuOFMTN77rPG7R7bDWC1lpjqXYjhGvGz3f5rs/n?=
 =?us-ascii?Q?5lHTsm78PZ63fN8ozSW5m1aaNTo2zPe/f18peavzw9ooX5CfQBnZvfp5LQj9?=
 =?us-ascii?Q?N9UNyHKVy/vaXPbPkdO1s6OtM69pttylZ+cU7hqANzVf7BAus4Ve0gmrRBm3?=
 =?us-ascii?Q?75P9/1eh2tejfPDtlMGMOrG/1xkKdJtkf3nbpLmlucJfcY6eurn5bMRP85Bc?=
 =?us-ascii?Q?eXIpjC+xTqKbuRUVj1i5oU25P7zDvaxffycyeSK2kqZ6neROFkVZvx34naO+?=
 =?us-ascii?Q?FunhSW11cciJAWZua0lRPWuwC/V1aQKcEHRotgIWePHzFkMshIlw334xKutV?=
 =?us-ascii?Q?wWtB6BhQm3gll7gMx5voAwcSdhNi33v4IctGFsjDfKfHWun2v25PfRsfzs+B?=
 =?us-ascii?Q?uC8uynDXpTy3Tjugs0D4yQ33vtmxjflwVRrfWyBVM71ALGJ1E3Fh6ln3xWKG?=
 =?us-ascii?Q?6tO6pbHxQTyki5igX+4rMtglQ72pSALY6HSmRacrY7WRBCsO0I7YrFX38/Zj?=
 =?us-ascii?Q?uj9Jjc6S0mZPvhnL4C8/8kOA7cg6quBobEHxajVvYWmMy9Jae+UvZ/Es+YmV?=
 =?us-ascii?Q?BYjiBx17dmOKqFlntycs4vTS8IwddXt+Lovw4p7wH7wQ3ltNxhkXuVVVLf5Q?=
 =?us-ascii?Q?OAaQMEsqiTUPTj5D7YdiM8gmRdCJlLJUSQXK+MP8YqijatbaS+Gk0OozjS6h?=
 =?us-ascii?Q?ARyI4MiMGP/QqthfspeAU04EPlbENG9PjsvKR3BxZlpvqgWUBM4Rysh3ELzu?=
 =?us-ascii?Q?+VVOOLpowFW9iR/hYzS5HefBv6feQrKCKOGtUD8WZbxLAhZ4bH0/NqsIxPpv?=
 =?us-ascii?Q?ppuZwjplArUKovo9zR506d9Xkj1/uSiTx+YfgGLYViMM1aUxbgcuciA3xFHT?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909b3102-2dd1-4956-7d97-08dab14a3777
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 20:49:14.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTQS5gq6+EV0eEAIOJf29EBCXptbmxuHahzur+djIRjbWIydhsNCf9UNTgZOYP8UlQyopRVAzaawb9HWJfscRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-Proofpoint-GUID: ZgL7Stw-Z5Wfn6hGqB-QjHxnRBfv_5WJ
X-Proofpoint-ORIG-GUID: ZgL7Stw-Z5Wfn6hGqB-QjHxnRBfv_5WJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=872 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 20:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99243

Improve ptest result formatting.
In run-ptest, setting a flag to disable valgrind image unless
enabled by "valgrind" PACKAGECONFIG.
Requested jq for seprating make check, so in the future
it can be changed to utilize Makefile and reduce redudancy.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta-oe/recipes-devtools/jq/jq/run-ptest | 28 +++++++++++++++++++++++-
 meta-oe/recipes-devtools/jq/jq_git.bb    | 11 ++++++----
 2 files changed, 34 insertions(+), 5 deletions(-)
 mode change 100644 => 100755 meta-oe/recipes-devtools/jq/jq/run-ptest

diff --git a/meta-oe/recipes-devtools/jq/jq/run-ptest b/meta-oe/recipes-devtools/jq/jq/run-ptest
old mode 100644
new mode 100755
index 0e4c707e9..a813958b5
--- a/meta-oe/recipes-devtools/jq/jq/run-ptest
+++ b/meta-oe/recipes-devtools/jq/jq/run-ptest
@@ -1,11 +1,37 @@
 #!/bin/sh
 
+JQ_LIB=@libdir@/jq
+LOG="${JQ_LIB}/ptest/jq_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+# clean up the log file to avoid a file has the same name and has existing content
+echo "" > ${LOG}
+
+# The purpose of ptest is doing intergration test, so disable valgrind by default
+# change PACKAGECOFIG to enable valgrind.
+#export NO_VALGRIND=1
+# The --enable-valgrind configure option for jq only can be used within Makefiles,
+# and it cannot be utilized here since it also checks compile, which cannot be avoid
+# Requested enhancement to jq: https://github.com/stedolan/jq/issues/2493
+
 for test in optionaltest mantest jqtest onigtest shtest utf8test base64test; do
-	./tests/${test}
+	./tests/${test} >> ${LOG} 2>> ${LOG}
 	if [ $? -eq 0 ]; then
 		echo "PASS: ${test}"
+		echo "PASS: ${test}" >> ${LOG}
 	else
 		echo "FAIL: ${test}"
+		echo "FAIL: ${test}" >> ${LOG}
 	fi
 done
 
+passed=`grep PASS: ${LOG}|wc -l`
+failed=`grep FAIL: ${LOG}|wc -l`
+skipped=`grep SKIP: ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+( echo "=== Test Summary ==="
+  echo "TOTAL: ${all}"
+  echo "PASSED: ${passed}"
+  echo "FAILED: ${failed}"
+  echo "SKIPPED: ${skipped}"
+) | tee -a /${LOG}
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index c6634cd30..4fa98aa44 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -24,10 +24,8 @@ PACKAGECONFIG ?= "oniguruma"
 PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,ruby-native"
 PACKAGECONFIG[maintainer-mode] = "--enable-maintainer-mode,--disable-maintainer-mode,flex-native bison-native"
 PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
-
-EXTRA_OECONF += " \
-    --disable-valgrind \
-"
+# enable if you want ptest running under valgrind
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 do_install_ptest() {
     cp -rf ${B}/tests ${D}${PTEST_PATH}
@@ -35,6 +33,11 @@ do_install_ptest() {
     # libjq.so.* is packaged in the main jq component, so remove it from ptest
     rm -f ${D}${PTEST_PATH}/.libs/libjq.so.*
     ln -sf ${bindir}/jq ${D}${PTEST_PATH}
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', 'true', 'false', d)}" = "false" ]; then
+        sed -i 's:#export NO_VALGRIND=1:export NO_VALGRIND=1:g' ${D}${PTEST_PATH}/run-ptest
+    fi
+    # handle multilib
+    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
 BBCLASSEXTEND = "native"
-- 
2.33.0


