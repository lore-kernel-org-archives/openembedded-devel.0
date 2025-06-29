Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E496C7EE30
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 07:33:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.52])
 by mx.groups.io with SMTP id smtpd.web10.13616.1751182403375641643
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jun 2025 00:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=iq6zClFD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=admgVr/RtoZePoJ52IM3YX2otK1NFHESTWnk5ZLfLCRbiZAhLmsRg0BfyYCgV5Z/6bWSQ60X+aRDds/lNCa6l0hMRUzoC1mn7hwkQsYA3X/nQqg+Gm2fW2pAw2YV2GLUA8cUgC2LU/w8AWahO+9m5yrtO7xJVrwrkpCy0/soi+IRIJwYmYHx8C0G24aJwMavDznTzF6h+qB1Sfi1LfF42WjjGxVZHavJBIinsCOXnwIdLFT1V96YV2P04itbPOiXj4i3GV78aP8jYsrAJyMFBdvAtdK6bqTG+lEK1Btv9uZ63EuVyvVA9iZsPPYUtC53x1XDMU/vPE8yoEbiHygDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVztWgYyBu8um8VsdEgrcCLd3J0lGylqWzWgKeN4g1w=;
 b=J+ByNfWoo2DKib8cuo+5Vqr2TRYRZFbIqPeCHNcrJU64NJFwmtMwfD18mQOX2SEPUWI54sNRcOKEyLEtYjwLDmwnKysRDxZMsIBTHl4HjG41wqGbc04jmWVdP1uyH38LmJUAhNwtXtWi7xGOosfSzUk8SdwVRiZlv2nm1ItqlBaAZLMvaWQ3wjZ5IxC13H1jedm1OwWhHd93yI1yfPr8+1uL1GNvS8ONwYHXx4LOQZXqwuSadaTeKn419UfM2Qwqc09oQgIw3VR+hxEPhfHalIzepFGB064JOzbPEP9qusKMwuv4BzQXZcZ3nt4I1eQClhiZTr7eEY2HUGaiYc6F8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVztWgYyBu8um8VsdEgrcCLd3J0lGylqWzWgKeN4g1w=;
 b=iq6zClFDK3eITK3x7Q4TKFls+GoCuWbmhrz5JGLr9RWqyNDQkJhnbwJ8z0dpihSN8ByXy3RxPoh+JYFdO0TTxymiuKaze4Xz+x5unwp3H+0zn16kT8Dvd74ilGCdof6sX+Zf5YM71FxdeKDLpXPgnr11O7li4rQBTqcU6Jjuz+k=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DB9PR06MB8058.eurprd06.prod.outlook.com (2603:10a6:10:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Sun, 29 Jun
 2025 07:33:20 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%4]) with mapi id 15.20.8880.024; Sun, 29 Jun 2025
 07:33:19 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Khem Raj <raj.khem@gmail.com>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-oe v4 0/6] signing.bbclass: add certificate chain
 handling
Thread-Topic: [PATCH meta-oe v4 0/6] signing.bbclass: add certificate chain
 handling
Thread-Index: AQHb512a2o5oJjVk50is6ZuBfaX9xbQY4C2AgADgNFI=
Date: Sun, 29 Jun 2025 07:33:19 +0000
Message-ID: 
 <AM8PR06MB752197F93B9DF288572F9899BC47A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
 <CAMKF1soMmTO5wFSVFSQ2xgYM7QhkZztLu3DpMYb5k3YVFFEn-Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soMmTO5wFSVFSQ2xgYM7QhkZztLu3DpMYb5k3YVFFEn-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DB9PR06MB8058:EE_
