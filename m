Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E47BE77182
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:55 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com (HK2PR02CU002.outbound.protection.outlook.com [52.103.64.11])
 by mx.groups.io with SMTP id smtpd.web10.14205.1733412831552431253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=iaORPqhc;
 spf=pass (domain: outlook.com, ip: 52.103.64.11, mailfrom: christopheanderson12@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llJcaH+H4Idp1MvWp4nOdV6vtD03vu3HOKweY62T6vG3VRODuYcnli3xOKT+bI1OKSQJ6pD5Fm2FOE+cc2jk69Ttyvi+XCdoSM4abx0mo0E2Ptt76tYkX9PyaQJSyn5RgbtpB7P3g0TWibmTQ26H6wjnx5Lx6zMbJqnkNXFMOg6u3sdLto/BWUiRO0gBk/zaWjml5R2/gT+Xu1dm8JCNqdLNjcFnuTgAQchdObyyBTuCX4P8qmtyS3XwOuuFdlvp4xjqmaq9227rRQTPrBwMOYjbd/yjveePzQiJAIruMYxlJ3TnubKn8JWusT16F/P7pfP2ekvhaKV26t0eoddsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujC8f+klysCD0km8w2jBz/cjYwrOsTery3JH2TxqWfo=;
 b=qcjk+++BH3+zjAu8M4i5xEBbIXH9YdUaYFJvnxl72CTvvdeKFSHpZmsUzsfxJLvIweKeg/wdgS+Y7xBBb1QuPdVNovLsuoZlGA0HI/ohJXfV1aaNSXd2WuT0qAzBb80cHoZ+HZ3foNbW/kUBSSlFAERLRqBtFojruBSw6NINcDJp0TS6qJ7vYr095RzY7LUhc1JTReZcK5OYitLqMIOC9Bu6P1Zni/bzDtKCc0DqcTRc0yd+5m//8UGSVXfcKI9WuojBCYAdpeYAK/W4D4v5A4ZKfN34ja+XedvghJykjiFlX6bEmyEpDeknLQd+CtlBY2N64MfGxdeKECYq3FOnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujC8f+klysCD0km8w2jBz/cjYwrOsTery3JH2TxqWfo=;
 b=iaORPqhcA/kVCG8pTXosXllMgFvyV6sc1sZH23Vr+6PbULqwwTD2Xqc7nXI+2D+AO5Vo3HUqQDrgdG/5G7LhOyPQN2F0+z201LxvPgmt/dYNrImprHJ94clW11PdkA8oIXG7R6Tv6O3+jfpd181ymWXHqixzCKfwm7ja+FoQsGLf38pime7ht86JrNtBwmyutTJUWyrv+ojK5pm8IxDZBPMsg4u2TcgLEfYdz7fwgaJUP8aSY61FCjfdwy+Qur/z5N92qchZraKeMsZVa8JAJfjPUSXEppGS/zq+OzZsmALAII2+Uou5lFCp5EJ0mjHpNxIN8APjDjJuRLn7vrxxfA==
Received: from SI2PR04MB5776.apcprd04.prod.outlook.com (2603:1096:4:1e4::14)
 by TYZPR04MB7644.apcprd04.prod.outlook.com (2603:1096:405:49::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Thu, 5 Dec
 2024 15:33:20 +0000
Received: from SI2PR04MB5776.apcprd04.prod.outlook.com
 ([fe80::d2f1:85b8:c260:235d]) by SI2PR04MB5776.apcprd04.prod.outlook.com
 ([fe80::d2f1:85b8:c260:235d%3]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 15:33:20 +0000
From: "Christopher L. Anderson" <ChristopheAnderson12@outlook.com>
Subject: Objectives: develop an app??,
Thread-Topic: Objectives: develop an app??,
Thread-Index: AdtHKjfeQOYA8usBQuSaYwCtOaMtRg==
Date: Thu, 5 Dec 2024 15:33:04 +0000
Message-ID: 
 <SI2PR04MB5776EDCA7A4F73EE6244DEF1D4302@SI2PR04MB5776.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR04MB5776:EE_|TYZPR04MB7644:EE_
x-ms-office365-filtering-correlation-id: c387ae73-0ed6-4548-6b08-08dd1542256e
x-microsoft-antispam: 
 BCL:0;ARA:14566002|8060799006|461199028|15080799006|19110799003|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a2N3MTg5SEtBY2hNVHhHbUplU0tzUnBkWG8wVXBYQndpblYyR0swUHNQNWpr?=
 =?utf-8?B?ZkNmU0h1TUhOckMvMk9aWjFETkZMbCthMGxNK2ZDVkN0RGRSb0s3RHVZMWZ2?=
 =?utf-8?B?TlZIUWQ3dnMyKzdTVlF6YlZxT2NRSERtL3dFN0NBdlQ1NjRrNkFFdmI2cGph?=
 =?utf-8?B?cVhpYXV6bktvSFF2UVVVN3ZmNGZ3d1h6SXJjbDBRY2kzV1dkaWFoTU5ERDhv?=
 =?utf-8?B?S1czOE0ycEEzVWQzb3ZEajlReWlWY1pyelE4eHp1TnNueUN3T0lxbTBpYkF2?=
 =?utf-8?B?MDRra2drUUExbWFvUTFKUHA3MEI5YjQvQ0VVSHdQdDFXR0hrVkJPdnpyL043?=
 =?utf-8?B?MDBwY083eDFWczEyOUJBdTc1WHVxWWlkeGRwMzhMVDA1Nm81c1lwaEZBS3RC?=
 =?utf-8?B?cnlVM2tYVEhDM0MvdzVzUWFGS1FYcVhJYXRyUTYxdVR6emJsT1NONTNMQkhW?=
 =?utf-8?B?NDBiT3BQUjROdDlwM09xd3pYMFlyd0Y4dDY0WkpiNHltVzNyUUc4M2xRa2Ev?=
 =?utf-8?B?ZTNyWVNNS2JGMFViUzliNklTV1R2K3MzQllxcEZaRHNZNUdrTXFRVGxmNklT?=
 =?utf-8?B?dTVsek9tWHlZWlFUaHFvT1NiZ1RpeUwzWnVjSnlrbU96ejBFRG1PYnRkVmJv?=
 =?utf-8?B?Z1FKaGg1Y0RjVlFtQ2tmQzRxRkErTCttT0c3Y3JVWW1Lby9aYjQxVlFORlVq?=
 =?utf-8?B?UFlwU3FjYUd1cmYrdGRBYXBmNWhFMFNtV1ZMNlBtZUY4ZnpnSUhBQVpIcFU0?=
 =?utf-8?B?MVVUb3RQWlpLVFA4MklaR1lnTTBIbEZ0Z2FBQ3kxZ24xTVJiMU4xU0g0b2x4?=
 =?utf-8?B?K2FoUmVWUXpKNEtQRjMzbzVDM1dyRnNORFg4aGdRcDBLL0g2Y2RWR2dkMTZp?=
 =?utf-8?B?Y0dCbnJ1Zks5cW90ZEdoTUw1T0lDZnJkdmJ0OHVjWTNiZUFzN2hIcC9ITTNI?=
 =?utf-8?B?a3pxLzUzb1hvSC80aW1waWIxSmhLa3VYb0NDQm1qTXQ0ckZGelRWM1o4cjQr?=
 =?utf-8?B?MzFLVjRweEZHdTlWS3dVWHVKTWkvRVQ2aHhZWkVOU0grdnVhcHR3K1dIWlZJ?=
 =?utf-8?B?SU9sZ1ZhUWVaa1hxeENRSWpsbUgrOWdDUk5wWVZIV3hzZWZlOXZlRTI3NTNB?=
 =?utf-8?B?OTAvQlV5QmpkdEJocWpvOE5yL0VjQUllOHU0MHFoZVVVOWVvWkNCYnJZR1Mr?=
 =?utf-8?B?aDZGNGVPc2ZpVG1UUkVESzZjZ20rUCt6R0ZpVVZVeE9NbTF4VEhMRkRvSFht?=
 =?utf-8?B?aGM1ZmZ0amNaRXBOdm9ZU01iSzlNYlBVMHhoMFZRelkxNU10ekQyODFIVFdm?=
 =?utf-8?B?VnhPb2dLMC9DbzE2cGxJeWZDbjAzN3V5cGJObEt3WFYxQ3lBbk5JWXJIQkUy?=
 =?utf-8?B?b1d1TEdnbUtzeUE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VWhnVmxtb1pQb1N1bXQwWjJWRFNRQ3hmVVNQTkVacitqTlBLcXh0QllzeHp4?=
 =?utf-8?B?VjhnRmsxNzVBbDFMcmlrNmJIYU0yOGcxMXhNMzY3VjgrMFRONGlGZjkwNisr?=
 =?utf-8?B?dnhkUWRXOVFyMS9aaGdYUXR6b1M3WDZZTnU2VEo1cmJqcnVWcitmUk1aYnZV?=
 =?utf-8?B?YVE3MStveXpuckR5NmEycHNzT3NkSW1KejhmRGxrVTZiNXh6N0FuQlZkRHQ0?=
 =?utf-8?B?UWxHcWJ5UHlQYWNqamdmUDVSTGpQa0hlUkkxQU14TGREMXNqaDVnZWVxSWpx?=
 =?utf-8?B?MFlBS0ltUWk2NUxDZnRZZWQ4Y0ppYmxyUEljNEk0SnVFbFNvT3BNYXFCR2VD?=
 =?utf-8?B?eTRVbGNsNUlFM1JKYWtJemJzcTF0cnpRQlZBdEJzZGdnRU5sSGJHcE5HK0JR?=
 =?utf-8?B?aTBscjdtblJ0MURJUWk2VEllNE95c3FXZ2ErSDNNME1QUzZUV3FJRG5EM3Fj?=
 =?utf-8?B?RWVVa1pjMU13dnVIUmdoVzlwRkNtZ1k5WmNwb2IxY05YeVlMZ2laMnpzZHpE?=
 =?utf-8?B?cDFJdWpCZ0tuQjQvVmRPZFhWUkZIMzRpdExVT3l2K3cxWG1LeDB1SHV6c1Ni?=
 =?utf-8?B?eldzRGpSelN4MEJ2UmpZczVxbUNkZXEwcy9tSm92dmEyMTFjRmMxWmpKVDE3?=
 =?utf-8?B?MkxRSGIzRi9CK3cwZWVrL01VSUV2Ykd4K0FGUkhFM2lKMi9xMmQvWW45ckFr?=
 =?utf-8?B?dW9BaUZBcDVyZjNNWE5CMzg2eXNpWFhNVkJ0RVcvRlYxYWJ4S1F4WjYwd05J?=
 =?utf-8?B?MVUxUXMvRWJ1Y21mY0JBRHR0eVkrTXp1RVd0RjR2ZDBxYXlQUjI3QUE1RGxO?=
 =?utf-8?B?bng2aUVYWU5xcU5sZm1ZeGt1V3A1S04rNFZTekVqeExNSy9XcWxyZXlqcTlC?=
 =?utf-8?B?bGM4YlMrbDBEVW1qN29sdllMME1zZGd6RHo1NUZhWERQb1BZYXhYSERNMGJm?=
 =?utf-8?B?SzkvYUhsWWtXWVRzVUhNaVJWUU80bGtmYXNGWXFiajdzMUF2RVVWNjIyVDlL?=
 =?utf-8?B?K01HV3JsaHY2TGkzck9XbG52bjBRcUhPakpZRE1pTkhxQzI0Z1pqdkJIOW5k?=
 =?utf-8?B?WjBnYVozQUlJWE03SEtnUTNBcm51b0F3VUlDUW82UGRSamVnNXcyS3BjcXdE?=
 =?utf-8?B?WTFZLzZicmZuUTBQbG9UUk0xSDFGdDc0aU5PMjZQYzJucCtDemVhbEo1ZzUx?=
 =?utf-8?B?WXZnb3BGTEhTMEs3SVdmalVhYjVUZ2YrTDNraENObU9EZ2F0TXpkZStpT3Ay?=
 =?utf-8?B?ZkF4aHhhN094L0JITFhseHFnaE5tRDJEcHJOWFBHUHE4MzVMeWZWcG1uSjBl?=
 =?utf-8?B?OHN6eEFHTElUVGYrQkJ4TzJ4cGJ2TjkyczF3NVRMTXd3cy9EbC9Kc1J3a2V4?=
 =?utf-8?B?aGxvLzExbkRwKzVMYnQ5WlF0a1pkdjYxNUxxb25RTUhXN0xsUmVkUUthd3Vy?=
 =?utf-8?B?N3ZZa1Bvd09wb3lBNS9JNnVrUFRFOWxFK2VwT0ZkWGpERHFzSjJLUjlkNjRT?=
 =?utf-8?B?K3M4Z3ZKZUFNZVVYZ1RtUm11Sm15aVhMSmV6N282MUhBYmFvSTdtODJEb0tM?=
 =?utf-8?B?WGlkQ0Q2WGVOUWxmUFNHbTkvcnhQN1c0ZG5yRzFjMEhZdk9WUnRxS1cwbDFt?=
 =?utf-8?B?RDVpN09YUWZ1a1lOZThyeTdISmJBcFE3VDNyYWxMR0haRVNuK2RZK2J0TGw4?=
 =?utf-8?Q?EMslo5De2iWmoCmrV5VY?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5776.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c387ae73-0ed6-4548-6b08-08dd1542256e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 15:33:04.6446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7644
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SI2PR04MB5776EDCA7A4F73EE6244DEF1D4302SI2PR04MB5776apcp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114238

--_000_SI2PR04MB5776EDCA7A4F73EE6244DEF1D4302SI2PR04MB5776apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sIPCfmIoNCldvdWxkIHlvdSBiZSB3aWxsaW5nIHRvIGNyZWF0ZSB5b3VyIG93biBzb2Z0
d2FyZSwgc3VjaCBhcyBhIG1vYmlsZSBhcHBsaWNhdGlvbj8NCkFtb25nIHRoZSBhcHBsaWNhdGlv
bnMgd2UgaGF2ZSBjcmVhdGVkIGFyZSB0aGUgZm9sbG93aW5nOiAoQXBwcyBmb3IgaU9TLCBBbmRy
b2lkLCBhbmQgV2luZG93cykNCkFwcHMgZm9yIGZvb2QgZGVsaXZlcnkgYW5kIGRpbmluZyBlc3Rh
Ymxpc2htZW50czsgZS1sZWFybmluZzsgbS1jb21tZXJjZTsgZS1jb21tZXJjZTsgd2VsbG5lc3Mg
YW5kIGhlYWx0aDsgZmluZCBhbmQgcHVyY2hhc2UNCkFwcGxpY2F0aW9ucyBmb3IgYnVzaW5lc3Nl
cyAoYWNjb3VudGluZywgcHVyY2hhc2luZywgc2NoZWR1bGluZywgZmluYW5jaW5nLCB0cmFja2lu
ZywgZXRjLik7IGFjY2Vzc2liaWxpdHkgYW5kIGxvZ2lzdGljczsgdHJhdmVsIGFuZCB0YXhpczsg
YW5kIG1vcmUNCkxpZmVzdHlsZSBhcHBsaWNhdGlvbnMgaW5jbHVkZSB0aGluZ3MgbGlrZSB0ZXh0
aW5nLCBkYXRpbmcsIG11c2ljLCBsaXRlcmF0dXJlLCB1dGlsaXRpZXMsIHNob3BwaW5nLCBhbmQg
c28gb24uDQpJIGNhbiBjcmVhdGUgdGhlIEFQUFMgaW4gYWNjb3JkYW5jZSB3aXRoIHlvdXIgcmVx
dWlyZW1lbnRzLCBvbiBzY2hlZHVsZSwgYW5kIHdpdGhpbiB5b3VyIGJ1ZGdldC4NCldpdGggZ3Jh
dGl0dWRlIGFuZCBiZXN0IHdpc2hlcywNCkluZGlhbiBNYXJrZXRpbmcgTWFuYWdlciBDaHJpc3Rv
cGhlciBBbmRlcnNvbg0K

--_000_SI2PR04MB5776EDCA7A4F73EE6244DEF1D4302SI2PR04MB5776apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxlPjwhLS0NCi8q
IEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEg
TWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2Zv
bnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZv
bnQtZmFjZQ0KCXtmb250LWZhbWlseToiU2Vnb2UgVUkgRW1vamkiOw0KCXBhbm9zZS0xOjIgMTEg
NSAyIDQgMiA0IDIgMiAzO30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwg
bGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowY207DQoJZm9udC1zaXplOjEx
LjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5
bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlO30NCi5Nc29DaHBEZWZhdWx0
DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJbXNv
LWxpZ2F0dXJlczpub25lO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzky
LjBwdDsNCgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2Vj
dGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28g
OV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+
DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5
b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9v
OnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4t
SU4iIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFr
LXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PkhlbGxvLCA8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVv
dDssc2Fucy1zZXJpZiI+DQrwn5iKPC9zcGFuPiZuYnNwOyA8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPldvdWxkIHlvdSBiZSB3aWxsaW5nIHRvIGNyZWF0ZSB5b3VyIG93biBz
b2Z0d2FyZSwgc3VjaCBhcyBhIG1vYmlsZSBhcHBsaWNhdGlvbj88bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPkFtb25nIHRoZSBhcHBsaWNhdGlvbnMgd2UgaGF2ZSBjcmVhdGVk
IGFyZSB0aGUgZm9sbG93aW5nOiAoQXBwcyBmb3IgaU9TLCBBbmRyb2lkLCBhbmQgV2luZG93cyk8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFwcHMgZm9yIGZvb2QgZGVsaXZl
cnkgYW5kIGRpbmluZyBlc3RhYmxpc2htZW50czsgZS1sZWFybmluZzsgbS1jb21tZXJjZTsgZS1j
b21tZXJjZTsgd2VsbG5lc3MgYW5kIGhlYWx0aDsgZmluZCBhbmQgcHVyY2hhc2U8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFwcGxpY2F0aW9ucyBmb3IgYnVzaW5lc3NlcyAo
YWNjb3VudGluZywgcHVyY2hhc2luZywgc2NoZWR1bGluZywgZmluYW5jaW5nLCB0cmFja2luZywg
ZXRjLik7IGFjY2Vzc2liaWxpdHkgYW5kIGxvZ2lzdGljczsgdHJhdmVsIGFuZCB0YXhpczsgYW5k
IG1vcmU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkxpZmVzdHlsZSBhcHBs
aWNhdGlvbnMgaW5jbHVkZSB0aGluZ3MgbGlrZSB0ZXh0aW5nLCBkYXRpbmcsIG11c2ljLCBsaXRl
cmF0dXJlLCB1dGlsaXRpZXMsIHNob3BwaW5nLCBhbmQgc28gb24uPG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5JIGNhbiBjcmVhdGUgdGhlIEFQUFMgaW4gYWNjb3JkYW5jZSB3
aXRoIHlvdXIgcmVxdWlyZW1lbnRzLCBvbiBzY2hlZHVsZSwgYW5kIHdpdGhpbiB5b3VyIGJ1ZGdl
dC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldpdGggZ3JhdGl0dWRlIGFu
ZCBiZXN0IHdpc2hlcyw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkluZGlh
biBNYXJrZXRpbmcgTWFuYWdlciBDaHJpc3RvcGhlciBBbmRlcnNvbjxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_SI2PR04MB5776EDCA7A4F73EE6244DEF1D4302SI2PR04MB5776apcp_--

