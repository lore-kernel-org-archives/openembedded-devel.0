Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2F0CA0EE3
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 08:24:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.18])
 by mx.groups.io with SMTP id smtpd.web10.17989.1755159838936542392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 01:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=0kjwERGc;
 spf=pass (domain: est.tech, ip: 52.101.83.18, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAFi7nRDfFrIzfEA543dVI3Kfc18uODiQ0upY3Jo9bbdwvL9mJgzDjvpozVP43OScITQshkg94toGfhuSw27pkGJ9oOj05oO9fl4QCnd72sw9VPpARwut5DVuswjld3UBu/NatYiK3cv8RSpHMhJiI3TiPeMHXFutEcAxqYq0Y1dqp8if3bBJ/Yc02B1XqcwG6JJiLnT7EyZQWCGZQ8ejP0LwDaKGiMY456xLePQvVh+Win4YFGVH3MfJ7X0KxdlmMNbZ679nYmAY6xqWX5OYJYTGz3mOm/9bGt5LVBb+LbDUffVV3eDa+mgmZPxP8AgN7fMmiBJkf2u9JC9NJHQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvV1LHkGl6wAi41LGwrmyoSqQI733tk0XJxc7Zjdaf0=;
 b=ArY7vl/B38omXKVF714RSM4+HBqmU2qRpde1LM20iUfKLH28NTsd/TB3w9OCbKE9+5KKvwVJN1oN7pG5364hKx3gP2BuBZQUvgIU3YX2JMMq8CFa06Iw5XQB3WEVM06SNwZ/UUD+906YOcQlYpocSWImNgJVgij3pibotth9sBbA5uaFRn8om5ciy9hBX+mXyA7fB6PsMLDJ5TKIg+vI2M2GEzHJ88h0lSszqjXNQmNzdsbCyVhoE9iyFE5ayuaBJbDM1uXGhhWU2C6mW46wJyBmS04WcwFVADUCTLvVTYqlwYyhKuEoMosjCzS+A0eRgrBheeDlbkM28pwZYVTpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvV1LHkGl6wAi41LGwrmyoSqQI733tk0XJxc7Zjdaf0=;
 b=0kjwERGcvyNQdDbrXbO3hlFpqq/JK3D3CYuxUkq+IObVHO0yQNdwv3ZSNoP2cB1YSTosQ5bpOW5KEPUguqRa/ArP05m6WZk5sh+zfaBoerj6yijyIxXrafwoT+xyzuuJZak9pNYwOEmm3nvmFL9c44OsDHBptRrGmmj906HMEkYHOkmPUAbPOYvomjENGYodtSS20HwpfbxUna0RZBJPNMocBCOVjqsbzEHe+YetkNed0H7+vY8bC1RQ1YGws8k+UySHhnFtlZ5CCZS/qatCI//uLzqukHIBhSFUq4HeUGS1uq3YYaUE/7yXtjjPj0er1ZkRLLh3l06KNkU2cmfSng==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2570.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 08:23:54 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:23:54 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 0/1] jq-1.7.1: Backport
 multiple CVE fixes
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH v2 0/1] jq-1.7.1: Backport
 multiple CVE fixes
Thread-Index: AQHb796hAOTtX+O3JkyQmxu+sKgI8rROZjIAgBOjmwA=
Date: Thu, 14 Aug 2025 08:23:54 +0000
Message-ID: <3afe61e6aabd24bb9cbd5629966ba61740b95a23.camel@est.tech>
References: <20250708080158.50374-2-roland.kovacs@est.tech>
	 <CA+chaQeH+HDZzNiWThCJk+o4gnwL8-PzspJGr7ev9tjjaF2CLw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeH+HDZzNiWThCJk+o4gnwL8-PzspJGr7ev9tjjaF2CLw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|PAWP189MB2570:EE_
