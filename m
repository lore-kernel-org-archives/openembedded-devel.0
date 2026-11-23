Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51989.1795432539297508484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=3OSb61xC;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.53, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4/laLki8w7pd9O7/zr28enTge8svAS4j89tAsGMT8/BcmpJSclZmjDgA9mTDmNlwj9Xol2vYHB1BJv+w6imReAfbsgGzmcQY9Nf3NfH0b5L7lGdyqvKkHbQhGoBEuDXbDR4c7hJ3VwU4qO7EU95MQatbywrzEDGRHA0m5fJRQTjYDAsdLyK0eeHKERu2kEz1+SD9Bv4ezRx0lh+AUWimNjfxSC3WdqdOif0UI8HAoyuHqRrO1QqQZFj93vyeao7CghNmcLpMjMZl6PmT9uhSF2N9Ph80ejPi71788yq/jMh+DqhaH/kLJNsPvwZQ2oaL1O61m9EpaRGUBg8VSozcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr5ZYjxJKhmDjCiwPeMoxrQdHgt2x53NKILRumBF8uw=;
 b=xWRADix8z60mqzUpshAWiC8NZJcaQqIpy3NZJ8kDVBP4uUzsboEmAtwb+nWX/reo+tDKFDrMXI6TqewiwUkq4Cbx/0DaWGAUSgZZw1BrGZfRq9cxBD3WmkIZ9l1Vy626NezMWcc3nwmu2OhVal9l+kG8VkH2OtaSFTopWygnaOqC0IxotnfHxkIVqhH5vJzjeog88YuP9Lvh0Da5hqfKYZDj73MxMSrWe8jGfzBNmtGhc+kJB+xBDCLAvYV3OKpWHZSHBvI4ZDrdBKNlDF4JKZGiPlC/AlvpiPsI5eCuRM4BhhE1UP07P/xUsXOf+23zb3FTRvP+CiokQ4ugproPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr5ZYjxJKhmDjCiwPeMoxrQdHgt2x53NKILRumBF8uw=;
 b=3OSb61xCxTH2TSTDmO9N0Cwh0MJpulEkTHBsiOU4kDu8RdTHOSqgV0BRsFzIKdJVydDkPnS2xqnmcaI7QHuazhQbyyDl/mWhhq/PYf1tROQZty7lqPukhrekNiN3GCmo1ityMe4jh+HbAcp1WXVPIT4kObHcUYISIE4tE73KVSCxypUkJbTK2aHQKPGRLBH7RM5KfG+Xt19KtXxZN2u/Y7ruhazGj4k8EgTl/GXU5VGNcB2+LGxtlHjOClcaSCzsRkqgfu2evZxUZzjXTUwTqz+4lXtH7r1cNSxROq1VehBlZ3WXKtqP/hfQOLitQhY19mkRR+PCEwrDjF/BNPtZAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by PN3P287MB1255.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 11:00:53 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%2]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:00:53 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: [wrynose][PATCH] 7zip: upgrade 26.00 -> 26.01
