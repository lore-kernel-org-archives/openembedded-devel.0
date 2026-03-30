Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D98FD0052
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:59:12 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48011.1774866231190582414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=f+hLBbyv;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.12, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNOcdln2UzykO389ncWFW4HEnAlgTWvULSmy/VsJMV1RbCcINf0GSEEKvj3SZMpeL1LToCYA0X+STHPiZR6nKdgchBTFET+pTCeyUkqWe0hwwr61ycTF03fOVAgtmKp0R3seQzYCsmZUOP0Wn28qkd/CKdIZhmzJghKy+tRb9SLAbs4Y3ZFaZO6vPA6N0czVe0rrls/RroyV/hPuc968GJmYU5NX+1z92IC5u67jBf6bHVK+ggooKxwIugHbe1+FuztQBCPycyR8tBzBJFwvbSv2d4C8ViIfPi2euwEImu5BXcIRdqkV00/7WdNviYQh1Zt4KiMeIbHexOkRkTMToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSVqqJc2B2jDUzoH3GAFJI9Jw91J3MmZyklHC8Pz4yk=;
 b=eeib0ohef87vbAYvT032JcGkJIDfnsDRNx04gU7A9elZdNucJZHp1IJwFaWWHexEHBJZZpioh3KsCdjhU2sF2PWt4l8+a4kTi49wDjhBqUHBaHOWW9N77GLgdgWSG1rkDmzPeGeY7G4CDmSWjeTIR1LCVxPSBya3tH5CRBhlPhP6uxSisFzkgxtj8OwLmnGIza0SuH0m3HcnN5ZJStUu3if62L4HwNejPnlQ1iMCW+Bo+Qsm+FxbWn6BE7ji0ZooXq+rY8feiLncNjVB4ehsG+uw13ZtD+UyGLlJCCeneEiFtGHHaRyoDRKGdqIQICklmfxPhpxtJFRvDMVAfrqtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSVqqJc2B2jDUzoH3GAFJI9Jw91J3MmZyklHC8Pz4yk=;
 b=f+hLBbyvkKSNvYvEfJaNzQqlCkD4OiAW6j8X5SBHqH9t8P2SrKiK9bT7ZudgsR20cqxcQ3mdojuzZF3rlx1HH4RT9S337C+om01s7BsBuK/2LvTq4asVh25uNMR2Ha9AAdV8V6vmjF/8/KrcGvzMwosuk4aQBl0V2NOlL18gogJ3vNtbdBymY9WFF+P32L7dVwLiyJ8LrApfGhijviIHByQpH0S8jfdITtpK4ltDG3I0jYNtrNWTCp854zqbR/Qoh4HdFaVOe2rQ3WC57qGTQkXQguajVob+UM7IC8hiqoqWQUl9A4yx/V6pcEumuCrv94GHqxvQlkHezjRZ90bSxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN6P287MB5279.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:08:19 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:08:19 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v2 1/2] android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
Date: Mon, 30 Mar 2026 15:37:43 +0530
Message-ID: <20260330100744.739123-2-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330100744.739123-1-git-patches@bmwtechworks.in>
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
 <20260330100744.739123-1-git-patches@bmwtechworks.in>
X-ClientProxiedBy: PN4PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::16) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN6P287MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: dd928a58-b4a5-446e-9a64-08de8e444451
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|55112099003|20052099010|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wnAkW2c0HcPohYhT7/4mQYxroE1BK/ue4+A/RPx0qtV6N5wPnH3egJ8SVXFnI10UKYy9X6rwRCqg5l2bbN6Pao+IizBo5jPNqFwaBMkDYzksz1EIEVKeM7csJGoXTwmusNkwm+QiPyzEEMOgHEnKL1QLmY2dn6GOMUr6wHELpOL0qEKt5YTM7CX+yL6jhv/7wxoncfzVI0RdT5uSyP1opvBIJZHtGSZMDB6lVAuIiXnU6mhNwnOKwHfm/owwMUJ3MSKNMWEwVk9RBMmFPD+1qDNC2Ie52RP61vs4DDuyOHvNbNQ2Pt2xB+INzuR0riwNsRsPoHzed+iFGNu9H38knyGSnnP1lIvgLE08Hd4wbUVOP5RpkaXoIm2sjX6BlDQPoYf+QMuehC/22E4KW702m0cgwG1Tw8/R12BrhwwNVldWF9792MJyTsqTUiJ3zWQ6AjUgZ8KUKR4KEMGAzG61Pn4hS507lVtupHFEraI6BFi1effHEomb0JN6VEWupBRPaq0QwLe5fKw8gboX3ZjMjUGYF7X3OCkbNLpSD1ra9mN2YCu16Q7ajkZg+hgDfytJQzph0d3W1yUOGQNBPJUCx2tVPysZJcc3jRt+evUUHcwOqI0TYkA6Jfzg8xqmtiq+ODp0B7Yn2490/pJjd2qLdV32FExffM3udobL/ppazulVb2RH0OOls32CSCFjFu/08IOhLx/kg0JVk4E11RiDvU7iKaorCQsA+VfkUekpL9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(55112099003)(20052099010)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NyxsaG2S4WikfUH5MHA5GomVzKuewPSdsiJ1P5b4/R3VKnE8UIlX75DQdwGG?=
 =?us-ascii?Q?WkSSwybzZr9AyFjphZxq/UgHc0q9O7/OW3EEadah9eLYjZIigVXV/8g755Wb?=
 =?us-ascii?Q?ZL5IgRX3JK/idJYa02c1Ui5BB620h02Qscu6z5237rExINXpzmWRChTP2l0R?=
 =?us-ascii?Q?big53fDiqlTE+gXXWZcY7ZJaKz4AibfYBpdw+pF1TDb4iwNq6PpcsK0IPdfV?=
 =?us-ascii?Q?sVxrWEMeZPbzlAbSD6tKDX93qOQUwrIicZxwWGZpmLbJ5XxZ0kNeICM5TTb1?=
 =?us-ascii?Q?zDhyyim5twPZiCcc4rd/A0TNdXVD5fKKumOKvaPOr3kWGPvdE4xsZV1A1M3z?=
 =?us-ascii?Q?MOjPXo1MicS/Ey8AQqMUcm5fBKwHaF/+ZlY7Fq1omhbYhdoGqmqpEIfAdvk0?=
 =?us-ascii?Q?IsNqTKdxRlTEOeaJ9liVcRgLTLV2AAnFtUR27mXN/o5PWRZLJaDhOTiJisLw?=
 =?us-ascii?Q?LBdbAe3lXCG3kK9Sc65+UbAnOMozGGhn3fetQa+QXEwvvf0d5L6zY2lpg4AO?=
 =?us-ascii?Q?ePGZN5CtI6V0/huO9SSp8soi5q/7hAXC2KQtQEwSwGqrYh465s5iX9QWzfQ6?=
 =?us-ascii?Q?NDkOhlBJ8b5gOPSHUfCCTBh/xpqHDFDqyHP+rIIrAmAk6wVA2gRFF8JKI0KY?=
 =?us-ascii?Q?BLNoNjnp1zQD2gZyJsHeXbbZeEq+JS1mUYX31AfyYbroSITD5O6WdACtVZ/4?=
 =?us-ascii?Q?KRJeQJr+TbjhGjbYvw7M5ptQAslhTVWjpa+n779OEG3+zU085dWT73145gMo?=
 =?us-ascii?Q?4FRO+YJVEIQgUj+wzVRg7XJho9a0odrw0x9lshqavZelqw0j/jU2Cpl/q194?=
 =?us-ascii?Q?sj7ELhFeDA3oonICsxuz2B4k95gBsaSsPxvNXUJEOmVcDRBiGxgRBk92+Y6A?=
 =?us-ascii?Q?S4r/ZW5DKN37sJ4xQZkOJXKd9KEHdIcumziYVfbkESIzKjfPyDyErh6lJuTa?=
 =?us-ascii?Q?GuEAXrgzkRvwvqpJpXS+TaEK7bD+Ss3sWLSe4VhZIogT18IhhfD7jkwR6oXB?=
 =?us-ascii?Q?KOE1z3GlQM00oklvDvrlxwBGtPRj9WjeG2Z+PHX1Ep+zlhjr6q7HERi4hQbj?=
 =?us-ascii?Q?9HE9cM3nqUVcck8UZSvHWvTGwd3WCLb+YIPxs5PO7JBrRzobfnO8T1bot1cH?=
 =?us-ascii?Q?L02+uyRvPw9XuiSnZDzK4BoaXaEXa7q/29NtDOO1mS0QdLf3Nv7XiN1z3MdD?=
 =?us-ascii?Q?aJkXZ4QXuqaNpAaKoVzVYlnr4hLt/DFjvmQhV69tvWI/t6u10XJzZbfTnN0p?=
 =?us-ascii?Q?OQXfyEFTJzwpa6SbU3YIkVtYhKVHIcvPcNmEyG6oxSko4F8GsA/tcAr7lQBu?=
 =?us-ascii?Q?Tu5XkiHH2Hf92lCI2GOHZFGzgJI42v5arMeFITF5V5jEIZ5VnjuR5z6zEzZh?=
 =?us-ascii?Q?BDapZZl+MB8DOCFPN7KlT9/9Xrq7uoPWBwpMqgqAqub+W9i+vC1W6mwsXu5B?=
 =?us-ascii?Q?x9uWphrO4kamVYC3PinnJErbtTE1SmRqwQjzaLrFvY5QHFwgHFzoTpyOlc0K?=
 =?us-ascii?Q?Fr0V7Hqfau7UckHHVUlFnvWNK4UYaUyebX+FY4kWRAoPauLtiSzm3VgW0kE2?=
 =?us-ascii?Q?rAcYnavMM97RVpv75pY8QrTVkZ/xb/2mPM5LkMH0slkL90FIUd/h06ZR3BX2?=
 =?us-ascii?Q?3MJfGEZT3EIWN22+XP24/+3pwZaEK2/l76EsT96hzrfEUYMpdzAxaSMSZW4o?=
 =?us-ascii?Q?ITEfEznGvW60nlVfQunoDmKKEollkgmPABU51FGY+TW594e8UFwG4rCAW+3s?=
 =?us-ascii?Q?PSBaZ1zsE435nX7tUIGjC68+WzlP7cQ=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: dd928a58-b4a5-446e-9a64-08de8e444451
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:08:19.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReSCzCVcdFqyg5Y3kDBOZuyXK11nedP4PUhJH+O8RGVn0xswmTJdG8MDmosly7iZWoEeaZzb12KCGbvWqrV96LDHx6q7OH+lEW7daiyH9pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5279
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125865

From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>

We plan to upgrade android-tools from the legacy 5.1.1 version to 29.0.6.r1=
4
To achive this we are removing the older version from meta-oe/recipes-devto=
ols/

