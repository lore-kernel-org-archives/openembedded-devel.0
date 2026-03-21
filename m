Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBA81094499
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 20:13:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.124])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18041.1774123989229852782
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 13:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=TKh8E2B7;
 spf=pass (domain: navimatix.de, ip: 52.101.70.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTHP1oB+W2asLRYXRYqjqXX5qWvkeyDQrTE1xAp5miY8+zYMHqtfphqJEIpV10hfs8EYgjNClpJcvRd7BiHDMkvIY8kX2TaBO6nvtE0hG3a0q7Eb+n1nce9wgK/WL1G6j4TYfJvUGbtMjv8RXUhXLbRpTq5hIdgMiGFAUaFMwH/zPzDgZ8fR1S0B05EPPQcfpNQJV8IYCoqLBcSKbzLhZUYRBucIjJCDr+K/Oxg5iLdQBSvZuMzOChUc0iSKxlhmn9Pzx6hbsBErJskAhXkLLxoJK1VtBYnDkBOdO0LCp+MMrsPt9PJdhMHkGhJv2BmRSSB5w929QpPdVb0oiYbS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueCHXL31B+AUkia5yidh+JyMbc9AkgxGfz3tyTXu4BA=;
 b=cEHTK3dBElF/vAaZ0Hhj7D5rJyac7aaEi8y5UT2Trc+EudX1MIsnoWbICKhbn1tSLFaCQBkmL/lROa+R3PWJreZgBnolwNPi4Uff6qyoGB5PVO4F+/Go4Jfw8j9Mk8YtPkjK5G9hhCBsk1h6jyxnLDhsN2e+BqlfB7EI31RlqSfUbgOzySMEvKxU1upeVCuz1KhNfer3B/TdxhtEowayprZ2HlBU2SE5ur950+1lYW2Txo+y8q/amQRLrnABFwONOUG8Lqo2VZi6s4B6X2sosfAW5xxyC6biCNqPliFD9Rg1DWbpKqyJ0D7saFW7Fz8Xx2Akc42TV4861iIhyW7hag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueCHXL31B+AUkia5yidh+JyMbc9AkgxGfz3tyTXu4BA=;
 b=TKh8E2B7draY5ccvvKqGdLSka/bXOuvRxQIFb1WM6rCQ0EPAxzjuaKxrIONxDGdidRpspk3fCYpgnXYf8ICR1R3zihhLNkKTAa+VaH2jOdqWR0k5qxBZWK48c7mtY5NqU0j2P4ONmB+JZKmltTuB8S/7u/stRmckBNFTHEB6Kzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7671.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:289::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 20:12:52 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Sat, 21 Mar 2026 20:13:04 +0000
Date: Sat, 21 Mar 2026 21:13:03 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de, 
	skandigraun@gmail.com
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>, 
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [PATCH] thin-provisioning-tools: SRC_URI update + Update 1.1.0 ->
 1.3.1
Message-ID: <8001507ef48ed2ae2adb6a4740c90c8d1de9b843.1774123982.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8daf4e-071a-48be-e8c3-08de87864274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	U38JgM5FYSzzBQK2c7RAgsgH+2NNTBN8DFzQt0UeNqTn7IUy66a+wRnmJuzLCU1yN/OtTFeUT7yTmNf4tVrM/PTO5y3HeKR49wiY4CSFVjZIP/IprkMX1cp1e0nzQ0jFhOR7h9gMHUg8Bzp8sIOQFM1gU0sD+3KmojInRblDQ8+7OYXmC7XeOvWdfRCC7vgkOGHEfNodCpP6uotyk1wBlTg11tm4VMICx8TzysD3u1KqGy2bEJO2yOtuj9ii+KDLKCFzDnpZvuDqtBw+FxOSbgIvRsI1HE+9zje5vLrYoZItOKq5fKi+eMFNWfHw44QNiFNI5vfAulVFA7HylfsZRlay0SrDjaGbK5Rxsq5yi1d9C0xPR04/69Tf4pb3LZnhB6ElnnnzXWj7jCn8ofGWOYAbEWUjfP+u4EOHh4DB3u+5b86LnEUPU86LxlHsJOX6Fpv6cNrNIpT6EG8MgLPB4vtE02VJp1M9c28TB6cp2tf1b2Woni70wuN+DaldGE9QHzG2pObu6AZGZFv2+gwet7ave/2KZZB/9zSQtHnnJTg7mENDbYv0Z0MEa+j6+HKO9WNtWFHy23rXvzxYFyVf2EY2+qiQy50YFXwJWZr6uJ1LjZr4AQyr3Mvw5YntQ4INj33O0tvyt285i58SRwuRtzD/YWEE/JwFdGpl7qCOg43hrQDZ8uZSxchaGCR2yEXCUCf78SYN1RQN8eBDZgTz2YC4FbUPDvngfAs50eQfGcVftvhIbJpM+DY+Ml/Kt9+E
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XcLgkieo2eOrXxKTKNG0VhdVvauoKe6x5zWYgJEKyYSBFhbdmEdJkT5KLwoo?=
 =?us-ascii?Q?jIcT41jqFs+cc5SKTdJyhIcJ5zOh5xsysPityQapzhJhPZLmTulItqC07s4S?=
 =?us-ascii?Q?fIDrAuUoWczruB3FJ06QqbAtxenFmWBHyr3IyWHUHyHHq48w53s7Yw7lnpUe?=
 =?us-ascii?Q?snFJImLEb/9gKWmesmpylo1uriMRrwIwXfHGsOr5QUFmTSgUeqQsppFzX4Oj?=
 =?us-ascii?Q?HGdVC4jfVmHDmh9VnMuNDe6Z4E1GM6foCVREoKW2rJWTtCyexSfuLr7usdcp?=
 =?us-ascii?Q?ZUxg+uhVfT86gf5flNOPSir+5SRA9geBzNHgUieCyxwp9prb1JD3kKs5xSYG?=
 =?us-ascii?Q?SkXCURLvGKD3A2YgrDRuRdunBsLLg6r/KA6r/b0nNS9pHbXCiXrOMKq4YbVc?=
 =?us-ascii?Q?s9MHSMJ4UrIb45kq2LOEJd+IxSD772jbNfepjUPqnfVeES6uiCmJ9HFS44iw?=
 =?us-ascii?Q?BXyzqDP3UO1u8/7l6Txe5Kq7TZOtBeMmTmrdaOo0JsdLse7IvhZsbwel0uhI?=
 =?us-ascii?Q?ubojV7a/RivDTlsjSO4rcAF7u5lHaCbn9pAECO+hEOYriMhEDT/kzK8/8Dv9?=
 =?us-ascii?Q?LqpKE/WQX1E6LGKVr7yMANL1m7mumjA5m47k0ppc/l0exnZoGOuwepsuoD1T?=
 =?us-ascii?Q?FzS3SLwxrEo1tTMqb8YPFhQvIj1hkvefnnVY9nnguke/gATFYVi0JBw51lfE?=
 =?us-ascii?Q?0kn8bc5o4F1qhqUIpueaNXJAMmnBMdoCCJFjsr8wERz/KvvGjXkvPsImCcXI?=
 =?us-ascii?Q?jPFOEA6c6HHnDvvMR1oiBbZ36rSJDUxnro/oy7w5VIn111HotuLK0r9NN513?=
 =?us-ascii?Q?5KqZOC/i67hmq9CTSmQoDu4Fn6xCRLF+TFxnQgrUeX4kCi/OWmtCjA/oaCFs?=
 =?us-ascii?Q?4tXOKsVSnTYdICF8enbuTcJKqnRIwKI3arKSkXm2j++xRagVBqs2bWNWuk1W?=
 =?us-ascii?Q?lypIfSNNx+5NUyenM+dH+kxXf+XSgbAZIA+JNIhi4SPPR0gV4IoyhHzHfVQu?=
 =?us-ascii?Q?71mHijW3qmDbc/Ikw7fMgmVLSvQ+xy45d4byKhV+Zk8qsEcqlC1w22Afciy+?=
 =?us-ascii?Q?MlnkU8STTbgppujKMSR+d96kHcBY/xNrGzyi+SmvALb2f5EBn0PoXcfMOeUh?=
 =?us-ascii?Q?5iSaIDE+VTGI9Q64FjNNwIW9pooJNp8IUAH54Z5WSZJm+pokoD+hDjF8LTpQ?=
 =?us-ascii?Q?OUwHZIJ2JQwIaeOmcwgPMpBqZoYSQyef/sma6M8l01wivCnjAPkB0YtOsb4i?=
 =?us-ascii?Q?44lKEBaa0V65QQf10bmcy831LyFsQgLl8Ad5mL2L6+jlr8ZAfXzt9DArFbBy?=
 =?us-ascii?Q?WYC6tjvZEbOsTdFoyXGVp3+f11Qf9gXIkCjeE7u45eqFJdN6Ch/tJ4ZaXO0j?=
 =?us-ascii?Q?pYAYSdzieFoOFuWuEj2pJ2+hq/PEdjZeKxk6RTkVK0g6TxEAUl2LqrjzznL2?=
 =?us-ascii?Q?H1tLbhy1bY43E14BT8NWPN8xhxtViZTr42z0JM4w5bFWmpiAcxKxqhGOs0kq?=
 =?us-ascii?Q?Dx1FvG3J43++5sKKIc0LRK79KAj1gszOoOhLiC2DnvzaXi0QseS46MlCWpXf?=
 =?us-ascii?Q?ybC7IvnDxOW+ZpnHeTtqD/iTShpeKnXN3Ebru+5+BpYMoWPy/F/mu/M127YT?=
 =?us-ascii?Q?bpJ9F9pk2A4T4AuwZsus8klSaFchsLETtTKJe6L1M25OjuEYHh58vCBhJgcT?=
 =?us-ascii?Q?kz93qgtl/tqMUyZXYKbnsro/T0xiBummpPUCXEl4ZNCni4mag+jxRQHapfKa?=
 =?us-ascii?Q?cQDnttTZRChFaC7O1fLv+mo/Y+MIN4o=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8daf4e-071a-48be-e8c3-08de87864274
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 20:13:04.4922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBow1MpBcZR3iEdCjN22oprE4EwF22eJqZ0LE1rVZHRbBfbXWcWhXxmAX9LWzCNjQUh7LC+3J8zuPQrDJKIBTPMG7/aBaTifhM2pBWqGsk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7671
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 20:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125470

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

* https://github.com/jthornber/thin-provisioning-tools#project-hosting says=
:

  The upstream repository has been moved to device-mapper-utils[1], an
  organization established to collect utilities for various device mapper
  targets. While the original repository remains mirrored, we recommend
  cloning from the new location[2] for better long-term maintenance.

  [1]: https://github.com/device-mapper-utils/
  [2]: https://github.com/device-mapper-utils/thin-provisioning-tools

* 0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch got merge=
d
  upstream in rust-lang/libc.

* dependency rio got dropped in 1.3.0

* The new patch disable-cargo-metadata enables the feature of devicemapper,
  because the build fails otherwise.

* On 32 bit architectures, the new patch dms-no-layout-check disables check=
s
  from bindgen they always fail.

From thin-provisioning-tools-1.3.1/CHANGES:

v1.3.1
=3D=3D=3D=3D=3D=3D

- Improve thin_ls performance using the optimized approach from thin_check

v1.3.0
=3D=3D=3D=3D=3D=3D

- Improve thin_check performance with an optimized I/O strategy and more
  memory-efficient data structures.
- Rewrite AsyncIoEngine using tokio IoUring, removing the rio dependency
- Enhance thin_check with edge-case fixes, including space map boundary che=
cks
- Update thin_explore to use ratatui, replacing the archived tui crate

v1.2.2
=3D=3D=3D=3D=3D=3D=3D

- Fix command line parsing for era_invalidate --metadata-snapshot

v1.2.1
=3D=3D=3D=3D=3D=3D=3D

- Fix incorrect number of data blocks in thin_shrink's output superblock

v1.2.0
=3D=3D=3D=3D=3D=3D=3D

- Remove atty and safemem dependencies due to security concerns
- Remove unused threaded btree walk code
- Change BTreeWalker constructor to take IoEngine by reference for simplici=
ty
  (breaking change)
- Update fixedbitset and few other dependencies with required code changes

Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../thin-provisioning-tools-crates.inc        | 556 +++++++++++-------
 .../thin-provisioning-tools-git-crates.inc    |   6 -
 ...l-codes-on-riscv32gc-unknown-linux-g.patch |  38 --
 .../0001-Use-portable-atomics-crate.patch     |  30 +-
 .../disable-cargo-metadata.patch              |  38 ++
 .../dms-no-layout-check.patch                 |  66 +++
 ....0.bb =3D> thin-provisioning-tools_1.3.1.bb} |  13 +-
 7 files changed, 448 insertions(+), 299 deletions(-)
 delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-pr=
