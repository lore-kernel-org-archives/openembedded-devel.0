Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA9FC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 14:19:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.21832.1713277149538929254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 07:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ajEqWnYn;
 spf=pass (domain: siemens.com, ip: 40.107.20.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frn/XCBo8SBdgHWJoEBehsiHlEUQ8wP0PdV72OmPxzZjBeincxoK55MnfBPd33ieZiyN45wooGkXkTgm4gUxrVcKMxBMvw4xf375qUGO6p8PxZSZzISHzN9GBQqtr2UrnHlQFEw8yqa04EM1p3rxHabMgUY+R9hlwU74GEM3CE7oM/RMk4WB2AZjSxRB80itv7jGZeNg8RHpnbDHfG4PUhYPgU+iprwFHHB7l/egPwT/e0vAPL6eHfNLpHiLY4BjqpvdqvG+ATzWEEjKBDJckOg5OCmy+ho6GwBvX89YeWE4m903mKgek0eZbbW7Ne/Fstl+4ZnJSvH+vLVBy9Rvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8503IlXhqF8uWkEZY6lnSWRCyZR0oXrukVmct+hx+w=;
 b=ZEze+qeBPkly6SdUheUo4kTdY57+mM1ydqUGQkRcBwVP8TVXSVk3navHg/xolIJYsv7Ajdo6crqFwWNxy/txHDMFa9Fbc0GXTKGnj5yP2kUAtfCKVvqHJ2WPA7Pzjgi6VFRKtc9VbIZctlEP/4pSti8CBy5XX3CTmo+zGTDvFCsIGq37Vih6bN2ImLVyesGITnjp2Gjl/0neo7AEwJKzohaQUfGA/aLWM+pZRYwl9UWXs2kEGzusScqRzFfEzEnLALXys4t6sFQUKzA2O9WsEj8SVS843B6KlFdgkh16CFIs81R7Rq/CzEQHYkTAuO3LrYbFDK//JfvZCiMFzxdQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8503IlXhqF8uWkEZY6lnSWRCyZR0oXrukVmct+hx+w=;
 b=ajEqWnYnzSlZCWrLRPTRTqg2qFmxlDrRkGTaqdmMFYQlVJS2FtZiJiD9AnSvflTOaiYrSdVsSGFjS0tUqNdAMBUJeYAF/iiqQf2y758x8lvLNw9/zP1U7OtW93kczHzms8Xf3zPH/RaCsodwvzVL0UyYieo69Z7FtJ7svWfP5qFQ5ZFEoOB4JemXeXxhFyFnbuO1fAhKLKau1U07mPybMeMSA+6HCc5+RuKRdHWXCb+d07r62aVltRMCmoVPP2mxvppTDVsiLSoT+i06SWRoRRLg4Un6LpjOQbl0kDwIyCLETxdbTKk1vC0qm5g3ArcAHEfB5mNvbArHNDMqrL+bLg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 14:19:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 14:19:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "marex@denx.de" <marex@denx.de>, Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
Thread-Topic: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
Thread-Index: AQHajzbz9POY4vOqskeoUSB0ipCATLFpm8GAgAFRLgCAAAUcMA==
Date: Tue, 16 Apr 2024 14:19:04 +0000
Message-ID: 
 <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240415131443.7295-1-marex@denx.de>
 <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de>
In-Reply-To: <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=20e161d5-7b7d-4acc-9cb5-fbf035ce4ad3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-16T14:13:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7897:EE_
x-ms-office365-filtering-correlation-id: 2a8517ff-8689-4a92-ea43-08dc5e202bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q0kDT5f+emjmviA4abyKqfWBFhwiZ09iKYderJzBFVQ2Z/9c/YrJfe07aT2L/NDQDKqpMuSaSPRSlKJbr5U7P4Q2wJuqaMEHTTVPM0DS21WMC+eaL8yUgZsD/FiGNGIjh9EJIYrpC36QAikg+nV8hKG5zdhRVDf6C4ZCcVPVyBM9PwJkEcfskyOozugcQKhACXHLHY5xvzKSFLzxwFj7JJFm1ETZF7uDg0w+HpDiAjP+p/YKiBUmLKdvDHBlY6E6oMijfK4917GLqM+9JmTdQ618SMFNlFUt7Hpn45FjhAGZ5tl1K5K461xXc9tq+eTHWXLLnIxiCKUT9EWh5l2WmgXCRn/H7B8CBPWRNBM/Jn22PT2VF7l1NuNO4+QkmlpewKNpkpdz/NoHhJjHCYQw5w4yKd3q5UJXE4+JHQeXx2lTKRtHFbPS2Jh8iwtNLwuVyrx17phGhWpHnzInzqgqnkxu1UMCzygUlPgWILXAviFINxzjHhtrjtXV1RD0/m4BFcou9z3ikptZyYbnjh7wZTHFqG5kvDUmfZerxzAp7+pHNhcBIRi1Q9pcjMNmW73T4kERLB3XS1fvJtDbChHGGJhgxVtDccuqBY0dBxBNPUhnO3jegZM0D71y89qofYDu7fBTq/AE1MUaPwiQzQuR1rdSikzgvCOzr3Bk6nwHVU/boBnLuXG/s0qIBcdBNu44w4QgaEFcP2Eb5op2FiO/2Bl1RDPGZKnFe4lElwapvKs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZlU5K1RBR1htckZOTVI3aXFSOVloT3pnZWZFaGhuMzlsdFBtQ1c3TTZJYWFt?=
 =?utf-8?B?MlAxM3VJZkZxaDRHSnNwblNuVHlBUXN6VHo4YXdrbjNoejBadWtQc3IrZHNx?=
 =?utf-8?B?R2V6d0hCZjVCUm9JNG9XbnRMZE5kaFhEZ1Q0dStaRkw4ZWI1WEZ5SXdMQjhR?=
 =?utf-8?B?blFhZmhQSjdTUHB3U0Jxb1hoVmdnN0dCRHl6TFU4THM5bkxZUGI3NmY2MWN5?=
 =?utf-8?B?UFBGYTBsdThrbUhGWTFrek1Hdy9JZ0ljTyttRFRYYW9zMkwzTTJhK005T3Q0?=
 =?utf-8?B?TVd5MjVzNzRxMVFzOHZ1TDg3T2lSaWVTYVU2U1ZLUkh5dURvRFFrZzQxcTBm?=
 =?utf-8?B?ZVp6NVYyd29ZaEZqeU02L0R3S1QzOXFncm42WnRJM3VPdDh0L3pucmpqdGpi?=
 =?utf-8?B?OGVQVUpDczdCbmhWS0dxMjh2RForQVdsME40YWNJNmU2WkFYZlhvaXVtcWFY?=
 =?utf-8?B?MzVKOHNrbVh4S2ovZzNOaVFDNC9CTkN5czdrOFRaMCsxaHdmeW9ESnlZL0c0?=
 =?utf-8?B?SS8yOEtmV2RFV081Q29QZ2ljdmdBMkwrRlhWQllsQ0RvMTN2djZtdWFzQ1RT?=
 =?utf-8?B?d2FWVWxkOWJkSzJZalZUaURabXA0ZDdEVERoRS9HZ0xvNVgveVhISTBzZFM1?=
 =?utf-8?B?V1A1czBHc1F6UlRzYU5hOTVPbklZUURDb1BSMGE2N1ZTRHRQTG1GMWljdUpo?=
 =?utf-8?B?SGxQdUQ1WHhvWUlmY1M4K0JoQlpIUDliM0VEeWJIQlhHY0dhbE0wdUVGeGx3?=
 =?utf-8?B?cTN5bUNlTlYxVVgzTkl3c0hNOWwvVnd0WkU1Y0NVV1loRkoyWHdYcG5yYjJC?=
 =?utf-8?B?bnhqV0d3MUlQUWRNTld2RW0vb0ZIMXNGYnB4eWd3VDNCWG8vQWZTYk04VFUx?=
 =?utf-8?B?eWJvSExUemtTVDRGZ000eUxTSG9mRVV1b2NqNHdMZzRua1U4VUtiNlFJeTFT?=
 =?utf-8?B?aVRVL3ZIcTJiQ2RPMWl4SXhxT2hxeDZFM0tzcW56TW9jMHVVUUV2VGpKQnNH?=
 =?utf-8?B?a0ZRa1p3VnJtblp5ZW90bTNka0VwYVA5Q2Q1aGJjd25KeEFGU1JrOEZHL2Ux?=
 =?utf-8?B?NTBiM3hubXFnaWh3RWZaTXJEMDlGOEs4Y3RIaUpLelBESWVIQWwzOXlSVEk4?=
 =?utf-8?B?V0xpaCs1MHNFUkZVK285bk5JMDNNMjdZa2IyTDVnVGg3d2tMLzJUN0Q4R3V5?=
 =?utf-8?B?ajRFeUF1OWRXUEV0UmF1SkwwWVFObFNNQ2hKaTJBQVo0SHo0SXQxVmVhcWwy?=
 =?utf-8?B?eUVqUi9hVU50WFhCNnlLQVh2Uk5wQ25CWkd4Mzg0cUdLZmpkVWk0dVQ5VDRj?=
 =?utf-8?B?bDNYb25tUDVWRFJocUx5NGtoNHpxaTh5OHBpVDBHY2dBTVNWcUFIb3RrVCtl?=
 =?utf-8?B?eDlIWDlhWUtXeGhqNFA1ZFNCcUlwS1JOUmExdFhzMExBN2RYN3RQTFNWTHYz?=
 =?utf-8?B?bFpxVllieVdFUzVDS29iZUdVSi9tWm9kbEtCZnpnS0tKb2FRS2pzNm1YcXhl?=
 =?utf-8?B?VHdRYk1tempzTHZsOGlyNDlBVjRMVWgyQS9jNHhCeEpkNndidWpBS1dIbng4?=
 =?utf-8?B?STYvNEZPM1o3NGhOamlONXRSRDRmL0JmSE9ZMFpKV2hneG1YMWQvUlZVV1BT?=
 =?utf-8?B?VGhMYndOQjBMbEZxcmcrN3gvRzhYd3BWSGtrdG0vRDRaelJwV24xWnlxVllm?=
 =?utf-8?B?enVONi9sQ1d1VmpyekdyeUlSeWhWcUJadlVXTjZxUTNLTHNaUlAvZGNvSkpX?=
 =?utf-8?B?MVVLdVhJTE56TWdCU2V4c1psM1Azamt2ZzZaaGRsNzlZazY0NnJCYnYyZnJ6?=
 =?utf-8?B?V241SDZKdTdZR0djb2VKUllKemZ6REMvRmZxV21yQm9SZURQVFFETDAxYzF3?=
 =?utf-8?B?TUJqYzdkem5LUzc1RGplOGpzM0NCVVMzRm9RaFN4M2VBWjBkOG41VUtKbGFE?=
 =?utf-8?B?V1RuMmpjVEtKSVR3TEgzSFdpRTl0VmNnVHFrazdJVlgxb3J0VGVFVUhUdklt?=
 =?utf-8?B?Z0NZRVVOZFZkSEg0R012c0lNaGxKeWYrN1NPd1QwWkM4V01zbUJFRUxCZmF4?=
 =?utf-8?B?SEk1U3FHMW1IMlo1T3FtWUtHckprTXpsU3FGRURjM1B6SVJPY2RhSmhhcUJr?=
 =?utf-8?Q?aWu0CI6c1jtXncl0VRjRvqInV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8517ff-8689-4a92-ea43-08dc5e202bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 14:19:04.6625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rSNxJ5kLkHGXtq1bxKJEUnODYpJX2obBqMN2ZIdqCdqH9HiCUqgpbHXsUR88njNT7tEhzVANcQ6sKNcoz3QqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7897
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 14:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109980

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIE1hcmVrIFZhc3V0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTZW50OiBUdWVzZGF5LCBBcHJpbCAxNiwgMjAyNCAxNTo1NQ0KVG86IE1hcnRpbiBKYW5zYSA8
bWFydGluLmphbnNhQGdtYWlsLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEtcHl0aG9uMl1bUEFUQ0hdIGxh
eWVyLmNvbmY6IHVwZGF0ZSBMQVlFUlNFUklFU19DT01QQVQgZm9yIHNjYXJ0aGdhcA0KDQo+IE9u
IDQvMTUvMjQgNzo0OCBQTSwgTWFydGluIEphbnNhIHdyb3RlOg0KPiA+IElmIHlvdSBuZWVkIGl0
IGp1c3QgZm9yIHNvbWUgZXhwZXJpbWVudHMgdGhhbiBmZWVsIGZyZWUgdG8gdXNlOg0KPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9zaHItcHJvamVjdC9tZXRhLXB5dGhvbjIvY29tbWl0cy9qYW5zYS9t
YXN0ZXIvDQo+ID4gd2hpY2ggSSd2ZSBhbHJlYWR5IHVwZGF0ZWQgKGZvciBidWlsdCB0aW1lIGJl
bmNobWFyayB3aGljaCANCj4gPiBoaXN0b3JpY2FsbHkgaW5jbHVkZWQgcXR3ZWJlbmdpbmUgYXMg
d2VsbCANCj4gPiBodHRwczovL2dpdGh1Yi5jb20vc2hyLXByb2plY3QvdGVzdC1vZS1idWlsZC10
aW1lKS4NCj4gPiANCj4gPiBCdXQgZm9yIGFueXRoaW5nIG1vcmUgc2VyaW91cyB3b3JrIHdpdGgg
eW91ciBjdXN0b21lciB0byBzd2l0Y2ggdG8gDQo+ID4gc29tZXRoaW5nIG1vcmUgc3VwcG9ydGVk
LCB0aGVyZSBhcmUgc3RpbGwgbWlub3IgdXBncmFkZXMgdG8gbWV0YS1xdDUgDQo+ID4gKGxhc3Qg
aW4gaHR0cHM6Ly9naXRodWIuY29tL21ldGEtcXQ1L21ldGEtcXQ1L3B1bGwvNTU2KSwgYnV0IGl0
J3MgYSANCj4gPiBkZWFkIGVuZCBhbmQgc3dpdGNoIHRvIHNvbWV0aGluZyBlbHNlIHNob3VsZCBo
YXZlIGhpZ2hlciBwcmlvcml0eSB0aGFuIA0KPiA+IHN3aXRjaCB0byBzY2FydGhnYXAgKGUuZy4g
c3dpdGNoaW5nIHRvIG1ldGEtcXQ2KS4NCj4NCj4gSSBhbSBhd2FyZSBvZiBxdDUgYmVpbmcgYSBk
ZWFkIGVuZCwgYnV0IEkgYWxzbyB0aGluayBpZiBtYWtpbmcgdGhpcyBzdHVmZiBidWlsZCB3aXRo
IHNjYXJ0aGdhcCBpcyBhIG9uZS1saW5lciBjaGFuZ2UsIEkgZG9uJ3QgcmVhbGx5IHNlZSB3aHkg
bm90IGVuYWJsZSBwZW9wbGUgdG8gYnVpbGQgaXQuDQo+DQo+IFRoZSBzZWN1cml0eSBpbXBsaWNh
dGlvbnMgaGF2ZSB0byBiZSBjb25zaWRlcmVkIGJ5IHRoZSB1c2Vycy4gTWF5YmUgdGhpcyBzaG91
bGQgYWxzbyBiZSBzcGVsbGVkIG91dCBpbiB0aGUgUkVBRE1FLCBmb3IgYm90aCB0aGUgbWV0YS1w
eXRob24yIGFuZCBtZXRhLXF0NS4gSSBjYW4gc2VuZCBzdWNoIGEgcGF0Y2ggPw0KDQpGb2xsb3dp
bmcgd29ya3MgZm9yIHlvY3RvIGtpcmtzdG9uZSArIG1ldGEtbHRzLW1peGluIGtpcmtzdG9uZS9n
byArIG1ldGEtbHRzLW1peGluIGtpcmtzdG9uZS9ydXN0ICsgbWV0YS12aXJ0dWFsaXphdGlvbiBt
YXN0ZXINCkxBWUVSU0VSSUVTX0NPTVBBVF92aXJ0dWFsaXphdGlvbi1sYXllciArPSAia2lya3N0
b25lIg0KDQptZXRhLXF0NSBzaG91bGQgYmUgYWJsZSB0byBkbyBzb21ldGhpbmcgc2ltaWxhciB3
aXRoIG1ldGEtcHl0aG9uMiBpZiBtZXRhLXB5dGhvbjIgaXMgZnJvemVuLi4uDQo=

