Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54364C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 06:21:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24479.1786947662619089149
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 23:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TMTHBY70;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBd8hFY7DpqHCMAFBDSySx3NpsFjqtVLkVxUcyVF6+sC5UBqOX8OU4c6tVcQfDe9ZwsytiHSoMQ6BRr0UJArKgqkVaDFMGz/sM6uxGP+5jPqBzSg4shEhjHPXy/gHII+hP3tDYEWwVOXbFlzNv0H6VblHKT3nixMQFVt+ogdt9JHdm/EymPaN7cRZyutqA74k6FPDLk2FKdnQCejhCiudE2o9NLlNQbmG0XtB9Q0yLqYQtypW1bxytusUoFRpj5fIpmlJY2lJ4yreD9N3qc+ByhCczwXU5lIUOIj5vemp5WbrhjyzT87MQB56SWvuo+3jp5+JDja9PYIsk3oMV18qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxhWNDsu+QY4XwWdgCk/8DVyMAo4V+NHaiYqZsGgywU=;
 b=R9rpQPNsTOrOgzCrFIGt4LBzgPFvqyFdgK9bLvVff7Rp6gJAfqAhdro97gNHzIPBGZuhZpGAO3zlDD329xZN/iZahSEvkMqSdeQ0pHtaijHkXSBtM3MK0TIiKXYXBtcW/3o/PiUS0Xui8AAGSAGldCmzijFhC0aCcYnDt6MGMdIm/99wM917gt7OtqlOkUFWfLA5fNLT+4FMISAlHQ2Kp25TtCt0ylIlnViL50Qsf9b3WpFZXB2edm8jKKw1pZpZadUKjdct0mftflwDIlSJfXdjI8BDSIDF+Jp9d4PTDLu6GzmzMHEFz2z9QY+nsW2j3+iENXlvTbSRJN5Kbpd9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxhWNDsu+QY4XwWdgCk/8DVyMAo4V+NHaiYqZsGgywU=;
 b=TMTHBY70K0sl4qJwTAwD3OQzOaAZZmPP57T5iIOthMXOK0AFcAZJs/1jXY7Yd1vLDQYCCEm8aS1H92+VlBo5vdy+WXzaALixa2HBciee6f2YjC23rjiVf8fPmfx+23dIkQkdrx1XhDVigd41Dxf1QnMAEyMuOOTV8tdYxU0K5HfOyM2GttXgY3vVhx49ILOMdg/cGpc9lY8JCfmf0TeBuIinb3TgjTeZm31GVkUZvUWZptkVmN0/ELSalnVEQb0wO1OG1ja0G9VO9cYMCrnqZM/SQOR/g6X3ZUejyP4otZuA+8xi+bNDZYQJxhKVewcUW1QCOSfGeXs7SiEh9md/ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFA877CE5A9.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::69f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 06:20:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 06:20:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] meta-multimedia: fix trailing whitespace
