Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B77C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:02:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23619.1787670122153904115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nHjiD2Rj;
 spf=pass (domain: est.tech, ip: 52.101.70.20, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwswZH5xn8YOmIkYeOFPccFgMKaR54kE0Lc3r1kXAVbuOUYDV6tKbuI6npD4oFHVASjwma0Qgc2FqmcfOOqi364Ghgc214MvrYMaOJj0Eyo7RZD3yeT2kHN29ti+LpqfoQa3+JwKPrlU3pNhsdU1OqXrClyPjHc15xIt12z9tB9vdpqfZ5N8JTscSiI8lyOaJwBgaxYJxc8ViLm4DuVFDYfHCNvzjRTabdbjVhn3/7jSt5M9XiJ1a0jKP/qdARMKOtJ9zVE79Corz5KNU2I6lA/H+1pFJsqgbD5kRGwGJ4Di0NERxZjh5VoJnJ6g+QO/viaklngOx9nGIkBJX5qU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EERE1B5LAUvutktOOqHLy2E7UU4DsQR7JzV2+Zd3mBE=;
 b=suEmdMHSFHo84wqPbQUUy6q4rvfCKO+U1ITVrRRJeiUtImk0TSAHsI2ebsvGPTG85+iri5mTmRwPSui3zcNB3lYCLTiUQTwNmaauM9u3kkSTYPFLRYTfmM0hjvsZLTHs7zl1UxCG2Noa4LC3BU1RFuos1GG8sWUlPh6sjjQsV0+kmrmJZzVNhJEZhmfYuCHh/H+hxvj1zKvukCKGdRPO3XgZDv6oo2DoUTTvkGtL08VFR9O6c1jb2Xm3iVaZc5ExFNfrns6L7kqHpCNnxXs1x9XtWj5Pqx4NvyJI7E+YwCjL1CRl4lsAXjLTzAN3pKs+q4Ne/QCHXKeyYf9We1oQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EERE1B5LAUvutktOOqHLy2E7UU4DsQR7JzV2+Zd3mBE=;
 b=nHjiD2Rjvj2fYCdf5OCZe5AwidzH5AkN+bqaoePlqRgXTXzA6CUVdKsliifE5H1dS6Q7CU6XFo4bdDhR5Fw6NfGnkw3t9EIMhklzHxPXXkrluiFVMhTg44Pup8ZEveCkZpEEHln8A3zJGfmilijKEMZ1/NDGbULPd3TkQZcUjs7c4R2u1JVS2qRCuCHD2+Y+Xe1f5guWX2DBAzHVPjuvYvp2DKOLqCovVM4p0u/c8stP4u1eYEla97eUdn29yo8Vi9Mh+r9zZ15akH4oNM1mC5TrmQPPm/xgxX0xn2KK0pMmHgBhTfow48vKyLyYoICacBNWSC+H/ZQa+IRIVJYnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:01:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 15:01:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] meta-openembedded: fix trailing whitespace
