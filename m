Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45954CEB2FB
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:58:57 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.105])
 by mx.groups.io with SMTP id smtpd.web11.74360.1727758734777106992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Tr1FHFQa;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyvzynEPvGUephx6dJq/jUPhJ0gJXZRWh3xVjoV3bnOghVLO5D6mDoDiiiNGT3Vzt1pLOxgYjxFDGqsdUHopI6Aa4ACZiPUR5msOWR6FKcXxwTgC8AaR6lKvXDxSV+5gRVq+UlmwDlVZUiffaC0iC7/6UobMlXF1HvVr2wGkLIlTydHrM0XWl4fE06F6XyisTS9r1Dit9xn5x4MrWDDcCl7mf79diqhxcDARXp4TYs3WXC2XNz70sH5MCkfe/SdoG1njZ4yGg05rz4zYLf84MVfUcGS3BJnF1QKn1DIgZOd1+zXBGrGjIq5JYH4EMpHNZb6XqBQyuStTZ0bxXJEuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=hLBmbwLjHk/8lgLP1DvDINOFnLOW0rM1R6Q7wDUT2XoDGi9Lo6y5+bQzlFWNLQntqUmsk4XC+2NyibuH12cG2UYddP2MHkC9IygwV9XKCYLZq9Zi+pi52lL+EpYzxLLuw5n04fqQ4fDXyg7eMIXaP2nRy77oMWVTwDag2mI+czFy3wGxABAhSbkasasaujDQnVM+F5eYsbpJWC0zcwTxYTQRxJht1Spmo+VUR9C1c3ad92pbs993Z18B5G1wBCE8hkUkaoclfvtVcgCvYUx4UbQsdw2qEcGRLpwr1G/H0gSNYwWcyhTp0LUWjuMdSqPSgr9KiNkwnBpqCfZyeaE2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=Tr1FHFQaIvF4MfDKixxHbIQDjIR588rNK21zEaoBg0MySjYV5Kr337qC7TCaJtAIOnx509GrHjuYMZPUqXvmSZLGzGjqSdd6rVBOj1P18toM3FzriKnQdP14EK8lWM1zo5njKsr8x0DoIVE8s7krYok/AZStQVTKn7stHg3pbb9B7vDHtQExwqnpKlj+MMhZzQgV2/9cSWI1FVIHpS4Kobja/byiqdmZXToBTD6CsTKppU93ozwq0qDYeLDNVCCfRxQwvftmZcy1hsDCh19loCgwmbovhPe+nkrHcDBH0FLSs4LLu3F4Y1mzXLKCi6D9vG26vBQN2ZY6g2RaCV+5oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM0PR06MB6465.eurprd06.prod.outlook.com (2603:10a6:208:198::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:58:51 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 04:58:51 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv4 3/4] lio-utils: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:58:20 +0000