Date: Mon, 17 Aug 2026 08:20:43 +0200
Message-ID: <20260817062043.43792-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260817062043.43792-1-jaipaul.cheernam@est.tech>
References: <20260817062043.43792-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFA877CE5A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ad4b6e-ab8c-4b88-b9c9-08defc27b31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	D7NCJwEUED1+FHtuzuMAaTOCEO5FX/Fu3io2W4RmxDDODrUBQY+h1bdCjIcfWWlMWgJfawjxw5af19H7n+SXcRHRGYlI0qi8qOfl4wEnA1L712A8jyf9pOIKrv7ZWO8rqFJ+y0bevjXNsW7/hpfLqTJKd2rK1ZDtWLNP1X4vTWMXV/Gzh9UdpT+HV4Tkm2v3iqBB0hG4/wa9Gi3Qoq4OdMVK4w9nZYNpJxit87Jf+XST2Oc5AzOaDvRlYUknUTncrNBDne04GwM7WjFS91BmKHf+bqy+lJ+OzEztrOkVX4RsllhxAJ1uJuPQ864iUYA5j1An3jfCey7t57f0Zv6guLi6yxfsWapSrvgop+rNFjeSqcvj1HSlBcG1qLW5FkJPwjSSLk1tnmb56XhWb0oJ0MTAs73V7N4gCTHTc/bF9odfY9w6iRUjVZxV25YoefTqs65sWYD4Gu5xJXRw4ouc4EY4oRcHnKyAggqYjjKeLDXOfxQyom0I88xHarVyVkl70v04/zSGADQ17dPC6px2v1QSCHF4jzNHGIyUbtVH8aS1cubpVpkQUUoPqVuLbCjMjB3hEi1Ne6yg+5WKJivzJQFasMhyFzkE7jvCadXWTgUC4WZnlR/67LZKmmANXMMoYK0odivewFwITGIOiJzyfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FdwjpUg4QHMj7U786i8l38YyF9Pkxi5a7yMg+GjG3cQdhmx2mzDAimfyImoX?=
 =?us-ascii?Q?PQZCJWnE+Zn7k7tHfWserLyROZJwjVDHHtXaQpgYjBRtcKAlTyaZZZTcn+aL?=
 =?us-ascii?Q?EboMOGBcQZXLoa089xQtaB1AEfqvffM2cWEx/agDoC1yrTuOZXsT7B621aBV?=
 =?us-ascii?Q?DnNRKzF94WA7A6eT8PxzpwpsG6dGxQdr7zIaVeqn52moI+4o8ApqhxzlPM/e?=
 =?us-ascii?Q?QBZDPSX20nYtsH3FZtm0bkzsNBRk6sKYJvr5QkVS4kU0O47W4I+6OxI418Oz?=
 =?us-ascii?Q?66pUVTF6E/WcqIoS2C9AHs5IHEmCSFulEOQ2op/7hOSXLmMu7zp9MVqFUhV2?=
 =?us-ascii?Q?UJE1EvysnIvzlZjl+Jd7PhO2xXA9/ovzVqHZxQxLav5+PT+NWvFZ+UoQHoDP?=
 =?us-ascii?Q?PIuX9GhHFCt7/m0s9IVO4q9CT/aJRdCOWNkcOBy1ObFLp0/pJPnCFWMfKCd2?=
 =?us-ascii?Q?4zn6YzsXHv2w0YTqr+QJv5TysarQmKwgPLuq0vA+9al3wghROwj8f60gtKv/?=
 =?us-ascii?Q?WZJDv5+o308ERUhSXosjvik6Q60OLHWKCAFEcaIe/YvMQt/pIipuOn4TeE0G?=
 =?us-ascii?Q?CJDGzWNNDtflec0EawgXE9GjghJGqpJHMrMj+AOT2NYdK3LqKjdYbr73Wl5F?=
 =?us-ascii?Q?RZYVrW/Zf8gde3k5aI0a/TXOHm0rkMy+k+za5Ia3zfc/CmFwS73kG5BG5gbF?=
 =?us-ascii?Q?arUN1D3Kc/Ni4BQqnsXky2kAN/rNQNSgiG7BFd+uCAgTRtybfzW7Lyw0hU4f?=
 =?us-ascii?Q?WF2s23Q51ZuN/74ScMbNFNfvmeDXBv4XNpp5H0vJNd29HQAhT6U3OVAkxdKd?=
 =?us-ascii?Q?ly1HCVtn41voTQ3QNuWWcTxjLgKifvLJqt0IdRWm3k27Bv2sZ1G6Cm3f1lK1?=
 =?us-ascii?Q?YNY6LMtP1mwpJjRJoLZYJYWuxZoN8TQ9kaBDaJ3TSPMCV9+rcs6PdVX1NlSS?=
 =?us-ascii?Q?T+3nTUsxRx8SiW9lCBEu3gbQpqMd5PSfW9ZbGqXmrzU7AT9ks9jIam54URNH?=
 =?us-ascii?Q?TRaUgUpGA3xR1ZS4ONh3ih4QMF60Oy4Ise1ipnjjca/m0nsNohXnMOBVaziY?=
 =?us-ascii?Q?CtRN5r4q3KETSkknp+COeatxxD40M79edZRHEhPM8v6CucIkCYpCuSOebxdK?=
 =?us-ascii?Q?CPP3BC2dd3eyhP6ZGGKFG5EvN0bXYjCSj4vP6mK2f4VIeQzoNKSgFL/3OP5l?=
 =?us-ascii?Q?sprbY1dpwtUfqsKX4MmiUQUEXM9Kn9M0IFRNQOmcyecuO9HVJ3zYYinSl5r7?=
 =?us-ascii?Q?JfrbwEythcKEqPZsbMnRN831QBDXkPL03HXTQJ48dS5jR/S/k+s0YEf0wHAx?=
 =?us-ascii?Q?7fEAxulb4eR2biURyQGEJqeV4JSEs0DKvutguWG+Z3114P5DQnuXn8Ihoq5Q?=
 =?us-ascii?Q?c18BwqaZjLML7Mbkh4++44fBTrjGuEa79Cat/cNSz0K1alC0WZg7abL+N/+O?=
 =?us-ascii?Q?pU3U5g7bsc0pVcue5ReVsNGsZNHsmzRGGgPwVYlT2OrQ03Yn7bi9w3C8IXA5?=
 =?us-ascii?Q?fEAOXksq2r+Zk8GT0R7ADlpg3wXG5qKOg72QEuUuGcUDLTPCI63B+RHC5eCH?=
 =?us-ascii?Q?GTW0QfCcHQFjHY401LKkD98W5dWrLiUBLpFj4Ta87mQZb8INcL5g60bKYwD5?=
 =?us-ascii?Q?SaaUKvg91QlktBcyijRGMkrTi0jiWMDeY2yD8WC9SZstsUKuzD/C0QrWDkv1?=
 =?us-ascii?Q?MCAu2TUm9LDQEIndGuU4qwJj28I8kEVyARNFTVjOKd8ZhOovWW71s8B8u4tZ?=
 =?us-ascii?Q?NVYp288fMj9g0QC525YRY3YZFd8ZXS8P6CdTjAgqkocmsIWAQnRbD8g1DxZb?=
X-MS-Exchange-AntiSpam-MessageData-1: 28fZwF7pbacmDZnlTlZYHvEKhS96rbLW7QM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ad4b6e-ab8c-4b88-b9c9-08defc27b31d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 06:20:57.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU/4FIiqf+teUqnQus8shOBD5P4GFN5Hsxcnn+Y69B9/qNhLwKioZCVTpkwu/PaIARO3HbXcaZp8ohXEt0SWuvA7McYrITKYMdQVp6vA+LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFA877CE5A9
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 06:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129193

Fix trailing whitespace in meta-multimedia layer.conf to resolve
bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta-multimedia/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.c=
onf
index c96fbcb27c..b48c002d12 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -5,7 +5,7 @@
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
 # of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does=20
+# the recipe contention so the order of directories in BBFILES does
 # not matter.
=20
 # We have a conf and classes directory, append to BBPATH

