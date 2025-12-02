Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83095CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:07:50 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5267.1764673669162413372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 03:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZmImVy6+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZmImVy6+;
 spf=pass (domain: arm.com, ip: 52.101.66.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qr0n3N5qQ/uzNkVJOL+uspJr4gswKUuuJCQV/yOLIZh7lSrW32iBoT+AdANWAuGCpYz4ZH/XNv5+zDNF/WlUwmj1ChYJ6UCBKfN4gkplC1xrb6jVzj4Xv5JhRt07gLuy/a6ut7fpshletOsiw7pw/H7dUe2M0oTGe6JE4dA2Bvak6wPzXVycFu432U1ELeOwcUGRjg4v+TlgJT5o8CH3zV+zXpxF5XGfzBzmT5pcFQMLRcBLGqfnvBOzNpG8uiek/E3dPo9BZ4D61cUE4cFtVTg7DYHwmakOkLPwFursxr6owcStbnbSyu0UZkdNczjStSEKEbGtlnKwYPEf3k2JoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf3RY9OC52WvVJSNZlSSh1/arTrfLPNqhSc6r5UpBAE=;
 b=NRK3BoMzPn1rM+ETllAsZlmwELbqu0Dlw2Wl8vucLaoFR4QRnnKZ2GvCsGHYgKpbrgfnFCBS8wziiW0B7m5i4yEEWOYaHrHnq3pf/XigK9GmdBe6xbUqC9iMu2yZeFih/VUGr26DLAyumifwfpPLHRuaned8uoRhx4d7HTkCswADy/+nWkZAow20Y6IZ2az9q9+yFwAtppsytAqxmYbPrvH7uUK98jINUqY5CBaxJcXvlo+nDwzsAU5IA6SZh3wi5C5h+rlOc1pUROhxgn1NKlKoQQY2J3OQSX5ZTzXRRvQExWnfjhKxKXzUISq6mG15ZKwQ7rMe+CIkfa0g5LMEcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf3RY9OC52WvVJSNZlSSh1/arTrfLPNqhSc6r5UpBAE=;
 b=ZmImVy6+NvEOZs0xUZMnoGVNKlyIb+NW9ntT9q2f3YuxEzRh+LdiEsYZ3G100PxeD4rYtWPQvk8kDUwKb3mV6qir6GEUHrSYe6DcCClZhCyOsdCdx/5ktZ7y4Eey2vokFmWEVuZZ0ZcncZfeWo+ySeqOqukXdaVeiemFw6GQefU=
Received: from CWLP265CA0405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::16)
 by DU4PR08MB11008.eurprd08.prod.outlook.com (2603:10a6:10:570::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:07:44 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::10) by CWLP265CA0405.outlook.office365.com
 (2603:10a6:400:1b6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 11:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 2 Dec 2025 11:07:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjQ4cig/gH+47PWZMlU7/zwLXqbYWXYRDODm9gZKQ0c9D0IOqgwQOl4BBXZ/m1DnByt7vG6L++ZFp46Az/D489bm1OQF1lKhNE2LIniWIZN/E3ie+PIGPj5s85X88TDd38P5uYkEviJ0jvnV7rF8az9YMIVBhfJbQWrF+v9pffnDUWJ8ZKsgjx2PLHPKkgkE+2FUBu69cG+2jh4wXleBK5yb2TTgi4vjfXGTX49iVilzvZpzBgXB69cvt/weKaE0bchsjF47lV57ppYoiQnnkJNlAlIurmwsypJlUV22lRjn1cwnXBpMtgYMMoTU3mM2NTpW0q5AMyeI79n8vlwh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf3RY9OC52WvVJSNZlSSh1/arTrfLPNqhSc6r5UpBAE=;
 b=ezMncLyeY+Zh6zJJg4anKREdIdVFsESF+Bi3bX3EzIA1I7eSoaoJyyARUJL5XPoDEcFu6govpF7/FA/4tI134lLoU41vzcQGIlLX18lepatygu6bgvhdI80KbBoCjdpKhkm9cN1dc+DHvJYhapGVaLFS6gxSfwZn7WZMcQykbiYKcygQpNxjtc9O1a+e7KKhS9NocbfS1MtAb8bkvcihWwODVuihUwEXzl0+egiPjumX0Br8vlsO9m55Mtv1pzgYtRRV5L1zo8dXZaDNUHaM3hAauu7nCA34jmVwiPQVP0i7Dm6TCsHn9KaFugwk67v2pTVR7nj3KL/tNTyWzj5vRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf3RY9OC52WvVJSNZlSSh1/arTrfLPNqhSc6r5UpBAE=;
 b=ZmImVy6+NvEOZs0xUZMnoGVNKlyIb+NW9ntT9q2f3YuxEzRh+LdiEsYZ3G100PxeD4rYtWPQvk8kDUwKb3mV6qir6GEUHrSYe6DcCClZhCyOsdCdx/5ktZ7y4Eey2vokFmWEVuZZ0ZcncZfeWo+ySeqOqukXdaVeiemFw6GQefU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10850.eurprd08.prod.outlook.com (2603:10a6:10:522::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 11:06:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:06:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Yogesh Tyagi
	<yogesh.tyagi@intel.com>
Subject: Re: [meta-oe][PATCH v2] yasm: drop recipe
Thread-Topic: [meta-oe][PATCH v2] yasm: drop recipe
Thread-Index: AQHcYw8/0BgPwl8rdk+ZADh26AKW9rUOMUyA
Date: Tue, 2 Dec 2025 11:06:39 +0000
Message-ID: <B288382B-115B-4432-8090-2BB562D7D170@arm.com>
References: <20251201220957.2629951-1-skandigraun@gmail.com>
In-Reply-To: <20251201220957.2629951-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10850:EE_|AMS1EPF00000041:EE_|DU4PR08MB11008:EE_
X-MS-Office365-Filtering-Correlation-Id: ea87218e-5fbd-48bd-615d-08de3193043b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?sIobnQbEvJ/CRzEhsTW3zGLcjESrDwKkwPEUfmyUfMb3hOHx8AYtqw4Ha0/R?=
 =?us-ascii?Q?U/NfYYC9GTndJBcx7UOUbnfxU3pS4Hhb4OvGMRELJ355eNNWi2itmo6+JyXZ?=
 =?us-ascii?Q?GQDcajx7CwK0krCsqPn2dHxs77LK6UjtvwiZuNN3SrZh1K+W7I1pzhA4qTOk?=
 =?us-ascii?Q?IzNBRbENHwZi8HvEwzkfeS03UF4IWJ9btu5B9qO5/BcKZ5CdSGLns/mnKWkx?=
 =?us-ascii?Q?NF1E/tYDVqG4WeLnvjA870+IAFaT5YC6t2F9B+l470i4AyCMWVbiCPoLkL2R?=
 =?us-ascii?Q?9/bu2IyDjpLOj7OYYU6hx/BmTuicZtSfcl8Z5cDqEmky7X5U8c1Gw1FOWJdp?=
 =?us-ascii?Q?nfqYiBa6hfJ1SzaQM7JFjEkI4GEUBMQ3zNWDjYwctpmKeV2ei8U95RahsujG?=
 =?us-ascii?Q?c7rNodPRAJqOCqsgFAZgHyygHQZh1G05oirbkyaTegqWnxLH1YPZjWp3Ew/F?=
 =?us-ascii?Q?D0WAmZo29hwJM4WGTA6laZC1WolEoh/MrL75AHy0pOskHcHNxUfzJKJf03eu?=
 =?us-ascii?Q?pvEKdnFL13SixyYjLzysz9geXtnyxbnxFh9RZbReCVhlZJaKy3aSbAmg3DEo?=
 =?us-ascii?Q?vI9b3hdB/NL/ZrZhRSfHvCUgkmRnTUZl7+sOktXWdGpBj46yZfvdgn34Hy0D?=
 =?us-ascii?Q?eNtVWUJ4u4gStWMf37y9Yf3pSuptM83t8Ew3SHMMWPhKyJ3+and1XyfHSr6b?=
 =?us-ascii?Q?WKgpvqpNG2DdhOJ/jip5dYqkRkakS6w35b1o4aVSrY2+E+U4HBRginTKTjxp?=
 =?us-ascii?Q?AC/j/AdX59CwlNNgC7xSmZgY79kmnvLZjN9uQ3gS1VHBv/S/40IIa+Zz2ajA?=
 =?us-ascii?Q?y5n/q3a4AuOOWDQ4+5Zxhg+NA/bb1AWxpfpA1/EWY4s82o073TXFdLFl697t?=
 =?us-ascii?Q?34PJhY7r47iM0rrBrOMMD+eU72Du/FOaHBcIRehdeBhlMul0CiLVRgSgTt9q?=
 =?us-ascii?Q?9n92bg/AGbUVjQrijHVjqGv3HJ3UhuxRLFx8Ip5mun4URRGeRatGxOk2dLf6?=
 =?us-ascii?Q?c0mGkL17/1rXz3hATABqVYrMM1q8uyjyjCTLQ+M7tfcieFaaReuFoDsJlGAj?=
 =?us-ascii?Q?s6dF6xohSSwDUCp4I1Gw4BLMLWqMmoiTliIVFl0Yd00HvHbV0C9jXvNlSETp?=
 =?us-ascii?Q?p+zzo0GY5nlehwgAwfN4oMef62MrEj8mheQUHTPhRuigVqzlje8NneAIGJ/G?=
 =?us-ascii?Q?AeLCcKAx7U8DaezB8QOW7m9SSvwa2boobfnQQS03AUHjU2LrQeaQz+TmYBYw?=
 =?us-ascii?Q?VCH56ErHrMslkbG4/lTCn3YmeZlCxtou4CB1naEi/57ZaUsHZIyZgdQmTVfu?=
 =?us-ascii?Q?8/efd5dCJ/KX25RGBwEy0mpgHm1m3O/fjMXiunc7mSEf1chLe+denV4/Px2E?=
 =?us-ascii?Q?X3UKAHdH08NyvWtLjyCBPT2cqpDvotXb/haGMwsieeCVpxpb/p1beTwVFhbb?=
 =?us-ascii?Q?xaSWmu8ck28QgbCACusT8ClJM0rN/vnibG98lrCFi2nFeZ64NGAQ2FZFXMUT?=
 =?us-ascii?Q?U9SKTl0YMUtkGx6U+A+KtWD/x2MJx1VoDZuM?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BE3AC19080DF643B877D39981AB0BE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10850
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	584bccbb-b35f-424b-f00f-08de3192de3e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|14060799003|1800799024|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v/iDkYHrCoJO17AMP6ZN/QU6brK5z/9fjT+hcjt6FPF2h0Exzvcb1fMMLObw?=
 =?us-ascii?Q?MYGMjqXz+PkunmGt1Atw/HqtGnilO2wSzce039IpMrb8KB05Nwg0aLIiwmDV?=
 =?us-ascii?Q?uSWHT9kNfFpkAUK8YymgAtaZ7ZKuoWh4z4am9DEO7LpWByVTLFWNXxPpTfWd?=
 =?us-ascii?Q?dVjP6/zEUh6x7KOh8Ve/HmLIvD1I7wk2XiW6bCIYwJkUnSvC2HTZG5U1tGyo?=
 =?us-ascii?Q?MjGMViUzIjWImhFWWb+pRbCi0lh2AoAHHDJU165zKqvcVlCmSevYEeeKkqt3?=
 =?us-ascii?Q?T+NjcO4B9TUIZJr2aj/V/Nl6lN7EUWD/F12ZAs0hBK3EIbwqztR0lWgZKJkb?=
 =?us-ascii?Q?PSIEntbZDUvYzUNRnoxYAUBYnFVmIINaC7BoMk4G1rMdDWpW/qsTpMIiHE2h?=
 =?us-ascii?Q?ajN9OPAxjhtbZJOVrV9G0SX3pA1VqMSbC+4Pm8MnHDJi0MHEWPFyQLRTXcys?=
 =?us-ascii?Q?AQo78tl9CnOHIXEU8TdWj8vziVxGGfLFKG3a00aPqY5xlYKD5Gq7uMFRYGng?=
 =?us-ascii?Q?AjAkRJOx5lyzaRwQX85TUqOWyuiEfPJpmQOF44rkPrrvGtjie4ZUi6gAPetC?=
 =?us-ascii?Q?WTakpV8m+oiOYhZ9aWCYcs6r/i/DX1aJ1A9WuGZMWD2IABNUiBsSU313a5zB?=
 =?us-ascii?Q?CVYOXf5pUIpyCfhPuWU3gMRwV4NPaTg/WPtgazHZj+VLCAcRai4n8XVyecSu?=
 =?us-ascii?Q?LFXOy0XBy7B9IRDt2KFSi1N3k6DKpnWI3dmsbcJxAJ4pTaB051GeK36QtA+R?=
 =?us-ascii?Q?fKerQeWWWFkJlQmWIUEOPh+74w5TU9hGtZIOaKcj0pB/MDE0rSJphM6eEmHn?=
 =?us-ascii?Q?+sGOPZFtZEmdxhqYiIeTcXs+u8tr2MSP/L8ikztf5UeUsigTwQ5+fCH7B7kX?=
 =?us-ascii?Q?duuZ9gCze3G4Y5EndKL0Is7cl0ay/zsTskIqJWiNP4m688sTFT2pJmJ91NFw?=
 =?us-ascii?Q?695xkGdNWnfy5pe1pgCJj4wbZmQcuY2kJ0S9THPkZfjgOc8M72ndSLVOk0u7?=
 =?us-ascii?Q?PnxslF9J/k0wsiKaVVyNWawuz2rjfhY6KXgY4prSxyWMIsoaJbX67faP0nIv?=
 =?us-ascii?Q?YLObrkaPKsIQzk9pjktHO4diUqSkU9LO26Uq8jbYm4Cte81ztXudj326zluz?=
 =?us-ascii?Q?RJoi/qdnrSEX3MVGHj64LlWgp221MdZc7OwfshUmU6/b8pRAsW1DBz4KPKxg?=
 =?us-ascii?Q?FYb3U2ahn0mEPLHxLCSXtX8XyH0QhERt2+PimlBWT/RZpeYYjo+Kh0Qn9v5G?=
 =?us-ascii?Q?jl7C/jpnZd9+iZ+NSRIn+g6emvWaSUyt0mr5ezAUo9CX9/N+zf6AtHdzGUdl?=
 =?us-ascii?Q?fp8NuKLrTuxMESmDPu56m2lSlhuvLK9AcgV4d2Tpm5tVvHGEcbBDO8eCgeWw?=
 =?us-ascii?Q?NGcxfErVBBiA8OBHrUEwErcP+tM/PZ1ymdDUQbTD13a5BOrgNwLTNxnZiY1c?=
 =?us-ascii?Q?p3k0xHe5SXb7NPPiSJgsg0UzFUWgQU54h10v8Jjvb15+Cese+B0olTzYyzCW?=
 =?us-ascii?Q?ZZs+ccTOqZbRFaYYHLC01NZ5FJXu1iKKDmiRW08MQqGAk4Pf0hNHgRB6sw3f?=
 =?us-ascii?Q?jAYtvM5DFzMCoXXB/LQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(1800799024)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:07:43.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea87218e-5fbd-48bd-615d-08de3193043b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 11:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122259

On 1 Dec 2025, at 22:09, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>=20
> Yasm was introduced as a rewrite of nasm, however its commits
> have dried up over the years, while its unmitigated CVEs keep
> piling up. Also, nasm is a healthier project with regular
> contributions still.

Excellent, thanks Gyorgy!

Ross

