Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C7AC55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:06:25 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42528.1785761978156741678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IK7YYdMU;
 spf=pass (domain: est.tech, ip: 40.107.162.19, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpY28pwIoIn24oCdFpOTVNcC2vPZLC/+REZwS6P6xG2PDO570GQcQ/KhjUdRFqdvFHDWuCFbrjfD8wycE/0qRm6VCbcq5d5GCXqnewFNdWRd61gag6EKabsAYS+L7qxhVaD2VMUijF8n26xVA5GejRQJd0UUp+JlnwZnFPwRBwpET8pPXa4xwjAZjkvNB7MbIc/gn3BfQUWmL8bGB7wdx6wnIPLtOEqRvgyMlE9lCtHKviR7LBfGZZaqCGmy1k5mLgS6ZSXvo1NXiWYBxt+3RvTHDfnUV6zbxzLEJarddKqI5oVTwnyG0K2bT/YgOZCU6vTE03Zjdh6Eb5GJ/xr0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgqOX+01EB4utKog5hZl1xXG33nzBX5DY0HPWbx9rIw=;
 b=E3O2ntN3no1Nmm5N/zjrPFfz4WcbweY8GqO+FgWF57QDp2pXDiMNPQ1A6As/GiPGN0iGKrA46aNt6eB8Tb8zkU7qCBePsc3DG1SJo31Bvwnpl1w0lrI3GTHAM9NS3EYhrFOb3gnRMYLhd4mo6Xtc7mWf/XQGaOW9SZbNK0jKLFMjFDwAjWzdHLZL6TXSEGijOFPbNcxkAToVxoJe4skbPd1STmZfo+WPnnaTx19swtBFn6GyDtmunHSPtMSePuWYuOZdTYdPcUFqAYtDQyEOagNCOiqxROogzl0iZzxg0iQ6oRCZVT4YqKMSK3TDa2BOcqUoFwsmjhRm3WRKtYB4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgqOX+01EB4utKog5hZl1xXG33nzBX5DY0HPWbx9rIw=;
 b=IK7YYdMUJAIMq/HQYUFVyIHvqUwBbET/ttVpdE3HUD2ArxbaUfE6YPdOjPVDG+QYi3n+K4HVrUWjRCKVVBcVGVedP6GAQSadzgQ5UKtox32m4Ya+gbLVlnE6ecJAgCgPB/Z7L70n9+Nw1uZSUGHJhUjzdBCWTvY7hNfy+ZsSnKNhLQ3zbifJrtz2FR+bYXrzsDXHTyvGsEE5yx2H5iCb6G8VK1nUQksfNiOEga4IErJX9J2C+Ixm3jzXYJrqHII+lWfl4wOfxSLH/xYu4EcnU8YGJFb9sEP8LB1fvIpN6kRBWnbZQdJX9R90EWJHPsq+RB+Y/9LvPE79apcbweANmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2050.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 12:59:33 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:59:33 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 0/4] thrift: multiple CVE fixes
