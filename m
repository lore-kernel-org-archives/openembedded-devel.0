Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18E5CDB48A
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.89881.1697367080398083208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=o2xTDPoa;
 spf=pass (domain: welotec.com, ip: 40.107.7.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg4wE8HcsVBAgywMzxHx+O+XsyBkQkm8t+HfGbVRkW7hyQeO0e/MraCR6R1fBpoIORNRjGKN8MO5dZlLhRoBsT9h3sx4/jpQugVve7wNsjo5wUgZ2VwRChhhW3V7mN8emrF6NrC3Rk2I2oFjnt4RFyT/JF0M0iG6L1REIE6ECTMPshhbAeK3qMzURpjtVyrcFY0gAmAJj5z9q00j30RdHY7c4iQrFniYiCPXCj0P4ZHzVvqwG5eYch1Snj+6I0fHc5g9bBL787z6cxCHe0A7zG2VKj1idZQsOrLIvOWBQ//AbnARtXDCRkitQrIOss39WB0Ouj3GSWyZqDnnemFvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=Guuj8le7XghfgSvW8P9UmPKKU7FmkJTq48LW02lDwbeqxJgcNKOUtMW55io5Qhr+tedM0tLb1gCV06Rb9YA0aMwWTk4NDBpgCJIzqS5Xu1LbCV/3zzq1nNfjq73pAL1OtCIbj2z6LkMYyWK7pnvJl2eDk5XuePkzhBMexU1ISMmjJAYdoZmQAd9YMEZHdX5fA/zUFjWkEYF5EreiQlL2H0duEoPRW2YpVIKs8djp2CdyptljRTCnPJinecsGNjQN/2alxDUC4QWg1nGF0yIddBle9FgTIU0LNOL+lxtXuFKUJuvhRynli6WRtecseu4g0UlsfpK8hNElh9JnXDcWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=o2xTDPoajOSarK8Ikf4OT4BtM70Atab84zQA9iWJn9n3K1oW4MXeOsAyi385vTRek6cSwFuz0eAkpgttlQYhRnkJGgHQz1VD1N7KvyjbvmeiacjndwIQ075gTFDsMDJHrfpYghunkf4Avby1oqCEj/IxyeOpHbNqhg8+abupXrrGx4ZwKOiNTmIai2+dDVVMw9JuXYZKrhE6gtch3ZscrozlccRVhsJo92ZFitnA3KCLlC9F9hU6Eyye3xrddHBqIZojthgtT2v3Deq6LMwdSa/gxiZZxkNDesYctX7pYT3qUzWXbceN9cwGhx9zJZjgzhBumpHKOI/xG0VMwVSZYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:16 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:16 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 11/11] opkg: set locale from system environment variables
Date: Sun, 15 Oct 2023 12:50:55 +0200
Message-ID: <20231015105055.52510-11-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 428ee27c-ffd8-4f82-1ecc-08dbcd6ca84c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yc7ZWjJ5/R1pyfmZQ5w8t/iZgMM+77Ajr5QBQAK4oBMXSrsueP18QdOeeUIl/y4wMPtVXDnNm8cNOQCvfD3LvJF8UK0HKqfrfhwU8oPvgoIvXbxgrbXVqwH2Mc/DASJjbbdb+yOkRt/cs3qiEBQIuajajlQdBjT2NYYA4JvHlV+fH0lLgHZ3T9amSu1U3BI3vN5OupG3R2XS4JpUHXEYbfcms+HV9VUyGm1Q7UJ/EVfqXaYBW2eKH8PB/aR8ncNgVGVlkWmIFJSbdCZ5xkSAgSdMET08MVBGHjQBf5c5ZsU2jT7hsJwzGxzQh11/XtjVy2bs4sjSbBMU54lQXgXOtrtAtHXqdPOdaeQWNVE8DEEix1zE3BamwHSvgV216hwV6wEg93AtCG88Yrm37YxEWkFOrt6qWTLhmtfCU3blGv+DS4ccmyDN1PHYVC34ltYsS/9L0Ra9fN8qX3UqvEceY44sEhPZFbt+Tu6f74h2oCFT4DRO+j1k83/K5dR9yjFGme1Q3zbeY/Jm1LuHcGDG4N3GxYjdR9SN4h3cOLWKUOXbR39/Y0VtPLai4spckBgVpXoYL8qvkUSmNSkV+46XHdMJaVDGF1SepkqbkOL12O0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X5EV4E9G7/jz3qXADBOGuBAL6UZG0W3g79xh6/8fEQGkWd2IWEFrrg8NEkWT?=
 =?us-ascii?Q?YkGtwEnk65JoUPRk5VhfWD0ziX23gLqfu3/ZUwWP+aCEoZjlJbvGcZb3+3w4?=
 =?us-ascii?Q?NtBrx5HBy/zap+d5AJQ1mLO7I6+tOzE9W51nkenaaH3RHsgMQR4jgi9r1HAm?=
 =?us-ascii?Q?Vxzx3RJdL/Tv4LOvo5LsSu6Hll31Lpi5c7D+R5A8LZccasbtNztB1D80LTA2?=
 =?us-ascii?Q?Kj/mSKNdSfOqBrftlUJu4rUI3w59uDjnpRFG/CpZ+SKwLbHDf/2tPbCQ4B0/?=
 =?us-ascii?Q?UogUntheDw5u2Xz5CT2PR3zL7JxDtbiX1vNy0pFV+bUb83pJY8hG3uECVPb5?=
 =?us-ascii?Q?WWYq2ZUCMXcaY9C3nafrGvUe8tRrsIZ+zMgF0/LTxxKEjCcxzAu2fd7GAKiz?=
 =?us-ascii?Q?bYKIiUL/fbQCAymsLODsS7SGXgwxl7UNTmLl5VYxQx5esauorpY4JvJHwU3k?=
 =?us-ascii?Q?4Bz5ma1CjNvsxU55wFuEweIsC0RLVEhBfOMqIvusbiwOrr72TkbuiLoS/xkT?=
 =?us-ascii?Q?+ylym9JJVnJT15jyPgDE0gHaVBgVxEV91ez6nX2JErWwz1eEm5TyPRL9uvPB?=
 =?us-ascii?Q?QiUOn8lI6gtvGBeJ4xhqXF0qjwCtX2DjDEdIwFAVTZBTz+F6pbH4MKIk+K+W?=
 =?us-ascii?Q?jB8qBwrwEr8E6/ZPxP0IWAr3ppejNO73JRLhPZIzM04tOFlHd3AchA7b/uLI?=
 =?us-ascii?Q?3pnZEaNwxOmN1uIGLVHTUU9nc5pCR84/DXg1cYS676dCCk9e9G5JU3IoTK8v?=
 =?us-ascii?Q?UvrfEhecOahpJY0e5MZJODYD/odHLmpuGtyJQaKloDKZztk8NxZPEZJl1qCQ?=
 =?us-ascii?Q?Sjssxk/hgYujKjybvaUryJpIFWGw8M00Df6MAFRbgsmsX9Yq0eIqhQxPvgE2?=
 =?us-ascii?Q?QkpMA4pGjCHwE2l78MzJK2PclDu8Agph1Dq+Fre6t5UE/D23SnhJKhySjva1?=
 =?us-ascii?Q?7bWaWQC+iqJha51paGJKBvxlGXTg+hB9HAmbAp6kkCHP8UhmGuOx+DhcHUou?=
 =?us-ascii?Q?cdpTnf5dUGjIBjkxAEPshVyTVIfVZt4knFTaDhLiibpGmwmDA6rrksoDsAu1?=
 =?us-ascii?Q?cDk85Fvd4tdP1JDuUN/+PiwEOAdxR6M8ccU7BodjAKOYj74EENjByvMpQ4SQ?=
 =?us-ascii?Q?jZa/sljBGL2I4ZAv1Nm75RvMhMWjWQHQ0BId+qxilyvoN66AVQTzSNmtbEJs?=
 =?us-ascii?Q?ZwIe+ZgM7QLva2Mzz0YXAdMOwwOSAAvp9x/QXcQD9Zer8wQ0B1Nr13Vq6aQV?=
 =?us-ascii?Q?Rrhs3D/TqvrfR0+h7UAEkTvEGQodgfddwqLr5OYw1ATYj32/cdL0yykmyNI3?=
 =?us-ascii?Q?s+E4Y5/LIQi3jxo9ws2OoCSv66Ke7RsdiYlc6JzFr2WqZk5RpX1H43xh+p4G?=
 =?us-ascii?Q?6vUQJjHlo9TYsNiDcUB118HSiJPmTwq1yex7EPS60EZggxa5CB+EwU0Y7WDK?=
 =?us-ascii?Q?tZ+8DfQlljsrTVlJLbPt4Osrv+lbdynxfeAG1wryMKed/jSJ7B6lw2qKp+NX?=
 =?us-ascii?Q?mpiftyljD69QlwP9Z8c6w01IlJ0etbZrdLSbiItZ7kqHAQG7HXUMUiTHuLd8?=
 =?us-ascii?Q?bh291IeTuoAfDYSQi0bhuxvVkQ7LotrsGlM/hd7G?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428ee27c-ffd8-4f82-1ecc-08dbcd6ca84c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:16.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skyK70KLOwjXu2bU9ilFkmu3HMv525mWp77ufCnYRIKEbav8lIaQKbTq8FN4kvfHlS42ZuNeZdnvA3QFvfC0Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105505

A C program inherits its locale environment variables when it starts up.
This happens automatically. However, these variables do not automatically
control the locale used by the library functions, because ISO C says that
all programs start by default in the standard =E2=80=98C=E2=80=99 locale.

Fixes warnings:
Warning when reading ar archive header: Pathname can't be converted from UT=
F-8 to current locale. (errno=3D84)

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...le-from-system-environment-variables.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-fr=
om-system-environment-variables.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-syst=
em-environment-variables.patch b/meta/recipes-devtools/opkg/opkg/0003-opkg-=
set-locale-from-system-environment-variables.patch
new file mode 100644
index 0000000000..7bf191beab
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-system-envi=
ronment-variables.patch
@@ -0,0 +1,48 @@
+From 712895b1914bf63ee4d669863bfd106814329076 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 19 Jul 2023 21:26:09 +0200
+Subject: [PATCH] opkg: set locale from system environment variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A C program inherits its locale environment variables when it starts up.
+This happens automatically. However, these variables do not automatically
+control the locale used by the library functions, because ISO C says that
+all programs start by default in the standard =E2=80=98C=E2=80=99 locale.
+
+Fixes warnings:
+Warning when reading ar archive header: Pathname can't be converted from U=
TF-8 to current locale. (errno=3D84)
+
+Upstream-Status: Backport [9e62a38a4a52974007e9ea174504c42069da1a02]
+
+[1] https://www.gnu.org/software/libc/manual/html_node/Setting-the-Locale.=
html
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ src/opkg.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opkg.c b/src/opkg.c
+index 544c58a..0c729ff 100644
+--- a/src/opkg.c
++++ b/src/opkg.c
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <getopt.h>
+ #include <stdlib.h>
++#include <locale.h>
+=20
+ #include "opkg_conf.h"
+ #include "opkg_cmd.h"
+@@ -408,6 +409,7 @@ int main(int argc, char *argv[])
+     if (opkg_conf_init())
+         goto err0;
+=20
++    setlocale(LC_ALL, "");
+     opkg_config->verbosity =3D NOTICE;
+=20
+     opts =3D args_parse(argc, argv);
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.2.bb
index d7dc6ab715..3b5d51d74a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
            file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
+           file://0003-opkg-set-locale-from-system-environment-variables.p=
atch \
            file://run-ptest \
            "
=20
--=20
2.42.0


