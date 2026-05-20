Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FFCCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:31:30 +0000 (UTC)
Received: from mx-relay162-hz1-if1.hornetsecurity.com (mx-relay162-hz1-if1.hornetsecurity.com [94.100.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11028.1779280280669797051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=gZUW7imc;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.172, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate162-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.118, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=xkNIF6EsRDULheDSbRXAQmaej/kClzvnS3c/uNeHpoc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280278;
 b=BgJZjyz9puDse+a+b9CUu06qU7o3JmCuUpNussm4+yHIWeHNj3dTAPDh7SK8EkFiwGI4GIW9
 V5paiIWgtffuRJsg59u6d9PvFaYF8NgKqeWrwnii8youv6UvXidTQdc93AUigvNfdW9xeckMMGj
 yEXAl8tsmljzgI5sttIhBo4f96PqSTWRUKqMn7vtsNWlc7VJ/mnh/sHH4z1LSxMWG4seiHcMuE4
 bQIscMN9N8snYs7hgcJXBSGNkk6rX9NqJ7DDUfp8o8VJcujsyQYsSyTwM1XxBeroOLZIxVD2+HH
 iYX6YEysyS0ttVw7JozqWzXSWKEL0+3Nje7NDT/HxBHyg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280278;
 b=Z45VYyD8Kvl+tsVXrq1RAKf7G4YV62y2aJA/AvBG/f/JGVL274i/7LhphGwohI0Y0LiMO/wo
 9BsQiH7MXPbWgsHSiBcjikPjJ8PnTJ3z7d+VeSqxaetgfVNOfiUyw5C20jvK6X4UWj4+oRljpQ7
 u6VZgLsQ0JtGW3abCTTfWQO+JtySbiY0jeSkDiwccGsry4hfWmxcGrV0fp+IXUvNNqx83DKZr8l
 eyJdHt51GmYXmjpQm1tOZLqeCwN1VDLQRWm92WKq1Yw4hX9VZJ7FXul/gTrHsVKewEwkydx5bIo
 I0uokcru2g3sAC2SIEzjqKdI1I1685vnp01fzmMuU2UQw==
Received: from mail-northeuropeazon11022118.outbound.protection.outlook.com ([52.101.66.118]) by mx-gate162-hz1;
 Wed, 20 May 2026 14:31:18 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPx/aOB47jepu9x1fYBSd1RZ71cX/s+pnzRlXlFgAj+wGDQs+wi2czXGfiQ+HfA7FkJbLVdGPFrIYn1WG/SmEKby9CPA4j2Z2bFa2nkY2wxuNuW/1Fx776C+H7bYJVJGl27HKzGGelA3JezCD9akQyzKR7c0cuaRXqIvxOEDqpHEsbkeNqckH+93AoMXu/Nmx9JMfJVOEusYIHoe2f7vdm64YRulspicHQ2N7B1JT90lQq2B0UMpaHYTNvAJwlTLZcMSCsft2hzSIBSvhhR+0SmcsLz/dPu9bW2L7UKF0I6MAxg05K8xP6a22lE9XRMDzuZBIlyVV3mfnF0N60EcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkNIF6EsRDULheDSbRXAQmaej/kClzvnS3c/uNeHpoc=;
 b=ALKDUF9GvMLS+24xl39/FnVO24ArQXYkyVeIW938jEhaFZvJ+uFEKbRjF+x3CGzRYxbuK/mm5Sqg4EUTMdp+0+c+s966Y2jgQNMlwCVoa2HO2gQPPagxK1L3kgmKROFX5vjOMGVl6hS14p/eYQT5O/eVU0MskCEStCFgO/X38ih2NXCwKdl1FsW1h93bB1RELbTzTcCoSrR6WqgCgsvI1caS5Lz/0fIpHVQ7tx6EQF50frA9cQ3LXV3IfPijJsmsZZftSNGDzx7vhRyoRJWtKxapEp8Z7E2jEpbjFYAXU1zJw6chkl0sFrx+funvx27Han9x6oo07k3to9Y6L6VHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkNIF6EsRDULheDSbRXAQmaej/kClzvnS3c/uNeHpoc=;
 b=gZUW7imclOG1etNau0dd3ybMJ1R7Q9aO6pSWpjn0T3VOwJ0aznRy8SBPsPA4eZpRPokP44Afk9J2dtl2Yu/0K2Xz1oFCdaHh9A7ci+NNYozUau5sKcIKPy0WghGUiJJsI2z/N/jTr1cdmu8dUBts3duasTHMU8j69XwWT6BdI21ihS1oPd5G9Y3X7lFFAwP162hlQjM6kqEdMy725ZOV5V8ba8djSJP2XC1LuZKmSvj1/GLjnIKhxzVSlmYOBNKVCD6wHzjK9sRkNRcoJlBLDYRZGEUwLa0B/vf5lfldTuPx25CNQLxvRHFf7W35cyhfJ3xuj0kUb3BaIzWLzz47Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:31:08 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:31:08 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 6/6] dnsmasq: Fix CVE-2026-5172
Date: Wed, 20 May 2026 14:29:08 +0200
Message-ID: <20260520122908.3151647-6-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AMBP192MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c7c2c7-64b8-4df8-3b71-08deb66bab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OQp7gdnxmmCsjMy4s7oVJBIyTi2FbS47IN1MVgQDLZEIYdpCcWUvJTichOmIzTaiyOJVlcwMiOUp8HAut6WBmXN1CJv2vzlui879n93e7MNywMM9Qh88E4wQLoiESUYNgBQ8k9Zx1+v9wlXQfYJ80xThzxFdDNAJXI2HzPB+sFgnJWkWXZHDpmOoaCSkcF+lY9qj1fu+3+rfLll3JWM6lgNzqV9Gowv6objRKxC/90CIMVHxoWFTGni0W9iC1BSj2ExiExYIGkDPuk5iU+82TqlMcwXBJ5j+0tH2z8UQ0cpVR44nWQHUU7IdmYacBDsvM0+ya8Cfn6DgVA3R7qZHUPTpbmsIWwTpo+JD6ra5NiNxRG3EDRyg8JnNVheU38kBpjIwupJcTdCDciRSY3sxqosQLqOXFrlCKR3Kr4NuYuXVhqCezg51zo7Mj8MLfALUtfla+0cWkiN+n9sIMgRqwe9Ie9pkUGzejLVUfxtRVQJrSOJDP3QQzJJ2p+tfnqywdxDJqEfu97vRKKwr53bp762i2hDuaYHVL3KZAoyEaZc8QQRN/eXd8wvvuxGtJSzy1/YQgV/+AL5pdkALNqsb5Hbefyi45K/FwPxAsSxn48DXEaZjKrWyl3h9WS5a4y8mKClNoAE//dHB0I96KP450g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gGdaWW5UnMS5N0oALauegDdWaSOY5YrLl22aW4dYLt/VeozOgglGg6LJPAdB?=
 =?us-ascii?Q?IGjtn/jALy1U9oy3Mvg5+O533M61uQWEdNqck778/Yc5ZjUfnM6/XYEnaL6u?=
 =?us-ascii?Q?jzKHLLKL6IMMZAATEx5LVty8MQqRxZuR5pdZdiEJKEJjPkJglT4RAwkY3QfQ?=
 =?us-ascii?Q?q5vxh5JvjYgTzv5tS/hdEs7i/Pf3wboOzcSWeiQg+dCUnFY/KNOk7M+Y6sBX?=
 =?us-ascii?Q?2yBtKIFmB8KhrQHhKBkGJVCTmxFTB4KqvexiHY+1O9lxIHmrqCxIGGU/sW/m?=
 =?us-ascii?Q?WetZafMpD8GXsCjq3CPWADRMb20+21ak+QGuh99t/BjbLSXY1k8xBLCVJCHi?=
 =?us-ascii?Q?khvHeVzMguGltMUmKBvXq30TWbKAhFypS4X0pmL8PSLi1fAZj65yYnGX3Kwx?=
 =?us-ascii?Q?1T4odvV4W6XY8wBZ2K6zzKMKfwLhz7PyKNp7bjJ53HC5e+zALqElrdqtVvMn?=
 =?us-ascii?Q?muJxG8/VPRMmyndFdqyIZ7tQRQQ9ezv25fY9c3XvSHBABLyrrAohXGA5IoBh?=
 =?us-ascii?Q?hTwwZ2b5Wf6lFS4xgK6Hw79302c0qcJ2HB5xF7uWN8j6nldSss3kKPtQbDSk?=
 =?us-ascii?Q?C6fEKSuiWULnpDEkudZmDiERJiLsphFaXqVCRUcPOTgb6mbtA2MPwajGPeEO?=
 =?us-ascii?Q?YbwDX3T5/UJZfdVgZSvpT+Ecg1YcVFg9EQOkUGvP9FsZA4u07/RqZ1gaJ4xE?=
 =?us-ascii?Q?78Q2gupbFsIVc7E7UoQmWBWfb3U4wPiEVfPHs94Ck8/x+aGOON7CBcweYZWy?=
 =?us-ascii?Q?IbnGOOqjPp2fVU7C1GpHo4nLtG2T7xLiHStL0ZtbJZDf82QKtdVW0xiPyWH4?=
 =?us-ascii?Q?PJEm3aWhnA6+63hJTYrcrm0G8B6nyMlU6galbWk/LEClo1tQ8LU1GYoSBxTB?=
 =?us-ascii?Q?VTIyK73H7mbsuBLT68lHtSgmqWao2eOTP+QdHWm0aF00CC4CYQI18Y53Wu7H?=
 =?us-ascii?Q?U1nE8S3YWh3BA9XO0JfAxURrUHtTV/Azst7nP7WhMo++o4vvq6ja6NbZ4VV9?=
 =?us-ascii?Q?2IVESzRoaD595HWrabb4aKqjASLX58X5ArQ9qq2ynloHvVcqp98KtueJLLSz?=
 =?us-ascii?Q?/DI4VezzzpoJR2JryAcpUifCrm6pUgc5bGLVS4LDYKY1dsJseeGNQrd/Cp8S?=
 =?us-ascii?Q?ZlsH/XhHPDkce+T7WF6H3EcVG4cU8q53GNTCK7lrRh5cOdby2yrAo7Wttusf?=
 =?us-ascii?Q?8ahdE8uFBlUMJH0E6fh5Ykz2OvnSCvOBXmzdKGU9lxNu1G972zCsGOT+9ZQO?=
 =?us-ascii?Q?e3hooSBwKfZOHCKk6/22z9SiEtNxCkbo3Be8T8Qa2IhT3DeVg1mmgePg1o3d?=
 =?us-ascii?Q?IVFxIZxW143xLhOiA8xLh3CFgWAnd0o9UiWoy2hektoRRuK8VSwpotZjL9h3?=
 =?us-ascii?Q?YLAGh0xRJGaLMYqt1yzEz/Y4s7qlj+JW4Ntx6oKDVk51usSgnl/uQVB45ZgP?=
 =?us-ascii?Q?y+z6ei6WVwj1GGQp2pB2ljTane122BnqsAsxqXA2cDqdOh4f6Ki+ke7q+oyo?=
 =?us-ascii?Q?9LUMZKh9ppePiArh4TFlI7pBI7gGhTSznP+R7LsVd0In60GOiIRBKoJMbX1f?=
 =?us-ascii?Q?XfppkoXoa9fc47Fd3DhmbldR5TD+2DEi9RWsz/vU/vsNWm7oDGJtbjQkrAFO?=
 =?us-ascii?Q?k4iXKWa8KfCGd0fuZMyi7UvuqtT5WHEbU/jYf2EpARHIkrw4mScYyPSa8QIN?=
 =?us-ascii?Q?aubxf/EvogSRFc6qUGDcFrYDB2skCxycuhRmd6OEHlXTF5saDwYEXzttfM8F?=
 =?us-ascii?Q?6X6HEXWVVeGNM27hc7l1y2huMjkAukY7LUq0CVVz4yE+OTcMQbZqFdhVhUh6?=
X-MS-Exchange-AntiSpam-MessageData-1: dWKkvipGx9IikA==
X-Exchange-RoutingPolicyChecked: 
	F6Jr7mkOugVAV4Cw5bJDIpUu/yTxV/2aVhOc7kdSOAbvDwlnWZHoA+q1XJqsdqVXN2ZZPMI/vMowOHYDF4KqQPBzl7eQBX99weNUtH3mV6K2SMZeXOoC8cOdFTYhneybhoOHvJkLuKO2aj1JHvYwjiREev5c/oSic/5Ijg/vRuJz1haHbAIKjbB+4JEQZJbZy9SvNib5KjbMP1HRspZETTvMPxW2gcXKvNHmRktvk5SRQp82zeW5o58YzxG1T6Lob7o9mwoGt2uwJHaOLpyCFcw3/HsrTp/EksDdh4Dr3ZcPeJNqP0BsHjlPfa13DpUM+krBG8u2g97GRo8OE5Pl5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lZkW/FWSDTpynXVjIBRsapP0M8zNTntWxmXbK253uAUh7a+/K6NKuVnpKCxhs/6JtO2aAMaL4k736olyxirlYs+A3nXofsLNCMUwnJKlLBY0DjarnrlZjX4fHO4fJEF2Y3k/dpRqkCRyEJQGWE42VU2j3GUtt2azwpvjw/X6kUu8uawbqL1zSJn3hRdidzyWA/E1TwrQmmPR3exLSJLvxnX1Cr9W2GqX/S4OfXLteuTNwV+Ybh2K97a3W1pyCrMcfVpGcHW1ZMIHpRWfLFINfh6QvZufmeRZrjIKCohCDc7/c2PPK85beTUCs3WyLRUTgu63PI0PggvYUZQWvNrVeVzJwa5jadFqiyXEhrrH+rybL4mvjGGdxwQuRy9LU/49cc3wX8QQzGtqD0S4jpYodQPodyaKQvLCD9iYs2vUkAgHUxLZT62LNoKaBkPxjdzLzhBrP5BtR+/BQjhRPCDF4Y3vFLmEERsj6hoS9USUyHJqy2V0mqTjfKAB/bXS5GPN+BGlC4KH5yq/wqs6iYQ/q+VZs0lJZW/59QnOCDR+6ThUEkmo3g+vpuHjQTX4a10RWmHPNtQKcpyZu5Az39EwOX9WwvKDpsItUKpAIh6IjhSHYbdh/crvbo9Ajy8Wgf3q
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c7c2c7-64b8-4df8-3b71-08deb66bab77
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:31:08.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Pz7fedWpC0mJ1sXhiqAw6IJ2xRgeXDP3iDLzS/SsT24enmrZqw8lgrF41rjMe3IDaEfYtMOoBM6akcyblnxvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate162-hz1 with 4gL9rG1hvdz2KXns
X-cloud-security-connect: mail-northeuropeazon11022118.outbound.protection.outlook.com[52.101.66.118], TLS=1, IP=52.101.66.118
X-cloud-security-Digest: c7389a36080246dd7c4397b8a2f3060d
X-cloud-security: scantime:1.845
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127115

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-5172.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-5172.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 3f06bbb6cf..3e8a808065 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
            file://CVE-2026-4893.patch \
+           file://CVE-2026-5172.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
new file mode 100644
index 0000000000..58aac87e4e
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
@@ -0,0 +1,39 @@
+From f158664062e049ec4604f6e772551a00575011f4 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 30 Mar 2026 16:24:33 +0100
+Subject: [PATCH] Fix buffer overflow vulnerability in extract_addresses()
+ CVE-2026-5172
+
+Thanks to Hugo Martinez Ray for spotting this.
+
+The value of rdlen for an RR can be a lie, allowing the
+call to extract_name() at rfc1025.c:952 to advance the value of p1
+past the calculated end of the record. The makes the calculation
+of bytes remaining in the RR underflow to a huge number and results
+in a massive heap OOB read and certain crash.
+
+CVE: CVE-2026-5172
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=073082ddc0aba7b8efa15a688d6183463b65effa]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/rfc1035.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index 387d894a..32dc5711 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -932,7 +932,8 @@ int extract_addresses(struct dns_header *header, size_t qlen, char *name, time_t
+ 			      /* Name, extract it then re-encode. */
+ 			      int len;
+ 			      
+-			      if (!extract_name(header, qlen, &p1, name, 1, 0))
++			      /* rdlen may lie, and extract_name() advances p1 past where it says the record ends. */
++			      if (!extract_name(header, qlen, &p1, name, 1, 0) || (p1 > endrr))
+ 				{
+ 				  blockdata_free(addr.rrblock.rrdata);
+ 				  return 2;
+-- 
+2.43.0
+
-- 
2.43.0