x-ms-office365-filtering-correlation-id: 68140251-edf2-41d8-6c2f-08dddb0be877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y0xBTmJYRExNNHVNU2RUajBxcU9XLzRqdEtMS0doZEFhZWpDbS9JOVJ3VjNE?=
 =?utf-8?B?dmFDR29NSll5MExTeWhQbVRmNWN5YnlXSjVmQWN1R2JRUUFVKzVhNmZxR1NW?=
 =?utf-8?B?NUN2VlFtZU9NRE8yYk1meU5oSGlBUEUrelpMSUd5YmhCMUtTazB5bmhUWXBN?=
 =?utf-8?B?V3l0S2U1VHhwRkhEUXVYS2xpaTc1Yk1GUWxPNXFobDFrK2ZlZmFFT1BXc3Rw?=
 =?utf-8?B?bW9MNUdrR29QOTJWLzJZS3o3djdvNXgyYUEvZDFxaURhL2VhL3Jla3U1Nzlq?=
 =?utf-8?B?djUrQ3hBcHRsS2NRSE5kVDEzWFVsRFVCelB0TmNIM0p0NGEwQ0xyNGZERmtQ?=
 =?utf-8?B?WXlHNll3empNekZhS29icDhJMndjV3o2REEwMTB1RjZObWRISU8zMm5TT1pJ?=
 =?utf-8?B?cjdYSG92RWVmY2xPLzBJTGN5dElLd1RTaEl5KzF3VTNzUnlnOG80S2pSTGpq?=
 =?utf-8?B?WGx6VmlMVnVOd3NKOHRwMDNONEpHN1ozQlJNNzFNejFwYzFMaURNelNDSE5l?=
 =?utf-8?B?MEdvREs0c2JhQllrRUEvTi91REQ4SkhMbnVFMHZVY0EzQlZ5SkVTVEpUMmdq?=
 =?utf-8?B?WWRFdUY2cFQwZDZrZzJ1RWFBV2xudDdCNXRuVVVEblBnZmYrcVk2V2xQL1BJ?=
 =?utf-8?B?bko5Mk9TWTREcHZlZHAyT2tnTjdSUVV5M2ZUMDE0NCtvTUdQUU95cVBuT3M0?=
 =?utf-8?B?enhJRzlsQ2Y4SjA5NlVJcFBaWjBTKzlUTHY4NnFweGltSVh2dXp0UGpKMm4r?=
 =?utf-8?B?WkQwTGpuekQ5UnB3YVRRTUJUZVV1VnhsRUNUOFozODErSU9obklTZjFCY3JG?=
 =?utf-8?B?L3FSKzRRMjZjZitpNXlrb0pvSjl0ZWxxalJVYzRDQ0dpZkxZbnBUN0hVa05k?=
 =?utf-8?B?czk1Nk9vRi9HUkhYQTZvUGtUeThxNGxjdlBEbUxGcmVWTW5PYjJFWEVaSUJY?=
 =?utf-8?B?ZlBERlVOS05Kdkk0VlNveGp0OVordzRVS0tVUCtsc0NwL3FWWFVHNUdOZjBZ?=
 =?utf-8?B?MnJzYVg5RDN4U0pPbUdDL1dySUxNWlVWOFpQUXBLdzFrUWFWS0RDN1ZjSkx0?=
 =?utf-8?B?VmVFVnYwNFg3cE9UanhjMUpIa3dqbjJKWGlWcFRGOHRTK00ySjFvSWU4d0pZ?=
 =?utf-8?B?YlYrRmtnb1o0aG5DcjllQ2NZSGxXdzRBcXVWa2RiYWNjdk9qUzM0Tk1GQXF0?=
 =?utf-8?B?ZURGOTVSRzlKakNUR2VhQVdjSnRwemNVTjRTeHYxUjduR2E3YVNVNCs5amZO?=
 =?utf-8?B?c2JnOWNtdWl1UkZKT3FEdkdDa3F0N1J1U29ubWNHUEl1RzEvaExzbEJsWGlr?=
 =?utf-8?B?eTJlVnFLaGpPb3RpOHR5V1JvRjNta205SUQrSFh5dHNSVHRkempuNWswaHN4?=
 =?utf-8?B?OGJEc3lCNWxMQjN6OEhjN2p5aGk0NXVmWjlHRXZWNmZVVTg2QWpYOWtrVkJB?=
 =?utf-8?B?b1FINFpodFpnOFhuMG9tRkFIRFlxaW4yR3M5NWZnTEttUnNDM25ieDlUVmkz?=
 =?utf-8?B?ZWJyR09kRHlhbHFwSzRhekFqRGxRMnUwNlFpZlZJQUxLR0NmazcwaXhNQUt1?=
 =?utf-8?B?OGZmemFhdFY5VzRUMk9pai85RGdJSnU4ZjArdmN0blRScVIrdkM2YWF1TGNp?=
 =?utf-8?B?TXdMNG1Xci9kZkNKWlF4d1dwVkdIM2l0b0ZoK3pGSHdpUXdxUUFhempTMGNC?=
 =?utf-8?B?T3VDcm9DTFhBbm80K20vaWNVcDlydTBvOGptVnpVRXJOVFhENWw2UVRBQ3d5?=
 =?utf-8?B?Y09ERVZ3a3NnR1lMKzlrOGFqdWhoWklSdUpGMUY2WHZXd0RvbVlLenBTNWxE?=
 =?utf-8?B?eW4wNFdMWVk5OEVlRDMxazEzcFMvS2RVYzVFQmNaRlBGV3BHSHNtSmU0a0RN?=
 =?utf-8?B?WEsvYVRzanEwM1ZRSHZCZ0dMWGdjUFRZbmxiQzZ0aDVqZEZveUloeGwxODN6?=
 =?utf-8?Q?3rmXdnz3+Sk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TGZwOU1QYTZJVXQ4Y1ZrRXp2dWdaUnlqamNlcC9DQUgzZzZRenpCQ0xLRGFr?=
 =?utf-8?B?YlFEeU81RGwyMUFHQ0ZhNk8yTHpSemhid2xFMm55MDlGSEFiOGZXSXRoQWJI?=
 =?utf-8?B?Um5RRkVza1VmWndqLzhiNzg2U0JuRlVZSFZLajhNTUFTUHJuZ1diSDFCT1Mx?=
 =?utf-8?B?SHlxVThjL1NVWndHZm5zMlVZTGdYTTFQWGlobDBacXlQKzdnR1h2ZGxON002?=
 =?utf-8?B?RWNESmgrK0tVVmZtMnZkYjJnTzA1Q3VhaXdadlRlcWcvNHgvTHhRVUxlSXhJ?=
 =?utf-8?B?eW0xOVZEWkZtWnl6Q0xZdjNrTnNlTFlPMThUMHlTQWd2UHBaL0pZTUpOVUdr?=
 =?utf-8?B?Mm0vd0Y4NHRWSGc5MHRpeDlEQ1hQOUZ6dUMvdHY0ZjZYbGljMXdtZkxRbisr?=
 =?utf-8?B?WXd0Rm9iVEI3M2NjcGU2L1ZqN2kzOXFZZzRxLzI4RU5pbC8yQ2tON0Rqd0dy?=
 =?utf-8?B?VUYyb25XaDRBd2hjaFdvck5GSGtEZkNYOC9XWk9UR2M3aVYzQUQzSm1OanpI?=
 =?utf-8?B?WEJCUnVwaUZHVVpCQkIwa0JsTEZVVDljcmJOdUdxRlBCNS9qVTZUbFhlTFYy?=
 =?utf-8?B?TnJtZUQ0MHhYaC9UNEhoamgyWXc1Yk5aalV0Q0FTZFJJczE0ajEzVkZJTUpV?=
 =?utf-8?B?TEtIRGs5M2VmZ3V0dHFZSjM5b3p1Nk03OThIYkNHZklVQXZvaW83SXZxL1BU?=
 =?utf-8?B?Mmc3Vy9jZzlhRDlqdG5YaHVmNTdKN3ljYXo4aWdrL252am5hYzdqdWl4bkY4?=
 =?utf-8?B?UWRZWi91a0tLRFA1Y25FV0QraE1tYzQ4NENaV3VCQnN2R1dDYjlia3FNS0Z2?=
 =?utf-8?B?UWxIbWtzTGY2V2VQQ0s0bFErb21DMVN0R0ljTURDbW93V2VURXFnc0h3dG5o?=
 =?utf-8?B?NkRTbTFPWURxeXhoN3h1QTJUNzcrUnpMcWZMUm5sT012d1pFM21ENUZWYUd0?=
 =?utf-8?B?M3VRSTBwNk9BdTV6VUVPdHZNRy9rb1cwOTlnbUNybHEyTHJvK3Boa0Nqdnc5?=
 =?utf-8?B?aUlCQWZpZDN2SDNhUFFBTjcxYnE4bHBtWnFHMldTanNXNW9UWVFDQWcwUk9G?=
 =?utf-8?B?bVZKL0g4VTNlUXU3ZExMNERla29vSCthdXp0ZmFJenh3bXFLYUVxcFBDZzZI?=
 =?utf-8?B?MWt6UGtvd0FISVZJWXFVV2phNnRNWURJSVJMZmJyRzZEOG9ZaEEzWENlMUJK?=
 =?utf-8?B?bWtnRGVMOUZNVzZCUVlmOU82Wkt5WUVpTE5zdnJscmNackhOS0drcngrRUJU?=
 =?utf-8?B?OGUvalFkZ3Q3OWJic2Y5eU9BVG1HVHlJYWdZSzJpMGcxdEdLOUwvRHFhNUpY?=
 =?utf-8?B?UXg3dWRQa25vNmNVZzUyRGE0UDhFSXFUb2VuaUVyWDB4V1hadXRtSUdMbWJW?=
 =?utf-8?B?a2ZLY3JyNFdEb01kTXNRNUJwcFhQRU45NG5JdTFXMVpJc2w3M1ZFanJxbS9u?=
 =?utf-8?B?MnRpeGdMem1HVCt3eWVhSDEvNm14eUpLY0hzNXpzTk5FQi95bUdCTUVQbzR2?=
 =?utf-8?B?M2dXUzVoRlBRZ0NqVHJZbGd3d0FuSVpCYytGSkdHUTZEL0U2OTZibzlhRzJk?=
 =?utf-8?B?ZnhFb1JCSkNraW50ZkdPeSsxOHFLbytsYmNtM3ROZUkzYXVqeXJKNjgyMXdn?=
 =?utf-8?B?L1RJeW42UmR4amJXZVU5YWwxSmU2TU0reEg4cEMzT1ZSK3FwOFIyOXRCNW1h?=
 =?utf-8?B?OW5jekNGc2Z0NnBRcGZ4dWlrQnZpbG9XMGZXWkZTSFJyL1Vtam95ZkVoTjB0?=
 =?utf-8?B?am1iaG10TExWVzVCaUFxMitrbHhOM25Bc05EUFRDNC85aURlUm83RVJlaVpF?=
 =?utf-8?B?ZmtvR0pIMWc3L3hHWUJkL3UyRVVXd2hCZmZ2dkJqaHRNUzNJdDZDTmxwWE1i?=
 =?utf-8?B?U09tbU1PSmJLQklzK0diTkk3aGtwM2FET3NNRC9FNVF3enJTTXo4Zlh2NVlu?=
 =?utf-8?B?ajRSYWFlRG9WRDZ5SFBveDBUV0U1QzI3bDFDRWRWdWZpREtQVVdJQzRyRmta?=
 =?utf-8?B?QWxoZzA5MmlMYkZ0am9rZjdMb0RUU0daaHZSUlEwK2t0dnUyZTFROS9FQkQ4?=
 =?utf-8?B?V0JkZDFtdXpWN05lZ3U0K3lOUDdSZTdNdG9oR0JwWTNWd1l3OUZ1TGIwandT?=
 =?utf-8?B?UXhKZkhRU1cxbkowTVlPc3EyMkxHbFQycllvK2FaSlRBZ2QzZWdPL0xwQTlX?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D835A607ACB4540A60660AE7407E227@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68140251-edf2-41d8-6c2f-08dddb0be877
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 08:23:54.7435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5JLdljG9IeHjHZEctHybf4c9JRh50mAqgQArHKXJFWPUMpJifO0e75VFfn2kzb4X7ipwx3kTvGYnB37fisn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2570
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 08:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118933

