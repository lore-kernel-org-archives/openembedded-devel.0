Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E820CD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 09:51:30 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.125])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106178.1781430687197272511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2026 02:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=SkiLjssI;
 spf=pass (domain: navimatix.de, ip: 52.101.83.125, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp1nNAcXvPon/OMjK+UNiEQ1ehiBm0+3tmfu0FMm0kWK0rmo6VPdt5MyJZS841eEZFaMys8LSNkCnYDSEiNX/6zw71xMkdXFaARZ1Z8yK154gH2h6Fzf7onGni7+pkmngqm/KWlpMIp9GXJSoVa6GryIpdTAL0g5gIyjUvwhUUQ+5/3goNQeOOwgihFXEo/2Mm+v6S0LzdeJ/7kCRcV6pbZeIphNvlIWbHtGUAl81103yAdYc5LgjXUb/aJIWagEeAtmUX6X7bdnLUAZN9QErKii3wtuWpc2mPM6RUmrBPIgm+q4EvmzIYAnmY81mpdgYkH2PhH3hXlzgliI03JSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ub2lzv/HZTy6Xp/fp0R68FNT3EzuCXpAVbS63G1x0Q=;
 b=EvXaNIDgDzDxMz+1iHxzyHjYTTzcOvKfuOVLALpf/ZoCAeAv1TFSaT2Tr2G0ZbI9mKeildH6kYRNKTNdmLiRpMlzqhOxyL2Lsps/qjFKJiM6fvGRSUgqifwTqydENQBFQQvauqWbyTQkDxtexXgNAJElA/E2mA5qnW8yKEtRTfnC7qtbNbv5CQMyO69IMPuIG/CTU4kUnYbZBkarZ/R4LIdNuY+xjEEFCSn1LcPw84KzZWQAmVm2o0ix6k6wmZgobpvdTY/+Wv6pfMAveLkTIdPA3+foHGwZ6T5i9dWFULvtWbke2vIXPQ61waxm7a8zfj2BdwavjBGWDz/tK21ukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ub2lzv/HZTy6Xp/fp0R68FNT3EzuCXpAVbS63G1x0Q=;
 b=SkiLjssIKn0dHsDwyBnHhHOinGQefLjR2KcxvrAave2CZL8zgKXDUApmQ4tlTm5LRCngRz6Qapwzw7+KT/sDT5CaXIdf52CB4YjH+ZLoW+1dQe/J9LFYmDTQTNl5qA3P0SeBaYZyrPuUJdYZofjmYrkVTXo2bMdUKF4j4BG1M6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14) by PA1PR01MB11126.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:483::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sun, 14 Jun
 2026 09:51:22 +0000
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 ([fe80::bd09:997f:d01a:43f0]) by
 AMDPR01MB11848.eurprd01.prod.exchangelabs.com ([fe80::bd09:997f:d01a:43f0%2])
 with mapi id 15.21.0113.015; Sun, 14 Jun 2026 09:51:20 +0000
