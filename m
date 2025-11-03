Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D365CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:22:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4656.1762194117583195869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=UsptHL5J;
 spf=pass (domain: navimatix.de, ip: 52.101.65.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wlh6uHq79c76PR/+VdmJjwQcKrO3dxaIDg3frx717T+DQNmFBE39oFs+QkPOzSQYG5YTYX4OLI1onl41L4jNkZOQaGswVO6m70qCS4+XhpwNMTeEIZffu0cEPb1vqYme7KUrlVcbAzXpZixaF9uSt65jtyI/fO4yVqha30GJzr0UHKUo4nJX1oieEat0DR7idUNeRtCooeehJHuqkc4qEsuHkqO62mT8aGV5aXTx/pUq66TgmZvS7XR/78d5pVcp6IzbfFAd5joKz8olTw0S4OtUm3ZZWxEhjdU2VPs9Rd2qXnbmC4cR/r7sy8Uv32upu8HCJZed+zaAmChbugJrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyxVQMU68xNSeoU/oLoCtAV2N6STrmbjasqqb4zw6Mw=;
 b=SaIAQYcmt4tuu/oOG2Wr+sLKvrDE3X7stGz3waLz8nUfsLfFUrGH1saVxCEDwkHQeAszo0v3W49lSHkIyAvJZ7D4iyDI1UA+DOfeXeg2jVIdt8RzYTjAoLWrY/tn/7l7YXBggQE2DVZbWglCBtn6x6xUjL2cCTOSFbbHWevv+3OpYLQVb+J0i45JkW9Mew72VDLse5IkeXKFRAmM9Ler1EvQpJa1gyEk2Nbf+Cnc2TKa6wA5hgDk+jGrAZ+pbSbnZFHdJZqf5XFDvPPhQHZHGHiJV7jBEffgvoWNfrwykHibOTYKPYEDLzN5QoXR1FtuMjBLa3/bgA3fELQShaEOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyxVQMU68xNSeoU/oLoCtAV2N6STrmbjasqqb4zw6Mw=;
 b=UsptHL5JWgTXRyO6/0rh5A9oZ5WalncWb8l15d/BfZxbKXlW3UXBwMEYEE8UDnnlPq9N4nbBZC3HXo9I/IhX+h5dooeM1H1IXAMsuKLJ4D/uuVm852f2a7DVY3aTuIv5kR1NYmr+CeUtPnQwIx0Rsy5G08c2pZN/nzTHiC1FYLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV2PR01MB12350.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2f3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:21:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 18:21:50 +0000
Date: Mon, 3 Nov 2025 19:21:49 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] ubi-utils-klibc: Upgrade 2.0.2 -> 2.3.0
Message-ID: <fe27ccd6c8968ea80f707977d219229f1e731359.1762193894.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV2PR01MB12350:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3e6c12-fb98-48ff-b85e-08de1b05db4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t8Ye4o75UCdUGSALHadKvMW+vT8aSeggrZI52yFuYW9iuJycdQ6UE7S6mc/+?=
 =?us-ascii?Q?GY2K0h5gcAxDc7MtzwM/zSDfTJx86uxYGDiHNQaSmsX9+DgVpkYUTNavff1K?=
 =?us-ascii?Q?gAbAdKKC3TXAG1FsYVDatgwnGUXEP8LA8bMNYEL0PvG+xCR1FPrKNP/VVLX1?=
 =?us-ascii?Q?6cJtna9U7QUyRhb7rJmugDJzFt+GTu1ozYunyALUUgKf2DHKrGcTxeGfNBdD?=
 =?us-ascii?Q?JkXvjTXlDoP7GsDXTSgeN/CtDOg1RWj77TTwKcLmnLGRz+7vBYnhWM+mKQIk?=
 =?us-ascii?Q?rc/Z2286AMmH3Ec2KCi8sE7m5qkE/sHxDkkhPbTzV3sRytSCqrrMYbFVfZGH?=
 =?us-ascii?Q?rbHwA11w8ZDkpYvnYT2kgX5Tt6cfh+wjXT9ZTGVDWDla9b2gKqnS2oOxMQX9?=
 =?us-ascii?Q?BlAscZGcyhLNrGiJMLeqBo/DZov7Xm/MjiS8ELK4WpW0qxh2cl6BGDffCtWP?=
 =?us-ascii?Q?3NCVb3HCbPJ98eR8bO8XT+ZuKIq6mv4xVust+0rPeG18q0L7VEkUgMUXpsPS?=
 =?us-ascii?Q?x3KxPKPWpHsrIP8h01Ehs28u9qQIgNhzu46Whc+cWWgwko+VsoepalY7pAS1?=
 =?us-ascii?Q?AamPuPSin9j1viL7T9rKGe0sWOiPCSw5+6STDsOluI9vdARH2+4BeK1JlwS2?=
 =?us-ascii?Q?9yckIkQM6Y1JKyOr5UOh4Z5tRPIcJotmQkpJz84OJS9Q6MUGc6oJWIe4Y5f2?=
 =?us-ascii?Q?1q/7ApO29hTc6fqezgOeVgwYy/WC45KBP3XdYJwDSxkxxP0FqJA6qOpKvoi3?=
 =?us-ascii?Q?8v63EIGzsjYZBen7A0DPuCn2cYfzqb4gDWl4Jm37FOokDnlHOWu2W3Q02c7+?=
 =?us-ascii?Q?L20ob7JnBHBqc3Y69p/LTDh3tWPmGRwjRvagXuHvJXm7Yxq0WMCDJNtCqdGP?=
 =?us-ascii?Q?ELSyS4lJhUsUieFKePaOrCYPtdnn4Je0AuA9nSgCzmf6ZIg+UG5KhLNHr2dS?=
 =?us-ascii?Q?WstrBYZXqPN5vEaPZpky4WFxpM6g1r3E44bFnnRkkkeJssr6Iyw4SW87hWnr?=
 =?us-ascii?Q?Ucs1jsx+Iwl9W3YlQY+XXTSqtSlgRoQasLWjUJ0YEMtGxfLqVpE4YfaxyQTX?=
 =?us-ascii?Q?0V8LfG28oQ1WsZ5IHC5gVfvdvnaKDY9WMVs0pD+JiHdsJhO96Faj5aV5OSuA?=
 =?us-ascii?Q?wA43e+k0HGVkPAMiOjC1f9wLblqH7T3lEwNFu5xdJYA7cVNXRSEVEWxhiv2f?=
 =?us-ascii?Q?ldWsvbYo/GywgCGBm3OPr0t9QMDYfuhG5HwJzNV5uEektiOxn9HVZLO9C8i0?=
 =?us-ascii?Q?OiMvwrg8+3iIcyrcZ3eWCnhgJJNzrR2P8ApnpYqMhrMDf1t5w8a3JlhudJhd?=
 =?us-ascii?Q?x+Ww0oiZXsxqHxNLZQ+FniKIMzI/6cccYsBzqqVoWDvCIjWCpTJhZMXbgQV9?=
 =?us-ascii?Q?sJkg2mYeLGBygl+XnwciGVg2Z8V3eKFyV7ohVJyk25tegboOtWTBQAb7BtS+?=
 =?us-ascii?Q?5N98atSlfC2QJX+CvNyV/SPWjlahg/gQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rx0xCRSnRMVLwC17ZygNg9xMNUzctEnVJ79gHuWTMP2xzQ/IoFQxQ0Q4GGgX?=
 =?us-ascii?Q?Y4ofIe3Kqh7ETmAAY+HtfaeYbL73DQ25m7opbeLdbwRQ7rxouVqg6P3GoZp8?=
 =?us-ascii?Q?DV4yBYqSgZxoEl9O/6L7gsyOb2CPCYOdibw9jIo4kJlQMx7y4RdByIRVE+sh?=
 =?us-ascii?Q?CvkQA9Z/k2jcInk+N7ptINLrftVJ1SyR9vkfTycDibzXBDWdR4rdYUuckkz6?=
 =?us-ascii?Q?vuMzaSnIFH4md3OHq0IX30Rka7zqLax9o6gRydSFi6ggWivACbWmLAh7c/7K?=
 =?us-ascii?Q?NDj5Q5ojeFQTu6WB9YxSf1AkaHlLnxUmXhtyoBex4+3mMItLaP08azzVzKXV?=
 =?us-ascii?Q?hLxpkr72Hw0SgDm52L9WK785N5GGMIyUtAifQEZRFxVBOaNQaHuLBFdis4K5?=
 =?us-ascii?Q?wmw9Ax82yXWgDvuBLHxleLEZ7dN5G9rmk+Y6fXCVZ0fTtKe/vMPWe4OuojwZ?=
 =?us-ascii?Q?EJPugU5dmyhDIAyb6BmIr4bV178z3SkwfU7WhUsXOxwJPITOUV4b+CO9mZ9w?=
 =?us-ascii?Q?r6YxjtsnpqVUbI1JF/tW5dYAEII5G8Q+k+LDFi4GUTNyBS99JcEvMFxXtEcv?=
 =?us-ascii?Q?Q7q3LYWe5eeAfC6M6Mt4FetAXQsOTOZ/e/2TdjdjwjWfZZ4MgjFN96lVdlPU?=
 =?us-ascii?Q?ny6fq+ORg7GLCErEYASgS8k4QK6StoyPYWIrVgCVdLGBhIkF5qvhbQD1OBd/?=
 =?us-ascii?Q?kyhqEBiGLoSzWHuP8fllJy6Cg67QeUR8zT+OjgthgCD26BzkLkOfQvAp4X0C?=
 =?us-ascii?Q?6BPHZDpL6ARYWIOIaP2E3AgMPYHptQg61Aj+WE1TFMXrwyjbjAnIvpI13qpT?=
 =?us-ascii?Q?hZeymYXy0SNxj+R5wXVI20q+68wjWIvhtgZElas6YUiauajTprDxrMum6aSl?=
 =?us-ascii?Q?LtFJSeJVOW0o05fuVpyXYgN5XI6hyudnTtfRzWv7QRhgphxhTZrn6Uf8WNyG?=
 =?us-ascii?Q?1P0ARCe0TZth2b2ZmKIe/k1LWiiQ8bwJheYEngvBdJOlJd7RF3hJE91I5PpX?=
 =?us-ascii?Q?4GeC+Bbe6NOsIXS7kjY3Ocn/4rny/pRiRk4/olL54vFLpsQMRp32JXGA1NFy?=
 =?us-ascii?Q?4qleECRw98/Cnczq+/3rOETdfygLoOlBsDZBmGJ4YpQyfL5uJApsDOqxUP8A?=
 =?us-ascii?Q?fXJuQS/Z/bNcBhDmB3DUSkR+DfelViZJHO6NruNc/9KqvgDDwCMYEZRBGLpp?=
 =?us-ascii?Q?+iCs1d7/RuK0xg288WdN7a3lsngpIzoMY4EG/ShA3/fLmTqMpGAhEWm1k2MR?=
 =?us-ascii?Q?G+M0mP2wQ8szv+zym4ssxFYuE0SALr73eRdw55BJKKB2bR0EGziAB2/Caf5y?=
 =?us-ascii?Q?ZoOSWnUnIa+Wd8TrOaWM4eyAxRB6iM0/aI5WlQFkgFmTc6NresKsb2YhVjaV?=
 =?us-ascii?Q?yDBMAEFxukYmxiG467rwo/A1E3E1TKwTG91wzG8wuD8KPM3Ci0oVbGHRPKBw?=
 =?us-ascii?Q?YU8gdUNfldtEhLGFnEwpd7KVFFANSPQvxYTjIYVI+53jKjKWrQNdhiEbh4pJ?=
 =?us-ascii?Q?WKBkLm4EyCkBNiLt4uDMUAQYFA4G16NZ9UW0xkEWwD9mWF5QJPiWo1Zzwycb?=
 =?us-ascii?Q?Q12wAaDLRpsOG2SX6ge2y7vuVjswSK7/lyeawxxoMGhsJ2Z3TXF2Sont2OH1?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3e6c12-fb98-48ff-b85e-08de1b05db4b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:21:50.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZAsxd6npYuFvCGtJrKudl+XugjDMIRE3BqI7NeQCgMajFIXy+Zd/57iu5SY3aRocd3OMDN7zo2lVKlNdb3YQmADgcUF8hz+trBkHOLi75w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR01MB12350
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 18:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121279

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

