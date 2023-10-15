Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0503EC3DA40
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web10.90153.1697369039475722045
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=SQm6xJ1N;
 spf=pass (domain: welotec.com, ip: 40.107.6.64, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV696k+4koMufkovRenZLK9rHP1fELeADqKcUg6wdcKhG83I7Isb+i3x+BTQU1vmHAZQjcYJovu8JyOtKZz2dUSEsSIAKyFFH+pzHheA+eIAx4s/4xF9vEPF2Z31lG5TGSz1nMp7DHlZBalXYk9pRYNvS+SOoHOeYLqB8drHlyXRJ8F6UZJP0qIqO4HO1dxGaAnK+oXRRtjf3ABigTvR83d/GTZZ6uO/LD8ckrNF72MMn+0JBHeJpeENsAlipeKUvfzxdqTzvMA7sjyMJJshJDgSkvA7l52gDM+curYFfY9rw7adj1yr5Xm8NKCBmm8YzFCTHojc3bGwW2gmkKkeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=Ip+OU2z+b5+49Cx7RbI6RqthwegkFkUc1l///Fu4Ab5k4rGBJ+Egf0bY5KvsLc3dqQgghTEzwMHtJKHZdRFAtRIfuwZguu1cbq7lsAuTXIcGatt5VkUwoKsW8IQDcm6TsH3c8DqdV74ny4IEBrYPp49Zj9Y3bjHhqvt/ZBBQm9gtdfLnDpqkIM74LNpkfTQ1fnOc8ce5rtUsY8GrQF038Udk6GbF3QsTdNFbxRFy0vXLYpiGsYfYTm8HMPBb4Hmj0IuEMaV4RT0HODOzoalbwNY4yFTzhLV/bKeRK9Ba+d1pD/7LGN4hDh/VXYY+zowW32Jhwlk6Tnk5CRFW5Yy4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=SQm6xJ1NHHZt+iiuIrN+/n2YQRxg78HONd4nqUlZDf5IqSdw280hayqYs1kFT18LWZDpGW/w481whjK2kqeIXOJaJM7z4qZ7fOjqKDlbBRK641kMPEgtEvsvweaEoYhocI0/M1NgAbFjfefkbV2APM0t+JgOQuPLkZoruoVtuvARnrM7CT//+x2ngtue47ugy/FpzhPKtDFV/1A5afPuQgpLqoVi+Du/B/AcCJcVNBQNqa/lskFQ4t3ktGm21l71OleNsc+5o1czz5pTj0Qt2N8RXt7PSDYHwLPyOpXXfrx4rTQ5QxblBsoKltMxnOc8GESCqhGE0auRMmK4bWJ7Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:53 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 11/11] opkg: set locale from system environment variables
Date: Sun, 15 Oct 2023 13:23:36 +0200
Message-ID: <20231015112336.55722-11-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0773df15-22a2-4e16-9494-08dbcd7136ba
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H6v3ByYCmceZpbImt0p9pCGZIcHZwNBhlQ+4+3Tj5NNTehD81ce2RSIYJ/aScvp+wggjfqe/BxrHErzm86raL/RhY+Ym5xNZW/+U0AdBzGF58NfIhLKQE5Se3uy+7UtIMjTjvhkPy+bKSeUu/9tP923Z4d5O2LEnOSaXA+sHWcp/4MNJce+yomdPh6CrbiPCqTwDtqnOSz/r+BU4JWOt8xJI5n7NwO1wy1rLSaBSQRnf70gMp/FW2v1d3gw/RiQ2TTNLrPsnHCGDVvqyerU4ai0n56Dyp1grJ4J29VSPCzz6E2Gep/h/LIcB4mE6Y984L5M/n7Ey/aaj0Q4KHy4IW3KtHE5IiLsg3/UmkESTQYX3fYUNhmEyHBZ6sqm7eYcNvB1T6iOTbEJ5iDqgx5MLzCU8JACsY+Xc2LEmrjy5dWmEN5YF1AYcg89eK4V13Pganzbe92QfRkJMPfwvJv1n9eBVZfEhf5EtWNwSX4PP13XsNlWVdfdanu0L+faIiYHi3XmyHMHGRYMis6FE6meZAScS1pdrjfwGu0JWRJeMflxzt2DIt/wfhOxnhpEm45pvIJPcAIX9ewnvLc2Me6QkdOQKWDs3eLOYcsevoQXeg4A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yiy3E6B8WL1gU+f1/ukH9hAJm64K59cceH2qD2P5aKsdVe45mEOwjhzsqsIL?=
 =?us-ascii?Q?Su0vJ2y2gO5hJZVVkLPz09rupOf+iPONGfU0oHN9q1/1ByRNxTG3UEJcpohR?=
 =?us-ascii?Q?zf/gzNe1mGh2hSDCpU8UKjMg2qwKMyY5s+km+6TjzrmUFKTtVEvHmrZQjEom?=
 =?us-ascii?Q?HQCt7AL5+/5rpkhADJORGxZELzrA+2FX+8mPMoLoOC8qpNi4tLeqbaJRNd1e?=
 =?us-ascii?Q?2xSd6Stt9lXgjYY1PbNOeoptJJ8xdIoPYHxfYQTPoN6TXcYbd0JAonMbqdA7?=
 =?us-ascii?Q?zfllXaJMBsuMV2RTQ4yPTGHm5quq9uJG6uQ+m+DBvh3STmI7r2RKzBMx2Bog?=
 =?us-ascii?Q?05FeFS63OFjhb073xb2o3gYtRjw89DPcO+a+LY8G+/7kLC/mpfOEhD22Fs1Y?=
 =?us-ascii?Q?HxjNLowezUpOuXaFwiIoVQY5+OaiWbvdMc43bzaDS5TWsyf9Grd6bu0LUsBs?=
 =?us-ascii?Q?uzrfOJK9xlgi+FU/ueHggQRz/8GBuun/xZ3hSdBv74wjdRL/1j0OCBONy42R?=
 =?us-ascii?Q?MYk/Ij4ymiHBBX+gMzFn3lQH6Varq35z3DMyhmpuKP2YYMlXw5swQGXsDYQW?=
 =?us-ascii?Q?2k0ERv5HM9CqG5noC84suy+FUREiB2jlc83OKB1oiD29hWVgqZcnSs4x3NQR?=
 =?us-ascii?Q?LEm0z7kPIQ9CpFZjvP+XMz5Xa7eNUTf3KmIpxqdLsMy8+YL07OuTrcD/ziV6?=
 =?us-ascii?Q?ZR3DH0wegFKVqGkwPkVvJrzDJm+ampITjwcArsAvtsfZOnP2E6LFX62wIG1c?=
 =?us-ascii?Q?rQlEregQG6dWNtjJ5ZhfUzvbDd6SvhMm1SuCBMBT5Vz12xmv97eAxSxSHYuq?=
 =?us-ascii?Q?2C9kBQG2Msdq2TSSAl/VXTdFBlXt9SO063/wMGQp281Aik6CCRU3XXRTFWwT?=
 =?us-ascii?Q?B3ANO0wby4pSjNmmhTI9C8mQaaOkHSI2w4NeoL0fywNeLLBajgJiQbF/YeT0?=
 =?us-ascii?Q?nvtpopS002WguyCQCVtGMGqh//Nizlde1/yQznO5LZ1VD86sZ+lOr2XFlQHf?=
 =?us-ascii?Q?jcUYrOAhYxFxuS+zgpAduSecTmIpeJsFq6Zf6tgLZSsvw7EKNfGTujYR6Xnk?=
 =?us-ascii?Q?F7XD0U4N4nIeWmvYufnc94h84TYoGfXh/KGEY9YveYR1CzkMszhBbY+U8q71?=
 =?us-ascii?Q?4s4mwi0FTG/ocU1/HOoKE6Xwo6OhCbsJp2sz9gngDZd5+y49OrTyupNBqLqO?=
 =?us-ascii?Q?6niLQvGAK4GpOaOow+7xAlndLUPMkXySxYEyh+RerbbaplS1HhvCzaL2AsvN?=
 =?us-ascii?Q?9diBxnN3/GAabR+AxxtvecOVPs7YgoKnGzep1YBHjQptDMMTKx4raP+G33c2?=
 =?us-ascii?Q?5hGJqU12544IYvWz8pWffG4KtnZ/RpkjR12gr/JfjQUqUMil0Gquhe6eEliu?=
 =?us-ascii?Q?UL53zXqvl4aCvQRXHAAIUtunvfwLqmNpaMOWrTaAeXCfTqDdhPJaVoe54jbR?=
 =?us-ascii?Q?qRpJXW8U5MZNwFm58A0R4tTkf/WQdMIxrH0yC7zZH1RDHORB9wQCMwoa8bZn?=
 =?us-ascii?Q?3f+jcVh8jdqaS1fp+BYNpmi/yieCv4lWMBDTvGKC6f4R60eea/QdcfnO77my?=
 =?us-ascii?Q?oviBjuvBIRCyyDpbrpyi9qip4wDE76DJgerDgPyB?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0773df15-22a2-4e16-9494-08dbcd7136ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:53.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcfdzcUf8sEARdvjgc8xedLGQI6r/Sl8ZhbFhYoJ7bxrG6TO75ZPdQNALP2NTs6ET040b/WoSv/M8Jy2kXlP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105538

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