Date: Sun, 14 Jun 2026 11:51:19 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] multitail: New "tail for multiple files in parallel" v7.1.5
Message-ID: <fb26044a502be852045a8ba36000ca542fe6ae62.1781430678.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::15) To AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMDPR01MB11848:EE_|PA1PR01MB11126:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8bbe9f-b92e-4eb2-77b5-08dec9fa7c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	v5sbWjHSBNFwgEiTaL6I9wgMWIjXc/P6TPy+UAID5AtP/x5P830lQm3kXNAVnw/uuOYmHJverS021LNP8bt8sJGJOJ3j1u7LoloVQr7J0FnW3yItTK8h1xW3I5ZWjeGzOlDAHEz6tPYEax2PDMPEdP8cFWbnuxnjkULfSRPJ7crMkEQpSh/DIAFIqOWpV/vGF5f+usd+X1jCB9rSn/FeLBgq2gdnrL7RB2PDjL6yhxFoznljjc9/usqnwYPRN991LwcK3Svij+LKhQ/9g5NTgkvzzAQ3wdgXNi+q5Cu9Yvnv9nI6ahrAyvU1Nj0J+2BZcWJEalCyz9k8vPUkc4PerOgJEhZxG4r3XjJwT5E0bJwOHtRgtlXPD1QY9gU45Z7797F53DYUs/3gW4StFVD4evBt/qLnACneSCXRwH/b+af0J6WmiZ2s+L/jpSvxKt0VacDBCq/lIGd/YO379yBrviVuc9Y5RTAgbrQXCI1xZkAJwlZPDrgQwrtxGVI3Fb4ixeu901F8EJcjNANqWMjEWw+ZTeQblbMeXGCuCBrbWGwYGhxSCRlK4EvFFTcwDGCzPwWyFjWgC0qMBD3HBDoQeXdIBKRnswEwJPEe58ty3zkk+vfxXakGqV7nWl8kfOGIthNBBEx/P2AI/vYY6RwR2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMDPR01MB11848.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?to1AeI5+oDzxMc2LErKQH+IAsU+YHp2/nPzXhlkwhFelbeJlf+ai9cVzyvu+?=
 =?us-ascii?Q?Q4aFqSfbfYyCe/5HiFD4xkCYxPRclVFlsPYVFnLZvoLgcMWmRYsriq91x+lM?=
 =?us-ascii?Q?xj0IvTC7pX8CDMqn9723Iulw20PqyoUKnRTwwVuXzVH12MlYIltgHQFSUwbB?=
 =?us-ascii?Q?uU/xO1NfvGu02BJ69MMDIB+XBuAvShj+eWrAQvbvmUwaq0DtNAw7SDV0SX5C?=
 =?us-ascii?Q?TxLwfEDc3xAcEzwa7CpjVuGkT0Uk4sRXPLFDK0oPLCHSMEWW5Jyj9nbU5HCL?=
 =?us-ascii?Q?6S57GZNcJt/f+uS8ZbimPUTkjo/YuYpMwqfbctS9u6Me9AjDlUFzG8w+4E2h?=
 =?us-ascii?Q?ziuXZpXvbBvZ4pH+64OsCbmPtCid7bwZgdNRQ+coLfVLcqtK5KtREHVUVSxF?=
 =?us-ascii?Q?236F1deZXoZSH6RYt9KghGrdG6NXsf0y1Tig7iHQw2xYTmU+fVUxA8toXDwv?=
 =?us-ascii?Q?oc6QzEjsj6geQOWbRY66AYByYrwqZGxgkzPtzGL7FY7r4KGYtIxHzq4anBWM?=
 =?us-ascii?Q?JyTcqhHzkKLANT56OphcL+Wl5kLn5d5NAGbZybpYHC/0nt+VYHP6ptJcLXJ5?=
 =?us-ascii?Q?kaKFVxpf3vhzzPRxL4FeQcxH/MnuQfiIcn/bc+drT6aLT4o/hslGIXJ4TNuc?=
 =?us-ascii?Q?NW9XH1C0U0mDI6t2FVQwPVWL5qthzAyE5I1B4oqGVJ6CpZh5EHQ/aZScSByI?=
 =?us-ascii?Q?rA8nR+r9zkcSlmPrwOYR70l9UJ8ejN4FuEyEkxpmGPj5YRE0ZOyGQ/okKyGL?=
 =?us-ascii?Q?1qI6yXxWIDvUuPV2SRTDk4S1D+SxKXeFtqpoAJbu7W2RMvbsbIugGpqMaxNC?=
 =?us-ascii?Q?VuvtaSrT06GSCeZ3TdcgaSZxm/SEGMS/TYiOVJ1jGXT1FyvoZT8aHisecZop?=
 =?us-ascii?Q?r1iyFWA7m3xoCrndzqOSVycj45H7j98jU4jmuZm5qD43/vAyHoh78OeP1KD/?=
 =?us-ascii?Q?PMCoCBWmqv+Aof1HuzRAWTXj5c14sGC91JFdhFrNIAicVl4bKO+A/6Vm+IwL?=
 =?us-ascii?Q?ARyVtXMAY2hGFVMNbgrYaIuZmcwLF1F3bKhy0jiNarP/aSpQTcGDoAyzwoRy?=
 =?us-ascii?Q?1r4SlVdpK/+WCxu/FCa4M9tKsfv0u/FC8C2wLJ9hmLTiDGuG8pR9n6yV2KwP?=
 =?us-ascii?Q?E/vkcdETf4EAk2AOUxTmfkyY7RJhX0mtj6CLsxtYIHBpSbFu3aEbMAwVTeLB?=
 =?us-ascii?Q?FQcbw3VZy8AdprauHmDk+56Ual1ea6fn/9VJ4qkWpFjPYaV5v+M/GenxOsej?=
 =?us-ascii?Q?4s8ckY25afPhx5aGlMEeKdFfXF0ZDMrKUBU53Vd9yTKw1cYNDZygiCgsd7ky?=
 =?us-ascii?Q?r8dtyzXgrFyUfXH3iApOYeb0aQPwDBzswZ6/1ya1dH6pa0aJnuv9nuDg2cw3?=
 =?us-ascii?Q?Ow6m7LfbJ0Ngu2hz9HhUE5eyUGJNb+jCnHDMdX61Cf535ipwrNCOb9D8lwTI?=
 =?us-ascii?Q?ChYf8ilVavPLzA0F6a36ORquPcbNm4bFj6aCDyEpafotzctjDIWtdtzmkyGh?=
 =?us-ascii?Q?TtclJL4bVgq4zJRph0R8vlxN/XI6vYuag+37df2PCYHoJyzRoxs6c1nA6mIg?=
 =?us-ascii?Q?aGJ88vSzFKJ1vgaeOHE4BUgvZw1/t+MgX1etfdFex/e6brEjYFiZ8doCOyBd?=
 =?us-ascii?Q?n3YIHIr3dd9MLxBqm6r1wyQr3kmVNLC0S42cPmphOw6Zw4hmXytjD+faZtkA?=
 =?us-ascii?Q?Yo228kv5fiqIhFX6gVvVDeviayZyry8MlJsCQxYVBXKbeDMQw6DbqR8kgLhB?=
 =?us-ascii?Q?9eqV7la9K6gKCgDDgWEt6/smpQaZbiU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8bbe9f-b92e-4eb2-77b5-08dec9fa7c69
