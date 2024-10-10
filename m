Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289DACF07C3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:27:38 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.114])
 by mx.groups.io with SMTP id smtpd.web10.38570.1728548852830574849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=xaVil8J2;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.114, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXCiyMSYEx4fXT6qxMEgr4szKrIoKBxpNY3GeEntnYihlcTS/tKUwVDwrwAcj2VHwGgelWxikGLcXmVTYirjqYn4HkQCcGJrYIKwG3yDvVBtpwh2b5eATtn7UW88QcHt5YK3gk7m5ntQbYqr2S3aQsv0SNAtYb+dXwTFD3Ts8XVRijxxzGUHQz1Gptn/Hd6PUuX+vQZusss7Zk0rS+FIYUWr+9urFwlBzvuCkl67XPfPtIclii7W3NsOf8vZdnsFJ4xzMDoZdmbC9i2CVo6n8x3m3y69oA26odIZ0J2mhJe8mKaXawOp+MEvbuX5r0W/I8IbJ+9Z4qucnATCAFWZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJaNTemBZGrn3jkjeeG11BAflV2CoNWz2Ds9kvi6A5Q=;
 b=MYyff/I2aTJ3lGudQvNfLbyki+RF+Pls5hS70mWRwZpvzZqKKFacLcmiTQ6pT57Dkkui/hHIqehWcUkPH7hhnf7yVdxCOEBXozKyxT9zu02WUo19nfaUAQlhUUccqkD1CvCZlTWjnev4BdOIe0q4m0oxX2I503ZFQH5xkkXuqmWJkzPJJyNF75FdEiagqGt9zvPFT5T8gvnn5aEUaedHeK0QFV0dENcBvUt9MFrxFYjOOD9fZ2Kq8DlcbIeGcP9d+Ywzyd3pcHW2UZYT9za/OvszT+exZnlbvgAwEKit+BHRE3TVWwNVMwq41wEI4skbzUBGjPp0FymGIHSDRUsdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJaNTemBZGrn3jkjeeG11BAflV2CoNWz2Ds9kvi6A5Q=;
 b=xaVil8J2f4R65ZVNuiFU2fLDvYoU9CaYNEGpECrQ+653v2jNNNrYmJ2dKKt0ZLdq+mYqNtNPgQjQGoSg/rC7B75GX4ar8p1LCShVxZ0wx2e39DpNS3uXDg/VAgJ2FF7M3PvYsNXoaQjNMv8Vnp3CmmLKPJoqvYX74F/YbLrNg2usF5zrFkygGNVGqWw3IQTIr9MgOCjSubacs1zYM4i0aV3WtrcQmS3UCRjCpdvZKY9wuPP1Ytrf5paoXlxyh+pf+VcTpOf8wjl8+dHyeIfzBwtW1CkkN7MgT/2p8RWo/QSM5BI6rfY/ozVdfwWRTTIYbznuBznKJjOiLtJZMCa+Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6732.eurprd06.prod.outlook.com (2603:10a6:102:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:27:28 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 08:27:28 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3] fluentbit: Upgrade recipe to 3.1.9
