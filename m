Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED24C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:43:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7872.1787057019648540062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HPU67msK;
 spf=pass (domain: est.tech, ip: 52.101.70.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ks92JvF4tCWftgYXlMw9DVIPT7uh7rCwaaxGyaCDl4MqYg7y8O8N5VDEoi84EG3qa2mTTbdwWRppN55laUiiO/dem7FQ0UUE3S4f/r61vZmaSYwzqol5u/b+r5l/bpVVNOn+ZFECEU+I7nXUnUpzSKZdcOklLtQmk6VE0IXL8w/upZ3OvAKmUhHQcLjDH2cMtnrmKh4G1YElV4rZpVvwukdEKk5rLnxQvQVEAqsMIxIbo0mHMs+YfdU2gdAEAiBKCHTg+LIy3KWwLAHfpGUlBcc67BHoj474Yqhq+YNkM7jBkQIsiFtwIMD+PQ76kfs+e+eWL7681iCc4uOErH1CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfNW4VJ2ixBf4WkugI2yP9WxRsmR6QGId06P6VKug4M=;
 b=Tnz/AyBRUjmhlAPYsp25+4q0PGCHLqVBKgokSkFavXE+pi3CVZuTm2pSvg9xwQs49ngs+55K5ovXpFbvOjS3UERvhCA+ZetOr8GtubNnuYpnrpK1GLUdeWpI4sR1Ee2WM0M2V6pY2FqYAZbUMoCjRtAeo99N/bvJtp+KHxxE0lGqt4yaSNA6UHUKnYQktKm5UoqdsRGN+eLIH7P58p2zEqK6Sg1kY6DIzIK1/4kxmIOpMKpZ7W2lIrAcFtGhQLlZSo/qkFOTGN5yQAOjj3QP0AY6jlOt21Xxcdj4EZN2veom2GbLMI6xR5hYO2mCQepQ4VjzCpNqAQKvZkrzvAUojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfNW4VJ2ixBf4WkugI2yP9WxRsmR6QGId06P6VKug4M=;
 b=HPU67msKakcYiOYaPRnTX3VADfDQ4pVZHgHGkN31D65gc40F/yTJH5r1wmoZvTalMXqOZAoHba+wQBEozWBrMPOoY6h26Gxd4JdAdWDNgfNABjQBxnIjy/v5LihlJKc0Siwmqg+hB3Uj90Kd00jTwuPXsebX4dVt0sUPyA8mn1itBCtlmu77Xiq+9xjUvYIY5z3WfPmvlqdrnSGpBT/9zCEc2W7PL+Z3Q6VRAWYdepi4sk2x6oNNHvP2wZjBuQfrWucU371OevAie9Pih42iMJl6ryPibwLZI7iLV28inCDCORAkAESiExKx3Zk3tvbMmJvS4KwMWoOxum3ZBfyK8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB2370.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:478::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:43:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:43:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: RAJ.KHEM@gmail.com,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] libtracefs: remove recipe (moved to oe-core)