X-MS-Exchange-CrossTenant-AuthSource: AMDPR01MB11848.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 09:51:20.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRxL6W1FBJ3vqOSBgqJLv+Ho+LLlknEUNIk6O5lJSNGWFscRtIzPfCFUXX9YazFjJuf6dZAOHhWHGA8XQHj2N147yaEYpGfRYqDOTNdqkVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR01MB11126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2026 09:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127575

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The build fails with

../sources/multitail-7.1.5/mt.c: In function 'do_color_print':
../sources/multitail-7.1.5/mt.c:712:25: warning: implicit declaration of fu=
nction 'waddnwstr'; did you mean 'waddnstr'? [-Wimplicit-function-declarat
  712 |                         waddnwstr(win -> win, &wcur, 1);
      |                         ^~~~~~~~~
      |                         waddnstr

I suspect it's due to gcc-16, because in a build environment with gcc-15 it
compiles. Upstream has already set a todo at this code line.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../multitail/multitail_7.1.5.bb              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/multitail/multitail_7.1.5.bb

diff --git a/meta-oe/recipes-extended/multitail/multitail_7.1.5.bb b/meta-o=
e/recipes-extended/multitail/multitail_7.1.5.bb
new file mode 100644
index 0000000000..0f441c6930
--- /dev/null
+++ b/meta-oe/recipes-extended/multitail/multitail_7.1.5.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D "tail for multiple files in parallel"
+DESCRIPTION =3D "\
+    MultiTail allows you to monitor logfiles and command output in multipl=
e \
+    windows in a terminal, colorize, filter and merge \
+"
+HOMEPAGE =3D "https://vanheusden.com/multitail/screenshots.html"
+BUGTRACKER =3D "https://github.com/folkertvanheusden/multitail/issues"
+SECTION =3D "console/utils"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4d13123d158ecd203b5b9ffe50a0c7=
6"
+
+SRC_URI =3D "git://github.com/folkertvanheusden/multitail.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3D${PV}"
+SRCREV =3D "247e7ff727d9a8bed410f1bbf86f247c059546d9"
+
+DEPENDS =3D "ncurses"
+
+inherit cmake
+
+# Work around the implicit declaration of function 'waddnwstr' in mt.c:712
+CFLAGS +=3D "-Wno-error=3Dimplicit-function-declaration"
+
+EXTRA_OECMAKE +=3D "\
+    -DCOMPILER_WARNINGS_ARE_ERRORS=3DOFF \
+    -DUSE_CPPCHECK=3DOFF \
+"
+
+PACKAGECONFIG ?=3D "utf8"
+
+PACKAGECONFIG[utf8] =3D "-DUTF8_SUPPORT=3DON,-DUTF8_SUPPORT=3DOFF"
+
+do_install:append() {
+    mv -v ${D}${prefix}/etc ${D}${sysconfdir}
+    mv -v ${D}${sysconfdir}/multitail.conf.new ${D}${sysconfdir}/multitail=
.conf
+    # These are example files to illustrate input conversion
+    mv -v ${D}${sysconfdir}/multitail/conversion-scripts ${D}${docdir}/mul=
titail-${PV}
+}
--=20
2.53.0


