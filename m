Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808AEEB64DE
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.34230.1725815545368516852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FOE40p6u;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHw8aeJ8jxmyiUesVM5ck1FqDuUKHOL5jpxJaz/cqZunCAfYaoWFbxY8o6w8ZosTGdY5E81UNlq+3xId7nE2s2tAvUuHFAnyiCnjoohUIILNHHGobYXV3O5IX6Ot7Bejp6B8FfCMtq4PK+nXQdiNXkAgt9kPOVcU6c47Qiwwpuipu+O2rbpz+KSvMDnBGGxu32ktsWUEbuUzxnwbice3HdqQ1MZuk050j1KXoI+oPUgkYfO3gBNXaDEheYFV0/Rj0a+Z+P/7tikX/Wk4/AzZN9MyAydoqVMcg6Mkzh57Lp9+kW2qy2s+dUr3Tc3GwYCMcJFEguOaMbUR51ph32rxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOZTxY17wbij/XXPb+ZRh2OzJ4pNjt3wZRQmcPipi80=;
 b=cbqgTsAHdsEf2QQFG4orHPJGHwmMHNshJo3m8ennTIVRxv0C7g4nPW9nAe7udZyoFCCR+8dwVOfcwBFn4lTXtwvQzXGMAokiNZRPxDOAO+E4iIHM/KUHrL7oR3VCw+3ulRIhhU9SLh8KzuSuS8MFbutHLEX9n8lEIykYcIvRIS2J698cIH+L1KHBJ34j0Kdv7V2XNi5uGcLuvQn0/l20J3KnEpJ0dBtwoNBG0oNiydElJSp8coo8yxeYpZGeLIgfTXv/EAhh6ii+xJk5xGb2rJXI+kvZlU0MPNYQ0Ch3tqVAwzctc9YC1/Z1Zs+dwZD7whwb4YT6w1117PBrRg7S+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOZTxY17wbij/XXPb+ZRh2OzJ4pNjt3wZRQmcPipi80=;
 b=FOE40p6u+mjSV3QV9Mq/q2eYlLKDrOjVDksEMi6rrhJV31GspZ3fPIQGhZkzyofL9ET6HcDeNe3fKBvf5V6gAcvv55wPCSFt+M6Beib3uGPgnT8oM7V3t2/qx/Tik9OxUKlEQeVRBuYbpLmEWs0qvedsr5VAGJdElCDR0UU/kWQ/TG4JA7H7123vXazuVRMi5Bc4lztbwR72zWHUnjo1yxQAcfu0phvV5YmaPGf/MpxERgTnARgm+ZU3UerJYo0GUkSMiPJqkSNV0w8Enak2VHRVQZ2GUW8CRqLtcJiwR2/uJCP9kLteQy4r88bFi4QfLb8Pam3Gj1HiQ/VLhtw/nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 09/13] python3-fann2: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:37 +0000
