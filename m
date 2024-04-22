Return-Path: <joseph.mills@cnhind.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A896FC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:24:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web11.18400.1713792244753217761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 06:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cnhind.onmicrosoft.com header.s=selector2-cnhind-onmicrosoft-com header.b=j6JTMXE/;
 spf=pass (domain: cnh.com, ip: 40.107.22.76, mailfrom: joseph.mills@cnh.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nlz0IZDlgsfhGgpoW1552wFJhDlP0Xh5m4kak124q2/x9mICGrnBqW1yOO+RYVcXclu/exn6fMI83NdmRVaQBfBm/mdnOngVJhTGRZ63I0nb7eLcJVXpaHTc4kjkxoD3AWha1ElQX2ivvhnaMaUeQkhA+9Ps6U/NaHPX4BMbTUbFf4ti5yFSa3cTXngqXfzI+jpu9F4VkS4t+EG1yiZyShvpkBkGV72SLqWlHiUtZSVe0HssUEhtgZ/09jBXH2QjUhq3enAaws8Nd8p4sfZRz29GxtQiWguD+9BBhh58L5tn2/em6PYbtoZcS2bIe6fBty62Uxj7+ExSssRKwWUrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqRXoPo1nVcIO/H8MIjFZPmP+pGR2GMVek9gKNMtVzM=;
 b=PIKjIJDnf/XXbRPTiiNbwtpcd6hjDuBSBih6VjYSgdfzgoEItaETlfbYXjxRVYtiuIpV4n7fluBhe2124ph+Na9nfDT1NPp/6TJ3Dr+OR8IdTscfAiqtpmirbnrZnQiXjkAHJ/IrpkqeV0Jf7975n1je/UXqvCbs3aFFqjV1K8cjcYO/udPaHWxmRIcSfoz7EvSFJlgyBujsz6uqeIJ72GFXYhsrip4IQ1lffOz4llNaSRtiXZQioSV+usw2cEa8Mi2/gQRXsE1DPpsoJaaiFZTphD7yRg2R+86SjIAK72Srg+IYXtt3MzO8CEIIK4FPxpVShaqpKt9If38WwVtulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cnh.com; dmarc=pass action=none header.from=cnhind.com;
 dkim=pass header.d=cnhind.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cnhind.onmicrosoft.com; s=selector2-cnhind-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqRXoPo1nVcIO/H8MIjFZPmP+pGR2GMVek9gKNMtVzM=;
 b=j6JTMXE/OQq4Ms0Y8oFeTp0upXNKtaPBGlPBi3Ul1nKTPwENEzXZOUY8CsspPY5q/xWuMflYb9AysHpOQf8BWameBoi5ubqfxkIHMj9o8PlbXgmrAWwnTL04Yq+k0R/tDynTpvRAwRDj1/G70zlRdTnQ7WCntGhlEDQkAQWOtaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cnhind.com;
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 13:24:00 +0000
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf]) by AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 13:24:00 +0000
From: Joseph Mills <joseph.mills@cnhind.com>
To: openembedded-devel@lists.openembedded.org
CC: Joseph Mills <joseph.mills@cnhind.com>
Subject: [PATCH 0/1] Mesa fix for do_install when DISTRO has no x11 but has opengl
Date: Mon, 22 Apr 2024 08:23:46 -0500
Message-ID: <20240422132347.3180714-1-joseph.mills@cnhind.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:130::18) To AS1PR08MB7451.eurprd08.prod.outlook.com
 (2603:10a6:20b:4dd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR08MB7451:EE_|DB8PR08MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 026b6998-6c67-4496-270c-08dc62cf7895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hfzri2z8j9aR3Tj7AY/bau/ea1yFt+mM0mCQC3cIlfHVvBnuqtLLOnuYtK2S?=
 =?us-ascii?Q?hHMwTQuPu2IutKP1FmYjc1bDDMguEq10voZw0sfoKV/HhBxL4hQmE0DPl6bc?=
 =?us-ascii?Q?pbmyoNe/jPuhU1N5bDCaGYAnLZfhAAQRc8eNJrQZ8rw9qaQ/cDo/4IJ/10Fb?=
 =?us-ascii?Q?d02qHuiAu3qMhNRE+Z4StF4Txx1XExWMid9vtew777W/+wStLYTFafmVmSBe?=
 =?us-ascii?Q?LVyo0NhvGnLlj3mRirLhNyPGtSAJwX9Yj6VX/kVahsTD7oybMmL/YQ/pd8j4?=
 =?us-ascii?Q?1/s4Zi/Bld9utGyJzVqzNgLW6nlI9REsyL/N4UBIQ9sk82pdb1Cf78+qCSsg?=
 =?us-ascii?Q?KT/uBPD8bPaSg04FckGBFlAFLRNoQQeA3uVcdbPAc6pKQrKyhZmFu7MGv3ie?=
 =?us-ascii?Q?IvJxY47nraxiDXlgby+ElQF45J5VJxBWYj2Ddw2AfOqzicPWx4hFixRKlN2v?=
 =?us-ascii?Q?oI4IRaAaet8nV/Wl6LGOBz8YmocfuIuq2e53n1XEw6skOkC5vVNhHgnD45Pf?=
 =?us-ascii?Q?kXUfLLgEAuQTGs/Lq6KX9aF3X5A7wd9bfEiPmwnF1J0BEByeJbKmyagrOTtv?=
 =?us-ascii?Q?XXNkgQPB7p8f4pqfMvjwnV4CUh4IcESwnaZCkIM/1frwrGOS2NE+r+hLfqo6?=
 =?us-ascii?Q?CKYYKXZFt0cTRqBW7wzkXi82P4tLVEgWRNoKoReCe/U0HO44gcC7Y304tdxC?=
 =?us-ascii?Q?VxTZKvrcDxJ7lsyu91NZFzARosFk0JoyTX2rRNWYv6SRI0RZWe594UYMuhIA?=
 =?us-ascii?Q?7Sy2Qs9HmdhzVLF5iwoPrVwkmrxpdGGo9cFtnxnVj8riWd3ZSnkCmFPcNn1N?=
 =?us-ascii?Q?E8gnJfN/fXRajZeiiQ+PTMfymFWjF1rqjqZkJRZSeH91nYfbhS75DVCJJcAU?=
 =?us-ascii?Q?Ayli/zVHKM2RWmwis1GYMaGzLB5T6ycy7CmrVm19B/An36MGZTNRhtQhNYZw?=
 =?us-ascii?Q?LZ4pawJxObU+PBW3dfNol4fNmYstl22ho9ZZ3NHRtthlzfXtO/qqmPVdqm6m?=
 =?us-ascii?Q?nmZ1+IO9U8aEZg2stAkqqcxnub3PBnchZ3tEz3zYUYXIPVOsBRcZd3EGfZjv?=
 =?us-ascii?Q?j692wNjXhNvhx8KAHJg6CTTVaiAmq6uGnZoRSiy3U3Tcnk2w6lmuSIIesCEG?=
 =?us-ascii?Q?8+5pOsIyzvFDbP2XV7nIH6zDDanuLg7x5UaSDt+4iLOB0kAh9uPg7QG+QnQ1?=
 =?us-ascii?Q?kVCos1Z9tGBrozFuydnLAwjvNbra7RP1tsNiwzY+aisgLEGCxD8O6VyFSQNv?=
 =?us-ascii?Q?aqZUW4/eJVV5Rrvx6WFyEK7wr4Jplaex0fZu8rPzHaiJP2t0hYdjH8Vdkb/7?=
 =?us-ascii?Q?KUSs83f64F/NacZGblI4b6cS4AdKBUEcdFlztuPPzMRHMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XnoPmi3Wlk+7dBidOCF9pRATVkglwyFQTQIuGg7iFhK9NT3F2Nte4ncberIQ?=
 =?us-ascii?Q?6QZ1LIh4zJeoQn2ds+7C5PrG1C6Xw6ZXHUiM+ikllG3hWlarhNUUzpfMoKGl?=
 =?us-ascii?Q?qBF8Za3pB+KcnT5D09kEWaTiZ3mfa9saIn54TK88gFfr4YomlPPTUA2A/VG9?=
 =?us-ascii?Q?KaAqNZkNJfz7xRLI//FpZDE0L1rxAgopqKs+RskE7+8lRsD77xZLyNzeCYhm?=
 =?us-ascii?Q?75iePDuM7oKPM6s/rOZjrS/wUugiAcdzYyPZDdV5StjgPyXI5VfLY0cruwnU?=
 =?us-ascii?Q?qPSuHkr7eEXYqkNfM9wMwJN+6tfP1pqd3d5BzXdkTlqSb5C5s034BhG56yJ1?=
 =?us-ascii?Q?az9pSHkABaLzXHclgeyNpk1/bDiemw1MAvbkLwkCGN04FMjHXK0yk8uptj7N?=
 =?us-ascii?Q?5yre+TfDzHMjrG5iOxJ6Ifg7kdfiD3fDIY6EWDdC4vzmFIvvGX5hcs0q9Oja?=
 =?us-ascii?Q?8drt5tn8GjG8oa0v59QLnObf7LeHoUj74IBAej8opTeDYP9POdRIKUyJ6e42?=
 =?us-ascii?Q?pM0n4uqbQUhNMvM/fbkgv8uKFGfCkse4RwEWzmGDZD4Xm+WRyKlWuSVoqX7I?=
 =?us-ascii?Q?7W9e37VU2MlG8B9nP4ZoY+szOjfObTB1GBXfTuFdpsEE0Csfs+GHqun788lk?=
 =?us-ascii?Q?zuSTS8vmc3aCq3d857AFYzPdq5zq1HiqJ2GtVGxpRG81862QgM8csc3+6dVR?=
 =?us-ascii?Q?fdkKXkVUDCy7MEr367vkpMyJGMZz5DyPWpUy9pfmhbQGFFL+W3RAP2usNNG4?=
 =?us-ascii?Q?t1USx6Xe+DDtDbLgq1guc1Jk7QEKTJLIC2KxNgcV/QMQIYeYx7x7fqKny4uH?=
 =?us-ascii?Q?3GG6q5DJAyNbeSMDe60bFMm/73gNIIKeEtJfQkWA+WFIeY+gBLO1f2Im2svb?=
 =?us-ascii?Q?PAzHcinXYOgWwRgpA7jfhw1wwudzcOhWP9H4N7CFCObKWumOK8rMcpH7Lhu8?=
 =?us-ascii?Q?P5TInm6pnN0VoY9lwx5UfV98RlL+dPt9N3uNkkJqwACEs1ahCmbq08shHpVW?=
 =?us-ascii?Q?gp+GcYcCWFOsh0Z0fQoLhWzyRZnOtWfB5hJPW2ik7Rbm6CB5ra7/zTz5Pqef?=
 =?us-ascii?Q?JQiC/rWLrHGDKQjyCGfVXP2zJ4PGPyqJTasgJBCEiKoIWpH3SFYAER2adFv9?=
 =?us-ascii?Q?Ol1Pg2jkrmna3b936k0CNk93HLGHbrWqm9J6E8npKxaJaRobPbQ+ji/hCW/3?=
 =?us-ascii?Q?/WxoeO8WRJUDCZJcqRpLjO+6LYU+7uKyWqtj5V4px0LoJFxr0jiyoQSCMVTq?=
 =?us-ascii?Q?SzJrHVk7Fdowq0JGZbwIvjjg3XfiOtp+GTTSKUivXlKqmK0HXh2mirtokDJ8?=
 =?us-ascii?Q?LfjMWrunTeKt2Hi0Vt+fXWgjOEIVchSbO0PveJtuiQrBdVy9JTaat7Ux05iv?=
 =?us-ascii?Q?3Ggck8EvsEqv4JmNiTaXrpzgjPLFwsYyPJlONXFs/wnA4E10yhY0FMnGf2Vb?=
 =?us-ascii?Q?kVz7cOMQw4kbfWDnh5QCZpUf7lkGgiWRuzmsSY2fGj31Du96tmtOgxd/PVEN?=
 =?us-ascii?Q?DlsMzeyrljoj9AaZbQFYjMEyA0mnkwGUxixI+VjeR+4pGmWRP/s+ILYkFDTI?=
 =?us-ascii?Q?i8st5j13WQ2yjAJ9oc4umzth/7OTYPDYBl4YapCEI2hkHNVHhx1XESAPfzIn?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: cnhind.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026b6998-6c67-4496-270c-08dc62cf7895
X-MS-Exchange-CrossTenant-AuthSource: AS1PR08MB7451.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 13:24:00.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79310fb0-d39b-486b-b77b-25f3e0c82a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNZbW3zDMBJys6fHDUFR9qKY76E2EORSdDtGa6uHEAeBrihN7MJYkDV+mf9oT627q5A6DB9/hSCTFcJ5YvDkFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110100


Joseph Mills (1):
  [mesa] Update do_install as needed per upstream changes

 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
2.43.0


