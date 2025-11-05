Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C522CCCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 04:56:03 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2135.1762318563050023331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 20:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=im5S34KE;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.66, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OI+l94RcfNIByqc7KT6S+IXUecPMEvootUrxFi5q5f3Y53/29smBiuaBFEbTmBDKhj+5FPrUCg69kp+ZeGNMYwdD6x7m3m66lpOpTTSWyprzqcNXXAxWnecWfGj49udgcm64pJMLjUuTkFkQ18VdAx1MkZ3OouF7mmvt/WMhj9HliFZelJxsGXQyeApCWRooQ0ILsRjeNyISgyeXARBuD3BLxLOA7NiyqOmZBlYb4U5NJ7wCSgamyeEFKj39DBUyHWqtxb+25wgBbl8uV5LXMbQX5RQz6xcby09NfhCZ63RO9iZ85QtepAH04BxbunFVDBAwaWYMq4wb3tD55EBdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c6tYdJ4akemWcWhPad+TOo+DN39VV3IAzeGTw8rrk0=;
 b=quQKDbeFQJLVsa3l3XjXwEHvWz1NgqkkGkZOvmo5egytO6neoxxulYbj0PoI9Rs3uQI6ZPe7o5xYpiUz7PPbjUk5BpZ/jp0VGwxXnqnIMUmN6YxBdMGTvFEuNTzItJ9o6jq2DhMbM5RCxX5YWDtjVfcdW9RFd7Vc/F2636EbXlQetOPDfs7gbRbKWCRFYppnLI4784B5piRhTsuZB42Drwq3mGmgpoCq1O41PMrle5ViLqFiNGe0kKqZjVz7i1I5K9iFYxPPOI5FuZQT4lLlyL0FH5ezkCXBpKXiaLiWJd2PLxwhkNIWnM5E9aNukdTCREjE8Z7yVwLygBLqegKLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c6tYdJ4akemWcWhPad+TOo+DN39VV3IAzeGTw8rrk0=;
 b=im5S34KEPji9xgTPkxuP6XoeU9xIonwbmQa9P0kpAQLzNg+y6memruip3V1nV84y0Rj9OLv+Q9ej3gkoWxYuVkOjUBMxExRs6axuRWq+T1jT+R1UlVFpTC7ICp2fAGtKBEA9UmgaLuukQ9ShrPmpfJaXIDQcfTc08Qx+ZWiIFIuJbgihNEkydawOcLiAbrAq7giamkWscoCXMNUiqo/F4OLLiYH8RbBHm/7O2xoKZAMZ4X3uEiBPe2wqn0zZVEZRFeEiwt2Cd3MYVaLD/RhZnwTxI97JWrHzc5XJT0m4IbvuFTMErpc1yzMaXJsCiPtQXehsoBhRES9JUVhXkt2o+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by MA5P287MB4800.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 04:55:55 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 04:55:55 +0000
