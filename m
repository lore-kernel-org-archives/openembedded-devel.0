Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81B6CEB2F0
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:28:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.123])
 by mx.groups.io with SMTP id smtpd.web10.73707.1727756927147562099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=n5MngrUJ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGV786y+l+u2zqWPYhKQ3Ta1XYh4mcL3xTnbyIRq+/B91QUHuSaD4TVm1vDzSCccs1vL+WauI/uyOWROJLJEzoI3DBZ1u1r9xcVZvaB2as1HjQH5wAZ6e5YZyRWUkEaLNdfrf1H8b+8JrtYtkfauzf4yfK7rKGq75T4xHZeUehCePaL8v+0FTKUqKyfO944PzhsmIC2plyZf96LmDkF5L/CL7QuKnYi0gT0RWP22bYPUK5trpbNFp+U0R57FGCDMFsx12gIpajjhGFTzCS52Gy6w3ze+EoZJxMwL1OnbuVfXwaJt3rc/vDurzB64ysex5O2CjGDFQLQbjWZGz1/JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX3p51t2l9uNqlawwt/sK+RSNaRZT+5h98CHqsxnXgY=;
 b=Qfb0/FJ6Wpnn2FkTO9ThUD5aQCd1nJJcaEXAjKQD/QZZEibRkEIti6i5t+DdwUOjjf1HoorsYsz2u/IBb0g1/MDckcuLfXGeLy/rUFrVN8Dam4hOHoYSWVpgZf+vmY1L7W6QZSuFENQSavlQOylkyUJDT6r8EQQb91mko9tKVfFU73lpZcQ/IO21WekFTQ7+R/Z6/WeDSb4PH8MMETnaV8lKdP7oAoJzfX49ddzi8qXu2ASHSUq3e0LsBbRSi+ZQbRQrHA/jrCMu2sdta++4ixB7F+wzQpkyYM0JGIq4tZOi3Z3/ygKt8rdUI0NKUcQ8G6omnuHNyevPEpkiqSbsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX3p51t2l9uNqlawwt/sK+RSNaRZT+5h98CHqsxnXgY=;
 b=n5MngrUJkrbv2ae+InknYqBXlLxTusBX7wi1kcRHv5xrbZ2pJChVJ96kZfnefLU80eMg9mrRkED5MxrPIiWgRGJpnp9mCWKuuYuHmHUwUQsG0vlxjV7O7YkdAYyY+znm5dr8kk+NkOGzPWGKvRjpUJIN9EEISeoMqsW8KXxAdwWXuQD+/3/oow3Q15djxn/XTzBrKugGBiY/3S99Yk7NibvEpQlEfbzlUv27/ml+mRMW99GYdviXaZ6e7JizZ/WykVcM0VO47V6ER5/WHwSBl21JEOd5KujdzPacCXCLEtci6hkhTH2yFiLWEB0RlwfEAtzei67sTJfK1Vp9bN2CeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI2PR06MB9500.eurprd06.prod.outlook.com (2603:10a6:800:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:28:43 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 04:28:43 +0000
Message-ID: <fb14aa7c-ac30-4b0b-bfce-4cdcda9b87a0@vaisala.com>
Date: Tue, 1 Oct 2024 07:28:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
 <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com>
 <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com>
 <CAMKF1soMOpdvsV7gf7c82YdFaV6UvGHX1hznRifPiu0qnf_vhQ@mail.gmail.com>
 <1cd00a33-a0db-41af-bd9c-1a567626265d@vaisala.com>
 <CAMKF1sra9GyLMOsspa3=UEwtVdMvrZUTEz1BhjjBrVSjv9wvrg@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1sra9GyLMOsspa3=UEwtVdMvrZUTEz1BhjjBrVSjv9wvrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: GVX0EPF00011B5A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:f) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI2PR06MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 1202044a-ca93-4176-d35b-08dce1d18859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0tmZmxsYm44QXQ4K2Q5VFVObUhRV25tQmhmWFhGQTZ6eU9lcmtEa0Vtcnpp?=
 =?utf-8?B?NmVQeUtZMFdVZFpybi9rQ1d6NmttYTBGTTU1bnM3d2lLNTJGS1dUMTA1S1pS?=
 =?utf-8?B?YzFjK2U3dGdSaUxtTkRIb05Mam9pdENyUXFkWHVBcjZsT1BzdS9mRXhKQ2dj?=
 =?utf-8?B?TWVjUm1UWjdpb1ZaaWUwb091b0U0dk5iNlBsVE10QXlidFZUbzJUbThkZFdG?=
 =?utf-8?B?RFNmclZya08ycnZFUTlRbHlUVlBUS1EycnE2VUY0VVEzWXltZ3lUbWhHbnZ6?=
 =?utf-8?B?dmI3TTZqZUx1S2hEUnN4NTZYQkNvd2duelNjcWdKWlJ4VUVvTUlVWUtJbVQr?=
 =?utf-8?B?NnVHUlZ5dnJHRXdna2NWSlhtNFdTK004eXB3SHc5NHZta3BhUllVTFJGUVJs?=
 =?utf-8?B?cENvOFdwd2lSakFOZE82NWdMajUyd1lTYk5neVQ0VTk4aU9za1psaElkMTlT?=
 =?utf-8?B?NCtGVkhqVk9PZ3N1NkJIUVVEQjgvTVhjaDkrK21iU2ZJMFpPdnY2c2xBSGFs?=
 =?utf-8?B?M2JlY1BCT3RWRDd0Qzg2V2d1L3JlUktPbmRSdWZXa2hqcFU3Q0FaQUhGVUNV?=
 =?utf-8?B?UTNjbnJrd2YrODBoWXJPMjBjTVdtelBqSER1SW5nVWRDT1M4dm8rUVpHTE9B?=
 =?utf-8?B?OGVxQkRMT0V0STlNK3hTVmNVRXBpdVZQL1k1RXVwcUp5bXhwMGMyVENFWEdq?=
 =?utf-8?B?RlQxWXo3YXFxVnV3WkRSTE1pdkdzZjlhdTh1UElpMlNPb1AxeVR0dXRURk4r?=
 =?utf-8?B?SWVTdWxJeW0wMXNJZzdZTE9yZFlFSHBUdW00bnYyTk51Z3pNME5taWVrY3hO?=
 =?utf-8?B?dTdBMlk0bjZOTURWYWYrSk1BYnZrRXZhWTFLaEFwa2hLQjcvS1Ntc0hVanNh?=
 =?utf-8?B?U1Q4NTBkbTE4MFNlczEzK0JZYTNxQ1BDSStITkExNG16cUJrL2JEazgrc2I4?=
 =?utf-8?B?S2Z2RmxGbit6NkMvZElHSUpnVEMweldhL1J5MG1KZlBaMWNON0J0OFE2Q3Rj?=
 =?utf-8?B?RkttQVNrcjBVRUFIR2xPS01qSDUvdTg3dDBJenBjMm1zNHBjU2I2QUkvTkY4?=
 =?utf-8?B?TzR6T0k5d1ZlWHNWeDQwRzFBYnZaYk9HVzBSTzVCZGZ4ZDczMmVCTFVDeExy?=
 =?utf-8?B?d3dIbHcwd2NBVmlPV3BDQm13UlI4Y2RZemtXQUJqZkdpakI2ZmJrMk9kd2dq?=
 =?utf-8?B?YkFGYmQ4bll0dFlTZENUOTVpM2JtS0RhRzdXaUIxY2RwVTMyWFBoL2RxbWFn?=
 =?utf-8?B?YnJpdUdjZXg2UGZqMStycjdLQlhvWXp3KzJmTUV4UmdiZEdKc25wcmZqd2Jr?=
 =?utf-8?B?cHpCcHpLSHFqRXppSktyV1VScXFQWW1MSWo5aTdUVUNiMWRvS0h6Q0tyREl2?=
 =?utf-8?B?NVRLMEQrdUdvenFEV2dvZ3hyZmdaV0dnYStVNmFqU0Jxc1NNU0xjdWNRMnZz?=
 =?utf-8?B?ZjhqTDd6Nnp1UXNYcyszQTlneFJmUGZPMTFGcFJ4c0Z4b3ZDS2xNS1V1VS9X?=
 =?utf-8?B?TTZEbW1EUm56WHFrQUtaN2oyVU4rSG5jTDBXbmNYQW9Bb0twL1oxT0drSklO?=
 =?utf-8?B?dm5BbnlBN0lXOTlqV0N0QUFuakE1T3htZUErcFYrd2VBOVAycjFPMTU3SGdo?=
 =?utf-8?B?anVpRzdjak5ybkhPNVQ2RXM4WVJXRGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTRVZHdZRkdaUlFIOE5WWDVnOVVLUzhrUHFMV2diVlVwZG5wUGdCcUFDRzZ2?=
 =?utf-8?B?TXlyYS9HMEt1MFRXcXE2ZTNBMWx1RWZKWVY5U2RlWmVPeHdOUWxaSWs4VW1p?=
 =?utf-8?B?WkFxdUZCNWJBRGx1dExlaXNJWkRNbjIxVXlSMzNjMlhvOGtoUUFsNXUzK2Js?=
 =?utf-8?B?dDdPdkY4eHZZYlZad0ZQOTF5d0RSWDA2TFBWdGZvTzAvQ2p3NTdvZzFTVWhy?=
 =?utf-8?B?TnMyK2J5QlUwVVZUSXIrcWttZ0J0T0o1VkkvUmFGTG1BV0czSHdFeEZuUHJX?=
 =?utf-8?B?OXdrZWhHZklNcUFBcjFKenU5U0MzNUJSeEdYaWc2cnJ2VkYraGJnVlNKTzE2?=
 =?utf-8?B?djQ0ZStYd1ErbDRLMlBGQTJSVW1oRUVhTHVDZTJuM2J5UlpxTDkrVGFreXFE?=
 =?utf-8?B?c0pwQ3U1TlA1aE9GN2NxS0JpQ2FuYVVRYjQrSkx4SjVlRUVpR1QxU1lHWjM2?=
 =?utf-8?B?SUtXTHF3ZjNrNExUcjZLRUtIUktNQWowTTcrVUJXdkVaRld2L2xxYTdLNnBy?=
 =?utf-8?B?Um1RVmYyUlJhRkQ1Q3ROTUVPZ0pRUUVIM3FmQ2JibzdWQlRBZit2THljZmxJ?=
 =?utf-8?B?V295SW9UWXlLWlNMWVhJWTBmNFVXeGdOSlNTdHIvN0g2bHlPdWd6VzAzM0oz?=
 =?utf-8?B?Q2g5dXMwTzRIdEI4WDRTcDUzS21YYUJyR0ZEWmg4WUdSSk1uUjYrTm8wam1U?=
 =?utf-8?B?cEhtb0VocjBzRndqMHJCcUhPWmlKWUhyZE5QOFMzODlJcjNmSVZJUE91ZUpE?=
 =?utf-8?B?OG9keDk4L2EzZTZKWTBSRkVJSno4VDhnYTJVTk5SLy9hL3FScHVRUEN5QVFy?=
 =?utf-8?B?Y2NobHp0QkNaQnFCMUpsQkdpeFhUd3BNTXI2RmJ5NEZ4NFA1RkZjbW5Gd0dT?=
 =?utf-8?B?Y0V1ZWkzckNYMktGK2lnN2dpOG9kSGZheDFBdVZ5bW9uWlRrQmZEMXBSMXZL?=
 =?utf-8?B?NlhBZ3Zjcm5zSVpmOHBJdEYvUHNEVEhhYjE5UG9xams5V0N5QTdBNFIrN2g2?=
 =?utf-8?B?UlhFTmcvMklNRHNnUlJCNE1yK3I5WFZIUWFrdmV2Z2dZc2ZFLy94M1d5a3ha?=
 =?utf-8?B?MHNvWmdOcmF5Wm5mVy81cEwvWUUrYkswSm1LNkE4M1NKRWw5WndyTG1HTHpi?=
 =?utf-8?B?Rm1aUnkzd0hWdUljaXcraCtEY2xHdnc5R1N3WldDQk5KcFJRMHZZSktYNUNh?=
 =?utf-8?B?bFRTcndDKytPTUxZWnRFbzk3cmR5bVpHbG4wQS9DN0E5SHBvUmYwMWtQLzBu?=
 =?utf-8?B?a3IzUEo2T0xpNXE2TE8xZ205RW1aYzR5WHY2bjBUaFZMaWc5VkxnM1ROcWl2?=
 =?utf-8?B?ak4vejZrMlRwUEx3dy9QY2dOYVkyMWtQaTZJL212dzNFNEJCSVlFbFVHU2JQ?=
 =?utf-8?B?bk53eFJpUUErUTF4dFZWSzgzc1JTcTJrVmdMempMNytNYlVDN3drVXozeGJv?=
 =?utf-8?B?V3BUTU9BQlVJUitnTUY2OFdmTUVUT0tKZTNrWmwrZGxoejZYTFl4eUJNTW4y?=
 =?utf-8?B?VDB4Y1V6UHBoT2hiUWhZRXIvcFgwTzZUaHk4eEdlaG9zRGxaOURXbEd2L1NR?=
 =?utf-8?B?cVlxSWFGL2hrSkJnakJab0JVZklXbnZuNkQxaWhINUZrVFNwWTBhZi82dkUx?=
 =?utf-8?B?dGlEaEI4aWpqMlB3YUFSZHBvMFFaR1YxUGNkMVcza3VNYlp2WE5BNHBWT29W?=
 =?utf-8?B?ZHNMODB1eDMvWU9TWmkvTEZNTFlZNWozV1NIQjVmZVBDMGZzR3B6a1dFRXlW?=
 =?utf-8?B?VGJzbGQvemVkVytERTdwZktJSUZPZDVkUnNYbndtVVVTTDRkdUJVN3orSE56?=
 =?utf-8?B?blNNU09lM1UzY01mcWgrZW85KzVzdW02K1Q1VFIyekhoT2NsOHdTajZ4NkFw?=
 =?utf-8?B?WmVoUEpvS1VWTVQvbStjczZCNmY2SVdLUFBSSEd4NENVZCttRHJ4akY1V2tm?=
 =?utf-8?B?MHYwcFhRcHhYZWdBNUY5QXVwa1NjNElUSFJqOEFkY2lqa2N6dDI5THg4alpI?=
 =?utf-8?B?REphVmVYU0ZoYnJMelpOWEJTbHZzTDErV0FTRTgyQW9xNXpMS3BVWDhtN3pJ?=
 =?utf-8?B?ZVB1MVlnRERQVStRcGlUTWtlMmdWRW5hanF6bTJLc2FVWFV6cWlsRmp1V1ZK?=
 =?utf-8?Q?0d4hqSgAEpgkPFAY3LUKemxU8?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1202044a-ca93-4176-d35b-08dce1d18859
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:28:43.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cy+zzjV1gEAvtMfJU39E/zrk6+SejnsSBKBnKm/nZxddsmwscK7vi8BdmysnlRzAM3POEvrgFXDFK+1Vqu2cTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112622