ovisioning-tools-git-crates.inc
 delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-pr=
ovisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.=
patch
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-pr=
ovisioning-tools/disable-cargo-metadata.patch
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-pr=
ovisioning-tools/dms-no-layout-check.patch
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-=
tools_1.1.0.bb =3D> thin-provisioning-tools_1.3.1.bb} (77%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin=
-provisioning-tools-crates.inc
index e06fc31905..3876cb88cc 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls-crates.inc
@@ -2,281 +2,381 @@
=20
 # from Cargo.lock
 SRC_URI +=3D " \
-    crate://crates.io/adler/1.0.2 \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/anstream/0.6.15 \
-    crate://crates.io/anstyle/1.0.8 \
-    crate://crates.io/anstyle-parse/0.2.5 \
-    crate://crates.io/anstyle-query/1.1.1 \
-    crate://crates.io/anstyle-wincon/3.0.4 \
-    crate://crates.io/anyhow/1.0.86 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/adler2/2.0.1 \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/anyhow/1.0.100 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bindgen/0.69.4 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/bytemuck/1.16.3 \
+    crate://crates.io/bindgen/0.72.1 \
+    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/bumpalo/3.19.0 \
+    crate://crates.io/bytemuck/1.24.0 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
+    crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.5.13 \
-    crate://crates.io/clap_builder/4.5.13 \
-    crate://crates.io/clap_lex/0.7.2 \
-    crate://crates.io/colorchoice/1.0.2 \
-    crate://crates.io/console/0.15.8 \
+    crate://crates.io/clap/4.5.52 \
+    crate://crates.io/clap_builder/4.5.52 \
+    crate://crates.io/clap_lex/0.7.6 \
+    crate://crates.io/colorchoice/1.0.4 \
+    crate://crates.io/compact_str/0.8.1 \
+    crate://crates.io/console/0.16.1 \
     crate://crates.io/crc32c/0.6.8 \
-    crate://crates.io/crc32fast/1.4.2 \
-    crate://crates.io/data-encoding/2.6.0 \
-    crate://crates.io/devicemapper/0.34.3 \
-    crate://crates.io/devicemapper-sys/0.3.0 \
+    crate://crates.io/crc32fast/1.5.0 \
+    crate://crates.io/darling/0.20.11 \
+    crate://crates.io/darling_core/0.20.11 \
+    crate://crates.io/darling_macro/0.20.11 \
+    crate://crates.io/data-encoding/2.9.0 \
+    crate://crates.io/devicemapper/0.34.5 \
+    crate://crates.io/devicemapper-sys/0.3.3 \
     crate://crates.io/downcast/0.11.0 \
-    crate://crates.io/duct/0.13.7 \
-    crate://crates.io/either/1.13.0 \
-    crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/env_filter/0.1.2 \
+    crate://crates.io/duct/1.1.1 \
+    crate://crates.io/either/1.15.0 \
+    crate://crates.io/encode_unicode/1.0.0 \
+    crate://crates.io/env_filter/0.1.4 \
     crate://crates.io/env_logger/0.8.4 \
-    crate://crates.io/env_logger/0.11.5 \
-    crate://crates.io/errno/0.3.9 \
+    crate://crates.io/env_logger/0.11.8 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
     crate://crates.io/exitcode/1.1.2 \
-    crate://crates.io/fastrand/2.1.0 \
-    crate://crates.io/fixedbitset/0.4.2 \
-    crate://crates.io/flate2/1.0.31 \
-    crate://crates.io/fragile/2.0.0 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/glob/0.3.1 \
-    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/fixedbitset/0.5.7 \
+    crate://crates.io/flate2/1.1.5 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/fragile/2.0.1 \
+    crate://crates.io/getrandom/0.2.16 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/heck/0.5.0 \
     crate://crates.io/hermit-abi/0.3.9 \
-    crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/indicatif/0.17.8 \
-    crate://crates.io/instant/0.1.13 \
+    crate://crates.io/hermit-abi/0.5.2 \
+    crate://crates.io/ident_case/1.0.1 \
+    crate://crates.io/indicatif/0.18.3 \
+    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/instability/0.3.9 \
+    crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/io-uring/0.7.11 \
     crate://crates.io/iovec/0.1.4 \
-    crate://crates.io/is_terminal_polyfill/1.70.1 \
-    crate://crates.io/itertools/0.12.1 \
-    crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.155 \
-    crate://crates.io/libloading/0.8.5 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/jiff/0.2.16 \
+    crate://crates.io/jiff-static/0.2.16 \
+    crate://crates.io/js-sys/0.3.82 \
+    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/libloading/0.8.9 \
+    crate://crates.io/libredox/0.1.10 \
     crate://crates.io/libudev-sys/0.1.4 \
-    crate://crates.io/linux-raw-sys/0.4.14 \
-    crate://crates.io/log/0.4.22 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/linux-raw-sys/0.11.0 \
+    crate://crates.io/log/0.4.28 \
+    crate://crates.io/lru/0.12.5 \
+    crate://crates.io/memchr/2.7.6 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.7.4 \
-    crate://crates.io/mockall/0.13.0 \
-    crate://crates.io/mockall_derive/0.13.0 \
-    crate://crates.io/nix/0.29.0 \
+    crate://crates.io/miniz_oxide/0.8.9 \
+    crate://crates.io/mockall/0.13.1 \
+    crate://crates.io/mockall_derive/0.13.1 \
+    crate://crates.io/nix/0.30.1 \
     crate://crates.io/nom/7.1.3 \
+    crate://crates.io/nom/8.0.0 \
     crate://crates.io/num-derive/0.4.2 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/num_cpus/1.16.0 \
-    crate://crates.io/number_prefix/0.4.0 \
-    crate://crates.io/numtoa/0.1.0 \
-    crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/os_pipe/1.2.1 \
-    crate://crates.io/pkg-config/0.3.30 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/ppv-lite86/0.2.20 \
-    crate://crates.io/predicates/3.1.2 \
-    crate://crates.io/predicates-core/1.0.8 \
-    crate://crates.io/predicates-tree/1.0.11 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/quick-xml/0.36.1 \
+    crate://crates.io/num_cpus/1.17.0 \
+    crate://crates.io/numtoa/0.2.4 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/os_pipe/1.2.3 \
+    crate://crates.io/paste/1.0.15 \
+    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/ppv-lite86/0.2.21 \
+    crate://crates.io/predicates/3.1.3 \
+    crate://crates.io/predicates-core/1.0.9 \
+    crate://crates.io/predicates-tree/1.0.12 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/quick-xml/0.38.4 \
     crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quickcheck_macros/1.0.0 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/quickcheck_macros/1.1.0 \
+    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand/0.9.2 \
+    crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rangemap/1.5.1 \
-    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/rand_core/0.9.3 \
+    crate://crates.io/rangemap/1.7.0 \
+    crate://crates.io/ratatui/0.29.0 \
+    crate://crates.io/redox_syscall/0.5.18 \
     crate://crates.io/redox_termios/0.1.3 \
-    crate://crates.io/regex/1.10.6 \
-    crate://crates.io/regex-automata/0.4.7 \
-    crate://crates.io/regex-syntax/0.8.4 \
-    crate://crates.io/retry/2.0.0 \
-    crate://crates.io/roaring/0.10.6 \
-    crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.38.34 \
-    crate://crates.io/safemem/0.3.3 \
-    crate://crates.io/semver/1.0.23 \
-    crate://crates.io/serde/1.0.204 \
-    crate://crates.io/serde_derive/1.0.204 \
-    crate://crates.io/shared_child/1.0.1 \
+    crate://crates.io/regex/1.12.2 \
+    crate://crates.io/regex-automata/0.4.13 \
+    crate://crates.io/regex-syntax/0.8.8 \
+    crate://crates.io/retry/2.1.0 \
+    crate://crates.io/roaring/0.11.2 \
+    crate://crates.io/rustc-hash/2.1.1 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rustix/1.1.2 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/semver/1.0.27 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/shared_child/1.1.1 \
+    crate://crates.io/shared_thread/0.2.0 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/sigchld/0.2.4 \
+    crate://crates.io/signal-hook/0.3.18 \
+    crate://crates.io/signal-hook-registry/1.4.6 \
+    crate://crates.io/simd-adler32/0.3.7 \
+    crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.72 \
-    crate://crates.io/tempfile/3.11.0 \
-    crate://crates.io/termion/1.5.6 \
-    crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/thiserror/1.0.63 \
-    crate://crates.io/thiserror-impl/1.0.63 \
-    crate://crates.io/threadpool/1.8.1 \
-    crate://crates.io/tui/0.19.0 \
-    crate://crates.io/udev/0.7.0 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-segmentation/1.11.0 \
-    crate://crates.io/unicode-width/0.1.13 \
+    crate://crates.io/strum/0.26.3 \
+    crate://crates.io/strum_macros/0.26.4 \
+    crate://crates.io/syn/2.0.110 \
+    crate://crates.io/tempfile/3.23.0 \
+    crate://crates.io/termion/4.0.5 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/2.0.17 \
+    crate://crates.io/thiserror-impl/2.0.17 \
+    crate://crates.io/udev/0.9.3 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unicode-segmentation/1.12.0 \
+    crate://crates.io/unicode-truncate/1.1.0 \
+    crate://crates.io/unicode-width/0.1.14 \
+    crate://crates.io/unicode-width/0.2.0 \
+    crate://crates.io/unit-prefix/0.5.2 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.59.0 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/zerocopy/0.7.35 \
-    crate://crates.io/zerocopy-derive/0.7.35 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.105 \
+    crate://crates.io/wasm-bindgen-macro/0.2.105 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.105 \
+    crate://crates.io/wasm-bindgen-shared/0.2.105 \
+    crate://crates.io/web-time/1.1.0 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
+    crate://crates.io/wit-bindgen/0.46.0 \
+    crate://crates.io/zerocopy/0.8.27 \
+    crate://crates.io/zerocopy-derive/0.8.27 \
 "
=20
-SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcbb815=
e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238d2=
df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[anstream-0.6.15.sha256sum] =3D "64e15c1ab1f89faffbf04a634d5e1962e9=
074f2741eef6d97f3c4e322426d526"
-SRC_URI[anstyle-1.0.8.sha256sum] =3D "1bec1de6f59aedf83baf9ff929c98f2ad654=
b97c9510f4e70cf6f661d49fd5b1"
-SRC_URI[anstyle-parse-0.2.5.sha256sum] =3D "eb47de1e80c2b463c735db5b217a0d=
dc39d612e7ac9e2e96a5aed1f57616c1cb"
-SRC_URI[anstyle-query-1.1.1.sha256sum] =3D "6d36fc52c7f6c869915e99412912f2=
2093507da8d9e942ceaf66fe4b7c14422a"
-SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D "5bf74e1b6e971609db8ca7a9ce79f=
d5768ab6ae46441c572e46cf596f59e57f8"
-SRC_URI[anyhow-1.0.86.sha256sum] =3D "b3d1d046238990b9cf5bcde22a3fb3584ee5=
cf65fb2765f454ed428c7a0063da"
-SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37e9=
3092cbf377614828a319d5fee8"
-SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce1b=
7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174d0e0=
6250625266f50fe6898340abefa"
+SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a5308=
ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f1186f92=
494becacb047c7b6bf616c96772180fef923"
+SRC_URI[anstream-0.6.21.sha256sum] =3D "43d5b281e737544384e969a5ccad3f1cdd=
24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.13.sha256sum] =3D "5192cca8006f1fd4f7237516f40fa183bb0=
7f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234ef1=
0eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099abc=
a73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
+SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b424b2=
c83db5eb3a0fead4a6c0809af6e61"
+SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bindgen-0.69.4.sha256sum] =3D "a00dc851838a2120612785d195287475a3a=
c45514741da670b735818822129a0"
-SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e156aec=
7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[bytemuck-1.16.3.sha256sum] =3D "102087e286b4677862ea56cf8fc58bb2cd=
fa8725c40ffb80fe3a008eb7f2fc83"
+SRC_URI[bindgen-0.72.1.sha256sum] =3D "993776b509cfb49c750f11b8f07a46fa23e=
0a1386ffc01fb1e7d343efc387895"
+SRC_URI[bitflags-2.10.0.sha256sum] =3D "812e12b5285cc515a9c72a5c1d3b6d46a1=
9dac5acfef5265968c166106e31dd3"
+SRC_URI[bumpalo-3.19.0.sha256sum] =3D "46c5e41b57b8bba42a04676d81cb89e9ee8=
e859a1a66f80a5a72e1cb76b34d43"
+SRC_URI[bytemuck-1.24.0.sha256sum] =3D "1fbdf580320f38b612e485521afda1ee26=
d10cc9884efaaa750d383e13e3c5f4"
 SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf35=
3beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] =3D "df8670b8c7b9dae1793364eafadf7239c4=
0d669904660c5960d74cfd80b46a53"
+SRC_URI[castaway-0.2.4.sha256sum] =3D "dec551ab6e7578819132c713a93c022a05d=
60159dc86e7a7050223577484c55a"
 SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb6299=
00026402633ae9160df93a8766"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb082=
c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd619=
ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.5.13.sha256sum] =3D "0fbb260a053428790f3de475e304ff84cdbc4f=
ace759ea7a3e64c1edd938a7fc"
-SRC_URI[clap_builder-4.5.13.sha256sum] =3D "64b17d7ea74e9f833c7dbf2cbe4fb1=
2ff26783eda4782a8975b72f895c9b4d99"
-SRC_URI[clap_lex-0.7.2.sha256sum] =3D "1462739cb27611015575c0c11df5df76011=
41071f07518d56fcc1be504cbec97"
-SRC_URI[colorchoice-1.0.2.sha256sum] =3D "d3fd119d74b830634cea2a0f58bbd0d5=
4540518a14397557951e79340abc28c0"
-SRC_URI[console-0.15.8.sha256sum] =3D "0e1f83fc076bd6dd27517eacdf25fef6c4d=
fe5f1d7448bafaaf3a26f13b5e4eb"
+SRC_URI[clap-4.5.52.sha256sum] =3D "aa8120877db0e5c011242f96806ce3c94e0737=
ab8108532a76a3300a01db2ab8"
+SRC_URI[clap_builder-4.5.52.sha256sum] =3D "02576b399397b659c26064fbc92a75=
fede9d18ffd5f80ca1cd74ddab167016e1"
+SRC_URI[clap_lex-0.7.6.sha256sum] =3D "a1d728cc89cf3aee9ff92b05e62b19ee65a=
02b5702cff7d5a377e32c6ae29d8d"
+SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d984=
5d13888356391624cbe7e41efeac1e75"
+SRC_URI[compact_str-0.8.1.sha256sum] =3D "3b79c4069c6cad78e2e0cdfcbd262757=
70669fb39fd308a752dc110e83b9af32"
+SRC_URI[console-0.16.1.sha256sum] =3D "b430743a6eb14e9764d4260d4c0d8123087=
d504eeb9c48f2b2a5e810dd369df4"
 SRC_URI[crc32c-0.6.8.sha256sum] =3D "3a47af21622d091a8f0fb295b88bc886ac74e=