From: Nikhil R <nikhil.r@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [oe][kirkstone][PATCH] inotify-tools: add ptest support for inotify-tools
Date: Wed,  5 Nov 2025 10:25:40 +0530
Message-ID: <20251105045540.793451-1-nikhil.r@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1693:EE_|MA5P287MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d280a7-6857-4fa9-4746-08de1c279a46
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?02/tJ4EbGDKUrjFb45JLvCT2z5eVI537ABP1T2+PDz2gx3tY6Nnf4H0fwWTg?=
 =?us-ascii?Q?OB6MWUJYr/sawNYQnPGcTrCmv5nwSyJi/ms/rB60qJPxUlg9iclgoiFkXPon?=
 =?us-ascii?Q?U0csW8VghFUQl9K2+iZ8OESxZYcTu2YCnXl2gj3gQ0gEo2d0NxkBfDa6X/CP?=
 =?us-ascii?Q?o/+cXt5BqTfRjaJtghik88x6qLkWHoS2KDHOb4UdjUVXMCuSOlcrMIeWOeLd?=
 =?us-ascii?Q?mO20cyQyxdJImHKl7FaPcFFLs2rS2bml5t2pExsEh/L/J96cvAgg9lw2aJfw?=
 =?us-ascii?Q?t7w881LTsIuR7llJnz/a7TkKvGlKtKT6ErELtk2x3YSJVDQTMoQKQwiLmizi?=
 =?us-ascii?Q?Zdi5Rigv5vnkgDHJJt5oT15kgIiALnUel2k12qwkxwWiVQYiE5PlFv+X/lA3?=
 =?us-ascii?Q?F/5hT5m8l56U6CyXoaqKBX0SPlE90TitF9q2a8hvuWiNCtob2y/S80RazfKm?=
 =?us-ascii?Q?RsPuLL1oQYkKRjYmjuVMjKBaw+vxzT4Znu99zPlSB0QgKXKOVv/dfR1jNPF2?=
 =?us-ascii?Q?UULuWZGpmvusLTT2EuIERN6AL0yRxFx+CPGJ4wdusxuSYkKbDi0mjje23ABO?=
 =?us-ascii?Q?lXuB+FQ6cOuXZKHmECz0ERBnDpPN5n8b3K6RIQb2QaKldtTEoCtaI5n8EAM3?=
 =?us-ascii?Q?8zYtwCFANsPbZ0GdkdyFab0m/uNdOcClGQvaIV9xqxpOxjY0/PcgsIBsFxw/?=
 =?us-ascii?Q?wJnChrQq3PF+NtGEOj2SD5cL0kZZ6XJgCGZDK7/CZ+BM86lqQohAI5AOn4hi?=
 =?us-ascii?Q?5YjmTuzLgYMtcQO/JvKsl6CyZo/9W0AV8X0nIu+lbp3YSCdtF5I8gokXYcJb?=
 =?us-ascii?Q?yDIO7bE6gqM710q+ZY+M5jkaf+tlUMud/+pOHcv1GKPM79lYUOa9bm+lWc6b?=
 =?us-ascii?Q?0VtwaRXUca3/7w9zK42pXt9l/73wNfxq0JeAM8w5GPI5mdMOZEpxmuzjT+6R?=
 =?us-ascii?Q?iM970iVGSt6LzZXPNN+6aD7+KoU3l6F9kZYSRME00upGS3Iw7cdjgkrjVM3L?=
 =?us-ascii?Q?mK3ODFtMiEHOQPAqnyaf6fkOEXTDUxplbeOspQM+l7ncZodvyugA0vXQ5ZzM?=
 =?us-ascii?Q?/2MFIVBk34AWYNwjsQDPq7IQAABtdZztSVrHrTt/lYHBmXzpv5TVobvYJ9Rs?=
 =?us-ascii?Q?MVcT9Jb1PP3O3lBsYQLkv4eXfFmvXkuJmxCGGfPzeyHfmyjfRhho5TcSfjFB?=
 =?us-ascii?Q?OIBwNtHgHY9sAQajUNPTFBchdlX0zONPKNmGiQ4gYnOl6zsCcUWZFhim0jCU?=
 =?us-ascii?Q?4tzM+Tr1Whnsfx2Ls0X9/aieeJQUKZG96AnfME5O8XDQABZ9z2T1uwjP7cZt?=
 =?us-ascii?Q?xHrzrG9DvhppP9lmoQMEJyv3Q/L7KqgF07bzlKek0RNVKAVJpWs1h4KmnXnG?=
 =?us-ascii?Q?mhu5n00b/sQHluCFNfHdicDM3E6npXNcScOpNfycFsMEoNlns1i0nK1kyAVy?=
 =?us-ascii?Q?vpDAgjmtNnNMymX2iDFWJA2oQb7heeRQ2nd7o9lsC9slhfWvAgFKwCW0qlvp?=
 =?us-ascii?Q?ObuqFz70IKWh/Iikmmo8P9uRcp1tAxNNQi1E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?52NdCsr8rk9MjktzsNUgWxO2X2+UxJfVYpo3u1rfEMDi/rhdZh20gRXMRFyx?=
 =?us-ascii?Q?rSTpz2oeFAPHWrMqlinv+223aF0iXL3Bvdb2gvsi4qw73nljzkNtAN5IimWW?=
 =?us-ascii?Q?1UK2QUiO+Esjmm/Dqqjiap5f8oqNrULTFojGAHB+/fX0MaX1/Sp7uxrxW5NF?=
 =?us-ascii?Q?WmvhA04MMOQaIjrwRHGLBfv95oXwYuUL86xvxDCeX0Cn0mpTyLkdPBl5M1Cb?=
 =?us-ascii?Q?pgJRskcCO5HaJDsWDQ9nF1ZqrMZ4ZrglGrgr70plRlhzDkf1e1MUDmi8HClG?=
 =?us-ascii?Q?fyM0qwj8G2RllZL8b8Jg7kkOVq7tuPbaVK8T3yewBVf8VoW4cDNUTStQCLYs?=
 =?us-ascii?Q?HlfK7y8KFY20XLGWvVs/H4yZte6jMUYCMh9F0iPHh2XYEuie3536jNMIqnyq?=
 =?us-ascii?Q?kJvVeJah/CPZaifyw33PrYja/K6mxAMzJk+1fZWCniUI63t3gSBvbQaB5VeF?=
 =?us-ascii?Q?1czmjMO2ovtIOA2MBrWMcWjAQi/2pABFTdi66T+DoZBVcWhBit4Apd1UY0U8?=
 =?us-ascii?Q?k7ZO3FvKOLoRAqjyOYhRfutu5DztCi+PrBZNj5QKXxj3c/hNoR6RLapD1U1f?=
 =?us-ascii?Q?b5mlPLSbBGDiFdp8z7D/6I4Bt0MRpnE+IJaZNceR12kTp0QX+0SWl3XLsbAU?=
 =?us-ascii?Q?e8k9LLdHDZRYML5NlQIoXbP652AMv3UV8A4f4tJ1JRni8ch7YsNYYt3M/dAb?=
 =?us-ascii?Q?T7EMYyZdWkFgrjzple+bJEt6glVq47NLsLRx3JVh+Ohu43CjdeKBLKwX069l?=
 =?us-ascii?Q?E3h7y/R4Nx93hiwr+V7tSwy6L2FczWUm0yck923h0KoMQS6y7I/bzzzpmvwn?=
 =?us-ascii?Q?wWuHDDGumJLEdAkSdnAVzE4pDJDqvtvIlfHjFf3AAFTNye7EhUIubTxirzvR?=
 =?us-ascii?Q?RRPdZndZxUCTUEGHDzdkr8koTepDlTzh1UqZl/5qtAsmQH80TiY1OrZ951zf?=
 =?us-ascii?Q?Gvlt1sv7QqPvwazvva7niN4CpWmcpd0v7DcmRMBPLWrFuLjTFxBnyjpBepHd?=
 =?us-ascii?Q?WG6wyXWacuWav/raVEFVp2HnCt24OtZ60sOY1v+skowgUgQE6c8mV6w+iMSr?=
 =?us-ascii?Q?h/cor1XFJFtr+xRgFyVaIA0D1OxmQ8+7rFx1/nmvxXJZj8JkTjWNEiPqC676?=
 =?us-ascii?Q?D3+WGL92KWrZ3tbG6zbh9ZIiFo29cvo20RqzvLWKt3UzfWyEmoHgox8/mbw2?=
 =?us-ascii?Q?xqsMbc+SRm3iSBHP5qF2ZYNPOsrCAat46Wjq7hKfjfsT4NSIbqDJbohd4Fjn?=
 =?us-ascii?Q?QjeGPahAHc7leEWzxJxZTLZ7zqILt5EORKPKGIxjXbK/16Y/HFmGaCq4TOqH?=
 =?us-ascii?Q?Oqfg1dsKK/10k+D46s3BiV9v6bgkI+bMIH1iDJXr8NGjj7nNJuDBJ1B4DMAm?=
 =?us-ascii?Q?zYxmezxHh3dIrlhxhwdGLQLUCRI5j/c5J+itDhQVDuy6neYJJafQJPmiCIeP?=
 =?us-ascii?Q?qAVoO/MbIniqd3yyVKRuuGEpAM0D69/R6rWM/J2C72l8ohaRw76Ji0gMFEPS?=
 =?us-ascii?Q?LU/Sh5YEPnsXrWqnRaSVuQAlMYiQeYtvkjZHhj48VeCYCzYWP9MERzabqYBM?=
 =?us-ascii?Q?PELMK3ovZP8/9yngxCMDEncqwNSuD1sX8WLhfVmR?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d280a7-6857-4fa9-4746-08de1c279a46
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 04:55:55.2412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZX2yRTKAOdzMPqpCX/WD3YMlZyj6vhxK+h9czWbOOpyffSwaW+X6gHzNshFBN2Tz6pJQF8Bu8verLaQKr1fuPWGye4H1XF2lGOj8ysw4SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 04:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121316