Date: Mon,  3 Aug 2026 14:59:18 +0200
Message-ID: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO0P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2050:EE_
X-MS-Office365-Filtering-Correlation-Id: 67712850-0eb7-461c-4a92-08def15f10ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	hbBCTmV+XP+3h0S5hws6nT2cuK3Go0DjlnS4ZYZxaS1zPh3nXgslul5f6Q+dkBWRMuFhdbQTedzc8fc4sUJMi57Gr5Y0UglOLPQMxPB2N1C0NUeu+IVnGK4nXy9RnBCdpy2Iy67kREmYnm05lhnAv5/+ZBm1POevvXme5iuqBNy3ICAyqO6Ha7CF98YmwZqZTEyM1mmcDfeYuW9quqj4m25R9Tq6aecsad5I6qqhk8GmZJyqMG29BSxEUMtUNiiNWHgGT5jkm2umeuZtH5n+5JjnMKzfDJQwWKuBdKHnNfalXR57qsqQ0DK9zy+PPHpDvL8CC31Jdg9dtPVp/JM0JwSPeajlwJePPGm4+b3tjp1ue+EMNjqrEZaTeqLEq1XQO3PMHbaL21PwQzTM/G9QA1NL7M3Iu7t0XHxJUzSN5uGIv25O82tph9agFahHAGiImM2OA/ZWUaB9vLxtQeAkv1Ilbr01/oFSUguYx1qPKUcJGATE4elqrjmrZli1y+fLEpca0BBHAZyJirMmoyP4CW/IiVZfNYsIhPQ/FLnNB0r7XtIwz+pzV0GDtMvJtYiZJ7xC1sT23rW7/glLRwyS+Dzg1inDhBYq3n7+qfkjyHIMfLf0h+gl31uIn7VPX+JaSxJyMrIBEUopdThhc5cO4urxGKaZdAa25z/XGPQ90D4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sxgsr001ybEOpCihCrcnGlefzlG3Op3Dn+zPLYr0cCSsdfEm8FMlXTwptT8t?=
 =?us-ascii?Q?FD+5c429xyujgzuS0PL8bUmGWZC42ir+yBA0ciO2wY8ZudBuBUqPg1aiNitg?=
 =?us-ascii?Q?2RvwhXI7c77lS68Xkp9KklJAoMBQhRObfjUj1aWRJSI3/kAMJovbyZ3ThsDk?=
 =?us-ascii?Q?dbw4OiaJ6cmIfs6UUDNE22v/uv+uwMr4RBQvbdUqIjkiK+5efMvLCh0emiLb?=
 =?us-ascii?Q?ljPcCMfZFZnXjrseAbpa7AYM2LTfmtUct4Hvwy5bjHjj/8sEurkSnSrqCJsI?=
 =?us-ascii?Q?FH32gdb5dSvoBisxjm7OB7ZvoACVXHKFAr8Ic1t2WI8jlNp9SBzf7iiPe5bN?=
 =?us-ascii?Q?Jl1cnGWlapZY33f6FFJzhGDluCuptqOMd3hPAG7chkXTAvevydKhMq8MAgCV?=
 =?us-ascii?Q?+hbBaNiSKyeQ//JAWJdu4i+QVavdZWmCuLL2txYDBSn5NcXQhA6cweHagVdj?=
 =?us-ascii?Q?HMLiqqB0Gjfn7/OpQyxqVYp7befhsRGRQ1O6M7YeFvpgRIyy3iHs9WI8JptJ?=
 =?us-ascii?Q?DtoZ0R5ztvuIH4we9eNxCqRV8ykFtJ6QFsGEQvKOoKmDpUIhcmidjnZch/uO?=
 =?us-ascii?Q?r8jjco4eSWfhoEPQLTcrkgf9Wo3uK0snZouedhfNykW7MERIyfqTuRgJDuy5?=
 =?us-ascii?Q?Av9/yWHHAZlQW2Rmpbe0baw19oQytC3RGggrR/Gva4dMj+9D5bjh4VRpItLt?=
 =?us-ascii?Q?IAyYtJQ22ABkQL5JY48XdIRMtSuO+5+YUzrW0SdU7t0Vg1Lki8Hbe4spDeYl?=
 =?us-ascii?Q?wFLccilCzMvrPAPZSyhIOLptmeeSmIMaZ+D/ojUTvvQDL9sGSskx5hOKQNu2?=
 =?us-ascii?Q?wF6S5jyIDDqQdv2pNNrVl7GonbHyJ3ZrwP+IyCOOnuY6AShUjNK/oGDmZHb+?=
 =?us-ascii?Q?KuECLoqyarUqzddWWrVM0RHWGp954ttSD36sktLaUlhOIp+RZc8GupsrxXrK?=
 =?us-ascii?Q?+AAK89GhEvA9DwWz2F8l3Zp/GBJ4NyiX+MaORmMuEw5gqajizWbFO2HPJ/8E?=
 =?us-ascii?Q?rijOyZNwM10lirEr7iVQwp+dnHUZ1+ThA1b2R5AyixYeJbjBPMpycP1XiAMG?=
 =?us-ascii?Q?9BPQ+6k140BFKwLOZAdB8VvQSWY3XupjzajQ8FHxYnLmwxD5h0l9GENDTkAl?=
 =?us-ascii?Q?C8WwVXXRxEkxBeV8rtGs5Jo6lF8qIhiG58S1EWOPVyPbloHMdh2EUZj1hfVp?=
 =?us-ascii?Q?GHKBlPTuNoMEdSYgB9IMglO0bGdm3P3DTthH50lqHxK4HDMqyy8QMi4IJ6+J?=
 =?us-ascii?Q?vieaVNazYbO39tV2AH9KqsCFQmRrbSCZH32VsyxAjpX5zbCTVLjRdXLapjl7?=
 =?us-ascii?Q?a/7X6M8zOAP8UyK5ajkGivKG49Zotai22WeebAseWfgmZpSfXvr3bhgz9Dj+?=
 =?us-ascii?Q?vRwqdTYr3ZjZ8YqR/or5kaDLtUcaSE23giwtKxG5Mf/Agd1gOZw0XlQFJ0Bs?=
 =?us-ascii?Q?y7U7JhYRx5HFaINVkZfvyKtFuXJfdNqjsE/1GrJ6Q3U4BJkYZjsgF1UGsT8l?=
 =?us-ascii?Q?uN9eUrObSeUjrgB5dMq+QIKQQbsIVD0QEs7Ck5kNSQ14n0XeIp9CPH1Zh+cc?=
 =?us-ascii?Q?GC+tXM8+D6Ub8CLgiy2+9uPoH3Xiq704hVfjwZbfiHxh8XGOFEUfNnJ215+e?=
 =?us-ascii?Q?YehI4cUHb+EI08B8k2RCUSv2bx7cpynUlGjN+HZkReq3Mks/bawJiBjx1vMh?=
 =?us-ascii?Q?PRnZDQhX6g69y6Kyd+zI9DWPeDb+DG/xVn3I9v/xXUZLPwEro3gTsNfCPfEC?=
 =?us-ascii?Q?itG/Ygt6td+3IRD4PpNVD9biPWibPBiPrYa77hakPFMYP3b6MT7P?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 67712850-0eb7-461c-4a92-08def15f10ba
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:59:33.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZONdxffIi5mTcp/0ePvxpHXBvVqEBHICGw44CAXBBqInCrj1/gHICtqZ0v2TvpcMl5iLMEXoY4SwgmZtuba2X+QmMi7081c2YCnfNDm9EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 13:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128684

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fixes for four CVEs in thrift 0.22.0:

