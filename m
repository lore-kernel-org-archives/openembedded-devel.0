Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9630CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 10:24:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.66])
 by mx.groups.io with SMTP id smtpd.web11.9007.1756895087925270126
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 03:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AZvF7Rw7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AZvF7Rw7;
 spf=pass (domain: arm.com, ip: 52.101.83.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dIvGiAsILvClAqm9I8LaSUIU57jQte/Uh6JZDFwWyduVADtq7VepNnf9o8a/vCDk//voyR0O8Ckawdxy9ks0kF0avY/iggKbiK6+Gc1lQ+bON29mrWRoj2guzk5vhi9D5PnDkU5+7sb6Su2r8XhcHC8ZXSmMjeentMNsaIGDpfQAPJHiVTXe12EeHGXroQ42/mGF9krMyT+e2kzTLc9fNjZquogA+5La5MItnCLHhAi6ICaUba1c3PcKbp0nDcjRC7/wQJVJwgxEA+cbsRwsJSBGjLpqZEjYhJgAKvJ17INHfVrbBl2rm2Dj9WyASmxbgR1Cls6G7ikSqNEGHEXWcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfdsl/xn2lA7tqzJfVSInk30TVfITrTldUPdufee/Fg=;
 b=tfN9QGhLq+lQ3VFV6Jg6CtvtPCXNJCJsQsEcH6bEXM85u1bdoEKsGCKdLJ351EBJIxvqusWR1VLFrX08J1uTs6ad17nE3/a2RA7NKGSOoKdUSftKmWbN2rxKRyW8f7q9IYxPyXU8QExyIkRBw/DnDY7IA0oeinpD/MOlUjvJWcp20NXDP00Gz/S2ythI7DmdkspL3mTonm4g6jC8jtsdRXnhiVZ4MoFtjPvvUxPWmE5BDKlFXCZe5RSWRwG7HH5GydiPi9ijbfACsyBnQYe6I7cAiwwAtE6R34lwExRlgddndwQewuTkgnPISpTfpM7Bfa9EyMiaEA/gRW2x6TbMwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gfdsl/xn2lA7tqzJfVSInk30TVfITrTldUPdufee/Fg=;
 b=AZvF7Rw7HHRGkzZMcn/g0fyqPuAkAmvKEp3BxBWH9X67riDHH7CBRjs3o+45/p0GUJBlVu5IDO9R2/hFIH3s5JrpmEOUvxEisdbg7SZwh7JOP7cS1FNJknsUXiMBLbgYTahDDDjDJRolku4oQPhVbFJK6kQtmH4DmCNABT85Vl4=
Received: from DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) by PAWPR08MB10996.eurprd08.prod.outlook.com
 (2603:10a6:102:471::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 10:24:41 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::9d) by DUZPR01CA0293.outlook.office365.com
 (2603:10a6:10:4b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 10:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Wed, 3 Sep 2025 10:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w774nYu5LnxhOnlKsErfTLks/M5yQjjBbeablpXd3vcqcxGY/JitiGGrCTv4l/z1Q6OMQahVwMdl0AOWrkyB5x0plbNjMBYXJV/sUIrifHY20XTfb0vzOtdHEdGoNkzdEixU64dP68bIuVySQt4kmVQ0usaE23xMNHkZj6scGkp5rKqDctNSL8gdyl84lXzeKNvgDjy7t6LOuvmAuyqJx3QZm4nNc+J8fYPYTr3uVbHXgf7CPa+Tv6qJJd59abcLLa28T5znl8Uni6gUDOWVHucRrEib4y1EHOU0N2wSGuYiqRkVD5jXLbLjrbRdVyTXOAiCHh/tG4rprABeaYYnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfdsl/xn2lA7tqzJfVSInk30TVfITrTldUPdufee/Fg=;
 b=lT4o2tQEmBhkeqgAxWb2nmNPcvM8B/GWk7Ph5f4jNdGg1F2IQWAh0bCLenL9Xhb2aZELB71hmmwrpEJj4XtA3dz+Ii01huUKbL++5+31j0Ut4B4q9JxmMWEsQNez0VphQCIX3Kb4yAXa1Uw62VF2DqUuEXl9pLRinsE0P7XLKH8sYs+emS+IfqaAxgSmWg9NQd9pRzl/sq1rv4L9/fUWibBOv5SLQBbUxgweHnTtuQxRP1EX6DwMODlQ5gfkPdG1GUR1vjBt1AsBgYZkkOYNyp+AXdRetawqbtSXrOcmW/LHT1wEq/o4Jg32vZ6wt2G0W4C+h3f6iRNUFFtsbRb3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gfdsl/xn2lA7tqzJfVSInk30TVfITrTldUPdufee/Fg=;
 b=AZvF7Rw7HHRGkzZMcn/g0fyqPuAkAmvKEp3BxBWH9X67riDHH7CBRjs3o+45/p0GUJBlVu5IDO9R2/hFIH3s5JrpmEOUvxEisdbg7SZwh7JOP7cS1FNJknsUXiMBLbgYTahDDDjDJRolku4oQPhVbFJK6kQtmH4DmCNABT85Vl4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9046.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 10:24:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:24:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/3] libsdl2-ttf: require distro feature
 opengl
