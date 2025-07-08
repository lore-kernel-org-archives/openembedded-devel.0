Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9ACC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:02:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.web10.13548.1751961744772485880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Iw0NzFKI;
 spf=pass (domain: est.tech, ip: 52.101.66.27, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knJ1o6Y5mSem5is9zEpqLOg0BhGQDwkE2PCdkxIqEiDPu4S0mZD/c3bQEhCkknfuXxsMxNoBIG6IM6LcWc1Xlz3iways3sMXsxmavnvH6oYY9VZTMjOQsfZ0vqxoYPmeA27eaHNGD2CTkqWR2cyYIfikk6BscguwKVYKbEA6D4NP0vIez+TNgQp4DM5jSZ6jIJivWVYfNMgGQNdscrdwirQ1gxHSz22H0d6m5GN6IVZbCLytZUoPMPQ8BBblJ8Z0nX91x7RUzefWOXpszbykIXJWC+jq4h4BU8Ak8ZWvdztA8mGHAfYwgj75ceC0Ab5Hm6DIYXT0RKH/pcYKpWm6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISk13G/AcLidlMHQxkF567ANmR/AeNlyNybvURwFzv8=;
 b=feOQDUWAL0y5YqkctVj5Vgt160wz2Y/y0W3NuwbG8cm4t44VnYknr18zy+t7wDR0skuZBOT6L4NTqo5D1neXTKY7bBpRwFxPbl06mRppOHLBqqrK63T1/IrdejyPnVdpw3nH9bRGcr+O8Uwmy6kONcxxOwIdVT1rpA59iMu2ku3r8rz1QXZbu99BWwkPKWr9vUinsU0+7K0DoouiTlnNoJkK3H+zbxRiAMGyDOaSaP+3l9+V3GGAe3F1DDSMhEmdjiN3DSVKrtTBFIm5qYDDHzxG8SunH9BfruUjoTqJNPV26S0E0mSnSPd3817nEXPdWHJ0Y3Cpo8JvsK7f7/cdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISk13G/AcLidlMHQxkF567ANmR/AeNlyNybvURwFzv8=;
 b=Iw0NzFKI4lYA16nkdfdSpF8JTR9RPoys+vC8XkQfZzumQLETQN7JezRNbI2GxLLhB4BukYaZLBiUvcgZDE3at8lnVHGMZ7dYwhNN46ZrfAXicGKJeL5WetQ2s5vIi6zTF/GTE349Whpgon/ZFXIF1hpirg1WBVF80PcMMdiYtU2d9gYcr2z0AYkHdPoUCl0CIZRx5P9wGfxYZTZbYxZiJcb+gv5NMi5abIh0Qn5Zkt55CZmoLml61bCAB2KfwUEFXFB2U32oL2meDjuIxJwEoMSfedj6c2QvkN0yYLRsKpOW1M27bL4BdsqRZRrcq+L3m0jvkxLfJOMMFCvKRUI6rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by GV1P189MB2884.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 08:02:21 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 08:02:21 +0000
From: roland.kovacs@est.tech
To: openembedded-devel@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [meta-oe][scarthgap][PATCH v2 0/1] jq-1.7.1: Backport multiple CVE fixes
Date: Tue,  8 Jul 2025 10:01:58 +0200
Message-ID: <20250708080158.50374-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::19) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|GV1P189MB2884:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc2dada-c90d-41e2-5c5d-08ddbdf5c44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7oBnBHwJWgvw7GVc30OwxaGzkeQ709Ku+J2pf4ku3kVcTcRB5GT+kEkNCerX?=
 =?us-ascii?Q?09nakUBkHkaVMbHETlPjxK00ETVHIncmpBzaNZ7b80sjTB4BLPmr7VJR6wSi?=
 =?us-ascii?Q?IydvPwymhUw6UyWecLhBKhowKMxsiOHVicCY4hPvLYK4cACVUHIcD6Z6Pcx+?=
 =?us-ascii?Q?1YuZj6fyM7ctICNfJ3oPqULpKfKfrRjAJ/u3DscDov6OTy4e8bXNAFAVZIui?=
 =?us-ascii?Q?TP6F7bS+5MNMKQWYZQGB+Y7QKFD0Q0A7qXlWlIxKqhh0fwJkcdCNqe8tZ9bY?=
 =?us-ascii?Q?sv7fe0dTqv7gT7h9MtMPtxkfb++SrWLnUXepd2K3xPnqTiqoheR5w+inHU43?=
 =?us-ascii?Q?DLNoaRIZft9Ovc1xNZJIiPhxQGS+cWAgan2K2rxtWNjsVQnS8n30sT7C4hNV?=
 =?us-ascii?Q?EmwHyxErIWX/PGFXWSUN+lWArE57x4l8iy5LRLwWyi09L6dRDJFppza1/yNs?=
 =?us-ascii?Q?cCkMvOpMX740RgpVm7UtoX8Htg0xUrT8m6L44/d2WA1vpyioRtB+jOe5DXJN?=
 =?us-ascii?Q?GWHYByegeJYnqLSM0fjMlOckEPULob4S0ho6j8/m9ALW7pLWg4BXy+HzCFw3?=
 =?us-ascii?Q?oWoNIFKzeYUzdsog1dJqn2hOa2Gb6RUqksle23+/oyxEQayl/CH7e/ikjkzv?=
 =?us-ascii?Q?qo49J+K7hjrw4Ieyu95zb6XwG2ie4wLQEkVPHToDMirMgodXWdyL+Mn3c8PT?=
 =?us-ascii?Q?xlIy3ZzLdU5PQAW85GbSMmQvbprsEupe3m2EOs5ZyI9zg7HcGkKE8j5xVtYz?=
 =?us-ascii?Q?cmFh+xY6Dwh7OBl6uxObIl5OwDOy7PD1zuv7oz+1tfZbclvcjArLO7g9TjXw?=
 =?us-ascii?Q?MK7ZXeqTZeqxYHd5Suc8kGPIt9Z9UupRgpVant9L3QhM3nPrODDUQPjJ+KSh?=
 =?us-ascii?Q?J82WbOvD9lAlHPjEfqngSyWwf3cXpfmai5yMyiBAthhdFnQ8sUKosCIBB2TX?=
 =?us-ascii?Q?+6jnkWVRJqri/K2CBHI7BOp0Ulc9xoA7VJqstwx17ZTRdxAvOQxJRyOlhgIT?=
 =?us-ascii?Q?NYck7GATG1q2oqmMZtIAICZQOPpakj7t0Yqxu6GgEhEyfx/OMJ3NeENz59EK?=
 =?us-ascii?Q?zzgyUN2i94ePJC8RUzOt776aa+zEmLJcvHlRGSHrTDSc0Wy0VL7T7YkMfhHV?=
 =?us-ascii?Q?wTODNuRQmXVzUtvtWoQ+5f+Yfu3trqGzExEl+s3PTf33vgeHESl6uyVnUUi6?=
 =?us-ascii?Q?TGR9R4GXwQQNwhhtwINELO7dsvlfuIgJg901RdH54dWIf+1GECqjh94oH/L0?=
 =?us-ascii?Q?uDe1ORDOBVacWPe/8zUSfJO0e++tmRfsgx2tZMNjUYLoF092I/JrPf4/6Rep?=
 =?us-ascii?Q?Q24/3NTlJyVm3vRS/7N0nefoDtTFgdOmgc/F48BWQuAOoghItQ+LH9V78922?=
 =?us-ascii?Q?u6ekoZTV4lEazVnbQZJUYqdvBXRqQak7XHA+e6by9cw+fLeX48ZqlV4WpzGK?=
 =?us-ascii?Q?ZUkZehWSRkE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?23wyylwntO5iKFaezSUAGEJDpHIyAL8NYPn2kGTPrYexXBQcSx+VAuAEvicn?=
 =?us-ascii?Q?LTZVSwr9Y66/dgEvIVhSpUvqRbnBhqQu/0kA2TV0wNtvG+o/U8dbUOJ+2ewU?=
 =?us-ascii?Q?cloDYhfXwaqdY8mmw/53EQBzue7Akrpu5gDl4on4qOXxabnP+bPmsPd1yWGH?=
 =?us-ascii?Q?XCiaKtu3YkDlKcQzv6XoqKVbKhc49yfIMeeIP6flyqF1yY7UjM60t0v6mrCw?=
 =?us-ascii?Q?RdSRgEejyxXzQuIVV506sZwUWJO2P3V4lbEeu7WqNsXG+Wr5iJ6hva0BMR1e?=
 =?us-ascii?Q?S/26vKrwRjFT7tmH/n6bH77Hbeab6Gct0cv7HK4XhsDyljdrTZ4j526O5zvN?=
 =?us-ascii?Q?KVaamfvENLws0W5qeiKSGZLyjcTfUlX1LCLg4YYead4rlX447GPAv+KtwLcf?=
 =?us-ascii?Q?qRaJWrpXlsDuY8Vz8Kw5pT49CpizZxV2aA6muW9oYQLCp1ahTgu5pijlysdv?=
 =?us-ascii?Q?z/pgaI/tDqXmo625MC49mkz6MHbiy6NYXXDhUFE4DOlw5NrMXKL9e1okmb9P?=
 =?us-ascii?Q?7MQfjBUEsnBIdbb3Ne88gxNQSXgAPumgj23povZMziQuSQFku8ZVDEzRaBWx?=
 =?us-ascii?Q?F99fr3nqEzbOxc4tq8oiDfLzSJZI7A8sTyn2ym0rAfG6d87IQRz0oof0yKGR?=
 =?us-ascii?Q?7kGkZQzR2NW4LBWErpewQ+NHKJg7PrjUS+moqeag5UC8PfGW8gdEEz+AMZ60?=
 =?us-ascii?Q?g8VBq12cZObJ+OieykgndlWqAuRMs8lRIDjESge8A9ajDQ9DGNhoc69VsKzi?=
 =?us-ascii?Q?oiRVmnbAjcfP599FhMz2mtdpBdhmPI9CI1UTuRDNSBLqRAqMtNg2PX2z1xqY?=
 =?us-ascii?Q?Pyj3NEXlb/GcCVpXVh60Du9vlrUzKTgfaXl+6SJ+EjYe5jqlqMq7jBGM1E8E?=
 =?us-ascii?Q?V0Gs779VL8Xen3RCBU9XZj06liTcLJQGwTNK3Bi6HFrIvvvMnITM9wFzkBjn?=
 =?us-ascii?Q?ur+9Z2HoWjgNflQnR1DOLp1lpju1et+QLsfr/27uHerhTzMerd4w8TWc0TN1?=
 =?us-ascii?Q?m2wQuszE9kO+IxxwZv2rThnhmfV2pVTT14xNq+6EjPy1lO/qcOsZ/nz5ie/4?=
 =?us-ascii?Q?BzFgdMEViv/SMZZBzF0Qo9qW2THuh+6eC/colyURNJ6XBbYrUj2pKoyzaoxs?=
 =?us-ascii?Q?U64gnKUKmadmuTSF2lxw9HJmICxzf5IQlLHTP0eDAF8WHJdPafAoHLc7E4Cz?=
 =?us-ascii?Q?ycSkuAnnddJglWlyHj0pWo/NO7A/eUYRCT2WoBn2ugydwivdfgf/gs6s3RkK?=
 =?us-ascii?Q?vLS4Vi0ZBiQWESAq4rQ9jfOO+ka+umiBeKPjqPZ54hPZVPrSEpIDCfCQgV/k?=
 =?us-ascii?Q?qvt9ZxhxbPUTL3QVqyD7uvEdF/0mf3oYXpm2CqByWR+snQFuAgL7IrFyou7e?=
 =?us-ascii?Q?cFGdyvbpQwBvKODZSVrc5T/PsNIzAsLT7B1OPtLs5b3O6vXOX8ebLsfCDe4M?=
 =?us-ascii?Q?rVCsmkIIeywJ0BOtBEh6E06tx81hjZtUa7Q9NGsKu/50hDIOfY8xNuuqG2ZE?=
 =?us-ascii?Q?agfX8OrCUpheOZlPIPHchWaSsdCpcW6vffz+lAbpKpGRl6tlL7CruafO767e?=
 =?us-ascii?Q?PZibDH6gwS4EEwFzjNmPCW23WzMGsZNGiFMNQ7LY?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc2dada-c90d-41e2-5c5d-08ddbdf5c44c
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 08:02:21.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTbjswB/hqLdjAfrQ9+oXUEnK9UfAK4Bb7K8wVSDiIu8ldunq0PEoadjkVPT/psZuWBNraUkZ5X+1sTEfvdnzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2884
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 08:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118301

From: Roland Kovacs <roland.kovacs@est.tech>

I forgot to run patchtest before sending v1, so this version includes the m=
issing
'Upstream-Status' and 'CVE' fields in the added patch files.

Roland Kovacs (1):
  jq-1.7.1: Backport multiple CVE fixes

 .../jq/jq/CVE-2024-23337.patch                | 236 ++++++++++++++++++
 .../jq/jq/CVE-2024-53427.patch                |  82 ++++++
 .../jq/jq/CVE-2025-48060.patch                |  48 ++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 +
 4 files changed, 369 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch


