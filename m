Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BD3ECE583
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=KDnJT1Id;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9VDl+MbFEGJ1iz9RYmcLhd+EKPnPs6KTarf7t+yr3+Z3+5VI6HR6HEU25bwq0VhW+KlIjEkR6yq0J+x5xGidS8CvHGMgJIMzjdN4dkb8qWZ3d7BQhtyDjC7mo74gI+94yStTYwzFeWDn5cYZN/7cK00w5x4niB183t5t1zPZ2rXqv5VsewlmA8f67LiCWhWn5+YNnPJZYqfi0JXPznDO2z53lkE6sLb/wA+CGoVF0T9HyUexuOyzPa0IYAIGrpW0vW4FqtWRwvlxdUXnuuNDWY+up7eLVD+zvQWn8K8zUamIObhGYK95lU2O83BBe2XEp6tECByXX84/6OOCnpsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNMM8AXufVHk3UbwLJnvCYdEyEvPdqbz9VoTUHLl3sw=;
 b=jmXg/+PJrLNSW3U6QfDVIaEoek6xyEJkQ/h13K7jDhutBr09Nm3hdra97bzt4ABeg7PMNE3+4r9+ndhqzcx3TCVANDUqCSb6hBTOnr0XgbSspZNn/zww1sQ5t2iJXApVCHjMPVnYXwpyjOtpf2m6ewrgDU8XIeJiH/gCxfPMwlhGDMvuoFP7OsQGSHdLohWNJ8aIEzoikjQjxwrJA7w66y1gv1o7o3Sl5g5cIv6NrxSUujC+rOBPxjgDQM7RLOYUqsGb25SlqDuE+OJu2L58pTHq33X95c0mernwlQrTAZM85QX8sgZlCCh1IpOPOwQlfOqEEQ9eTUuaVzFLvbP3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNMM8AXufVHk3UbwLJnvCYdEyEvPdqbz9VoTUHLl3sw=;
 b=KDnJT1IdX+eoekFQcT2drG4Ef34xQDFICQWws5Do5dQXLZJY/WI0q/eEnwKvTYqMW6byyOG/8jRF/mxxqeDAE/+q1nxnpZRSm4ORDbtpecY1ti8oXqrNzdJPLrR3KoqMKFBHJQ/gBYrh0+DaQ9YYxEm6VWnjABriXJdGsuonTBiLHBcmvSpf8whNTErTuy5EOar2cDRB1Fsuv48saAsLTi9RbaBg5NJLqvJqQ0sjrWUy1q6wMZhrC3kS5ujXNmUez30Y9LhzTB5eHUAUj2e2NeziWJTax4L9WeWjqL9xTAzojbjbzfdwHfWhozU2+qXjgwY67tbz1/7wIezH2WnF+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 14/19] python3-pycurl: Fix LICENSE
