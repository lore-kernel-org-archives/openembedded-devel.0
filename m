Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E98DEE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 01:34:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2417.1692754483096625916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 18:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R/TI/IWB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7599c7e7ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N1Nd5L022287
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=MIiQqx0JbIwOmERYjcRBlQ5a9F1CRsTSLrG0jwZ0K0A=; b=
	R/TI/IWB1uSPFB9AMjT6XiCN43c/CLhUOovb9g7Y/+hSgbP5q7nn3qhxTHPPfej8
	4GGWTqYAgDFHCyo/9g8HHS7afpcXFWJ1NaYkDDAJVJqzcUZhSb+BAE5vmushPrPE
	SYHEVygggMXb/X6MJYRlktWQTuPaQk9kUsWZXEsX+DlUEKHY8nuVFYMGnq/Ib7r8
	Efd8J8Dx3ORuQ6H7Sd1kgHmYcHaq5vAUywrnU+gMF9gRXKULTmHAvbBdrwko2snA
	PpYReKErrTAxcDCH1NrQ6h4z1ZAuwTvuuT4/xhJQ3CahzOTZvq+CMsx2qjwpI6Db
	06vvwrdCYDE/wmh+jpqvCw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mg9sv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDvhJsaZ7aMjy8BA99C66MtPnNEix5NuVDDDapfjZPTrAi+4nXsa3JBlAHHlRnQRLU5P+0nYK23c4F8UgxRmboAcsREOZ95ycrhmPtefn8AUV4Ml0sgetXLpEDxQvxsHxFAp4LqlfNqeSOMJR6LjJFBaI3W0w1KSomfPT9FC6kKfxFVBlWN95xQCScaJ0lnXj7yNl+VKuXcWmVGxapE5PPHaJU26s9sGrGVWnpmcADwkhUWLmIQ8fydELO61R0mRcVpWKHKbvVEtIsa27dpPwn9Lutfwrii7SzxxfKdG76lBfXdSbAQ4Pgp0idAKla5kNnYiKDw9cjykZqNA2eLinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIiQqx0JbIwOmERYjcRBlQ5a9F1CRsTSLrG0jwZ0K0A=;
 b=nvELWpYItfjFdErkFh/A2+BaajLgGW674sxuEmATl4YGvSW9bfooMrL4O92q9A5s3GxhkmvCDvBVL1A4ONbUX1ATa6uq8ZkQeVRMKSYdP6U2bheYbZ9g9iomxVUFkc0YXKJ18CKAQYTopn5JzfDux2CwUKEhJMNe0gqanFhURJKZTgcqRn9YjGMncVpd/YUqjpgkqz+/lmjy+jjeuChrywYfpQRGnswppBbx5oLFQJSSE3Zw47VMhQVJEU7KhKTK1LgXb7bcanTgqcvoLuqz9aJYCXn08d9rGtczZCanoPFUx/GvfUdPiUhaUDiVtx+NDlTtVI5KigiYFDC9zwK6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 01:34:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 01:34:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: upgrade 0.10.4 -> 0.10.5