Message-ID: <20241001045821.103617-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001045821.103617-1-niko.mauno@vaisala.com>
References: <20241001045821.103617-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003840.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM0PR06MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dea3ef9-d283-4d87-3365-08dce1d5bded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t2RcPI5y+lCYvp4n52lPrz/4qjSdAL43V4Wke6d0zz0wMD3SFJyUks4773TU?=
 =?us-ascii?Q?bWosQUDGVwhFznBLtsMTc+vdDKgYQ34PoTZm2meiatJEZlSk/3OhIay6fb1L?=
 =?us-ascii?Q?j02jBtYHSuj5BNQZbq6aLuCsx0horfsVao5EDKJa6M8I44LEo4r4eTknjeLs?=
 =?us-ascii?Q?4Am2N9kZRAW8hSXkXMl7DvAZ2vYnZyzjQV6e/WG+9abeDryySCG+DaQf6CAP?=
 =?us-ascii?Q?8ByjRCRvrNqC6Va7ngfsgCq4jCnxjANbA7q6EHasGSj1TCqrgvZzhubbmN9C?=
 =?us-ascii?Q?S07cPvwMDOYcBZNzyRjT8yP6EQVESu2w1GRCu2e/eJCRvTEDZZhMGBe/Smcs?=
 =?us-ascii?Q?RMLh5mGAEG6nPEmZmbB91c8FBCXB13x82tIlwlGpXQl+zJEge+rjUfdffyPZ?=
 =?us-ascii?Q?ktrPMfo9Hpz4gQmlJeLclivuRhPqrbk+wgTagKOBXyNUVEGdoDzlm/lPwQti?=
 =?us-ascii?Q?XyEBhvYE2kjNxH883WWTLcWlskpDkbCLSse2+uT2XlELNgKx9jbTade0Tkky?=
 =?us-ascii?Q?XBz6xjEcInfh+KQs7lYkGYZj6YLzwQWFXTMrHYwZ8LQoT4glYqE8ZSHgenxF?=
 =?us-ascii?Q?ivhSTtbmbrLESEptWmFu73TEebZjCOdI4LSu5Em8jjH7IpesFttoXHUGNd/E?=
 =?us-ascii?Q?7rMeTUACPF3mO3Kv/WTT6SNEoCM/eKem3h4MH1D4VQ0oVVt9jy52BWv08jOY?=
 =?us-ascii?Q?Pn75Ny2GYm155o9IYyb4Y0i11BljgBC8/vOlOUIYWLaaTJRb++vSIpzma4Pr?=
 =?us-ascii?Q?qHamrMVprX4YyTfYqMqDCmUsv895EMO99le8E4eulHpWf0oUcZIQGlrAycex?=
 =?us-ascii?Q?/juNL0V8+CLFRIfJmjmd/IMwm4fb2/g19Y5xi9S5sJ71XG86YfXm5aVEmRC5?=
 =?us-ascii?Q?R6ExaxmaUWUYWiTXolzbhQ9tKiP1iWtuOEMm7NncpH5I4LyqHVwJr4YNbJsT?=
 =?us-ascii?Q?60TWRfhpVuRuhyJkkMxZg/qyvelXgUpwdSvb6sm7xfTxqxtJcDuC0oSR8+Ny?=
 =?us-ascii?Q?PYtDOBmrRvIt4cGadRiTAbAvVVhVx9GbxnIFm6MU89wTl6fqXvnvt3MUxs+E?=
 =?us-ascii?Q?Uj/026tPFYcoLUoQg/myKoLM84muAXj2gdtJZB+QjaEqE7YhmvUx28RoPtLw?=
 =?us-ascii?Q?pTRPAx+P56TzsjhGAPEIgM3PhLaJGVmfDAef7TpjVnzcF3NYwr5j0tuyBhZS?=
 =?us-ascii?Q?7Ahme3Cg75xFKRYktF34qMDGMlbuoQTkhJuOkZU0kwn7U1VjyIesrfxt3ad4?=
 =?us-ascii?Q?nbqA7sPBqrsvpBICh+rNOhMX/Ciy/nhNyuavVEYf+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q4ECGgBnv+SNhuco1F9Jetrcpwdc8NvSNMi0vBYYHDP4YDyGDkqOSUZr/6CP?=
 =?us-ascii?Q?G7hHklytDLRRcw/QffvOFT03MwdfRDrtuM0fPa9nFkg4eA0WY9aTMV+89VDa?=
 =?us-ascii?Q?7MVHknt7oolCndv5GoxoSI+cMFLfDxp1I0eY2yGWbCwyTG3Cb/fVh38XW6e1?=
 =?us-ascii?Q?eBGEH+/LMUaLjqgMr2TfV2M5FoojqwlqZPCi4YWwE9mu1dGTnrXdftKywjI7?=
 =?us-ascii?Q?eEFRw/ZiCEymVNMmFoKygzEWp0B9VqhWeNNdra2x2XlslsxeE9ecJceILwGd?=
 =?us-ascii?Q?p280aV2W42pbnmkr7ugakOMGcFh28ruhA2TiqdaYeBrSWqP+pwKUJL9J7r0V?=
 =?us-ascii?Q?AlXOXkTyKBzBxrtYhYyIahn+N2Kptkel5BQugbEcPpVYjT/anTqachxCslTH?=
 =?us-ascii?Q?TLsZw2k8wNNou9Vq7lHMMxbGgGvd4Uqi/5z7G0IDatf7zgPbj6zOp0iLxKEC?=
 =?us-ascii?Q?pNnz5iPlo0AVdPR9ETUQGiPidwnXOcKdP7PNgER6MvpC2fE60BS2ZLCgF3Yt?=
 =?us-ascii?Q?mSIKbAzCulKpyA7azJQCTpt9/fWFv8SRn/47obCIhPoKh7uFKTllLLIDaORG?=
 =?us-ascii?Q?ISHTEnIaFEOU8YDtgtNTSaGS+c8MJ9NgFwAfxuS74oIqqeJRq0mYfmgai8SH?=
 =?us-ascii?Q?meN/HbpR499stZI2WIIrPuxdoqUQpCjJNVXRZYf3JwqmKYa0j7ZK5xjE+j3F?=
 =?us-ascii?Q?NSbk7CMVZDDDCI+5iGQEP48eEauaADBOrRDW87B/XtFE4uCxCsMvryZO04Vf?=
 =?us-ascii?Q?7IgEa8lf/6uGJt4UrFWu4k0kDYikUCjYL3hlXlrl2OBLiFlh8gizlQq8W1ux?=
 =?us-ascii?Q?2x7raI2NC6i+xT8pL//7OPOpxFwyaa/LIJx08ZEOIYfcaLz3DxjibHU8kzlb?=
 =?us-ascii?Q?ppjAZiA1jN9Xn1zthZOMgTCGNgX+CK/+xfKJopRgPLdw/FqoDyhp7B/lVkKk?=
 =?us-ascii?Q?zIyU/+f9fWyaMX4xh1WCXL+rdHlHxDhz1X1JxAZJ10tK6lSBRLwqB5nB3VUK?=
 =?us-ascii?Q?bBKfTrFdn42wnTQtyasKOYKhSEsRKndbOBv2g1ZfbX1HJUvB6HOf5K3GwIfU?=
 =?us-ascii?Q?CscBwuba0RUxnLP95Srg+vanciGgl8uISAuAY6hnwhdEg8q3S7qp8id8nhjJ?=
 =?us-ascii?Q?5Q0OOz9QYQOyKzvZaKvEi0CyBCGXLeRR+iCzcvV2wJH+ess/VKGewhd8l0XO?=
 =?us-ascii?Q?Si/PaqO1FvhI0af4P1w+QaaHrJC6owcEwa69VbQ89cNKi81QD+FOSHKNkNwF?=
 =?us-ascii?Q?W8J4v1lHq7jnkZM7KdoIOww6FLyxn0d3nIlsEyiCwDdwD99101D9AOxJ+KTP?=
 =?us-ascii?Q?LFK3K8NTYXzw8ZSr3RWOhdxwjt3IMr/OUvkzWZbCf/ux7FwIDar/kojZXXD2?=
 =?us-ascii?Q?K0NFzsfbaDXnakgZotFstHU83t+/j6e6GqbK/5DJufO6PN/7zwKsUIwHNfw+?=
 =?us-ascii?Q?rm9m6R8Ofmt1eQFxqaWBaV4J8wSIL+2XW8nkegx5D9rA2qv3Cm6ODisk/sYn?=
 =?us-ascii?Q?imlIX7/nhuooUXGRsnpfBHsf/JNubhWyS6UoGECKlKeagN4CjrgZAEWbfwoJ?=
 =?us-ascii?Q?Wypb4fsDKVXDmzoOiC9AxjHwz77U7/4f+qHYga6EH/igIiYAl9vYqNEbZrEz?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dea3ef9-d283-4d87-3365-08dce1d5bded
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:58:51.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zniw9lXNzKWGmXARZOOzE9mGGhPlPGlGUrY1uT4E0PK58AwZ2sm88RH7gVQP5Iwims9lTVUGZgR3wp8Y7MjPgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6465
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112624

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, master branch of lio-utils has not been updated since May 2014,
see https://github.com/Datera/lio-utils/commits/master/

