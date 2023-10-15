Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C1ACDB484
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=HSMtzglm;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtGqOyxsvbKHxHBJQqjonlZOsfZDD74Ctp26f1utVvXEo81WiJMPCORkxAJFgyum0EUiuu2oZ3ySVXgva0aINLb0Cwmpt7FSTqNk8TRyj8/p+MuwoTH6Zl+HQfAfnQhHK2lX+mdeJLPJHV9B3g17cZ7tqdyqvjdYd4hmco9XnWwlw1c+/NFUK4pWdejKDyVHroCZMFfBAP1BEI1hVoyDgLWwfGnMBzUGpJovCspVsrkRfRqhXw2C8krAQScf5NRt4fbP+PQvUCU4bXK1kh5LU2Btg/1U44jDFeE1lXju1QVBVYBCsjJVPB+yHiVrsTOs3e6wMG/RPdXZXrW1N827Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=B9tfdY0+WVQ6r9Mpp+arsL+XA0pNatYsnx+a0fBclM1BnaHMa0VfaC4HyIC7WIdIew8oGJQODV5GBlChTC+qu+poUsF47E8xm0wBaV9vHP+Bpmekufcw5CDsEJZbZ/6yQVTWET2M3GPIikrVfMdnpmetvv38jHVzogq5wBsThPwqH2al2cVN72IXKFNCBxCq7mfhp5iZ+MD26+G+OFuR4ADSFskCIyOksG/NRnaj806G8E+x2h+0GFFa/QKj1VyLs7rFXaMaegntooCwEHUHncjvahofPfW0pKMHTvTB/yPu1h2Bc9TLzcSqFCyB8lFRx5mdNqbI3QuaZvi4N4MYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=HSMtzglmGuQ7Wu2RFFOKjq3hVoLRO0wcRF6+WUJ3dkbW4b2jHW0Q8lNWgRviOzdxJvD4zywjCE8MXrc+ql8wn/acNmIcEJD2rhx80qUyGsM3JwBF7Uo1vXn6v37hs1LN/DtxrhVtHO4fUBRhQO4yQxpqmPSv+0s9afEcNWpq/3Bts7K34x0Dn4paHfyF8M8QFrM2Pnu/BjHH+28ee0WMfAF7vxdQY43CbSIp8mfUQ6StfYH5LX1xroKAPa3/eBh+smnUOsnDyf/actfnV5COHUqNQEv7XpK41FYclT5xQXJ0g7o6vqpbONOERqL2iFUrnTAoO9nyWgtiRQYU9owkUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:09 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:09 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 11/11] opkg: set locale from system environment variables
Date: Sun, 15 Oct 2023 13:01:54 +0200
Message-ID: <20231015110154.53364-11-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 647c99c3-f10a-40b4-11a8-08dbcd6e2d35
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YYaNP65XL7G1Z2Hzl0Y22vH2Oyq6W/7gw1izH63hfEtu/qrN4QBJzYXqAtm7f+m7Nne5Rsx14QpsPm9kjNOAUPVVzAGcPTCbZn8fR0wmQxaIKfBHRgp0ilviFSwrBZTaNaBvxVuuZGEbXTUqWvyMDXhJU8543tbxqOZa9BMxHA2fZUnfvAifil+OWoTa29wpEEJqmT7Yvb/SxTGgcVFIvxJa7MVWt74UFTyGipGN3yiOnjvUb5kMiMoZDePx3nByORHSCJM7lNpNfu8CQ3BaL7FTb18C8WDx+cEXJRO6ElB/hc/FeOxSfkVuuhtR44JoOcqDR0EqgWViocvwLwEd1cAH8Y7zHVEgaHBKjaA0tOmOJl664u/pq0vjx1mqX/F2aEdP+qVCteHqEkfKpT3aQK1n5NFrBeQYJHtVwBmBI38aOuteHYX+bfvn9yOp0ABsAIc6ZexC0ZY+0HFvx+kOy+hz6H5kQQ6NwMMXaoaGchZ/Xs4fzS5i/YGb3N0OwF8JqlxU9x7F/nkZFNdwkGC1aftTSXSpqRZbYdYuRoy9QrWu528HgiFq20ChHOrBj2dCQ4golnA8F7LsCaSw0Hz+Ftcs8DWlEQX0bcNckV/6sNE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?byKZ6MtezqzibOir451CC6iECBChovVGR9XE+6691n5cTc4gBt60cd1rsQZc?=
 =?us-ascii?Q?DGhAz0sia0Hu0rCyfnUfxTr9EAGMhmbG0nCnYgTw+RevUMZFg+qWuoXdzWZm?=
 =?us-ascii?Q?y3NZZgFVyTxSn9rSKZa47IPrkekazCY/E/QPU5qmvpzkwkQcCmArjAKFQpT5?=
 =?us-ascii?Q?rApX0lIk88dKxcCkztNZZKaHc99hGBa2UR2g4DP+mlL8mSjoSDzF+5pheWrs?=
 =?us-ascii?Q?B6GOCQ1f45C6+Cq412kQAdkNgjIQUOovO7iNvnetwhYpuGs+G9d0p1hrXASX?=
 =?us-ascii?Q?SZXsd7p/Is+kKkk3zmi0epgyRs6v5WkDFrtnc/DJDbVjVZmVxRg1zp2ygAZi?=
 =?us-ascii?Q?xHH/hjke/a8B8HOp+KcTqId3cmRciRQ6OAjX3E/rr+sCaC/5KpW1iy2ypC/L?=
 =?us-ascii?Q?TLdbF8mv1yEsCG1Fcfk7gGLJdK4FrWSjDfYp3NWA6enyPTlov+7d9rFHrSHl?=
 =?us-ascii?Q?gvvvKuQhWCkoVh/gE6ojY5FmsQNJL0uu3mWldQe/JcHNX6xRi4ad4312PJdl?=
 =?us-ascii?Q?vMZwOtKP/yoJ4l9R7Hc+Hx5YGV65/r8IcPA76Zz9n1X+Vf4196QlX01bzUOl?=
 =?us-ascii?Q?CuvDqXkNzFZr9hCmS04DHQB1VuFTj5nAgCGi/gN3t4VJNGXIOw5IlWKeVWaQ?=
 =?us-ascii?Q?wtg3N9J20dffLTP8YdogwQC3/vADqfP/Rl9eFreuhwv0rIMQR9XKnqmxZWVo?=
 =?us-ascii?Q?VnSzKwAE0gfcLD4HAeWi9IWlMAXsnn4i9TeQ4AusCkXdq75is2OpYXPaCoVf?=
 =?us-ascii?Q?P9vRtTMUyhv8SzSdywHaJ3bwNl57BxdJU0vIpESQBQTh0W3gsMRvIUMBW/EL?=
 =?us-ascii?Q?i5w8hSZgwJW3l/DciZU7sHOYZGHZohBZ2vuypOeeVAFXaz97PqKwwiRUAWNO?=
 =?us-ascii?Q?3NhAcuK7vUfeXjYl34w3hbFrSqcKRuos4YYQSAg+/PiHI/geqCLXCBIgAMaq?=
 =?us-ascii?Q?APUbC4IC16/QdZ/az3DzhMuArjt2CVfNqtYkdPiNBp8h4sLCBR1Jg7HTquQU?=
 =?us-ascii?Q?AvtHD1ztyl5k4tcJ3h8xovltS9qWiDF5r6VL92pyIscgF6hF+GrOyinKu9pJ?=
 =?us-ascii?Q?k8w0puUUaSwetRcqf/2VNWYLbZsHKmRZuynCFEbxMljVt2eiXx/ml3qmqE5L?=
 =?us-ascii?Q?FA0coInwbVw7Y/211WzMiDGW7E9VT8ohFKW2HguvvwohmqetD3JHi/NRFO7n?=
 =?us-ascii?Q?x5oWXQqILQAi+x87VLMr+p2s2e1Ts3v0Aa/LiOVhUshXFNO3Abzu8zP8LY43?=
 =?us-ascii?Q?/z6Ud1p7xNAy49ZtWgyrguaH9FUhqPcyChsMMxgm1TqPzLc5k6Js4JuRXBV0?=
 =?us-ascii?Q?nnX/QZKzQCGIS3NIBxiC5ZhCEq6cu2iKkMf3hKcJIK8Jo/tEY67X83Dj9Pgr?=
 =?us-ascii?Q?dhaHKRtCzQ+tWWl50wC+Q2SslQ5pMYzJCNzmghFRwlWrLywa+ok9dNYbj0hj?=
 =?us-ascii?Q?OEoMTne8ntWyE78w23n1tmDYPcSQW0ijaJK6gFKP6wtWrHK+h2efj/XHY4Lm?=
 =?us-ascii?Q?fopShxVIzHHBzdsPKjC/S+FzW/v4yAqnrdIB3clVHthzmFPPnILykif5U2C5?=
 =?us-ascii?Q?TOpTWuDlE8mEJU2tk/CRKud6KhSHkofUosD7iN/F?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647c99c3-f10a-40b4-11a8-08dbcd6e2d35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:09.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFJURwdhIOjMMJX+DDHt43Zs0kKsJUUQ9pBWTH9ZSn7Siw5TrLy8TxCDvYYfPQDT3m133bioIQR+Q3DgFgfUFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105517

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


