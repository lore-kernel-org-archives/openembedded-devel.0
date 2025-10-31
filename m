Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D8CCCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:42:35 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.91])
 by mx.groups.io with SMTP id smtpd.web11.9529.1761896552078626486
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=RinRlYQC;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.91, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx4Gt6kSVugceW0S1pQutG3nHR5ir4hllaeJXSZX/xk3djuQIBsuzxig3iH6tZSweEXmUpQ0ZtoNKLrRkgmTZrHwgk2sk0HOImmgZjDYKekb0radHaWXH0UG5NHkRLCInQzGrq6rj5vTO1n9P4VHQ5lgtKCSUIazUO+3hJGrPNis9iTm9rwTnOXjqL8i2OJyKM8UO/V8XAt7hpe3slAwjjbUp7otdNGMznWhNr2LfR1IWzZN1TQmdGYhil6gKpRXtsPJNADaW1S3GJhYSDFAtw7E6AO7E2AsIgKnR8tPhOI721EMpHi2BxNjAPiupbi8Opf5RztS6+TmynX/tblBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLdUWws415lO8zLlHB94iTiMULx+xn07ryednyMBxn4=;
 b=NFcZ3hc5Uq2phg5S8Pm8WyPUoQLJOeygLlCuIGDwjuTfmhQIoKRQXLOF9sCBRdqMv/PsUIxFzN1x6hXcLezdixIQOvrJ7w/kjdGx+G8M4LTuzHseBmW0khbYYNo8a8m/PxUITJ3Fw0Bsw+1YioQ6AbhUYQtqOEfUnaS70hHU+k6LitxI4ZfoYYrUarxJB4gzKjd+JwW42NLNwSiXqI3WAEBnLi+1vM1/VeVoKbULBJ3O+jTOYqlxUEkPx/a3dxQDGEebRmfvs2l6NJNY4wl2CPdkYkSyzIiPynUH4aCVuVny2GEEPpo6lH7A9ecikvR+6BupPFCbVPIsqt42+DaX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLdUWws415lO8zLlHB94iTiMULx+xn07ryednyMBxn4=;
 b=RinRlYQCsdJBTRX5H7H2Yca2nqtNxtcXcnrJrh8t6PPGL046MBkpdWrzFMvIEWUuIppuaBn7IL5j9MW7rs9XlBfnYBxbkguXGmIWWft7k5+5dAL0ChY7mXGFFAnhnIpMkAI4CeTFoj0N1aTjZZQNzrbuutJqoi7li5vTpep1ViGkeIj2wPZpruXhe3S+i2H5epAuWZV5VQnZcAFa44pxfClMocDfyeqstE71garaj/TqnKouAuz8z8MV/hNFt9PmTSPfojrkjO8EhEinfrlkqrKz7FJkK37zohziuan9+QfKfZ28ks63naEoeuTQh9EN6bb4rTHcLHtZiGkniGxn/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by PN6P287MB5103.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:300::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 07:42:25 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:42:25 +0000