Date: Wed, 23 Aug 2023 09:34:25 +0800
Message-Id: <20230823013425.2252936-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823013425.2252936-1-yi.zhao@windriver.com>
References: <20230823013425.2252936-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: e58340d6-a39d-4b89-c062-08dba3791f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o0TlrGkk1RL7td8b0AQwMMqrlF7pmSxP/h3ZLt2mmBy076QFFUBQd0n79lvaDo50BqnW9luCbRbnsqtup0qbYp3rioxhQ/5/AqenTA0iQd7blZeFRXw944/JZuSohpUEuz4mxq46RqxizTRNjcop3Ld+jJj6vlNappDjDzR44QsHtz9skzXiEAV5s7OrLMSUq6VfgA0rM7dp7sWjZ5rPenS/KKBwViVlXG9eiS1JgQnWFtdN+c9lQuzk8qAQa1fN5ACYCu1enWtFNpe6zpTJj43y9zUeyRthRA8Fh1wZpbATq/qKD2TK/kGV+Mcg3YZcWQoM3WYIo+NLifQmJXE2Xhh6bl6ydhpq/XKjT+ieA20UayZ7nYxEBZeMGSPW0gb4ftW93iMPEJHHrYT9cITb3ZPi7SUJdHG6GGrR+spngFgIIDHkDSxjipCzVTxAIBvHJE0bi8tP4qHatSwFdJ3m0uDKb8BpY6Xtb8XNL4TuTdr7sxUjed7kRWZk+gSthuecqODwZOqjOGaIFALmpGwTox2NKoYRAsmF19m7EnMbk/I2IK0uujV9OnOvtQHrqF4gKb8TaG6Lm+ecuZtoTCMUYOdCFBu4srbc46xeIQOkj7c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(396003)(136003)(376002)(186009)(1800799009)(451199024)(36756003)(478600001)(41300700001)(6512007)(86362001)(966005)(6506007)(66476007)(66556008)(316002)(6916009)(52116002)(66946007)(6486002)(6666004)(2616005)(5660300002)(1076003)(8936002)(8676002)(26005)(44832011)(83380400001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?We5w13TinUGt+UitRMi80mgbR6Huw8kY3maDOciKRcT2Jt2UhadTcrpx3RxJ?=
 =?us-ascii?Q?UzyJRIDrqLEFIP8RAb2J4qPGnvewqQPrB6DW/FwwhJG7ddWkjyXNZkw3Jo8h?=
 =?us-ascii?Q?zHZX4QuOuGbv2Y2jB+O6FayxUVXBfpDGdXHoYsIGxjAg6vWS344HVe3xSVjd?=
 =?us-ascii?Q?E5M7mrz72FVwRUsZWJwJxIN+KXz3Vx7cKf4AgEq8W8WonPjRzBZfVBQRDLNB?=
 =?us-ascii?Q?XCXmgXosFzNqfiEaNxVodX8jrDUOkVYbUHQ8JYjaL5FvkFwqzqmVLhBQAsW9?=
 =?us-ascii?Q?Qdo0EUZFfFIqwwhr+qxXw9JJ8+Lz9bG0zgSIC1+/1wVleW/Q+77Qrrkxl1Lc?=
 =?us-ascii?Q?OpPQ5fkqPbfBbV2tL04kfXnKOG3oHJvz/RYHGojhCPY/bf2+kejwif0c8I4U?=
 =?us-ascii?Q?Rx5sr6gKw3RTOM+HSWv1WuDI1T8g6GhDvWMZOfUsV07fi3nngOs/Ta61Zq/b?=
 =?us-ascii?Q?Nt8ZeH3XXsbNm2vSfA6T4aWpvsHulNwMc2AOWDcmFXmirjisWJxq62MDDMCP?=
 =?us-ascii?Q?t1kVDl5C9XjlxiJWm8KI/GMFLWHjVWaiMVPBEMXeDi2aam5aBSyz1Q5xvQdb?=
 =?us-ascii?Q?CddrVsfuCYlV30yp+eho9oeSvZFzL25ycnLMG869DYRIb38UNFIQai9okpmG?=
 =?us-ascii?Q?ygen9zcTMn4m1CHjmp/Ls8TtlIEIS2RSMX7cdZ3RSZDGSCHuoGo4kaqJO+WH?=
 =?us-ascii?Q?iXzOTYL4L+bZYBVsoMMJ3kJsbFW2YJi6NlmajM7bw69VN+AhG74839yuJDJm?=
 =?us-ascii?Q?o5Yn/QVnCJBOWbYhKIeJC3rMlT3WvkoG50KyBsfXxcThUpqleQV8NU60Etrp?=
 =?us-ascii?Q?vowoyxXA8gTIFkP0zJlEdt0DzW8FyIP5JNyTYkQFvVh5XMlsCXSd8LQ7ypwo?=
 =?us-ascii?Q?h4ufASJfIWC1VREIxe/YLTTpYG9Pub0l5yf1rMGu+d/nAFtqc9UukEdbdvSI?=
 =?us-ascii?Q?LJf8Ov95MLbGYNm1qPoWZLSakyogMa2r/QqSCPhAifLbXcLoxeIM/3qL84jQ?=
 =?us-ascii?Q?NyhPL+o5oyzjzkTTmVlIrgvlTFW42FMMwN6H3b5bFc26ovEKhXhhHqMSupju?=
 =?us-ascii?Q?v6zD6lkM9cE++kBL2hfzOUkN/WESSWy2QN2akO8fwn0DSicVQPN9zm4z7ihL?=
 =?us-ascii?Q?GSHOBJ+Q3X1Hkpp2ZDzlgBeO7194U4rma4wnoErKjNj2fT2A9SjQaPi5ktYr?=
 =?us-ascii?Q?T/NVNcQnZOtAS9lMtagd7rQM4KW4xahy2MiUht0KFHecTNJftK0+CrGEXy5A?=
 =?us-ascii?Q?CNYLh6QH2DGER1IX2QgUhBQaH1pjgfy930zZ69lZGIYt3dbuUsu9gRUWtrv+?=
 =?us-ascii?Q?l2ewl/DSICgRclEDdIASnab5VDuIuEC1Oxl8ISEHEmH9tX8gHA3J2jCP6fqM?=
 =?us-ascii?Q?eUc/coixWb29qXOG08cDSlNpfzRfkuX15bpmU75vSuK8haaPHeaqwDs52R0m?=
 =?us-ascii?Q?I3k5CagYCb6FndcZUzkNxLQxhDKu4Ae8Y2H2QNdvfo3Masm+3CpdwHK3Pw8i?=
 =?us-ascii?Q?XUgfu6Q849o7SRTVSsh9ydPJQx04RN/JDHLH/1I9PdrhWlQQWQf177hXiPMs?=
 =?us-ascii?Q?SEQ2hmhdmDuBxSvt0JhK3BQ00/pyA/GBPM2cDOqK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58340d6-a39d-4b89-c062-08dba3791f02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 01:34:41.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOgxi0w9YN7pKOtdawXzFjYc1R5lZqY9Wcs+cL3Yi2gceOaJt/tNdhETkgoCNRjyeculcgZG46+4E62R9Dbv4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-ORIG-GUID: Sg3tMNS7cMYf5aIEkM7JIaXr6DU1gQ0f
X-Proofpoint-GUID: Sg3tMNS7cMYf5aIEkM7JIaXr6DU1gQ0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104527

Changelog:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.10.5

* Generate cases list dynamically in run-ptest.
* Install missing file to fix ptest failure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/libssh/libssh/run-ptest   | 42 ++-----------------
 .../{libssh_0.10.4.bb => libssh_0.10.5.bb}    |  5 ++-
 2 files changed, 7 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} (85%)

diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
index 159994e9b..6346b72d5 100644
--- a/meta-oe/recipes-support/libssh/libssh/run-ptest
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -1,53 +1,17 @@
 #!/bin/sh
 
-# Valid tests to run
-tests="torture_bind_config \
-       torture_buffer \
-       torture_bytearray \
-       torture_callbacks \
-       torture_channel \
-       torture_config \
-       torture_crypto \
-       torture_hashes \
-       torture_init \
-       torture_isipaddr \
-       torture_keyfiles \
-       torture_knownhosts_parsing \
-       torture_list \
-       torture_misc \
-       torture_moduli \
-       torture_options \
-       torture_packet \
-       torture_packet_filter \
-       torture_pki \
-       torture_pki_ecdsa \
-       torture_pki_ed25519 \
-       torture_pki_rsa \
-       torture_push_pop_dir \
-       torture_rand \
-       torture_session_keys \
-       torture_temp_dir \
-       torture_temp_file \
-       torture_threads_buffer \
-       torture_threads_crypto \
-       torture_threads_init \
-       torture_threads_pki_rsa \
-       torture_tokens \
-	  "
-
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd "$ptestdir"/tests || exit
 
-# Run specified tests
+tests=$(find * -type f -name 'torture_*')
+
 for f in $tests
 do
-    if test -e ./"$f"; then
+    if test -x ./"$f"; then
         if ./"$f" > ./"$f".out 2> ./"$f".err; then
             echo "PASS: $f"
         else
             echo "FAIL: $f"
         fi
-    else
-        echo "SKIP: $f"
     fi
 done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
similarity index 85%
rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
index 4b2ced5e5..f33987acf 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
+SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
 
 S = "${WORKDIR}/git"
 
@@ -34,12 +34,15 @@ EXTRA_OECMAKE = " \
 do_compile:prepend () {
     if [ ${PTEST_ENABLED} = "1" ]; then
         sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/config.h
     fi
 }
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/unittests
+    cp -f ${S}/tests/unittests/hello*.sh ${D}${PTEST_PATH}/tests/unittests/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