Message-ID: <20240908171141.99382-9-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b9af2d-820d-44bb-66a8-08dcd0296684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C33efHpNVDFifreg7cRXkDAK7cXBhlD7/sbOPw5AYhDx4kFKRWyabQun8jSA?=
 =?us-ascii?Q?T450kaxSc298cgcuHV1v7MF1ZMK8S23JKfHEsHra+g3yWYMrORWgIIV3dVIE?=
 =?us-ascii?Q?dvK09mhOJXiqBrGFU6ttVJAkrT0ff6xYQHXWtJ/h1Kqhge1k9p9DlMJerwzv?=
 =?us-ascii?Q?lPVzO8gKekcf7RMumUH9zyzVSMON9RKyoFf0JYwWKlPMRXLsvnSQxH9b2a1n?=
 =?us-ascii?Q?G4XR5yOqqDvM3Jhe/QDZH8i6j+oZK+f9eUV2TRDkY0gbmH98t/YrFtIJbue4?=
 =?us-ascii?Q?NFV+A0h1XxPlbXdqklRvOSZVVSHPBzHBPwm2HkCf9S6xBJkrkIeOP0VdPfED?=
 =?us-ascii?Q?5ipBpIqMOlWk9duqfPKEGO+T1Vuft07BWtZ2iTHZmYyTGggqQYt1p0E4f7ht?=
 =?us-ascii?Q?zOrs1SZdbQn5LDAlgPpr7AMY5jXBTZrW1c+p1sZTCu7t8uAYxsLF7dgBWOwi?=
 =?us-ascii?Q?v18zUP51AZ6vhwq6tBTMgOuSnFqymXYYXQZdl/DrHaJDXMpiNpaJrt/qc2ut?=
 =?us-ascii?Q?r8wa8roK0g3NHABkpOBM+a8z8WbK0RxYrx9OUa2LXQ2DTQC6A5AlOsfDvjgb?=
 =?us-ascii?Q?ItnaS7gZH0Z4w2pNMiU1wpuZmN4Byx+Lqd6VR0jkN5s2MSvH357IaKRVHGEC?=
 =?us-ascii?Q?+m7IMaWrkj4vuaVPcPqwADGGWpwFnmctrcmTYQ8fLi38fGsKm1t78gXkglkX?=
 =?us-ascii?Q?5RBUZItGfzvN0zVq7DAe0IomcKlzHdOGppKw98lLzvELrZL6RcCXQ+T0P2Gf?=
 =?us-ascii?Q?fwdfCS9HaedkoK5kUwCf7Ku4ZlIkvMbB65B0Il6QMlVZ9EpeuML8dTtkw6Gn?=
 =?us-ascii?Q?fXysR7DHPMyizfKMNvsEi2Fo2z7xTjDHusyeViiaBfCbbPANAcI8PH/dN9ZJ?=
 =?us-ascii?Q?obb2ODVoLg+5XbMOSyaf9Ehar24IsOhzuNVWjSKLWgYdEL2Nzo6jvkT7P4j5?=
 =?us-ascii?Q?eh1gH16kjdIGgkdeti8tOSiBVyKRGWhPibnpchpMAWl5bEUOykmo0E6sw3g2?=
 =?us-ascii?Q?idBYMjp2jksyMWz2Uqs/xAxVFCK+zPV2dToVoSAaFbg+56dDuoyvLZhCd8OD?=
 =?us-ascii?Q?3iHjerNzj6QBCzbTuMiG5gzmt9D67H4M71790ACX8cdM/8dBSJTA3RTsD38B?=
 =?us-ascii?Q?W83F5UkWoFd0QxGNMsx365vKBC4FI/IN78bgaNxwgkRX5RMRLD30DuQC899m?=
 =?us-ascii?Q?3dbZeFIC7x3t61bcyLSSHpw7C4sFXa5jvxFqpWDxnwqO5MylTRRTkYjdryNO?=
 =?us-ascii?Q?yOeOrOFXXBCi4RbPbSK39wXnojdqmghs2IEJ5iZ7zSM9nUPFX072Duab6gtX?=
 =?us-ascii?Q?SWoZKFyqDY5xHwv3goLc24NkGGadwSefP81rAjGiIAbU/OOhNcWw0SuzDp1o?=
 =?us-ascii?Q?qy/pd7U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pPQTPX/iEr9eiicr03rira/fELblrAvzd6itfwY6VzF33UepEY1Db+4HY1Uh?=
 =?us-ascii?Q?/ifZuWVkY598ZQa7tkQZ3ERUOr4HojUE2S4xtH5z+F8X4L/JhBYLc+pC4gd2?=
 =?us-ascii?Q?B/dpzAj3RDeepl15OKrkGjLBrv8uNobrDumCIEJiHwLeZ4HBM5gBWGQNyOlX?=
 =?us-ascii?Q?6gkOpIOP2nusKRGjkx8EcWsrfhwfMC37vo0/s46LG0lJImyEFsDJb8Uf+XPe?=
 =?us-ascii?Q?OE6DZ0gqDFAVo2cWZawlaC+jPZ9IBIC86mDmmun/zr9so0UtpAy3rp4bAMgL?=
 =?us-ascii?Q?SNR37HrM65tg0UyLVfB6OAA6UYIK6aoUXfgH5L23JjLvWuYXl11szn3Dq/rK?=
 =?us-ascii?Q?Hp7JKSpSYfuSJwtelzkF4PWw0Q1dOnG4fj9a7MXESDxur88dPOQCPhqMe68T?=
 =?us-ascii?Q?lqBI9FnPJIizHkA57BX2vNIW4OEe7isFGNuoZ1API87VWSqXz1ugDxqujiQF?=
 =?us-ascii?Q?JX0oNkcfEMF8A2O0Xq40UkiBqd11hSHbfwXQQxFuluDsGF3RRF1rg2yiLE/A?=
 =?us-ascii?Q?SlbAofZ+AhN1OThPz60l/YQEWZqbwUT/P5tGFqALyp76r8M2G7qQxDVACRKV?=
 =?us-ascii?Q?lJ55vI8HT95+HxQDhCyEJBXIdZ+/1zQv+YaCiDqnDQIHfa576fV6cCkU8spW?=
 =?us-ascii?Q?ymPvPUPX9yvIFqPkdS7gvgmW84202k5aHdtmH8VeSHMJwM0uqo8yyiloJ6hs?=
 =?us-ascii?Q?ZqnviJGNn09wPVLwbz3/eet1tHAyUnGPB4JeaMEXBTVmAdeQ7D/KUli3/qbK?=
 =?us-ascii?Q?y+LcAYEi9mnrXP/bNbd37xNez7egRe4+GhAQJN9Bc65+Xk29f94ByNx/JbTu?=
 =?us-ascii?Q?9KRwpyZvnbtwa5OYJJ2zS2CG9Md2+6mJZvHgGBT9Pnzict5L0bbiv4/BloEy?=
 =?us-ascii?Q?KBV79EP3z0gxZCznrkeFc25ExpbqCIdgjCgHVkGlxMLg1uYSeyOKH8fnhjFD?=
 =?us-ascii?Q?4mJQjBHr4GwgqtVoXMu2vUKcqvUoemPfTPCKgYb/JZwKJIWJB5qiVvIbe1Gy?=
 =?us-ascii?Q?mFBQEst4ErKKcZVKb4R57wV2EAxUKrrTvxj8cYnfgtNjKgs3xFHdWY6HXlfD?=
 =?us-ascii?Q?8gAEuLSklyIjJrA+9jsPmL1Sm2empfteji0nFFSwzCjQh3xays5CAPxOxdAE?=
 =?us-ascii?Q?FRzqHT/K5/M8VUCG7S3HjD+BZW43JWJ7H6wSkOAbMhhyZzb6WF26RY6O1pUv?=
 =?us-ascii?Q?D8OE4oYFCzjP942cdMjucoZsCv9dbjL1exljBnNC3wlXoILx6Mh5zGaHdtd6?=
 =?us-ascii?Q?ZV88akP0qJutdJFAm4EQpk9RYNAskOJoqqWdSruMNfmTWsCP2GBFLLaxmpa6?=
 =?us-ascii?Q?W86UmKbwGapkmvf0DUvUTF+D5KpIgd2sse1DUwGFv9JCgI3tzIEDC5A2iqxM?=
 =?us-ascii?Q?ZYItAJgIwS1Xg1/O0PAliBMgZoRF+oUa7EuKv+3pfxuC1UkFqoWxErvX/hSK?=
 =?us-ascii?Q?Mn/JZpeGyP1P/pCFV+Yxe4Nsva68flSpMumMnSarTpDI8QUHw3Lm/FxjvgJD?=
 =?us-ascii?Q?v9B0pnPrI/fRFWtLSYtIWO4rsW2surc5/Me274w4u3FdwJbaBS0dWUfVnBAl?=
 =?us-ascii?Q?hhkXGnhoqy+LM09tjD8SdWEtw9Q5wE2linaUX97r4h9Pekil71BzK3abRtX9?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b9af2d-820d-44bb-66a8-08dcd0296684
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:21.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+xUyzbXcrvtfn4sNs9Qtdzaf8To1tzfi4gxiOhY/08JxY0QsZVd/tzaG3Nb4Zjh4bAwW6rVHBVXGpuPq8hrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112170

According to
https://github.com/FutureLinkCorporation/fann2/tree/1.1.2?tab=3Dreadme-ov-f=
ile#license
and https://github.com/FutureLinkCorporation/fann2/blob/1.1.2/LICENSE
this project is subject to LGPL-2.1-only license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/m=
eta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 2fbc27713..2099d791d 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Python bindings for Fast Artificial Neural Networks 2.2.0 (FA=
NN >=3D 2.2.0)"
 SECTION =3D "devel/python"
-LICENSE =3D "LGPL-2.0-only"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc73b943dc75f6f65e007c56ac6515c8=
f"
=20
 SRC_URI[md5sum] =3D "0b85b418018746d63ed66b55465697a9"
--=20
2.39.2