T24gRnJpLCAyMDI1LTA4LTAxIGF0IDIyOjI5ICswMjAwLCBNYXJ0aW4gSmFuc2EgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IExvb2tzIGxpa2UgdjEgd2l0aG91dCBVcHN0cmVh
bS1TdGF0dXMgd2FzIG1lcmdlZCB0byBzY2FydGhnYXAsIGNhbiB5b3UNCj4gcGxlYXNlIHJlYmFz
ZSB0aGlzIHYyIGFuZCBzZW5kIGZvbGxvdy11cCBwYXRjaCBhZGRpbmcgdGhlDQo+IFVwc3RyZWFt
LVN0YXR1cz8NCj4gDQo+IE9uIFR1ZSwgSnVsIDgsIDIwMjUgYXQgMTA6MDLigK9BTSByb2xhbmQu
a292YWNzIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb2xhbmQua292YWNzPWVzdC50
ZWNoQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IEZyb206IFJv
bGFuZCBLb3ZhY3MgPHJvbGFuZC5rb3ZhY3NAZXN0LnRlY2g+DQo+ID4gDQo+ID4gSSBmb3Jnb3Qg
dG8gcnVuIHBhdGNodGVzdCBiZWZvcmUgc2VuZGluZyB2MSwgc28gdGhpcyB2ZXJzaW9uIGluY2x1
ZGVzIHRoZSBtaXNzaW5nDQo+ID4gJ1Vwc3RyZWFtLVN0YXR1cycgYW5kICdDVkUnIGZpZWxkcyBp
biB0aGUgYWRkZWQgcGF0Y2ggZmlsZXMuDQo+ID4gDQo+ID4gUm9sYW5kIEtvdmFjcyAoMSk6DQo+
ID4gwqAganEtMS43LjE6IEJhY2twb3J0IG11bHRpcGxlIENWRSBmaXhlcw0KPiA+IA0KPiA+IMKg
Li4uL2pxL2pxL0NWRS0yMDI0LTIzMzM3LnBhdGNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMjM2ICsrKysrKysrKysrKysrKysrKw0KPiA+IMKgLi4uL2pxL2pxL0NWRS0yMDI0LTUz
NDI3LnBhdGNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4MiArKysrKysNCj4g
PiDCoC4uLi9qcS9qcS9DVkUtMjAyNS00ODA2MC5wYXRjaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNDggKysrKw0KPiA+IMKgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2pxL2px
XzEuNy4xLmJiwqDCoMKgwqDCoMKgIHzCoMKgIDMgKw0KPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAz
NjkgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9qcS9qcS9DVkUtMjAyNC0yMzMzNy5wYXRjaA0KPiA+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9qcS9qcS9DVkUtMjAyNC01MzQyNy5wYXRj
aA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9qcS9q
cS9DVkUtMjAyNS00ODA2MC5wYXRjaA0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE4ODIzKTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE4
ODIzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
LzExNDA0Mjk2MS85ODk3MDc0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbcm9sYW5kLmtvdmFj
c0Blc3QudGVjaF0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCkhpIE1hcnRpbiwNCg0KSSBz
ZWUgeW91IGFscmVhZHkgc2VudCB0aGUgZml4IG91dC4gVGhhbmtzIGZvciBzcG90dGluZyB0aGlz
IGFuZCBzb3JyeSBmb3Igbm90IHBpY2tpbmcgaXQgdXAgaW4NCnRpbWUuDQoNCkNoZWVycywNCglS
b2xhbmQNCg==