Thread-Topic: [oe] [meta-oe][PATCH 1/3] libsdl2-ttf: require distro feature
 opengl
Thread-Index: AQHcHJuCxVmnfSRSmU+G1ZTL3kpK5bSBQH4A
Date: Wed, 3 Sep 2025 10:24:06 +0000
Message-ID: <B746C75C-52F6-4089-8590-488EA735443B@arm.com>
References: <20250903062503.122121-1-hongxu.jia@windriver.com>
In-Reply-To: <20250903062503.122121-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9046:EE_|DB5PEPF00014B91:EE_|PAWPR08MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad75f0e-26ed-4c76-6a58-08ddead4171e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?xI/wyGU5nTmNHLTZsE34szO7ej2+AkxpAsUJHkmMhKhCv1fq8rxXqfFWPkwP?=
 =?us-ascii?Q?Odk34PANdIqw7FuD8HDb9sF9/dBlGfnol7w2q/tAy+3ixkVGhqWrjK7DTcPf?=
 =?us-ascii?Q?2oaGfl3l/Cib6atStRtSXAsAWXEfBWhf06Dq6i4tKV74pijNzciazwcu8VDZ?=
 =?us-ascii?Q?hIvMqIGkBHgJWhWZ3tlTYtTPHMEOy7lpB3VQMniyubfsI1KB0/w6D3OIl9EO?=
 =?us-ascii?Q?+VolYigmi6GePYrk+Fd+C2z5CfsDC4vrhhSEWRPddkQ9ApfAjv5CEN2nVxE8?=
 =?us-ascii?Q?DwgCOmZfl6cpZ9amJPsgCEeSSreQuymcS+gubHexO89DJe5dvb6EPeyqQn6h?=
 =?us-ascii?Q?ddjrTuA3OD+kTav6wQRd3vMBTYK7KRmevqSpDUEuhNBd0RXUzlB49SbFIMrs?=
 =?us-ascii?Q?1aWEQxBLDZEi7OPrm1zbFY/sr2MQvOp04oWsyPdIcdVMtqc43jwJ1tVpQRiI?=
 =?us-ascii?Q?/SjT0Cg4GEUQKdrPbnQ69RFHxfxSduNmUUuE0hR+hN/A6TcKy6q/yOcCuJWu?=
 =?us-ascii?Q?f6Qv65C5RBFh0a65Aw0/eMAtTqGM+IBGDLdO8jtJG0VqCl31kpghNrhlAxvO?=
 =?us-ascii?Q?7+RU1XMtKNuYySWy0ztR3TV/0qLl6u+WevgdMVAGoaBehESU5rozC2Fw3X3d?=
 =?us-ascii?Q?bthhjRCHtYUuuxvfEvqqj2fc1RplBYAQt3YgR4yKBCuchcUB9wBJcO1MN7X8?=
 =?us-ascii?Q?fXEl7KEJocJuBC8zRgppGy8lzgtRFR5sfrarrTTBOmIIsSTxoErQjtRR0EwM?=
 =?us-ascii?Q?NoicA34W4wL3Ht9Vp2tb9JtXObHEE95sJzOTMcQkjQm3Sp3/0ZQd9/6FrvmO?=
 =?us-ascii?Q?YdGH/LOr08InJAZPwmw9AicQ3XIlWAaAZH+TKn9KsC7Xweh4TjZfixAigx35?=
 =?us-ascii?Q?iq3mT1eneKqiNmutEpERDPZycfHqLO24GZdH52nduxXD+yzb21K524hTAQdT?=
 =?us-ascii?Q?z/159/t7bJEJ686Wprw/BTIPJMBh1uFod+RiIiITwD/pAapHRl0VvVTC2W3a?=
 =?us-ascii?Q?LIXOQgcAZm1NQ8yK7QCmqhLHIQ+wwlLCWqxtodN7/pjiUG30AbZ9Z2SGIFhd?=
 =?us-ascii?Q?067pSC2hMWT0PlzB315xVfXD9wz07+n9HOXfDpE6VxS/3hJ/hwyNbEzjIPN+?=
 =?us-ascii?Q?xLL19DulGzoLwcw2ugQf1x0sOL+yrxx27wrcgz3/l5GyvmHpLjZuGh2qrQ7H?=
 =?us-ascii?Q?RuwLP7k2EmSmM/vWaFQIA4ah8RpPj6c3RB1GOQe8h+8mxdqoc2Fft7ovUbwr?=
 =?us-ascii?Q?mApsoGGkTbh27MxGBtN/68bdmejykO24VummZmnBKcoKrPrWsazYdpFkkgnO?=
 =?us-ascii?Q?52w9l/GKckZE03qQibsDlOGhqXgli+MuVErj+cjowR8mpgFDaB9a408foWVS?=
 =?us-ascii?Q?dTKOgHb1lilh53c6SjcfwFmcvH6CMPkWwwhsTZO9s1vLOVGAjiZyWOTUK7Pf?=
 =?us-ascii?Q?9XL6rd3AFB/Tb0CZsuCFABe4egZaXdvgX+ftD7DrXUVW4zHWwCi44Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24018B39B3E86C4C99B73195C15C91BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9046
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	42b2ce3b-830c-4d8b-cb93-08ddead4032d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dIxJ35bntJ6eB4F/teAczsMois0wx3IwUAo/gow/v2TseQniMzGnAhE2B6oz?=
 =?us-ascii?Q?1ZMkydlNwhcC/na+hcHfF7SE/+J7uDW5cS0EztwhHBb2MLiGgkL/HP0nOKnt?=
 =?us-ascii?Q?9eaCRQ0RQhM+JQH3nr0o2vGq4fLxAqh19uTc4XrUK85C8asetitJM1hxJSBj?=
 =?us-ascii?Q?RgSnJihVYzkUfIpKH16rdB/Z/UwAZPfaAD4wTbUC2OIZW6WFUr/P02XAAz4l?=
 =?us-ascii?Q?XalO+HPvjX4aSaxJ68I8MQs28g/sHXRV7to3sCk5WijUZofOlb/AbzzxqK19?=
 =?us-ascii?Q?vssA8C5nLKJ5JX2T2lFeOF6QDEujXgj2419rM5shXJYdHiHVJlmYI2xL6PaW?=
 =?us-ascii?Q?SBmrKM96BrZmU1wf+Ch1vKgk4i5EleIhJ7n8QXGduWtmAbN7306Kui8NvOOi?=
 =?us-ascii?Q?4Zi0TinKCt3DH05g2h877mLNBrBogPN0iLbNJJjtN/oziW555TVCZvoyAjxP?=
 =?us-ascii?Q?iKAtUxJdJUvvCBWlQKzEbNhlhgUt5FL71jrgUsUhzAnUQ9P7DoCiYtWyffe7?=
 =?us-ascii?Q?v0pyqONmr1A8IHicKEnfKsJlVccbrYlpPG9yCMuIktwfVMuMxBz+n/gph+VT?=
 =?us-ascii?Q?rTcTeOt98yxIiccxoQdVdnUBRJqSvld4aKD8Y+UA9bXbYZseSAKIu86uyMY7?=
 =?us-ascii?Q?fCZFeBZE40w/xcnTD/IdIflZ/lkbSrw6jMjub1E7VYysyIzm0V0SUiaiAsP3?=
 =?us-ascii?Q?FkD3UODlBW0Z2wBzMUrxDjoy/VQddPJW5iOJ5hMH2PPAl6qBnuXdrOFaVk/S?=
 =?us-ascii?Q?AMT+/M0G2l2jwgpN7GFs3r7iFW8H1ifpmnn7sBZj9D+bHtoHWM+GQoWfwJHx?=
 =?us-ascii?Q?RQsxmQnl6LpJ1nIADVStcs+biuAhDyvXWq1megvWAoqlj2JjN0gH+xVuumqq?=
 =?us-ascii?Q?+0LcPj+qzdPZJ2OUAJCSvZUh+MtT/x9Q+yNd0iaKVqlbDnK1sh474rvUPL7t?=
 =?us-ascii?Q?YI2V1Z2/OsCH9XnmzNhCs2LR2MpgUdPjnmTrzIT0c+HuBCY2PqD5bCQSOmZd?=
 =?us-ascii?Q?dDocjpFIUmbH4y51LeG4QJJ6ty/z4TSjGld0s9GBtPJSxwJj1bU0p8Hs+Riw?=
 =?us-ascii?Q?93DoE7bQPsCoZ1oNDIqf4tUu9E3w9f1TqavZstFK/Rh97lUR9Y416ygFBZBA?=
 =?us-ascii?Q?VxW1DgJGRYxpzt1yPDpF9Y4kkdr8piKWccA2uY2ctK5chQ3BiazY2w7tqYiO?=
 =?us-ascii?Q?qRNXraoOQZI4tShERdVWMRNCxJax54wOw+7WgMtXK7QWlwItmlHQiUiOVQgw?=
 =?us-ascii?Q?QrRyB4s4YKUpBg9yAf1zHdz+jgD0FBAiA3B51Tq8n2axsgyTFEjdfD+Shlt4?=
 =?us-ascii?Q?WVL9aehaLFm5dHzWanVUA6hFP3fDZnYCpmFlcnH73d0PTDvo1vmHc2/skRyi?=
 =?us-ascii?Q?xCP/on8y6QwvPS4iI2V1kP8LTPzbu72efJeuV/B5/VjMm583BcHU2qVkreE2?=
 =?us-ascii?Q?x7tTSwwEmZIS+KbTXJ6x5Er1xaP+1Q1zZ6Kv5O/txEYP2F8aJBDwt2KXCgib?=
 =?us-ascii?Q?OfQtbYxoejNDUsA/qKsjWCzsMR1DkJSDU3Lv?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 10:24:39.7796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad75f0e-26ed-4c76-6a58-08ddead4171e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10996
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119256

On 3 Sep 2025, at 07:25, hongxu via lists.openembedded.org <hongxu.jia=3Den=
g.windriver.com@lists.openembedded.org> wrote:
>=20
> Make libsdl2-ttf require distro feature opengl. Otherwise it fails
> to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
> ...
> |ERROR: Nothing PROVIDES 'virtual/egl' (but meta-openembedded/meta-oe/rec=
ipes-graphics/
> libsdl/libsdl2-ttf_2.24.0.bb DEPENDS on or otherwise requires it). Close =
matches:
> |  virtual/kernel
> |  virtual/make
> |  virtual/perf
> |ERROR: Required build target 'meta-world-pkgdata' has no buildable provi=
ders.
> |Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'lib=
sdl2-ttf', 'virtual/egl']

GL is only used for an example binary, so it would be better to simply disa=
ble those with -DSDL2TTF_SAMPLES=3DOFF.

Ross=