fcc613efc19f5d0b21de5c89e47"
-SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d138150169a27=
58b5ef3eb191a9ee688de3e23ef7b3"
-SRC_URI[data-encoding-2.6.0.sha256sum] =3D "e8566979429cf69b49a5c740c60791=
108e86440e8be149bbea4fe54d2c32d6e2"
-SRC_URI[devicemapper-0.34.3.sha256sum] =3D "59209790c5d189070a529375819509=
47207e740fadc87f68af14f34d0eb333df"
-SRC_URI[devicemapper-sys-0.3.0.sha256sum] =3D "3d6681f5413e2094480381a97b8=
299f548c0579f07095ee20fe58e0a28cb34b5"
+SRC_URI[crc32fast-1.5.0.sha256sum] =3D "9481c1c90cbf2ac953f07c8d4a58aa3945=
c425b7185c9154d67a65e4230da511"
+SRC_URI[darling-0.20.11.sha256sum] =3D "fc7f46116c46ff9ab3eb1597a45688b671=
5c6e628b5c133e288e709a29bcb4ee"
+SRC_URI[darling_core-0.20.11.sha256sum] =3D "0d00b9596d185e565c2207a0b01f8=
bd1a135483d02d9b7b0a54b11da8d53412e"
+SRC_URI[darling_macro-0.20.11.sha256sum] =3D "fc34b93ccb385b40dc71c6fceac4=
b2ad23662c7eeb248cf10d529b7e055b6ead"
+SRC_URI[data-encoding-2.9.0.sha256sum] =3D "2a2330da5de22e8a3cb63252ce2abb=
30116bf5265e89c0e01bc17015ce30a476"
+SRC_URI[devicemapper-0.34.5.sha256sum] =3D "f8ca2baf05e507adafc3524fb687aa=
15f2f9953de808c6a4cbd57a7f2e5aa883"
+SRC_URI[devicemapper-sys-0.3.3.sha256sum] =3D "06421aaad10b53bd5d1fe004c26=
efddfaaeaa4438ff52b84a0f660b3c87d63e6"
 SRC_URI[downcast-0.11.0.sha256sum] =3D "1435fa1053d8b2fbbe9be7e97eca7f33d3=
7b28409959813daefc1446a14247f1"
-SRC_URI[duct-0.13.7.sha256sum] =3D "e4ab5718d1224b63252cd0c6f74f6480f9ffeb=
117438a2e0f5cf6d9a4798929c"
-SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7c4=
894bfe9cd9bda4fbb4bc7c0d4cf0"
-SRC_URI[encode_unicode-0.3.6.sha256sum] =3D "a357d28ed41a50f9c765dbfe56cbc=
04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[env_filter-0.1.2.sha256sum] =3D "4f2c92ceda6ceec50f43169f9ee8424fe=
2db276791afde7b2cd8bc084cb376ab"
+SRC_URI[duct-1.1.1.sha256sum] =3D "7e66e9c0c03d094e1a0ba1be130b849034aa80c=
3a2ab8ee94316bc809f3fa684"
+SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5ede0e46177b7add2e67155f70=
e33c07fea8284df6576da70b3719"
+SRC_URI[encode_unicode-1.0.0.sha256sum] =3D "34aa73646ffb006b8f5147f3dc182=
bd4bcb190227ce861fc4a4844bf8e3cb2c0"
+SRC_URI[env_filter-0.1.4.sha256sum] =3D "1bf3c259d255ca70051b30e2e95b5446c=
db8949ac4cd22c0d7fd634d89f568e2"
 SRC_URI[env_logger-0.8.4.sha256sum] =3D "a19187fea3ac7e84da7dacf48de0c45d6=
3c6a76f9490dae389aead16c243fce3"
-SRC_URI[env_logger-0.11.5.sha256sum] =3D "e13fa619b91fb2381732789fc5de83b4=
5675e882f66623b7d8cb4f643017018d"
-SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257cf92=
f22b38f6bc0c58d59108a820ba"
+SRC_URI[env_logger-0.11.8.sha256sum] =3D "13c863f0904021b108aa8b2f55046443=
e6b1ebde8fd4a15c399893aae4fa069f"
+SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
 SRC_URI[exitcode-1.1.2.sha256sum] =3D "de853764b47027c2e862a995c34978ffa63=
c1501f2e15f987ba11bd4f9bba193"
-SRC_URI[fastrand-2.1.0.sha256sum] =3D "9fc0510504f03c51ada170672ac806f1f10=
5a88aa97a5281117e1ddc3368e51a"
-SRC_URI[fixedbitset-0.4.2.sha256sum] =3D "0ce7134b9999ecaf8bcd65542e436736=
ef32ddca1b3e06094cb6ec5755203b80"
-SRC_URI[flate2-1.0.31.sha256sum] =3D "7f211bbe8e69bbd0cfdea405084f128ae8b4=
aaa6b0b522fc8f2b009084797920"
-SRC_URI[fragile-2.0.0.sha256sum] =3D "6c2141d6d6c8512188a7891b4b01590a45f6=
dac67afb4f255c4124dbb86d4eaa"
-SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c38da=
3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b656=
93ce38287d856d1674551ec9b"
-SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242dadb=
b39557df889310ac77c5d99100aaac33"
+SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f2f=
f062c9e95845c43a6c9c0355411be"
+SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df0792=
7c6d4aa5b027d7da16ba32d1d21ecd99"
+SRC_URI[flate2-1.1.5.sha256sum] =3D "bfe33edd8e85a12a67454e37f8c75e730830d=
83e313556ab9ebf9ee7fbeb3bfb"
+SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2da=
24a9afd88aca000531ab82c1"
+SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40b3=
9fe946cbe4c263c7209467bc83af2"
+SRC_URI[fragile-2.0.1.sha256sum] =3D "28dd6caf6059519a65843af8fe2a3ae298b1=
4b80179855aeb4adc2c1934ee619"
+SRC_URI[getrandom-0.2.16.sha256sum] =3D "335ff9f135e4384c8150d6f27c6daed43=
3577f86b4750418338c01a1a2528592"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b4136a=
8bc82338574f23baf47bbd280"
+SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
 SRC_URI[hermit-abi-0.3.9.sha256sum] =3D "d231dfb89cfffdbc30e7fc41579ed6066=
ad03abda9e567ccafae602b97ec5024"
-SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761daec=
841b97f947d34394601737a7bba5e4"
-SRC_URI[indicatif-0.17.8.sha256sum] =3D "763a5a8f45087d6bcea4222e7b72c291a=
054edf80e4ef6efd2a4979878c7bea3"
-SRC_URI[instant-0.1.13.sha256sum] =3D "e0242819d153cba4b4b05a5a8f2a7e9bbf9=
7b6055b2a002b395c96b5ff3c0222"
+SRC_URI[hermit-abi-0.5.2.sha256sum] =3D "fc0fef456e4baa96da950455cd02c081c=
a953b141298e41db3fc7e36b1da849c"
+SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc50660321d12=
159025e767c18e043daf26b70104c39"
+SRC_URI[indicatif-0.18.3.sha256sum] =3D "9375e112e4b463ec1b1c6c011953545c6=
5a30164fbab5b581df32b3abf0dcb88"
+SRC_URI[indoc-2.0.7.sha256sum] =3D "79cf5c93f93228cf8efb3ba362535fb11199ac=
548a09ce117c9b1adc3030d706"
+SRC_URI[instability-0.3.9.sha256sum] =3D "435d80800b936787d62688c927b6490e=
887c7ef5ff9ce922c6c6050fca75eb9a"
+SRC_URI[io-lifetimes-1.0.11.sha256sum] =3D "eae7b9aee968036d54dce06cebaefd=
919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[io-uring-0.7.11.sha256sum] =3D "fdd7bddefd0a8833b88a4b68f90dae22c7=
450d11b354198baee3874fd811b344"
 SRC_URI[iovec-0.1.4.sha256sum] =3D "b2b3ea6ff95e175473f8ffe6a7eb7c00d05424=
