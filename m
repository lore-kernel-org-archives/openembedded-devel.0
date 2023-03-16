Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA477C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 03:20:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4481.1678936823671149930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 20:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=M2+RgMD9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=243924cef8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G32dd1021447
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xaE0xGYNn+bBH4fJRG45a2S8aJVw8UV3K8gbWe64aqc=;
 b=M2+RgMD970VkI+Kwrb9aE2eoA9QbGS56edAF0Qx/Eq1j0dvQI1sOBnn56Dw7YVtTIJI/
 ZzCJABv5F3X8oDzxWituOWruOXxj6MD7tyResbCLExzfkYpINOQv0LCBogcFuY9w7Lu6
 dwwRNOOAfIrL8oJlq8CXC6Ep29G+nJyLdy7uywarRVHH6M7VTioXKz3v6yF26K0Q0s8v
 GtUaU2gikaFh8zXxCpvthK8bvrgUr09WMGzzH0t1oU7XanQ/xPkM3gdxzI7LvlTFN2Iv
 YlMqLHvODXE+8ItygE7wuUPPnqZy32EIred1n+rh8Bb5FDLA54w0CkM1aaFR5C7Ms6/s qg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm784dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 03:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4XYzn817W7hW+8eZveqS3zG8dFZl4SevD3VJEmQgrmAOPFB7+z6tKH4V3pw2CEkODA2xjnxdOFZqUq9gX0wy/P6BkUu1wVjkdU/6RaF46j1TKCpPXWXjl28I2bEQ+k2tG9Ch2gKkQH1ZZDEd1m/ZCsIKH58dpXIVAQBrjOEz46LnQc6brOTetEiH2YtsIxfHQhDCkJDfL+vrIKwNvvwBIiXFMQlB051bgiqiPhrFnqVsIl/JZtDp50H1upb8Z33ofTH6S3TM2bTHSnC6QqfOelEaF4ImvzVLAHUsklzRFjMeppyjdC/gQDNEHCzgiAhsj611QaIG/IOEEhF8YITxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaE0xGYNn+bBH4fJRG45a2S8aJVw8UV3K8gbWe64aqc=;
 b=bRHTGBABmb9gOSLs5z6rahfsfupJpCrX3mmouNZuzTkLHBYpyebjzJBXL8rh+jg1nbWOmB6F7NJ1ZO5YYQ9Vm449zehzQEqH41RrrmfB6RmIQKEZtrkLOyYxiZKsSO7+wwyZa6CsZd6p5ScjFy9/457BlCsE0nh4x4mAB3WQ1OY4msqIzELx7FPsxLPyq78Qlatlt6nsf0PVc2mpDc1f4R9RCrKq1AhEHCW4ssEHQFcdxtqpOZlixpknaQR0TOcBheU1HGS7kq/bLNvu4dsMzZKRmtjk9dkXDw0k1RlrAEY/YPAqX+RkYArycu5s5+cj3XCpOrwJIgTKYYC9gjxX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 16 Mar
 2023 03:20:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%6]) with mapi id 15.20.6178.029; Thu, 16 Mar 2023
 03:20:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: add ptest