Date: Tue, 25 Aug 2026 17:01:43 +0200
Message-ID: <20260825150145.64061-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: da91aa76-57da-47a4-5d8a-08df02b9cc9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	AjoWU9ZRPOk//6f3ocJr1zT9cXbngGwLUtaw2VvTaAVM5Bwx3dZFXHaIOuivRZtZ6Varfx1OT1bGL2bxRkPM/nKYsqfu/Bf8xEIl7UK3ZvujroOUXYKw0bICcXr8DPMpmdtND31p0C6VJxY5+JhiNJIOeSp1rpCE+TwsZjdFN52m5sK5KI0oPxIhNk3GmeFhm7xEppLVqkDhDAlfvbZ6ImK1wMmrRLbya8d2pSVZmAXHUwsXG9SK/8tAm4vvUU33kfXwEUooS08zEWyMThdNqP9SWzlXCfr8fyqFfslluWs3fIibc8PgYnfLUoaHpJpX5n31I2v4b1lEkQ+hHlVx/zN2cqOBlLStyLWljGNHYynSy/tISkEKGOLNGpB4D1FqbMmVfJH+taoHWVP+cPoXE+dM1yFFguqc4ohXelWNUj4NrljkPZuA3UJEjbcpKYBvOtRqrylG0rYBFZeCD6Hwmoylj3JLBxFtdrc1V1CYsCXLqVm21opFAQ+qWBcbSB9R0gyEKdKDTuILhd5uxIMgRvMimP9isoN0UlkAKBgY1mo0P9891Ajv0ZXcTPJUuul40zPG0HR4WP52kWjJBLTESUkIROewtEuhnjWxWBgkhp5uEadY8yEWyCFTtj8KXB+2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PWnFOshM3cr8fI4/LrMzQ4xX0f9Uw+i9cKIbWh6sTXaPpz2sNXEP1zVMW4eJ?=
 =?us-ascii?Q?RXe4w4G82InKEAkchR95xiohcO/ePwe22yBmKdr5lpZc3aiG+b/avp9vmUrN?=
 =?us-ascii?Q?GmjSBfrd8dBVdttbJToUyQV4t3jrVw9MYMEhYab77NTXifockCXk/j+lNHaS?=
 =?us-ascii?Q?2TeSgm/YdNxA0v6+uuNI0Rqm2psGMH2A34yN+TnFNxa1sWbIW88WKHeZGhPH?=
 =?us-ascii?Q?aamG2A56A58WKFuAX9ffsqhkxR69ZpzLA/XNUkW3GD4PWiPCHWPCPe76Jkng?=
 =?us-ascii?Q?jcemLSmf6t3A+SjDKzxgs9b51bvZ1RWPw+ThVst9YcpCWPf4q719/UTF/O7s?=
 =?us-ascii?Q?ClO43fqvsxx9tODS9Ql4bxjMXOJBMbmiUZrEMxTKYvNgDHf0z7WlofiHtHjZ?=
 =?us-ascii?Q?E/dqjZtH+ZDKpJDe5Vq/IERWAfxjmz6jPxIgVq/1VHwmwiRfcjRhzqIQoZTy?=
 =?us-ascii?Q?oVCBatF/WIigPZf9ubCoMBL6LjFhY/J0/MIJULUPV1Ojq13LkGDB2lYG8GaX?=
 =?us-ascii?Q?5WgZNgre52ZBXoppr/r+WEREbURe1mPme6epFICn6gBjJ2Z9h2kOwnRFMt+W?=
 =?us-ascii?Q?AtwpaHWsrIbXY6GfE2nf29PakD/ldOTE2hVXuw4VuWamIiULTtipi/8TMdWZ?=
 =?us-ascii?Q?H/EQD/vwoXREK1qkwvTNViR03r3Fis05aK8243KGnXdIx1RZ/1nxPgtPu3WT?=
 =?us-ascii?Q?MbgSsTUI0h937I2E/btz9sdMTvsfzoIUawOvkfRtg01gHjOntILkQsjFSFkx?=
 =?us-ascii?Q?e4llvDKRZxnbWqGKxAbZeLQex3csQrwEYOZE/R2n7T2yHnRptlimKa+W7Upi?=
 =?us-ascii?Q?WGh+TNujj/W1UWJvihIDkT7Boo1lSMY+3pwftLFDy+TNbaTi/4zmQZMvlvVY?=
 =?us-ascii?Q?pdmVKUNSTrMokM+1kyoPQOHsMVSTbTmFwW/OHGPYv8aElflEdcetbtOWh4A8?=
 =?us-ascii?Q?KApezNMPgWi0aX10ISwY6xjqwlpmSh+nDjkYImFChfezyVRrsGRhNszvH+7M?=
 =?us-ascii?Q?2Ev+f2h9uVKO00XzNdkafuznwbebRMNaXYeInrvdn5eRdi3DqfR5L7ZRUzcC?=
 =?us-ascii?Q?Vm/aXQiBYBxs4OMTnom8zW0t40Ohsso9tPRCueTes2h4d/gh8YvFclwU7S3d?=
 =?us-ascii?Q?PiCpdcCJXdXLVclaIW/Sn4z49/+TqrnunaTrbBNGbYDx/3RK9GBgLkhr8/6J?=
 =?us-ascii?Q?Ru9tgzSefc609HSXv+l9tGE/65697/Ms+giXApxKWsXaoo7OMbom93YD0Xcb?=
 =?us-ascii?Q?bybMgbs9ADSD4oDMRPpA42+piKXqs1UQ5xYSq+T1bKj7s2h29d3H8zhQXk8v?=
 =?us-ascii?Q?8zN10WydurBw0+O7OkGk6VB3tTfidEnyOrjaLrr8lHoICDV9wksc2OOHJelT?=
 =?us-ascii?Q?/qpATDPH6ZMuXmS7nLtLsKzpfr1LYAYRTu68d2vaqG2B2t7WtBIvISAtgSqH?=
 =?us-ascii?Q?Xl24aX644c4Y1m6xG+eEKgZkqG0FfHN+2K0Go2qvcXm8FWQj6CTBoUxKG07L?=
 =?us-ascii?Q?T/hLeSabq8l9BQmFHGD5tK6Ll/6DvYKYOhqWhlv1CyqPaD7n75Wbr+efIh9o?=
 =?us-ascii?Q?LpKoMKp9g3IGwnsZDP3t8UUdBqV7oj97jpraDfaSpXLsb7YIkJeI0dsNROrU?=
 =?us-ascii?Q?MnCZsKZ3cl8ToRlM1ZTmXNXdSazbkPOsvNGNkeOi6weWA6Lrejeea326bXJz?=
 =?us-ascii?Q?QBT1cojn6N7v4hJzecUfunyzGEcVzdeQiIzi0wdASImL+Fq4SmtmR60RwOfc?=
 =?us-ascii?Q?ZTJHZCrl5M9XUQWIgsiLkJ2XnkItCsbwCRaOoBauGeeMARfB4DbOmf5J640C?=
X-MS-Exchange-AntiSpam-MessageData-1: 60TSe0UKdlIYwuaWaUM3L99ygvTiSD1d5iw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: da91aa76-57da-47a4-5d8a-08df02b9cc9d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:01:53.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juqgykgL7Ep7WQmOXOtql953AMG2+HXRWVe0+I6Uvt4yXdh4evaW6YPiaxjCwcq5phJW3bWSBFdfd3AdZF6gWZe7lzvvq+ZuQ7b2S8Ze/34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 15:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129471

Bitbake now warns about trailing whitespace in parsed metadata lines.
Fix the affected files to silence the warnings during parsing.

Reported on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4284/ste=
ps/15/logs/warnings

Jaipaul Cheernam (2):
  meta-python: fix trailing whitespace
  meta-networking: fix trailing whitespace

 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb   | 2 +-
 .../recipes-core/images/meta-networking-image-ptest.bb        | 2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb     | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb      | 4 ++--
 meta-networking/recipes-support/spice/spice_0.16.0.bb         | 4 ++--
 .../recipes-support/strongswan/strongswan_6.0.7.bb            | 2 +-
 .../recipes-devtools/python/python3-constantly_23.10.4.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-glances_4.3.2.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-pint_0.25.3.bb    | 2 +-
 .../recipes-extended/python-pytesseract/pytesseract_0.3.13.bb | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)