x-ms-office365-filtering-correlation-id: 3eb505c0-b6e4-4e3b-b920-08ddb6df3882
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UDNPbm1tbEcrSDFTaUZlQVpCcDJBVG5URDRtUEpTaWkxRWY5SU80OTVqVU5O?=
 =?utf-8?B?VUY4RmZ2M3psdWtJYy80Y0xhY09PUzJiek80enZuRUZjbEhNTmNNMlUwaDBy?=
 =?utf-8?B?VUFRNzBXSDBMVWphMnFyTEszc1hGR3l4bW1GOXpWN1B5NHo3SzZKV3JpaGZ1?=
 =?utf-8?B?dVhXY1dDVU85cXFheThMRE9jZTFVMS9BMXpCZzlHQUt1Si9qQURXT0NqVG5T?=
 =?utf-8?B?TENoc1F6cXY4M2tYcm00S21xN01FeDgrVHdzcnRjclUxSXRUYWhMQzV1REtN?=
 =?utf-8?B?TlM3L0R4QlM4ZEQzK3l1SitvTXRISHVaSlpuWU1nM3NsY1Z6NVpQZkl0cCth?=
 =?utf-8?B?UzZ0bFk1elIrbk5lZlJGNUdIQ3BVWWNINk1vMzluSDk1VmQ2YzN1S2c5V3lk?=
 =?utf-8?B?RHdyNWh2U1llMzJ2aEg4ajhETzI1MHRFSC95WU53NlFBdDVGUWdvZVlTSWwy?=
 =?utf-8?B?WTQ3bXYxLy8wbFdZZXVHUkMyTGQ1Z0V3NDN2ZS9CRzlKeTgyejhWNjd1eURL?=
 =?utf-8?B?alpTcUFKSm1Bc3F5c2pQQUtMaEpLOGJBellyNlN1MW51djNjcjZtZE1rRVdx?=
 =?utf-8?B?ck9EbEhNWW1STExEUVRad3hITE1kQVY1UVdPeHM2MWtzOVZxNTVXeEErRGxC?=
 =?utf-8?B?RXhQaGdOUWo0d0JEb0NRYVhkNVZWZ0NFaEFxd0U0cmNTM0JUbERpSTg2TFcw?=
 =?utf-8?B?OThNZFJYR3pWSksrYkZRbllscmNqS1VIcHovUmxhMEF2ZkxyaWhSS05EWEtw?=
 =?utf-8?B?dDhUcEltNUY0L0lmWlUyNXVia05Oc2w1bjc1QVlrdWdxWFhHcndKWXkyVU9N?=
 =?utf-8?B?OUhsNFN5QmZrTmNwVkNUd3BCVlQvL1h5SkhZUUZwMVB4YU9IYkdmdnpMVm43?=
 =?utf-8?B?UHZuRjdVMHZ4eWVqYnR2ZmRSM1Q0YlAwbXVCaFluczVDWENNR1lLSnh2czRD?=
 =?utf-8?B?VnVVVFUwaHFNbG1TRFVyaENMTGVFTW1JUzRLOWVCU2xxUUxjMDI5UG5IUGpK?=
 =?utf-8?B?bUJEQjFPcUdYbUtEQzVHVldHMllBak92WXNpVlZsTjN2d1IxN2lBTGxKMnMw?=
 =?utf-8?B?SldnVHNHUm5VeWJYWVNUK29odWlldWRVb05BandadGpGVjNKaWlvK2Z6YzFT?=
 =?utf-8?B?MnpBRHhoWlluK2NHZElNYWdLMGF5c0dabkRlY3dFYUJjZGpjTVdTT0VRaDBO?=
 =?utf-8?B?YkZ3QXlBdUFQQmNIc2dEUWVpL3crTmVEUjRNUzArNDdEYTBQaEZPQmRqTXVp?=
 =?utf-8?B?TW1WallXTmFza3h0VjBvK3pjWG1mck9IVFR3N1ArSGlxWnhnd2J5SnBVMDc4?=
 =?utf-8?B?QldrZzJzYjJUaFNtdEdoa2Q2aW02VE15SFZqMktTeldkZlo2UXJEOUIzbXht?=
 =?utf-8?B?eXc5cGl6eEJFcDVEdTJka3dtOWxmZTNXT2Y2L3JOZTIvRE11c1hLZndhU2FH?=
 =?utf-8?B?VG9FWEovWU1hYkkxODJEQmJEVHptWTlkc2ZVK1FRTFo1b3JRUVdKMnQ4WGdv?=
 =?utf-8?B?bGY5bXJIZzB6K1J0a1JnSjJoK0FNTVpsTjdub2Zmb0FxK2h5UlhITDRnWHFR?=
 =?utf-8?B?YU53OU5rZUlEN0Jja25CYjhqSkh6b2lrS2pKVVYwNVhOSmt4TktPMy9IWm5z?=
 =?utf-8?B?aVQ5UCs1RythZmJpcHJWc2kvSnVIcFJ6Zm44cmExMWh4N1ZmaTFpMmJsUGlL?=
 =?utf-8?B?bU5zMmtzY3kvRWs4NWxlMm5hQ0dZWmloMkgraVpsVkNFYWczWW8yT21ZYkR5?=
 =?utf-8?B?NExXZDRXQ0djajlZRkU0c0Z4ME9QQjdMZDZlNHlwOTVSOGRkaURWbWN4YTVs?=
 =?utf-8?B?TW5HcEpHVm4rNzVkd1lURUNqcjFXRVZPMG1MV3djWDcwTFRyTUVTQmZqSWNn?=
 =?utf-8?B?VFlUVXc4YlNNMDJYV1FSUGpOSlFRNDkwMzF0LzdnQURJUVQxWDkwRWExM0Vq?=
 =?utf-8?B?cWpjQ3JJdERJTTFFVFlFbkIrWFFqYjNwOUZ3MFZwdk1XdnhJSWZtOEZGeHhC?=
 =?utf-8?B?dU5NcGp1dk5RPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dll2VSttUFJyYTBuZnR4aDNPK0xubW1nRHd6eklkc2tqYmFmTHR6MS9RWVZj?=
 =?utf-8?B?aGZBYS9SRmkwUXVoN1VteUpPeGQ4T3NBRUVzYjZTSExPS2FPamNFTzRBNTkz?=
 =?utf-8?B?MGJySXFTNEV2MVl3OVFXUG91bUhEUjdIT0o0VVBpL3JsNkptSlg0S3JiQkQ1?=
 =?utf-8?B?Q1oxa3lTcWhSV1U5N282WGdzZThHdWdhNXN3VkFQY3BwQVFnVWNWeGROeWJ4?=
 =?utf-8?B?MFNWYkx2WWhzMWVLWEk4WXhpczBzT2k4TU1BQ3N6b0ZNRmZxeG1xTEtpc3dI?=
 =?utf-8?B?RndBTUtxMGNsUkdwVEMzZ0QyY0hqbXd3Q1RpMGt0RFlYNU5tK2h1azRIbXBQ?=
 =?utf-8?B?MURoMWc0c0pnd0JLWjNKTDRleWdGOTF6TXN5MzVZaUlnQ1J1YmlQaDc1UXlv?=
 =?utf-8?B?YVM4WlB3V040SXdBMG1CQWdmWkgwQS94SVZ3NFVvVjEwTFJFd0dZbzZOZHBR?=
 =?utf-8?B?WExOOTBkblBZWUM5THRvRVJRSjZ2WTBhODVtZGNyVkF1MEpqVGxvTVRsS0dt?=
 =?utf-8?B?N0YwQjVqWk5EbjJ4N2VKd1JtUUM2QSt1S3pPWnZqQ1ZmbG5uNVd3L1hHa0pT?=
 =?utf-8?B?VjVYQ0VqbVpoRndXc2hNTVQrZkdyZU5iYUkxNXEzaU1LcHFaWE80Uy9CNGpG?=
 =?utf-8?B?UE1UWnRJTjQ5ZUVWeG14alZuSUdrMjJLbVlMOHJMbnhzdFpyQUFtb09sVEhL?=
 =?utf-8?B?TzEzeWhuYmZjSDZWVHlsM1E1aVNBcWlKbXZhMDJUVVBzQ1piMDZZdGtoaU43?=
 =?utf-8?B?M1E0WDVuZG5YSmNPY3RheStIUE9hck5IYmt4REE0bzVwQVpOd2ZocU5PejIz?=
 =?utf-8?B?NGhpcW5WdWhBWkFZRlJWVjJaVE01TTU2U0R2azFiN3JOQXU5VUViYU9wbGVn?=
 =?utf-8?B?dk8rL3ArV0V5WVd3eEZWUW5hWmgzeXF1NFAwY3lSK20rSlZFODFGalZKL2h5?=
 =?utf-8?B?VHBkd3BFM0pmYVNvKy93Um1sL0lVMWl4eGZzd2pWSjlXR2ZaS0RtcGR2d1B3?=
 =?utf-8?B?Vkc4T0pzN2drWW5WaVhxTVdkcnlwOTEybW9aOTV2OWtPbUI1ZUpHc0FaTmZa?=
 =?utf-8?B?YmYxRUlYTTZzZUpvekNaTUorRDM4bWo3TzdUaDhxWkdrbzR3dmYydGVvSFdY?=
 =?utf-8?B?TXJjbXJ5QkF4U05zaW1lOEdobVFWUmdnVDZtM2phTGo5NnFiYmxyTFZzYXcy?=
 =?utf-8?B?bGhPM3RpMHRnTmpNTmlpQjkxSjdPYTBkeWtDdUJaSnpxZEI0TGtHZldkYmtN?=
 =?utf-8?B?aDNTc0NLa0VSNmZsdm1tcXhXalFVS3gvT2NwVXFoTWlqbFpib1VISG1oYmZ3?=
 =?utf-8?B?K3VmU3lJZ2FoMDZ5TlNvZHF4VVg3dFIwYTNDMmtiV0pFUXJ1ODJkQ094clk0?=
 =?utf-8?B?TnlPWmlxSytrS2MyWHFkTHY1bW5DeFVHeGZ4OWc2QXhaQjFzaWRsNzkxS1JN?=
 =?utf-8?B?K2FkTS91a0t3bW5JQnVlQkoySlRRMnp6NEt0WUxoVGFMRGU5ZlhsQldQZlAy?=
 =?utf-8?B?bXVndjMyNFZ4cm1OV0FpUXBVb0dyS1Q0K25ITVdqZFZPbUVFc291SlM4d1Zu?=
 =?utf-8?B?TjZGUlkrNTFBdTlac0VseDgrcTZ4ZzNJOFpGS0hDWUZBS3dsMWFTcHpIZUdj?=
 =?utf-8?B?a1VjTjdLYUN1SU9teldZVDhvRDJYa3plRjZWcDNXQWNGWVNRQWROS0poLzZU?=
 =?utf-8?B?L0tDSWljNnJlb0RRNlI0dlh1dWNhY1NkZFF6Rzc4eWpaSEJaVHY0ZEhuMVhL?=
 =?utf-8?B?U2VxWmJSMW5uTmhidFZpcHZWM0phdzlPT0V1ZFBGaDFqSU1OK1BCYllWVnpK?=
 =?utf-8?B?aGlWbGtjZ3U5TVFuVVR4MUVHU1pmSFQrc09jN1NaZVpLV0c0dnQ4Sk1DeXRM?=
 =?utf-8?B?eVFDSktpNGRGYU1McGZacEd0VERqemVqVkw5TGZhK0o2eDBsTzR2eGlNbjh0?=
 =?utf-8?B?S0xLVFNBOXFiV0hRR1V6WUl4algrZUJRTXBITkdha1pEK1pONFZiUGVuSThH?=
 =?utf-8?B?ay9ZR1pNOHRXcUhjalM2anJnRUd5KytUNlVUT3dGaENXbE1kVUZoTW9SSXhw?=
 =?utf-8?B?Y2M2bXcxaWtCbndsQ2RvYnoreFFxY0Z5QllvRVZyMkFVNzZ6bU9zYW1ybkJP?=
 =?utf-8?B?UXVvcEtUa3haOWJPQ2NuUVRHT2ExWnBlNEg4dnY0eEF4YWc0WFFFSS9pWW1N?=
 =?utf-8?B?clpqT09tYm1ycUdNQzJBYUFQN0hpWGUxQkkzNStlQ25SR2x3aldlNHpteXNW?=
 =?utf-8?Q?fGjs1Rc+Pxid3ol87L0roDAZLhkAXMa+gIPuPTT7OA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb505c0-b6e4-4e3b-b920-08ddb6df3882
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2025 07:33:19.7984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bq2nvyCI8lrGRMoTtBRD3WK6B8nfOdWn5xsiDrcj7tv2aj1hNhTiuSC8oa8w5f6kvuKFfWk5T+5H04hb9v2JnyEJmqc9UwqDAFnjnUXJ6L7qhuZVfsh5ZNeacAFTjRw6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jun 2025 07:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118164

