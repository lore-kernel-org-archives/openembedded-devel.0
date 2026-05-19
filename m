Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A67CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:27:00 +0000 (UTC)
Received: from mx-relay08-hz12-if1.hornetsecurity.com (mx-relay08-hz12-if1.hornetsecurity.com [94.100.139.208])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21122.1779197215628750142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 06:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=kDBQFjVJ;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.208, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate08-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.83.96, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=gvxpr05cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9a6RwpUeHWbqoSnvTIUUIMuqagu9ZGj3mP3iLqOCaCc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779197213;
 b=p/8CWv8c89vQ3Qysni5/KU/iYDpm02QSOX84dtWY4ofXlC+KKvFG0Da4r50ZgMsBqfaRUxih
 xhtPXbRS98g6xsMIy9zn1NijJLlH09QEg1yt3pihTp+IuxClCDiVabTDyZXmooJFINb5ungMmrg
 t3zxsAZr/e8DNoQFYLU2rTIcDxwcKB9JFxcqcbs45y4VLykgYDnmlIUuS/my3khjFMrNSu0nQh9
 9zuht8Q97N4AGIrU6ekKKby30LCQiAz9Gr/vtQyYdO+unEBgNx/Czh75q18TLQTuCYsXGU0nsrq
 pM8wTPJ/PIJYdPHO9UwnRV218SgOMvWM3Ad93OhI4L1aQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779197213;
 b=GPJ/xkV6xuUbQGr+n3Y1ho1R9GOq5m6aXwivurCtkMY4Ui/t9mUwAoU7Hqta6T8xz3Xj5L1+
 JDYR0FuHMlI7W5kX7mVqvCkHhsNaaEtby66gViQgIxe9PAmFgcs1Uv/31WR/rdypg6VIE/laSAm
 iLC5UIi1sbgTYIfLj16pib1M36WvtVaIQ4akt6vK4eBJqtICMwlyWmHIVejnsysd8+GRF+o8DlT
 BIOVulNLusOK5wXBGKl9FYzbRPAnMr5/1qtP1X38Lx+7TxgYFq2XkyJmo+8pOQQrgIRmoR/pmjY
 kjCVnB3NOf3108eQj6Uf7BJevFa4dUUHE+qdKok1q1uHA==
Received: from mail-swedencentralazon11023096.outbound.protection.outlook.com ([52.101.83.96]) by mx-gate08-hz12;
 Tue, 19 May 2026 15:26:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf96oXDzVtnfNu8C/lPSPTLR+ME2gN0cXFAgetV8njq0uW6JBIHAjPjhGUau+9c2bxcajRDgldBdJ+yyWvDi4SQdaoysP9etu/4CeXeuL0whZ5sJ0OuUI77aeWOfRaqNZ0XoiYq+jwlAc8qUkAfFpva8npl9p8Fp+eVbv+AHJVbGHDO8g42vkqoycRyy34GFpItdWJVaEqGj7RIcWVcRwz9jg3zO1LQnehn2hGu4DFH7rUADCZOjikHgf+8xE/zCRb/dOKQMpGb5kglmh7/d6ntHMgQohbr3m7VbJgV/eokX8aSkRuqQTtsCQLeeRKUoB5uTbt4FYRMqSEo1yKvcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9a6RwpUeHWbqoSnvTIUUIMuqagu9ZGj3mP3iLqOCaCc=;
 b=mVsucq/fjfOmMd6xtWC86aUErguTOT3ABQfkpgf6qNwTcMRdK7wkOLE96iCPHTbffq2a+4dWjmAbkyK2vwHvOCfv0EQa5eNrFDd6OPzVRrpb4AXg0lFCrnmB7r3J0D3vA5TK17ZzJBwefcnnrOgj5Jsxw4kJm/1MaXL6MxycU2SKnYyQIkKGHPLftYKpF1C9VQtJmC70EXtos0yrgwNvM1IyneEiSx4atVCaQ55O7N/1AZ/wmbeJS2CgJcoYmqVaBe67lfHVLgrvuM4LJwjXIwP0j4AkfTcUYzFVP2vHHzACcCPX1AbjLm60sBHWew5atpbag8qEcdmel5KrYD2fUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a6RwpUeHWbqoSnvTIUUIMuqagu9ZGj3mP3iLqOCaCc=;
 b=kDBQFjVJ2JXj7RS9ZngGyW6mtFdXjMaoDi5lcn9XT9O0sEyOadEKCtSxMdqLDaRsnKx//wu0qsJj/bDPVydnXrQtWrc5oGHNC1qpJpEsOPUddqEUEF5FHQon83sLNVM8zSbb51lA0eB5VZm7GBPxhC85vZOsv7aRCXtAV7VwMVPBO/8grDsvnamH7QH4sLQA8TMqV5kMGvA4L8v39WGJkPNZexlEZA2xMaeDZUqChGK72sXvXidtSFMl1miil1Tmpln+qLmcg2FrF6E5eTfRBEyL7EPjkF0dtdDJpnO0EsQj7DKT2/EK9csj1vDP2U8XhIHyeKbJVh+uaZN1Jy8KWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PR3P192MB0828.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 13:26:46 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 13:26:46 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere@witekio.com,
	Theo Gaige <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-oe][scarthgap][PATCH] dash: fix CVE-2026-31323