Date: Thu, 10 Oct 2024 08:27:02 +0000
Message-ID: <20241010082702.775348-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000453A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::34c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: cb47663c-724f-4a44-0487-08dce9056084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x0Ms/RVYPNKBiWNKuWqxRAO21057ORvwlpL5PWDe98o1/1fBnFGytkk/jMKB?=
 =?us-ascii?Q?4bqXubbkT48jjj+K7/XBx8klT3AbBQ/67LesuCQ2x+8trqaB7G/AZ6ZGIQwL?=
 =?us-ascii?Q?+GkH9wNKhFxbI2mjzej41hZ05ZGg4xksbONdKih7kHLT7VDZZYBoKsE0ZO5z?=
 =?us-ascii?Q?FNihLI02P53BFZ9XuCIdC7vfjQIG4oyZk68RPXK/tiN5x7GYlzr6NEtAq5Jz?=
 =?us-ascii?Q?L6waJdBXyh4uE3Fdn5WUxdHU+NNpJI/v45HhAe9fMTfU6PFxvy9exVJSOT5b?=
 =?us-ascii?Q?d1rgj9kgJHsb2ISWVh/+DwEzfFGYn0v+bPm4osPNoJgZafdJGG9j7Rb+caL6?=
 =?us-ascii?Q?PvK5ICn3GB0BB79HwDjfwhdj3qnLGkOybzeeAAbHHVr1onJQ5+S+rxSE58fb?=
 =?us-ascii?Q?qZKWrLBCmmW0z70O4geBFTxUw9TYidJEkePWgqeMK+4h83Bawqjh388qLWPI?=
 =?us-ascii?Q?k0MBjXUfohmPgythsfdE3disIWqPfsRJqo6QyBa0Pvl4Yeb05MJbypek74JL?=
 =?us-ascii?Q?HRUkfpwv7WR7utJJhh9npoKk+EXoSiRoQkGjd6tXBzr2OZj3hk8msP6/iqv5?=
 =?us-ascii?Q?yOMQsWuVjFpTLUYL/ZU9aUpwDORRSeN8ZUjcGnV90Q6Zx71QXrC6R7SRsmSg?=
 =?us-ascii?Q?hOzy8WGwCmEkiemDTj/M0bdE2w9QFOB9duvjfmyrUsqbcpzYZeyeNuCqz2X2?=
 =?us-ascii?Q?yUjF4QoROU8Wai53U2IVY7X83nGjYC/1a9kx3oera/xVT5AyTv4EsoglKRPC?=
 =?us-ascii?Q?ySlJS4ijWRP3b7efMLiLpPysPHWCh9P1GEq9RhWXqTW6VU+91kIHjr21IOQ2?=
 =?us-ascii?Q?OsAAXCTNLz0KScERdDR513vBqCHIIiG+qCW6gp0gMZJ0clBCZryrJoau90ln?=
 =?us-ascii?Q?/zmm+UTRGXerUyajnH/w2pAyAwC98Saoj9RyDXe5yxkSfYLPFkx0acjuZAyQ?=
 =?us-ascii?Q?/LY0g6DFPTRboorNbm4tc+4bzvQuA+CN4+ZY3vzkR+leWBI1UlyblGnzXj71?=
 =?us-ascii?Q?glS4QEjINrZbnXOLJf5e69KiCaGobn6mA2Y56AmyrW+Sbsk7Mxp95ePvQcvw?=
 =?us-ascii?Q?1EKM5UC4YTnQ5Q9QZ591GJplfvG6zGlzlgit3IjGIqrNRHaJv6jlIEY3ZE8N?=
 =?us-ascii?Q?roKAVZRscREJN0G+/KJz3QG5l9FKP9OTyUoxLDUb11e8XVnSxJlcz5BjvMqg?=
 =?us-ascii?Q?5MZHL7RzcLJmrOP2O1EsJUrhxrLn5yc6yVho9ROdQELtLoUsOQqSrkFKmg6u?=
 =?us-ascii?Q?qmBHUf40jd3clc8SLfSqi8ujkBryRjEuKldEyRcX8g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pok4IUbWR/oSIO4SntzqWYWWDIcoaHbQTZv2JeKq/0qW35vFSMDkJvQ4ugPK?=
 =?us-ascii?Q?H+ksMOIaGztvPiNdRI1spdKRcsGmXxv3HlC8Q350Wf3WSv5FIpzitq2I8jdB?=
 =?us-ascii?Q?egeP30lJe3FKSAyQiFUkQp25juAN6XqtqqkrwCDFXQ7Tzl4PADvkAicmeYtX?=
 =?us-ascii?Q?1+SWdPrlbGD150P+BJbwdhiKgiA8sOqlm7sPdzzfmRr242nKMKCN1Pd/Q6yL?=
 =?us-ascii?Q?ZIelFsoPTK1p7VU1swWmS+fis4LAMzIx/zMzecv7QEN1YcfDiSppT2E6ozlF?=
 =?us-ascii?Q?Z2XcRkzSfwryaBKh17kkFTiEv84XVc9aE41PdM9xB5fz6mEv2AFV25knu4ax?=
 =?us-ascii?Q?oDFvop3pzj33Jsasq49tgGAKCgf9RS8LDViUdbaF2Mk1PfMZtfw0R7RX3oOe?=
 =?us-ascii?Q?+Y69rS3CMZbgSBXH40Npo1YehNODN399PxniN3TFruLqH7dr/oh43a/oVQYL?=
 =?us-ascii?Q?4fV4RMQ9j2lXEF9ZNQC+zcftHqkOHv0ypdvblsCa2fLllaZiSTfCEs/ysO86?=
 =?us-ascii?Q?kZSJZdbKSrHKqisbvORlFHJ5pN1/aehiglFlwQeptiEDmxoDWvDBI7sDCWDS?=
 =?us-ascii?Q?vdE5+Z66D2xbG/OHtdOybViIfNOrAOdAjS0irvNbPZkpcETJFVjSAlQ47/d0?=
 =?us-ascii?Q?Fcxe9i1ZgfX6t5oyfTMMvnZc0kDAC69YnMUQ1/WU/lFIIlSZWCCp/Jm87cwt?=
 =?us-ascii?Q?CNL+Yjf/3shmBeAn6lXWUAMfsLEhGveCN/rl1IyCaZoNj+nNqbfCZjjpHSbh?=
 =?us-ascii?Q?Iz6S19FVFenlJKFPqEAWrushQMR17wbIEIYY22EULnqJ0f6v5xAInDhp3sOQ?=
 =?us-ascii?Q?blF/7Um80aMtHc4pE4KN9D475DKbrVLuNkCwGn69KPQ4dH8BXS31j4/us3XC?=
 =?us-ascii?Q?GUMDgJBT7gdZ9QYRUmTFQAzm7YhJQrlkg7HMuAS7UpaPfDtaNTe11hYuQQiP?=
 =?us-ascii?Q?5EtUCvIm+5IRvkp6PPfBG2ubuEruKao+ruaiizC/YDQiGsr+6s6XSXLRBrNq?=
 =?us-ascii?Q?kxEEsQk9UzjwNV91mK4DS4PgaRHGoPWcXNCxH5X0TZ3LFCbTvqDs6l1rxZQT?=
 =?us-ascii?Q?6er+Yc9AhQnIz5KM0H+iIfwzkmN3nrD5FoWpN1jVOyP3lKWWbj3/2l7ctBoK?=
 =?us-ascii?Q?qf/6Em32MAlFjW1IzsHj3FkvPX3U1TGf3LLDqBHtPS1FsSiyWt6wHIfaEoWU?=
 =?us-ascii?Q?vYudtkJuTzfaBpMIbUW2JanztyzX3FS9yPOsPyA2GF2u3GN7qZwZCQ1CSeCL?=
 =?us-ascii?Q?DxOJxmsU/Rf4m3qCu4m2KK04xAfDW90Fz0mjehmgVEc8P+muG3rxpusdfWi2?=
 =?us-ascii?Q?mbAg1b0+3fnmWMuymZluDu6BUOBoP4eDo+QyFqWv5z1sH++4jJsUymAvC6Wd?=
 =?us-ascii?Q?adyJbRC/HvEmSO+RQDq1pRrXY+FPTEEpxG4kbxw9QzbNK/rWkZfOhAg1lnrk?=
 =?us-ascii?Q?LyZQ4p65B6GkxIKNjDjHPLAQf9qhwJMWDSK/fBkiWlvtpdwR8RdDKPSAMlgS?=
 =?us-ascii?Q?MnhCor8oMm2/w/Bc1Lbyxzh4ogw+LyC2ctvDtXpV5n+4+GunOe8Tc7m92HJZ?=
 =?us-ascii?Q?42Dlv/yGjEdrHiSkUcyqvxEvv5aXPDRf7JbyAngk5Yxc7Zl5LKk6fJgmX2Lb?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb47663c-724f-4a44-0487-08dce9056084
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:27:28.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZ9pSUyo25hDtzduQwEy8budcA133/XwHMzDonxBlM5Zjngo5yOaw6A7F3WrWD+bnsB1QOluZNWP67CfKvbBQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6732
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112761

According to https://fluentbit.io/announcements/older-versions/

  Security Policy: support for current series ends three months after a new=
 series is released.

Fluent Bit v1.9 Series has beel EOL since Dec 5, 2022, so upgrade the
recipe to currently supported / newest available version.

Relevant changelogs since previous 1.9.9 version of the component
 - https://fluentbit.io/announcements/v2.0.0/
 - https://fluentbit.io/announcements/v2.1.0/
 - https://fluentbit.io/announcements/v2.2.0/
 - https://fluentbit.io/announcements/v3.0.0/
 - https://fluentbit.io/announcements/v3.1.0/
 - https://fluentbit.io/announcements/v3.1.1/
 - https://fluentbit.io/announcements/v3.1.2/
 - https://fluentbit.io/announcements/v3.1.3/
 - https://fluentbit.io/announcements/v3.1.4/
 - https://fluentbit.io/announcements/v3.1.5/
 - https://fluentbit.io/announcements/v3.1.6/
 - https://fluentbit.io/announcements/v3.1.7/
 - https://fluentbit.io/announcements/v3.1.8/
 - https://fluentbit.io/announcements/v3.1.9/

Associated added PACKAGECONFIG knobs are described for the most part in
https://github.com/fluent/fluent-bit/blob/v3.1.9/CMakeLists.txt#L107-L167

The PACKAGECONFIG knobs are named according to the constant names used
in upstream source code. Please note that here the 'yaml' PACKAGECONFIG
option has changed to 'config-yaml', and instead of 'kafka' there is
now 'out-kafka'.

As a related side note, the plugin options are now defined in
https://github.com/fluent/fluent-bit/blob/v3.1.9/cmake/plugins_options.cmak=
e