SG9pDQoNCg0KPiBJIGhhdmUgdG8gdXNlIC1wMCB0byBhcHBseSB0aGUgcGF0Y2hlcywgZGVmYXVs
dCBpcyAtcDEsIGl0IHdvdWxkIGJlDQo+IGdvb2QgdG8gYWRqdXN0IHlvdXIgcGF0Y2ggZ2VuZXJh
dGlvbiB0byB1c2UgLXAxIGluIGZ1dHVyZS4NCg0Kc29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNl
IQ0KDQpGaXhlZCBpdCBmb3IgdGhlIGZ1dHVyZSAtLSB2aWEgZ2xvYmFsIC5naXRjb25maWc6DQpb
ZGlmZl0NCiMjIGRpc2FibGUgJ2EvJyBhbmQgJ2IvJyB0byBlYXNpbHkgY29weSBwYXRocyBvdXQN
CiAgbm9wcmVmaXggPSB0cnVlDQojIyBidXQga2VlcCBpdCBpbiBmb3JtYXQtcGF0Y2gvc2VuZC1t
YWlsIGZvciB1cHN0cmVhbWluZw0KW2Zvcm1hdF0NCiAgcHJlZml4ID0gdHJ1ZQ0KDQoNCmdydcOf
DQpKb2hhbm5lcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpG
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KU2VudDogU2F0dXJkYXksIEp1bmUg
MjgsIDIwMjUgMjA6MDcNClRvOiBTQ0hORUlERVIgSm9oYW5uZXMNCkNjOiBqbHVAcGVuZ3V0cm9u
aXguZGU7IEdFTy1DSEhFUi1ic3AtZGV2ZWxvcG1lbnQ7IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIG1ldGEtb2UgdjQgMC82XSBz
aWduaW5nLmJiY2xhc3M6IGFkZCBjZXJ0aWZpY2F0ZSBjaGFpbiBoYW5kbGluZw0KDQpbU29tZSBw
ZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJv
bSByYWoua2hlbUBnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KDQpUaGlzIGVtYWls
IGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFzZSBiZSBj
YXJlZnVsIHdoaWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBvciByZXBs
eWluZyB0byB0aGlzIGVtYWlsLg0KDQoNCkkgaGF2ZSB0byB1c2UgLXAwIHRvIGFwcGx5IHRoZSBw
YXRjaGVzLCBkZWZhdWx0IGlzIC1wMSwgaXQgd291bGQgYmUNCmdvb2QgdG8gYWRqdXN0IHlvdXIg
cGF0Y2ggZ2VuZXJhdGlvbiB0byB1c2UgLXAxIGluIGZ1dHVyZS4NCg0KT24gRnJpLCBKdW4gMjcs
IDIwMjUgYXQgNToxOOKAr0FNIEpvaGFubmVzIFNjaG5laWRlcg0KPGpvaGFubmVzLnNjaG5laWRl
ckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4gd3JvdGU6DQo+DQo+IEFkZGluZyBzdXBwb3J0IGZvciBo
YW5kbGluZyBhIGNvbXBsZXggUEtJIHNldHVwIHRvIHRoZSBzaWduaW5nLmJiY2xhc3MNCj4NCj4g
U2luY2UgYSAoc29mdClIU00gY2FuIG9ubHkgc3RvcmUgYSBzaW5nbGUgY2VydGlmaWNhdGUgaW4g
b25lIHNsb3QsIHRoZQ0KPiByZWxhdGlvbiBiZXR3ZWVuIGEgbGVhZiBjZXJ0aWZpY2F0ZSwgYW5k
IGl0J3Mgc2lnbmluZyBpbnRlcm1lZGlhcnkgKG9yDQo+IHJvb3QpIGNlcnRpZmljYXRlIGhhcyB0
byBiZSBzdG9yZWQgb3V0c2lkZSBvZiB0aGUgSFNNLCBpbiB0aGUgZm9ybSBvZg0KPiBzb21lIGFk
ZGl0aW9uYWwgbWV0YWRhdGEuICBUaGlzIGFkZGl0aW9uYWwgZGF0YSBpcyBzdG9yZWQgaW4gYW4N
Cj4gZW52aXJvbm1lbnQgdmFyaWFibGUsIHdoaWNoIGlzIHNldHVwIGFuZCBtYW5pcHVsYXRlZCBi
eSBhIHNldCBvZg0KPiBoZWxwZXIgZnVuY3Rpb25zOiBzaWduaW5nX3tnZXQsc2V0LGhhc31fY2Eu
DQo+DQo+IFRoaXMgcGF0Y2gtc3RhY2sgYWxzbyBkb2VzIHNvbWUgY2xlYW51cCBvZiBub3cgc3Vw
ZXJmbHVvdXMgY29kZSBwYXJ0cy4NCj4NCj4gLS0tDQo+IFY0Og0KPiAtIHJlYmFzZSBvbnRvIG1l
dGEtb3BlbmVtYmVkZGVkL21hc3Rlcg0KPg0KPiB2MzogYWRkZWQgdXNlLWNhc2UgdG8gY29tbWl0
IG1lc3NhZ2Ugb2YgInNpZ25pbmcuYmJjbGFzczogYWRkIHNpZ25pbmdfZ2V0X2ludGVybWVkaWF0
ZV9jZXJ0cyINCj4NCj4gdjM6DQo+IC0gcmV3b3JkIGNvbW1pdCBtZXNzYWdlIGFuZCBjb21tZW50
cyBmb2xsb3dpbmcgcmV2aWV3IHN1Z2dlc3Rpb25zDQo+IC0gZm9yc2VlIGxvY2FsLmNvbmYgb3Zl
cnJpZGVzIGZvciB0aGUgQ0ENCj4NCj4gLS0tDQo+DQo+IFRvOiBqbHVAcGVuZ3V0cm9uaXguZGUN
Cj4gQ2M6IGJzcC1kZXZlbG9wbWVudC5nZW9AbGVpY2EtZ2Vvc3lzdGVtcy5jb20NCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiByYWoua2hlbUBn
bWFpbC5jb20NCj4NCj4gLS0tDQo+IEpvaGFubmVzIFNjaG5laWRlciAoNik6DQo+ICAgICAgIHNp
Z25pbmcuYmJjbGFzczogcmVmYWN0b3Igc2lnbmluZ19pbXBvcnRfY2VydF9mcm9tXyoNCj4gICAg
ICAgc2lnbmluZy5iYmNsYXNzOiBhZGQgc2V0fGdldHxoYXNfY2EgZnVuY3Rpb25zDQo+ICAgICAg
IHNpZ25pbmcuYmJjbGFzczogYWRkIGdldF9yb290X2NlcnQNCj4gICAgICAgc2lnbmluZy5iYmNs
YXNzOiBhZGQgc2lnbmluZ19nZXRfaW50ZXJtZWRpYXRlX2NlcnRzDQo+ICAgICAgIHNpZ25pbmcu
YmJjbGFzczogYWRkIHNpZ25pbmdfZXh0cmFjdF9jZXJ0IGhlbHBlcnMNCj4gICAgICAgc2lnbmlu
Zy5iYmNsYXNzOiByZW1vdmUgc2lnbmluZ19pbXBvcnRfY2VydF9jaGFpbl9mcm9tX3BlbQ0KPg0K
PiAgbWV0YS1vZS9jbGFzc2VzL3NpZ25pbmcuYmJjbGFzcyB8IDE3MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTM3IGluc2VydGlv
bnMoKyksIDM1IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDViNGUyNmFkYjgw
Nzg0YmU1OWU1YjgyYzA5OGVjMDUwYzkzYzFjYTQNCj4gY2hhbmdlLWlkOiAyMDI1MDYxOC1zaWdu
aW5nLXNldC1jYS1mMzk4MjU5MjIyZjUNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBKb2hh
bm5lcyBTY2huZWlkZXIgPGpvaGFubmVzLnNjaG5laWRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4N
Cj4NCg==