Date: Tue, 18 Aug 2026 14:43:29 +0200
Message-ID: <20260818124329.54509-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB2370:EE_
X-MS-Office365-Filtering-Correlation-Id: dad22a63-97f7-4322-2463-08defd2651bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|3023799007|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	pbV7q0HWlW3cZMZdj7+934I/6wW25VCvwi53XlbWmbDcVJG+KC69HRsZlcVw2svXkUBQuMa8ou1CPwOBriTYxHBsWFdrqGesdPAg053TfYx2TJvgi9QrAL4T2rRi0vgOWckAHcWM/kNxH2TnD3i0CDsWT9Pe1RzfQ8rdTM16udNw4ibJU8WHPBb+Ddf6MJmIwRCquncU+FAAuVri+miiD0I64DCiW8lqWQnp8nMGRkJRnPhQ10m3iVjwvC+1xzBQCx0/B+p7h/KcQ+e9luS8O4k2gb9iKbo2aH1P3jtZzP3s+rhVCB4MpXevwyAvQ+BzbVetZEyVuyz/sN0vrx0tG2yb9qhK39LVp/IUgf5c8rMNW1lx/R0siKdxi0/GnekjFw9KW4ShnNZXkBIqD8uEn3NyI0TPA2LW8r4s5wLdxZBwigk0Wg+1bMjKy2REp7hOUr7Zq7UfDJKMPoACOLxn+vMHPKORbbUA4Qozx2//TkDc714HFW0AdAdWdulb4uGspNnUASIqAgI1t64dKzQpPO23dG2pICpRZwCk3YFY+kLQIuQPIbyzjtGPaCSfAwnH+8MY10OoPMpjmoyII9hWR3NfDprmyE0pHQNF4TiJZDH9snNPfOqzMWmVam2D/5oQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6BExVlWOId3Qsk4z/DVp0PVG+hPPiTOR/A+oaxTXf1/YqqMwcSZzEePeQpZO?=
 =?us-ascii?Q?4Vqv/mINUN+YHKmRyJjL7JpW/t0JXkotA70tlYVD0CJ6cnblLwzopOV8k4L2?=
 =?us-ascii?Q?Uw0pT3J8nYuajEqQtPEipU7kMI4PQmnZLVee3uIm/1FinTyC7qeR8SP70f/L?=
 =?us-ascii?Q?boRkCS9/21AzZwPkgjSWVIWlKK3YHO+Ehdsb4FIMO6A2o+0d92c3cqXy2mK7?=
 =?us-ascii?Q?SiostEIPPNt1GyYo6ukCOqHLF4WDUyDiuWgnc3K9JTzJdmIvR175xUuggxcX?=
 =?us-ascii?Q?+pb/MFvj1KM8FMzpGSYbwsG3V91v7jeyXVwHSnLc46REi10mes2teV6NbAn9?=
 =?us-ascii?Q?5m2rAC+Xku/BoIqgnPNgLnKO5fdJPZP6Up40duKiN+CtAYgMky2t01BmUnvl?=
 =?us-ascii?Q?6bu6CBjyWYv2F1mW+0Fs9jd4tFYxEYg0+3+4vOwDj2E/H7Lj9wfRaSQ28b0e?=
 =?us-ascii?Q?5eN85eUnBjFjAi3c+wQif6FzLZcsquOHItfUQf4U1BVGatniWSYOu2WHwcC4?=
 =?us-ascii?Q?DvfJF/d6racqblhTtpPfDYbV4DMYjJ5t/soyd3QV2i9BXIgB5oEVMHkCQGEl?=
 =?us-ascii?Q?whywif9IEgYPDeMk2hY922HkDp9T6/nRWAdKE7dUvSqJaOEaDj6yeC0+7taU?=
 =?us-ascii?Q?xxKUzi+9iOSHJhfqMctduWszmGjFN0sr6gmo7fBHPbyNngYdYCsc/uDZSWuV?=
 =?us-ascii?Q?6BddQ4DC+8r5iOKwIME3P4kc2ewd/3VbydFjNYXkuYTOOWTrJe+GqVGjJrv/?=
 =?us-ascii?Q?66PZhYx7G3aH4SBobcagYJt5N3Xo7uNus9y8GX6ju4XivqvJA3G6vkCiQAeP?=
 =?us-ascii?Q?kJMQSD7X70SdX4sc9P6FrCXaUgb0qV0p0I9AF6ShFo7mroSUJgyNbxwuCAka?=
 =?us-ascii?Q?tHqfN1AL5VFiub8D8LGoCapqH7vI5xD2gGKiOe0/UYHj3mdki0zBGgQsjUrT?=
 =?us-ascii?Q?XEbef/Ypvrs/yYulzuoSdk/rGal+PPHHZhJz/jSFKT+pyolHOivyeSRWz4P6?=
 =?us-ascii?Q?4QzAjeIBOjc7KW4QZb/QSKnKF4eovzDYWu0vickf5JxoItBLkLoSMuXRpE6u?=
 =?us-ascii?Q?rUli+OmNXnltmdTkwyUX1x8fAx1KUl0YxR4Uc7hRVqhcsODzr+G0qP62FThi?=
 =?us-ascii?Q?pO6pQcaSR5TABdhM5cv3U7tV6SJGa8fCpOy4+WLHGsiGjPw80wVoUKBP4J9w?=
 =?us-ascii?Q?d5YtRtpb0vevEomaq1WrjSbCv1DwzxEUBJps1GoYNF9Z8jE9EdChVpqQ72AB?=
 =?us-ascii?Q?8VOqIDlqVAp5HK70q2r4TJlHM5FbE08jSQXIQSZO0EjDEO2acWSDdztRu8rv?=
 =?us-ascii?Q?89knLJpMnTcJD4PzOoxVLBz+r6xEFBOSLs1o0RWrd4M0d1Wy8AhrF/Hip42V?=
 =?us-ascii?Q?2INWIs7Q1IZTttz3KDh8J4eeoPabCttPAOktqamcK9iViXIdOXwA96Ed01fR?=
 =?us-ascii?Q?GM1rOig0N/SRfmPghDRMV+8+IFX9HtYVU9ofSf7ab5AHaU5gS4uKL+jV41P+?=
 =?us-ascii?Q?GzLkvC1RnsSqsSzSuE8zAY1N1rNWRF8osN91HvYiLjLcmpZqHTnL4EjFGpKx?=
 =?us-ascii?Q?4jPqIkqe3pg91kugWG9/guHwA8AZHUgRnqynXDltZyUJ4uStCy+y9QqpPHSo?=
 =?us-ascii?Q?P69lMWir3Fmj+3nsxXK8yeDOTCoBSJj2V7lHTvBFAiJS36pG0wA3lHCIP/iL?=
 =?us-ascii?Q?EhrGhc30/xeokX/lrqtm9FeMt99izKfBUmRtKWyA6w4MspA2Kg2/bnNs5lhB?=
 =?us-ascii?Q?GOZJZI+k7j1nlJX2viaf7SUPJypDUrA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dad22a63-97f7-4322-2463-08defd2651bd
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:43:35.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FncHzMqvooeMukR6LUNOfInMQKZf2RuPH1Z4k9hv/2OP9Dey/oxDneScoX9hLB01NrHcTpbY7Md6xAb1MMi2UMfiC+ggryueEqIFFOIhPiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2370
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 12:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129232