Date: Mon, 23 Nov 2026 16:30:44 +0530
Message-ID: <20261123110044.53796-1-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::10) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
Return-Path: UpStream_IP-SP@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|PN3P287MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2b62c4-9dcd-45cb-6ed5-08df49510a9f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261026140227099003|261009223027099003|261022105027099003|261028144727099003|261102123227099003|55112099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ptXK1QGDiM7Dc5sax8MxcPITwI9L5gwmAi9douMbNYABZVImLGXWDei67nkVRuwVf8nknjqODmTPB8pyr4rK4RYd39M+Po3GnsEqD+2umkHYwsIgk9A7pHygM/cD/Im0Pr4GF1+ik5ojtc/Exn3krDRkmENpMhdbOEnOUiLlUGBkRfCbDUG5+XgDDGn6ojSQGt5c55kEGNM45PTE7KkH0o9HyAWbR21BWCD13B9NWrSP794xq0c3AC45JQXFrBff+P/15s6oSpzfN9xxcnMSpbA5lIZaX2AgVvq3friPjn/LtMkpL6EKBlAjRRu0Yg6j/kkTfNRWNSZeEAtcFekVm/hSVYaPJedaHXQnUDxszoj5XIu3l+rNFopZ2V54rCH5+RV7PdO72xfCQmgTRjMEiWUW83POb3OjU2+IC8wYvoZmaIzdQPP720dGR53cTs0/5cHF2nCC+8aP/yoficc5i2NJqx9GNkr+h9uZaVYvWlQLL946Wz5MUd+DyFhHMOoLAcRyHbat4AOAaFS0DpW0A22w1bif/ggTTwonm11cZKYJc1fwsR7WItdFW8iEf2WicIRadu5K4K3K279yummdQhhqWSTkCBNVxOoexNPAzqrg+c8F52BUfeVLRgunoXvBTtMBRxLaLA6Wv4SnSWxVNMOuXVUlBOcW3oeEP5IxONJYtkg6CeEQp/1BfAIO7x/pBUOVZBWxvcmGqTSIB1R7nQC5vV9+d50E85DUELII3kE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261022105027099003)(261028144727099003)(261102123227099003)(55112099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fmd1N8YoHlAHy8/qbNneUa1z7ztwlMZEeIml2mtG7qU2iiUmqg20e63wu6RA?=
 =?us-ascii?Q?ZXhzxR7a8LgeeyAmEkEQuWjAt3t5hQtc05QY52SvyRCHJ4uL5HeXkFfedaUk?=
 =?us-ascii?Q?Rm27PdkMp86VooiZ2a/dPFsNrCGm+tXNzApr3nEK7M2/yZ7pioUgvr8xYLKz?=
 =?us-ascii?Q?foleIE7qqe9hcApPiF/aRyU/UrbpbTtTq/KcjEX8BuS8n+deLkkM4O0Y1Ip4?=
 =?us-ascii?Q?YMrjOFjjKClUBBdEUi2hmc8MVWas34tR2eZSKXLo42OXJJtpEXNF4kRXRC7M?=
 =?us-ascii?Q?1ngX0z1v6BkT9o3HoYk3N7GJbgO0N1uSK6m1rsga1JF0Whnuuv350QwvtOIE?=
 =?us-ascii?Q?hoa3ALxaMn1n+VDsV+wcOr8WZF3PcJFQpPlAhmZE5xOho/W8zenJZG2e5g/i?=
 =?us-ascii?Q?HPjyQk/Ni+OYxwrWahxH3CbyBLIKeoQ1bE5VdcQkDyLgEpON7TYqtytwkvA+?=
 =?us-ascii?Q?nezKQT1aqeo4yxwZWpf2QUuYEnxbgVQ3M9tApiUt2w9RlK+oBrvxe+IM5UMl?=
 =?us-ascii?Q?uabbbk4BuRg/Sx+d9mLA6b7WKWJM1pKguvfUtzfd5ibOtSqI9Fi7Bv+NIiOg?=
 =?us-ascii?Q?lfsYFjKdiAfHDwdmusG89sO/vlRaWUSMlUB5hO+geAb7MUWv/6Stdct2BjvF?=
 =?us-ascii?Q?lfxo+5LKKkFoSDN4+tt/YFExxLhsDwNiV/Rg8wC4LGBQSohElS2+bOUKrLym?=
 =?us-ascii?Q?0ot5ccqEIdX5yT+Ycgh5HVS73Zt/dffOjn9pDAcIsNt29hYymlS6IgY/GlIp?=
 =?us-ascii?Q?LdAg3Q3GO0zuAFIYXGFQl0aZC2nIaKcuXOWYo1yDPWKeTbDob/omRP5LbWBQ?=
 =?us-ascii?Q?Rhwjmoq5ONQty7eLZb29CdnlsYcogho02wcFkxIuKRY0GGzomUDWLYcLSy00?=
 =?us-ascii?Q?d1iGqFhrqlQ+825H6XPSxGsrSNqfbGhqF4EgSPI2W+0i4fp6Va7kLpfm7d7n?=
 =?us-ascii?Q?c7wMbB9vsZovWZWiypVjnkOsiGTeRxcf15MC9VJmxB56kuI8TZFUQnk3hJI5?=
 =?us-ascii?Q?+B8PDTiTTVTlQMLFesS+bxzYcZhD4/5ueN1OngDvQPlYsYYDNNmvjKuoqPUi?=
 =?us-ascii?Q?fvdpyQgiV1PtcsoLH1lpZk34Coo82fsh/rhgPrXEGA2m/J/zH7y1rI2xriOr?=
 =?us-ascii?Q?GSCHqaDsFtgbwQgbEPGpXESAFieZqrSnZbHiTwqFnTVpN773LuDYt1kAe/bW?=
 =?us-ascii?Q?esRnyyeiIIFzYPTgPTwJTXwUr6cHuyNpC8Uy5YTnEm5SreWoJvm3UYqYVoUx?=
 =?us-ascii?Q?i2M8JrVynp3Bnuuyu1TqDLR1P+w0wdKFpfJ/XtUtQTSQbdtKAlAett5Z+RAY?=
 =?us-ascii?Q?sWe1r8WqwGPXjP7hY5e06waBNl4Mnis7q0QjyIZz51pvQCAX/GHc+zDxQPUQ?=
 =?us-ascii?Q?IXMCX50lRSHV10adgZGDAxanUVqmDrbc4vP4OY9/dE+LoJVmTSsnSdFGSwJT?=
 =?us-ascii?Q?Nsdo+thj/NNHhw8/J81wM91Qg4ZYbuQKovfzP3o3Y9VVcrECpoGufQ9cYwPi?=
 =?us-ascii?Q?VOLrIaswaGWu4bJbdgQY0Gu4/80XS/L3YXpBfCkqOI07TQFeWojoiwcNcTQ+?=
 =?us-ascii?Q?DfS0JFXtlgRjrjYMO98CkVb4kLtdTV46liEs0PuFqPCt67n4t/Ek/nzgXCVj?=
 =?us-ascii?Q?7rKZ6pVkYRvCM6pjxTZekf+OrhS+T4Vp9Spn3ceILoI4GEbdFoZ6WpUea7/S?=
 =?us-ascii?Q?eLg7SiKzrJYt7iQijJR5SS9IK5b5QtHNps6hgbcEWsme5Y5xqvL7Wez/tsuN?=
 =?us-ascii?Q?8t5d5HrdEzcuF6qBu9XDVLBW0v3IVz8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b62c4-9dcd-45cb-6ed5-08df49510a9f
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:00:52.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLZAuh2xgo1v3b1w6tyR2ZzdZYpN/FWydOjICNaD7QJxXKZWy/Aj2jqdJOjwi1nCZWlBCMA/fAZa40OvKQT6rySBj7d27YslHAAx2sXCtF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1255
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 11:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132888
Content-Type: text/plain; charset="utf-8"

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- linux version of 7-Zip can use huge pages (2 MB pages). It can increase
  compression speed for 10% for 7z/xz/LZMA/LZMA2 compression.
- new -spo[d|c|r] switch specifies the path generation mode for the output
  directory for archive extraction. The output directory path is generated =
from
  the path specified in the -o{dir_path} switch and the name of the archive=
 being
  unpacked.
- some bugs were fixed.

This upgrade fixes below CVEs:

CVE-2026-48092
CVE-2026-48095
CVE-2026-48101
CVE-2026-48102
CVE-2026-48103
CVE-2026-48104
CVE-2026-48111
CVE-2026-48112

Reference: https://github.com/ip7z/7zip/releases/tag/26.01

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 506bd38398027cb5af6cc0bdf5d3dbc4d3f70222)
Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
---
 meta-oe/recipes-extended/7zip/{7zip_26.00.bb =3D> 7zip_26.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.00.bb =3D> 7zip_26.01.bb} (9=
8%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.00.bb b/meta-oe/recipes-=
extended/7zip/7zip_26.01.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.00.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.01.bb
index 0f1e741625..98fd6583a8 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.00.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/ip7z/7zip.git;protocol=3Dht=
tps;branch=3Dmain;tag=3D${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV =3D "839151eaaad24771892afaae6bac690e31e58384"
+SRCREV =3D "8c63d71ff886bda90c86db28466287f977374237"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/ip7z/7zip/releases/latest"
=20
--=20
2.43.0