0321b84c57051175fe3c1e075e"
-SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25b2=
e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
-SRC_URI[itertools-0.12.1.sha256sum] =3D "ba291022dbbd398a455acf126c1e34195=
4079855bc60dfdda641363bd6922569"
-SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
-SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb564301=
3d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f47=
82c53886191b2f693f24761847c"
-SRC_URI[libloading-0.8.5.sha256sum] =3D "4979f22fdb869068da03c9f7528f8297c=
6fd2606bc3a4affe42e6a823fdb8da4"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33f2=
d6c088194d9f922fb8318faf1f01186"
+SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccefe71f=
97f96e50151fb991f267928e2c"
+SRC_URI[jiff-0.2.16.sha256sum] =3D "49cce2b81f2098e7e3efc35bc2e0a6b7abec9d=
34128283d7a26fa8f32a6dbb35"
+SRC_URI[jiff-static-0.2.16.sha256sum] =3D "980af8b43c3ad5d8d349ace167ec817=
0839f753a42d233ba19e08afe1850fa69"
+SRC_URI[js-sys-0.3.82.sha256sum] =3D "b011eec8cc36da2aab2d5cff675ec18454fa=
d408585853910a202391cf9f8e65"
+SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a53b80=
2102b528163885171cf92b15976"
+SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79a6=
ef5bb2fc834d6e9058e89c825efdc55"
+SRC_URI[libredox-0.1.10.sha256sum] =3D "416f7e718bdb06000964960ffa43b4335a=
d4012ae8b99060261aa4a8088d5ccb"
 SRC_URI[libudev-sys-0.1.4.sha256sum] =3D "3c8469b4a23b962c1396b9b451dda50e=
f5b283e8dd309d69033475fa9b334324"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f2757=
ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c=
54bba33a7f72f873a39d07b24"
-SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c18c=
f2f87ec19a575a0abdce112e3a3"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D "df1d3c3b53da64cf5760482273a98=
e575c651a67eec7f77df96b5b642de8f039"
+SRC_URI[log-0.4.28.sha256sum] =3D "34080505efa8e45a4b816c349525ebe327ceaa8=
559756f0356cba97ef3bf7432"
+SRC_URI[lru-0.12.5.sha256sum] =3D "234cf4f4a04dc1f57e24b96cc0cd600cf2af460=
d4161ac5ecdd0af8e1f3b2a38"
+SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc86238e16=
5017a493d1d5c8eac6bdc4cc273"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.7.4.sha256sum] =3D "b8a240ddb74feaf34a79a7add65a741f=
3167852fba007066dcac1ca548d89c08"
-SRC_URI[mockall-0.13.0.sha256sum] =3D "d4c28b3fb6d753d28c20e826cd46ee611fd=
a1cf3cde03a443a974043247c065a"
-SRC_URI[mockall_derive-0.13.0.sha256sum] =3D "341014e7f530314e9a1fdbc7400b=
244efea7122662c96bfa248c31da5bfb2020"
-SRC_URI[nix-0.29.0.sha256sum] =3D "71e2746dc3a24dd78b3cfcb7be93368c6de9963=
d30f43a6a73998a9cf4b17b46"
+SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d63=
269ce38518b83cb0575fca855ebb6316"
+SRC_URI[mockall-0.13.1.sha256sum] =3D "39a6bfcc6c8c7eed5ee98b9c3e33adc7260=
54389233e201c95dab2d41a3839d2"
+SRC_URI[mockall_derive-0.13.1.sha256sum] =3D "25ca3004c2efe9011bd4e461bd82=
56445052b9615405b4f7ea43fc8ca5c20898"
+SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba87a1d978330aef40f67b030=
4ac79c1c00b294c9830543db6"
 SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
+SRC_URI[nom-8.0.0.sha256sum] =3D "df9761775871bdef83bee530e60050f7e54b1105=
350d6884eb0fb4f46c2f9405"
 SRC_URI[num-derive-0.4.2.sha256sum] =3D "ed3955f1a9c7c0c15e092f9c887db08b1=
fc683305fdf6eb6684f22555355e202"
 SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72ad=
0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[num_cpus-1.16.0.sha256sum] =3D "4161fcb6d602d4d2081af7c3a45852d875=
a03dd337a6bfdd6e06407b61342a43"
-SRC_URI[number_prefix-0.4.0.sha256sum] =3D "830b246a0e5f20af87141b25c173cd=
1b609bd7779a4617d6ec582abaf90870f3"
-SRC_URI[numtoa-0.1.0.sha256sum] =3D "b8f8bdf33df195859076e54ab11ee78a1b208=
382d3a26ec40d142ffc1ecc49ef"
-SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c24=
38859caa136dec86c26fdd2efe17b92"
-SRC_URI[os_pipe-1.2.1.sha256sum] =3D "5ffd2b0a5634335b135d5728d84c5e0fd726=
954b87111f7506a61c502280d982"
-SRC_URI[pkg-config-0.3.30.sha256sum] =3D "d231b230927b5e4ad203db57bbcbee28=
02f6bce620b1e4a9024a07d94e2907ec"
-SRC_URI[portable-atomic-1.11.0.sha256sum] =3D "350e9b48cbc6b0e028b0473b114=
454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[ppv-lite86-0.2.20.sha256sum] =3D "77957b295656769bb8ad2b6a6b09d897=
d94f05c41b069aede1fcdaa675eaea04"
-SRC_URI[predicates-3.1.2.sha256sum] =3D "7e9086cc7640c29a356d1a29fd134380b=
ee9d8f79a17410aa76e7ad295f42c97"
-SRC_URI[predicates-core-1.0.8.sha256sum] =3D "ae8177bee8e75d6846599c6b9ff6=
79ed51e882816914eec639944d7c9aa11931"
-SRC_URI[predicates-tree-1.0.11.sha256sum] =3D "41b740d195ed3166cd147c8047e=
c98db0e22ec019eb8eeb76d343b795304fb13"
-SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd23801574=
4736151d4445ec0836b8e628aae103b77"
-SRC_URI[quick-xml-0.36.1.sha256sum] =3D "96a05e2e8efddfa51a84ca47cec303fac=
86c8541b686d37cac5efc0e094417bc"
+SRC_URI[num_cpus-1.17.0.sha256sum] =3D "91df4bbde75afed763b708b7eee1e8e765=
1e02d97f6d5dd763e89367e957b23b"
+SRC_URI[numtoa-0.2.4.sha256sum] =3D "6aa2c4e539b869820a2b82e1aef6ff40aa85e=
65decdd5185e83fb4b1249cd00f"
+SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a7164=
82c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D "384b8ab6d37215f3c5301a95=
a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[os_pipe-1.2.3.sha256sum] =3D "7d8fae84b431384b68627d0f9b3b1245fcf9=
f46f6c0e3dc902e9dce64edd1967"
+SRC_URI[paste-1.0.15.sha256sum] =3D "57c0d7b74b563b49d38dae00a0c37d4d6de9b=
432382b2892f0574ddcae73fd0a"
+SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c704c=
14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[portable-atomic-1.11.1.sha256sum] =3D "f84267b20a16ea918e43c6a8843=
3c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a709ca=
f78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
+SRC_URI[predicates-3.1.3.sha256sum] =3D "a5d19ee57562043d37e82899fade9a22e=
bab7be9cef5026b07fda9cdd4293573"
+SRC_URI[predicates-core-1.0.9.sha256sum] =3D "727e462b119fe9c93fd0eb1429a5=
f7647394014cf3c04ab2c0350eeb09095ffa"
+SRC_URI[predicates-tree-1.0.12.sha256sum] =3D "72dd2d6d381dfb73a193c7fca53=
6518d7caee39fc8503f74e7dc0be0531b425c"
+SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9ecccb=
fe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro2-1.0.103.sha256sum] =3D "5ee95bc4ef87b8d5ba32e8b7714ccc=
834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[quick-xml-0.38.4.sha256sum] =3D "b66c2058c55a409d601666cffe35f0433=
3cf1013010882cec174a7467cd4e21c"
 SRC_URI[quickcheck-1.0.3.sha256sum] =3D "588f6378e4dd99458b60ec275b4477add=