libtracefs has been imported into openembedded-core [1] as it is now
required by powertop 2.16 (upstream commit 2b133ed [2]). Remove it
from meta-oe to avoid duplicate recipes.

- This commit is depends on [1]

[1] https://lists.openembedded.org/g/openembedded-core/topic/120806764
[2] https://github.com/fenrus75/powertop/commit/2b133ed512c6852cf81cb98831b=
dfd585c0317bf

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...not-preserve-ownership-in-cp-command.patch | 28 -------------------
 .../libtracefs/libtracefs_1.8.3.bb            | 25 -----------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makef=
ile-Do-not-preserve-ownership-in-cp-command.patch
 delete mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-=
not-preserve-ownership-in-cp-command.patch b/meta-oe/recipes-kernel/libtrac=
efs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
deleted file mode 100644
index 7eaf29e4c4..0000000000
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-pre=
serve-ownership-in-cp-command.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Dec 2022 22:50:56 -0800
-Subject: [PATCH] makefile: Do not preserve ownership in cp command
-
-Fixes
-ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/l=
ibtracefs.so is owned by uid 1000, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7f4f5c3..1ba7b9d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -296,7 +296,7 @@ endif # DESTDIR =3D ""
-=20
- install_libs: libs install_pkgconfig
- 	$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
--		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
-+		cp --no-preserve=3Downership --recursive $(LIB_INSTALL) $(DESTDIR)$(lib=
dir_SQ)
- 	$(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
- 	$(Q)$(call install_ld_config)
-=20
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta-o=
e/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
deleted file mode 100644
index 117716dad2..0000000000
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY =3D "Library to parse raw trace event formats	"
-HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.g=
it/"
-LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a5=
1215d13f97 \
-                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50=
909238dbd"
-SECTION =3D "libs"
-DEPENDS =3D "libtraceevent bison-native flex-native"
-
-SRCREV =3D "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
-SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps \
-           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.pa=
tch \
-           "
-
-inherit pkgconfig bash-completion
-
-do_compile:prepend() {
-    touch ${S}/src/sqlhist.tab.c
-}
-
-do_install() {
-    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfig
-}