Date: Tue, 19 May 2026 15:26:14 +0200
Message-ID: <20260519132614.1157984-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::33) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PR3P192MB0828:EE_
X-MS-Office365-Filtering-Correlation-Id: 403ab601-e26a-4538-6887-08deb5aa460b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|13003099007|38350700014|18002099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	mK4tS///TaqPVmqlGjsFoSGtEXsiOYDtaEJzVD83Y7hzuxrQxc0hXfhkhXRn5ceqx2nP1fh3gYpyvS2FK96x+yAADMioIp/Ed9f2JyOjZag4CoNS/Hu61+s8Rk7PEuUmm69haMK/DBpmit4kCUDeJFKD9d1a9V3F4FOfKqwcMQKgnVhRmP5dgzLi9LmquKQcTGokP7z0V0twT5kr5iSkvDXxA0rfcGMSh9ujkjBk+rjthHces+rRyCvBFKesyTghax88v+V6JcBnxDNGY9fp15xobQmp95sZtEhvvn1zNRm6/E0cVYTgOWMR2zYEq0r6743gWCwCcdAmTEPPUrvFFbLYi7wRSvFKY2qjFdfiP0VKFAadeWW8A3MZgWvH+zNUmGb9nQTcd2c+SSDpWdIL1inpxCghVqVDZWxI0l1EyUFGABuMq/QNrnZcNJKcJNjKXvRZfi30DErhlLk3LUr8RMjWEQwFxkBfjssbqey0lHz35+bE30tmXLdUInsHv3KyhE17FrAxhbwEjomNGFdFbWxBjzQNd6eooFmcVWMWIrSMGfH1akCEr+NPmKBOZuqHFh7ESUjkIVWFAzpB5D0T6u4YUZUTPNn5i452eb9n0AYeHm8wo4AZ1IFJwPapOKsD6qiBwM5yV35GvrkRGkqMeR5ciIUnzGJWNcFm9+sWELYuA0B8wFp6cyGZT4kAkiL5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(13003099007)(38350700014)(18002099003)(56012099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IvgyorAgO87szFw9EB7vfLh0W5QccZsrDEudl9XeO6OfiKsweAthFulyFEjR?=
 =?us-ascii?Q?W+Ib4l5E22VZcrRcwDGpaLHuSSyZ7kkcIXAp9VxBCkgEdR5swCQ0tcm0NNZj?=
 =?us-ascii?Q?n0vuynajpAT2xh0lRMjm3+e2JzE4Q0olyJPRMr5jWuiYk77FLTjhUrHr/Ue0?=
 =?us-ascii?Q?ohq/DusfcQPnqA4IL844MT+acoD7HJr/o4RbagXPEOhjv7y6ZnSc0Cav8dDO?=
 =?us-ascii?Q?m7vmuK24hZT1XybV8ngTk/nflEDx9L/Fy8Ge/hmOyzY3gY4XhaW7e9GwiUj0?=
 =?us-ascii?Q?8Gg3c74Sx1xQNYBitqrOa1BxDFsVZ+48rtfurbXd7vwK6ThRA2TEyUdDdbq1?=
 =?us-ascii?Q?0UxRyqpRFvB+Hovg+qYNWDsbscN0Or2PHnp6VOeWdRBapYtktFGBuKKN3PtO?=
 =?us-ascii?Q?jmDc8Y2RvmMRNBaeKBpKoy/haUoMwawLCdc6HcWy3CI+pCToimbbtzS1Y9ja?=
 =?us-ascii?Q?kf0TWE5LNBwwU0ao85J75ENIG6t14JurR8bHX/nURlRQNQ4Ry8gID5bpFhvn?=
 =?us-ascii?Q?99whwt7k5/ZQ1pasj4xxj7ZiyYIsFZPWaMpdII2KwooVqO+LnHDK1k6cU/aH?=
 =?us-ascii?Q?CKB+Fu/2X2HaFjt2aKpy7V5c8ioa7RWwBp7RCBpYSqLL8dg5Cmx3j4DBax9U?=
 =?us-ascii?Q?voBdT+UAzVja8LgKhYFzhPLyZ2DT2zVxKSSge5EsxVJ/pYjezYEcfr8qefFR?=
 =?us-ascii?Q?Z4AGNbUnB3f/5533ywQBQI86XZYzWp7qorEUbtvoUwv04tZ4VnDY8HYKqeYP?=
 =?us-ascii?Q?13yfRdWybgwEH0M8Wk3RZgTnTZbEDjH1rY8X8NegMseKEiMXPpu2A08GL8C+?=
 =?us-ascii?Q?zy0ufAnEq1A2cUfJTZR3KbwLZKxeeOrF6vcUENe9/+uR97UqC3Cedw4K5cfw?=
 =?us-ascii?Q?3TtIG3eRcBb36hYun6JyCHib3IZzWUiEa/gCRbwryJ9aY5ng8Q5f/nH8vgoB?=
 =?us-ascii?Q?xH/b2ZOX5zkacpsUAXjLNQI30Cuznezxms6Ke4hrXQWmL5q+YLwcb+F8QUPn?=
 =?us-ascii?Q?R7ho9HoTRSucUaMak+u1Uv2b1K9sQMfNoPr44i3PieCK4VhlLljB0Gy9Xz9c?=
 =?us-ascii?Q?wBeQEcFWpA3NXZFATz1oDAj876cXjKxrjLpKvmm0KiTJoS8e+iBaV28b2B8R?=
 =?us-ascii?Q?vd8l4JkVL340i5RGocPMdEfGnEYmvQuPqbTKkUnNiUH9dPJZls4KNqoOaj78?=
 =?us-ascii?Q?aEPqcILyoXIVBY1BRMERxgqr0P/7Eej6CNyjJl6w/kyR1B8ItWFck6/kp4CT?=
 =?us-ascii?Q?kSQ2xSTnDSx/LrZudPrt7y2+rJD4KwPvUVnw6pfTzV2/LAH7MEagTdWF/kPB?=
 =?us-ascii?Q?XN3yipdvtvB4X2qPO1mm5uzYqMe44v1uxrQ/0/NjPKgus//cjWRveLDwbgjN?=
 =?us-ascii?Q?wQYdpn718uYFVQIgHWncHgjsuCqGPuEsSI1lsjflayKqQZG4khC0u7actpcP?=
 =?us-ascii?Q?DO5z3etrDTno0jtMd5bvBrJ+2JScO5MTi1qSfX1AR7jtFZKIDHONmWX4Hxmz?=
 =?us-ascii?Q?b7p5HYwhOck8eQbMdxipcFvI65YtQtmesMEgc3tJIcYuTJ/d/GxnY/fvFDtJ?=
 =?us-ascii?Q?j60N/4RzEI17tzScid0aLbzrC4vhGjQ/BbN+4qDfWgrmOXv+takuGTbUQCNt?=
 =?us-ascii?Q?wvU0t/S1DK36+e24Q4Dd8xE8GQKRkD5AEHhu2BTezd6E6GIpzcRkhOMzKyCN?=
 =?us-ascii?Q?ZtpAEPhfMoV2LrMLTrZcVitDW3AT3YtnQsNRP770iyslmuv/3NVTB4sT7Nun?=
 =?us-ascii?Q?nGAzDqowvA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	dyfLX1wHfoURXIC9txKm2QDtCqdWvOPVTZgkzrydbafc9FktuzYl84XVj8DAf5UcPpVRjtWInOKqpRWbmqhCCYXLvi1MoaGE741omZKrIDnra2ZX2N+0Kwk2KtnD199ZtbcHuNzevMxSi59qqCER2XoS3SzAJaCpsEEdU1qqJw4u/9pATIBXTuNoAeglOfAh+Fkvm31Yqh5GF5JMZVbgg5Bqns2Wd9EpEE0ne/Dzrl2WLVWcqCPtDHvoSdAk7Z09Hd7n6iyNUFaDwCFQM3z/6jFpB4pA8nB4uZYatqnvEJ+KS+j2Tekj3+SFe1dHHiLgXBZHYWZos3VV7W5XBtOSlw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v/f7mLwVKe3UHjWdnXaKGrRCgjc1AbYER1RtqG490YD+uMJmTP9BlPRXawhiClhpxhsfo8/tUrH+/2v1XLupoVzoYGTHpXUGp6x53NdBb9M92r+vTctYp0UQ2WgCw7uhB9kKmGB+Gco8dX1D2LNQGrC/6hFZBfmarfTMCcpK6ergjBT6M6odscPIDshdcXgJ/4seBOLwtxaHAlSmUgQRvL1ByMT9nOWAwbfYuq1ed9U3EDLaYRQ5lfjXVNixWEYt+9o3+id62ODJFHJHlYNMRZlrT1ooltVI3pqfckT9dC+kFdo8orKGgbAB9ooe3KakMlFBYrynjCDJpFhr8cZhnPVtsH/7FhYkwI4L3v+v8ttdEQ3xZkgDAt8sYfLuJJ8PfDe/C5i5mKvar5Rk8fBZlYteHaqD4bulH5y+EkQhgG5pMGlyfmL4kb4kJFLErbbB8Gv4rSU2AvhxuYVTZvgkTOWls0NO5RknT0Fud8xtD5VHVMtZgyLED8UwvZA0gHy5UMvb2f6jk7pUtrvB900CGORC9wJRvlUhQWQzm9mnNGzZdhY10PGY+pWN9fyGjF9bSLQhYpaFxqoyKPhC6KmALlhMSatxzKc2XZ4LqUoGU9GLOvow6Nl0nPJ0VRk4qtXs
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ab601-e26a-4538-6887-08deb5aa460b
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:26:46.0001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1r0EcF/l1S+ZDDtR8neQL5ynAe6t2fP2nMic85oBd9PQUdvgbJggZu0yiAmTJ6Dc/DKpTECwR89mOiepqC2fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0828
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate08-hz12 with 4gKb6w2djvz4HMns
X-cloud-security-connect: mail-swedencentralazon11023096.outbound.protection.outlook.com[52.101.83.96], TLS=1, IP=52.101.83.96
X-cloud-security-Digest: 88b2f8458601d09fff80063077712cec
X-cloud-security: scantime:1.496
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 13:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127101