- CVE-2026-55971: OOB read in the C++ THeaderTransport zlib untransform pat=
h.
- CVE-2026-58023: heap over-read in the c_glib buffered/framed transports.
- CVE-2026-48144: missing peer hostname validation in the c_glib TLS client=
.
- CVE-2026-58389: max_string_size not enforced on non-strict binary message
  names (Rust).

Tested on qemux86-64 by building with BUILD_TESTING=3DON:

- CVE-2026-55971: new test_theadertransport_zlib_roundtrip passed.
- CVE-2026-58023: new ReadAcrossBuffer and ReadAcrossFrames tests passed,
  and fail without the fix.

CVE-2026-48144 ships no test; CVE-2026-58389 is in the Rust library, which
this recipe does not build. Neither was run.

Adarsh Jagadish Kamini (4):
  thrift: fix CVE-2026-55971
  thrift: fix CVE-2026-58023
  thrift: fix CVE-2026-48144
  thrift: fix CVE-2026-58389

 .../thrift/thrift/CVE-2026-48144.patch        |  36 +++
 .../thrift/thrift/CVE-2026-55971.patch        |  92 +++++++
 .../thrift/thrift/CVE-2026-58023.patch        | 231 ++++++++++++++++++
 .../thrift/thrift/CVE-2026-58389.patch        |  93 +++++++
 .../thrift/thrift_0.22.0.bb                   |   4 +
 5 files changed, 456 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-481=
44.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
71.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-580=
23.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-583=
89.patch