From: Nikhil R <nikhil.r@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [oe][scarthgap][PATCH V2] inotify-tools: add ptest support for inotify-tools
Date: Fri, 31 Oct 2025 13:12:06 +0530
Message-ID: <20251031074206.132589-1-nikhil.r@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::7) To PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1693:EE_|PN6P287MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de9ce55-d901-483d-96f2-08de185108ca
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UcWcK4jmtixrJWk3D2WWPxEbNb4sZELmSqRRHP49hPxoaxFiGjTXFGzi4Z1P?=
 =?us-ascii?Q?qLycNgHcBsfLuM2xrpMoHp1A2Kep6vO0vjP3umjg4c8c+DxxBpS0Ae9Cby/q?=
 =?us-ascii?Q?45YPgqkbCa/C6PaOIYEiN/h5fGiYYOFOQAPl3A/tCegzMLsj+zUQe/jLpUBm?=
 =?us-ascii?Q?VA1QoHDK4KRT1rEnFTtXqmFhwqk3yrfJMKN1DMswOcYUik+ajVvKA982F0sE?=
 =?us-ascii?Q?6nsfcE9w7xO+bVsNqgdYVBG6xOkhP5fEe0EHB1ifAbQ87c6QiiaHKm5tmdy7?=
 =?us-ascii?Q?b8Hu9/9ywJjMZk8czHSx5/6k3I0YFLMVVTvgz/hgDaJeTjOvlKDQGHAFBNgA?=
 =?us-ascii?Q?yA33McW7HXivDaxIDoKdMIX7vnfmVTe2i8JT4MObLqRajQj/um+3qTfzP1Wr?=
 =?us-ascii?Q?+Adeu9MWtq905vL/67PMFlyDmwlOjF2MsjIwCtJ7IMfleGghKkXCCmOfkhqk?=
 =?us-ascii?Q?6yy2l9WAb9lSr9VqFBqXuDTzsvj/TELEfBPi6flhEIFr0r6jRehzabNuouOI?=
 =?us-ascii?Q?jGm+ao2AiNPYHaiC6KA+H2/ibc7XqpUivVBq4EFwv7aiF3bvRFOULxrs3v/m?=
 =?us-ascii?Q?BuuHTkmhFEkNiLrcyam7KwnUZXIxtneG2Bckq8rWYmzGRCFID/h/4hYsGPZV?=
 =?us-ascii?Q?y7kx6IXDT/851Yg+CLHIIYwpDvP1yTjKcrVL9uKO3w+lkHVn3oUcJbcO4ise?=
 =?us-ascii?Q?bRIgzrLI+zE/9tC9CPKMMrrzDl5499cycd3wg69yLo6a/2QZZ2X3TJLpVXvz?=
 =?us-ascii?Q?4n/IplpHKq6woT3mR6PF5CVMk8nRDX/alYbAhJ5njY7XIoFM8af2WJbI6zII?=
 =?us-ascii?Q?HADmyZrSUzAOkZLIxLe61TgzpWHylkap7J8bs2Pl5HpFbMM+PHwrX1EcB7t6?=
 =?us-ascii?Q?OXHrbzNmJmgLTzBn+yRjgLLCiacKch5QZSBe5FpMOffyZoEdE4ZZcsIxCpuw?=
 =?us-ascii?Q?1PhxaGh7DXuEikcEWn2gB71ehsennfA/QjN8EibRnCE5uAe7hsschc/ly0NQ?=
 =?us-ascii?Q?NerKYDGGjcXUOcTtYar08948J+SWjpxL9bLR00tgdF7SiX7D/EiKe8u7znZh?=
 =?us-ascii?Q?AFc+/4Wb4bpae7hJ1Bk9D7oviWHiLleyRbSD4HcpnO+FnVnDXdJs+9RZ7G/8?=
 =?us-ascii?Q?D/ErpNLZpxE+9Y2LIsTOHlkwMByi91BWojbO+j0z0CcvoMxK44iYlrnmIv7l?=
 =?us-ascii?Q?r1V00Al85JQvOfJdcK/fmTH/7DzjXdGCXm6oCQYexyWu1wUHucg2mhNV1rbK?=
 =?us-ascii?Q?uMgorLCYW/yVuNr1ELyEFxcyougnPwoHA57kOA5xGFxJbM+KBh02+h55bEt6?=
 =?us-ascii?Q?PMkHRLP9TI70/FbXbtlucA8V3plY2T1H1O4xRoLz28negIKCordklxJ85Db7?=
 =?us-ascii?Q?uE04E9cn7yGduTbcvUsrzWzHCY1H8HXnY41Q5glh3CUlGPwWwuNwh7oKtXbr?=
 =?us-ascii?Q?leWnd3Cd3XX1gu0YqCWBciR3uhDpVZBMBKV8HybIgH3H7PwSW6i8IPBTL6Ao?=
 =?us-ascii?Q?UFIvHuN/ZWTB/Lf9gsIdnrtpqv4EH9SVnHd1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/j+vDJZ3ztUyUitl3FIc5dFJfvf0pq5sACYrQjT44Lh1GQy34eZfWL3L4Xr1?=
 =?us-ascii?Q?WvuitvZit87GXjltXdJMypj4jlUUFeTE8BG/QXwJsb9GuU5WZ/oH5+BYns2o?=
 =?us-ascii?Q?SW5CxcsC7pU5cQlRFsQYGLzjEHmTdxdCA3R4NZY+VNp4Ad5U3rR9lK4yuhwc?=
 =?us-ascii?Q?GzbxboJWf0bjtzi4eCvTtMc9Pljql3uPS3aQdaSW5fj8JUjkDNLFHtixjx/u?=
 =?us-ascii?Q?tfe0Spd6TsZcw0uy0EzE4XIVwFamdQAkvoNLD3RbsfzgboJA2T7LbnT8bFyF?=
 =?us-ascii?Q?51NtntaHmZe6e2HVikdTTZjWFeWeIx3GLORFXfHicJWpWAA678PPKhasVW1Q?=
 =?us-ascii?Q?WsUQsmpP2crt2ZBG0knbKgxoZOVKe5vkcUe6RPBhphVwttMvAhQNbf08bDMz?=
 =?us-ascii?Q?z6TDqqWZyL4gmhCHclMD6ebhEJIXVJDmdmauk6gEqspcq4Oi2RkVOnOOmH/6?=
 =?us-ascii?Q?65I0fChc1lld/z8rfYp0OJy3Y2BzuhiN2kwWoO1fq8CpPuuAn3+KlJXcGXJN?=
 =?us-ascii?Q?8/sdg3IHbZWXu0Cz3C0GWDQ5w0qAfHsDd07wa9yrVuZfqXN8W6Fd6rPS6VXR?=
 =?us-ascii?Q?YhaUdDev9Td+mInJknTwj2YGWTg2x1i/ErtRqQ7I1iIIpQaKdqBvJuTqW8d2?=
 =?us-ascii?Q?HABqYxg9G2fV2jb5bosFLRJSN7vucsvRKZSRc1HJJ06mpi4k3cf0iqxtzfmD?=
 =?us-ascii?Q?m6oXJAqQkRJMoD9VBwwVcsHB15S/nAJ1y+3hLaqLBy8g2I23MvO8uhTQjNuL?=
 =?us-ascii?Q?Ev9T9m+abKoN0nOc3Bv/h2ZyHv+SAZ/N/f/zmPL2Nc97DumZeP9DWhTrNAhV?=
 =?us-ascii?Q?ckhOGEN+zqrHoak1gnmLy3htNuL0LddEUFmbgWEmHn9YgsnetbNxTj88fIaw?=
 =?us-ascii?Q?Z7YSq1v4c38+EeMMFf4cgeVl6aQiEm5eYqenuXMLohxLl3fSy4YSCUWIoXs0?=
 =?us-ascii?Q?1cp+Ypj9m9cCW3Ls9q+IPRNTOVS6tpGv/upyEYgCKOFC7C0xK4sXwakcufSq?=
 =?us-ascii?Q?JRiG10UiZqryKc/20TF1EfDdFaEAN+B6YwWIjEq7dtWJa7Mf8oaL+s4sR4xy?=
 =?us-ascii?Q?vTvPPXhrVCnarE42secRpISzi0p4sFE+WwKQDyZwXDQDitFcfNYfOtFyxD1y?=
 =?us-ascii?Q?t/WVugGnXzIi32Ov3S8DWfw4Na7A7LBZH43nbp390F/BeV6jfr57Wr/6HfQ8?=
 =?us-ascii?Q?IU+EwDpyiCYXA4J+wgHAuvv46MrL2GGvf4NjPG1203IlQQKpyHfGwpNp7jVX?=
 =?us-ascii?Q?9JLegd9L7FaV7P35Awoas5n+0qI6HEYrdNVica2YBcMLYVBHSMEJCYsKC19Q?=
 =?us-ascii?Q?EHZX0QcqtPmy71P2QnEiB2QgKr43lePYi+wQzf3o8iSba4+Tf1IV7UkVlsLG?=
 =?us-ascii?Q?kFh1ZdizoKJNx+Wjrr0FTUSSABOhrXBmjAKAB2Ps7/cgBBYUG6fG9vsiYF24?=
 =?us-ascii?Q?NUmA2a6TIJPnbGAn4KFLIxjLHUxz7wCTmL80reCMgXoMJClixtdGGvk/HoQ8?=
 =?us-ascii?Q?ZLNYRHAq8lKybkHRL9P4mSaptI7pR85gt6S0ECLy51FYevQZe0VjIPRzFPp3?=
 =?us-ascii?Q?intd31YJvKmGrjSkh+b+d7mQ00Neo14AHU6nswOqmvsBpMt3zA2ESKbE6w5u?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de9ce55-d901-483d-96f2-08de185108ca
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:42:25.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQuLzUjAZ2W/L8H7OdJbWLZP9sZOs9G1xOBdE/lo2+QtbmSVyUqqsFZGQgLm13RgZKgjy9qRelEZ1I+d7bk/1OQKodfTsRYcRfLrEuv5A78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 07:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121227

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
2025-10-31T07:27
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
2025-10-31T07:27
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Verified that enabling ptest does not modify existing package contents
for inotify-tools

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 .../inotify-tools/inotify-tools/run-ptest        | 15 +++++++++++++++
 .../inotify-tools/inotify-tools_3.22.6.0.bb      | 16 +++++++++++++++-
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
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.b=
b b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 8a0ae17ad7..3629ce45b2 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -10,11 +10,12 @@ SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dma=
ster;protocol=3Dhttps \
            file://0002-libinotifytools-Bridge-differences-between-musl-gli=
b.patch \
            file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch=
 \
            file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
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
@@ -25,3 +26,16 @@ CFLAGS +=3D "-Wno-error"
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


