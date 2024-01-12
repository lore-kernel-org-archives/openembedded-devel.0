Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D9AC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:16:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web10.7877.1705068955940667508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=fOkwYGn9;
 spf=pass (domain: navimatix.de, ip: 40.107.8.58, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkkHjodFI0ZSz06cdlGh2ASskQhNvutvBUiqLElscyP6zx/mAku/YhZrSqFZAtOhBq3Q1bC5jRjMPXFwHLtN3qtLyJlfBEmHdy0W/GL5h0mFQH7gF3tIi3KTWu97+wp+I7YiGHWoZADUT1YLh5eVHCCjVMGSJp+Y+6SFOudaZsVOFv4odX6d3x8vA1OiCbVQzZcmRJiRDuEnP6CVl2vWGGRAbmKLCde/5EZhkBOam4QWHZdvqAZ0YSrmOrEjYfFtctsACajG343mIjRKSUUp6hXMrBckAnCsLzDo4SnEiBldZ9PQYSxbfVHUZYKAPWR/pcccsdaUI0LkC166M4PMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaUZy9vzwwasGZ7/ZraJMO7SPkny9Eeccu2bUEV2OLg=;
 b=fR7QrSzsOUIFLxsX8okZ3xGNv0uj63kiP/q3xBc8W4XVvjsa3cEcQcwoP8t1MEI5WnFJ/hepzqp2FgC7D6kh4VyWLt8VgPMkIW3anWWx5Vl3bOgOAsvcgVpUval2jddyXtNg/eTLbjfDl9SIq4+IrqaTziIbMk2nk1Syhy4VaB3P0WSj9ZH3AnEOcnQgIvJe0itoUdNYQByconAdmK/sgMXfoo/J6ZQ8XGSUh3sowBeiVOZesTGeSn11kF3b6cgkqIBYpV1Wtbz/o58Ct4x2H/VJFZOUfX9aCMDw1MFWaRg4SvCbXCYBprxSJzzvZLasANJY3QQbwlSs0qihKiDTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaUZy9vzwwasGZ7/ZraJMO7SPkny9Eeccu2bUEV2OLg=;
 b=fOkwYGn9xYpJWX67pMow1w1Bavh8hxaGcvrh+k9xfpkS07wjU0vCjvYPVphWFAyi+390/EWKFOG47Qi21XnS231Chb+rL/+V2w6+YtsLqlj08qFW4azshysMVhK3ial7SQ2VsnUZ4TtEPQCwo9YQQQgzPrh+9nHUzrDI9AtOuYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AM7PR01MB6787.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:18f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 14:15:52 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 14:15:52 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] i2cdev: Fix MUSL build