From: Theo Gaige <tgaige.opensource@witekio.com>

Backport upstream fix for CVE-2026-31323 [1].

[1] https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3

Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../dash/dash/CVE-2026-31323.patch            | 43 +++++++++++++++++++
 meta-oe/recipes-shells/dash/dash_0.5.12.bb    |  5 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch

diff --git a/meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch b/meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch
new file mode 100644
index 0000000000..a5e66dab65
--- /dev/null
+++ b/meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch
@@ -0,0 +1,43 @@
+From eeebf52119df7a74ee5187268ca3030d4c701f20 Mon Sep 17 00:00:00 2001
+From: Muchen Hou <996029583@qq.com>
+Date: Mon, 13 Apr 2026 10:28:29 +0800
+Subject: [PATCH] arith: Fix CVE-2026-31323 INTMAX_MIN / -1 overflow
+
+Division and remainder currently guard against division by zero, but not
+against the signed overflow case INTMAX_MIN / -1. On affected systems
+this can trigger SIGFPE during arithmetic expansion.
+
+Add an explicit guard before evaluating division or remainder.
+
+Signed-off-by: Muchen Hou <996029583@qq.com>
+
+Merge the overflow check with the zero division check.
+
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+(cherry picked from commit 0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3)
+
+CVE: CVE-2026-31323
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ src/arith_yacc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/arith_yacc.c b/src/arith_yacc.c
+index 1a087c3..b978ef0 100644
+--- a/src/arith_yacc.c
++++ b/src/arith_yacc.c
+@@ -98,8 +98,8 @@ static intmax_t do_binop(int op, intmax_t a, intmax_t b)
+ 	default:
+ 	case ARITH_REM:
+ 	case ARITH_DIV:
+-		if (!b)
+-			yyerror("division by zero");
++		if (!b || (a == INTMAX_MIN && b == -1))
++			yyerror("division error");
+ 		return op == ARITH_REM ? a % b : a / b;
+ 	case ARITH_MUL:
+ 		return a * b;
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 1bf3625760..1e8f62bb92 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
 
-SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
+SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz \
+           file://CVE-2026-31323.patch \
+"
+
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
 CVE_PRODUCT = "dash:dash"
-- 
2.43.0