Add ptest support for inotify-tools by introducing a run-ptest script.
The ptest verifies the correct functioning of inotify event handling
and related utilities.

Test coverage includes:
 - File creation, modification, and deletion event monitoring
 - Event handling and command-line option parsing
 - Basic consistency and behavior of inotify event queues

The ptest completes in under 20 seconds

output:
root@qemux86-64:~# ptest-runner inotify-tools
START: ptest-runner
BEGIN: /usr/lib/inotify-tools/ptest
If you want to do a malloc trace, set MALLOC_TRACE to a path for logging.
event_to_str: test begin
event_to_str: test end
event_to_str_sep: test begin
event_to_str_sep: test end
str_to_event: test begin
str_to_event: test end
str_to_event_sep: test begin
str_to_event_sep: test end
basic_watch_info: test begin
basic_watch_info: test end
watch_limit: test begin
watch_limit: Warning, this test may take a while
watch_limit: test end
tst_inotifytools_snprintf: test begin
tst_inotifytools_snprintf: test end
Out of 362746 tests, 362746 succeeded and 0 failed.
All tests passed successfully.
DURATION: 16
END: /usr/lib/inotify-tools/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Verified that enabling ptest does not modify existing package contents
for inotify-tools

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 .../inotify-tools/inotify-tools/run-ptest        | 15 +++++++++++++++
 .../inotify-tools/inotify-tools_3.22.1.0.bb      | 16 +++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/run=