Date: Fri, 12 Jan 2024 15:15:35 +0100
Message-ID: <249fd7d2aeac0b177b5380f8eac867f559628f6e.1705068935.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::21) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AM7PR01MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: c2483dee-a4be-4d1c-6471-08dc1378fb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DfoyqEEyIOnzwGvGFmhRvmHk3Ji5uIiFxs40Fg6USHsc/tnoX2KIwn2+tfrgLMIsmPshFg78GkvOS3JGj29ob3BPK8MjqyDOq3tNq10i4d12U4YgT36sREiXoY0t14VM8l81uywAtdjhfr/wu0zoqA0Tu1WR9P7t8xhPp0IqXg2pqDBIGTTDZjYbu210owAH0MqX49T2GeJnI6yzHJjWDxosUHGwTvIDz2vPElsWwKzfNJB430w4iZzKz5WMKxxxJUxyBWPSSx10PsPH4FvzZYjQy0vVgRyteIkHKrQe7vptLB1F3uY8lHrVR0WvIaL5Bne7dTW/QI/wyrn1Lg2RCfRYRPUkSjajQleA5D0nXJkC/Tn4eD8nWAriXBjiwiM7JaFNnvLsgJAMnkhogWrFTvF2ldyBoywmx+UvL7rzVwgg3tLH8omWvEqvKTorLgldwCzzIeJDgSZ9sybZ5ednXhasJm1UN80+M/Y3U73g3r+o4mpFbZjUT2illL7rdITFmmZ2c4OeOzQwHzqqauUi0S+mH1pOL2LG/zjoGWWqGXOVKifKLIAUgxZMr0DhZsNF7AqoKzoMwBvetsoeCWplLeNM8lIS3MXowUIDct2o9SM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39830400003)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(66574015)(6512007)(9686003)(26005)(107886003)(2616005)(38100700002)(8676002)(4326008)(2906002)(8936002)(6486002)(6916009)(6506007)(52116002)(6666004)(478600001)(5660300002)(66476007)(66556008)(316002)(66946007)(41300700001)(38350700005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CklI1lI4l5U26J5/2s1LuszBYoGe2MbChD57n+aZmr15s+/CJyzkgjLRpZ/j?=
 =?us-ascii?Q?n0v5RJLc7J3zd0TXzaHhlJ9WnMFghlmSS7ZbaO60raVlQ/FDNowaf819pdVF?=
 =?us-ascii?Q?37DEXy2Z4t9+tJiz3+hn7phcaGU220DFhzL+/hYr72XKNSDBnKqHp1d2qatc?=
 =?us-ascii?Q?naIPnaS82/YlwMM6e33oFU7MpJVP7ZQWxLWuDRx1cB5gyr6nQunp3G/UXFW0?=
 =?us-ascii?Q?SH4mOtcX55hQHNR1BbVSsAx/QhTOwH53+pUou1J4PhqPZZvZGHwsvk5n/BZg?=
 =?us-ascii?Q?Ha8usHW5TwWiYo/rtWQRPrEkRwGjCjq75+m+jqQbqklc9EkTP4n8cRyF7m0O?=
 =?us-ascii?Q?nwUWt6A+El1oIj9ER5VXB8b/upyMzr1d+znVrzbYDSiQdTiD64MklbXLWOdz?=
 =?us-ascii?Q?oXOC9KR0JlgvXr6yoHGxrvgWO3Btc8+WnwlosQAUEgPRZIMmqbmI15YcsQex?=
 =?us-ascii?Q?lX+laEYOosqPFnXUwPJavDuRV7azITYmryLdUlaPMJiq33BNN5ATwU8MxMwg?=
 =?us-ascii?Q?GzvNfXQdOYaSSwSt2s6MwE+N3UVsGmpfABe2zyGgjSTzc8qaI3L+ZeBgOApe?=
 =?us-ascii?Q?Jf9DLP0R4nNgQS4jw7z2ov4LZklanPqoRBMtnR7mNJ5MWbqehjdSDJQM7WYT?=
 =?us-ascii?Q?Ed3UGiNEzkM4fESH9LrQMhFVdaJ+6Z/o/4j7wyuOEn3Qwi8CdQ+akyfrkXYK?=
 =?us-ascii?Q?PLLK0WZc+j3GGL72igq1Tcrkwkh4clM6F0Zt0XrHzt14BfdQRWOzw3QSJzGw?=
 =?us-ascii?Q?Uru2+jk+x2RcKLFbPftcxjLPTipPJFyBm0inbOHz94wpVdYo/uiopb2sME4o?=
 =?us-ascii?Q?RZvcnOj6qgUxVi3NjLuC6lV2xa46VegrRwL7XF/uUweQU6HJQmiOybwvELsc?=
 =?us-ascii?Q?KmhnOD8FJSfLUq8TVP7n+eR74oVwvz+xNG5mApKpWtr9aJdHbHTrZVoEqL6d?=
 =?us-ascii?Q?/WXkZE3rpl8YMPxfWAxz23nkja88P6nGZB8+8njXhhbHtz7OL6T3yqmnVbaG?=
 =?us-ascii?Q?duv+GlYFNGC7M7euQszlyc5+XbBjLUWopg2Kocry+6OyfNlDoXIWLaKxvNi6?=
 =?us-ascii?Q?xcDsuaIjQYNuFNp53JsovO51Zy5F+J/h/8UO42ur8xWbXuQ4vesslicLUKVV?=
 =?us-ascii?Q?Azp4NYln6j5aLovZqidVF3xAy30zoy2GjfcmMRqQRKnlX44AUUuPb1wZR+KD?=
 =?us-ascii?Q?OyIX2xef1HyTOqMa3R/2tStdIjMbm7JAR/BU7TY6LuICupEqBpjSkCmaJ6eg?=
 =?us-ascii?Q?GpiGH68LZjUpF4EkiQ5eY8WCtRpYfHKBUtn6jsm+1N3dC3gKa+G3rdvQFSJZ?=
 =?us-ascii?Q?QtusnKdQuVqfEocG4qXjNGS0AUGzbmOzip6ahaK53IcrnfJwvopOIKwM4e2M?=
 =?us-ascii?Q?WoLG8v17S9ZroVvtG+55leLmg//AWKL4qXljTLVSA+LAqU10KL1OelPnDBlh?=
 =?us-ascii?Q?EYskRLfqs3qLC4/SLH165gwpq7iW9++1wvKDfyU+znt6z95MBVXV4glVNmqu?=
 =?us-ascii?Q?oseXl/6H2D9viRa6oEkYNnhhuGq5p/kJr9tKO4KDP9eNgu11RZR4NgdJjvrp?=
 =?us-ascii?Q?GAZ9xrYsxrZ9seig0lWsTTbxidEmAs1KB/5R8ZZGK/1FMZznWQ+K8U3FjNWB?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2483dee-a4be-4d1c-6471-08dc1378fb9f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 14:15:51.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NswwN5697rH0QEalF91XM7Zk87yZ6dJzDICN8bh5ANb/feTQ0ZE2VdjMxX4xlgy2xRksVHN95NZwM9UwaRSdc4nlgMIiCr2EYXhdNvvP+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6787
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108242

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Building the recipe with MUSL fails, because it uses error.h which isn't
supported by MUSL. Because the usage is only in one expression, it's easy t=
o
rewrite this.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-bsp/i2cdev/i2cdev/fix-musl.patch  | 122 ++++++++++++++++++
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb      |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch b/meta-oe/rec=
ipes-bsp/i2cdev/i2cdev/fix-musl.patch
new file mode 100644
index 000000000..59fd379de
--- /dev/null
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch
@@ -0,0 +1,122 @@
+From ce3affeb45a65649dda1edc9a4f0586e9db47ada Mon Sep 17 00:00:00 2001
+Message-Id: <ce3affeb45a65649dda1edc9a4f0586e9db47ada.1705064898.git.joerg=
.sommer@navimatix.de>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Fri, 12 Jan 2024 13:59:51 +0100
+Subject: [PATCH] lsi2c: Replace error() by fprintf, drop error.h
+
+The MUSL C library doesn't support error.h. Because the only usage of this
+is the *error* function in lsi2c.c, this gets replaced by a *fprintf*. Thi=
s
+doesn't print the program name, but keeps the message and the error
+description.
+
+Upstream-Status: Submitted [https://github.com/costad2/i2cdev/pull/5]
+---
+ libi2cdev/access.c         | 1 -
+ libi2cdev/i2c-bus-parser.c | 1 -
+ libi2cdev/i2c-dev-path.c   | 1 -
+ libi2cdev/i2c-error.c      | 1 -
+ libi2cdev/init.c           | 2 --
+ libi2cdev/sysfs.c          | 1 -
+ lsi2c/lsi2c.c              | 4 ++--
+ 7 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/libi2cdev/access.c b/libi2cdev/access.c
+index 62a3f59..2e77659 100644
+--- a/libi2cdev/access.c
++++ b/libi2cdev/access.c
+@@ -16,7 +16,6 @@
+=20
+ #include "busses.h"
+ #include "data.h"
+-#include "error.h"
+ #include "sysfs.h"
+=20
+ #include "i2cdiscov.h"
+diff --git a/libi2cdev/i2c-bus-parser.c b/libi2cdev/i2c-bus-parser.c
+index c4b8688..8c760e0 100644
+--- a/libi2cdev/i2c-bus-parser.c
++++ b/libi2cdev/i2c-bus-parser.c
+@@ -27,7 +27,6 @@
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <alloca.h>
+ #include <search.h>
+=20
+diff --git a/libi2cdev/i2c-dev-path.c b/libi2cdev/i2c-dev-path.c
+index b156db7..361761c 100644
+--- a/libi2cdev/i2c-dev-path.c
++++ b/libi2cdev/i2c-dev-path.c
+@@ -11,7 +11,6 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <stdio.h>
+-#include <error.h>
+=20
+ #include <linux/limits.h>
+=20
+diff --git a/libi2cdev/i2c-error.c b/libi2cdev/i2c-error.c
+index f92fb6b..540c112 100644
+--- a/libi2cdev/i2c-error.c
++++ b/libi2cdev/i2c-error.c
+@@ -9,7 +9,6 @@
+=20
+ #include <stdlib.h>
+ #include <stdio.h>
+-#include <error.h>
+ #include <errno.h>
+ #include <stdbool.h>
+ #include <stdarg.h>
+diff --git a/libi2cdev/init.c b/libi2cdev/init.c
+index 99a7edd..dfc4090 100644
+--- a/libi2cdev/init.c
++++ b/libi2cdev/init.c
+@@ -16,10 +16,8 @@
+ #include <errno.h>
+ #include <dirent.h>
+ #include <unistd.h>
+-#include <error.h>
+ #include <limits.h>
+ #include <ctype.h>
+-#include <error.h>
+ #include <fcntl.h>
+ #include <assert.h>
+=20
+diff --git a/libi2cdev/sysfs.c b/libi2cdev/sysfs.c
+index 2811500..a7e13a8 100644
+--- a/libi2cdev/sysfs.c
++++ b/libi2cdev/sysfs.c
+@@ -17,7 +17,6 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <fcntl.h>
+-#include <error.h>
+ #include <errno.h>
+=20
+ #include <sys/types.h>
+diff --git a/lsi2c/lsi2c.c b/lsi2c/lsi2c.c
+index 7af5313..34c6225 100644
+--- a/lsi2c/lsi2c.c
++++ b/lsi2c/lsi2c.c
+@@ -38,7 +38,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <getopt.h>
+ #include <stdbool.h>
+=20
+@@ -205,7 +204,8 @@ static int read_config_file(const char *config_file_na=
me)
+         if (err < 0) {
+             err =3D -err;
+         }
+-        error(0, err, "Failed to initialize i2cdevices");
++        fflush(stdout);
++        fprintf(stderr, "Failed to initialize i2cdevices: %s", strerror(e=
rr));
+         if (config_file) {
+             fclose(config_file);
+         }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp=
/i2cdev/i2cdev_git.bb
index b41ecffae..b2b5fda09 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -17,6 +17,7 @@ PR =3D "git${SRCPV}"
 SRC_URI =3D "\
     git://github.com/costad2/i2cdev.git;protocol=3Dhttps;branch=3Dmaster \
     file://fix-lsi2c-makefile.patch \
+    file://fix-musl.patch \
 "
 SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
=20
--=20
2.34.1


