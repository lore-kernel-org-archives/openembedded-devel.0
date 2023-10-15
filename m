Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30544CDB48D
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.89880.1697367955844343434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=dKm9LXRj;
 spf=pass (domain: welotec.com, ip: 40.107.247.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEqRahVKIfRCd5Ctd5f04UGQJlzwN5qvsZ+d1KeXuVYSCY4sJneB8jDiJISXkm01Eo9uPNLuz8DYsFESjcdGdz+Te3pfi8T++XR+HopCYE/K/l87yAFrBUJxM0hjUtFaZxYadbLKIC2q+oqZHtsj0Q3bvyEA+66HUk/ZGy1OTerQ081fwRQ5a9AJeWUZ7JJg3BvjlCkAAGyKbaa7ARWUzj0MCEcaY4fyeI27fY1Vv9iPbKbvqRco/cuikdrJhv+EqLPJ3g7vzONniqc2mft/7rUdtCSGwY80GVASOtfQLEy1kI8nWoRHBIVQYKIbDpJqOM0zK8MrW4mR1C195jahSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=CIrZgHikYb+lraO8bTUWkouQYnMpfw1sO1D4ZOLC0HEegb4ZQSjWI1v5xgCoU5BXnyw0J/Y9limCD9bjrANvokvUNb5OuJE+1lUqg4W1z08JoZACHxgK1YaFPh2LdKW5Lq+oDA63PTbuPECKx88Ah9x3YsIeZc1GHo/I55HUFfZ4uK6BW98S8fzWeiidPfJMQwt0Om4EAHxGOy7Txmq6H6XKEarhd7BPSIaNMG9jhmvrOxGkXL8RLxnyI4oaUr21b7Buhk4sO81HPbMFGXKRjHMV0ixrj1CTxxroEZq9z/z8Ldy35Bf+nkZv5l7g47O/sA+SLEtT2R2QjRJUxp23DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=dKm9LXRjVhjRHmS9r+cAa+fKTFPh6OpVcLNmeLQFvJIIQKGyHh4aFEt+TzINDDDdSIVrvFcquXJMDBAcUAvZsFUZyxOuhQJ8sh2GiHZ82/aUVRONLLgqoBa2yOZStLodzeUIIDyZFys+5PTcsoSglEy2QnVaIdJlIOkR9RgPqcT6NVjVOqaeX7LNWqdM+bdYxxS8DmnnHAKio1OZhdeXIvbVV5FJ1IeH33wouFUVuMRQNAvBT+NWqUxwn3RNarwQicHRLDxrF8P/fetI9tF3CFikjt8SBpe+HhClvD12cq0AWFjN84mGrI/cImp0NFz2jW+uuNvBseDu5xbY35h/QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Sun, 15 Oct
 2023 11:05:54 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:54 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 11/11] opkg: set locale from system environment variables