Date: Sun,  8 Sep 2024 15:34:03 +0000
Message-ID: <20240908153408.4114753-14-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 1632ab8e-94a9-4306-8bb2-08dcd01bbe37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x3MCSeyCd+mQYLOowVww5Haaep3bvE2pssEZceCjUKCzOPwMU6LPcVFMA5Qr?=
 =?us-ascii?Q?00AyRCPFLO16fN4on7LwzEeEWsb9ObosgMONWAen9+4m+tfqBjslLxsePKB5?=
 =?us-ascii?Q?Hi1SvjaNtr037FRhUbcXOng8ISwNW1lzlwlRxRdVPvvlxH8fXs9u8tE73Hpv?=
 =?us-ascii?Q?GhBp7SxMxo0AJAIybsUQLn97Jm2dzZJW4xtGWw9MBtjfSsFaoJOyF9NwUQ0A?=
 =?us-ascii?Q?Ck9kRABZMtU8X2JlUfGKHSopEN6AxstZX0qviI0wimnVA22Bb4KmbcvVExZv?=
 =?us-ascii?Q?KAC1xKbHs6t5zcWpKfHph+cDp3K8KkthZFKhsDE7y4K686N9gSY4QkEU5E4K?=
 =?us-ascii?Q?SsHpJ9qbg3avg08kPmTPFUTRGMWlyec1XInqK0osSl0FA0l0Dj7hx6XMImNP?=
 =?us-ascii?Q?mdMm9ROiqrYsTiTWhjBNiyDiIaSe3v29nWvHay2it52EM4BjrEWLGQ2RC/gp?=
 =?us-ascii?Q?50nRKScGgqwPcZuOh9Nw5HKOOFZLq4KAAuaLFwKZZ7k27GtoYbmER/TZgced?=
 =?us-ascii?Q?FGmfg5V8yjU8MlnAQImW/2oP8UR7Z9zQrS5OwqrSDGhSndgSpf+s3qpfERhW?=
 =?us-ascii?Q?QRjsKmkUGoPNMbKpXtoNRYVV3LljUA5h3uap/ElnS3n7t9ETewIrYyp/6379?=
 =?us-ascii?Q?XGIWq3xFhriSRmNr0CZtcqwSFSA8W6ZqumLk4YKxKxBwaAWyEJZYksMAdWw0?=
 =?us-ascii?Q?zWBVCU7z6V8rwFwlnJKbZvfKvrL34itOm8/8LZTSbgxCdS4XC4WRIW6gGfDw?=
 =?us-ascii?Q?n9CNwmtjCNgM+B7trzjzycBAjlPDRGQesFN6W/XrmghDUvJjOrGrPEeNA2/1?=
 =?us-ascii?Q?yUbafvGZ1nwU/rUbDALashG9aZnlsMBI214QDWOU1hRxDGEB5nT7tRmAlZvq?=
 =?us-ascii?Q?amTNHktve5bPBljUnTB4w+XJETroPdCnrIpFxGStoPaXX3deTZ51aAKyYYOK?=
 =?us-ascii?Q?lZrgrAAmuce0JrmiCLEI5QL5uLn7lFhLUgvXnVmT2jOUyTH11OzuHoY5EUCg?=
 =?us-ascii?Q?wFj6VB7sFh8aQUbebm+0NOEVFFEYFNvQpfwZj5WGDFQKGin5tyAKzFQ6/DrQ?=
 =?us-ascii?Q?VjvTQEXmEeBUgBJwGbUbpQLPZkQGNYS3x4G5AG6URSW4xRLtRRj3OrJSLACc?=
 =?us-ascii?Q?Cd7f08UDpmZFuA7HHpi++DEaHi70P9RSNFg1HQNwyAYmsv2/PFf0YiKToGhD?=
 =?us-ascii?Q?1/sfHdVykRjeNmua19zvjW3SgSq/lAB0bOkXRkgOXbvZrfQlN/p7lruAuBOz?=
 =?us-ascii?Q?nPHbriODl+XPtqPQ6K031Ys+cCiCyjF1Zkps3vdibcipvR3TanneK3OzwIPV?=
 =?us-ascii?Q?WZGmzO3AdF06V0uxf8sYSS1gJ+b0NQhlmEHhC+yeTLXUi/DWo7w0QyyipgQ4?=
 =?us-ascii?Q?rFNENnQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pecAKKN1rvNLKyiFJlPw3el9Kr3WGRsM9qMB9vNnj9LjLPSOotaftVDKAtun?=
 =?us-ascii?Q?hFBOt/HQl3L1C2G50d7nRY7HRWDMOBioe/UvVevba5S+bzib/dclyEXqTVFF?=
 =?us-ascii?Q?Ri5zvYCxnBxoqjpQ0uqb9h1f73AB3gdv6mGhRX4Z/bMoa99pUyMAcvHRUlTa?=
 =?us-ascii?Q?7k9dZKo8yuBMK9BYJ7qvZ6NVqL9O1Y3U3kkR0MzMFyD7nM6f4CDlW52CeuRY?=
 =?us-ascii?Q?9NXnsVqPLNA0JakegOSf22uGAoSyUDYQZrqVHDnXzh5yMqn4nBK12IW8Vc9p?=
 =?us-ascii?Q?Z1W4B8yI8o/oLhlbnhPrNoxXF6NnNjNjkD/GbyeH+29t97L4Rhp6xl8Nl8MS?=
 =?us-ascii?Q?deI9+StN6iK44U52nDB9AVyuNBiCs/oPeIusVXlmOrWqqd/0dDIL9X0fMBIT?=
 =?us-ascii?Q?aHMR34FPSPVBn+ZClOxge+QL8gYfTr84McX3kXznikMmLG+s8+WlBZhjtAzy?=
 =?us-ascii?Q?RfTOvsSedjZc2JpuUaEZGrIej7RgLzqHIwatWqD621l7Y8hYEA/l9H9x57La?=
 =?us-ascii?Q?p8Q/1n2M8zK+zQY2CsX+upjOnvX3niDUeC/00ZolQGwEqi0NeOo6tLnTIu3V?=
 =?us-ascii?Q?7VP03abCMWGy6A1p7pbpqwHTqhKmWSK3S2cViL0FWZWnEF8iV5l8q9ugcaXD?=
 =?us-ascii?Q?4SqO1B25FaClkLPnGISD6fz5xyvvB34CMFiVYjvBwwYeGrBNYaYLW3+lieV6?=
 =?us-ascii?Q?Fp15DOy5x5HZZHhXvLvLgui+ltZXCUd1RqfWztuXo63fMtzCqAInQfU/+EfY?=
 =?us-ascii?Q?Mf1UMUFg7SlP1ruWsaYC+tZLtnFt0ZroQoZ0WpiuA42xItEB/5XMRMLFxtJW?=
 =?us-ascii?Q?9bIkQf6TreES9cwuMBENbT/8S4oGbG1Ss1B6r+/obmvpOWfgAiLjcC2JyxfB?=
 =?us-ascii?Q?QhkZtTVnrGKL2h0L9EGTbnAvxLTveQeCb27L1/TQb7ftzfZ3X5Puzba8B6d/?=
 =?us-ascii?Q?gFrLnqcCmU0WjO98RV4lttfp0Eu4oFuciLztFdR+Yd/iTH0+3MEWPQEl2Jcw?=
 =?us-ascii?Q?U9oOluLkoRXYB/MUnrcPdhT4pGUopmLZGIantn+/bXMmeQ0BWvrnm5es41PU?=
 =?us-ascii?Q?xM5VApKrBu0wf4j2zv/pdw+D2v/Mdv3SH0dDBL4AYbPE1NbqnNrTzjyzuOkf?=
 =?us-ascii?Q?yeGWuoEm7VIBtcByETOKTgUOxx2MNR/xO69VFxmzJq+i5GF9Bu9VpTtlhNKw?=
 =?us-ascii?Q?2aehSKBGePdsLdZmYFNUc9EIpcdg/YT7XZDwUF3gyF7kkdvI4AVk3V227iGV?=
 =?us-ascii?Q?ZqdtcR848bYk9N6UvXB3OCmxWcaTST/ok0xNCehhs4qVtjE2USKMas+tZDOb?=
 =?us-ascii?Q?px8g5KZr4qr8Oy+Y09Cm/AEs39MosGxFPdgXhah/mRM0eopEP91wnZirdJPh?=
 =?us-ascii?Q?pVYVR8xCWQQYf0DEM7EPBD8IzEzkB4pwdISZNRELTjgDXmPKg7RkCORI+0EB?=
 =?us-ascii?Q?CJ1SuGlg3IzcMV2Rf2W8CpGYN+4BiBSubrNZacHtMM1ZUdE42e0rKlRRsts+?=
 =?us-ascii?Q?NVoruz2QsXjjKQAU4XYCokaKq/PokfEGXP8RXyk1luBQqgm78SkEox14dUmy?=
 =?us-ascii?Q?nAXLi13i7zk6OEWqabry7KrvNMVFrJz2FRtJmF2At49UkVrfCsfbEwWulzip?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1632ab8e-94a9-4306-8bb2-08dcd01bbe37
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:35.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZ/a4we8LgvNgT7MAnuKX9lPuaE1W+YP5ytRf499P7+SCHYY/J39up7EeeX/49U5xaaPmOtvfFLXkRrtOf3XCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112153

Contents of
https://github.com/pycurl/pycurl/blob/REL_7_45_2/COPYING-LGPL
correspond to version 2.1 of the license rather than 2.0.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb b=
/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
index a6863e21f..10d3cd102 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
@@ -7,7 +7,7 @@ be used to fetch objects identified by a URL from a Python =
program \
 SECTION =3D "devel/python"
 HOMEPAGE =3D "http://pycurl.io/"
=20
-LICENSE =3D "LGPL-2.0-only | MIT"
+LICENSE =3D "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING-LGPL;md5=3D4fbd65380cdd255951079008b3=
64516c \
                     file://COPYING-MIT;md5=3Dbe42e1b1e58c8d59c2901fd747bfc=
55d \
                     "
--=20
2.39.2