* 0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch was
  applied upstream as 64667fe63ba9dd78adb9c4abf04bc3e4e25a0fd7

* 0005-common.h-replace-getline-with-fgets.patch was applied upstream as
  38a6e3e29d90e11c3d5147e609d7b8e021b2cabf

* Updated all other patches due to patch fuzz

* ubihealthd fails to build with type mismatch errors, because it is not
  used, it gets disabled.

  ```
  In file included from /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klib=
c/2.0.2/recipe-sysroot/usr/lib/klibc/include/sys/signalfd.h:22,
                   from ../sources/ubi-utils-klibc-2.0.2/ubi-utils/ubihealt=
hd.c:16:
  /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klibc/2.0.2/recipe-sysroot=
/usr/lib/klibc/include/bits/types/sigset_t.h:7:20: error: conflicting types=
 for 'sigse
  t_t'; have '__sigset_t'
      7 | typedef __sigset_t sigset_t;
        |                    ^~~~~~~~
  In file included from /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klib=
c/2.0.2/recipe-sysroot/usr/lib/klibc/include/signal.h:14,
                   from /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klib=
c/2.0.2/recipe-sysroot/usr/lib/klibc/include/sys/poll.h:10,
                   from /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klib=
c/2.0.2/recipe-sysroot/usr/lib/klibc/include/poll.h:1,
                   from ../sources/ubi-utils-klibc-2.0.2/ubi-utils/ubihealt=
hd.c:6:
  /build/tmp/work/x86-64-v3-poky-linux/ubi-utils-klibc/2.0.2/recipe-sysroot=
/usr/lib/klibc/include/arch/x86_64/klibc/archsignal.h:13:23: note: previous=
 declaratio
  n of 'sigset_t' with type 'sigset_t' {aka 'long unsigned int'}
     13 | typedef unsigned long sigset_t;
        |                       ^~~~~~~~
  ```