I have tested this change briefly against "qemuarm64" and "qemuppc"
machines that the fluent-bit systemd service starts successfully in
current master based core-image-minimal, and against "qemuarm" machine
using yoe/meta-clang based core-image-minimal. Also tested using an
i.MX6 board that the new Fluent Bit version seems to work as well as
it did with the old 1.9.9 version with respect to logging in a Yocto
Scarthgap based image.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 +
 ...t-Do-not-use-private-makefile-target.patch |  64 ---------
 .../0001-Use-posix-strerror_r-with-musl.patch |  34 -----
 ...rivate-makefile-targets-in-CMakelist.patch | 106 +++++++++++++++
 ...ine-_GNU_SOURCE-for-memmem-API-check.patch |  28 ----
 .../0002-mbedtls-Remove-unused-variable.patch |  40 ------
 ...able-installing-systemd-service-file.patch |  38 ++++++
 ...documentation-warning-as-error-with-.patch |  32 -----
 ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch |  34 -----
 ...-to-store-return-from-flb_kv_item_cr.patch |  45 -------
 ...md-init-systemd-detection-contingent.patch |  63 ---------
 ...kio-Link-with-fts-library-with-musl.patch} |   3 +-
 .../0005-Use-posix-strerror_r-with-musl.patch |  28 ++++
 ...stackdriver-Fix-return-type-mismatch.patch |  33 -----
 ...06-monkey-Fix-TLS-detection-testcase.patch |  36 ------
 ...-not-check-for-upstart-on-build-host.patch |  46 -------
 .../fluentbit/fluentbit_1.9.9.bb              |  97 --------------
 .../fluentbit/fluentbit_3.1.9.bb              | 122 ++++++++++++++++++
 18 files changed, 296 insertions(+), 554 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMake=
Lists.txt-Do-not-use-private-makefile-target.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-p=
osix-strerror_r-with-musl.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-D=
o-not-use-private-makefile-targets-in-CMakelist.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-monke=
y-Define-_GNU_SOURCE-for-memmem-API-check.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedt=
ls-Remove-unused-variable.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disab=
le-installing-systemd-service-file.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedt=
ls-Disable-documentation-warning-as-error-with-.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedt=
ls-Do-not-overwrite-CFLAGS.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-c=
orrect-type-to-store-return-from-flb_kv_item_cr.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-build=
-Make-systemd-init-systemd-detection-contingent.patch
 rename meta-oe/recipes-extended/fluentbit/fluentbit/{0002-chunkio-Link-wit=
h-fts-library-with-musl.patch =3D> 0004-chunkio-Link-with-fts-library-with-=
musl.patch} (91%)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-p=
osix-strerror_r-with-musl.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-stack=
driver-Fix-return-type-mismatch.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-monke=
y-Fix-TLS-detection-testcase.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake=
-Do-not-check-for-upstart-on-build-host.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6dbe194cd..78239b1ea 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -333,6 +333,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
     dumb-init \
     enscript \
     figlet \
