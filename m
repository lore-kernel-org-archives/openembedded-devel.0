Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD51CC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44031.1785766648238233822
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tYY7ebsZ;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQe9dx6J/I5IiYRCvJfuRTsyRAkjolk2sXSQ9qlZOsH+Ek3/VeLjdKQRIyxF6YCVKqiWNG/jP6NXxURJ5gPSXHcd7ACS/Gk94UqI0wHgmJT96A5Mi39WyrDSblqpLM+ngh6PtaXF0dCQC8YIdazuS/EVUTI0vsRMqbqLyOB8WMnf8So2qakIv5L0leyoYL+QBNzvaUBj2exp7h9Szl6mjP60eQiyxboQIhxelVct5uShsvdTGyo0MgonbFs+5FCZXJ3kGh25Lg9F0P9HwbTwH11522tRS27HlMGUW30UAt0zBYRCm+Hvs99xo/XWd1xtlMiJsQ5sKABtDYld/tCibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrLr0xU3AVqe9yu7WJKcGz1358J/+D4BiThxFwN59MA=;
 b=cTf40xUvqCPKbUkdTe052L2aVW8bxfVZ9yq9AmUqhHABAx+6u/Yxp3i1SsQ9RE12R0aw2tk6XKQZdQt2EV1uYYTi1JLaBNzrwVS1hH4GqDwFjBBQOnsGYSIltGmCpqrY0HyOAFr6qNT/Ae6m9l6mGoVzNkCfy9NPwenn/loICOuvUCo7w/weCDfvdZ3DypcnbuWRzpLHpGTPKK5ckSWFqH99QJPmQc9cdnPeJrT2ja82kBerZUhHbRCz7BI+n7soWZi+AjQikQXexw38nBk9F/1AVOj8VAGOPXkHa6hIy9F7ebrKvKrtl8+3WDENjbfcqpJpOQIfLx3PoZkvUzgX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrLr0xU3AVqe9yu7WJKcGz1358J/+D4BiThxFwN59MA=;
 b=tYY7ebsZE/Y0lo+s6kimyNcpvljXDZijY5U/VkykUt5UjPnNw7dDSfRh/GpcGVfXckFRqhK98QwZHQ2JYB8n7fcYJuOp2xGgeBFuiUyBCvcQFyGh8LWOqDymYoCX+T6z5KXWUy7BVxYQGo8hizFXHlbEIoFGc/yyIPuxTQ8Sl1ntl7f6sChjnO6tKCUabfJz7dpWUObCbQzsSFP077ji2xqqHaQiA0nZRk7fwMYt9G3G/J3k0IZh7Q8M5nLFnbXRfh5d0x1xFy+WAUpjRuhWtp0mK7aPAEZLdwYMfs5ywQ6tz2iYJNj5aYdbadltnMpn1UnB97Tsbk3LH5kmhtjNhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3631.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 14:17:22 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 14:17:21 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 0/3] thrift: backport security fixes