Date: Sun, 15 Oct 2023 13:05:26 +0200
Message-ID: <20231015110526.53738-11-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: f45f66cd-c705-4970-7c20-08dbcd6eb34c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4vqOM7VDygHoaRHZmQVIVM4ROMuvu23Ac5ZPXiqhJXKEQrH6WpgC512N0QBx0u937yZUIoe1+Sr/zfXLdDerfRuRa6xbnKF0MlEQkh8MskY6LQFZNNJYfN6PnBRAVylGHoy6aFfIcxWX0zF+bWVKA7TqpeYLuU8v9GCjK1Mf7ufQxEMePHsPNbfBRiSXoPltRnQrdOJSEz9ldSfB1QHu8ZumfmE7YBzZNP6/7WEG+sbzGjNkcKHnB0Ivil25huQ000+KsELgJhxqlZ8wiapyLauOeBHhMABnc7gUdEWNno9wSR2wHyeEoktNtyG0/Av/r/s91IBm+9hH09iN8FsebokH7EcF+t1we7O/Bqu3cTLqnWVmV1Nq+2l3PsNIzgsWA+kXgZYln5Z3NDG541xL9Z6A4vXJLSlJ/f+ywTIy5K6r+yjvlg1F/1Q9OxSMnHtWfML0RD6r7SMhx54TNyFpTo5HbCHjYLSun1smqV1Vwes6B+1WTzvzRHxwOIPD21FELl+Ot7TXNVI435cKGkgMuYBKYG2jaUXzuOutf99obQFuGkUyql9Z2DZbl+ESEivY+4kyhKmLSW35VCBabweajrqgqaA7e4k8BOsydykgTMo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F6lzmzQ77i7bh2G/NsQEUIFZa8YSHIel0bzGdxnJLVmnctDgyZ6zJuY6uoUb?=
 =?us-ascii?Q?/NgFvr541Jb4LRtcEcYq0jL2QgThA8E9WeWvy213FF6Swwgf5/l0t9ThA7St?=
 =?us-ascii?Q?ZTaIvq53b306olnKIECkkEaJg2MzWsTypxCwzC6+O9Sr/oBf3dtQoenSdXIB?=
 =?us-ascii?Q?IP9j7bYw3NZ5QBzrH4QK7JQpGiXpWinhZ0GAYjkhfxFQZrMW7b4fscvR1MT2?=
 =?us-ascii?Q?OOBl+h2vWpBwCNUboORIEyLHicaj7r0Ugnn/u9ie/zTbAETfx8jRLh3ch7q1?=
 =?us-ascii?Q?gBxOmVEictOh1kBWYSVMbvL9TaU09ZywQOI+SJGQMMD9TpCtF7uTtmL01vAI?=
 =?us-ascii?Q?wEDqr4nD6MzTBqEKp8wfDB33cyIIXCrZP7nWgcEVT5JeersMd/mHQho4iJ1V?=
 =?us-ascii?Q?wWIIq4v0isg0fzLel5JV/nTQgmBpehC+xOpe70rtXY1J63SZ7fNz4bw6+Iwt?=
 =?us-ascii?Q?9Awf30H3i+fEDdbtc4VhCjkoj6A+ehT2xOu5QX2XJ7YlD/C+jYoVnjDEn6L1?=
 =?us-ascii?Q?MJ9SWvC2VH4KFoRPbbozzZpakk4VV7SbcaEMjrNUPRaX/6NplzwzpoeXARz7?=
 =?us-ascii?Q?D1uZGzr7byy6IIt3kftHEh090f2mRHYNHoDQJfsEM/lH+NgFfwWbgn5gE78i?=
 =?us-ascii?Q?DqpuwDkO3JCWYMXjsTaeRxDG6SFyuty+boEVsFyle79ZK1skw3pliHzPoWfv?=
 =?us-ascii?Q?46oAReooqx0QyuAHct5jShdyzQSKRQGfTYYO3ojtESUfToDwxf2N6n1QMnh8?=
 =?us-ascii?Q?4g+3C6j9AXUpHfiy5q+l/FGVz6ok0h6xEGyx4rHvnxZstaaSsR2pKeFblrtu?=
 =?us-ascii?Q?PreyKrNYDOsV1EaTtyBWlGUXz5IMZRWEoLLSDd4DsGX/el3DNMrdZeruYWJU?=
 =?us-ascii?Q?AFKq73Nsy779EiphxNsDdJF6gUUpNw1Yw+r1BTOP5ho71angwe813NtvxSmT?=
 =?us-ascii?Q?JshbClBCf3FwhYfQZsnvylaWWo71hwM1aOPQwkNj3owyl5pSXy6zuqEFMBp4?=
 =?us-ascii?Q?T9+wOx+TEsufuEOGF7O5n8X7cJkmoQ0v4BnuvbucdJMl0nfBrQAYQWeQEGQl?=
 =?us-ascii?Q?dgQOpxtUezYK9mj0z1UmEnEb59aQHZeRcIHlEXcgUdC6xD/EB8srNHERSWAU?=
 =?us-ascii?Q?a7+WQR2mFbancBdevqnhQulGK19cdXsK2Vl+pjoRd7dj2BC169HtGBZTbVZN?=
 =?us-ascii?Q?p+Cc6xm1WLiVW0d/1rdY9nPepaMG3739NBQ39/t8e679S9H+bTMB75Ez7ir5?=
 =?us-ascii?Q?ovmSTuxy0z+pn2NiYm0ks7ySYVpcOP3/G3/nFClJJnDBNl2vK94QPkusJo2c?=
 =?us-ascii?Q?adY3YXp3gwPfYmPCyBahQR3Fq6o7vH4U2/A+hObk0dUFw5JzgLrGYgd/QwQC?=
 =?us-ascii?Q?mMBVW3YJyQLfdgl9PCYI5v0mxYO/PThdXB/PuAkIG0DMXjapyeHb3abp7iZ+?=
 =?us-ascii?Q?Ry/ylWbULKH2wWwcf0P3RFlLvqXmt5e9rxyriImNYyVTHzSI13ZOtlWfvaFJ?=
 =?us-ascii?Q?AKQZFDYEmfW4WsfIlPLvjbjXCyVGt/Ho+hWY+/Vl8V4jOYvUf7unvTZ1CAiz?=
 =?us-ascii?Q?Xwf4adhwsMs8hdHdnTEGvCDS8ZwIDaE6eg+LzkPH?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45f66cd-c705-4970-7c20-08dbcd6eb34c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:54.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnsHT4o80wA5QA7B0fuVww2y2Q9EniuGL80l62YUi0v7/daCV3Jm/9OINtsLLzALp41VEVcJVWJC1KgfXlB4pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105528

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