Date: Thu, 16 Mar 2023 11:20:10 +0800
Message-Id: <20230316032010.1691406-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 632e63df-f91c-47f9-1154-08db25cd5f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BhcjxeK+kCJp/7bFvKuoECptAscfzdWuaHCRveOZ5Xok4V+KoUOfTl5QVnQWzr54B4M1dv87mSMubCOPZ5mQ//1/Qf3L9ylCG0zOfLK+bx/srq2mReXyJRQJQJXAEXkLRO65zrAZlFN/rKC9SxVZAcpQCUB8AVLi8BQXCVZXpBF3AFE27eVxAQM3nUj89bZ5UPMpjf/+PfoRJ5Q0aRmICNRBXi2C2Hfum6A6t0ClhxafnPL0wRlqUcHTirkdM6lfc8rJWGcI7654QlrB3asaHXzqxWl2Q2DxjPoKAH7P/ZrhjKvYZ7+6ikw9S/akZU4Ff/4dNHhof9F8473bgN1+b9Qt37H7afEolqlu/7v/IPO0sUITY3NWzySxRvit+yLyKWdmQLe0qECBmfMydCvd7bZ80dUQdqdJ8UGkh92WFvvf9NfymRjVK67H1t4Dpm2zj1+Ob+L+T82tuhLGlbeZNdf+2PD/ugH3ErLKTJRKrCY/L1O0mVzGtghfZ2NCBbnh/jaCLf/KtyNeswNT712kC+Su4zZD3AgoQoWEfhuV0rO7+BWXZoX3O+lxApKnywsItWmm91MsVGbM1rfEO5jaLocWbg/uu7i4VWYNqLnek41FAoprIifcEDzzLMpbKt9vs/APGDy7ByegbGMV2RoVOMg5jdHvqNCq/DB2zoouNLKldQhFd09ksEuG/BN8GdbDp28pAwiimqVRv7+loct4aQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(39850400004)(346002)(451199018)(52116002)(6486002)(41300700001)(36756003)(186003)(6506007)(83380400001)(5660300002)(2616005)(44832011)(66946007)(8936002)(1076003)(2906002)(66556008)(8676002)(6666004)(6916009)(66476007)(6512007)(26005)(38100700002)(38350700002)(86362001)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ACaaPQzyIF5MPNdDIO6c5Eb0bYsqPF39fkiMhS06bgkxMSYCYWD/J4aVUCRE?=
 =?us-ascii?Q?kT1E7GmACayUBZQURqdjSKfwIwdqvjhJtjrqqQSuwryD5QDwd73X51H6QXUb?=
 =?us-ascii?Q?4VuTI7quG4l5RZG2Ob7h9tKGpZG2s4UfDrQI1fsiNp7uHwMnhpGLHZn3su8p?=
 =?us-ascii?Q?dKGeaDd6AddK43Mc0Aetyet5yBlIaPcVPFAO8Hk9BpaVExB2WTL4wnIn3SWf?=
 =?us-ascii?Q?J7fTJMb6/0umDyj0oJrTBxudML4vWqs/zn8OFFRZ1UNvE/08sp3gbZW1Tyjx?=
 =?us-ascii?Q?kvVX5/XRfxyydn+d6X/PX/2B4mI8YxXlB1xjVj7zK36mEdWwNxpgTBCTIM1O?=
 =?us-ascii?Q?mrj3IrPBPQ0k1hiPZSqSUltzN241hNUEsHLzvTs0T83hDIbDmdmesyXQW+gW?=
 =?us-ascii?Q?tj24YH6Tg/ZWLs/6lXcOQ67Vm2CZoLdROleomWtOjvkONC/4adOEPwppM99y?=
 =?us-ascii?Q?qwTr9W88On9uHs3v+wfAG5XrVPuuEGHx4FLCOTChqNMpwRIQYjBMBoKS8Vs8?=
 =?us-ascii?Q?BMr8T+d1sUDsxHQ2z+FKyozYeXpWbpnwu+UxL7+htHgHHuQcrg1ildWZzUgg?=
 =?us-ascii?Q?JyYpq3pQic9xWzDdTp1QQkZfeDO6EqoyCt1cOr0p76xo5YM9/UHKzZ2dwgcd?=
 =?us-ascii?Q?LylLusM5BUFsajALaGQjP035vhBaOr6nxwOuGmS6CyxLiaU05w3m+ooKA/uc?=
 =?us-ascii?Q?kP0Bm9zzSVWuH/5ipMdTxAJbxIYGjNKDsJUNp3TfkqMGuL8cl1bjwPbSHJ3i?=
 =?us-ascii?Q?hjC8ikOexzVz7XHmmHmdhDrqzmdGMlpujX2QTwXlzc3xnG1qQZ6pcHb96Okg?=
 =?us-ascii?Q?NnPQNPd9rMFyH2xYAvd3nj0xGNTRQRPg9Gp+RSGnHyVJW4OD2W4eNi6wSBCO?=
 =?us-ascii?Q?nXWRokNlrHS7JDXcgq9ya1U6HrOMzi5Ub1BdX5qQ3S6NToX1ao/EXJXkWHvO?=
 =?us-ascii?Q?xNlvIEewum8sA9v+lDyMfPNnR9ClC0yEq0MykrMpI2K8+sskrNrSWjD7bGju?=
 =?us-ascii?Q?a86JTcfJ1qbioTK0/eUmTkUXVN/P8PHdpV5s9FTj/sDm9pzwlIwhQ03WnlKv?=
 =?us-ascii?Q?/T9RoB5KUtszfbxrePE2XLFRV1qlgHdI8RyQKqYSUhuTAG2tIE9jPHT5Ajne?=
 =?us-ascii?Q?vUAxLBYCyEhZXDGX+SQA8dGp9F3P8M0MNaj1EndNi/sleX8UwxT7PFBR9mV2?=
 =?us-ascii?Q?cSLYrKs/Olmsxazehit/OIW4YeyNfF8MHzpS0yNqWjHcx285GOPH0qEtUOhc?=
 =?us-ascii?Q?NLpeohkaJv+cAsYE0IAr8QPDGWxCSguesmATCUEkXWb0mw4FQeK9T29+DeBN?=
 =?us-ascii?Q?lnfaISpx7lNOIadGSOqlt/3H5u+66L00zWysMsZWVvbDR4YJkFLk64hNlE1/?=
 =?us-ascii?Q?77fLAjQL5POpZIl3eimRphxoKtKk5XfDIAnmCVF7+RJvC7QyFtv0nAG/8JYW?=
 =?us-ascii?Q?J5uwUdK2kzBN6X4m/P1MUxRhhDuxMJbmfFwG+DEXIn3oL/tBuW/NekDQQ7/p?=
 =?us-ascii?Q?hSrp/BwuyuxJ6whD92SRy5WqO96m/7MYORXMZQkEFiiy6WkC3uZ6tEDPF0Nc?=
 =?us-ascii?Q?gWTv9tZvhlP32MJajqDE7VrrH/E7kJ6qDoWYpzwC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632e63df-f91c-47f9-1154-08db25cd5f1c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 03:20:20.0237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op4jWPE2L/fjn6vej6pT1tOdxLrGRXTkr4zEsiks8G12A9wvG76BMi7yoWrUrBUa4aQqVWxqR+XTlkapqlnM6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-Proofpoint-GUID: AxA-LsPwyHu9fbpmZVg9lAjlhChjPax5
