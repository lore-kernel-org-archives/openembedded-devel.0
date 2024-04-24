Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A622C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 15:43:07 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.60])
 by mx.groups.io with SMTP id smtpd.web10.20053.1713973383159415665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 08:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K3+kMAq4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K3+kMAq4;
 spf=pass (domain: arm.com, ip: 40.107.6.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NE4hddsP+p/+yrQO595MoBoFYWGovRD2uT1wxtkLlMQDFvf+dTWffvL1lL93d/+lfOeqBPDtmuUi2pIbHVnBNyJkNpg56YY4NZ5yqpZvJKf8XrTpiUwsGatM4XSZa8ZxJ6AT8T4JHi6mVtpkCsbVpewJ8GSrZ5TZIdVbAoQAzShtqgBQu5WsxaPICIkzArTQp9ZrRYuAgiVYegpmB/fDV/SJrIu5MpsnAt+6gY6QZQgyu9SvbTiC2HOgonpA8Xs8vXVSOYA4wXSmT/t4KwrM++Vw4SZJCyeHVVDlMu2Qi5dsNExul6c1ph0pWgJfPlewdfL9I1OQNuo2Dt8Lb++FEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzJneS9Xde9QLX5nxN0Kd2r+CDxGf7tCq9nbFGhNQ1k=;
 b=A9hO16lHN9B1qKLcYthE/FUVTRLyn80v/CoBNMC/syOeRIdh9xixA91FuZ97a8KFu+OVwdSyvV2oRnJnRUGnizdU2lMJcwGR7bEzx1cQqUG3IyClgABHxZ10NmlYu8Yaqt+Y5lNnzY2aPYuhSt69PnNFkYzbLeS9oCRmOK66Gf+jaWtADrQf0XM6Xqc3XTx06Xq/k93GLd8Oyil/Z6j3+W/vgwiEuWK5LreFKHI1Nca7TuzyHtQsPHpVNF8GMsRl8GP9zaT/mUueOQPbv4KamgsdNhB1Vd+g3wLvtIXYSDNFIACdl1YGqU8J263vX0A7L3b686Aa1BooGJB6kBGs4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzJneS9Xde9QLX5nxN0Kd2r+CDxGf7tCq9nbFGhNQ1k=;
 b=K3+kMAq4gyjsTgC0eOFKU4EAOEPPvtWpz2mhll7Z2r286gLHIUCBhXf0GFXVKpmDolF8rYgHPvdXDRw4qe3NFh8QblYrCdm3X2L3OouLTNj8DDP6ISWcP2zpkFFdNBBpdn5RMvEJ/THqqNeD15sSjQdEjMjd+9BZ26q3oLo/LrQ=
Received: from DB9PR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::18) by AS2PR08MB10226.eurprd08.prod.outlook.com
 (2603:10a6:20b:62f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 15:42:57 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::5f) by DB9PR01CA0013.outlook.office365.com
 (2603:10a6:10:1d8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Wed, 24 Apr 2024 15:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Wed, 24 Apr 2024 15:42:56 +0000
Received: ("Tessian outbound ba75727f6dca:v315"); Wed, 24 Apr 2024 15:42:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 731a5dc1c4a98b56
X-CR-MTA-TID: 64aa7808
Received: from baaaea1ff777.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9CF19C6E-C561-41A3-BC5A-71426FCE60EE.1;
	Wed, 24 Apr 2024 15:42:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id baaaea1ff777.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Apr 2024 15:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXPROZ4kbagTu8a9vmwXp72CD4GR8XFHYP/Cly9w7CeomRc8TQMweiPNyMgriSiQxl8cW1E+5GbNTVKnMKGboCHi7VBWrSgtT2oDd/gPc6oKOsoj6tFZoj0SnkWF6fNFnJ8fBeEy1A8L3VBRGVSuCTg+S8exRwPahi//7a6QkTn2AEesVf1ujUqW5SvtpWqqQtQZO0sOMdHT63YkhfTk107xOFSZwrlwlIDwYSnneT8S8xEvLh8/gBNUQ4DOiKoWSCxYYe0NEoTe4tFH8Nbbz2JhSucfw5GhuQXYcRcXEiQgN2y0o1lLogjhmV6tCtB0ELt0ZxXvsoAkBhDQskQT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzJneS9Xde9QLX5nxN0Kd2r+CDxGf7tCq9nbFGhNQ1k=;
 b=eehdo6vGX0ATTeoFBrKHtsDAJJnI+znhao3fTjc6mjl4ybJyXAO9LL1Asu9dij/6cP5YWH/to6f4AvzMd5QRKc4h823fFybVaR39+nA9JFhrKrY3thAPQTtwJAbZKlYrnYUXE+vMHVmm6wXtqt7n9X3sjN+/+/dXvjlb0RaRH271L7B7DOyeqKOqQVNxHKJxc4u8V/p/5aOxbpq9Q0fF34Ala2+crVbbJOZihIuYGd9R842FW2gy7iIEbrCiqFdgC6KrmKMsyJI4Tyl9jgT3XG0r1dwPa/dsmRW1vLntVcIUs6NN/QJ+3OVv4K9d2pzLLrkUDyfLU11Om56Dbrc9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzJneS9Xde9QLX5nxN0Kd2r+CDxGf7tCq9nbFGhNQ1k=;
 b=K3+kMAq4gyjsTgC0eOFKU4EAOEPPvtWpz2mhll7Z2r286gLHIUCBhXf0GFXVKpmDolF8rYgHPvdXDRw4qe3NFh8QblYrCdm3X2L3OouLTNj8DDP6ISWcP2zpkFFdNBBpdn5RMvEJ/THqqNeD15sSjQdEjMjd+9BZ26q3oLo/LrQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7808.eurprd08.prod.outlook.com (2603:10a6:20b:51b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 15:42:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 15:42:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
Thread-Topic: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
Thread-Index: AQHalkqimHfS5RwrFkGjNTJJ4qxR77F3fhWAgAAJbACAAAf4AA==
Date: Wed, 24 Apr 2024 15:42:47 +0000
Message-ID: <CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
References: <20240424132329.2706-1-f_l_k@t-online.de>
 <CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
 <GZCGCS.7L0JATLUHBTN3@t-online.de>
In-Reply-To: <GZCGCS.7L0JATLUHBTN3@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7808:EE_|DU6PEPF0000B622:EE_|AS2PR08MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: f10e5de3-afc8-41a0-203c-08dc64753686
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?g/ivZ5yEHMSHga1VKPsouMzXd4noE529i8ZTlQV42em/h+ttZCVMVk+GlGSZ?=
 =?us-ascii?Q?ZjdX+BIhAyi9Uv80QSurLokT8gulI+nol+7atncYlVB/wGw53uySIyX+t1gJ?=
 =?us-ascii?Q?1E8ifOd9GPXpGxiaZ5INf+8zmXKotzESgBXFb8eloh/urI8XmWM424j6ulMz?=
 =?us-ascii?Q?c6jRKog2IvHKn7DEQvB2lRRDlyLkxWt6+UHrtpDLvw+De+GD9NvU9kNCa1WG?=
 =?us-ascii?Q?Zgg/1bPgatiFZ6imo3zxUO4wabdqMCpbizgJhcbzFd59WyQgTpTo97z+DE7H?=
 =?us-ascii?Q?1o8jz0KUkFXuzI4bXkEp6/vfXY8Re98j5EFv+Bm/QnYQQXr6uB33r1exQvPS?=
 =?us-ascii?Q?0JFPZP6D7Qth6C8v40Npx6BgbNAXY74NL9VqbCZBSZKQZEA6a6GTrX8opUe1?=
 =?us-ascii?Q?18RRhGtXcBBtDhPnEYnFtZB30Va7G1Xu+ZgC6OcbAKsa/2/vNJt9waEH3qaU?=
 =?us-ascii?Q?kcMr4BJzT26wyV6RqlH8jPY5dXXrJXczoMZHoUEKvwfVQnQpFByDdPkjyCOe?=
 =?us-ascii?Q?Ql05OnPZjLbfYt193XaefjfKssRlQX5mCFyuuy2opBWcgZ5Yiukso8T1QlRu?=
 =?us-ascii?Q?fXlP+RkUNGOOkI6G67J/yNDGopRb45JWl5rKTjw1gBBoemfXLPpbjUwORXdQ?=
 =?us-ascii?Q?OkXm0tRBk48V1JYv1VyEGB3xZy2jbD9mZN44cQgKmubnh7r5yMjE6ZXx4JRl?=
 =?us-ascii?Q?Z3fj2Qvw665eahDLdzkQKpcC7VH/Upkz+ZDC2+L+JFHnCTOSXJc5omel307/?=
 =?us-ascii?Q?btNnpmQoDcleLAOBp8rN8oLNc7UUIY/p2D80hrbHuHKkz1KWHFj8Lh4Vy+Rc?=
 =?us-ascii?Q?OrT8QJwjUoZwiGBaiCLjJtPsv+F0ojHYLxsbPIJoZwzbFBrHpRFtebhPb/gf?=
 =?us-ascii?Q?wApnIXcweaSJZle4MOWOZ4CXHcE3jgtdiUP2gA9zA2FFpNVcGjGt8I/sN5p6?=
 =?us-ascii?Q?bbS8Ir3YE3PIZSOpw0QmCAYsVZLLXvCrif0Le+haP77V4+k4bRKEOhgq9qjJ?=
 =?us-ascii?Q?vKy/iQbh7k9mc+d7Hvq13vWVvtEbPwVAd1sBrzQU470MJ9AiVSHwAG5lXP7M?=
 =?us-ascii?Q?RnMOXXDStRPADjnjb2bfyL6EQYPdBFCXJIIBdt9Rbawu3keV/QSBo2XunXAk?=
 =?us-ascii?Q?BLwpQ85MppmnDGLWE7awoID52LrFAiHR4kzjGbYSvmlN8O01qqRsOswWOoJ0?=
 =?us-ascii?Q?pynoeLNl/DseG1t4/sh8qXGXVBlD8u4XZL4/vlCz6WRHbdDVW2k6wmeNKZCd?=
 =?us-ascii?Q?wgqQYyoEazBnthVQ4nkVN0a+zJW5QYje5ijxTK211JFcAklZnWtf0wfeLpVE?=
 =?us-ascii?Q?reSOY2rcpo5PcyiFi3mowzP+2QtZ/CvgghqK0OcS3dUuVA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E1C8BB3E6D4F048AC7CCDBECF6006EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7808
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d032ea4-124b-43b2-e7a5-08dc647530dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NcbO5CTVYnxR1qj+aKfLXbLjXq9GGkTz7qrM5gROM7PUT9SCW6vVyS6SObqK?=
 =?us-ascii?Q?riVBNlPWo5oXnqsJXnpGTl2V5HJtxgEbwatw02AFZ3h5X3gvyX3UqeOrPL0X?=
 =?us-ascii?Q?QYopwhL665DT3lQb6PHFxSsG+4eiuvwiuS1muj5xK0RPWRWdwROaoo9uEzJv?=
 =?us-ascii?Q?CcdanhZPNeeylTvuox05XjFdddejCkpmmTgmbAcqUw2iDn60dTJEFBIeDbJ+?=
 =?us-ascii?Q?YqWtqt93FIvtxYWdShQa3P3hyO47t1JGtl6oRBNaZMA6pKJgrV57tGr/+gaP?=
 =?us-ascii?Q?t5UTE7l/BAD1NG6kwmPohn6y281GxHpUxM5jvcq+FobEVu08Tkd49+Gh2fLX?=
 =?us-ascii?Q?+YwJlys++cgFG63AcTuRZrg5pP4vuzm5gAcL2hziOOfZqGduYno6D8QIzdTb?=
 =?us-ascii?Q?p5PVshDVE6vQC5BVpDKthfolEZ0U2u63hKAxaB1Q243AW8jZ/mpfkxdSUKX5?=
 =?us-ascii?Q?0MutTYnkJg75YHmAqaLa4gpVxXcxSdiRFzrDmch476nlx762Zj7XOK89uxrb?=
 =?us-ascii?Q?J6uyp/9Lr4GyXbXNxW/rBiK+vHRf1ChCMIjxeD8Dq9ZKuOKW/L6a+m7vfMth?=
 =?us-ascii?Q?5o1e9SFhBFL6oxuQXqbOvLxNCTqzMtGVSFRai2IpDHucci7GHy7EbD6G4+ee?=
 =?us-ascii?Q?/GQOc4PCRM6VTSqgyY1CwldgEVDROlU8GFzY2wfiBNZyvAbdOa1QJzUWyd07?=
 =?us-ascii?Q?Zc5cTWtUMILV75Br7t9MvsvkfS09uK7gzDEQkqNlkytvmxGXUy8z3psvx6N3?=
 =?us-ascii?Q?eRoWycDw/FDcqJaKfouvhfNt9oTUp85bkNaOBWG5cB+XgkQR30g8FiNqZjlS?=
 =?us-ascii?Q?eTkSA4WZVnOx3xVzwM77orJU7YLEDV6Bm3/KEF2VUPYk9HtuIfM/wb4ql1Q/?=
 =?us-ascii?Q?5t42Is7ow/DOIz//8cY2r2+eBNqi+clHJHWBQIOfQI2oOqqvIT0Biz7uL7A7?=
 =?us-ascii?Q?nrI3CcKQFul83WkY79uE51Pr9/x5JfgYpu4ZQNwGVoMYzbdHqGY9sMWqGJLX?=
 =?us-ascii?Q?A3t+xtKG06/a1jBhaSjEfnLuZKkt7a3n8JXAJWKIk2a1ee9gMspo8I5DKI2e?=
 =?us-ascii?Q?gQEY9xzlsDmaMdubkf1ugU0eKoXjESUTE6l4/bP3R4VyBAcHCpUAeHYkWn2o?=
 =?us-ascii?Q?jCHu292LOclF3dhMCPxRhB8MaabV/9wiBG7oyBCuTJlRogGIqRa7kimAO4cA?=
 =?us-ascii?Q?NHoJhWUggipC5dgzTotGvweEiZvyzd7scyGHy5TCJ/dy4wAqRq9Xlc1OEYmx?=
 =?us-ascii?Q?70wf2javYNnV7wo59go4yXGJoi+hUSnGKTgWEiXtq9hCda88TZcAQ8d0zvnt?=
 =?us-ascii?Q?F8esE91X6DL1bLKeBKMiXigCNdkL4Ol2WNyfIeMfnwDOVBDaDNBbla1ANhox?=
 =?us-ascii?Q?6TFXeZNUyBzaVO73mwDPN2N5d7o7?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 15:42:56.5041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10e5de3-afc8-41a0-203c-08dc64753686
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110133


> On 24 Apr 2024, at 16:14, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
>=20
> On Wed, Apr 24 2024 at 04:40:21 PM +02:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>> Can we root cause it instead ? Removing sources from debug info might fi=
x this issue but degrade debugging experience=20
>=20
>=20
> I will take a look at it

The usual culprit is build paths in generated files (like glib-generated he=
aders), which is often a trivial fix to use basename instead.

Ross