Thus, remove the obsolete recipe, along with associated packagegroup
declarations/references.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  6 --
 ...t-environment-variables-and-add-LDFL.patch | 63 ----------------
 .../lio-utils/lio-utils_4.1.bb                | 75 -------------------
 3 files changed, 144 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefi=
les-Respect-environment-variables-and-add-LDFL.patch
 delete mode 100644 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 163061ca7..b29b86d45 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -22,7 +22,6 @@ PACKAGES =3D "\
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
-    packagegroup-meta-oe-support-python2 \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
nome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
raphics", "", d)} \
@@ -47,7 +46,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-support \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-support-python2", "", d)} \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
nome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
raphics", "", d)} \
@@ -914,10 +912,6 @@ RDEPENDS:packagegroup-meta-oe-support:append:aarch64 =
=3D " ne10"
 RDEPENDS:packagegroup-meta-oe-support:append:x86 =3D " mcelog mce-inject m=
ce-test vboxguestdrivers"
 RDEPENDS:packagegroup-meta-oe-support:append:x86-64 =3D " mcelog mce-injec=
t mce-test vboxguestdrivers"
=20
-RDEPENDS:packagegroup-meta-oe-support-python2 =3D"\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.co=
ntains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils', '', d), "", d)}=
 \
-"
-
 RDEPENDS:packagegroup-meta-oe-support:remove:arm =3D"numactl"
 RDEPENDS:packagegroup-meta-oe-support:remove:mipsarch =3D "gperftools"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv64 =3D "gperftools uim"
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Res=
pect-environment-variables-and-add-LDFL.patch b/meta-oe/recipes-support/lio=
-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.=
patch
deleted file mode 100644
index 86edcc2e4..000000000
--- a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-en=
vironment-variables-and-add-LDFL.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2cc2315eecaa48fd24792aaa889dc7d9fb96978b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Mar 2017 22:18:44 -0700
-Subject: [PATCH] Makefiles: Respect environment variables and add LDFLAGS =
to
- linker cmdline
-
-Fixes QA errors about GNU_HASH
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- mib-modules/Makefile | 10 +++++-----
- tools/Makefile       |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/mib-modules/Makefile b/mib-modules/Makefile
-index 0d54c9b..051d4d2 100644
---- a/mib-modules/Makefile
-+++ b/mib-modules/Makefile
-@@ -17,13 +17,13 @@ TARG		=3D iscsiTargetMib.so
- OBJS		=3D iscsiTargetMib.o iscsiMib.o scsiMib.o ipsAuthMib.o \
- 		iscsiAuthData.o
-=20
--CC		=3D gcc
--CFLAGS		=3D -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup -=
shared -fPIC
-+CC		?=3D gcc
-+CFLAGS		+=3D -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup =
-shared -fPIC
- CFLAGS		+=3D -I../include -Wall -Werror
- #CFLAGS		+=3D$(AUTO_CFLAGS)
-=20
--LD		=3D gcc -shared
--
-+LD		?=3D gcc
-+LDFLAGS		+=3D -shared
- INSTALL		=3D install
-=20
- all: $(TARG)
-@@ -32,7 +32,7 @@ all: $(TARG)
- 	$(CC) $(CFLAGS) -o $@ -c $<
-=20
- $(TARG): $(OBJS)
--	$(LD) -o $@ $(OBJS)
-+	$(LD) -o $@ $(OBJS) $(LDFLAGS)
-=20
- clean:
- 	rm -f $(OBJS) $(TARG)
-diff --git a/tools/Makefile b/tools/Makefile
-index 79ed3cd..ffd9bf3 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -6,7 +6,7 @@ ISCSI_NAME_OBJS      =3D $(ISCSI_NAME_SRCS:.c=3D.o)
- all:: $(ISCSI_NAME)=20
-=20
- $(ISCSI_NAME): $(ISCSI_NAME_OBJS)
--	$(CC) -o $@ $(CFLAGS) $(ISCSI_NAME_OBJS)=20
-+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(ISCSI_NAME_OBJS)=20
-=20
- clean:
- 	rm -f $(ISCSI_NAME_OBJS) $(ISCSI_NAME)=20
---=20
-2.12.0
-
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/r=
ecipes-support/lio-utils/lio-utils_4.1.bb
deleted file mode 100644
index 844e5acf9..000000000
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY =3D "lio-utils"
-DESCRIPTION =3D "a simple low-level configuration tool set for the Target+=
iSCSI (LIO)"
-HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-utils"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dc3ea231a32635cbb5debed=
f3e88aa3df"
-
-PV =3D "4.1+git"
-
-SRC_URI =3D "git://github.com/Datera/lio-utils.git;branch=3Dmaster;protoco=
l=3Dhttps \
-           file://0001-Makefiles-Respect-environment-variables-and-add-LDF=
L.patch \
-           "
-SRCREV =3D "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
-S =3D "${WORKDIR}/git"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distut=
ils", "", d)}
-
-EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
-
-do_compile() {
-    cd ${S}/tcm-py
-    distutils_do_compile
-
-    cd ${S}/lio-py
-    distutils_do_compile
-
-    if test -d ${S}/tools; then
-        oe_runmake -C ${S}/tools
-    fi
-}
-
-do_install() {
-    cd ${S}/tcm-py
-    distutils_do_install
-
-    cd ${S}/lio-py
-    distutils_do_install
-
-    SITE_PACKAGES=3D${D}/${PYTHON_SITEPACKAGES_DIR}
-    install -d ${D}/${sbindir}
-    for var in tcm_node tcm_dump tcm_loop tcm_fabric lio_dump lio_node; do
-        if [ ! -h ${D}/${sbindir}/${var} ];then
-            chmod a+x ${SITE_PACKAGES}/${var}.py
-            ln -s ${PYTHON_SITEPACKAGES_DIR}/${var}.py ${D}/${sbindir}/${v=
ar}
-        fi
-    done
-
-    if test -d ${S}/tools; then
-        oe_runmake -C ${S}/tools install
-    fi
-
-    install -d ${D}/etc/target/
-    install -d ${D}/etc/init.d/
-    install -m 755 ${S}/scripts/rc.target ${D}/etc/init.d/
-    install -m 755 ${S}/conf/tcm_start.default ${D}/etc/target/tcm_start.s=
h
-    install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start.s=
h
-}
-
-SKIP_RECIPE[lio-utils] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_P=
YTHON3', 'yes', '', 'python2 is out of support for long time, read https://=
www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if yo=
u really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHO=
N3 to "yes"', d)}"
-
-RDEPENDS:${PN} +=3D "python-stringold python-subprocess python-shell \
-    python-datetime python-textutils python-crypt python-netclient python-=
email \
-    bash"
-
-FILES:${PN} +=3D "${sbindir}/* /etc/init.d/* /etc/target/*"
-
-# http://errors.yoctoproject.org/Errors/Details/184712/
-# python-native/python: can't open file 'setup.py': [Errno 2] No such file=
 or directory
-CLEANBROKEN =3D "1"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
-
-
--=20
2.39.2