Date: Mon,  3 Aug 2026 16:17:09 +0200
Message-ID: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:10:232::28) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3631:EE_
X-MS-Office365-Filtering-Correlation-Id: d091a81a-5f2e-460d-0366-08def169eed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IMaeH9e99/ZBYv+f5fMqyArVKHAM+gKlq5cHBoguRWiWcCtGRaSQSs2hqzjI9Axh+ygMnv+Rdcaoy6E6Nqyfn8WUTsMlV9sndcAP5xFvPozxF6whMIrdCSWdMF88XCqsvoc0tPoto3UIQpGQdpdOyawEvtwVcWwAA35KxpWQ3Tqnq8xeS/TNqfDqXH35/vKNBT39sxtHlVb0PfMwhvEfQs4xyuc/KP583nohHdpJNLgPauv4n2hEGILrfIwixPJvc4/qQEkapU80LmQ42DNS75yg9/q665DK4ekASzpiO0KR5Pdm/Q/30CY40EmarSKVPQ8rjENSL8VpWgNC/SQH2pHpQgyv2S4SjRl0M+opoawNgc++t1eDzUlR/iys0TcCm3rthMdWEPg9YSVXKmnArjqlm2OkPAIkiKZwihx0mb/Z1JlyvMtqkuMG+Qob2AUXJUf2By+K41WsLE1VkLKd15r1yaxOW0jZsS6AQq0R987aVCqBZCRBnKgxJCbM7kYdxRoScMIlQIQDNJVJShpwvTY4HBc12FSulUjQ4NPj/rLx/awyq0LSN81XZ1Tbk56X/oeJ5dlJYuUoDva2aAfWSK4k2/Kjb4EXofhJo1Jhe2/lvTLuxYU0PyPl+QL4SCGQY4WoJyt3fSfgsOhPohff73xLYVNlXGCE0gIIEKrF7Kw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gaJ5pqlInu8AO+cS4vMcwpB8HDgY+iGWONAsJDnRj9yEFhSSVLK2OQWHaDBn?=
 =?us-ascii?Q?1M8ZSpBCBsuqIj6rO1YqhTsUVLZOf/zTS3IhZGffuuH2gDGsrviXiN+awWVC?=
 =?us-ascii?Q?qEeYN9H7N+CGtNqACGuARN/Sm1x4Iq8wMCfvxbhVVFXFTHGv0nIo9NgQZTfN?=
 =?us-ascii?Q?Bda77O64QNU1TaalbRkyOQKpxYpX7VAS7+7ICt4cp23D+4eJPElRRRq3eoQ1?=
 =?us-ascii?Q?ygljFpPTnHX4vn4KqRjR1Ue89mGqYv3enX7K0kJ3bDmTWUAV+tWhY2zVaJYZ?=
 =?us-ascii?Q?Cm4rK7MgpwzCeVpbSR+otwrwyup268nBgUEO/kmbGuLc1KKiONj8d8f1Purm?=
 =?us-ascii?Q?7XwF2a91Oi8//OttHto2XEEj73ZVkyRU1hq6CkjFybzv74AvGk+YtIPZJJVI?=
 =?us-ascii?Q?ljbUbWzdBY4P8Emg/i00f04syrQOC9cEPxkFKRQ1TzTxs5vfSiESpZnSjHgL?=
 =?us-ascii?Q?72cB+wgRCzE1SEfEvo8WeEfeD8u8izQNzir+Vve6ppSjSxEWSetfoFv0ta5a?=
 =?us-ascii?Q?u7D+NKhJRcDvIwNJb8nJfu0mV3iiGGswu7qz+qGW+xyQoomS59NXRlm/OOcq?=
 =?us-ascii?Q?/fMIXVE+og3EMlsUiVZWPORvRK+Q4qNQEOIPAgfcdQ2yYN8yfunuQ7F+Rrmf?=
 =?us-ascii?Q?+vRZ3246WlAjj4M8GDDvUsKsVO6ccbmxOh8Ev6ZxnZ+OSLlDZoygC7goANoL?=
 =?us-ascii?Q?vCr0cqjkDriCRSHPQyszDirDEKjGq0p1iA+BhtOYyTLIAol8W6WzthRxw8Q7?=
 =?us-ascii?Q?abcwp7aIheAg8kAbLP9dhikcTGR+lY0Dz36nO30TE0pt9HI7hCbfAdSHxkUR?=
 =?us-ascii?Q?lzyHMg8Yh3c20TRtq3IvH/28ryZGJYygQFYElHu3+rfpB4CoKtY6aU3GpG4i?=
 =?us-ascii?Q?y4hYdfeRZxn9xHgtE4ycNZLnqsICImiVu2Z2JGC3Q0BiUv7TJpO8W23qAryW?=
 =?us-ascii?Q?UKDFcPzCHiJV7HIB7BXMp+3Bg8Aw6srbkn0ki39FHdUlt5Geg9A9dbjf41My?=
 =?us-ascii?Q?Plvqcw3JqbCQeH0mRQEqamc5tjmAi2qQL12lAHN2YYHLda3lm2jocu8wDjSf?=
 =?us-ascii?Q?veBxk1rnctd9x3j2fOUjyoAu9+YEvXuuOZWUFqzP/n03Fp+36zv3p2m5Q/3d?=
 =?us-ascii?Q?0C9YOgXdTK2EszNVybfj8rPu/eSDnE3xyxI9WjzkqF/rzckBeh7hKEePmrht?=
 =?us-ascii?Q?vUtW0isMptpO0ULHUruBxksDim1IIn+cnora4q0sLg6Egnekh7kU8YN/1iZL?=
 =?us-ascii?Q?Qbulvy+Wtb7L6mjvAn7tK8cDIMoU0xAfOnTmf4I8YeK5UdEvyrDdFigTDV1s?=
 =?us-ascii?Q?6Melqj13JCCH1nrYrkoU05VJHHTl59WZLWsp6QYC4TqGxGytNtTguVy7kprI?=
 =?us-ascii?Q?WfJ6SczK/FHkaqMaoczSKfhsjVO+1yjg77Eu23dshwzWvtMzx0Hx2KXMBLnP?=
 =?us-ascii?Q?GnEPaYrUAvMvRVKzRiuobGWvS/yVjZOchxtRMMKzi9vcR9Gi8R5R0kQrz/Wg?=
 =?us-ascii?Q?DQ99BnpVz2bstTZhzXVATTnkJJ2JrPsUMzjTMRlqDDz/3p9NpJkbQzLx+J0M?=
 =?us-ascii?Q?aHSKwrNPgIQFILI4Vq8BgvciBlryz/Y+P+CI499NQRRtPLM2iHbkkWOPKP/H?=
 =?us-ascii?Q?XLYEm7aamdhtBVL6PmztAz/1n8hiH/gKSrKX28c/Y6GN/HS+2DbU48HZ9eS+?=
 =?us-ascii?Q?W0CRySlqm8Ilzug+RMzN1LjLpuCvlRZCIPJuZR8fEkv+107C4x+jHnWuiHdD?=
 =?us-ascii?Q?39A+PfJlH4/v7K0JfwlyM0nJLupIcSAuxMMBcJ2GkAM3w3MbK5yX?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d091a81a-5f2e-460d-0366-08def169eed9
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:17:21.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY+AjQ4u6oerbyIB5FV29zOahpvs37adFu5hKopJkFkMj2be4yC8HeiO94D8Y3lbO7b1+75qgKMZ+CKYaC05jEaF0fivpCOzXcprLXZgbp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3631
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 14:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128689

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