* add new package for ubiscan

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---

We had to upgrade this recipe for one of our projects, because ubimkvol
fails to create volumes:

$ ubimkvol /dev/ubi0 -s 20MiB -N config_data
ubimkvol: error!: more then one UBI device specified (use -h for help)

 ...-preprocessor-magic-just-output-off_.patch | 326 ------------------
 ...-common.h-replace-getline-with-fgets.patch |  56 ---
 ...-klibc-build-when-using-glibc-toolch.patch |   9 +-
 ...make-Add-compiler-includes-in-cflags.patch |   9 +-
 ...003-Makefile.am-only-build-ubi-utils.patch |   5 +-
 ...mon.h-no-features.h-for-klibc-builds.patch |   0
 ...libc_2.0.2.bb =3D> ubi-utils-klibc_2.3.0.bb} |  13 +-
 7 files changed, 13 insertions(+), 405 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0=
.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0=
.2/0005-common.h-replace-getline-with-fgets.patch
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.0.2 =3D> ubi=
-utils-klibc-2.3.0}/0001-libmissing.h-fix-klibc-build-when-using-glibc-tool=
ch.patch (94%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.0.2 =3D> ubi=
-utils-klibc-2.3.0}/0001-make-Add-compiler-includes-in-cflags.patch (89%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.0.2 =3D> ubi=
-utils-klibc-2.3.0}/0003-Makefile.am-only-build-ubi-utils.patch (91%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.0.2 =3D> ubi=
-utils-klibc-2.3.0}/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.=
patch (100%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_2.0.2.bb =3D> =
ubi-utils-klibc_2.3.0.bb} (83%)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002=
-Instead-of-doing-preprocessor-magic-just-output-off_.patch b/meta-initramf=
s/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preproce=
ssor-magic-just-output-off_.patch
deleted file mode 100644
index 5c6e097493..0000000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instea=
d-of-doing-preprocessor-magic-just-output-off_.patch
+++ /dev/null
@@ -1,326 +0,0 @@
-From 01c98d5d5d044d9a125abcdbb2f3d771966365b0 Mon Sep 17 00:00:00 2001
-From: mirabilos <m@mirbsd.org>
-Date: Thu, 1 Feb 2018 15:34:07 +0100
-Subject: [PATCH] Instead of doing preprocessor magic, just output off_t as
- long long
-
-Fix warnings abot PRIdoff_t in libmtd.c, in mtd_read (and mtd_write):
-
-In file included from ../git/lib/libmtd.c:40:0:
-../git/lib/libmtd.c: In function 'mtd_read':
-../git/include/common.h:110:18: warning: format '%ld' expects argument of
- type 'long int', but argument 5 has type 'off_t {aka long long int}'
- [-Wformat=3D]
-
-../git/include/common.h:120:2: note: in expansion of macro 'errmsg'
-  errmsg(fmt, ##__VA_ARGS__);                                         \
-  ^~~~~~
-../git/lib/libmtd.c:1082:10: note: in expansion of macro 'sys_errmsg'
-   return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
-          ^~~~~~~~~~
-
-/usr/lib/klibc/include/inttypes.h:28:17: note: format string is defined he=
re
- #define PRId32 "d"
-
-Upstream-Status: Submitted
-
-Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
----
- include/common.h                    | 18 ------------------
- jffsX-utils/mkfs.jffs2.c            | 20 ++++++++++----------
- lib/libmtd.c                        |  8 ++++----
- misc-utils/flash_erase.c            |  6 +++---
- misc-utils/flash_otp_write.c        |  2 +-
- misc-utils/ftl_check.c              |  2 +-
- misc-utils/mtd_debug.c              |  4 ++--
- misc-utils/serve_image.c            |  4 ++--
- tests/fs-tests/integrity/integck.c  |  4 ++--
- tests/mtd-tests/nandpagetest.c      |  4 ++--
- tests/ubi-tests/integ.c             |  6 +++---
- ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  6 +++---
- 12 files changed, 33 insertions(+), 51 deletions(-)
-
-diff --git a/include/common.h b/include/common.h
-index f8f72ea..642c212 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -70,24 +70,6 @@ extern "C" {
- #define O_CLOEXEC 0
- #endif
-=20
--/* define a print format specifier for off_t */
--#if (SIZEOF_OFF_T >=3D 8)
--#define PRIxoff_t PRIx64
--#define PRIdoff_t PRId64
--#else
--#define PRIxoff_t "l"PRIx32
--#define PRIdoff_t "l"PRId32
--#endif
--
--/* define a print format specifier for loff_t */
--#if (SIZEOF_LOFF_T >=3D 8)
--#define PRIxloff_t PRIx64
--#define PRIdloff_t PRId64
--#else
--#define PRIxloff_t "l"PRIx32
--#define PRIdloff_t "l"PRId32
--#endif
--
- /* Verbose messages */
- #define bareverbose(verbose, fmt, ...) do {                        \
- 	if (verbose)                                               \
-diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
-index 9aa6c39..0661786 100644
---- a/jffsX-utils/mkfs.jffs2.c
-+++ b/jffsX-utils/mkfs.jffs2.c
-@@ -1237,8 +1237,8 @@ static void recursive_populate_directory(struct file=
system_entry *dir)
- 		} else switch (e->sb.st_mode & S_IFMT) {
- 			case S_IFDIR:
- 				if (verbose) {
--					printf("\td %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
--							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
-+					printf("\td %04o %9lld             %5d:%-3d %s\n",
-+							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
- 							(int) (e->sb.st_uid), (int) (e->sb.st_gid),
- 							e->name);
- 				}
-@@ -1247,8 +1247,8 @@ static void recursive_populate_directory(struct file=
system_entry *dir)
- 				break;
- 			case S_IFSOCK:
- 				if (verbose) {
--					printf("\ts %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
--							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
-+					printf("\ts %04o %9lld             %5d:%-3d %s\n",
-+							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
- 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
- 				}
- 				write_pipe(e);
-@@ -1256,8 +1256,8 @@ static void recursive_populate_directory(struct file=
system_entry *dir)
- 				break;
- 			case S_IFIFO:
- 				if (verbose) {
--					printf("\tp %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
--							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
-+					printf("\tp %04o %9lld             %5d:%-3d %s\n",
-+							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
- 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
- 				}
- 				write_pipe(e);
-@@ -1285,8 +1285,8 @@ static void recursive_populate_directory(struct file=
system_entry *dir)
- 				break;
- 			case S_IFLNK:
- 				if (verbose) {
--					printf("\tl %04o %9" PRIdoff_t "             %5d:%-3d %s -> %s\n",
--							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
-+					printf("\tl %04o %9lld             %5d:%-3d %s -> %s\n",
-+							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
- 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name,
- 							e->link);
- 				}
-@@ -1297,8 +1297,8 @@ static void recursive_populate_directory(struct file=
system_entry *dir)
- 				wrote =3D write_regular_file(e);
- 				write_xattr_entry(e);
- 				if (verbose) {
--					printf("\tf %04o %9" PRIdoff_t " (%9u) %5d:%-3d %s\n",
--							e->sb.st_mode & ~S_IFMT, e->sb.st_size, wrote,
-+					printf("\tf %04o %9lld (%9u) %5d:%-3d %s\n",
-+							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size, wrote,
- 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
- 				}
- 				break;
-diff --git a/lib/libmtd.c b/lib/libmtd.c
-index 86c89ae..f375381 100644
---- a/lib/libmtd.c
-+++ b/lib/libmtd.c
-@@ -1079,8 +1079,8 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd,=
 int eb, int offs,
- 	/* Seek to the beginning of the eraseblock */
- 	seek =3D (off_t)eb * mtd->eb_size + offs;
- 	if (lseek(fd, seek, SEEK_SET) !=3D seek)
--		return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
--				  mtd->mtd_num, seek);
-+		return sys_errmsg("cannot seek mtd%d to offset %lld",
-+				  mtd->mtd_num, (long long)seek);
-=20
- 	while (rd < len) {
- 		ret =3D read(fd, buf + rd, len - rd);
-@@ -1188,8 +1188,8 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_in=
fo *mtd, int fd, int eb,
- 	if (data) {
- 		/* Seek to the beginning of the eraseblock */
- 		if (lseek(fd, seek, SEEK_SET) !=3D seek)
--			return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
--					mtd->mtd_num, seek);
-+			return sys_errmsg("cannot seek mtd%d to offset %lld",
-+					mtd->mtd_num, (long long)seek);
- 		ret =3D write(fd, data, len);
- 		if (ret !=3D len)
- 			return sys_errmsg("cannot write %d bytes to mtd%d "
-diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
-index 0c9449f..ec4b2e1 100644
---- a/misc-utils/flash_erase.c
-+++ b/misc-utils/flash_erase.c
-@@ -53,8 +53,8 @@ int target_endian =3D __BYTE_ORDER;
- static void show_progress(struct mtd_dev_info *mtd, off_t start, int eb,
- 			  int eb_start, int eb_cnt)
- {
--	bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %% comple=
te ",
--		mtd->eb_size / 1024, start, ((eb - eb_start) * 100) / eb_cnt);
-+	bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %% complete ",
-+		mtd->eb_size / 1024, (unsigned long long)start, ((eb - eb_start) * 100)=
 / eb_cnt);
- 	fflush(stdout);
- }
-=20
-@@ -210,7 +210,7 @@ int main(int argc, char *argv[])
- 		if (!noskipbad) {
- 			int ret =3D mtd_is_bad(&mtd, fd, eb);
- 			if (ret > 0) {
--				verbose(!quiet, "Skipping bad block at %08"PRIxoff_t, offset);
-+				verbose(!quiet, "Skipping bad block at %08llx", (unsigned long long)o=
ffset);
- 				continue;
- 			} else if (ret < 0) {
- 				if (errno =3D=3D EOPNOTSUPP) {
-diff --git a/misc-utils/flash_otp_write.c b/misc-utils/flash_otp_write.c
-index b02d0b0..04c96c6 100644
---- a/misc-utils/flash_otp_write.c
-+++ b/misc-utils/flash_otp_write.c
-@@ -76,7 +76,7 @@ int main(int argc,char *argv[])
- 		return errno;
- 	}
-=20
--	printf("Writing OTP user data on %s at offset 0x%"PRIxoff_t"\n", argv[2]=
, offset);
-+	printf("Writing OTP user data on %s at offset 0x%llx\n", argv[2], (unsig=
ned long long)offset);
-=20
- 	if (mtd_type_is_nand_user(&mtdInfo))
- 		len =3D mtdInfo.writesize;
-diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
-index a853cf4..e854922 100644
---- a/misc-utils/ftl_check.c
-+++ b/misc-utils/ftl_check.c
-@@ -131,7 +131,7 @@ static void check_partition(int fd)
- 			perror("read failed");
- 			break;
- 		}
--		printf("\nErase unit %"PRIdoff_t":\n", i);
-+		printf("\nErase unit %lld:\n", (long long)i);
- 		if ((hdr2.FormattedSize !=3D hdr.FormattedSize) ||
- 				(hdr2.NumEraseUnits !=3D hdr.NumEraseUnits) ||
- 				(hdr2.SerialNumber !=3D hdr.SerialNumber))
-diff --git a/misc-utils/mtd_debug.c b/misc-utils/mtd_debug.c
-index ac37e23..d65ad36 100644
---- a/misc-utils/mtd_debug.c
-+++ b/misc-utils/mtd_debug.c
-@@ -160,7 +160,7 @@ retry:
- 	if (buf !=3D NULL)
- 		free(buf);
- 	close(outfd);
--	printf("Copied %zu bytes from address 0x%.8"PRIxoff_t" in flash to %s\n"=
, len, offset, filename);
-+	printf("Copied %zu bytes from address 0x%.8llx in flash to %s\n", len, (=
unsigned long long)offset, filename);
- 	return 0;
-=20
- err2:
-@@ -225,7 +225,7 @@ retry:
- 	if (buf !=3D NULL)
- 		free(buf);
- 	fclose(fp);
--	printf("Copied %d bytes from %s to address 0x%.8"PRIxoff_t" in flash\n",=
 len, filename, offset);
-+	printf("Copied %d bytes from %s to address 0x%.8llx in flash\n", len, fi=
lename, (unsigned long long)offset);
- 	return 0;
- }
-=20
-diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
-index f2475d6..6c8c8fb 100644
---- a/misc-utils/serve_image.c
-+++ b/misc-utils/serve_image.c
-@@ -129,8 +129,8 @@ int main(int argc, char **argv)
- 	}
-=20
- 	if (st.st_size % erasesize) {
--		fprintf(stderr, "Image size %" PRIdoff_t " bytes is not a multiple of e=
rasesize %d bytes\n",
--				st.st_size, erasesize);
-+		fprintf(stderr, "Image size %lld bytes is not a multiple of erasesize %=
d bytes\n",
-+				(long long)st.st_size, erasesize);
- 		exit(1);
- 	}
- 	image =3D mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
-diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity=
/integck.c
-index 84753d6..0a7f142 100644
---- a/tests/fs-tests/integrity/integck.c
-+++ b/tests/fs-tests/integrity/integck.c
-@@ -897,8 +897,8 @@ static ssize_t file_write_data(struct file_info *file,=
 int fd, off_t offset,
- 	remains =3D size;
- 	actual =3D 0;
- 	written =3D IO_BUFFER_SIZE;
--	v("write %zd bytes, offset %"PRIdoff_t", file %s",
--	  size, offset, get_file_name(file));
-+	v("write %zd bytes, offset %lld, file %s",
-+	  size, (long long)offset, get_file_name(file));
- 	while (remains) {
- 		/* Fill up buffer with random data */
- 		if (written < IO_BUFFER_SIZE) {
-diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest=
.c
-index c6812df..465e548 100644
---- a/tests/mtd-tests/nandpagetest.c
-+++ b/tests/mtd-tests/nandpagetest.c
-@@ -232,8 +232,8 @@ static int verify_eraseblock(int ebnum)
- 			return err;
-=20
- 		if (lseek(fd, addr, SEEK_SET) !=3D addr) {
--			fprintf(stderr, "cannot seek mtd%d to offset %"PRIdloff_t,
--	 				mtd.mtd_num, addr);
-+			fprintf(stderr, "cannot seek mtd%d to offset %lld",
-+	 				mtd.mtd_num, (long long)addr);
- 			return -1;
- 		}
-=20
-diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
-index 26c2ce5..1cd0649 100644
---- a/tests/ubi-tests/integ.c
-+++ b/tests/ubi-tests/integ.c
-@@ -243,7 +243,7 @@ static void check_erase_block(struct erase_block_info =
*erase_block, int fd)
- 			while (size)
- 				if (read_buffer[--size] !=3D 0xff) {
- 					fprintf(stderr, "block no. =3D %d\n" , erase_block->block_number);
--					fprintf(stderr, "offset =3D %"PRIdoff_t"\n" , gap_start);
-+					fprintf(stderr, "offset =3D %lld\n" , (long long)gap_start);
- 					fprintf(stderr, "size =3D %ld\n" , (long) bytes_read);
- 					error_exit("verify 0xff failed");
- 				}
-@@ -254,7 +254,7 @@ static void check_erase_block(struct erase_block_info =
*erase_block, int fd)
- 		errno =3D 0;
- 		bytes_read =3D read(fd, read_buffer, w->size);
- 		if (bytes_read !=3D w->size) {
--			fprintf(stderr, "offset =3D %"PRIdoff_t"\n" , w->offset);
-+			fprintf(stderr, "offset =3D %lld\n" , (long long)w->offset);
- 			fprintf(stderr, "size =3D %ld\n" , (long) w->size);
- 			fprintf(stderr, "bytes_read =3D %ld\n" , (long) bytes_read);
- 			error_exit("read failed");
-@@ -279,7 +279,7 @@ static void check_erase_block(struct erase_block_info =
*erase_block, int fd)
- 		while (size)
- 			if (read_buffer[--size] !=3D 0xff) {
- 				fprintf(stderr, "block no. =3D %d\n" , erase_block->block_number);
--				fprintf(stderr, "offset =3D %"PRIdoff_t"\n" , gap_start);
-+				fprintf(stderr, "offset =3D %lld\n" , (long long)gap_start);
- 				fprintf(stderr, "size =3D %ld\n" , (long) bytes_read);
- 				error_exit("verify 0xff failed!");
- 			}
-diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/=
mkfs.ubifs.c
-index c916f48..f0237ab 100644
---- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
-+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
-@@ -772,11 +772,11 @@ int write_leb(int lnum, int len, void *buf)
- 			return sys_err_msg("ubi_leb_change_start failed");
-=20
- 	if (lseek(out_fd, pos, SEEK_SET) !=3D pos)
--		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
-+		return sys_err_msg("lseek failed seeking %lld", (long long)pos);
-=20
- 	if (write(out_fd, buf, c->leb_size) !=3D c->leb_size)
--		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
--				   c->leb_size, pos);
-+		return sys_err_msg("write failed writing %d bytes at pos %lld",
-+				   c->leb_size, (long long)pos);
-=20
- 	return 0;
- }
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005=
-common.h-replace-getline-with-fgets.patch b/meta-initramfs/recipes-devtool=
s/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
deleted file mode 100644
index a556ed3d87..0000000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common=
.h-replace-getline-with-fgets.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2137eb1a6cd0326510bd3b9faf8037d9bf34ca3d Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Wed, 23 May 2018 15:52:34 +0200
-Subject: [PATCH] common.h: replace getline() with fgets
-
-There is an unofficial upstream patch adding a simple getline()
-to libmissing.h. Unfortunately the patch creates issues if the
-toolchain is using glibc (autotools cache?) so for the moment
-keep the old hack and wait for commits upstream.
-
-Fix:
-
-| ubi-utils/ubiformat.o: In function `prompt.constprop.4':
-| ubiformat.c:(.text+0x70): undefined reference to `getline'
-
-Upstream-Status: Inappropriate [klibc specific]
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- include/common.h | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/include/common.h b/include/common.h
-index a1d59d0..96b0bdb 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -126,15 +126,26 @@ extern "C" {
-  */
- static inline bool prompt(const char *msg, bool def)
- {
-+
-+#ifndef __KLIBC__
- 	char *line =3D NULL;
- 	size_t len;
-+#else
-+	char *line;
-+	const int sizeof_line =3D 2;
-+	line =3D malloc(sizeof_line);
-+#endif
- 	bool ret =3D def;
-=20
- 	do {
- 		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
- 		fflush(stdout);
-=20
-+#ifndef __KLIBC__
- 		while (getline(&line, &len, stdin) =3D=3D -1) {
-+#else
-+		while (fgets(line, sizeof_line, stdin) =3D=3D NULL) {
-+#endif
- 			printf("failed to read prompt; assuming '%s'\n",
- 				def ? "yes" : "no");
- 			break;
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001=
-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch b/meta-initramf=
s/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-libmissing.h-fix-klibc-bu=
ild-when-using-glibc-toolch.patch
similarity index 94%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-=
libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-li=
bmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
index 4ee9bd9a18..26a07688e9 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmis=
sing.h-fix-klibc-build-when-using-glibc-toolch.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-libmis=
sing.h-fix-klibc-build-when-using-glibc-toolch.patch
@@ -23,9 +23,9 @@ diff --git a/include/libmissing.h b/include/libmissing.h
 index 0196033..832c372 100644
 --- a/include/libmissing.h
 +++ b/include/libmissing.h
-@@ -3,9 +3,11 @@
-=20
- #include "config.h"
+@@ -1,9 +1,11 @@
+ #ifndef LIBMISSING_H
+ #define LIBMISSING_H
 =20
 +#ifndef __KLIBC__
  #ifdef HAVE_EXECINFO_H
@@ -35,6 +35,3 @@ index 0196033..832c372 100644
 =20
  #ifndef HAVE_EXECINFO_H
  int backtrace(void **buffer, int size);
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001=
-make-Add-compiler-includes-in-cflags.patch b/meta-initramfs/recipes-devtoo=
ls/mtd/ubi-utils-klibc-2.3.0/0001-make-Add-compiler-includes-in-cflags.patc=
h
similarity index 89%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-=
make-Add-compiler-includes-in-cflags.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-ma=
ke-Add-compiler-includes-in-cflags.patch
index 778d830128..d58cdfd5c4 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-make-A=
dd-compiler-includes-in-cflags.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-make-A=
dd-compiler-includes-in-cflags.patch
@@ -19,14 +19,11 @@ diff --git a/Makefile.am b/Makefile.am
 index 5a6e77c..f0003d5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -9,6 +9,7 @@ endif
- if WITHOUT_LZO
- AM_CPPFLAGS +=3D -DWITHOUT_LZO
+@@ -26,6 +26,7 @@ endif
+ if WITH_CRYPTO
+ AM_CPPFLAGS +=3D -DWITH_CRYPTO
  endif
 +AM_CPPFLAGS +=3D -I$(shell $(CC) -print-file-name=3Dinclude)
 =20
  sbin_PROGRAMS =3D
  sbin_SCRIPTS =3D
---=20
-2.30.0
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003=
-Makefile.am-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/m=
td/ubi-utils-klibc-2.3.0/0003-Makefile.am-only-build-ubi-utils.patch
similarity index 91%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-=
Makefile.am-only-build-ubi-utils.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0003-Ma=
kefile.am-only-build-ubi-utils.patch
index 38ab7a91cb..de36c3c8d9 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefi=
le.am-only-build-ubi-utils.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0003-Makefi=
le.am-only-build-ubi-utils.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 5a6e77c..98715dd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -34,9 +34,9 @@ EXTRA_DIST +=3D $(GLOBAL_HEADER) $(GLOBAL_EXTRA)
+@@ -46,9 +46,9 @@ EXTRA_DIST =3D COPYING CHANGELOG.md README.txt
 =20
  include lib/Makemodule.am
  include ubi-utils/Makemodule.am
@@ -29,6 +29,3 @@ index 5a6e77c..98715dd 100644
 =20
  if BUILD_UBIFS
  include ubifs-utils/Makemodule.am
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004=
-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramfs/r=
ecipes-devtools/mtd/ubi-utils-klibc-2.3.0/0004-mtd-utils-common.h-no-featur=
es.h-for-klibc-builds.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-=
mtd-utils-common.h-no-features.h-for-klibc-builds.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0004-mt=
d-utils-common.h-no-features.h-for-klibc-builds.patch
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b=
/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb
similarity index 83%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb
index 461d75e625..3fcda333c9 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb
@@ -9,18 +9,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e=
8d672dc4c32c317bb3 \
=20
 inherit autotools pkgconfig klibc
=20
-SRCREV =3D "64f61a9dc71b158c7084006cbce4ea23886f0b47"
-SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
+SRCREV =3D "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
+SRC_URI =3D "git://git.infraroot.at/mtd-utils.git;protocol=3Dhttps;branch=
=3Dmaster \
              file://0001-libmissing.h-fix-klibc-build-when-using-glibc-too=
lch.patch \
-             file://0002-Instead-of-doing-preprocessor-magic-just-output-o=
ff_.patch \
              file://0003-Makefile.am-only-build-ubi-utils.patch \
              file://0004-mtd-utils-common.h-no-features.h-for-klibc-builds=
.patch \
-             file://0005-common.h-replace-getline-with-fgets.patch \
              file://0001-make-Add-compiler-includes-in-cflags.patch \
              "
=20
-
-EXTRA_OECONF +=3D "--disable-tests --without-jffs --without-ubifs"
+# ubihealthd fails to build since 2.3.0
+EXTRA_OECONF +=3D "--without-tests --without-jffs --without-ubifs --disabl=
e-ubihealthd"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] =3D ",,acl,"
@@ -36,7 +34,7 @@ PACKAGES =3D "ubi-utils-klibc-dbg ubi-utils-klibc-doc"
=20
 PACKAGES =3D+ "mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc=
 ubidetach-klibc \
              ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubi=
rename-klibc \
-             ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc"
+             ubirmvol-klibc ubirsvol-klibc ubiscan-klibc ubiupdatevol-klib=
c"
=20
 FILES:mtdinfo-klibc =3D "${sbindir}/mtdinfo"
 FILES:ubiattach-klibc =3D "${sbindir}/ubiattach"
@@ -50,4 +48,5 @@ FILES:ubinize-klibc =3D "${sbindir}/ubinize"
 FILES:ubirename-klibc =3D "${sbindir}/ubirename"
 FILES:ubirmvol-klibc =3D "${sbindir}/ubirmvol"
 FILES:ubirsvol-klibc =3D "${sbindir}/ubirsvol"
+FILES:ubiscan-klibc =3D "${sbindir}/ubiscan"
 FILES:ubiupdatevol-klibc =3D "${sbindir}/ubiupdatevol"
--=20
2.51.0