+    fluentbit \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
     haveged \
     hexedit \
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.t=
xt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/flue=
ntbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patc=
h
deleted file mode 100644
index 0cabed963..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-n=
ot-use-private-makefile-target.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 6a704ab7bf69cd5d6970b3a7d3ae7798b26027c1 Mon Sep 17 00:00:00 2001
-From: Paulo Neves <ptsneves@gmail.com>
-Date: Thu, 28 Jul 2022 11:28:41 +0200
-Subject: [PATCH] CMakeLists.txt Do not use private makefile $< target
-
-$< is a private detail from the Makefile generated by CMakefile and
-are not under control or to be used at the CMakeLists level. In 3.20
-that private generation changed pre-requisite targets[1] and now logs
-contain the path compiler_depend.ts instead of the actual file.
-
-Upstream-Status: Pending [https://github.com/fluent/fluent-bit/issues/5492=
]
----
- CMakeLists.txt              | 6 +-----
- lib/chunkio/CMakeLists.txt  | 7 +------
- lib/cmetrics/CMakeLists.txt | 7 +------
- 3 files changed, 3 insertions(+), 17 deletions(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -46,11 +46,7 @@ else()
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
- endif()
-=20
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subst ${CMAKE=
_SOURCE_DIR}/,,$(abspath $<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
--endif()
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
-=20
- if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
-   set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
---- a/lib/chunkio/CMakeLists.txt
-+++ b/lib/chunkio/CMakeLists.txt
-@@ -14,12 +14,7 @@ else()
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
- endif()
-=20
--# Set __FILENAME__
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subst ${CMAKE=
_SOURCE_DIR}/,,$(abspath $<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
--endif()
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
-=20
- include(cmake/macros.cmake)
-=20
---- a/lib/cmetrics/CMakeLists.txt
-+++ b/lib/cmetrics/CMakeLists.txt
-@@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR  3)
- set(CMT_VERSION_PATCH  7)
- set(CMT_VERSION_STR "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VERS=
ION_PATCH}")
-=20
--# Define __CMT_FILENAME__ consistently across Operating Systems
--if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D'\"$(subst ${C=
MAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
--else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
--endif()
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
-=20
- # Configuration options
- option(CMT_DEV                       "Enable development mode"           =
        No)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-st=
rerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/000=
1-Use-posix-strerror_r-with-musl.patch
deleted file mode 100644
index 8d89e4df3..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_=
r-with-musl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 01:23:48 -0700
-Subject: [PATCH 1/2] Use posix strerror_r with musl
-
-Default with glibc is GNU extention of strerror_r
-where as musl uses posix variant, call that out
-
-Upstream-Status: Inappropriate [Need wider porting beyond linux/musl/glibc=
]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/flb_network.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/flb_network.c b/src/flb_network.c
-index 992eb1d..5d7a337 100644
---- a/src/flb_network.c
-+++ b/src/flb_network.c
-@@ -506,7 +506,12 @@ static int net_connect_async(int fd,
-             }
-=20
-             /* Connection is broken, not much to do here */
-+#ifdef __GLIBC__
-             str =3D strerror_r(error, so_error_buf, sizeof(so_error_buf))=
;
-+#else
-+            strerror_r(error, so_error_buf, sizeof(so_error_buf));
-+	    str =3D so_error_buf;
-+#endif
-             flb_error("[net] TCP connection failed: %s:%i (%s)",
-                       u->tcp_host, u->tcp_port, str);
-             return -1;
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-u=
se-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelis=
t.patch
new file mode 100644
index 000000000..233e8c4e3
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-priv=
ate-makefile-targets-in-CMakelist.patch
@@ -0,0 +1,106 @@
+From 940a4e270bb8879a78c0eac4daf997cb77e25b4b Mon Sep 17 00:00:00 2001
+From: Niko Mauno <niko.mauno@vaisala.com>
+Date: Sun, 29 Sep 2024 12:00:00 +0000
+Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.tx=
t
+
+By extending the scope of changes introduced in commit
+fc325524d50fe179b76f127243ab9e03ddbdaaa4
+("build: CMakeLists.txt Do not use private makefile targets (#5819)")
+we mitigate the following error produced by BitBake in Yocto
+
+  ERROR: fluentbit-3.1.9-r0 do_package_qa: QA Issue: File /usr/bin/fluent-=
bit in package fluentbit contains reference to TMPDIR [buildpaths]
+  ERROR: fluentbit-3.1.9-r0 do_package_qa: Fatal QA errors were found, fai=
ling task.
+
+stemming from
+
+  $ strings packages-split/fluentbit/usr/bin/fluent-bit
+  ...
+  $(subst /yocto/upstream/build/tmp/work/cortexa57-poky-linux/fluentbit/3.=
1.9/git/,,$(abspath $<))
+  ...
+
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+
+Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/9450=
]
+---
+ lib/cfl/CMakeLists.txt      | 8 ++------
+ lib/cmetrics/CMakeLists.txt | 8 ++------
+ lib/ctraces/CMakeLists.txt  | 8 ++------
+ lib/monkey/CMakeLists.txt   | 4 ----
+ 4 files changed, 6 insertions(+), 22 deletions(-)
+
+diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
+index 2193cb29c..e2a5cba37 100644
+--- a/lib/cfl/CMakeLists.txt
++++ b/lib/cfl/CMakeLists.txt
+@@ -40,12 +40,8 @@ if(NOT MSVC)
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
+ endif()
+=20
+-# Define __FILENAME__ consistently across Operating Systems
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CMAK=
E_SOURCE_DIR}/,,$$(abspath $$<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+-endif()
++# Define __FILENAME__
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+=20
+=20
+=20
+diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
+index 4f2989106..9c40dadf4 100644
+--- a/lib/cmetrics/CMakeLists.txt
++++ b/lib/cmetrics/CMakeLists.txt
+@@ -60,12 +60,8 @@ if(NOT MSVC)
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
+ endif()
+=20
+-# Define __CMT_FILENAME__ consistently across Operating Systems
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D'\"$$(subst ${=
CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
+-endif()
++# Define __CMT_FILENAME__
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
+=20
+ # Configuration options
+ option(CMT_DEV                       "Enable development mode"           =
        No)
+diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
+index e92834e06..5cebb3b73 100644
+--- a/lib/ctraces/CMakeLists.txt
++++ b/lib/ctraces/CMakeLists.txt
+@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  5)
+ set(CTR_VERSION_PATCH  6)
+ set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERS=
ION_PATCH}")
+=20
+-# Define __FILENAME__ consistently across Operating Systems
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CMAK=
E_SOURCE_DIR}/,,$$(abspath $$<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+-endif()
++# Define __FILENAME__
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+=20
+ # Configuration options
+ option(CTR_DEV             "Enable development mode"                   No=
)
+diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
+index 95d8cc1e6..8c66887da 100644
+--- a/lib/monkey/CMakeLists.txt
++++ b/lib/monkey/CMakeLists.txt
+@@ -15,10 +15,8 @@ include(GNUInstallDirs)
+ # Set default compiler options
+ if (NOT CMAKE_SYSTEM_NAME MATCHES "Windows")
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dgnu99 -Wall -Wextra")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CMAKE_=
SOURCE_DIR}/,,$$(abspath \$$<))\"'")
+-else()
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+ endif()
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
+=20
+ # Monkey Version
+ set(MK_VERSION_MAJOR  1)
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Defin=
e-_GNU_SOURCE-for-memmem-API-check.patch b/meta-oe/recipes-extended/fluentb=
it/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
deleted file mode 100644
index e70664031..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_=
SOURCE-for-memmem-API-check.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0d22024c5defba7007e3e633753790e20209c6f6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 09:59:41 -0700
-Subject: [PATCH 1/5] monkey: Define _GNU_SOURCE for memmem API check
-
-This define is necessary to get this API on glibc based systems
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/monkey/mk_core/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/monkey/mk_core/CMakeLists.txt b/lib/monkey/mk_core/CMakeL=
ists.txt
-index 0e74f8d..739fff3 100644
---- a/lib/monkey/mk_core/CMakeLists.txt
-+++ b/lib/monkey/mk_core/CMakeLists.txt
-@@ -62,6 +62,7 @@ set(src "${src}"
-   )
-=20
- check_c_source_compiles("
-+  #define _GNU_SOURCE
-   #include <string.h>
-   int main() {
-      char  haystack[] =3D \"1234\";
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remo=
ve-unused-variable.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/000=
2-mbedtls-Remove-unused-variable.patch
deleted file mode 100644
index d911420df..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unus=
ed-variable.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c7b969d1a2a6b61bd179214ee2516b7b6cd55b27 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 11:21:57 -0700
-Subject: [PATCH 2/5] mbedtls: Remove unused variable
-
-Fixes
-library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-W=
unused-but-set-variable]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- lib/mbedtls-2.28.0/library/bignum.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/lib/mbedtls-2.28.0/library/bignum.c b/lib/mbedtls-2.28.0/libr=
ary/bignum.c
-index 62e7f76..9c256ae 100644
---- a/lib/mbedtls-2.28.0/library/bignum.c
-+++ b/lib/mbedtls-2.28.0/library/bignum.c
-@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
-                   mbedtls_mpi_uint *d,
-                   mbedtls_mpi_uint b )
- {
--    mbedtls_mpi_uint c =3D 0, t =3D 0;
-+    mbedtls_mpi_uint c =3D 0;
-=20
- #if defined(MULADDC_HUIT)
-     for( ; i >=3D 8; i -=3D 8 )
-@@ -1443,8 +1443,6 @@ void mpi_mul_hlp( size_t i,
-     }
- #endif /* MULADDC_HUIT */
-=20
--    t++;
--
-     while( c !=3D 0 )
-     {
-         *d +=3D c; c =3D ( *d < c ); d++;
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disable-inst=
alling-systemd-service-file.patch b/meta-oe/recipes-extended/fluentbit/flue=
ntbit/0003-Disable-installing-systemd-service-file.patch
new file mode 100644
index 000000000..07d9b3a77
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disable-installing-=
systemd-service-file.patch
@@ -0,0 +1,38 @@
+From c3b891eeec691753fccdf8e0a4541dcba244ec6b Mon Sep 17 00:00:00 2001
+From: Niko Mauno <niko.mauno@vaisala.com>
+Date: Thu, 10 Oct 2024 11:06:07 +0300
+Subject: [PATCH] Disable installing systemd service file
+
+With this we avoid the the following BitBake error when using some
+other init manager than SystemD:
+
+  ERROR: fluentbit-3.1.9-r0 do_package: QA Issue: fluentbit: Files/directo=
ries were installed but not shipped in any package:
+    /lib
+    /lib/systemd
+    /lib/systemd/system
+  Please set FILES such that these items are packaged. Alternatively if th=
ey are unneeded, avoid installing them or delete them within do_install.
+  fluentbit: 3 installed and not shipped files. [installed-vs-shipped]
+
+Upstream-Status: Inappropriate [hack]
+
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e24666484..c102806d0 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -534,7 +534,7 @@ if(FLB_BINARY)
+     set(SYSTEMD_UNITDIR  /lib/systemd/system)
+   endif()
+=20
+-  if(SYSTEMD_UNITDIR)
++  if(FALSE)
+     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.se=
rvice")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disa=
ble-documentation-warning-as-error-with-.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with=
-.patch
deleted file mode 100644
index 473ebaf7d..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-doc=
umentation-warning-as-error-with-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2d12629f768d2459b1fc8a8ca0c38024d84bc195 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 11:32:12 -0700
-Subject: [PATCH 3/5] mbedtls: Disable documentation warning as error with
- clang
-
-There are shortcomings with doxygen info which clang-15+ flags, dont
-treat them as errors
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- lib/mbedtls-2.28.0/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMakeL=
ists.txt
-index b33c088..c5f886f 100644
---- a/lib/mbedtls-2.28.0/CMakeLists.txt
-+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
-@@ -212,7 +212,7 @@ if(CMAKE_COMPILER_IS_GNU)
- endif(CMAKE_COMPILER_IS_GNU)
-=20
- if(CMAKE_COMPILER_IS_CLANG)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wp=
ointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-format=
-nonliteral")
-+	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpoin=
ter-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-format-no=
nliteral -Wno-error=3Ddocumentation")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
-     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O3")
-     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-point=
er -fno-optimize-sibling-calls")
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-n=
ot-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/00=
03-mbedtls-Do-not-overwrite-CFLAGS.patch
deleted file mode 100644
index 158857ae2..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8486b912281ae85db0c9fc05bb546f16872e114c Mon Sep 17 00:00:00 2001
-From: Paulo Neves <ptsneves@gmail.com>
-Date: Thu, 28 Jul 2022 14:37:18 +0200
-Subject: [PATCH] mbedtls: Do not overwrite CFLAGS
-
-bitbake passes CFLAGS that are often in conflict with the ones set
-in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
-FORTIFY_SOURCE=3D2 except in release mode
-
-Upstream-Status: Inappropriate [due to fluent-bit having it's own Release =
flags that also overwrite bitbake ones.]
----
- lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
-
---- a/lib/mbedtls-2.28.0/CMakeLists.txt
-+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
-@@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
-     if (GCC_VERSION VERSION_GREATER 7.0 OR GCC_VERSION VERSION_EQUAL 7.0)
-       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wformat-overflow=3D2 -Wformat-=
truncation")
-     endif()
--    set(CMAKE_C_FLAGS_RELEASE     "-O2")
--    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
-     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O3")
-     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-point=
er -fno-optimize-sibling-calls")
-@@ -215,8 +213,6 @@ endif(CMAKE_COMPILER_IS_GNU)
-=20
- if(CMAKE_COMPILER_IS_CLANG)
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wp=
ointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-format=
-nonliteral")
--    set(CMAKE_C_FLAGS_RELEASE     "-O2")
--    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
-     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
-     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O3")
-     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fsan=
itize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-point=
er -fno-optimize-sibling-calls")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-=
type-to-store-return-from-flb_kv_item_cr.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_c=
r.patch
deleted file mode 100644
index bd4276193..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to=
-store-return-from-flb_kv_item_cr.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a797b79483940ed4adcaa5fe2c40dd0487c7c2c7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 11:39:08 -0700
-Subject: [PATCH 4/5] Use correct type to store return from flb_kv_item_cre=
ate
-
-Fix
-error: incompatible pointer to integer conversion assigning to 'int' from =
'struct flb_kv *'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- plugins/out_stackdriver/stackdriver_conf.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/out_stackdriver/stackdriver_conf.c b/plugins/out_stac=
kdriver/stackdriver_conf.c
-index a9a8eb0..e4f969e 100644
---- a/plugins/out_stackdriver/stackdriver_conf.c
-+++ b/plugins/out_stackdriver/stackdriver_conf.c
-@@ -176,12 +176,12 @@ static int read_credentials_file(const char *cred_fi=
le, struct flb_stackdriver *
-=20
- static int parse_configuration_labels(struct flb_stackdriver *ctx)
- {
--    int ret;
-     char *p;
-     flb_sds_t key;
-     flb_sds_t val;
-     struct mk_list *head;
-     struct flb_slist_entry *entry;
-+    struct flb_kv *ret;
-     msgpack_object_kv *kv =3D NULL;
-=20
-     if (ctx->labels) {
-@@ -216,7 +216,7 @@ static int parse_configuration_labels(struct flb_stack=
driver *ctx)
-             flb_sds_destroy(key);
-             flb_sds_destroy(val);
-=20
--            if (ret =3D=3D -1) {
-+            if (!ret) {
-                 return -1;
-             }
-         }
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-s=
ystemd-init-systemd-detection-contingent.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingen=
t.patch
deleted file mode 100644
index f6e3dce2f..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-=
init-systemd-detection-contingent.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 7a792624925d46690c1f07fe4b194b5f4c510db6 Mon Sep 17 00:00:00 2001
-From: Paulo Neves <ptsneves@gmail.com>
-Date: Tue, 2 Aug 2022 09:57:05 +0200
-Subject: [PATCH 1/1] build: Make systemd init systemd detection contingent=
 on
- pkgconfig
-
-Use pkg-config to get systemd.pc variables and systemdunitdir. Those
-variable ensure that .service files are installed in the correct paths
-and only when systemd is detected.
-
-Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/5818]
-
----
- cmake/FindJournald.cmake | 4 ++++
- src/CMakeLists.txt       | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/FindJournald.cmake b/cmake/FindJournald.cmake
-index f5a3a832b..9e6657a29 100644
---- a/cmake/FindJournald.cmake
-+++ b/cmake/FindJournald.cmake
-@@ -5,6 +5,8 @@
- #  JOURNALD_INCLUDE_DIR - the Journald include directory
- #  JOURNALD_LIBRARIES - Link these to use Journald
- #  JOURNALD_DEFINITIONS - Compiler switches required for using Journald
-+#  SYSTEMD_UNITDIR - The systemd units' directory
-+#
- # Redistribution and use is allowed according to the terms of the BSD lic=
ense.
- # For details see the accompanying COPYING-CMAKE-SCRIPTS file.
- #
-@@ -16,7 +18,9 @@
- # in the FIND_PATH() and FIND_LIBRARY() calls
- find_package(PkgConfig)
- pkg_check_modules(PC_JOURNALD QUIET systemd)
-+pkg_get_variable(PC_SYSTEMD_UNITDIR systemd "systemdsystemunitdir")
-=20
-+set(SYSTEMD_UNITDIR ${PC_SYSTEMD_UNITDIR})
- set(JOURNALD_FOUND ${PC_JOURNALD_FOUND})
- set(JOURNALD_DEFINITIONS ${PC_JOURNALD_CFLAGS_OTHER})
-=20
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 522bbf9bd..30743d8d6 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -480,13 +480,13 @@ if(FLB_BINARY)
-   endif()
-=20
-   # Detect init system, install upstart, systemd or init.d script
--  if(IS_DIRECTORY /lib/systemd/system)
-+  if(DEFINED SYSTEMD_UNITDIR)
-     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.se=
rvice")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-       ${FLB_SYSTEMD_SCRIPT}
-       )
--    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION /lib=
/systemd/system)
-+    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SY=
STEMD_UNITDIR})
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary=
)
-   elseif(IS_DIRECTORY /usr/share/upstart)
-     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.co=
nf")
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link=
-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/flue=
ntbit/0004-chunkio-Link-with-fts-library-with-musl.patch
similarity index 91%
rename from meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-=
with-fts-library-with-musl.patch
rename to meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-wi=
th-fts-library-with-musl.patch
index bdcc53496..d1c39d89c 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-f=
ts-library-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with-f=
ts-library-with-musl.patch
@@ -1,7 +1,7 @@
 From 63dbbad5978e5f5b0e7d42614999cb6b4ebcce10 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 10 Aug 2022 01:27:16 -0700