41ce4fa9f64dcba6f15adccb19b50d6"
-SRC_URI[quickcheck_macros-1.0.0.sha256sum] =3D "b22a693222d716a9587786f37a=
c3f6b4faedb5b80c23914e7303ff5a1d8016e9"
-SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3ab=
723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[quickcheck_macros-1.1.0.sha256sum] =3D "f71ee38b42f8459a88d3362be6=
f9b841ad2d5421844f61eb1c59c11bff3ac14a"
+SRC_URI[quote-1.0.42.sha256sum] =3D "a338cc41d27e6cc6dce6cefc13a0729dfbb81=
c262b1f519331575dd80ef3067f"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f0a=
8b57c39049bef581b46327404"
-SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d4d=
4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand-0.9.2.sha256sum] =3D "6db2770f06117d490610c7488547d543617b21b=
fa07796d7a12f6f1bd53850d1"
+SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac9b=
afc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rangemap-1.5.1.sha256sum] =3D "f60fcc7d6849342eff22c4350c8b9a989ee=
8ceabc4b481253e8946b9fe83d684"
-SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d5901215560=
3f0b22ad30cad752600aadfcb695265519a"
+SRC_URI[rand_core-0.9.3.sha256sum] =3D "99d9a13982dcf210057a8a78572b2217b6=
67c3beacbf3a0d8b454f6f82837d38"
+SRC_URI[rangemap-1.7.0.sha256sum] =3D "acbbbbea733ec66275512d0b9694f34102e=
7d5406fdbe2ad8d21b28dce92887c"
+SRC_URI[ratatui-0.29.0.sha256sum] =3D "eabd94c2f37801c20583fc49dd5cd6b0ba6=
8c716787c2dd6ed18571e1e63117b"
+SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3f9=
38979645c44812fbfcda098faae3f1a362d"
 SRC_URI[redox_termios-0.1.3.sha256sum] =3D "20145670ba436b55d91fc92d25e711=
60fbfbdd57831631c8d7d36377a476f1cb"
-SRC_URI[regex-1.10.6.sha256sum] =3D "4219d74c6b67a3654a9fbebc4b419e22126d1=
3d2f3c4a07ee0cb61ff79a79619"
-SRC_URI[regex-automata-0.4.7.sha256sum] =3D "38caf58cc5ef2fed281f89292ef23=
f6365465ed9a41b7a7754eb4e26496c92df"
-SRC_URI[regex-syntax-0.8.4.sha256sum] =3D "7a66a03ae7c801facd77a29370b4fae=
c201768915ac14a721ba36f20bc9c209b"
-SRC_URI[retry-2.0.0.sha256sum] =3D "9166d72162de3575f950507683fac47e30f6f2=
c3836b71b7fbc61aa517c9c5f4"
-SRC_URI[roaring-0.10.6.sha256sum] =3D "8f4b84ba6e838ceb47b41de5194a60244fa=
c43d9fe03b71dbe8c5a201081d6d1"
-SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a7982047c=
3426db949b1424bc4b7ec9ae12c6ce2"
-SRC_URI[rustc_version-0.4.0.sha256sum] =3D "bfa0f585226d2e68097d4f95d113b1=
5b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc9873a=
06d45debb38b329f8541d85c2730f"
-SRC_URI[safemem-0.3.3.sha256sum] =3D "ef703b7cb59335eae2eb93ceb664c0eb7ea6=
bf567079d843e09420219668e072"
-SRC_URI[semver-1.0.23.sha256sum] =3D "61697e0a1c7e512e84a621326239844a24d8=
207b4669b41bc18b32ea5cbf988b"
-SRC_URI[serde-1.0.204.sha256sum] =3D "bc76f558e0cbb2a839d37354c575f1dc3fdc=
6546b5be373ba43d95f231bf7c12"
-SRC_URI[serde_derive-1.0.204.sha256sum] =3D "e0cd7e117be63d3c3678776753929=
474f3b04a43a080c744d6b0ae2a8c28e222"
-SRC_URI[shared_child-1.0.1.sha256sum] =3D "09fa9338aed9a1df411814a5b2252f7=
cd206c55ae9bf2fa763f8de84603aa60c"
+SRC_URI[regex-1.12.2.sha256sum] =3D "843bc0191f75f3e22651ae5f1e72939ab2f72=
a4bc30fa80a066bd66edefc24d4"
+SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3dbb9=
38e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f5353c05=
35c1f58eec5336fdfcf626430af7def58"
+SRC_URI[retry-2.1.0.sha256sum] =3D "a1e211f878258887b3e65dd3c8ff9f530fe109=
f441a117ee0cdc27f341355032"
+SRC_URI[roaring-0.11.2.sha256sum] =3D "f08d6a905edb32d74a5d5737a0c9d7e950c=
312f3c46cb0ca0a2ca09ea11878a0"
+SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91eabb1b=
663f07c4c084095e60cbed4362dff0d"
+SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rustix-1.1.2.sha256sum] =3D "cd15f8a2c5551a84d56efdc1cd049089e409a=
c19a3072d5037a17fd70719ff3e"
+SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
+SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5dd4b=
c44d8bb0c1c632c8d6829481f"
+SRC_URI[semver-1.0.27.sha256sum] =3D "d767eb0aabc880b29956c35734170f26ed55=
1a859dbd361d140cdbeca61ab1e2"
+SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a9143618=
0c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c3983=
b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab66=
608367b6574e925011a9353e4badda91d79"
+SRC_URI[shared_child-1.1.1.sha256sum] =3D "1e362d9935bc50f019969e2f9ecd667=
86612daae13e8f277be7bfb66e8bed3f7"
+SRC_URI[shared_thread-0.2.0.sha256sum] =3D "52b86057fcb5423f5018e331ac0462=
3e32d6b5ce85e33300f92c79a1973928b0"
 SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
+SRC_URI[sigchld-0.2.4.sha256sum] =3D "47106eded3c154e70176fc83df9737335c94=
ce22f821c32d17ed1db1f83badb1"
+SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd82cb3=
3429027e42122b169753d6ef1085ed6e2"
+SRC_URI[signal-hook-registry-1.4.6.sha256sum] =3D "b2a4719bff48cee6b39d12c=
020eeb490953ad2443b7055bd0b21fca26bd8c28b"
+SRC_URI[simd-adler32-0.3.7.sha256sum] =3D "d66dc143e6b11c1eddc06d5c423cfc9=
7062865baf299914ab64caa38182078fe"
+SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140eb=
1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.72.sha256sum] =3D "dc4b9b9bf2add8093d3f2c0204471e951b22855=
80335de42f9d2534f3ae7a8af"
-SRC_URI[tempfile-3.11.0.sha256sum] =3D "b8fcd239983515c23a32fb82099f97d0b1=
1b8c72f654ed659363a95c3dad7a53"
-SRC_URI[termion-1.5.6.sha256sum] =3D "077185e2eac69c3f8379a4298e1e07cd36be=
b962290d4a51199acf0fdc10607e"
-SRC_URI[termtree-0.4.1.sha256sum] =3D "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6=
b89c765749064ba298f2c68a16a76"
-SRC_URI[thiserror-1.0.63.sha256sum] =3D "c0342370b38b6a11b6cc11d6a80556995=
8d54cfa061a29969c3b5ce2ea405724"
-SRC_URI[thiserror-impl-1.0.63.sha256sum] =3D "a4558b58466b9ad7ca0f102865ec=
cc95938dca1a74a856f2b57b6629050da261"
-SRC_URI[threadpool-1.8.1.sha256sum] =3D "d050e60b33d41c19108b32cea32164033=
a9013fe3b46cbd4457559bfbf77afaa"
-SRC_URI[tui-0.19.0.sha256sum] =3D "ccdd26cbd674007e649a272da4475fb666d3aa0=
ad0531da7136db6fab0e5bad1"
-SRC_URI[udev-0.7.0.sha256sum] =3D "4ebdbbd670373442a12fe9ef7aeb53aec4147a5=
a27a00bbc3ab639f08f48191a"
-SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db53683=
adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-segmentation-1.11.0.sha256sum] =3D "d4c87d22b6e3f4a18d4d40=
ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
-SRC_URI[unicode-width-0.1.13.sha256sum] =3D "0336d538f7abc86d282a4189614df=
aa90810dfc2c6f6427eaf88e16311dd225d"
+SRC_URI[strum-0.26.3.sha256sum] =3D "8fec0f0aef304996cf250b31b5a10dee7980c=
85da9d759361292b8bca5a18f06"
+SRC_URI[strum_macros-0.26.4.sha256sum] =3D "4c6bee85a5a24955dc440386795aa3=
78cd9cf82acd5f764469152d2270e581be"
+SRC_URI[syn-2.0.110.sha256sum] =3D "a99801b5bd34ede4cf3fc688c5919368fea4e4=
814a4664359503e6015b280aea"
+SRC_URI[tempfile-3.23.0.sha256sum] =3D "2d31c77bdf42a745371d260a26ca7163f1=
e0924b64afa0b688e61b5a9fa02f16"
+SRC_URI[termion-4.0.5.sha256sum] =3D "3669a69de26799d6321a5aa713f55f7e2cd3=
7bd47be044b50f2acafc42c122bb"
+SRC_URI[termtree-0.5.1.sha256sum] =3D "8f50febec83f5ee1df3015341d8bd429f2d=
1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-2.0.17.sha256sum] =3D "f63587ca0f12b72a0600bcba1d40081f8=
30876000bb46dd2337a3051618f4fc8"
+SRC_URI[thiserror-impl-2.0.17.sha256sum] =3D "3ff15c8ecd7de3849db632e14d18=
d2571fa09dfc5ed93479bc4485c7a517c913"
+SRC_URI[udev-0.9.3.sha256sum] =3D "af4e37e9ea4401fc841ff54b9ddfc9be1079b1e=
89434c1a6a865dd68980f7e9f"
+SRC_URI[unicode-ident-1.0.22.sha256sum] =3D "9312f7c4f6ff9069b165498234ce8=
be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unicode-segmentation-1.12.0.sha256sum] =3D "f6ccf251212114b54433ec=
949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+SRC_URI[unicode-truncate-1.1.0.sha256sum] =3D "b3644627a5af5fa321c95b9b235=
a72fd24cd29c648c2c379431e6628655627bf"
+SRC_URI[unicode-width-0.1.14.sha256sum] =3D "7dd6e30e90baa6f72411720665d41=
d89b9a3d039dc45b8faea1ddd07f617f6af"
+SRC_URI[unicode-width-0.2.0.sha256sum] =3D "1fc81956842c57dac11422a97c3b81=
95a1ff727f06e85c84ed2e8aa277c9a0fd"
+SRC_URI[unit-prefix-0.5.2.sha256sum] =3D "81e544489bf3d8ef66c953931f56617f=
423cd4b5494be343d9b9d3dda037b9a3"
 SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a3b=