SSBmb3VuZCBhIGJpc2VjdGFiaWxpdHkgaXNzdWUgKG9uZSBsaW5lIGNoYW5nZSBoYWQgbW92ZWQg
dG8gYSBkaWZmZXJlbnQgDQpjb21taXQpLCBzbyBJIHN1Ym1pdHRlZCB2MyBvZiB0aGUgZm91ciBw
YXRjaCBzZXJpZXMgdG8gbWV0YS1vZS4NCi1OaWtvDQoNCk9uIDkvMzAvMjQgMTk6NTIsIEtoZW0g
UmFqIHdyb3RlOg0KPiBUaGFua3MsIHBsZWFzZSBjaGVjayBtYXN0ZXItbmV4dCBhZ2FpbiBzaW5j
ZSBJIGZpeGVkIGl0IGFzIHBlciB5b3VyDQo+IGNvbW1lbnRzIGFzIHdlbGwuDQo+IA0KPiBPbiBN
b24sIFNlcCAzMCwgMjAyNCBhdCA5OjI44oCvQU0gTmlrbyBNYXVubyA8bmlrby5tYXVub0B2YWlz
YWxhLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhhbmtzLCBzdWJtaXR0ZWQgdjIgb2YgdGhlIGZvdXIg
cGF0Y2ggc2VyaWVzIHRvIG1ldGEtb2UuDQo+PiAtTmlrbw0KPj4NCj4+IE9uIDMwLjkuMjAyNCAx
OS4xNCwgS2hlbSBSYWogd3JvdGU6DQo+Pj4gUmViYXNlIHlvdXIgc2VyaWVzIHRoZW4gb24gbWFz
dGVyIG5leHQgYW5kIHJlc2VuZA0KPj4+DQo+Pj4gT24gTW9uLCBTZXAgMzAsIDIwMjQgYXQgODoz
NOKAr0FNIE5pa28gTWF1bm8gPG5pa28ubWF1bm9AdmFpc2FsYS5jb20NCj4+PiA8bWFpbHRvOm5p
a28ubWF1bm9AdmFpc2FsYS5jb20+PiB3cm90ZToNCj4+Pg0KPj4+ICAgICAgT24gMzAuOS4yMDI0
IDE3LjU2LCBLaGVtIFJhaiB3cm90ZToNCj4+PiAgICAgICA+IFRoYW5rcyBmb3IgdGhlIGNsZWFu
dXAsIGl0IHdvdWxkIGJlIGNvb2wgdG8gc2hlZCBzb21lIG1vcmUgcGVyaGFwcy4gSQ0KPj4+ICAg
ICAgID4gaGFkIHRvIHJlc29sdmUgbWVyZ2UgY29uZmxpY3RzIHRvIGdldCB0aGlzIHN0YWdlZCBp
bnRvIG1hc3Rlci1uZXh0LA0KPj4+ICAgICAgID4gcGxlYXNlIGNoZWNrIGlmIGFsbCBpcyBvayBv
biBtYXN0ZXItbmV4dA0KPj4+DQo+Pj4gICAgICBIaSBLaGVtLCBnbGFkIGlmIEkgY2FuIGhlbHAu
DQo+Pj4NCj4+PiAgICAgIFRvIG1lIHRoZSBmb2xsb3dpbmcgdGhyZWUgY29tbWl0cyBjdXJyZW50
bHkgc2VlbSB0byBiZSBpbiBnb29kIHNoYXBlIGluDQo+Pj4gICAgICBtYXN0ZXItbmV4dDoNCj4+
PiAgICAgICAgIC0gImxpby11dGlsczogUmVtb3ZlIG9ic29sZXRlIHJlY2lwZSINCj4+PiAgICAg
ICAgIC0gInRlbGVwYXRoeS1pZGxlOiBSZW1vdmUgb2Jzb2xldGUgcmVjaXBlIg0KPj4+ICAgICAg
ICAgLSAiY2hlcm9rZWU6IFJlbW92ZSBvYnNvbGV0ZSByZWNpcGUiDQo+Pj4NCj4+PiAgICAgIFVu
Zm9ydHVuYXRlbHkgd2l0aCB0d28gY29tbWl0cyBJIG5vdGljZWQgc29tZSBpc3N1ZXMsIHdoaWNo
IEkgd2lsbCB0cnkNCj4+PiAgICAgIHRvIGRldGFpbCBiZWxvdzoNCj4+Pg0KPj4+ICAgICAgICAg
LSAib3BlbmxtaS10b29sczogUmVtb3ZlIG9ic29sZXRlIHJlY2lwZSIgY29tbWl0IGluIG1hc3Rl
ci1uZXh0DQo+Pj4gICAgICBjdXJyZW50bHkgcmVtb3ZlcyBvbmx5IHRoZSBSREVQRU5EUyBsaW5l
IGluDQo+Pj4gICAgICBtZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vn
cm91cC1tZXRhLW9lLmJiDQo+Pj4gICAgICA8aHR0cDovL3BhY2thZ2Vncm91cC1tZXRhLW9lLmJi
Lw0KPj4+ICAgICAgcmVtb3ZlIGFsc28gdHdvIG1vcmUgbGluZXMgaW4gdGhhdCBmaWxlIHdoaWNo
IHJlZmVyZW5jZQ0KPj4+ICAgICAgJ3BhY2thZ2Vncm91cC1tZXRhLW9lLWV4dGVuZGVkLXB5dGhv
bjInLiBGdXJ0aGVybW9yZSwgaXQgZG9lc24ndCByZW1vdmUNCj4+PiAgICAgIG1ldGEtb2UvcmVj
aXBlcy1leHRlbmRlZC9vcGVubG1pL29wZW5sbWktdG9vbHNfMC4xMC41LmJiDQo+Pj4gICAgICA8
aHR0cDovL29wZW5sbWktdG9vbHNfMC4xMC41LmJiLw0KPj4+DQo+Pj4gICAgICBQbGVhc2Ugc2Vl
DQo+Pj4gICAgICBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVk
L2NvbW1pdC8/aD1tYXN0ZXItbmV4dCZpZD03YjE3OGNmOWVhOGZlMjY4Mzc0MWY3NWViYzIyMGYw
ZjcwY2I0NWY4IDxodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVk
L2NvbW1pdC8/aD1tYXN0ZXItbmV4dCZpZD03YjE3OGNmOWVhOGZlMjY4Mzc0MWY3NWViYzIyMGYw
ZjcwY2I0NWY4DQo+Pj4gICAgICB2cy4NCj4+PiAgICAgIGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3Rv
cHJvamVjdC5vcmcvcHJvamVjdC9vZS9wYXRjaC8yMDI0MDkzMDEyMDUyNC4yMDUxNDAzLTQtbmlr
by5tYXVub0B2YWlzYWxhLmNvbS8gPGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcv
cHJvamVjdC9vZS9wYXRjaC8yMDI0MDkzMDEyMDUyNC4yMDUxNDAzLTQtbmlrby5tYXVub0B2YWlz
YWxhLmNvbS8NCj4+Pg0KPj4+ICAgICAgICAgLSAibXlzcWwtcHl0aG9uOiBSZW1vdmUgb2Jzb2xl
dGUgcmVjaXBlIiBjb21taXQgaW4gbWFzdGVyLW5leHQNCj4+PiAgICAgIGN1cnJlbnRseSByZW1v
dmVzIG9ubHkgdGhlIHJlY2lwZSBmaWxlcw0KPj4+ICAgICAgbWV0YS1vZS9yZWNpcGVzLWRicy9t
eXNxbC9teXNxbC1weXRob24vMDAwMS1fbXlzcWwuYy1maXgtY29tcGlsYXRpb24td2l0aC1NYXJp
YURCLXdpdGgtMTAuMy4xMy5wYXRjaA0KPj4+ICAgICAgYW5kIG1ldGEtb2UvcmVjaXBlcy1kYnMv
bXlzcWwvbXlzcWwtcHl0aG9uXzEuMi41LmJiDQo+Pj4gICAgICA8aHR0cDovL215c3FsLXB5dGhv
bl8xLjIuNS5iYi8NCj4+PiAgICAgIGl0IGRvZXNuJ3QgcmVtb3ZlIHRoZSB0d28gbGluZXMgcmVm
ZXJlbmNpbmcNCj4+PiAgICAgICdwYWNrYWdlZ3JvdXAtbWV0YS1vZS1kYnMtcHl0aG9uMicsIG5v
ciB0aGUNCj4+PiAgICAgIFJERVBFTkRTOnBhY2thZ2Vncm91cC1tZXRhLW9lLWRicy1weXRob24y
IGRlY2xhcmF0aW9uIGluDQo+Pj4gICAgICBtZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3Jv
dXBzL3BhY2thZ2Vncm91cC1tZXRhLW9lLmJiDQo+Pj4gICAgICA8aHR0cDovL3BhY2thZ2Vncm91
cC1tZXRhLW9lLmJiLw0KPj4+DQo+Pj4gICAgICBQbGVhc2Ugc2VlDQo+Pj4gICAgICBodHRwczov
L2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC8/aD1tYXN0ZXIt
bmV4dCZpZD0xYTVkNTA4N2Y2NmFkM2NlYTk5NDczMjIzOTcxYWFiOTM5MWZmYzk0IDxodHRwczov
L2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC8/aD1tYXN0ZXIt
bmV4dCZpZD0xYTVkNTA4N2Y2NmFkM2NlYTk5NDczMjIzOTcxYWFiOTM5MWZmYzk0DQo+Pj4gICAg
ICB2cy4NCj4+PiAgICAgIGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVj
dC9vZS9wYXRjaC8yMDI0MDkzMDEyMDUyNC4yMDUxNDAzLTEtbmlrby5tYXVub0B2YWlzYWxhLmNv
bS8gPGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9vZS9wYXRjaC8y
MDI0MDkzMDEyMDUyNC4yMDUxNDAzLTEtbmlrby5tYXVub0B2YWlzYWxhLmNvbS8NCj4+Pg0KPj4+
ICAgICAgS2luZCByZWdhcmRzLCBOaWtvDQo+Pj4NCg==