Signed-off-by: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../10-adbd-configfs.conf                     |   4 -
 .../android-gadget-cleanup                    |  24 --
 .../android-gadget-setup                      |  38 --
 .../android-gadget-start                      |   9 -
 .../android-tools-conf-configfs_1.0.bb        |  38 --
 .../android-tools-conf/android-gadget-setup   |  37 --
 .../android-tools/android-tools-conf_1.0.bb   |  22 --
 .../android-tools/android-tools/adb.mk        |  72 ----
 .../android-tools/android-tools/adbd.mk       | 164 --------
 .../android-tools/android-tools-adbd.service  |  13 -
 ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
 .../0001-adb-remove-selinux-extensions.patch  |  44 ---
 ...define-strlcpy-for-glibc-based-syste.patch |  35 --
 ...-Use-local-sockets-where-appropriate.patch |  70 ----
 .../core/0003-adb-define-shell-command.patch  |  29 --
 ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
 .../0005-adb-add-base64-implementation.patch  | 350 -----------------
 .../core/0006-adb-Musl-fixes.patch            | 130 -------
 ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
 ...ux-capability.h-on-linux-systems-too.patch |  23 --
 .../0011-Remove-bionic-specific-calls.patch   |  64 ----
 ...laration-of-stlcat-strlcopy-function.patch |  50 ---
 .../core/0013-adb-Support-riscv64.patch       | 191 ---------
 ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
 ...off-most-of-sparse_file_read_normal-.patch |  60 ---
 ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
 ...port-for-converting-holes-to-don-t-c.patch | 114 ------
 .../android-tools/core/adb_libssl_11.diff     |  48 ---
 .../core/b64_pton_function_decl.patch         |  14 -
 .../android-tools/android-tools/ext4_utils.mk | 103 -----
 ...ext4_utils-remove-selinux-extensions.patch |  39 --
 ...add-o-argument-to-preserve-ownership.patch |  78 ----
 ...unused-parameter-from-allocate_inode.patch |  69 ----
 .../android-tools/android-tools/fastboot.mk   |  89 -----
 .../android-tools/android-tools/gitignore     |  59 ---
 .../0001-Remove-bionic-specific-calls.patch   |  25 --
 ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
 .../android-tools/android-tools/mkbootimg.mk  |  29 --
 .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
 41 files changed, 3473 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/10-adbd-configfs.conf
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-cleanup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-setup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-start
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs_1.0.bb
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf/android-gadget-setup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf_1.0.bb
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ad=
b.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ad=
bd.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/an=
droid-tools-adbd.service
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/bu=
ild/0001-Riscv-Add-risc-v-Android-config-header.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0001-adb-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0002-adb-Use-local-sockets-where-appropriate.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0003-adb-define-shell-command.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0004-adb-Fix-build-on-big-endian-systems.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0005-adb-add-base64-implementation.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0006-adb-Musl-fixes.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0008-adb-Allow-adbd-to-be-ran-as-root.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0010-Use-linux-capability.h-on-linux-systems-too.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0011-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0013-adb-Support-riscv64.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0014-add-u3-ss-descriptor-support-for-adb.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/adb_libssl_11.diff
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/b64_pton_function_decl.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
t4_utils.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0001-ext4_utils-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fa=
stboot.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/gi=
tignore
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mk=
bootimg.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.=
1.1.r37.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-conf=
igfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android=
-tools-conf-configfs/10-adbd-configfs.conf
deleted file mode 100644
index ddf155a907..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10=
-adbd-configfs.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-[Service]
-ExecStartPre=3D/usr/bin/android-gadget-setup
-ExecStartPost=3D/usr/bin/android-gadget-start
-ExecStopPost=3D/usr/bin/android-gadget-cleanup
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-conf=
igfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/android-gadget-cleanup
deleted file mode 100644
index f27d77df51..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/an=
droid-gadget-cleanup
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-
-[ -d /sys/kernel/config/usb_gadget ] || exit 0
-
-cd /sys/kernel/config/usb_gadget
-
-cd adb
-
-echo -n "" > UDC || true
-
-killall adbd || true
-
-umount /dev/usb-ffs/adb
-
-rm configs/c.1/ffs.usb0
-
-rmdir configs/c.1/strings/0x409
-rmdir configs/c.1
-
-rmdir functions/ffs.usb0
-rmdir strings/0x409
-
-cd ..
-rmdir adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-conf=
igfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-=
tools-conf-configfs/android-gadget-setup
deleted file mode 100644
index 47e4edb9be..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/an=
droid-gadget-setup
+++ /dev/null
@@ -1,38 +0,0 @@
-#!/bin/sh
-
-set -e
-
-conf=3D"Conf 1"
-manufacturer=3DRPB
-model=3D"Android device"
-product=3D0xd002
-serial=3D0123456789ABCDEF
-vendor=3D0x18d1
-
-if [ -r /etc/android-gadget-setup.machine ] ; then
-	. /etc/android-gadget-setup.machine
-fi
-
-[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
-
-cd /sys/kernel/config/usb_gadget
-
-[ -d adb ] && /usr/bin/android-gadget-cleanup || true
-
-mkdir adb
-cd adb
-
-mkdir configs/c.1
-mkdir functions/ffs.usb0
-mkdir strings/0x409
-mkdir configs/c.1/strings/0x409
-echo -n "$vendor"  > idVendor
-echo -n "$product" > idProduct
-echo "$serial" > strings/0x409/serialnumber
-echo "$manufacturer" > strings/0x409/manufacturer
-echo "$model" > strings/0x409/product
-echo "$conf" > configs/c.1/strings/0x409/configuration
-ln -s functions/ffs.usb0 configs/c.1
-
-mkdir -p /dev/usb-ffs/adb
-mount -t functionfs usb0 /dev/usb-ffs/adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-conf=
igfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-=
tools-conf-configfs/android-gadget-start
deleted file mode 100644
index 76b5e29624..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/an=
droid-gadget-start
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-set -e
-
-sleep 10
-
-ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_ga=
dget/adb/UDC
-
-echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usa=
ge"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-conf=
igfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-con=
figfs_1.0.bb
deleted file mode 100644
index 342e7fd1a5..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.=
0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "Different utilities from Android - corressponding configu=
ration files for using ConfigFS"
-SECTION =3D "console/utils"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-S =3D "${UNPACKDIR}"
-
-SRC_URI =3D " \
-    file://android-gadget-setup \
-    file://android-gadget-start \
-    file://android-gadget-cleanup \
-    file://10-adbd-configfs.conf \
-"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
-
-    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdi=
r}
-    fi
-
-    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitd=
ir}/system/android-tools-adbd.service.d
-}
-
-FILES:${PN} +=3D " \
-    ${systemd_unitdir}/system/ \
-"
-
-PROVIDES +=3D "android-tools-conf"
-RPROVIDES:${PN} =3D "android-tools-conf"
-BBCLASSEXTEND =3D "native"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/andr=
oid-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-con=
f/android-gadget-setup
deleted file mode 100644
index 26cf30eddd..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gad=
get-setup
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/sh
-
-[ ! -e /dev/pts ] && mkdir -p /dev/pts
-[ ! -e /dev/pts/0 ] && mount devpts /dev/pts -t devpts
-
-# TODO enable the lines below once we have support for getprop
-# retrieve the product info from Android
-# manufacturer=3D$(getprop ro.product.manufacturer Android)
-# model=3D$(getprop ro.product.model Android)
-# serial=3D$(getprop ro.serialno 0123456789ABCDEF)
-
-#below are now needed in order to use FunctionFS for ADB, tested to work w=
ith 3.4+ kernels
-if grep -q functionfs /proc/filesystems; then
-    mkdir -p /dev/usb-ffs/adb
-    mount -t functionfs adb /dev/usb-ffs/adb
-    #android-gadget-setup doesn't provide below 2 and without them it won'=
t work, so we provide them here.
-    echo adb > /sys/class/android_usb/android0/f_ffs/aliases
-    echo ffs > /sys/class/android_usb/android0/functions
-fi
-
-manufacturer=3D"$(cat /system/build.prop | grep -o 'ro.product.manufacture=
r=3D.*' | cut -d'=3D' -f 2)"
-model=3D"$(cat /system/build.prop | grep -o 'ro.product.model=3D.*' | cut =
-d'=3D' -f 2)"
-# get the device serial number from /proc/cmdline directly(since we have n=
o getprop on
-# GNU/Linux)
-serial=3D"$(cat /proc/cmdline | sed 's/.*androidboot.serialno=3D//' | sed =
's/ .*//')"
-
-echo $serial > /sys/class/android_usb/android0/iSerial
-echo $manufacturer > /sys/class/android_usb/android0/iManufacturer
-echo $model > /sys/class/android_usb/android0/iProduct
-
-echo "0" > /sys/class/android_usb/android0/enable
-echo "18d1" > /sys/class/android_usb/android0/idVendor
-echo "D002" > /sys/class/android_usb/android0/idProduct
-echo "adb" > /sys/class/android_usb/android0/functions
-echo "1" >  /sys/class/android_usb/android0/enable
-
-sleep 4
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.=
bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
deleted file mode 100644
index 764d6b404f..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "Different utilities from Android - corressponding configu=
ration files"
-SECTION =3D "console/utils"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
-
-SRC_URI =3D "file://android-gadget-setup"
-
-S =3D "${UNPACKDIR}"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-}
-
-python () {
-    pn =3D d.getVar('PN')
-    profprov =3D d.getVar("PREFERRED_PROVIDER_" + pn)
-    if profprov and pn !=3D profprov:
-        raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s=
" % (pn, profprov, pn))
-}
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk b/=
meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
deleted file mode 100644
index 0687c22c17..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-# Makefile for adb
-
-SRCDIR ?=3D $(S)
-
-VPATH +=3D $(SRCDIR)/system/core/adb
-adb_SRC_FILES +=3D adb.c
-adb_SRC_FILES +=3D console.c
-adb_SRC_FILES +=3D transport.c
-adb_SRC_FILES +=3D transport_local.c
-adb_SRC_FILES +=3D transport_usb.c
-adb_SRC_FILES +=3D commandline.c
-adb_SRC_FILES +=3D adb_client.c
-adb_SRC_FILES +=3D adb_auth_host.c
-adb_SRC_FILES +=3D sockets.c
-adb_SRC_FILES +=3D services.c
-adb_SRC_FILES +=3D file_sync_client.c
-adb_SRC_FILES +=3D get_my_path_linux.c
-adb_SRC_FILES +=3D usb_linux.c
-adb_SRC_FILES +=3D usb_vendors.c
-adb_SRC_FILES +=3D fdevent.c
-adb_OBJS :=3D $(adb_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libcutils
-libcutils_SRC_FILES +=3D atomic.c
-libcutils_SRC_FILES +=3D hashmap.c
-libcutils_SRC_FILES +=3D native_handle.c
-libcutils_SRC_FILES +=3D config_utils.c
-libcutils_SRC_FILES +=3D cpu_info.c
-libcutils_SRC_FILES +=3D load_file.c
-# libcutils_SRC_FILES +=3D open_memstream.c
-# libcutils_SRC_FILES +=3D strdup16to8.c
-# libcutils_SRC_FILES +=3D strdup8to16.c
-# libcutils_SRC_FILES +=3D record_stream.c
-# libcutils_SRC_FILES +=3D process_name.c
-# libcutils_SRC_FILES +=3D threads.c
-# libcutils_SRC_FILES +=3D sched_policy.c
-# libcutils_SRC_FILES +=3D iosched_policy.c
-libcutils_SRC_FILES +=3D str_parms.c
-libcutils_SRC_FILES +=3D fs.c
-libcutils_SRC_FILES +=3D multiuser.c
-libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
-libcutils_SRC_FILES +=3D socket_local_client.c
-libcutils_SRC_FILES +=3D socket_local_server.c
-libcutils_SRC_FILES +=3D socket_loopback_client.c
-libcutils_SRC_FILES +=3D socket_loopback_server.c
-libcutils_SRC_FILES +=3D socket_network_client.c
-libcutils_SRC_FILES +=3D sockets.c
-libcutils_SRC_FILES +=3D ashmem-host.c
-libcutils_SRC_FILES +=3D dlmalloc_stubs.c
-libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
-
-CFLAGS +=3D -DANDROID
-CFLAGS +=3D -DWORKAROUND_BUG6558362
-CFLAGS +=3D -DADB_HOST=3D1
-CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
-CFLAGS +=3D -DANDROID_SMP=3D0
-CFLAGS +=3D -I$(SRCDIR)/system/core/adb
-CFLAGS +=3D -I$(SRCDIR)/system/core/include
-CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(android_arc=
h)/AndroidConfig.h
-
-LIBS +=3D libcutils.a -lpthread -lcrypto
-
-all: adb
-
-adb: libcutils.a $(adb_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
-
-libcutils.a: $(libcutils_OBJS)
-	$(AR) rcs $@ $(libcutils_OBJS)
-
-clean:
-	$(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk b=
/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
deleted file mode 100644
index 31452ae104..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
+++ /dev/null
@@ -1,164 +0,0 @@
-# Makefile for adbd
-
-SRCDIR ?=3D $(S)
-
-VPATH +=3D $(SRCDIR)/system/core/adb
-adbd_SRC_FILES +=3D adb.c
-adbd_SRC_FILES +=3D fdevent.c
-adbd_SRC_FILES +=3D transport.c
-adbd_SRC_FILES +=3D transport_local.c
-adbd_SRC_FILES +=3D transport_usb.c
-adbd_SRC_FILES +=3D adb_auth_client.c
-adbd_SRC_FILES +=3D sockets.c
-adbd_SRC_FILES +=3D services.c
-adbd_SRC_FILES +=3D file_sync_service.c
-adbd_SRC_FILES +=3D jdwp_service.c
-adbd_SRC_FILES +=3D framebuffer_service.c
-adbd_SRC_FILES +=3D remount_service.c
-adbd_SRC_FILES +=3D disable_verity_service.c
-adbd_SRC_FILES +=3D base64.c
-adbd_SRC_FILES +=3D usb_linux_client.c
-adbd_OBJS :=3D $(adbd_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/liblog
-liblog_SRC_FILES +=3D logd_write.c
-liblog_SRC_FILES +=3D log_event_write.c
-liblog_SRC_FILES +=3D logprint.c
-liblog_SRC_FILES +=3D event_tag_map.c
-liblog_SRC_FILES +=3D fake_log_device.c
-liblog_OBJS :=3D $(liblog_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/fs_mgr
-fs_mgr_SRC_FILES +=3D fs_mgr_fstab.c
-fs_mgr_OBJS :=3D $(fs_mgr_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libcutils
-libcutils_SRC_FILES +=3D atomic.c
-libcutils_SRC_FILES +=3D hashmap.c
-libcutils_SRC_FILES +=3D native_handle.c
-libcutils_SRC_FILES +=3D config_utils.c
-libcutils_SRC_FILES +=3D cpu_info.c
-libcutils_SRC_FILES +=3D load_file.c
-# libcutils_SRC_FILES +=3D open_memstream.c
-# libcutils_SRC_FILES +=3D strdup16to8.c
-# libcutils_SRC_FILES +=3D strdup8to16.c
-# libcutils_SRC_FILES +=3D record_stream.c
-# libcutils_SRC_FILES +=3D process_name.c
-# libcutils_SRC_FILES +=3D threads.c
-# libcutils_SRC_FILES +=3D sched_policy.c
-# libcutils_SRC_FILES +=3D iosched_policy.c
-libcutils_SRC_FILES +=3D str_parms.c
-libcutils_SRC_FILES +=3D fs.c
-libcutils_SRC_FILES +=3D multiuser.c
-libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
-libcutils_SRC_FILES +=3D socket_local_client.c
-libcutils_SRC_FILES +=3D socket_local_server.c
-libcutils_SRC_FILES +=3D socket_loopback_client.c
-libcutils_SRC_FILES +=3D socket_loopback_server.c
-libcutils_SRC_FILES +=3D socket_network_client.c
-libcutils_SRC_FILES +=3D sockets.c
-libcutils_SRC_FILES +=3D ashmem-host.c
-libcutils_SRC_FILES +=3D dlmalloc_stubs.c
-libcutils_SRC_FILES +=3D klog.c
-libcutils_SRC_FILES +=3D properties.c
-libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES +=3D booleans.c
-libselinux_SRC_FILES +=3D canonicalize_context.c
-libselinux_SRC_FILES +=3D disable.c
-libselinux_SRC_FILES +=3D enabled.c
-libselinux_SRC_FILES +=3D fgetfilecon.c
-libselinux_SRC_FILES +=3D fsetfilecon.c
-libselinux_SRC_FILES +=3D getenforce.c
-libselinux_SRC_FILES +=3D getfilecon.c
-libselinux_SRC_FILES +=3D getpeercon.c
-libselinux_SRC_FILES +=3D lgetfilecon.c
-libselinux_SRC_FILES +=3D load_policy.c
-libselinux_SRC_FILES +=3D lsetfilecon.c
-libselinux_SRC_FILES +=3D policyvers.c
-libselinux_SRC_FILES +=3D procattr.c
-libselinux_SRC_FILES +=3D setenforce.c
-libselinux_SRC_FILES +=3D setfilecon.c
-libselinux_SRC_FILES +=3D context.c
-libselinux_SRC_FILES +=3D mapping.c
-libselinux_SRC_FILES +=3D stringrep.c
-libselinux_SRC_FILES +=3D compute_create.c
-libselinux_SRC_FILES +=3D compute_av.c
-libselinux_SRC_FILES +=3D avc.c
-libselinux_SRC_FILES +=3D avc_internal.c
-libselinux_SRC_FILES +=3D avc_sidtab.c
-libselinux_SRC_FILES +=3D get_initial_context.c
-libselinux_SRC_FILES +=3D checkAccess.c
-libselinux_SRC_FILES +=3D sestatus.c
-libselinux_SRC_FILES +=3D deny_unknown.c
-
-libselinux_SRC_FILES +=3D callbacks.c
-libselinux_SRC_FILES +=3D check_context.c
-libselinux_SRC_FILES +=3D freecon.c
-libselinux_SRC_FILES +=3D init.c
-libselinux_SRC_FILES +=3D label.c
-libselinux_SRC_FILES +=3D label_file.c
-libselinux_SRC_FILES +=3D label_android_property.c
-libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
-libext4_utils_SRC_FILES +=3D make_ext4fs.c
-libext4_utils_SRC_FILES +=3D ext4fixup.c
-libext4_utils_SRC_FILES +=3D ext4_utils.c
-libext4_utils_SRC_FILES +=3D allocate.c
-libext4_utils_SRC_FILES +=3D contents.c
-libext4_utils_SRC_FILES +=3D extent.c
-libext4_utils_SRC_FILES +=3D indirect.c
-libext4_utils_SRC_FILES +=3D uuid.c
-libext4_utils_SRC_FILES +=3D sha1.c
-libext4_utils_SRC_FILES +=3D wipe.c
-libext4_utils_SRC_FILES +=3D crc16.c
-libext4_utils_SRC_FILES +=3D ext4_sb.c
-libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
-
-CFLAGS +=3D -std=3Dgnu11
-CFLAGS +=3D -DANDROID
-CFLAGS +=3D -DADB_HOST=3D0
-CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
-CFLAGS +=3D -DALLOW_ADBD_ROOT=3D1
-CFLAGS +=3D -DALLOW_ADBD_DISABLE_VERITY=3D1
-CFLAGS +=3D -DPROP_NAME_MAX=3D32
-CFLAGS +=3D -DPROP_VALUE_MAX=3D92
-CFLAGS +=3D -DAUDITD_LOG_TAG=3D1003
-# CFLAGS +=3D -DHOST
-CFLAGS +=3D -DANDROID_SMP=3D0
-CFLAGS +=3D -I$(SRCDIR)/system/core/adb
-CFLAGS +=3D -I$(SRCDIR)/system/core/include
-CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS +=3D -I$(SRCDIR)/system/core/fs_mgr/include
-CFLAGS +=3D -I$(SRCDIR)/hardware/libhardware/include
-CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
-CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(android_arc=
h)/AndroidConfig.h
-
-LIBS +=3D liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -l=
pthread -lbsd -lpcre -lresolv -lcrypto
-
-all: adbd
-
-adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd=
_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
-
-liblog.a: $(liblog_OBJS)
-	$(AR) rcs $@ $(liblog_OBJS)
-
-libfs_mgr.a: $(fs_mgr_OBJS)
-	$(AR) rcs $@ $(fs_mgr_OBJS)
-
-libcutils.a: $(libcutils_OBJS)
-	$(AR) rcs $@ $(libcutils_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	export CFLAGS=3D"-DANDROID -DHOST"
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-clean:
-	$(RM) *.o *.a adbd
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-t=
ools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/an=
droid-tools-adbd.service
deleted file mode 100644
index b6661f2e39..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-ad=
bd.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=3DAndroid Debug Bridge
-ConditionPathExists=3D/etc/usb-debugging-enabled
-Before=3Dandroid-system.service
-
-[Service]
-Type=3Dsimple
-Restart=3Don-failure
-ExecStartPre=3D-/usr/bin/android-gadget-setup adb
-ExecStart=3D/usr/bin/adbd
-
-[Install]
-WantedBy=3Dbasic.target
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/build/000=
1-Riscv-Add-risc-v-Android-config-header.patch b/meta-oe/recipes-devtools/a=
ndroid-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-heade=
r.patch
deleted file mode 100644
index c091fd404b..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv=
-Add-risc-v-Android-config-header.patch
+++ /dev/null
@@ -1,361 +0,0 @@
-From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:00:00 2001
-From: Chenxi Mao <maochenxi@eswin.com>
-Date: Mon, 20 Apr 2020 15:32:40 +0800
-Subject: [PATCH 1/1] Riscv: Add risc-v Android config header
-
----
-Upstream-Status: Pending
-
- .../arch/linux-riscv64/AndroidConfig.h        | 340 ++++++++++++++++++
- 1 file changed, 340 insertions(+)
- create mode 100644 core/combo/include/arch/linux-riscv64/AndroidConfig.h
-
-diff --git a/core/combo/include/arch/linux-riscv64/AndroidConfig.h b/core/=
combo/include/arch/linux-riscv64/AndroidConfig.h
-new file mode 100644
-index 0000000000..bcbda8f87f
---- /dev/null
-+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
-@@ -0,0 +1,340 @@
-+/*
-+ * Copyright (C) 2013 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implie=
d.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+/*
-+ * Android config -- "android-aarch64".  Used for ARM aarch64 device buil=
ds.
-+ */
-+#ifndef _ANDROID_CONFIG_H
-+#define _ANDROID_CONFIG_H
-+
-+/*
-+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+ *                              !!! IMPORTANT !!!
-+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+ *
-+ * This file is included by ALL C/C++ source files.  Don't put anything i=
n
-+ * here unless you are absolutely certain it can't go anywhere else.
-+ *
-+ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "=
//"
-+ * comments.
-+ */
-+
-+/*
-+ * Threading model.  Choose one:
-+ *
-+ * HAVE_PTHREADS - use the pthreads library.
-+ * HAVE_WIN32_THREADS - use Win32 thread primitives.
-+ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__BEGINTHREAD=
EX
-+ */
-+#define HAVE_PTHREADS
-+
-+/*
-+ * Do we have pthread_setname_np()?
-+ *
-+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a function with
-+ * the same name but different parameters, so we can't use that here.)
-+ */
-+#define HAVE_ANDROID_PTHREAD_SETNAME_NP
-+
-+/*
-+ * Do we have the futex syscall?
-+ */
-+#define HAVE_FUTEX
-+
-+/*
-+ * Process creation model.  Choose one:
-+ *
-+ * HAVE_FORKEXEC - use fork() and exec()
-+ * HAVE_WIN32_PROC - use CreateProcess()
-+ */
-+#define HAVE_FORKEXEC
-+
-+/*
-+ * Process out-of-memory adjustment.  Set if running on Linux,
-+ * where we can write to /proc/<pid>/oom_adj to modify the out-of-memory
-+ * badness adjustment.
-+ */
-+#define HAVE_OOM_ADJ
-+
-+/*
-+ * IPC model.  Choose one:
-+ *
-+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmget).
-+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
-+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping).
-+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
-+ */
-+#define HAVE_ANDROID_IPC
-+
-+/*
-+ * Memory-mapping model. Choose one:
-+ *
-+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
-+ * HAVE_WIN32_FILEMAP - use Win32 filemaps
-+ */
-+#define  HAVE_POSIX_FILEMAP
-+
-+/*
-+ * Define this if you have <termio.h>
-+ */
-+#define  HAVE_TERMIO_H 1
-+
-+/*
-+ * Define this if you have <sys/sendfile.h>
-+ */
-+#define  HAVE_SYS_SENDFILE_H 1
-+
-+/*
-+ * Define this if you build against MSVCRT.DLL
-+ */
-+/* #define HAVE_MS_C_RUNTIME */
-+
-+/*
-+ * Define this if you have sys/uio.h
-+ */
-+#define  HAVE_SYS_UIO_H 1
-+
-+/*
-+ * Define this if your platforms implements symbolic links
-+ * in its filesystems
-+ */
-+#define HAVE_SYMLINKS
-+
-+/*
-+ * Define this if we have localtime_r().
-+ */
-+/* #define HAVE_LOCALTIME_R 1 */
-+
-+/*
-+ * Define this if we have gethostbyname_r().
-+ */
-+/* #define HAVE_GETHOSTBYNAME_R */
-+
-+/*
-+ * Define this if we have ioctl().
-+ */
-+#define HAVE_IOCTL
-+
-+/*
-+ * Define this if we want to use WinSock.
-+ */
-+/* #define HAVE_WINSOCK */
-+
-+/*
-+ * Define this if have clock_gettime() and friends
-+ */
-+#define HAVE_POSIX_CLOCKS
-+
-+/*
-+ * Define this if we have linux style epoll()
-+ */
-+#define HAVE_EPOLL
-+
-+/*
-+ * Endianness of the target machine.  Choose one:
-+ *
-+ * HAVE_ENDIAN_H -- have endian.h header we can include.
-+ * HAVE_LITTLE_ENDIAN -- we are little endian.
-+ * HAVE_BIG_ENDIAN -- we are big endian.
-+ */
-+#define HAVE_ENDIAN_H
-+#define HAVE_LITTLE_ENDIAN
-+
-+#define _FILE_OFFSET_BITS 64
-+/* #define _LARGEFILE_SOURCE 1 */
-+
-+/*
-+ * Define if platform has off64_t (and lseek64 and other xxx64 functions)
-+ */
-+#define HAVE_OFF64_T
-+
-+/*
-+ * Defined if we have the backtrace() call for retrieving a stack trace.
-+ * Needed for CallStack to operate; if not defined, CallStack is
-+ * non-functional.
-+ */
-+#define HAVE_BACKTRACE 0
-+
-+/*
-+ * Defined if we have the cxxabi.h header for demangling C++ symbols.  If
-+ * not defined, stack crawls will be displayed with raw mangled symbols
-+ */
-+#define HAVE_CXXABI 0
-+
-+/*
-+ * Defined if we have the gettid() system call.
-+ */
-+#define HAVE_GETTID
-+
-+/*
-+ * Defined if we have the sched_setscheduler() call
-+ */
-+#define HAVE_SCHED_SETSCHEDULER
-+
-+/*
-+ * Add any extra platform-specific defines here.
-+ */
-+#ifndef __linux__
-+#define __linux__
-+#endif
-+
-+/*
-+ * Define if we have <malloc.h> header
-+ */
-+#define HAVE_MALLOC_H
-+
-+/*
-+ * Define if we're running on *our* linux on device or emulator.
-+ */
-+#define HAVE_ANDROID_OS 1
-+
-+/*
-+ * Define if we have Linux-style non-filesystem Unix Domain Sockets
-+ */
-+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1
-+
-+/*
-+ * Define if we have Linux's inotify in <sys/inotify.h>.
-+ */
-+#define HAVE_INOTIFY 1
-+
-+/*
-+ * Define if we have madvise() in <sys/mman.h>
-+ */
-+#define HAVE_MADVISE 1
-+
-+/*
-+ * Define if tm struct has tm_gmtoff field
-+ */
-+#define HAVE_TM_GMTOFF 1
-+
-+/*
-+ * Define if dirent struct has d_type field
-+ */
-+#define HAVE_DIRENT_D_TYPE 1
-+
-+/*
-+ * Define if libc includes Android system properties implementation.
-+ */
-+#define HAVE_LIBC_SYSTEM_PROPERTIES 1
-+
-+/*
-+ * Define if system provides a system property server (should be
-+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
-+ */
-+/* #define HAVE_SYSTEM_PROPERTY_SERVER */
-+
-+/*
-+ * What CPU architecture does this platform use?
-+ */
-+#define ARCH_AARCH64
-+
-+/*
-+ * Define if the size of enums is as short as possible,
-+ */
-+/* #define HAVE_SHORT_ENUMS */
-+
-+/*
-+ * sprintf() format string for shared library naming.
-+ */
-+#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
-+
-+/*
-+ * type for the third argument to mincore().
-+ */
-+#define MINCORE_POINTER_TYPE unsigned char *
-+
-+/*
-+ * The default path separator for the platform
-+ */
-+#define OS_PATH_SEPARATOR '/'
-+
-+/*
-+ * Is the filesystem case sensitive?
-+ */
-+#define OS_CASE_SENSITIVE
-+
-+/*
-+ * Define if <sys/socket.h> exists.
-+ */
-+#define HAVE_SYS_SOCKET_H 1
-+
-+/*
-+ * Define if the strlcpy() function exists on the system.
-+ */
-+#define HAVE_STRLCPY 1
-+
-+/*
-+ * Define if the open_memstream() function exists on the system.
-+ */
-+/* #define HAVE_OPEN_MEMSTREAM 1 */
-+
-+/*
-+ * Define if the BSD funopen() function exists on the system.
-+ */
-+#define HAVE_FUNOPEN 1
-+
-+/*
-+ * Define if prctl() exists
-+ */
-+#define HAVE_PRCTL 1
-+
-+/*
-+ * Define if writev() exists
-+ */
-+#define HAVE_WRITEV 1
-+
-+/*
-+ * Define if <stdint.h> exists.
-+ */
-+#define HAVE_STDINT_H 1
-+
-+/*
-+ * Define if <stdbool.h> exists.
-+ */
-+#define HAVE_STDBOOL_H 1
-+
-+/*
-+ * Define if <sched.h> exists.
-+ */
-+#define HAVE_SCHED_H 1
-+
-+/*
-+ * Define if pread() exists
-+ */
-+#define HAVE_PREAD 1
-+
-+/*
-+ * Define if we have st_mtim in struct stat
-+ */
-+#define HAVE_STAT_ST_MTIM 1
-+
-+/*
-+ * Define if printf() supports %zd for size_t arguments
-+ */
-+#define HAVE_PRINTF_ZD 1
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style function=
 prototype.
-+ */
-+#define HAVE_BSD_QSORT_R 0
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style function=
 prototype.
-+ */
-+#define HAVE_GNU_QSORT_R 0
-+
-+#endif /* _ANDROID_CONFIG_H */
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001=
-adb-remove-selinux-extensions.patch b/meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0001-adb-remove-selinux-extensions.patch
deleted file mode 100644
index 7d20c50680..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-re=
move-selinux-extensions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00 2001
-From: Sergio Schvezov <sergio.schvezov@canonical.com>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: remove selinux extensions
-
-* drop useless includes of Android SELINUX extensions
-* avoids having to clone another module
-* this should be sent upstream
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- adb/file_sync_service.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c
-index 7933858516..3cbd0cd863 100644
---- a/adb/file_sync_service.c
-+++ b/adb/file_sync_service.c
-@@ -26,7 +26,6 @@
-=20
- #include <errno.h>
- #include <private/android_filesystem_config.h>
--#include <selinux/android.h>
- #include "sysdeps.h"
-=20
- #define TRACE_TAG  TRACE_SYNC
-@@ -73,7 +72,6 @@ static int mkdirs(char *name)
-                 *x =3D '/';
-                 return ret;
-             }
--            selinux_android_restorecon(name, 0);
-         }
-         *x++ =3D '/';
-     }
-@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path, uid_t u=
id,
-     if(fd >=3D 0) {
-         struct utimbuf u;
-         adb_close(fd);
--        selinux_android_restorecon(path, 0);
-         u.actime =3D timestamp;
-         u.modtime =3D timestamp;
-         utime(path, &u);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001=
-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-st=
rlcpy-for-glibc-based-syste.patch
deleted file mode 100644
index 82e97152be..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory=
.h-Always-define-strlcpy-for-glibc-based-syste.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From db3a3714be07c8ab51b9ae7b035e4afe9f39c645 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Sep 2022 13:20:22 -0700
-Subject: [PATCH] memory.h: Always define strlcpy for glibc based systems
-
-android-config.h file includes on compiler cmdline sets HAVE_STRLCPY
-unconditionally, since bionic supports it, its no big deal on android
-and also no problem when using musl since implementation exists for musl
-too, but glibc does not provide this. So either we include libbsd or use
-the implementation provided by android-tools here. We are currently
-using the in tree implementation for systems which do not provide it
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/cutils/memory.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/cutils/memory.h b/include/cutils/memory.h
-index e725cdd032..9e99353c58 100644
---- a/include/cutils/memory.h
-+++ b/include/cutils/memory.h
-@@ -30,7 +30,7 @@ void android_memset16(uint16_t* dst, uint16_t value, siz=
e_t size);
- /* size is given in bytes and must be multiple of 4 */
- void android_memset32(uint32_t* dst, uint32_t value, size_t size);
-=20
--#if !HAVE_STRLCPY
-+#if !HAVE_STRLCPY || defined(__GLIBC__)
- /* Declaration of strlcpy() for platforms that don't already have it. */
- size_t strlcpy(char *dst, const char *src, size_t size);
- #endif
---=20
-2.37.3
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002=
-adb-Use-local-sockets-where-appropriate.patch b/meta-oe/recipes-devtools/a=
ndroid-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriat=
e.patch
deleted file mode 100644
index 3627110ad8..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Us=
e-local-sockets-where-appropriate.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00 2001
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: Use local sockets where appropriate
-
-Upstream-Status: Inappropriate
----
- adb/adb.c             | 6 +++++-
- adb/adb_client.c      | 5 +++--
- adb/transport_local.c | 3 ++-
- 3 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index 10a1e0da26..027edd9359 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -1230,7 +1230,11 @@ int launch_server(int server_port)
-  */
- void build_local_name(char* target_str, size_t target_size, int server_po=
rt)
- {
--  snprintf(target_str, target_size, "tcp:%d", server_port);
-+  if (gListenAll > 0) {
-+    snprintf(target_str, target_size, "tcp:%d", server_port);
-+  } else {
-+    snprintf(target_str, target_size, "local:%d", server_port);
-+  }
- }
-=20
- #if !ADB_HOST
-diff --git a/adb/adb_client.c b/adb/adb_client.c
-index eb1720d22c..a383faefe3 100644
---- a/adb/adb_client.c
-+++ b/adb/adb_client.c
-@@ -185,12 +185,12 @@ int _adb_connect(const char *service)
-         strcpy(__adb_error, "service name too long");
-         return -1;
-     }
--    snprintf(tmp, sizeof tmp, "%04x", len);
-+    snprintf(tmp, sizeof tmp, "%d", __adb_server_port);
-=20
-     if (__adb_server_name)
-         fd =3D socket_network_client(__adb_server_name, __adb_server_port=
, SOCK_STREAM);
-     else
--        fd =3D socket_loopback_client(__adb_server_port, SOCK_STREAM);
-+        fd =3D socket_local_client(tmp, ANDROID_SOCKET_NAMESPACE_ABSTRACT=
, SOCK_STREAM);
-=20
-     if(fd < 0) {
-         strcpy(__adb_error, "cannot connect to daemon");
-@@ -201,6 +201,7 @@ int _adb_connect(const char *service)
-         return -1;
-     }
-=20
-+    snprintf(tmp, sizeof tmp, "%04x", len);
-     if(writex(fd, tmp, 4) || writex(fd, service, len)) {
-         strcpy(__adb_error, "write failure during connection");
-         adb_close(fd);
-diff --git a/adb/transport_local.c b/adb/transport_local.c
-index 948cc15812..71582a8c88 100644
---- a/adb/transport_local.c
-+++ b/adb/transport_local.c
-@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int console_port, in=
t adb_port)
-     }
- #endif
-     if (fd < 0) {
--        fd =3D socket_loopback_client(adb_port, SOCK_STREAM);
-+        snprintf(buf, sizeof buf, "%d", adb_port);
-+        fd =3D socket_local_client(buf, ANDROID_SOCKET_NAMESPACE_ABSTRACT=
, SOCK_STREAM);
-     }
-=20
-     if (fd >=3D 0) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003=
-adb-define-shell-command.patch b/meta-oe/recipes-devtools/android-tools/an=
droid-tools/core/0003-adb-define-shell-command.patch
deleted file mode 100644
index cf1d9cbc3d..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-de=
fine-shell-command.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: define shell command
-
-we intend to run on Linux system so the shell is always /bin/sh,
-for the host or the target.
-
-Upstream-Status: Inappropriate
----
- adb/services.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/adb/services.c b/adb/services.c
-index 21b08dc201..d44b0c5068 100644
---- a/adb/services.c
-+++ b/adb/services.c
-@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd, const =
char *arg0, const char *arg
- }
- #endif  /* !ABD_HOST */
-=20
--#if ADB_HOST
- #define SHELL_COMMAND "/bin/sh"
--#else
--#define SHELL_COMMAND "/system/bin/sh"
--#endif
-=20
- #if !ADB_HOST
- static void subproc_waiter_service(int fd, void *cookie)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004=
-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/andro=
id-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
deleted file mode 100644
index 7f03cd2beb..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fi=
x-build-on-big-endian-systems.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 21 Feb 2017 19:46:24 +0100
-Subject: [PATCH] adb: Fix build on big endian systems
-
-The usb_linux_client.c file defines cpu_to_le16/32 by using the C
-library htole16/32 function calls. However, cpu_to_le16/32 are used
-when initializing structures, i.e in a context where a function call
-is not allowed.
-
-It works fine on little endian systems because htole16/32 are defined
-by the C library as no-ops. But on big-endian systems, they are
-actually doing something, which might involve calling a function,
-causing build failures.
-
-To solve this, we simply open-code cpu_to_le16/32 in a way that allows
-them to be used when initializing structures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Upstream-Status: Pending
-
- adb/usb_linux_client.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
-index 8426e0ea14..6e8b5bbbd2 100644
---- a/adb/usb_linux_client.c
-+++ b/adb/usb_linux_client.c
-@@ -34,8 +34,15 @@
- #define MAX_PACKET_SIZE_FS	64
- #define MAX_PACKET_SIZE_HS	512
-=20
--#define cpu_to_le16(x)  htole16(x)
--#define cpu_to_le32(x)  htole32(x)
-+#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
-+# define cpu_to_le16(x) (x)
-+# define cpu_to_le32(x) (x)
-+#else
-+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
-+# define cpu_to_le32(x) \
-+	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
-+	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
-+#endif
-=20
- struct usb_handle
- {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005=
-adb-add-base64-implementation.patch b/meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0005-adb-add-base64-implementation.patch
deleted file mode 100644
index 4827ffe042..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-ad=
d-base64-implementation.patch
+++ /dev/null
@@ -1,350 +0,0 @@
-From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2017 15:46:38 -0700
-Subject: [PATCH] adb: add base64 implementation
-
-musl needs it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- adb/adb_auth_client.c |   2 +-
- adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 316 insertions(+), 1 deletion(-)
- create mode 100644 adb/base64.c
-
-diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
-index 55e9dcad19..104b413b8b 100644
---- a/adb/adb_auth_client.c
-+++ b/adb/adb_auth_client.c
-@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct listnode =
*list)
-         if (sep)
-             *sep =3D '\0';
-=20
--        ret =3D __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4=
);
-+        ret =3D b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-         if (ret !=3D sizeof(key->key)) {
-             D("%s: Invalid base64 data ret=3D%d\n", file, ret);
-             free(key);
-diff --git a/adb/base64.c b/adb/base64.c
-new file mode 100644
-index 0000000000..95da284d0d
---- /dev/null
-+++ b/adb/base64.c
-@@ -0,0 +1,315 @@
-+/*
-+ * Copyright (c) 1996-1999 by Internet Software Consortium.
-+ *
-+ * Permission to use, copy, modify, and distribute this software for any
-+ * purpose with or without fee is hereby granted, provided that the above
-+ * copyright notice and this permission notice appear in all copies.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISC=
LAIMS
-+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARR=
ANTIES
-+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
-+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTI=
AL
-+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
-+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOU=
S
-+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF=
 THIS
-+ * SOFTWARE.
-+ */
-+
-+/*
-+ * Portions Copyright (c) 1995 by International Business Machines, Inc.
-+ *
-+ * International Business Machines, Inc. (hereinafter called IBM) grants
-+ * permission under its copyrights to use, copy, modify, and distribute t=
his
-+ * Software with or without fee, provided that the above copyright notice=
 and
-+ * all paragraphs of this notice appear in all copies, and that the name =
of IBM
-+ * not be used in connection with the marketing of any product incorporat=
ing
-+ * the Software or modifications thereof, without specific, written prior
-+ * permission.
-+ *
-+ * To the extent it has a right to do so, IBM grants an immunity from sui=
t
-+ * under its patents, if any, for the use, sale or manufacture of product=
s to
-+ * the extent that such products are used for performing Domain Name Syst=
em
-+ * dynamic updates in TCP/IP networks by means of the Software.  No immun=
ity is
-+ * granted for any product per se or for any other function of any produc=
t.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL WARRANTIES,
-+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-+ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY SPECIAL,
-+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER A=
RISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE, =
EVEN
-+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
-+ */
-+
-+#if !defined(LINT) && !defined(CODECENTER)
-+static const char rcsid[] =3D "$BINDId: base64.c,v 8.7 1999/10/13 16:39:3=
3 vixie Exp $";
-+#endif /* not lint */
-+
-+#include <sys/types.h>
-+#include <sys/param.h>
-+#include <sys/socket.h>
-+
-+#include <netinet/in.h>
-+#include <arpa/inet.h>
-+#include <arpa/nameser.h>
-+
-+#include <ctype.h>
-+#include <resolv.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <stdint.h>
-+#include <string.h>
-+
-+#define Assert(Cond) if (!(Cond)) abort()
-+
-+static const char Base64[] =3D
-+	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
-+static const char Pad64 =3D '=3D';
-+
-+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
-+   The following encoding technique is taken from RFC 1521 by Borenstein
-+   and Freed.  It is reproduced here in a slightly edited form for
-+   convenience.
-+
-+   A 65-character subset of US-ASCII is used, enabling 6 bits to be
-+   represented per printable character. (The extra 65th character, "=3D",
-+   is used to signify a special processing function.)
-+
-+   The encoding process represents 24-bit groups of input bits as output
-+   strings of 4 encoded characters. Proceeding from left to right, a
-+   24-bit input group is formed by concatenating 3 8-bit input groups.
-+   These 24 bits are then treated as 4 concatenated 6-bit groups, each
-+   of which is translated into a single digit in the base64 alphabet.
-+
-+   Each 6-bit group is used as an index into an array of 64 printable
-+   characters. The character referenced by the index is placed in the
-+   output string.
-+
-+                         Table 1: The Base64 Alphabet
-+
-+      Value Encoding  Value Encoding  Value Encoding  Value Encoding
-+          0 A            17 R            34 i            51 z
-+          1 B            18 S            35 j            52 0
-+          2 C            19 T            36 k            53 1
-+          3 D            20 U            37 l            54 2
-+          4 E            21 V            38 m            55 3
-+          5 F            22 W            39 n            56 4
-+          6 G            23 X            40 o            57 5
-+          7 H            24 Y            41 p            58 6
-+          8 I            25 Z            42 q            59 7
-+          9 J            26 a            43 r            60 8
-+         10 K            27 b            44 s            61 9
-+         11 L            28 c            45 t            62 +
-+         12 M            29 d            46 u            63 /
-+         13 N            30 e            47 v
-+         14 O            31 f            48 w         (pad) =3D
-+         15 P            32 g            49 x
-+         16 Q            33 h            50 y
-+
-+   Special processing is performed if fewer than 24 bits are available
-+   at the end of the data being encoded.  A full encoding quantum is
-+   always completed at the end of a quantity.  When fewer than 24 input
-+   bits are available in an input group, zero bits are added (on the
-+   right) to form an integral number of 6-bit groups.  Padding at the
-+   end of the data is performed using the '=3D' character.
-+
-+   Since all base64 input is an integral number of octets, only the
-+         -------------------------------------------------
-+   following cases can arise:
-+
-+       (1) the final quantum of encoding input is an integral
-+           multiple of 24 bits; here, the final unit of encoded
-+	   output will be an integral multiple of 4 characters
-+	   with no "=3D" padding,
-+       (2) the final quantum of encoding input is exactly 8 bits;
-+           here, the final unit of encoded output will be two
-+	   characters followed by two "=3D" padding characters, or
-+       (3) the final quantum of encoding input is exactly 16 bits;
-+           here, the final unit of encoded output will be three
-+	   characters followed by one "=3D" padding character.
-+   */
-+
-+int
-+b64_ntop(const uint8_t* src, size_t srclength, char* target, size_t targs=
ize)
-+{
-+	size_t datalength =3D 0;
-+	uint8_t input[3];
-+	uint8_t output[4];
-+	size_t i;
-+
-+	while (2 < srclength) {
-+		input[0] =3D *src++;
-+		input[1] =3D *src++;
-+		input[2] =3D *src++;
-+		srclength -=3D 3;
-+
-+		output[0] =3D input[0] >> 2;
-+		output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >> 4);
-+		output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >> 6);
-+		output[3] =3D input[2] & 0x3f;
-+		Assert(output[0] < 64);
-+		Assert(output[1] < 64);
-+		Assert(output[2] < 64);
-+		Assert(output[3] < 64);
-+
-+		if (datalength + 4 > targsize)
-+			return (-1);
-+		target[datalength++] =3D Base64[output[0]];
-+		target[datalength++] =3D Base64[output[1]];
-+		target[datalength++] =3D Base64[output[2]];
-+		target[datalength++] =3D Base64[output[3]];
-+	}
-+
-+	/* Now we worry about padding. */
-+	if (0 !=3D srclength) {
-+		/* Get what's left. */
-+		input[0] =3D input[1] =3D input[2] =3D '\0';
-+		for (i =3D 0; i < srclength; i++)
-+			input[i] =3D *src++;
-+
-+		output[0] =3D input[0] >> 2;
-+		output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >> 4);
-+		output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >> 6);
-+		Assert(output[0] < 64);
-+		Assert(output[1] < 64);
-+		Assert(output[2] < 64);
-+
-+		if (datalength + 4 > targsize)
-+			return (-1);
-+		target[datalength++] =3D Base64[output[0]];
-+		target[datalength++] =3D Base64[output[1]];
-+		if (srclength =3D=3D 1)
-+			target[datalength++] =3D Pad64;
-+		else
-+			target[datalength++] =3D Base64[output[2]];
-+		target[datalength++] =3D Pad64;
-+	}
-+	if (datalength >=3D targsize)
-+		return (-1);
-+	target[datalength] =3D '\0';	/* Returned value doesn't count \0. */
-+	return (datalength);
-+}
-+
-+/* skips all whitespace anywhere.
-+   converts characters, four at a time, starting at (or after)
-+   src from base - 64 numbers into three 8 bit bytes in the target area.
-+   it returns the number of data bytes stored at the target, or -1 on err=
or.
-+ */
-+
-+int b64_pton(const char* src, uint8_t* target, size_t targsize)
-+{
-+	int tarindex, state, ch;
-+	char *pos;
-+
-+	state =3D 0;
-+	tarindex =3D 0;
-+
-+	while ((ch =3D *src++) !=3D '\0') {
-+		if (isspace(ch))	/* Skip whitespace anywhere. */
-+			continue;
-+
-+		if (ch =3D=3D Pad64)
-+			break;
-+
-+		pos =3D strchr(Base64, ch);
-+		if (pos =3D=3D 0) 		/* A non-base64 character. */
-+			return (-1);
-+
-+		switch (state) {
-+		case 0:
-+			if (target) {
-+				if ((size_t)tarindex >=3D targsize)
-+					return (-1);
-+				target[tarindex] =3D (pos - Base64) << 2;
-+			}
-+			state =3D 1;
-+			break;
-+		case 1:
-+			if (target) {
-+				if ((size_t)tarindex + 1 >=3D targsize)
-+					return (-1);
-+				target[tarindex]   |=3D  (pos - Base64) >> 4;
-+				target[tarindex+1]  =3D ((pos - Base64) & 0x0f)
-+							<< 4 ;
-+			}
-+			tarindex++;
-+			state =3D 2;
-+			break;
-+		case 2:
-+			if (target) {
-+				if ((size_t)tarindex + 1 >=3D targsize)
-+					return (-1);
-+				target[tarindex]   |=3D  (pos - Base64) >> 2;
-+				target[tarindex+1]  =3D ((pos - Base64) & 0x03)
-+							<< 6;
-+			}
-+			tarindex++;
-+			state =3D 3;
-+			break;
-+		case 3:
-+			if (target) {
-+				if ((size_t)tarindex >=3D targsize)
-+					return (-1);
-+				target[tarindex] |=3D (pos - Base64);
-+			}
-+			tarindex++;
-+			state =3D 0;
-+			break;
-+		default:
-+			abort();
-+		}
-+	}
-+
-+	/*
-+	 * We are done decoding Base-64 chars.  Let's see if we ended
-+	 * on a byte boundary, and/or with erroneous trailing characters.
-+	 */
-+
-+	if (ch =3D=3D Pad64) {		/* We got a pad char. */
-+		ch =3D *src++;		/* Skip it, get next. */
-+		switch (state) {
-+		case 0:		/* Invalid =3D in first position */
-+		case 1:		/* Invalid =3D in second position */
-+			return (-1);
-+
-+		case 2:		/* Valid, means one byte of info */
-+			/* Skip any number of spaces. */
-+			for ((void)NULL; ch !=3D '\0'; ch =3D *src++)
-+				if (!isspace(ch))
-+					break;
-+			/* Make sure there is another trailing =3D sign. */
-+			if (ch !=3D Pad64)
-+				return (-1);
-+			ch =3D *src++;		/* Skip the =3D */
-+			/* Fall through to "single trailing =3D" case. */
-+			/* FALLTHROUGH */
-+
-+		case 3:		/* Valid, means two bytes of info */
-+			/*
-+			 * We know this char is an =3D.  Is there anything but
-+			 * whitespace after it?
-+			 */
-+			for ((void)NULL; ch !=3D '\0'; ch =3D *src++)
-+				if (!isspace(ch))
-+					return (-1);
-+
-+			/*
-+			 * Now make sure for cases 2 and 3 that the "extra"
-+			 * bits that slopped past the last full byte were
-+			 * zeros.  If we don't check them, they become a
-+			 * subliminal channel.
-+			 */
-+			if (target && target[tarindex] !=3D 0)
-+				return (-1);
-+		}
-+	} else {
-+		/*
-+		 * We ended by seeing the end of the string.  Make sure we
-+		 * have no partial bytes lying around.
-+		 */
-+		if (state !=3D 0)
-+			return (-1);
-+	}
-+
-+	return (tarindex);
-+}
-+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006=
-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tool=
s/core/0006-adb-Musl-fixes.patch
deleted file mode 100644
index 182b1eb29e..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Mu=
sl-fixes.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2017 15:50:57 -0700
-Subject: [PATCH] adb: Musl fixes
-
-__nonnull is gcc specific
-include sys/types.h for size_t
-Do not redefine close() and lseek()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- adb/adb.h                    |  2 ++
- adb/disable_verity_service.c | 13 ++++++++-----
- adb/framebuffer_service.c    |  7 ++++---
- adb/sysdeps.h                | 12 ++++++------
- 4 files changed, 20 insertions(+), 14 deletions(-)
-
---- a/adb/adb.h
-+++ b/adb/adb.h
-@@ -18,7 +18,9 @@
- #define __ADB_H
-=20
- #include <limits.h>
-+#include <sys/types.h>
-=20
-+#include "fdevent.h"
- #include "adb_trace.h"
- #include "transport.h"  /* readx(), writex() */
-=20
---- a/adb/disable_verity_service.c
-+++ b/adb/disable_verity_service.c
-@@ -14,25 +14,32 @@
-  * limitations under the License.
-  */
-=20
--#include "sysdeps.h"
-=20
- #define  TRACE_TAG  TRACE_ADB
- #include "adb.h"
-+#include "sysdeps.h"
-+#include "cutils/properties.h"
-+#include "ext4_sb.h"
-+#include <fs_mgr.h>
-=20
- #include <stdio.h>
- #include <stdarg.h>
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <inttypes.h>
--
--#include "cutils/properties.h"
--#include "ext4_sb.h"
--#include <fs_mgr.h>
-+#include <unistd.h>
-+#include <errno.h>
-+#include <stdbool.h>
-+
-+#if defined(__linux__) && !defined(__GLIBC__)
-+#define lseek64 lseek
-+#define off64_t off_t
-+#endif
-=20
- #define FSTAB_PREFIX "/fstab."
- struct fstab *fstab;
-=20
--__attribute__((__format__(printf, 2, 3))) __nonnull((2))
-+__attribute__((__format__(printf, 2, 3))) __attribute__((nonnull((2))))
- static void write_console(int fd, const char* format, ...)
- {
-     char buffer[256];
---- a/adb/framebuffer_service.c
-+++ b/adb/framebuffer_service.c
-@@ -14,6 +14,10 @@
-  * limitations under the License.
-  */
-=20
-+#include "fdevent.h"
-+#include "adb.h"
-+#include "sysdeps.h"
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <unistd.h>
-@@ -23,9 +27,6 @@
- #include <sys/types.h>
- #include <sys/wait.h>
-=20
--#include "fdevent.h"
--#include "adb.h"
--
- #include <linux/fb.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
---- a/adb/sysdeps.h
-+++ b/adb/sysdeps.h
-@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd
- {
-     return close(fd);
- }
--#undef   close
--#define  close   ____xxx_close
-+//#undef   close
-+//#define  close   ____xxx_close
-=20
- static __inline__  int  unix_read(int  fd, void*  buf, size_t  len)
- {
-@@ -369,8 +369,8 @@ static __inline__ int  adb_close(int fd)
- {
-     return close(fd);
- }
--#undef   close
--#define  close   ____xxx_close
-+//#undef   close
-+//#define  close   ____xxx_close
-=20
-=20
- static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
-@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  f
- {
-     return lseek(fd, pos, where);
- }
--#undef   lseek
--#define  lseek   ___xxx_lseek
-+//#undef   lseek
-+//#define  lseek   ___xxx_lseek
-=20
- static __inline__  int    adb_unlink(const char*  path)
- {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007=
-adb-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools=
/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc=
-2.28.patch
deleted file mode 100644
index 64fbce4cbe..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-us=
b_linux.c-fix-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 11 Aug 2018 13:23:37 +0000
-Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
-
-* include sysmacros for major, minor
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
-Upstream-Status: Pending
-
- adb/usb_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/adb/usb_linux.c b/adb/usb_linux.c
-index f16bdd0361..c8a7732441 100644
---- a/adb/usb_linux.c
-+++ b/adb/usb_linux.c
-@@ -22,6 +22,7 @@
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/time.h>
-+#include <sys/sysmacros.h>
- #include <dirent.h>
- #include <fcntl.h>
- #include <errno.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008=
-adb-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/android-=
tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
deleted file mode 100644
index ad21b5aaa6..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Al=
low-adbd-to-be-ran-as-root.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00 2001
-From: Florent Revest <revestflo@gmail.com>
-Date: Mon, 30 Oct 2017 21:05:46 +0100
-Subject: [PATCH] adb: Allow adbd to be ran as root
-
----
-Upstream-Status: Pending
-
- adb/adb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index 027edd9359..e0f7ecde45 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {
-     int secure =3D 0;
-     char value[PROPERTY_VALUE_MAX];
-=20
-+    return 0;
-    /* run adbd in secure mode if ro.secure is set and
-     ** we are not in the emulator
-     */
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009=
-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipes-dev=
tools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-s=
pecify-DT-image.patch
deleted file mode 100644
index a4dc6e1e35..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkboot=
img-Add-dt-parameter-to-specify-DT-image.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00 2001
-From: David Ng <dave@codeaurora.org>
-Date: Fri, 27 Jul 2012 17:15:03 -0700
-Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image
-
-New optional --dt parameter to specify a kernel device
-tree image.
-
-Upstream-Status: Inappropriate
----
- mkbootimg/bootimg.h   |  7 +++++--
- mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++
- 2 files changed, 26 insertions(+), 2 deletions(-)
-
-diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h
-index 9171d85a7b..308c537d6b 100644
---- a/mkbootimg/bootimg.h
-+++ b/mkbootimg/bootimg.h
-@@ -41,8 +41,8 @@ struct boot_img_hdr
-=20
-     unsigned tags_addr;    /* physical addr for kernel tags */
-     unsigned page_size;    /* flash page size we assume */
--    unsigned unused[2];    /* future expansion: should be 0 */
--
-+    unsigned dt_size;      /* device tree in bytes */
-+    unsigned unused;       /* future expansion: should be 0 */
-     unsigned char name[BOOT_NAME_SIZE]; /* asciiz product name */
-=20
-     unsigned char cmdline[BOOT_ARGS_SIZE];
-@@ -64,10 +64,13 @@ struct boot_img_hdr
- ** +-----------------+
- ** | second stage    | o pages
- ** +-----------------+
-+** | device tree     | p pages
-+** +-----------------+
- **
- ** n =3D (kernel_size + page_size - 1) / page_size
- ** m =3D (ramdisk_size + page_size - 1) / page_size
- ** o =3D (second_size + page_size - 1) / page_size
-+** p =3D (dt_size + page_size - 1) / page_size
- **
- ** 0. all entities are page_size aligned in flash
- ** 1. kernel and ramdisk are required (size !=3D 0)
-diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c
-index fc92b4dc30..658052cdf2 100644
---- a/mkbootimg/mkbootimg.c
-+++ b/mkbootimg/mkbootimg.c
-@@ -65,6 +65,7 @@ int usage(void)
-             "       [ --board <boardname> ]\n"
-             "       [ --base <address> ]\n"
-             "       [ --pagesize <pagesize> ]\n"
-+            "       [ --dt <filename> ]\n"
-             "       -o|--output <filename>\n"
-             );
-     return 1;
-@@ -105,6 +106,8 @@ int main(int argc, char **argv)
-     char *cmdline =3D "";
-     char *bootimg =3D 0;
-     char *board =3D "";
-+    char *dt_fn =3D 0;
-+    void *dt_data =3D 0;
-     unsigned pagesize =3D 2048;
-     int fd;
-     SHA_CTX ctx;
-@@ -158,6 +161,8 @@ int main(int argc, char **argv)
-                 fprintf(stderr,"error: unsupported page size %d\n", pages=
ize);
-                 return -1;
-             }
-+        } else if(!strcmp(arg, "--dt")) {
-+            dt_fn =3D val;
-         } else {
-             return usage();
-         }
-@@ -232,6 +237,14 @@ int main(int argc, char **argv)
-         }
-     }
-=20
-+    if(dt_fn) {
-+        dt_data =3D load_file(dt_fn, &hdr.dt_size);
-+        if (dt_data =3D=3D 0) {
-+            fprintf(stderr,"error: could not load device tree image '%s'\=
n", dt_fn);
-+            return 1;
-+        }
-+    }
-+
-     /* put a hash of the contents in the header so boot images can be
-      * differentiated based on their first 2k.
-      */
-@@ -242,6 +255,10 @@ int main(int argc, char **argv)
-     SHA_update(&ctx, &hdr.ramdisk_size, sizeof(hdr.ramdisk_size));
-     SHA_update(&ctx, second_data, hdr.second_size);
-     SHA_update(&ctx, &hdr.second_size, sizeof(hdr.second_size));
-+    if(dt_data) {
-+        SHA_update(&ctx, dt_data, hdr.dt_size);
-+        SHA_update(&ctx, &hdr.dt_size, sizeof(hdr.dt_size));
-+    }
-     sha =3D SHA_final(&ctx);
-     memcpy(hdr.id, sha,
-            SHA_DIGEST_SIZE > sizeof(hdr.id) ? sizeof(hdr.id) : SHA_DIGEST=
_SIZE);
-@@ -266,6 +283,10 @@ int main(int argc, char **argv)
-         if(write_padding(fd, pagesize, hdr.second_size)) goto fail;
-     }
-=20
-+    if(dt_data) {
-+        if(write(fd, dt_data, hdr.dt_size) !=3D (ssize_t) hdr.dt_size) go=
to fail;
-+        if(write_padding(fd, pagesize, hdr.dt_size)) goto fail;
-+    }
-     return 0;
-=20
- fail:
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010=
-Use-linux-capability.h-on-linux-systems-too.patch b/meta-oe/recipes-devtoo=
ls/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-sy=
stems-too.patch
deleted file mode 100644
index 2c607ff67c..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-li=
nux-capability.h-on-linux-systems-too.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@ubuntu.com>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Use linux/capability.h on linux systems too
-
-Upstream-Status: Inappropriate
----
- include/private/android_filesystem_config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/private/android_filesystem_config.h b/include/private=
/android_filesystem_config.h
-index 2f528b95c8..3e0b00928e 100644
---- a/include/private/android_filesystem_config.h
-+++ b/include/private/android_filesystem_config.h
-@@ -27,7 +27,7 @@
- #include <sys/types.h>
- #include <stdint.h>
-=20
--#ifdef HAVE_ANDROID_OS
-+#if defined(HAVE_ANDROID_OS) || defined(__linux__)
- #include <linux/capability.h>
- #else
- #include "android_filesystem_capability.h"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011=
-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/core/0011-Remove-bionic-specific-calls.patch
deleted file mode 100644
index 5b18f461a3..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove=
-bionic-specific-calls.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Remove bionic specific calls
-
-Upstream-Status: Inappropriate
----
- include/cutils/properties.h | 1 -
- libcutils/properties.c      | 2 +-
- liblog/logd_write.c         | 5 +++++
- 3 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/include/cutils/properties.h b/include/cutils/properties.h
-index 798db8b36f..7d01f28d6e 100644
---- a/include/cutils/properties.h
-+++ b/include/cutils/properties.h
-@@ -19,7 +19,6 @@
-=20
- #include <sys/cdefs.h>
- #include <stddef.h>
--#include <sys/system_properties.h>
- #include <stdint.h>
-=20
- #ifdef __cplusplus
-diff --git a/libcutils/properties.c b/libcutils/properties.c
-index b283658aa4..4151e7882c 100644
---- a/libcutils/properties.c
-+++ b/libcutils/properties.c
-@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key, int32_t =
default_value) {
-     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_=
value);
- }
-=20
-+#undef HAVE_LIBC_SYSTEM_PROPERTIES
- #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
-=20
- #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
--#include <sys/_system_properties.h>
-=20
- int property_set(const char *key, const char *value)
- {
-diff --git a/liblog/logd_write.c b/liblog/logd_write.c
-index b2668cedb7..f5a44fe901 100644
---- a/liblog/logd_write.c
-+++ b/liblog/logd_write.c
-@@ -23,6 +23,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/stat.h>
-+#include <sys/syscall.h>
- #include <sys/types.h>
- #if (FAKE_LOG_DEVICE =3D=3D 0)
- #include <sys/socket.h>
-@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t log_id, str=
uct iovec *vec, size_t nr)
-     realtime_ts.tv_nsec =3D ts.tv_nsec;
-=20
-     log_id_buf =3D log_id;
-+#ifdef __BIONIC__
-     tid =3D gettid();
-+#else
-+    tid =3D (pid_t) syscall(__NR_gettid);
-+#endif
-=20
-     newVec[0].iov_base   =3D (unsigned char *) &log_id_buf;
-     newVec[0].iov_len    =3D sizeof_log_id_t;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012=
-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-=
of-stlcat-strlcopy-function.patch
deleted file mode 100644
index b0feb65921..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-im=
plicit-declaration-of-stlcat-strlcopy-function.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy functions
-
-Upstream-Status: Inappropriate
----
- adb/adb.c                | 1 +
- fs_mgr/fs_mgr_fstab.c    | 2 +-
- include/cutils/sockets.h | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index e0f7ecde45..aaefd9b401 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -41,6 +41,7 @@
- #include <sys/prctl.h>
- #include <getopt.h>
- #include <selinux/selinux.h>
-+#include <grp.h>
- #else
- #include "usb_vendors.h"
- #endif
-diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c
-index edd9591164..9ddb4643b5 100644
---- a/fs_mgr/fs_mgr_fstab.c
-+++ b/fs_mgr/fs_mgr_fstab.c
-@@ -17,7 +17,7 @@
- #include <ctype.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <string.h>
-+#include <bsd/string.h>
- #include <sys/mount.h>
-=20
- #include "fs_mgr_priv.h"
-diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h
-index daf43ec944..d3270c69e7 100644
---- a/include/cutils/sockets.h
-+++ b/include/cutils/sockets.h
-@@ -19,7 +19,7 @@
-=20
- #include <errno.h>
- #include <stdlib.h>
--#include <string.h>
-+#include <bsd/string.h>
- #include <stdbool.h>
-=20
- #ifdef HAVE_WINSOCK
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013=
-adb-Support-riscv64.patch b/meta-oe/recipes-devtools/android-tools/android=
-tools/core/0013-adb-Support-riscv64.patch
deleted file mode 100644
index 5138556d63..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Su=
pport-riscv64.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:00:00 2001
-From: Chenxi Mao <maochenxi@eswin.com>
-Date: Mon, 20 Apr 2020 15:27:22 +0800
-Subject: [PATCH 1/1] adb: Support riscv64
-
----
-Upstream-Status: Pending
-
- include/cutils/atomic-inline.h  |   2 +
- include/cutils/atomic-riscv64.h | 156 ++++++++++++++++++++++++++++++++
- 2 files changed, 158 insertions(+)
- create mode 100644 include/cutils/atomic-riscv64.h
-
-diff --git a/include/cutils/atomic-inline.h b/include/cutils/atomic-inline=
.h
-index a31e913579..b5dc38209c 100644
---- a/include/cutils/atomic-inline.h
-+++ b/include/cutils/atomic-inline.h
-@@ -55,6 +55,8 @@ extern "C" {
- #include <cutils/atomic-mips64.h>
- #elif defined(__mips__)
- #include <cutils/atomic-mips.h>
-+#elif defined(__riscv) && __riscv_xlen =3D=3D 64
-+#include <cutils/atomic-riscv64.h>
- #else
- #error atomic operations are unsupported
- #endif
-diff --git a/include/cutils/atomic-riscv64.h b/include/cutils/atomic-riscv=
64.h
-new file mode 100644
-index 0000000000..2664db5a86
---- /dev/null
-+++ b/include/cutils/atomic-riscv64.h
-@@ -0,0 +1,156 @@
-+/*
-+ * Copyright (C) 2014 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H
-+#define ANDROID_CUTILS_ATOMIC_RISCV64_H
-+
-+#include <stdint.h>
-+
-+#ifndef ANDROID_ATOMIC_INLINE
-+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_inline))
-+#endif
-+
-+/*
-+   TODOAArch64: Revisit the below functions and check for potential
-+   optimizations using assembly code or otherwise.
-+*/
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_compiler_barrier(void)
-+{
-+    __asm__ __volatile__ ("" : : : "memory");
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_memory_barrier(void)
-+{
-+    __asm__ __volatile__ ("fence rw,rw" : : : "memory");
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_acquire_load(volatile const int32_t *ptr)
-+{
-+    int32_t value =3D *ptr;
-+    android_memory_barrier();
-+    return value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_release_load(volatile const int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    return *ptr;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_atomic_acquire_store(int32_t value, volatile int32_t *ptr)
-+{
-+    *ptr =3D value;
-+    android_memory_barrier();
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_atomic_release_store(int32_t value, volatile int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    *ptr =3D value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_cas(int32_t old_value, int32_t new_value,
-+                       volatile int32_t *ptr)
-+{
-+    return __sync_val_compare_and_swap(ptr, old_value, new_value) !=3D ol=
d_value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_acquire_cas(int32_t old_value, int32_t new_value,
-+                               volatile int32_t *ptr)
-+{
-+    int status =3D android_atomic_cas(old_value, new_value, ptr);
-+    android_memory_barrier();
-+    return status;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_release_cas(int32_t old_value, int32_t new_value,
-+                               volatile int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    return android_atomic_cas(old_value, new_value, ptr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_add(int32_t increment, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev =3D *ptr;
-+        status =3D android_atomic_cas(prev, prev + increment, ptr);
-+    } while (__builtin_expect(status !=3D 0, 0));
-+    return prev;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_inc(volatile int32_t *addr)
-+{
-+    return android_atomic_add(1, addr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_dec(volatile int32_t *addr)
-+{
-+    return android_atomic_add(-1, addr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_and(int32_t value, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev =3D *ptr;
-+        status =3D android_atomic_cas(prev, prev & value, ptr);
-+    } while (__builtin_expect(status !=3D 0, 0));
-+    return prev;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_or(int32_t value, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev =3D *ptr;
-+        status =3D android_atomic_cas(prev, prev | value, ptr);
-+    } while (__builtin_expect(status !=3D 0, 0));
-+    return prev;
-+}
-+
-+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0014=
-add-u3-ss-descriptor-support-for-adb.patch b/meta-oe/recipes-devtools/andr=
oid-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patc=
h
deleted file mode 100644
index cf23f3c251..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3=
-ss-descriptor-support-for-adb.patch
+++ /dev/null
@@ -1,344 +0,0 @@
-From dae9a11f3a158357966399aef97c48b5f16934d9 Mon Sep 17 00:00:00 2001
-From: Jiacheng Liu <jiacheng.liu@mediatek.com>
-Date: Sat, 24 Jul 2021 11:01:18 +0800
-Subject: [PATCH] android-tools: adb: add u3 ss descriptor support
-
-Porting u3 Superspeed descriptor support to open-embedded android-tools pa=
ckage.
-This patch origins from the the patch in android project [1], but has been
-modified for backporting to android-tools_5.1.1.r37.
-
-[1] https://android.googlesource.com/platform/system/core/+/d6ee9f26a5163a=
f4121f4380264fcbd4e6851a17%5E%21
-
-Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
-Signed-off-by: Jiacheng Liu <jiacheng.liu@mediatek.com>
----
-Upstream-Status: Pending
-
- adb/usb_linux_client.c | 275 +++++++++++++++++++++++++++++++----------
- 1 file changed, 207 insertions(+), 68 deletions(-)
-
-diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
-index 6e8b5bb..884e85e 100644
---- a/adb/usb_linux_client.c
-+++ b/adb/usb_linux_client.c
-@@ -31,8 +31,10 @@
- #define   TRACE_TAG  TRACE_USB
- #include "adb.h"
-=20
-+#define USB_EXT_PROP_UNICODE    1
- #define MAX_PACKET_SIZE_FS	64
- #define MAX_PACKET_SIZE_HS	512
-+#define MAX_PACKET_SIZE_SS	1024
-=20
- #if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
- # define cpu_to_le16(x) (x)
-@@ -62,74 +64,185 @@ struct usb_handle
-     int bulk_in;  /* "in" from the host's perspective =3D> sink for adbd =
*/
- };
-=20
--static const struct {
--    struct usb_functionfs_descs_head header;
--    struct {
--        struct usb_interface_descriptor intf;
--        struct usb_endpoint_descriptor_no_audio source;
--        struct usb_endpoint_descriptor_no_audio sink;
--    } __attribute__((packed)) fs_descs, hs_descs;
--} __attribute__((packed)) descriptors =3D {
--    .header =3D {
--        .magic =3D cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC),
--        .length =3D cpu_to_le32(sizeof(descriptors)),
--        .fs_count =3D 3,
--        .hs_count =3D 3,
-+struct func_desc {
-+    struct usb_interface_descriptor intf;
-+    struct usb_endpoint_descriptor_no_audio source;
-+    struct usb_endpoint_descriptor_no_audio sink;
-+} __attribute__((packed));
-+
-+struct ss_func_desc {
-+    struct usb_interface_descriptor intf;
-+    struct usb_endpoint_descriptor_no_audio source;
-+    struct usb_ss_ep_comp_descriptor source_comp;
-+    struct usb_endpoint_descriptor_no_audio sink;
-+    struct usb_ss_ep_comp_descriptor sink_comp;
-+} __attribute__((packed));
-+
-+struct desc_v1 {
-+    struct usb_functionfs_descs_head_v1 {
-+        __le32 magic;
-+        __le32 length;
-+        __le32 fs_count;
-+        __le32 hs_count;
-+    } __attribute__((packed)) header;
-+    struct func_desc fs_descs, hs_descs;
-+} __attribute__((packed));
-+
-+struct usb_os_desc_ext_prop {
-+    uint32_t dwSize;
-+    uint32_t dwPropertyDataType;
-+
-+    // Property name and value are transmitted as UTF-16, but the kernel =
only
-+    // accepts ASCII values and performs the conversion for us.
-+    uint16_t wPropertyNameLength;
-+    char bPropertyName[20];
-+
-+    uint32_t dwPropertyDataLength;
-+    char bProperty[39];
-+} __attribute__((packed)) os_desc_guid =3D {
-+    .dwSize =3D sizeof(struct usb_os_desc_ext_prop),
-+    .dwPropertyDataType =3D cpu_to_le32(USB_EXT_PROP_UNICODE),
-+    .wPropertyNameLength =3D cpu_to_le16(20),
-+    .bPropertyName =3D "DeviceInterfaceGUID",
-+    .dwPropertyDataLength =3D cpu_to_le32(39),
-+    .bProperty =3D "{F72FE0D4-CBCB-407D-8814-9ED673D0DD6B}",
-+};
-+
-+struct usb_ext_prop_values {
-+    struct usb_os_desc_ext_prop guid;
-+} __attribute__((packed));
-+
-+struct desc_v2 {
-+    struct usb_functionfs_descs_head_v2 header;
-+    // The rest of the structure depends on the flags in the header.
-+    __le32 fs_count;
-+    __le32 hs_count;
-+    __le32 ss_count;
-+    __le32 os_count;
-+    struct func_desc fs_descs, hs_descs;
-+    struct ss_func_desc ss_descs;
-+    struct usb_os_desc_header os_header;
-+    struct usb_ext_compat_desc os_desc;
-+    struct usb_os_desc_header os_prop_header;
-+    struct usb_ext_prop_values os_prop_values;
-+} __attribute__((packed));
-+
-+static struct func_desc fs_descriptors =3D {
-+    .intf =3D {
-+        .bLength =3D sizeof(fs_descriptors.intf),
-+        .bDescriptorType =3D USB_DT_INTERFACE,
-+        .bInterfaceNumber =3D 0,
-+        .bNumEndpoints =3D 2,
-+        .bInterfaceClass =3D ADB_CLASS,
-+        .bInterfaceSubClass =3D ADB_SUBCLASS,
-+        .bInterfaceProtocol =3D ADB_PROTOCOL,
-+        .iInterface =3D 1, /* first string from the provided table */
-+    },
-+    .source =3D {
-+        .bLength =3D sizeof(fs_descriptors.source),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 1 | USB_DIR_OUT,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_FS,
-+    },
-+    .sink =3D {
-+        .bLength =3D sizeof(fs_descriptors.sink),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 2 | USB_DIR_IN,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_FS,
-+    },
-+};
-+
-+static struct func_desc hs_descriptors =3D {
-+    .intf =3D {
-+        .bLength =3D sizeof(hs_descriptors.intf),
-+        .bDescriptorType =3D USB_DT_INTERFACE,
-+        .bInterfaceNumber =3D 0,
-+        .bNumEndpoints =3D 2,
-+        .bInterfaceClass =3D ADB_CLASS,
-+        .bInterfaceSubClass =3D ADB_SUBCLASS,
-+        .bInterfaceProtocol =3D ADB_PROTOCOL,
-+        .iInterface =3D 1, /* first string from the provided table */
-+    },
-+    .source =3D {
-+        .bLength =3D sizeof(hs_descriptors.source),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 1 | USB_DIR_OUT,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_HS,
-+    },
-+    .sink =3D {
-+        .bLength =3D sizeof(hs_descriptors.sink),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 2 | USB_DIR_IN,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_HS,
-+    },
-+};
-+
-+static struct ss_func_desc ss_descriptors =3D {
-+    .intf =3D {
-+        .bLength =3D sizeof(ss_descriptors.intf),
-+        .bDescriptorType =3D USB_DT_INTERFACE,
-+        .bInterfaceNumber =3D 0,
-+        .bNumEndpoints =3D 2,
-+        .bInterfaceClass =3D ADB_CLASS,
-+        .bInterfaceSubClass =3D ADB_SUBCLASS,
-+        .bInterfaceProtocol =3D ADB_PROTOCOL,
-+        .iInterface =3D 1, /* first string from the provided table */
-+    },
-+    .source =3D {
-+        .bLength =3D sizeof(ss_descriptors.source),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 1 | USB_DIR_OUT,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_SS,
-+    },
-+    .source_comp =3D {
-+        .bLength =3D sizeof(ss_descriptors.source_comp),
-+        .bDescriptorType =3D USB_DT_SS_ENDPOINT_COMP,
-+        .bMaxBurst =3D 4,
-     },
--    .fs_descs =3D {
--        .intf =3D {
--            .bLength =3D sizeof(descriptors.fs_descs.intf),
--            .bDescriptorType =3D USB_DT_INTERFACE,
--            .bInterfaceNumber =3D 0,
--            .bNumEndpoints =3D 2,
--            .bInterfaceClass =3D ADB_CLASS,
--            .bInterfaceSubClass =3D ADB_SUBCLASS,
--            .bInterfaceProtocol =3D ADB_PROTOCOL,
--            .iInterface =3D 1, /* first string from the provided table */
--        },
--        .source =3D {
--            .bLength =3D sizeof(descriptors.fs_descs.source),
--            .bDescriptorType =3D USB_DT_ENDPOINT,
--            .bEndpointAddress =3D 1 | USB_DIR_OUT,
--            .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
--            .wMaxPacketSize =3D MAX_PACKET_SIZE_FS,
--        },
--        .sink =3D {
--            .bLength =3D sizeof(descriptors.fs_descs.sink),
--            .bDescriptorType =3D USB_DT_ENDPOINT,
--            .bEndpointAddress =3D 2 | USB_DIR_IN,
--            .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
--            .wMaxPacketSize =3D MAX_PACKET_SIZE_FS,
--        },
-+    .sink =3D {
-+        .bLength =3D sizeof(ss_descriptors.sink),
-+        .bDescriptorType =3D USB_DT_ENDPOINT,
-+        .bEndpointAddress =3D 2 | USB_DIR_IN,
-+        .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
-+        .wMaxPacketSize =3D MAX_PACKET_SIZE_SS,
-     },
--    .hs_descs =3D {
--        .intf =3D {
--            .bLength =3D sizeof(descriptors.hs_descs.intf),
--            .bDescriptorType =3D USB_DT_INTERFACE,
--            .bInterfaceNumber =3D 0,
--            .bNumEndpoints =3D 2,
--            .bInterfaceClass =3D ADB_CLASS,
--            .bInterfaceSubClass =3D ADB_SUBCLASS,
--            .bInterfaceProtocol =3D ADB_PROTOCOL,
--            .iInterface =3D 1, /* first string from the provided table */
--        },
--        .source =3D {
--            .bLength =3D sizeof(descriptors.hs_descs.source),
--            .bDescriptorType =3D USB_DT_ENDPOINT,
--            .bEndpointAddress =3D 1 | USB_DIR_OUT,
--            .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
--            .wMaxPacketSize =3D MAX_PACKET_SIZE_HS,
--        },
--        .sink =3D {
--            .bLength =3D sizeof(descriptors.hs_descs.sink),
--            .bDescriptorType =3D USB_DT_ENDPOINT,
--            .bEndpointAddress =3D 2 | USB_DIR_IN,
--            .bmAttributes =3D USB_ENDPOINT_XFER_BULK,
--            .wMaxPacketSize =3D MAX_PACKET_SIZE_HS,
--        },
-+    .sink_comp =3D {
-+        .bLength =3D sizeof(ss_descriptors.sink_comp),
-+        .bDescriptorType =3D USB_DT_SS_ENDPOINT_COMP,
-+        .bMaxBurst =3D 4,
-     },
- };
-=20
-+struct usb_ext_compat_desc os_desc_compat =3D {
-+    .bFirstInterfaceNumber =3D 0,
-+    .Reserved1 =3D cpu_to_le32(1),
-+    .CompatibleID =3D { 'W', 'I', 'N', 'U', 'S', 'B', '\0', '\0'},
-+    .SubCompatibleID =3D {0},
-+    .Reserved2 =3D {0},
-+};
-+
-+static struct usb_os_desc_header os_desc_header =3D {
-+    .interface =3D cpu_to_le32(0),
-+    .dwLength =3D cpu_to_le32(sizeof(os_desc_header) + sizeof(os_desc_com=
pat)),
-+    .bcdVersion =3D cpu_to_le32(1),
-+    .wIndex =3D cpu_to_le32(4),
-+    .bCount =3D cpu_to_le32(1),
-+    .Reserved =3D cpu_to_le32(0),
-+};
-+
-+static struct usb_os_desc_header os_prop_header =3D {
-+    .interface =3D cpu_to_le32(0),
-+    .dwLength =3D cpu_to_le32(sizeof(os_desc_header) + sizeof(struct usb_=
ext_prop_values)),
-+    .bcdVersion =3D cpu_to_le32(1),
-+    .wIndex =3D cpu_to_le32(5),
-+    .wCount =3D cpu_to_le16(1),
-+};
-+
- #define STR_INTERFACE_ "ADB Interface"
-=20
- static const struct {
-@@ -151,8 +264,6 @@ static const struct {
-     },
- };
-=20
--
--
- static void *usb_adb_open_thread(void *x)
- {
-     struct usb_handle *usb =3D (struct usb_handle *)x;
-@@ -270,6 +381,24 @@ static void usb_adb_init()
- static void init_functionfs(struct usb_handle *h)
- {
-     ssize_t ret;
-+    struct desc_v1 v1_descriptor =3D {};
-+    struct desc_v2 v2_descriptor =3D {};
-+
-+    v2_descriptor.header.magic =3D cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAG=
IC_V2);
-+    v2_descriptor.header.length =3D cpu_to_le32(sizeof(v2_descriptor));
-+    v2_descriptor.header.flags =3D FUNCTIONFS_HAS_FS_DESC | FUNCTIONFS_HA=
S_HS_DESC |
-+                                 FUNCTIONFS_HAS_SS_DESC | FUNCTIONFS_HAS_=
MS_OS_DESC;
-+    v2_descriptor.fs_count =3D 3;
-+    v2_descriptor.hs_count =3D 3;
-+    v2_descriptor.ss_count =3D 5;
-+    v2_descriptor.os_count =3D 2;
-+    v2_descriptor.fs_descs =3D fs_descriptors;
-+    v2_descriptor.hs_descs =3D hs_descriptors;
-+    v2_descriptor.ss_descs =3D ss_descriptors;
-+    v2_descriptor.os_header =3D os_desc_header;
-+    v2_descriptor.os_desc =3D os_desc_compat;
-+    v2_descriptor.os_prop_header =3D os_prop_header;
-+    v2_descriptor.os_prop_values.guid =3D os_desc_guid;
-=20
-     if (h->control < 0) { // might have already done this before
-         D("OPENING %s\n", USB_FFS_ADB_EP0);
-@@ -279,10 +408,20 @@ static void init_functionfs(struct usb_handle *h)
-             goto err;
-         }
-=20
--        ret =3D adb_write(h->control, &descriptors, sizeof(descriptors));
-+        ret =3D adb_write(h->control, &v2_descriptor, sizeof(v2_descripto=
r));
-         if (ret < 0) {
--            D("[ %s: write descriptors failed: errno=3D%d ]\n", USB_FFS_A=
DB_EP0, errno);
--            goto err;
-+            D("[ %s: write v2_descriptor failed: errno=3D%d ]\n", USB_FFS=
_ADB_EP0, errno);
-+            v1_descriptor.header.magic =3D cpu_to_le32(FUNCTIONFS_DESCRIP=
TORS_MAGIC);
-+            v1_descriptor.header.length =3D cpu_to_le32(sizeof(v1_descrip=
tor));
-+            v1_descriptor.header.fs_count =3D 3;
-+            v1_descriptor.header.hs_count =3D 3;
-+            v1_descriptor.fs_descs =3D fs_descriptors;
-+            v1_descriptor.hs_descs =3D hs_descriptors;
-+	    ret =3D adb_write(h->control, &v1_descriptor, sizeof(v1_descriptor))=
;
-+	    if (ret < 0) {
-+		D("[ %s: failed to write USB descriptors]\n", USB_FFS_ADB_EP0);
-+		goto err;
-+	    }
-         }
-=20
-         ret =3D adb_write(h->control, &strings, sizeof(strings));
---=20
-2.18.0
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0015=
-libsparse-Split-off-most-of-sparse_file_read_normal-.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-=
of-sparse_file_read_normal-.patch
deleted file mode 100644
index 5009c73a05..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libspa=
rse-Split-off-most-of-sparse_file_read_normal-.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7b74d23ed955206a789a96bdc3288593e702afac Mon Sep 17 00:00:00 2001
-From: Sean Anderson <sean.anderson@seco.com>
-Date: Thu, 30 Dec 2021 15:16:08 -0500
-Subject: [PATCH] libsparse: Split off most of sparse_file_read_normal into=
 a
- helper function
-
-This carves out the core of sparse_file_read_normal and splits it off so
-it can be reused in the next patch. No functional change intended.
-
-Change-Id: Id00491fd7e5bb6fa28c517a0bb32b8b506539d4d
-Upstream-Status: Backport [95657f3e5976d96073f7bbfe3a49192509999d1d]
-Signed-off-by: Sean Anderson <sean.anderson@seco.com>
----
- libsparse/sparse_read.c | 21 ++++++++++++++++-----
- 1 file changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/libsparse/sparse_read.c b/libsparse/sparse_read.c
-index 8e188e9a4..ee4abd86a 100644
---- a/libsparse/sparse_read.c
-+++ b/libsparse/sparse_read.c
-@@ -353,13 +353,11 @@ static int sparse_file_read_sparse(struct sparse_fil=
e *s, int fd, bool crc)
- 	return 0;
- }
-=20
--static int sparse_file_read_normal(struct sparse_file *s, int fd)
-+static int do_sparse_file_read_normal(struct sparse_file *s, int fd, uint=
32_t* buf, int64_t offset,
-+				      int64_t remain)
- {
- 	int ret;
--	uint32_t *buf =3D malloc(s->block_size);
--	unsigned int block =3D 0;
--	int64_t remain =3D s->len;
--	int64_t offset =3D 0;
-+	unsigned int block =3D offset / s->block_size;
- 	unsigned int to_read;
- 	unsigned int i;
- 	bool sparse_block;
-@@ -403,6 +401,19 @@ static int sparse_file_read_normal(struct sparse_file=
 *s, int fd)
- 	return 0;
- }
-=20
-+static int sparse_file_read_normal(struct sparse_file* s, int fd)
-+{
-+	int ret;
-+	uint32_t* buf =3D (uint32_t*)malloc(s->block_size);
-+
-+	if (!buf)
-+		return -ENOMEM;
-+
-+	ret =3D do_sparse_file_read_normal(s, fd, buf, 0, s->len);
-+	free(buf);
-+	return ret;
-+}
-+
- int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc=
)
- {
- 	if (crc && !sparse) {
---=20
-2.35.1.1320.gc452695387.dirty
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0016=
-libsparse-Add-hole-mode-to-sparse_file_read.patch b/meta-oe/recipes-devtoo=
ls/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_=
file_read.patch
deleted file mode 100644
index e5221d2b4c..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libspa=
rse-Add-hole-mode-to-sparse_file_read.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 41574b628ec4229c24dfe289af7b6978edcca4ed Mon Sep 17 00:00:00 2001
-From: Sean Anderson <sean.anderson@seco.com>
-Date: Thu, 30 Dec 2021 15:19:41 -0500
-Subject: [PATCH] libsparse: Add "hole" mode to sparse_file_read
-
-This adds support for filesystem-level sparse files. These files have
-holes which are not stored in the filesystem and when read are full of
-zeros. While these zeros may be significant in some types of files,
-other types of files may not care about the contents of holes. For
-example, most filesystem creation tools write to all the blocks they
-care about. Those blocks not written to will remain holes, and can be
-safely represented by "don't care" chunks. Using "don't care" chunks
-instead of fill chunks can result in a substantial reduction of the time
-it takes to program a sparse image.
-
-To accomplish this, we extend the existing "sparse" boolean parameter to
-be an enum of mode types. This enum represents the strategy we take when
-reading in a file. For the most part the implementation is
-straightforward. We use lseek to determine where the holes in the file
-are, and then use do_sparse_file_read_normal to create chunks for the
-data section. Note that every file has an implicit hole at its end.
-
-Change-Id: I0cfbf08886fca9a91cb753ec8734c84fcbe52c9f
-Upstream-Status: Backport [f96466b05543b984ef7315d830bab4a409228d35]
-Signed-off-by: Sean Anderson <sean.anderson@seco.com>
----
- libsparse/img2simg.c              |  2 +-
- libsparse/include/sparse/sparse.h | 32 +++++++++++---
- libsparse/sparse_read.c           | 71 +++++++++++++++++++++++++++++--
- 3 files changed, 93 insertions(+), 12 deletions(-)
-
-diff --git a/libsparse/img2simg.c b/libsparse/img2simg.c
-index a0db36f45..2e171b613 100644
---- a/libsparse/img2simg.c
-+++ b/libsparse/img2simg.c
-@@ -96,7 +96,7 @@ int main(int argc, char *argv[])
- 	}
-=20
- 	sparse_file_verbose(s);
--	ret =3D sparse_file_read(s, in, false, false);
-+	ret =3D sparse_file_read(s, in, SPARSE_READ_MODE_NORMAL, false);
- 	if (ret) {
- 		fprintf(stderr, "Failed to read file\n");
- 		exit(-1);
-diff --git a/libsparse/include/sparse/sparse.h b/libsparse/include/sparse/=
sparse.h
-index 8b757d22a..b68aa21a8 100644
---- a/libsparse/include/sparse/sparse.h
-+++ b/libsparse/include/sparse/sparse.h
-@@ -196,23 +196,41 @@ int64_t sparse_file_len(struct sparse_file *s, bool =
sparse, bool crc);
- int sparse_file_callback(struct sparse_file *s, bool sparse, bool crc,
- 		int (*write)(void *priv, const void *data, int len), void *priv);
-=20
-+/**
-+ * enum sparse_read_mode - The method to use when reading in files
-+ * @SPARSE_READ_MODE_NORMAL: The input is a regular file. Constant chunks=
 of
-+ *                           data (including holes) will be be converted =
to
-+ *                           fill chunks.
-+ * @SPARSE_READ_MODE_SPARSE: The input is an Android sparse file.
-+ * @SPARSE_READ_MODE_HOLE: The input is a regular file. Holes will be con=
verted
-+ *                         to "don't care" chunks. Other constant chunks =
will
-+ *                         be converted to fill chunks.
-+ */
-+enum sparse_read_mode {
-+	SPARSE_READ_MODE_NORMAL =3D false,
-+	SPARSE_READ_MODE_SPARSE =3D true,
-+	SPARSE_READ_MODE_HOLE,
-+};
-+
- /**
-  * sparse_file_read - read a file into a sparse file cookie
-  *
-  * @s - sparse file cookie
-  * @fd - file descriptor to read from
-- * @sparse - read a file in the Android sparse file format
-+ * @mode - mode to use when reading the input file
-  * @crc - verify the crc of a file in the Android sparse file format
-  *
-- * Reads a file into a sparse file cookie.  If sparse is true, the file i=
s
-- * assumed to be in the Android sparse file format.  If sparse is false, =
the
-- * file will be sparsed by looking for block aligned chunks of all zeros =
or
-- * another 32 bit value.  If crc is true, the crc of the sparse file will=
 be
-- * verified.
-+ * Reads a file into a sparse file cookie. If @mode is
-+ * %SPARSE_READ_MODE_SPARSE, the file is assumed to be in the Android spa=
rse
-+ * file format. If @mode is %SPARSE_READ_MODE_NORMAL, the file will be sp=
arsed
-+ * by looking for block aligned chunks of all zeros or another 32 bit val=
ue. If
-+ * @mode is %SPARSE_READ_MODE_HOLE, the file will be sparsed like
-+ * %SPARSE_READ_MODE_NORMAL, but holes in the file will be converted to "=
don't
-+ * care" chunks. If crc is true, the crc of the sparse file will be verif=
ied.
-  *
-  * Returns 0 on success, negative errno on error.
-  */
--int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc=
);
-+int sparse_file_read(struct sparse_file *s, int fd, enum sparse_read_mode=
 mode, bool crc);
-=20
- /**
-  * sparse_file_import - import an existing sparse file
-diff --git a/libsparse/sparse_read.c b/libsparse/sparse_read.c
-index ee4abd86a..81f48cc13 100644
---- a/libsparse/sparse_read.c
-+++ b/libsparse/sparse_read.c
-@@ -414,16 +414,79 @@ static int sparse_file_read_normal(struct sparse_fil=
e* s, int fd)
- 	return ret;
- }
-=20
--int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc=
)
-+#ifdef __linux__
-+static int sparse_file_read_hole(struct sparse_file* s, int fd)
- {
--	if (crc && !sparse) {
-+	int ret;
-+	uint32_t* buf =3D (uint32_t*)malloc(s->block_size);
-+	int64_t end =3D 0;
-+	int64_t start =3D 0;
-+
-+	if (!buf) {
-+		return -ENOMEM;
-+	}
-+
-+	do {
-+		start =3D lseek(fd, end, SEEK_DATA);
-+		if (start < 0) {
-+			if (errno =3D=3D ENXIO)
-+				/* The rest of the file is a hole */
-+				break;
-+
-+			error("could not seek to data");
-+			free(buf);
-+			return -errno;
-+		} else if (start > s->len) {
-+			break;
-+		}
-+
-+		end =3D lseek(fd, start, SEEK_HOLE);
-+		if (end < 0) {
-+			error("could not seek to end");
-+			free(buf);
-+			return -errno;
-+		}
-+		end =3D min(end, s->len);
-+
-+		start =3D ALIGN_DOWN(start, s->block_size);
-+		end =3D ALIGN(end, s->block_size);
-+		if (lseek(fd, start, SEEK_SET) < 0) {
-+			free(buf);
-+			return -errno;
-+		}
-+
-+		ret =3D do_sparse_file_read_normal(s, fd, buf, start, end - start);
-+		if (ret) {
-+			free(buf);
-+			return ret;
-+		}
-+	} while (end < s->len);
-+
-+	free(buf);
-+	return 0;
-+}
-+#else
-+static int sparse_file_read_hole(struct sparse_file* s __unused, int fd _=
_unused)
-+{
-+	return -ENOTSUP;
-+}
-+#endif
-+
-+int sparse_file_read(struct sparse_file *s, int fd, enum sparse_read_mode=
 mode, bool crc)
-+{
-+	if (crc && mode !=3D SPARSE_READ_MODE_SPARSE) {
- 		return -EINVAL;
- 	}
-=20
--	if (sparse) {
-+	switch (mode) {
-+	case SPARSE_READ_MODE_SPARSE:
- 		return sparse_file_read_sparse(s, fd, crc);
--	} else {
-+	case SPARSE_READ_MODE_NORMAL:
- 		return sparse_file_read_normal(s, fd);
-+	case SPARSE_READ_MODE_HOLE:
-+		return sparse_file_read_hole(s, fd);
-+	default:
-+		return -EINVAL;
- 	}
- }
-=20
---=20
-2.35.1.1320.gc452695387.dirty
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0017=
-img2simg-Add-support-for-converting-holes-to-don-t-c.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-=
converting-holes-to-don-t-c.patch
deleted file mode 100644
index 9d19f58095..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2si=
mg-Add-support-for-converting-holes-to-don-t-c.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 00cce57eff1a0de3b93efa5da225e9eb33d19659 Mon Sep 17 00:00:00 2001
-From: Sean Anderson <sean.anderson@seco.com>
-Date: Thu, 30 Dec 2021 15:34:28 -0500
-Subject: [PATCH] img2simg: Add support for converting holes to "don't care=
"
- chunks
-
-This adds support for converting files with holes to "don't care"
-chunks. This can result in a substantial reduction in the time it takes
-to program an image if it has many holes.
-
-Generally, constants compared to argc have been reduced by one, since we
-no longer have the program name as the first argument.
-
-Change-Id: I00750edc07d6415dcc07ae0351e9397b0222b7ba
-Upstream-Status: Backport [6150b00b6025918da8c28e5c2f929ecdf480a9d6]
-Signed-off-by: Sean Anderson <sean.anderson@seco.com>
----
- libsparse/img2simg.c | 41 ++++++++++++++++++++++++++++++-----------
- 1 file changed, 30 insertions(+), 11 deletions(-)
-
-diff --git a/libsparse/img2simg.c b/libsparse/img2simg.c
-index 2e171b613..c985d5449 100644
---- a/libsparse/img2simg.c
-+++ b/libsparse/img2simg.c
-@@ -40,25 +40,42 @@
-=20
- void usage()
- {
--    fprintf(stderr, "Usage: img2simg <raw_image_file> <sparse_image_file>=
 [<block_size>]\n");
-+    fprintf(stderr, "Usage: img2simg [-s] <raw_image_file> <sparse_image_=
file> [<block_size>]\n");
- }
-=20
- int main(int argc, char *argv[])
- {
-+	char *arg_in;
-+	char *arg_out;
-+	enum sparse_read_mode mode =3D SPARSE_READ_MODE_NORMAL;
-+	int extra;
- 	int in;
-+	int opt;
- 	int out;
- 	int ret;
- 	struct sparse_file *s;
- 	unsigned int block_size =3D 4096;
- 	off64_t len;
-=20
--	if (argc < 3 || argc > 4) {
-+	while ((opt =3D getopt(argc, argv, "s")) !=3D -1) {
-+		switch (opt) {
-+		case 's':
-+			mode =3D SPARSE_READ_MODE_HOLE;
-+			break;
-+		default:
-+			usage();
-+			exit(-1);
-+		}
-+	}
-+
-+	extra =3D argc - optind;
-+	if (extra < 2 || extra > 3) {
- 		usage();
- 		exit(-1);
- 	}
-=20
--	if (argc =3D=3D 4) {
--		block_size =3D atoi(argv[3]);
-+	if (extra =3D=3D 3) {
-+		block_size =3D atoi(argv[optind + 2]);
- 	}
-=20
- 	if (block_size < 1024 || block_size % 4 !=3D 0) {
-@@ -66,22 +83,24 @@ int main(int argc, char *argv[])
- 		exit(-1);
- 	}
-=20
--	if (strcmp(argv[1], "-") =3D=3D 0) {
-+	arg_in =3D argv[optind];
-+	if (strcmp(arg_in, "-") =3D=3D 0) {
- 		in =3D STDIN_FILENO;
- 	} else {
--		in =3D open(argv[1], O_RDONLY | O_BINARY);
-+		in =3D open(arg_in, O_RDONLY | O_BINARY);
- 		if (in < 0) {
--			fprintf(stderr, "Cannot open input file %s\n", argv[1]);
-+			fprintf(stderr, "Cannot open input file %s\n", arg_in);
- 			exit(-1);
- 		}
- 	}
-=20
--	if (strcmp(argv[2], "-") =3D=3D 0) {
-+	arg_out =3D argv[optind + 1];
-+	if (strcmp(arg_out, "-") =3D=3D 0) {
- 		out =3D STDOUT_FILENO;
- 	} else {
--		out =3D open(argv[2], O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0664);
-+		out =3D open(arg_out, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0664);
- 		if (out < 0) {
--			fprintf(stderr, "Cannot open output file %s\n", argv[2]);
-+			fprintf(stderr, "Cannot open output file %s\n", arg_out);
- 			exit(-1);
- 		}
- 	}
-@@ -96,7 +115,7 @@ int main(int argc, char *argv[])
- 	}
-=20
- 	sparse_file_verbose(s);
--	ret =3D sparse_file_read(s, in, SPARSE_READ_MODE_NORMAL, false);
-+	ret =3D sparse_file_read(s, in, mode, false);
- 	if (ret) {
- 		fprintf(stderr, "Failed to read file\n");
- 		exit(-1);
---=20
-2.35.1.1320.gc452695387.dirty
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_=
libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/=
adb_libssl_11.diff
deleted file mode 100644
index ddb41ea4b0..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_=
11.diff
+++ /dev/null
@@ -1,48 +0,0 @@
-Description: adb: Make compatible with openssl 1.1
- OpenSSL version 1.1 brought some API changes which broke the build here,
- fix that by accessing rsa->n (and e) directly, using RSA_get0_key instead=
.
-Author: Chirayu Desai <chirayudesai1@gmail.com
-Last-Update: 2016-11-10
----
-Upstream-Status: Pending
-
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
----
-Upstream-Status: Pending
-
- system/core/adb/adb_auth_host.c |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
---- a/adb/adb_auth_host.c
-+++ b/adb/adb_auth_host.c
-@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-     BIGNUM* rem =3D BN_new();
--    BIGNUM* n =3D BN_new();
-+    const BIGNUM* n;
-     BIGNUM* n0inv =3D BN_new();
-+    const BIGNUM* e;
-=20
-     if (RSA_size(rsa) !=3D RSANUMBYTES) {
-         ret =3D 0;
-@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-     }
-=20
-     BN_set_bit(r32, 32);
--    BN_copy(n, rsa->n);
-+    RSA_get0_key(rsa, &n, &e, NULL);
-     BN_set_bit(r, RSANUMWORDS * 32);
-     BN_mod_sqr(rr, r, n, ctx);
-     BN_div(NULL, rem, n, r32, ctx);
-@@ -96,11 +97,10 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-         BN_div(n, rem, n, r32, ctx);
-         pkey->n[i] =3D BN_get_word(rem);
-     }
--    pkey->exponent =3D BN_get_word(rsa->e);
-+    pkey->exponent =3D BN_get_word(e);
-=20
- out:
-     BN_free(n0inv);
--    BN_free(n);
-     BN_free(rem);
-     BN_free(r);
-     BN_free(rr);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/b64_=
pton_function_decl.patch b/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/b64_pton_function_decl.patch
deleted file mode 100644
index 80410f1d2b..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_fu=
nction_decl.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Add protoype declaration for  b64_pton
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/adb/adb_auth_client.c
-+++ b/adb/adb_auth_client.c
-@@ -29,6 +29,7 @@
-=20
- #define TRACE_TAG TRACE_AUTH
-=20
-+extern int b64_pton(const char* src, uint8_t* target, size_t targsize);
-=20
- struct adb_public_key {
-     struct listnode node;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_util=
s.mk b/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
deleted file mode 100644
index c18aa9c4d2..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
+++ /dev/null
@@ -1,103 +0,0 @@
-# Makefile for ext4_utils
-
-SRCDIR ?=3D $(S)
-
-VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
-make_ext4fs_SRC_FILES +=3D make_ext4fs_main.c
-make_ext4fs_SRC_FILES +=3D canned_fs_config.c
-make_ext4fs_OBJS :=3D $(make_ext4fs_SRC_FILES:.c=3D.o)
-
-ext2simg_SRC_FILES +=3D ext2simg.c
-ext2simg_OBJS :=3D $(ext2simg_SRC_FILES:.c=3D.o)
-
-ext4fixup_SRC_FILES +=3D ext4fixup_main.c
-ext4fixup_OBJS :=3D $(ext4fixup_SRC_FILES:.c=3D.o)
-
-libext4_utils_SRC_FILES +=3D make_ext4fs.c
-libext4_utils_SRC_FILES +=3D ext4fixup.c
-libext4_utils_SRC_FILES +=3D ext4_utils.c
-libext4_utils_SRC_FILES +=3D allocate.c
-libext4_utils_SRC_FILES +=3D contents.c
-libext4_utils_SRC_FILES +=3D extent.c
-libext4_utils_SRC_FILES +=3D indirect.c
-libext4_utils_SRC_FILES +=3D uuid.c
-libext4_utils_SRC_FILES +=3D sha1.c
-libext4_utils_SRC_FILES +=3D wipe.c
-libext4_utils_SRC_FILES +=3D crc16.c
-libext4_utils_SRC_FILES +=3D ext4_sb.c
-libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libsparse
-simg2img_SRC_FILES +=3D simg2img.c
-simg2img_SRC_FILES +=3D sparse_crc32.c
-simg2img_OBJS :=3D $(simg2img_SRC_FILES:.c=3D.o)
-
-img2simg_SRC_FILES +=3D img2simg.c
-img2simg_OBJS :=3D $(img2simg_SRC_FILES:.c=3D.o)
-
-simg2simg_SRC_FILES +=3D simg2simg.c
-simg2simg_SRC_FILES +=3D sparse_crc32.c
-simg2simg_OBJS :=3D $(simg2simg_SRC_FILES:.c=3D.o)
-
-libsparse_SRC_FILES +=3D backed_block.c
-libsparse_SRC_FILES +=3D output_file.c
-libsparse_SRC_FILES +=3D sparse.c
-libsparse_SRC_FILES +=3D sparse_crc32.c
-libsparse_SRC_FILES +=3D sparse_err.c
-libsparse_SRC_FILES +=3D sparse_read.c
-libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES +=3D callbacks.c
-libselinux_SRC_FILES +=3D check_context.c
-libselinux_SRC_FILES +=3D freecon.c
-libselinux_SRC_FILES +=3D init.c
-libselinux_SRC_FILES +=3D label.c
-libselinux_SRC_FILES +=3D label_file.c
-libselinux_SRC_FILES +=3D label_android_property.c
-libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
-
-CFLAGS +=3D -DANDROID
-CFLAGS +=3D -DHOST
-CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS +=3D -I$(SRCDIR)/system/core/include
-CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
-CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(android_arc=
h)/AndroidConfig.h
-
-all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
-
-make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
-		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
-
-ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
-		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
-
-ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
-
-simg2img: libsparse.a $(simg2img_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
-
-img2simg: libsparse.a $(img2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
-
-simg2simg: libsparse.a $(simg2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-libsparse.a: $(libsparse_OBJS)
-	$(AR) rcs $@ $(libsparse_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-clean:
-	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
-		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
-		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
-		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/00=
01-ext4_utils-remove-selinux-extensions.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.=
patch
deleted file mode 100644
index 4a19a5d65a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4=
_utils-remove-selinux-extensions.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00 2001
-From: Sergio Schvezov <sergio.schvezov@canonical.com>
-Date: Tue, 2 Oct 2018 16:36:54 +0000
-Subject: [PATCH] ext4_utils: remove selinux extensions
-
-* drop useless includes of Android SELINUX extensions
-* avoids having to clone another module
-* this should be sent upstream
-
-Upstream-Status: Inappropriate
----
- ext4_utils/make_ext4fs.c      | 1 -
- ext4_utils/make_ext4fs_main.c | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
-index 2f89ae8a0..732afbed7 100644
---- a/ext4_utils/make_ext4fs.c
-+++ b/ext4_utils/make_ext4fs.c
-@@ -62,7 +62,6 @@
-=20
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
-=20
- #define O_BINARY 0
-=20
-diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
-index a6c5f6160..f8e7b9da9 100644
---- a/ext4_utils/make_ext4fs_main.c
-+++ b/ext4_utils/make_ext4fs_main.c
-@@ -32,7 +32,6 @@
- #ifndef USE_MINGW
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
- #else
- struct selabel_handle;
- #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/00=
02-ext4_utils-add-o-argument-to-preserve-ownership.patch b/meta-oe/recipes-=
devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-=
to-preserve-ownership.patch
deleted file mode 100644
index 3b50ffbf36..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4=
_utils-add-o-argument-to-preserve-ownership.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@mmayer.net>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] ext4_utils: add -o argument to preserve ownership
-
-See also https://android-review.googlesource.com/#/c/100312/
-
-Upstream-Status: Inappropriate
----
- ext4_utils/make_ext4fs.c      |  6 ++++++
- ext4_utils/make_ext4fs_main.c | 10 ++++++++--
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
-index 732afbed7..2cbf04399 100644
---- a/ext4_utils/make_ext4fs.c
-+++ b/ext4_utils/make_ext4fs.c
-@@ -67,6 +67,8 @@
-=20
- #endif
-=20
-+int preserve_owner =3D 0;
-+
- /* TODO: Not implemented:
-    Allocating blocks in the same block group as the file inode
-    Hash or binary tree directories
-@@ -185,6 +187,10 @@ static u32 build_directory_structure(const char *full=
_path, const char *dir_path
- 		} else {
- 			dentries[i].mtime =3D fixed_time;
- 		}
-+		if (preserve_owner) {
-+			dentries[i].uid =3D stat.st_uid;
-+			dentries[i].gid =3D stat.st_gid;
-+		}
- 		uint64_t capabilities;
- 		if (fs_config_func !=3D NULL) {
- #ifdef ANDROID
-diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
-index f8e7b9da9..e82d43277 100644
---- a/ext4_utils/make_ext4fs_main.c
-+++ b/ext4_utils/make_ext4fs_main.c
-@@ -47,13 +47,15 @@ struct selabel_handle;
- extern struct fs_info info;
-=20
-=20
-+extern int preserve_owner;
-+
- static void usage(char *path)
- {
- 	fprintf(stderr, "%s [ -l <len> ] [ -j <journal size> ] [ -b <block_size>=
 ]\n", basename(path));
- 	fprintf(stderr, "    [ -g <blocks per group> ] [ -i <inodes> ] [ -I <ino=
de size> ]\n");
- 	fprintf(stderr, "    [ -L <label> ] [ -f ] [ -a <android mountpoint> ]\n=
");
- 	fprintf(stderr, "    [ -S file_contexts ] [ -C fs_config ] [ -T timestam=
p ]\n");
--	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [ -B <block=
_list_file> ]\n");
-+	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -o ] [ -v ] [ -B=
 <block_list_file> ]\n");
- 	fprintf(stderr, "    <filename> [<directory>]\n");
- }
-=20
-@@ -79,7 +81,7 @@ int main(int argc, char **argv)
- 	struct selinux_opt seopts[] =3D { { SELABEL_OPT_PATH, "" } };
- #endif
-=20
--	while ((opt =3D getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv")) =
!=3D -1) {
-+	while ((opt =3D getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov"))=
 !=3D -1) {
- 		switch (opt) {
- 		case 'l':
- 			info.len =3D parse_num(optarg);
-@@ -142,6 +144,10 @@ int main(int argc, char **argv)
- 			}
- #endif
- 			break;
-+		case 'o':
-+			preserve_owner =3D 1;
-+			printf("Warning: Enabling 'preserve ownership', this is an unofficial =
feature!\n");
-+			break;
- 		case 'v':
- 			verbose =3D 1;
- 			break;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/00=
03-ext4_utils-drop-unused-parameter-from-allocate_inode.patch b/meta-oe/rec=
ipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unuse=
d-parameter-from-allocate_inode.patch
deleted file mode 100644
index b77c0ebc13..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4=
_utils-drop-unused-parameter-from-allocate_inode.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From c9f8cb184a7218c97ff966db44da6dd814c0e273 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 21 Mar 2025 09:49:32 +0000
-Subject: [PATCH] ext4_utils: drop unused parameter from allocate_inode()
-
-* fixes build with gcc-15:
-  http://errors.yoctoproject.org/Errors/Details/848455/
-
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c: In function 'make_directory':
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c:115:29: error: too many arguments to function 'allo=
cate_inode'; expected 0, have 1
-  115 |                 inode_num =3D allocate_inode(info);
-      |                             ^~~~~~~~~~~~~~ ~~~~
-In file included from TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.=
1.r37/git/system/extras/ext4_utils/contents.c:32:
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/allocate.h:61:5: note: declared here
-   61 | u32 allocate_inode();
-      |     ^~~~~~~~~~~~~~
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c: In function 'make_file':
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c:183:21: error: too many arguments to function 'allo=
cate_inode'; expected 0, have 1
-  183 |         inode_num =3D allocate_inode(info);
-      |                     ^~~~~~~~~~~~~~ ~~~~
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/allocate.h:61:5: note: declared here
-   61 | u32 allocate_inode();
-      |     ^~~~~~~~~~~~~~
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c: In function 'make_link':
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/contents.c:218:21: error: too many arguments to function 'allo=
cate_inode'; expected 0, have 1
-  218 |         inode_num =3D allocate_inode(info);
-      |                     ^~~~~~~~~~~~~~ ~~~~
-TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extra=
s/ext4_utils/allocate.h:61:5: note: declared here
-   61 | u32 allocate_inode();
-      |     ^~~~~~~~~~~~~~
-make: *** [<builtin>: contents.o] Error 1
-
-Upstream-Status: Pending [this whole code was removed in newer version and=
roid-9.0.0_r1 https://android.googlesource.com/platform/system/extras/+/7a8=
37fcd6e9c0e0219f743052c78cc1c5988dfaf]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- ext4_utils/contents.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ext4_utils/contents.c b/ext4_utils/contents.c
-index 3144de93f..ac1b71706 100644
---- a/ext4_utils/contents.c
-+++ b/ext4_utils/contents.c
-@@ -112,7 +112,7 @@ u32 make_directory(u32 dir_inode_num, u32 entries, str=
uct dentry *dentries,
- 	len =3D blocks * info.block_size;
-=20
- 	if (dir_inode_num) {
--		inode_num =3D allocate_inode(info);
-+		inode_num =3D allocate_inode();
- 	} else {
- 		dir_inode_num =3D EXT4_ROOT_INO;
- 		inode_num =3D EXT4_ROOT_INO;
-@@ -180,7 +180,7 @@ u32 make_file(const char *filename, u64 len)
- 	struct ext4_inode *inode;
- 	u32 inode_num;
-=20
--	inode_num =3D allocate_inode(info);
-+	inode_num =3D allocate_inode();
- 	if (inode_num =3D=3D EXT4_ALLOCATE_FAILED) {
- 		error("failed to allocate inode\n");
- 		return EXT4_ALLOCATE_FAILED;
-@@ -215,7 +215,7 @@ u32 make_link(const char *link)
- 	u32 inode_num;
- 	u32 len =3D strlen(link);
-=20
--	inode_num =3D allocate_inode(info);
-+	inode_num =3D allocate_inode();
- 	if (inode_num =3D=3D EXT4_ALLOCATE_FAILED) {
- 		error("failed to allocate inode\n");
- 		return EXT4_ALLOCATE_FAILED;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.=
mk b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
deleted file mode 100644
index b9ba95f38a..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
+++ /dev/null
@@ -1,89 +0,0 @@
-# Makefile for fastboot
-
-SRCDIR ?=3D $(S)
-
-VPATH +=3D $(SRCDIR)/system/core/fastboot
-fastboot_SRC_FILES +=3D protocol.c
-fastboot_SRC_FILES +=3D engine.c
-fastboot_SRC_FILES +=3D bootimg.c
-fastboot_SRC_FILES +=3D fastboot.c
-fastboot_SRC_FILES +=3D util.c
-fastboot_SRC_FILES +=3D fs.c
-fastboot_SRC_FILES +=3D usb_linux.c
-fastboot_SRC_FILES +=3D util_linux.c
-fastboot_OBJS :=3D $(fastboot_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libzipfile
-libzipfile_SRC_FILES +=3D centraldir.c
-libzipfile_SRC_FILES +=3D zipfile.c
-libzipfile_OBJS :=3D $(libzipfile_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
-libext4_utils_SRC_FILES +=3D make_ext4fs.c
-libext4_utils_SRC_FILES +=3D ext4fixup.c
-libext4_utils_SRC_FILES +=3D ext4_utils.c
-libext4_utils_SRC_FILES +=3D allocate.c
-libext4_utils_SRC_FILES +=3D contents.c
-libext4_utils_SRC_FILES +=3D extent.c
-libext4_utils_SRC_FILES +=3D indirect.c
-libext4_utils_SRC_FILES +=3D uuid.c
-libext4_utils_SRC_FILES +=3D sha1.c
-libext4_utils_SRC_FILES +=3D wipe.c
-libext4_utils_SRC_FILES +=3D crc16.c
-libext4_utils_SRC_FILES +=3D ext4_sb.c
-libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libsparse
-libsparse_SRC_FILES +=3D backed_block.c
-libsparse_SRC_FILES +=3D output_file.c
-libsparse_SRC_FILES +=3D sparse.c
-libsparse_SRC_FILES +=3D sparse_crc32.c
-libsparse_SRC_FILES +=3D sparse_err.c
-libsparse_SRC_FILES +=3D sparse_read.c
-libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES +=3D callbacks.c
-libselinux_SRC_FILES +=3D check_context.c
-libselinux_SRC_FILES +=3D freecon.c
-libselinux_SRC_FILES +=3D init.c
-libselinux_SRC_FILES +=3D label.c
-libselinux_SRC_FILES +=3D label_file.c
-libselinux_SRC_FILES +=3D label_android_property.c
-libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
-
-CFLAGS +=3D -std=3Dgnu11
-CFLAGS +=3D -DANDROID
-# CFLAGS +=3D -DUSE_F2FS
-CFLAGS +=3D -DHOST
-CFLAGS +=3D -I$(SRCDIR)/system/core/fastboot
-CFLAGS +=3D -I$(SRCDIR)/system/core/include
-CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
-CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS +=3D -I$(SRCDIR)/system/extras/f2fs_utils
-CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
-CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(android_arc=
h)/AndroidConfig.h
-
-LIBS +=3D libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
-
-all: fastboot
-
-fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fastboot=
_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
-
-libzipfile.a: $(libzipfile_OBJS)
-	$(AR) rcs $@ $(libzipfile_OBJS)
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-libsparse.a: $(libsparse_OBJS)
-	$(AR) rcs $@ $(libsparse_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-clean:
-	$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS) \
-		$(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore=
 b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
deleted file mode 100644
index b034c10a1e..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
+++ /dev/null
@@ -1,59 +0,0 @@
-*
-!.gitignore
-!*.indirectionsymlink
-!*.[ch]
-!*.mk
-!*.patch
-!*.service
-!NOTICE
-!MODULE_LICENSE_*
-!/system/
-!/system/core/
-!/system/core/adb/
-!/system/core/fastboot/
-!/system/core/fs_mgr/
-!/system/core/fs_mgr/include/
-!/system/core/include/
-!/system/core/include/android/
-!/system/core/include/cutils/
-!/system/core/include/log/
-!/system/core/include/mincrypt/
-!/system/core/include/private/
-!/system/core/include/utils/
-!/system/core/include/zipfile/
-!/system/core/liblog/
-!/system/core/liblog/tests/
-!/system/core/libcutils/
-!/system/core/libmincrypt/
-!/system/core/libzipfile/
-!/system/core/libsparse/
-!/system/core/libsparse/include/
-!/system/core/libsparse/include/sparse/
-!/system/core/libsparse/simg_dump.py
-!/system/core/mkbootimg/
-!/system/extras/
-!/system/extras/ext4_utils/
-!/system/extras/ext4_utils/mkuserimg.sh
-!/system/extras/ext4_utils/test_ext4fixup
-!/system/extras/f2fs_utils/
-!/hardware/
-!/hardware/libhardware/
-!/hardware/libhardware/include/
-!/hardware/libhardware/include/hardware/
-!/external/
-!/external/libselinux/
-!/external/libselinux/include/
-!/external/libselinux/include/selinux/
-!/external/libselinux/src/
-!/external/f2fs-tools/
-!/external/f2fs-tools/include/
-!/external/f2fs-tools/lib/
-!/external/f2fs-tools/mkfs/
-!/build/
-!/build/core/
-!/build/core/version_defaults.mk
-!/build/core/combo/
-!/build/core/combo/include/
-!/build/core/combo/include/arch/
-!/build/core/combo/include/arch/linux-*/
-!/build/core/combo/include/arch/linux-*/AndroidConfig.h
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinu=
x/0001-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/androi=
d-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
deleted file mode 100644
index 9de2593df8..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-=
Remove-bionic-specific-calls.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Tue, 2 Oct 2018 16:36:54 +0000
-Subject: [PATCH] Remove bionic specific calls
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/procattr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/procattr.c b/src/procattr.c
-index f350808..761cf8e 100644
---- a/src/procattr.c
-+++ b/src/procattr.c
-@@ -8,7 +8,7 @@
- #include "selinux_internal.h"
- #include "policy.h"
-=20
--#ifdef HOST
-+#ifndef __BIONIC__
- static pid_t gettid(void)
- {
- 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinu=
x/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/meta-oe=
/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do=
-not-define-gettid-if-glibc-2.30-is-use.patch
deleted file mode 100644
index 8b5e4cf999..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-=
libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00 2001
-From: Petr Lautrbach <plautrba@redhat.com>
-Date: Sat, 27 Jul 2019 08:20:20 -0700
-Subject: [PATCH] libselinux: Do not define gettid() if glibc >=3D 2.30 is =
used
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Since version 2.30 glibc implements gettid() system call wrapper, see
-https://sourceware.org/bugzilla/show_bug.cgi?id=3D6399
-
-Fixes:
-cc -O2 -g -pipe -Wall -Werror=3Dformat-security -Wp,-D_FORTIFY_SOURCE=3D2 =
-Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gc=
c-switches -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=3D/usr/l=
ib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric -fasynchronous-unwin=
d-tables -fstack-clash-protection -fcf-protection -I../include -D_GNU_SOURC=
E  -DNO_ANDROID_BACKEND   -c -o procattr.o procattr.c
-procattr.c:28:14: error: static declaration of =E2=80=98gettid=E2=80=99 fo=
llows non-static declaration
-   28 | static pid_t gettid(void)
-      |              ^~~~~~
-In file included from /usr/include/unistd.h:1170,
-                 from procattr.c:2:
-/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of =E2=80=
=98gettid=E2=80=99 was here
-   34 | extern __pid_t gettid (void) __THROW;
-      |                ^~~~~~
-
-Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
-Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/procattr.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
---- a/src/procattr.c
-+++ b/src/procattr.c
-@@ -8,12 +8,16 @@
- #include "selinux_internal.h"
- #include "policy.h"
-=20
--#ifndef __BIONIC__
-+/* Bionic and glibc >=3D 2.30 declare gettid() system call wrapper in uni=
std.h and
-+ * has a definition for it */
-+#if defined(__GLIBC_)
-+#if !__GLIBC_PREREQ(2,30)
- static pid_t gettid(void)
- {
- 	return syscall(__NR_gettid);
- }
- #endif
-+#endif
-=20
- static int getprocattrcon(char ** context,
- 			  pid_t pid, const char *attr)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg=
.mk b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
deleted file mode 100644
index 519f609fd2..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-# Makefile for mkbootimg
-
-SRCDIR ?=3D $(S)
-
-VPATH +=3D $(SRCDIR)/system/core/mkbootimg
-mkbootimg_SRC_FILES +=3D mkbootimg.c
-mkbootimg_OBJS :=3D $(mkbootimg_SRC_FILES:.c=3D.o)
-
-VPATH +=3D $(SRCDIR)/system/core/libmincrypt
-libmincrypt_SRC_FILES :=3D dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa.c s=
ha.c sha256.c
-libmincrypt_OBJS :=3D $(libmincrypt_SRC_FILES:.c=3D.o)
-
-CFLAGS +=3D -DANDROID
-CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
-CFLAGS +=3D -I$(SRCDIR)/system/core/include
-CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(android_arc=
h)/AndroidConfig.h
-
-LIBS +=3D libmincrypt.a
-
-all: mkbootimg
-
-mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
-
-libmincrypt.a: $(libmincrypt_OBJS)
-	$(AR) rcs $@ $(libmincrypt_OBJS)
-
-clean:
-	$(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37=
.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
deleted file mode 100644
index c04a1ef8c4..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ /dev/null
@@ -1,189 +0,0 @@
-DESCRIPTION =3D "Different utilities from Android"
-SECTION =3D "console/utils"
-LICENSE =3D "Apache-2.0 & GPL-2.0-only & BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM =3D " \
-    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46=
a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610=
833a22dbe6 \
-    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b=
1bc15da69f \
-    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d691=
9e203a55f9 \
-"
-DEPENDS =3D "libbsd libpcre zlib libcap"
-DEPENDS:append:class-target =3D " openssl"
-
-ANDROID_MIRROR =3D "android.googlesource.com"
-
-# matches with android-5.1.1_r37
-SRCREV_core =3D "2314b110bdebdbfd2d94c502282f9e57c849897e"
-SRCREV_extras =3D "3ecbe8d841df96127d7855661293e5ab6ba6c205"
-SRCREV_libhardware =3D "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
-SRCREV_libselinux =3D "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
-SRCREV_build =3D "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
-
-SRCREV_FORMAT =3D "core_extras_libhardware_libselinux_build"
-SRC_URI =3D " \
-    git://${ANDROID_MIRROR}/platform/system/core;name=3Dcore;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/system/core \
-    git://${ANDROID_MIRROR}/platform/system/extras;name=3Dextras;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/system/extr=
as \
-    git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=3Dlibhardwa=
re;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/=
hardware/libhardware \
-    git://${ANDROID_MIRROR}/platform/external/libselinux;name=3Dlibselinux=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/ex=
ternal/libselinux \
-    git://${ANDROID_MIRROR}/platform/build;name=3Dbuild;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/build \
-    file://core/0001-adb-remove-selinux-extensions.patch;patchdir=3Dsystem=
/core \
-    file://core/0002-adb-Use-local-sockets-where-appropriate.patch;patchdi=
r=3Dsystem/core \
-    file://core/0003-adb-define-shell-command.patch;patchdir=3Dsystem/core=
 \
-    file://core/0004-adb-Fix-build-on-big-endian-systems.patch;patchdir=3D=
system/core \
-    file://core/0005-adb-add-base64-implementation.patch;patchdir=3Dsystem=
/core \
-    file://core/0006-adb-Musl-fixes.patch;patchdir=3Dsystem/core \
-    file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch;patch=
dir=3Dsystem/core \
-    file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch;patchdir=3Dsys=
tem/core \
-    file://core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;=
patchdir=3Dsystem/core \
-    file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;pat=
chdir=3Dsystem/core \
-    file://core/0011-Remove-bionic-specific-calls.patch;patchdir=3Dsystem/=
core \
-    file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.=
patch;patchdir=3Dsystem/core \
-    file://core/adb_libssl_11.diff;patchdir=3Dsystem/core \
-    file://core/b64_pton_function_decl.patch;patchdir=3Dsystem/core \
-    file://core/0013-adb-Support-riscv64.patch;patchdir=3Dsystem/core \
-    file://core/0014-add-u3-ss-descriptor-support-for-adb.patch;patchdir=
=3Dsystem/core \
-    file://core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.=
patch;patchdir=3Dsystem/core \
-    file://core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch;pat=
chdir=3Dsystem/core \
-    file://core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.=
patch;patchdir=3Dsystem/core \
-    file://core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.=
patch;patchdir=3Dsystem/core \
-    file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=
=3Dsystem/extras \
-    file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.pat=
ch;patchdir=3Dsystem/extras \
-    file://extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inod=
e.patch;patchdir=3Dsystem/extras \
-    file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=3De=
xternal/libselinux \
-    file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-i=
s-use.patch;patchdir=3Dexternal/libselinux \
-    file://android-tools-adbd.service \
-    file://build/0001-Riscv-Add-risc-v-Android-config-header.patch;patchdi=
r=3Dbuild \
-    file://gitignore \
-    file://adb.mk;subdir=3D${BPN} \
-    file://adbd.mk;subdir=3D${BPN} \
-    file://ext4_utils.mk;subdir=3D${BPN} \
-    file://fastboot.mk;subdir=3D${BPN} \
-    file://mkbootimg.mk;subdir=3D${BPN} \
-"
-
-
-B =3D "${WORKDIR}/${BPN}"
-
-# http://errors.yoctoproject.org/Errors/Details/133881/
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-
-COMPATIBLE_HOST:powerpc =3D "(null)"
-COMPATIBLE_HOST:powerpc64 =3D "(null)"
-COMPATIBLE_HOST:powerpc64le =3D "(null)"
-
-inherit systemd
-
-SYSTEMD_PACKAGES =3D "${PN}-adbd"
-SYSTEMD_SERVICE:${PN}-adbd =3D "android-tools-adbd.service"
-
-# Find libbsd headers during native builds
-CC:append:class-native =3D " -I${STAGING_INCDIR}"
-CC:append:class-nativesdk =3D " -I${STAGING_INCDIR}"
-
-TOOLS =3D "adb fastboot ext4_utils mkbootimg adbd"
-
-# Adb needs sys/capability.h, which is not available for native*
-TOOLS:class-native =3D "fastboot ext4_utils mkbootimg"
-TOOLS:class-nativesdk =3D "fastboot ext4_utils mkbootimg"
-
-do_compile() {
-    cp ${UNPACKDIR}/gitignore ${S}/.gitignore
-
-    # Setting both variables below causing our makefiles to not work with
-    # implicit make rules
-    CFLAGS=3D"-ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR}"
-    unset CPPFLAGS
-
-    export SRCDIR=3D${S}
-
-    case "${HOST_ARCH}" in
-      arm)
-        export android_arch=3Dlinux-arm
-      ;;
-      aarch64)
-        export android_arch=3Dlinux-arm64
-      ;;
-      riscv64)
-        export android_arch=3Dlinux-riscv64
-      ;;
-      mips|mipsel)
-        export android_arch=3Dlinux-mips
-      ;;
-      mips64|mips64el)
-        export android_arch=3Dlinux-mips64
-      ;;
-      powerpc|powerpc64)
-        export android_arch=3Dlinux-ppc
-      ;;
-      i586|i686|x86_64)
-        export android_arch=3Dlinux-x86
-      ;;
-    esac
-
-    for tool in ${TOOLS}; do
-      mkdir -p ${B}/${tool}
-      oe_runmake -f ${UNPACKDIR}/${BPN}/${tool}.mk -C ${B}/${tool}
-    done
-}
-
-do_install() {
-    if echo ${TOOLS} | grep -q "ext4_utils" ; then
-        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}$=
{bindir}/simg_dump
-        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${=
D}${bindir}/mkuserimg
-
-        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "adb\>" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/adb/adb ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "adbd" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/adbd/adbd ${D}${bindir}
-    fi
-
-    # Outside the if statement to avoid errors during do_package
-    install -D -p -m0644 ${UNPACKDIR}/android-tools-adbd.service \
-      ${D}${systemd_unitdir}/system/android-tools-adbd.service
-
-    if echo ${TOOLS} | grep -q "fastboot" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "mkbootimg" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
-    fi
-}
-
-PACKAGES =3D+ "${PN}-fstools ${PN}-adbd"
-
-RDEPENDS:${PN}-adbd =3D "${PN}-conf"
-RDEPENDS:${PN}-fstools =3D "bash"
-
-FILES:${PN}-adbd =3D "\
-    ${bindir}/adbd \
-    ${systemd_unitdir}/system/android-tools-adbd.service \
-"
-
-FILES:${PN}-fstools =3D "\
-    ${bindir}/ext2simg \
-    ${bindir}/ext4fixup \
-    ${bindir}/img2simg \
-    ${bindir}/make_ext4fs \
-    ${bindir}/simg2img \
-    ${bindir}/simg2simg \
-    ${bindir}/simg_dump \
-    ${bindir}/mkuserimg \
-"
-
-BBCLASSEXTEND =3D "native"
--=20
2.34.1


