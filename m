Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EB1C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:50:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web10.8535.1711054201030122366
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=daX1eq7x;
 spf=pass (domain: axis.com, ip: 40.107.20.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BO04UnOmQZIMfNKrDGdCOMCGrUDr4xRRcbZXHPJGe58Rdk4+69FDH/Gjywyiv+ZCMZqZZnYOhBlkZz31l6czMl2mJ6wwnwo9V30UEasIGEQqVOnGnNrdEjwJQyRid/LjQds36ZDtY3ztt1EtDdzGoTQ3Aa0nFRASJLP3TpmOaoxQHUwWvlV7wC91DgWZLVAppeFe40pMQq5UVKIW6qJkAxGaNCT9iwV5E8V9T+qq1tXMh2DODuzxEpbFs9zJFbQjbgYyO4RDWfgTtmOHXi0psrcHcVw9vggIOvdIqrGOY/BeBXIPZ+ppWCdRFsqxPt1Lqs61RJVmk2tOgDddsINetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGj1W6KT01fKBVZg58kiLjpchCi1YzpGpJbtIFTT45k=;
 b=SOswnPBbCy1rDy8QOR2JA9l48YazOsUSTcSq17hlzqU+Iko2d373o4L5C8WQeZv6bpCdKDONDYe0ejrpNixduMrwkS3NP+z69t+zgziuGZmexhFK5Qnqdp+Uql75dLP5Wm2r5VKm70zphL9IXnZ7CQ0bzUAPV4i9h2/tTCf+bCWVwTB6ECI967W3DiKZpTl/NecS2zGkhl5Q4EqpbrF7zA0yTMx4Y03SbkKRnJjUqoFS9Wytr2GDPc6/uJRdx6obSgOm+iNfTQ0kJyKJqsD5RBhTiKKBHT6eUt6yYe4ZMXVhjV55e5szZ6vuF19PROd66UYrFB8J2O2uQBG3cP/G/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGj1W6KT01fKBVZg58kiLjpchCi1YzpGpJbtIFTT45k=;
 b=daX1eq7xVep1dNYNK2Eb039Nc8WS4rHMDGzinOce9ucXIrN0Qd+3RebQ17m16hnNgBycarDyYYH6t0aJXuI1GO/vt3B0Mq5BWp7SyJg6XAHuzzxUBUBYCDQJMnZ744U+JPi/gq3QRM87s6WiYpYIeY1k8dPH0x4G3SS07qRKlgA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9824.eurprd02.prod.outlook.com (2603:10a6:10:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 20:49:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 20:49:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marek Vasut <marex@denx.de>, Christophe Chapuis <chris.chapuis@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>
Subject: RE: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed
 instructions
Thread-Topic: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed
 instructions
Thread-Index: AQHad4jxU+/FfskiNk+Mb43zXOkzIbE9c0QQgAAXKoCAABw4gIAAaXeAgAShYRA=
Date: Thu, 21 Mar 2024 20:49:57 +0000
Message-ID: 
 <DB5PR02MB10213F0FA89170FB203B3E9F7EF322@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-7-chris.chapuis@gmail.com>
 <DB5PR02MB102132F3CAC801E36E7B462A7EF2D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <868000cd-9113-4615-89ac-e7d35a564937@denx.de>
 <CACA7eUT_5948nd+rHtieSTrGmm1J6tjqQ8s8z7g0g5E+xAfkJA@mail.gmail.com>
 <d66f8293-89ac-4d6c-80e6-94457b4cdbb7@denx.de>
In-Reply-To: <d66f8293-89ac-4d6c-80e6-94457b4cdbb7@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9824:EE_
x-ms-office365-filtering-correlation-id: 49e77dcb-74c8-4fc4-5571-08dc49e8780f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 heNb5E4HPcqb6TiI/Ymxh6GvARaFaJCjQLc9d5w8/eOoa6fra3ZpfWONsCoWYCt5XDRiIYDvcIpSg/l3fEEwdbv1/ySURUZdgWC8EDnLj3eGGn2RZ54h4C7d5QYAtud72Qu3oToy83JSczU6bJF7t/sm7s9d3eZPt1zawRuxEdRR9AjCMAW6dfGloTpcmsgsZaV5GB2ED+68usfsp0oyOxhKgduiCgQFR60/RY4ugXgMIDOLfb7H1JJi+zwicr6/E9GhQYSxRiBgu//OKAnxUryzuMPcanA5sQM7K0s5VOKzddBMCA3ORA1AMDfwyu7udTmWhCYAi3/Mx3RQxvyvQrsx0zk60TukkRnmipG672t3J/+IT8qF71GSaromOotbLpqIJJB+tj/lJTVfm/ZO/a1B8FG8aMxO2wfrMgPsZQcSMk1RF3/C8g+85RWltELJkY2NA4/bC0w768vUBYiuMXm4UQVgCYcN8bd769dCQHS/Ig78BWuL9qimY7MvbM8713elrDgp9C2OwzjLkQqTAcXX2Oj28ARAlusa/uphFDsx50UuZ7qplXjvAZaViq3feFiu9+noyxAEhCzDlN/r09Q2dqabEk8M3pGUw+ttv2Z1tG2u/vkVbK5KHIOj4iUAp0rYM0ZO2keh7EO/GoAQGhTyht2D1XI2iTBeu7VqMfr9nvy6+aQGwY9tC4LrlGa8EQuIJF9TCo3gHWtAF+dnanNDIbZ+6bQhELjQGrqKVdk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K3ZnMDduM0ZPdUl6RnVldUVUbGJlSXhRc2EyOFM5TkVTSGRZbGVUQjhabEFD?=
 =?utf-8?B?aGlNWDdKZXdXbGM2S096a2FJRHNvMlZUczBUcHREZ2crcWlnV0VuVmpnMURX?=
 =?utf-8?B?WmxXemVRRS9EbjNXSytyUU4rSmxQbklrbHgrWUdDdTlmTGpXcEFBZU5tWE9o?=
 =?utf-8?B?Ym5lU3dmNFRqTTJrRUNodnZHM1UvbENiZFhkTTNTZHh5eU80N0hlbDYzTDRT?=
 =?utf-8?B?cFNUV2ZsK0VOb0VoaHVibDBJcDhFTHVlZzEvZ1F6QVk0TVJqMnJreUpLWmtK?=
 =?utf-8?B?RmZvdW1NczlyZzFuRjBUcU04aGFJWHFVSG03MTJ1VFR2MVdCRkNMT1hrbXNO?=
 =?utf-8?B?RGpMbnRya1hDem5INmwvWUlNR0trT3RiYXhxUzE0Q2RqZGJZVFJjMUVqa1BC?=
 =?utf-8?B?RWdrckFwNE94K1VEUnNweW84TnYyNDk1TTlRMnFQUEdDcXM5QlE1eVF2clBO?=
 =?utf-8?B?d0tuZ01FNkwxRGhORUlVQTNuQVA5ZndsZHhEZEtFM21jbzA5ekZ6a0JDVFZD?=
 =?utf-8?B?NCtpSGNOcmlLcko4ejZMQUMvcWtuQnhlaFBQa0grelJVZUYwSVlEVUdzTFZS?=
 =?utf-8?B?Q213cDVISCt1dW5VL3duK24xNS9WTkU0MzJNbUVtckdjUERkditIS2RFazMw?=
 =?utf-8?B?cWdvRUFWWWoyakQ3dGE3alJFTFBrMVFvSWEvem1hTDlkYmdUSXVQSXRHb0RB?=
 =?utf-8?B?dnpRUG1vSTlGT2RrQ1VxSXUrazE0TVppdTQwNmRaRy9SeklBVWN3MjdJN2Nv?=
 =?utf-8?B?czVQRGxFMDhrb05Ma1VUWmZ4UFo5VjZkK3pERDBaVVBBZVZSWm53STd5VEFE?=
 =?utf-8?B?UkRMK0dBWmlyRmZoS3VVWE1OR09sQU1mNDRSYWtKZWZvaVV4ajVQVllHN0ts?=
 =?utf-8?B?NGhneStadDFRWFU3a01QdVBaa0czVVpZcWptM056OWNIM0R4SUlVMWdtSnNY?=
 =?utf-8?B?OWZtZ2tzY3p3MkRraUdVVnp4UUIwbjI2enMzaVdHTmkxcTRXQURZU2NQaHQ1?=
 =?utf-8?B?VUZydkZ1TFo0dnVLWVVqVTZZaENDOUV4WWFES1FISXNJajJXcnozVjR4dU93?=
 =?utf-8?B?TG1PbnhmZXZWYjVyd29HdkJLaDdlMHd4L1QwUlhXLzBzcmZMTFJBbnRaaDdl?=
 =?utf-8?B?eWtkWUxyTmdOWFJnS3hVdk1Jb0NWemRFYjR0emxsbFlscDAvbkpqbjVBWmM3?=
 =?utf-8?B?NjZYUmhENjNxb3paU2dGTG5QRXQrMXJnQktBdFllR1JoODBYSjNHWlFVRHBz?=
 =?utf-8?B?SVFFaFNtL2tkbFB3N3lhRFR1NnpVbWVlM3AzcjVzalk3U3JqaEZUSWhaa3hR?=
 =?utf-8?B?VG4xa05IYmhwSXJ6bnI1eTZibVplQnliamVjYjQya083bTlXMWp4VSswSTh1?=
 =?utf-8?B?NHEyZnJDL2tpaW1tSlNXQ3RzVlVsTEptQUNPZnYwQW5ISE1aNnpmaWxiYXgr?=
 =?utf-8?B?WE9QMmUvYTBzcUcvaSs0Sk5May9QTHliMFpIbm8vczNpSTFIdmkvTndTeDE2?=
 =?utf-8?B?S1RReTN4OXhzRlMxb05aS09ZVGhEVmdRaUI4Rm5YL3RsdHdTdGF2aEt5anNs?=
 =?utf-8?B?MzZTaStyMys0eEFnR1M5bWJnUVZQMk5xbXB6M0lSRTlMdXM4MGdCakdkbkUw?=
 =?utf-8?B?eWd2Tk1kMkNad2xsbHJPMEdKenVCcVlobXJSREhXKzdabTRSV2hkUmVOdWt5?=
 =?utf-8?B?NkdEZ05wVjgvVVMxQ0REall1c01ZTFlrZmVCSHhKNGlpa1BacDVjUWlwVlRr?=
 =?utf-8?B?MkRGemFMRmkvTnBWcksrOG9NQUE4TTVQeDhJOXB6aTFZVE1hNlFtLzZUQm04?=
 =?utf-8?B?Q2VuaDM1NUVjcmMxZ3M5VE5ZY2pDMzFaQ21ZYWs3RjhtYkNma3RhdjBoeTR6?=
 =?utf-8?B?aFRhUjV6U2dBWE9Sem90eTh4OVF6Q1o3c3FVMlBmSXRpSEpFbmYyYTBsVmlV?=
 =?utf-8?B?OUVnQ0ZLSkRha0JCRy8vZzcyRkR2RU8vcDdjU2dvRHh6MmF0UWtoNk5XTWp3?=
 =?utf-8?B?UkRrOFNRVEYzZWFBc2RHQk1iWHc3a2xYTmhsT3dQRXlCMDVJcWNaU05wcnZK?=
 =?utf-8?B?L2QrS3VQYmFCN25WSzEvZGNUdEVwZEwvNk1YVWw3cTFzUy9mbjlXN1gwWWJy?=
 =?utf-8?Q?h2gQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e77dcb-74c8-4fc4-5571-08dc49e8780f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 20:49:57.4842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oalAz++EXZdwGyG7q4t7etF/s5C6zRrDSdDFtD7h9Jpl0YMkNIB1/bslV1rDf2Mz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9824
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 20:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109505

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhA
ZGVueC5kZT4NCj4gU2VudDogZGVuIDE4IG1hcnMgMjAyNCAyMzowMA0KPiBUbzogQ2hyaXN0b3Bo
ZSBDaGFwdWlzIDxjaHJpcy5jaGFwdWlzQGdtYWlsLmNvbT4NCj4gQ2M6IFBldGVyIEtqZWxsZXJz
dGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBkZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPjsg
RmFiaW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZGVueC5kZT4NCj4gU3ViamVjdDogUmU6IFtvZV0g
W21ldGEtb2VdW1BBVENIIHY0IDcvN10gbHZnbDogbHYtY29uZi5pbmM6IGdlbmVyYWxpemUNCj4g
c2VkIGluc3RydWN0aW9ucw0KPiANCj4gT24gMy8xOC8yNCA0OjQyIFBNLCBDaHJpc3RvcGhlIENo
YXB1aXMgd3JvdGU6DQo+ID4gSSBhdm9pZGVkIFxzIGJlY2F1c2UgaXQncyBub3Qgd2VsbCBrbm93
biwgYW5kIEkgd291bGQgYWxzbyBwcmVmZXIgdXNpbmcNCj4gPiBbWzpzcGFjZTpdXSBhcyBpdCBp
cyBQT1NJWCBjb21wbGlhbnQuDQoNClNlZSBjaGFwdGVyICI1LjYgcmVndWxhciBleHByZXNzaW9u
IGV4dGVuc2lvbnMiIGluIHRoZSBzZWQgaW5mbyBwYWdlIGZvciBccyANCmFuZCBhIG51bWJlciBv
ZiBvdGhlciBzaW1pbGFyIHNlcXVlbmNlcyAoZm9yIGFueW9uZSB1c2VkIHRvIFBlcmwncyByZWd1
bGFyIA0KZXhwcmVzc2lvbnMsIFxzIGlzIHRoZSBub3JtYWwgd2F5IHRvIG1hdGNoIHdoaXRlc3Bh
Y2UpLiBBbmQgdHJ1ZSwgdGhpcyBpcyANCm5vdCBQT1NJWCwgYnV0IG5laXRoZXIgaXMgdGhlIC1p
IG9wdGlvbiB0aGF0IGlzIGFsc28gdXNlZCBieSB0aGUgc2FtZSANCmNvbW1hbmQuDQoNCj4gPg0K
PiA+IEkgY2FuIHByb3Bvc2UgYSBwYXRjaCBmb3IgdGhpcywgdGFraW5nIFBldGVyJ3MgcmVtYXJr
cyBpbnRvIGFjY291bnQuDQoNClRoYW5rIHlvdS4NCg0KPiANCj4gWWVzIHBsZWFzZSwgYWxyZWFk
eSByZXZpZXdlZCB0b28uDQo+IA0KPiBidHcgcGxlYXNlIHN0b3AgdG9wLXBvc3RpbmcgLg0KDQov
L1BldGVyDQoNCg==