4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d057c=
1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3f9=
beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c39b=
32a1776bbe92e5bef1f0bf1f8c531853b"
-SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[zerocopy-0.7.35.sha256sum] =3D "1b9b4fd18abc82b8136838da5d50bae7bd=
ea537c574d8dc1a34ed098d6c166f0"
-SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D "fa4f8080344d4671fb4e831a13a=
d1e68092748387dfc4f55e356242fae12ce3e"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c345a1=
882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wasm-bindgen-0.2.105.sha256sum] =3D "da95793dfc411fbbd93f5be7715b0=
578ec61fe87cb1a42b12eb625caa5c5ea60"
+SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] =3D "04264334509e04a7bf8690f=
2384ef5265f05143a4bff3889ab7a3269adab59c2"
+SRC_URI[wasm-bindgen-macro-support-0.2.105.sha256sum] =3D "420bc339d9f322e=
562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc"
+SRC_URI[wasm-bindgen-shared-0.2.105.sha256sum] =3D "76f218a38c84bcb33c25ec=
7059b07847d465ce0e0a76b995e134a45adcb6af76"
+SRC_URI[web-time-1.1.0.sha256sum] =3D "5a6580f308b1fad9207618087a65c04e7a1=
0bc77e02c8e84e9b00dd4b12fa0bb"
+SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa9163b=
c891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806bc1=
ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d39e3=
a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c096456=
083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.53.5.sha256sum] =3D "4945f9f551b88e0d65f3db0bc25=
c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf9987a=
4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] =3D "a9d8416fa8b42f5c947=
f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f06=
90a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] =3D "b9d782e804c2f632e39570=
8e99a94275910eb9100b2114651e04744e9b125006"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef72200b=
9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] =3D "960e6da069d81e09becb0ca57a=
65220ddff016ff2d6af6a223cf372a506593a3"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] =3D "fa7359d10048f68ab8b09f=
a71c3daccfb0e9b559aed648a8f95469c27057180c"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c52358=
0f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] =3D "1e7ac75179f18232fe9c28516=
3565a57ef8d3c89254a30685b57d83a38d326c2"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fddf=
1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] =3D "9c3842cdd74a865a8066ab39=
c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5bab=
768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D "0ffa179e2d07eee8ad8f=
57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b73=
89a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D "d6bbff5f0aada427a1e5a6d=
a5f1f98158182f26556f345ac9e04d36d0ebed650"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de764d=
abcc06133f7f1d55dce5cdc070ad7fe59"
+SRC_URI[zerocopy-0.8.27.sha256sum] =3D "0894878a5fa3edfd6da3f88c4805f4c855=
8e2b996227a3d864f47fe11e38282c"
+SRC_URI[zerocopy-derive-0.8.27.sha256sum] =3D "88d2b8d9c68ad2b9e4340d78327=
16a4d21a22a1154777ad56ea55c51a9cf3831"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools-git-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/=
thin-provisioning-tools-git-crates.inc
deleted file mode 100644
index ceea67c364..0000000000
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls-git-crates.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI +=3D "\
-    git://github.com/jthornber/rio;protocol=3Dhttps;nobranch=3D1;name=3Dri=
o;destsuffix=3Drio;type=3Dgit-dependency \
-"
-
-SRCREV_FORMAT .=3D "_rio"
-SRCREV_rio =3D "2979a720f671e836302c01546f9cc9f7988610c8"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b=
/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/00=
01-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
deleted file mode 100644
index ed5f40a881..0000000000
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 11c494b418570a3fbdfbbbdfbbc4db0108743cc7 Mon Sep 17 00:00:00 2001
-From: Dan Gohman <dev@sunfishcode.online>
-Date: Sun, 6 Apr 2025 05:22:49 -0700
-Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
-
-Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
-riscv32gc-unknown-linux-gnu.
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/linu=
x_like/linux/arch/generic/mod.rs
-index 2f437e1..db1f1e7 100644
---- a/src/unix/linux_like/linux/arch/generic/mod.rs
-+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
-@@ -114,6 +114,7 @@ cfg_if! {
-                  target_arch =3D "x86_64",
-                  target_arch =3D "arm",
-                  target_arch =3D "aarch64",
-+                 target_arch =3D "riscv32",
-                  target_arch =3D "riscv64",
-                  target_arch =3D "s390x",
-                  target_arch =3D "csky",
-@@ -218,7 +219,10 @@ cfg_if! {
-     // where S stands for size (int, long, struct...)
-     // where T stands for type ('f','v','X'...)
-     // where N stands for NR (NumbeR)
--    if #[cfg(any(target_arch =3D "x86", target_arch =3D "arm", target_arc=
h =3D "csky"))] {
-+    if #[cfg(any(target_arch =3D "x86",
-+                 target_arch =3D "arm",
-+                 target_arch =3D "riscv32",
-+                 target_arch =3D "csky"))] {
-         pub const FS_IOC_GETFLAGS: ::Ioctl =3D 0x80046601;
-         pub const FS_IOC_SETFLAGS: ::Ioctl =3D 0x40046602;
-         pub const FS_IOC_GETVERSION: ::Ioctl =3D 0x80047601;
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools/0001-Use-portable-atomics-crate.patch b/meta-oe/recipes-support/t=
hin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-cr=
ate.patch
index 54d4fb4ae3..05d6d9b1a4 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls/0001-Use-portable-atomics-crate.patch
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls/0001-Use-portable-atomics-crate.patch
@@ -22,27 +22,15 @@ error[E0432]: unresolved import `std::sync::atomic::Ato=
micU64`
 Upstream-Status: Submitted [https://github.com/jthornber/thin-provisioning=
-tools/pull/321]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Cargo.lock             | 5 +++--
+ Cargo.lock             | 1 +
  Cargo.toml             | 1 +
  src/cache/writeback.rs | 2 +-
  src/thin/stat.rs       | 2 +-
- 4 files changed, 6 insertions(+), 4 deletions(-)
+ 4 files changed, 4 insertions(+), 2 deletions(-)
=20
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -649,9 +649,9 @@ checksum =3D "d231b230927b5e4ad203db57bbcb
-=20
- [[package]]
- name =3D "portable-atomic"
--version =3D "1.7.0"
-+version =3D "1.11.0"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc=
67265"
-+checksum =3D "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c1=
78b3e"
-=20
- [[package]]
- name =3D "ppv-lite86"
-@@ -1000,6 +1000,7 @@ dependencies =3D [
+@@ -1329,6 +1329,7 @@ dependencies =3D [
   "num-derive",
   "num-traits",
   "num_cpus",
@@ -52,14 +40,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
   "quickcheck_macros",
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -30,6 +30,7 @@ nom =3D "7.1"
- num_cpus =3D "1.16"
+@@ -30,6 +30,7 @@ nom =3D "8.0"
+ num_cpus =3D "1.17"
  num-derive =3D "0.4"
  num-traits =3D "0.2"
 +portable-atomic =3D "1.11"
- quick-xml =3D "0.36"
- rand =3D "0.8"
- rangemap =3D "1.5"
+ quick-xml =3D "0.38"
+ rand =3D "0.9"
+ rangemap =3D "1.6"
 --- a/src/cache/writeback.rs
 +++ b/src/cache/writeback.rs
 @@ -1,9 +1,9 @@
@@ -81,6 +69,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  use std::collections::BTreeMap;
  use std::path::Path;
 -use std::sync::atomic::{AtomicU64, Ordering};
- use std::sync::{Arc, Mutex};
+ use std::sync::Mutex;
  use std::vec::Vec;
 =20
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools/disable-cargo-metadata.patch b/meta-oe/recipes-support/thin-provi=
sioning-tools/thin-provisioning-tools/disable-cargo-metadata.patch
new file mode 100644
index 0000000000..2c98bf748f
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls/disable-cargo-metadata.patch
@@ -0,0 +1,38 @@
+Enable the feature *disable_cargo_metadata* on dependency devicemapper.
+Otherwise the build (in kas-container 5.2) fails with:
+
+|    Compiling devicemapper v0.34.5
+|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D> ] 140/145: devicemapper(build.rs)
+|      Running `rustc --crate-name build_script_build --edition=3D2021 /bu=
ild/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/sources/car=
go_home/bit>
+build/target/release/deps --extern devicemapper_sys=3D/build/tmp/work/x86-=
64-v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/release/deps/li=
bdevicemapp>
+| error: linking with `/build/tmp/work/x86-64-v3-poky-linux/thin-provision=
ing-tools/1.3.1/wrapper/build-rust-ccld` failed: exit status: 1
+|   |
+|   =3D note:  "/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-too=
ls/1.3.1/wrapper/build-rust-ccld" "-m64" "/build/tmp/work/x86-64-v3-poky-li=
nux/thin-pr>
+|   =3D note: some arguments are omitted. use `--verbose` to show all link=
er arguments
+|   =3D note: /build/tmp/hosttools/ld: cannot find /usr/lib/libm.so.6: No =
such file or directory
+|           /build/tmp/hosttools/ld: cannot find /usr/lib/libmvec.so.1: No=
 such file or directory
+|           collect2: error: ld returned 1 exit status
+|
+|
+| error: could not compile `devicemapper` (build script) due to 1 previous=
 error
+|
+| Caused by:
+|   process didn't exit successfully: `rustc --crate-name build_script_bui=
ld --edition=3D2021 /build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-=
tools/1.3.1>
+
+This problem was reported upstream: https://github.com/stratis-storage/dev=
icemapper-rs/issues/965
+
+Upstream-Status: Inappropriate [package configuration]
+
+diff --git c/Cargo.toml i/Cargo.toml
+index 39853af1..160bb3d9 100644
+--- c/Cargo.toml
++++ i/Cargo.toml
+@@ -18,7 +18,7 @@ clap =3D { version =3D "4.5", default-features =3D false=
, features =3D [
+ ] }
+ crc32c =3D "0.6"
+ data-encoding =3D "2.9"
+-devicemapper =3D "0.34"
++devicemapper =3D { version =3D "0.34", features =3D [ "disable_cargo_meta=
data" ] }
+ exitcode =3D "1.1.2"
+ fixedbitset =3D "0.5"
+ flate2 =3D "1.1"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools/dms-no-layout-check.patch b/meta-oe/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools/dms-no-layout-check.patch
new file mode 100644
index 0000000000..172647a2af
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls/dms-no-layout-check.patch
@@ -0,0 +1,66 @@
+Between version 0.69.4 and 0.72.1, rust-bindgen changed the kind of layout
+checks from runtime to compile-time. The old checks look like this:
+
+    assert_eq!(
+        ::std::mem::size_of::<ipc_perm>(),
+        36usize,
+        concat!("Size of: ", stringify!(ipc_perm))
+    );
+
+The new checks look like this:
+
+    const _: () =3D {
+        ["Size of ipc_perm"][::std::mem::size_of::<ipc_perm>() - 36usize];
+    }
+
+These new checks fail, if the pointer size of the host and the target
+architecture differ:
+
+| error[E0080]: index out of bounds: the length is 1 but the index is 12
+|  --> /build/tmp/work/riscv32imafdc-poky-linux/thin-provisioning-tools/1.=
3.1/build/target/release/build/devicemapper-sys-8d0196f02bac90ea/out/sem-bi=
ndings.rs:3:1175
+|   |
+| 3 | ... _ : () =3D { ["Size of ipc_perm"] [:: std :: mem :: size_of :: <=
 ipc_perm > () - 36usize] ; ["Alignment of ipc_perm"] [:: std :: me...
+|   |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
+|
+| error[E0080]: index out of bounds: the length is 1 but the index is 16
+|  --> /build/tmp/work/riscv32imafdc-poky-linux/thin-provisioning-tools/1.=
3.1/build/target/release/build/devicemapper-sys-8d0196f02bac90ea/out/sem-bi=
ndings.rs:3:2735
+|   |
+| 3 | ... _ : () =3D { ["Size of semid_ds"] [:: std :: mem :: size_of :: <=
 semid_ds > () - 72usize] ; ["Alignment of semid_ds"] [:: std :: me...
+|   |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
+|
+| error[E0080]: index out of bounds: the length is 1 but the index is 4
+|  --> /build/tmp/work/riscv32imafdc-poky-linux/thin-provisioning-tools/1.=
3.1/build/target/release/build/devicemapper-sys-8d0196f02bac90ea/out/sem-bi=
ndings.rs:3:5620
+|   |
+| 3 | ...nst _ : () =3D { ["Size of semun"] [:: std :: mem :: size_of :: <=
 semun > () - 4usize] ; ["Alignment of semun"] [:: std :: mem :: al...
+|   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^ evaluation of `_` failed here
+
+But according to
+https://users.rust-lang.org/t/what-to-do-when-bindgen-tests-fail/23822/2
+it's okay to skip these check:
+
+> The usual cause of mismatch is generating bindings on 64-bit platform an=
d
+> using them on 32-bit platform.
+>
+> In that case you can often just ignore the tests (delete them), because
+> rustc will adjust the structs because they are repr(c).
+
+Upstream-Status: Inappropriate [cross-platform issue]
+
+--- a/build.rs
++++ b/build.rs
+@@ -42,6 +42,7 @@ fn main() {
+         .allowlist_type("dm_target_versions")
+         .derive_debug(true)
+         .derive_default(true)
++        .layout_tests(false)
+         .generate()
+         .expect("Could not generate dm.h bindings");
+=20
+@@ -69,6 +70,7 @@ fn main() {
+     let bindings =3D bindings
+         .derive_debug(true)
+         .derive_default(true)
++        .layout_tests(false)
+         .generate()
+         .expect("Could not generate sem.h bindings");
+=20
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provision=
ing-tools_1.1.0.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-p=
rovisioning-tools_1.3.1.bb
similarity index 77%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioni=
ng-tools_1.1.0.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
index 317794defb..4d8d2a04df 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls_1.1.0.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls_1.3.1.bb
@@ -1,19 +1,21 @@
 SUMMARY =3D "Tools of dm-thin device-mapper"
 DESCRIPTION =3D "A suite of tools for manipulating the metadata of the dm-=
thin device-mapper target."
-HOMEPAGE =3D "https://github.com/jthornber/thin-provisioning-tools"
+HOMEPAGE =3D "https://github.com/device-mapper-utils/thin-provisioning-too=
ls"
 LICENSE =3D "GPL-3.0-only"
 SECTION =3D "devel"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4"
=20
 SRC_URI =3D " \
-    git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain;proto=
col=3Dhttps \
-    file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.155 \
+    git://github.com/device-mapper-utils/thin-provisioning-tools;branch=3D=
main;protocol=3Dhttps;tag=3Dv${PV} \
     file://0001-Use-portable-atomics-crate.patch \
+    file://disable-cargo-metadata.patch \
+    ${@bb.utils.contains('TUNE_FEATURES', '32', \
+        'file://dms-no-layout-check.patch;patchdir=3D${CARGO_VENDORING_DIR=
ECTORY}/devicemapper-sys-0.3.3', \
+        '', d)} \
     "
=20
-# v1.1.0
-SRCREV =3D "b745ab35057bdd0a4f1406938916621dcf2b7ef6"
+SRCREV =3D "8b663fb4c6fb8e52ca06cea57b986c5ba45f668d"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 inherit cargo cargo-update-recipe-crates
@@ -28,7 +30,6 @@ BINDGEN_EXTRA_CLANG_ARGS:remove =3D "-mcpu=3Docteontx2+cr=
ypto"
 export BINDGEN_EXTRA_CLANG_ARGS
=20
 require ${BPN}-crates.inc
-require ${BPN}-git-crates.inc
=20
 do_install:append() {
 	install -d ${D}${sbindir}
--=20
2.53.0