-ptest

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest =
b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
new file mode 100644
index 0000000000..c45b75e387
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+# run-ptest for inotify-tools
+
+# Run the test binary and show output
+./test
+status=3D$?
+
+# Exit with the test=E2=80=99s result code
+if [ $status -eq 0 ]; then
+    echo "All tests passed successfully."
+else
+    echo "Some tests failed. See output above for details."
+fi
+
+exit $status
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.b=
b b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
index 4e6bfbbc27..e8ed69d449 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
@@ -9,11 +9,12 @@ SRCREV =3D "4b72dcd15299e1d0cb096397d9aab513ffed1657"
=20
 SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dhtt=
ps \
            file://0002-libinotifytools-Bridge-differences-between-musl-gli=
b.patch \
+           file://run-ptest \
           "
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools
+inherit autotools ptest
=20
 EXTRA_OECONF =3D "--disable-doxygen"
=20
@@ -24,3 +25,16 @@ CFLAGS +=3D "-Wno-error"
 PACKAGES =3D+ "libinotifytools"
=20
 FILES:libinotifytools =3D "${libdir}/lib*.so.*"
+
+do_compile_ptest() {
+        cd libinotifytools/src
+        oe_runmake
+        oe_runmake test
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest +=3D "${PTEST_PATH}"
--=20
2.34.1