-Subject: [PATCH 2/2] chunkio: Link with fts library with musl
+Subject: [PATCH] chunkio: Link with fts library with musl
=20
 Fixes
 cio_utils.c:(.text+0x64): undefined reference to `fts_read'
@@ -27,4 +27,3 @@ index a4fc2d3..4244eb8 100644
    set(src
 --=20
 2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-st=
rerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/000=
5-Use-posix-strerror_r-with-musl.patch
new file mode 100644
index 000000000..bcce32803
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-strerror_=
r-with-musl.patch
@@ -0,0 +1,28 @@
+From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 01:23:48 -0700
+Subject: [PATCH] Use posix strerror_r with musl
+
+Default with glibc is GNU extention of strerror_r
+where as musl uses posix variant, call that out
+
+Upstream-Status: Inappropriate [Need wider porting beyond linux/musl/glibc=
]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Resolved conflicts while upgrading recipe from v1.9.9 to v3.1.9.
+
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+
+diff --git a/src/flb_network.c b/src/flb_network.c
+index d183209fd..41e0281b5 100644
+--- a/src/flb_network.c
++++ b/src/flb_network.c
+@@ -553,7 +553,7 @@ static int net_connect_async(int fd,
+             /* Connection is broken, not much to do here */
+ #if ((defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >=3D 200112L) ||    \
+      (defined(_XOPEN_SOURCE) || _XOPEN_SOURCE - 0L >=3D 600L)) &&     \
+-  (!defined(_GNU_SOURCE))
++  (!defined(_GNU_SOURCE)) || (!defined(__GLIBC__))
+             ret =3D strerror_r(error, so_error_buf, sizeof(so_error_buf))=
;
+             if (ret =3D=3D 0) {
+                 str =3D so_error_buf;
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-=
Fix-return-type-mismatch.patch b/meta-oe/recipes-extended/fluentbit/fluentb=
it/0005-stackdriver-Fix-return-type-mismatch.patch
deleted file mode 100644
index f023ab573..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-ret=
urn-type-mismatch.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 27f0bd5a3339612e03112e6b490900a9fabc3337 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 11:44:25 -0700
-Subject: [PATCH 5/5] stackdriver: Fix return type mismatch
-
-Fix
-error: incompatible integer to pointer conversion returning 'int' from a f=
unction with result type 'flb_sds_t' (aka 'char *') [-Wint-conversion]
-            return -1;
-                   ^~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- plugins/out_stackdriver/stackdriver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/out_stackdriver/stackdriver.c b/plugins/out_stackdriv=
er/stackdriver.c
-index ae66bf2..e01755c 100644
---- a/plugins/out_stackdriver/stackdriver.c
-+++ b/plugins/out_stackdriver/stackdriver.c
-@@ -2033,7 +2033,7 @@ static flb_sds_t stackdriver_format(struct flb_stack=
driver *ctx,
-             flb_sds_destroy(operation_producer);
-             msgpack_unpacked_destroy(&result);
-             msgpack_sbuffer_destroy(&mp_sbuf);
--            return -1;
-+            return NULL;=20
-         }
-=20
-         /* Number of parsed labels */
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-T=
LS-detection-testcase.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/=
0006-monkey-Fix-TLS-detection-testcase.patch
deleted file mode 100644
index c3f2574d2..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-dete=
ction-testcase.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f88d9b82e8bd8ae38fba666b5825ffb41769f81a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 12:25:22 -0700
-Subject: [PATCH] monkey: Fix TLS detection testcase
-
-Clang15 errors out on compiling the check and disables TLS
-
-Fixes errors like
-
-error: call to undeclared function '__tls_get_addr'; ISO C99 and later do =
not support implicit function declarations [-Wimplicit-function-declaration=
]
-         __tls_get_addr(0);
-         ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- lib/monkey/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
-index 15e62e8..96ac2bd 100644
---- a/lib/monkey/CMakeLists.txt
-+++ b/lib/monkey/CMakeLists.txt
-@@ -178,6 +178,8 @@ endif()
- # Use old Pthread TLS
- if(NOT MK_PTHREAD_TLS)
-   check_c_source_compiles("
-+     #include <sys/types.h>
-+     extern void *__tls_get_addr(size_t *v);
-      __thread int a;
-      int main() {
-          __tls_get_addr(0);
---=20
-2.37.1
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not=
-check-for-upstart-on-build-host.patch b/meta-oe/recipes-extended/fluentbit=
/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch
deleted file mode 100644
index 71bdd34ee..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-=
for-upstart-on-build-host.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c41653e856d05ed430d22f8b311714ff756a0e0b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 Mar 2023 18:05:27 -0700
-Subject: [PATCH] cmake: Do not check for upstart on build host
-
-Some ubuntu distros might have this directory /usr/share/upstart around
-and yocto based distros not using systemd will process this piece of
-code and falsely assume that target supports upstart, which may not be
-true in case of cross-compilation.
-
-This also can end up in configure errors e.g.
-
-| CMake Error at src/CMakeLists.txt:496 (install):
-|   install DIRECTORY given unknown argument "/etc/td-agent-bit/".
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Inappropriate [ Cross-compile Specific ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/CMakeLists.txt | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index bb30b2a..c63b6d8 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -486,14 +486,6 @@ if(FLB_BINARY)
-       )
-     install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SY=
STEMD_UNITDIR})
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary=
)
--  elseif(IS_DIRECTORY /usr/share/upstart)
--    set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.co=
nf")
--    configure_file(
--      "${PROJECT_SOURCE_DIR}/init/upstart.in"
--      ${FLB_UPSTART_SCRIPT}
--      )
--    install(FILES ${FLB_UPSTART_SCRIPT} COMPONENT binary DESTINATION /etc=
/init)
--    install(DIRECTORY DESTINATION COMPONENT binary ${FLB_INSTALL_CONFDIR}=
)
-   else()
-     # FIXME: should we support Sysv init script ?
-   endif()
---=20
-2.40.0
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb b/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb
deleted file mode 100644
index 660a3a63e..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
+++ /dev/null
@@ -1,97 +0,0 @@
-SUMMARY =3D "Fast Log processor and Forwarder"
-DESCRIPTION =3D "Fluent Bit is a data collector, processor and  \
-forwarder for Linux. It supports several input sources and \
-backends (destinations) for your data. \
-"
-
-HOMEPAGE =3D "http://fluentbit.io"
-BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba9=
3"
-SECTION =3D "net"
-
-SRC_URI =3D "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=
=3Dfluent-bit-${PV};downloadfilename=3D${BPN}-${PV}.tar.gz \
-           file://0001-CMakeLists.txt-Do-not-use-private-makefile-target.p=
atch \
-           file://0002-flb_info.h.in-Do-not-hardcode-compilation-directori=
e.patch \
-           file://0003-mbedtls-Do-not-overwrite-CFLAGS.patch \
-           file://0004-build-Make-systemd-init-systemd-detection-contingen=
t.patch \
-           file://0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patc=
h \
-           file://0002-mbedtls-Remove-unused-variable.patch \
-           file://0003-mbedtls-Disable-documentation-warning-as-error-with=
-.patch \
-           file://0004-Use-correct-type-to-store-return-from-flb_kv_item_c=
r.patch \
-           file://0005-stackdriver-Fix-return-type-mismatch.patch \
-           file://0006-monkey-Fix-TLS-detection-testcase.patch \
-           file://0007-cmake-Do-not-check-for-upstart-on-build-host.patch =
\
-           "
-SRC_URI:remove:x86 =3D "file://0002-mbedtls-Remove-unused-variable.patch"
-SRC_URI:append:libc-musl =3D "\
-           file://0001-Use-posix-strerror_r-with-musl.patch \
-           file://0002-chunkio-Link-with-fts-library-with-musl.patch \
-           "
-SRC_URI[sha256sum] =3D "3f6cd4bd1894cda16b465aef6ffec7e920d54c4209b3e2320f=
cffe7ae345700e"
-S =3D "${WORKDIR}/fluent-bit-${PV}"
-
-DEPENDS =3D "zlib bison-native flex-native openssl"
-DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-PACKAGECONFIG[yaml] =3D "-DFLB_CONFIG_YAML=3DOn,-DFLB_CONFIG_YAML=3DOff,li=
byaml"
-PACKAGECONFIG[kafka] =3D "-DFLB_OUT_KAFKA=3DOn,-DFLB_OUT_KAFKA=3DOff,librd=
kafka"
-PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DOn,-DFLB_EXAMPLES=3DOff"
-PACKAGECONFIG[jemalloc] =3D "-DFLB_JEMALLOC=3DOn,-DFLB_JEMALLOC=3DOff,jema=
lloc"
-#TODO add more fluentbit options to PACKAGECONFIG[]
-
-DEPENDS:append:libc-musl =3D " fts "
-
-# flex hardcodes the input file in #line directives leading to TMPDIR cont=
amination of debug sources.
-do_compile:append() {
-    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|$=
{TARGET_DBGSRC_DIR}/|g'
-}
-
-PACKAGECONFIG ?=3D "yaml"
-
-LTO =3D ""
-
-# Use CMake 'Unix Makefiles' generator
-OECMAKE_GENERATOR ?=3D "Unix Makefiles"
-
-# Fluent Bit build options
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-# Host related setup
-EXTRA_OECMAKE +=3D "-DGNU_HOST=3D${HOST_SYS} -DFLB_TD=3D1"
-
-# Disable LuaJIT and filter_lua support
-EXTRA_OECMAKE +=3D "-DFLB_LUAJIT=3DOff -DFLB_FILTER_LUA=3DOff "
-
-# Disable Library and examples
-EXTRA_OECMAKE +=3D "-DFLB_SHARED_LIB=3DOff"
-
-# Enable systemd iff systemd is in DISTRO_FEATURES
-EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFL=
B_SYSTEMD=3DOn','-DFLB_SYSTEMD=3DOff',d)}"
-
-# Enable release builds
-EXTRA_OECMAKE +=3D "-DFLB_RELEASE=3DOn"
-
-# musl needs these options
-EXTRA_OECMAKE:append:libc-musl =3D ' -DFLB_JEMALLOC_OPTIONS=3D"--with-jema=
lloc-prefix=3Dje_ --with-lg-quantum=3D3" -DFLB_CORO_STACK_SIZE=3D24576'
-
-EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
-EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
-EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
-EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
-EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
-
-CFLAGS:append:x86 =3D " -DMBEDTLS_HAVE_SSE2"
-
-# Fixes build with GCC-14
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
-
-inherit cmake systemd pkgconfig
-
-SYSTEMD_SERVICE:${PN} =3D "td-agent-bit.service"
-
-EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
-TARGET_CC_ARCH +=3D " ${SELECTED_OPTIMIZATION}"
-
-SKIP_RECIPE[fluentbit] ?=3D "It is not reproducible. QA Issue: File /usr/b=
in/.debug/td-agent-bit in package fluentbit-dbg contains reference to TMPDI=
R [buildpaths]"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta-o=
e/recipes-extended/fluentbit/fluentbit_3.1.9.bb
new file mode 100644
index 000000000..fc67236d3
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -0,0 +1,122 @@
+SUMMARY =3D "Fast Log Processor and Forwarder"
+DESCRIPTION =3D "Fluent Bit allows to collect log events or metrics from \
+different sources, process them and deliver them to different backends \
+such as Fluentd, Elasticsearch, Splunk, DataDog, Kafka, New Relic, Azure \
+services, AWS services, Google services, NATS, InfluxDB or any custom \
+HTTP end-point."
+HOMEPAGE =3D "http://fluentbit.io"
+BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
+SECTION =3D "net"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba9=
3"
+DEPENDS =3D "\
+    bison-native \
+    flex-native \
+    openssl \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+DEPENDS:append:libc-musl =3D " fts"
+
+SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
+SRC_URI =3D "\
+    git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps \
+    file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch=
 \
+    file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch=
 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0003-Di=
sable-installing-systemd-service-file.patch', d)} \
+"
+SRC_URI:append:libc-musl =3D "\
+    file://0004-chunkio-Link-with-fts-library-with-musl.patch \
+    file://0005-Use-posix-strerror_r-with-musl.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D "\
+    aws \
+    binary \
+    config-yaml \
+    custom-calyptia \
+    http-server \
+    inotify \
+    metrics \
+    parser \
+    proxy-go \
+    record-accessor \
+    regex \
+    release \
+    signv4 \
+    sqldb \
+    stream-processor \
+    tls \
+    utf8-encoder \
+"
+
+PACKAGECONFIG[all] =3D "-DFLB_ALL=3DYes,-DFLB_ALL=3DNo"
+PACKAGECONFIG[arrow] =3D "-DFLB_ARROW=3DYes,-DFLB_ARROW=3DNo"
+PACKAGECONFIG[avro-encoder] =3D "-DFLB_AVRO_ENCODER=3DYes,-DFLB_AVRO_ENCOD=
ER=3DNo"
+PACKAGECONFIG[aws-error-reporter] =3D "-DFLB_AWS_ERROR_REPORTER=3DYes,-DFL=
B_AWS_ERROR_REPORTER=3DNo"
+PACKAGECONFIG[aws] =3D "-DFLB_AWS=3DYes,-DFLB_AWS=3DNo"
+PACKAGECONFIG[backtrace] =3D "-DFLB_BACKTRACE=3DYes,-DFLB_BACKTRACE=3DNo"
+PACKAGECONFIG[binary] =3D "-DFLB_BINARY=3DYes,-DFLB_BINARY=3DNo"
+PACKAGECONFIG[chunk-trace] =3D "-DFLB_CHUNK_TRACE=3DYes,-DFLB_CHUNK_TRACE=
=3DNo"
+PACKAGECONFIG[config-yaml] =3D "-DFLB_CONFIG_YAML=3DYes,-DFLB_CONFIG_YAML=
=3DNo,libyaml"
+PACKAGECONFIG[coverage] =3D "-DFLB_COVERAGE=3DYes,-DFLB_COVERAGE=3DNo"
+PACKAGECONFIG[custom-calyptia] =3D "-DFLB_CUSTOM_CALYPTIA=3DYes,-DFLB_CUST=
OM_CALYPTIA=3DNo"
+PACKAGECONFIG[debug] =3D "-DFLB_DEBUG=3DYes,-DFLB_DEBUG=3DNo"
+PACKAGECONFIG[enforce-alignment] =3D "-DFLB_ENFORCE_ALIGNMENT=3DYes,-DFLB_=
ENFORCE_ALIGNMENT=3DNo"
+PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DYes,-DFLB_EXAMPLES=3DNo"
+PACKAGECONFIG[http-client-debug] =3D "-DFLB_HTTP_CLIENT_DEBUG=3DYes,-DFLB_=
HTTP_CLIENT_DEBUG=3DNo"
+PACKAGECONFIG[http-server] =3D "-DFLB_HTTP_SERVER=3DYes,-DFLB_HTTP_SERVER=
=3DNo"
+PACKAGECONFIG[inotify] =3D "-DFLB_INOTIFY=3DYes,-DFLB_INOTIFY=3DNo"
+PACKAGECONFIG[jemalloc] =3D "-DFLB_JEMALLOC=3DYes,-DFLB_JEMALLOC=3DNo,jema=
lloc"
+PACKAGECONFIG[luajit] =3D "-DFLB_LUAJIT=3DYes,-DFLB_LUAJIT=3DNo"
+PACKAGECONFIG[metrics] =3D "-DFLB_METRICS=3DYes,-DFLB_METRICS=3DNo"
+PACKAGECONFIG[mtrace] =3D "-DFLB_MTRACE=3DYes,-DFLB_MTRACE=3DNo"
+PACKAGECONFIG[parser] =3D "-DFLB_PARSER=3DYes,-DFLB_PARSER=3DNo"
+PACKAGECONFIG[posix-tls] =3D "-DFLB_POSIX_TLS=3DYes,-DFLB_POSIX_TLS=3DNo"
+PACKAGECONFIG[proxy-go] =3D "-DFLB_PROXY_GO=3DYes,-DFLB_PROXY_GO=3DNo"
+PACKAGECONFIG[record-accessor] =3D "-DFLB_RECORD_ACCESSOR=3DYes,-DFLB_RECO=
RD_ACCESSOR=3DNo"
+PACKAGECONFIG[regex] =3D "-DFLB_REGEX=3DYes,-DFLB_REGEX=3DNo"
+PACKAGECONFIG[release] =3D "-DFLB_RELEASE=3DYes,-DFLB_RELEASE=3DNo"
+PACKAGECONFIG[run-ldconfig] =3D "-DFLB_RUN_LDCONFIG=3DYes,-DFLB_RUN_LDCONF=
IG=3DNo"
+PACKAGECONFIG[shared-lib] =3D "-DFLB_SHARED_LIB=3DYes,-DFLB_SHARED_LIB=3DN=
o"
+PACKAGECONFIG[signv4] =3D "-DFLB_SIGNV4=3DYes,-DFLB_SIGNV4=3DNo"
+PACKAGECONFIG[small] =3D "-DFLB_SMALL=3DYes,-DFLB_SMALL=3DNo"
+PACKAGECONFIG[sqldb] =3D "-DFLB_SQLDB=3DYes,-DFLB_SQLDB=3DNo"
+PACKAGECONFIG[stream-processor] =3D "-DFLB_STREAM_PROCESSOR=3DYes,-DFLB_ST=
REAM_PROCESSOR=3DNo"
+PACKAGECONFIG[tests-runtime] =3D "-DFLB_TESTS_RUNTIME=3DYes,-DFLB_TESTS_RU=
NTIME=3DNo"
+PACKAGECONFIG[tls] =3D "-DFLB_TLS=3DYes,-DFLB_TLS=3DNo"
+PACKAGECONFIG[trace] =3D "-DFLB_TRACE=3DYes,-DFLB_TRACE=3DNo"
+PACKAGECONFIG[utf8-encoder] =3D "-DFLB_UTF8_ENCODER=3DYes,-DFLB_UTF8_ENCOD=
ER=3DNo"
+PACKAGECONFIG[valgrind] =3D "-DFLB_VALGRIND=3DYes,-DFLB_VALGRIND=3DNo"
+PACKAGECONFIG[wamrc] =3D "-DFLB_WAMRC=3DYes,-DFLB_WAMRC=3DNo"
+PACKAGECONFIG[wasm-stack-protect] =3D "-DFLB_WASM_STACK_PROTECT=3DYes,-DFL=
B_WASM_STACK_PROTECT=3DNo"
+PACKAGECONFIG[wasm] =3D "-DFLB_WASM=3DYes,-DFLB_WASM=3DNo"
+PACKAGECONFIG[windows-defaults] =3D "-DFLB_WINDOWS_DEFAULTS=3DYes,-DFLB_WI=
NDOWS_DEFAULTS=3DNo"
+
+# Option to disable all Fluent Bit plugins by default. See cmake/plugins_o=
ptions.cmake which
+# individual plugins then to enable (e.g. using EXTRA_OECMAKE:append =3D "=
 -DFLB_FOOBAR=3DON")
+PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_MINIMAL=3DNo"
+
+# Without zstd dependency, kafka plugin build fails at link attempt agains=
t native libzstd.so
+PACKAGECONFIG[in-kafka] =3D "-DFLB_IN_KAFKA=3DON,-DFLB_IN_KAFKA=3DOFF,libr=
dkafka zstd"
+PACKAGECONFIG[out-kafka] =3D "-DFLB_OUT_KAFKA=3DON,-DFLB_OUT_KAFKA=3DOFF,l=
ibrdkafka zstd"
+
+SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
+
+inherit cmake systemd pkgconfig
+
+FULL_OPTIMIZATION:remove =3D "${@'-O2' if bb.data.inherits_class('clang', =
d) else ''}"
+TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH:remove =3D "-D_FORTIFY_SOURCE=3D2"
+EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
+EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
+EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
+EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
+EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
+EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
+
+# flex hardcodes the input file in #line directives leading to TMPDIR cont=
amination of debug sources.
+do_compile:append() {
+    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|$=
{TARGET_DBGSRC_DIR}/|g'
+}
--=20
2.39.2