X-Proofpoint-ORIG-GUID: AxA-LsPwyHu9fbpmZVg9lAjlhChjPax5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_01,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101569

Results:
$ ptest-runner libssh
START: ptest-runner
2023-03-16T02:56
BEGIN: /usr/lib/libssh/ptest
PASS: torture_bind_config
PASS: torture_buffer
PASS: torture_bytearray
PASS: torture_callbacks
PASS: torture_channel
PASS: torture_config
PASS: torture_crypto
PASS: torture_hashes
PASS: torture_init
PASS: torture_isipaddr
PASS: torture_keyfiles
PASS: torture_knownhosts_parsing
PASS: torture_list
PASS: torture_misc
PASS: torture_moduli
PASS: torture_options
PASS: torture_packet
PASS: torture_packet_filter
PASS: torture_pki
PASS: torture_pki_ecdsa
PASS: torture_pki_ed25519
PASS: torture_pki_rsa
PASS: torture_push_pop_dir
PASS: torture_rand
PASS: torture_session_keys
PASS: torture_temp_dir
PASS: torture_temp_file
PASS: torture_threads_buffer
PASS: torture_threads_crypto
PASS: torture_threads_init
PASS: torture_threads_pki_rsa
PASS: torture_tokens
DURATION: 24
END: /usr/lib/libssh/ptest
2023-03-16T02:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ....txt-do-not-search-ssh-sshd-commands.patch | 38 +++++++++++++
 .../recipes-support/libssh/libssh/run-ptest   | 53 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.4.bb   | 21 ++++++--
 3 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/run-ptest

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
new file mode 100644
index 000000000..0c7f53029
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -0,0 +1,38 @@
+From d2525ba0bc7b11de12c54ea1a3d1eb862537136d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 15 Mar 2023 16:51:58 +0800
+Subject: [PATCH] tests/CMakeLists.txt: do not search ssh/sshd commands on host
+
+It will search ssh/sshd commands on host when configure. Since they are
+not required by unittests, we can skip the search.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tests/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 22a36f37..aa32ca2e 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -86,6 +86,7 @@ set(TEST_TARGET_LIBRARIES
+ 
+ add_subdirectory(unittests)
+ 
++if (CLIENT_TESTING OR SERVER_TESTING)
+ # OpenSSH Capabilities are required for all unit tests
+ find_program(SSH_EXECUTABLE NAMES ssh)
+ if (SSH_EXECUTABLE)
+@@ -293,6 +294,7 @@ if (CLIENT_TESTING OR SERVER_TESTING)
+ 
+     message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
+ endif ()
++endif ()
+ 
+ configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
new file mode 100644
index 000000000..159994e9b
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -0,0 +1,53 @@
+#!/bin/sh
+
+# Valid tests to run
+tests="torture_bind_config \
+       torture_buffer \
+       torture_bytearray \
+       torture_callbacks \
+       torture_channel \
+       torture_config \
+       torture_crypto \
+       torture_hashes \
+       torture_init \
+       torture_isipaddr \
+       torture_keyfiles \
+       torture_knownhosts_parsing \
+       torture_list \
+       torture_misc \
+       torture_moduli \
+       torture_options \
+       torture_packet \
+       torture_packet_filter \
+       torture_pki \
+       torture_pki_ecdsa \
+       torture_pki_ed25519 \
+       torture_pki_rsa \
+       torture_push_pop_dir \
+       torture_rand \
+       torture_session_keys \
+       torture_temp_dir \
+       torture_temp_file \
+       torture_threads_buffer \
+       torture_threads_crypto \
+       torture_threads_init \
+       torture_threads_pki_rsa \
+       torture_tokens \
+	  "
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+# Run specified tests
+for f in $tests
+do
+    if test -e ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    else
+        echo "SKIP: $f"
+    fi
+done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 3a57a728a..801644d95 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -6,16 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10 \
+           file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
+           file://run-ptest \
+          "
 SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
-PACKAGECONFIG ??= "gcrypt"
+PACKAGECONFIG ??= "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
 PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
+PACKAGECONFIG[tests] = "-DUNIT_TESTING=1, -DUNIT_TESTING=0, cmocka"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
@@ -26,4 +30,15 @@ EXTRA_OECMAKE = " \
     -DWITH_EXAMPLES=0 \
     "
 
+do_compile:prepend () {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+    fi
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