This series backports three security fixes for thrift 0.20.0 on the
scarthgap branch:

  - CVE-2026-55971: read the zlib transform result directly in
    THeaderTransport::untransform instead of copying the (larger)
    decompressed result back into the smaller receive buffer.
  - CVE-2026-58023: copy the buffered leftover from the GByteArray data
    member rather than the GByteArray struct itself in the c_glib
    buffered/framed transport read_slow paths.
  - CVE-2026-48144: validate the peer hostname (SSL_set1_host) before
    SSL_connect in the c_glib TLS client.

All three are backports from upstream apache/thrift with
Upstream-Status: Backport tags.

Testing: the recipe builds with -DBUILD_TESTING=3DOFF, so the C++ test
suite is not compiled during a normal build. To verify the
CVE-2026-55971 fix, the suite was built with BUILD_TESTING=3DON (using the
native thrift compiler for codegen via THRIFT_COMPILER) and the
resulting UnitTests binary was executed against the qemux86-64 target
sysroot. test_theadertransport_zlib_roundtrip passed; the only failing
case (ToStringTest/locale_de_DE_floating_point_to_string) is unrelated
and caused by the de_DE locale being absent from the minimal test
sysroot.

Adarsh Jagadish Kamini (3):
  thrift: fix CVE-2026-55971
  thrift: fix CVE-2026-58023
  thrift: fix CVE-2026-48144

 .../thrift/thrift/CVE-2026-48144.patch        |  36 +++
 .../thrift/thrift/CVE-2026-55971.patch        |  98 ++++++++
 .../thrift/thrift/CVE-2026-58023.patch        | 231 ++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |   3 +
 4 files changed, 368 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-481=
44.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
71.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-580=
23.patch


