Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3F2F41808
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:12:46 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14155.1773205965159102290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=UllODcsp;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.58, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9yVm5gVZiyHYlPs9XZqpWTAFQaZ9+oDWKeYGDo+mSnIhQ76DgwS/jNFXYH2bbpB3ndV8+5/TddbOLZujGxD6SYCEIy1CYd9pdJUGTRasBKSS4uQNA5lqw0UR3lqkRJV2pa0qtXmi4Ya0eMfOcHCLougt2q+v2pT9NE6HFl19AkXKGBITOVB2Flm2BNnBB3NhuZvwXVlq0OHemlPBBv9vsaAKK2NEwdLDuh+Pkal8RJluW8KUsIf4wTja2P1wKGD8ubBEcaE/DSv4sAV+2jtT+XSOpmys0X5fJgttbxJVeXSeyQP19wAgk9J8k0QzMjrdtbz5o4cJiYKt5HmQA0s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEp0boWHz7H0U84DqzOhZGUNVPcSat9O4/OvYuoIhvw=;
 b=f7J7wBu8rhblXKROIRT1KufPS5IDSzWefUBX+hf0oD7mRCOiYZYeleEa3WA8VRI6pl1hrsQ+2qf9ZtUs6i3kfsIEQAz1OCdQIu/6oGokDyr0dP4r9ddbAnwrGUgzRoZTB4qOU0QMSGLYicGFw9f2QvM2lHkNlKNIFi+rn2puh+D2h22Cegb7dQTcKYGfTE5U2II2ClRMKWrk0AxnSvqe+uq6As54mCxxIZks8BFRP001jVKVWQpaRFoEnADqWrr0RD+HEnnG8s/gAVN3ZzVxAumXfeJZAgEk59RrKluSWhB9yCwXvymPqYoXCnYPXhsC9fhB8XOd3VRj2PozvuPKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEp0boWHz7H0U84DqzOhZGUNVPcSat9O4/OvYuoIhvw=;
 b=UllODcspV3oZN77O2QykIZPju8TeEZKHfTN9RQwfSGSLJ9QL9sluUvbfW9OKZMCwtEUS8B7kC2yDg1fB25x5Cp2oFIlJ/YeZvggeOumMoeHJnf9wz5p0VLcngmGkKuPBiFyZaJ0R3TlWYF+O2/YQYuB5xbvpbNZp+7fz+sc8NvCaWdGjeeijDOeDexWvl51yjc13ehZ7rCoA7kfvkUFs2fGy+/UYhHl5czxUdiV3AT84M3OAslSvgS+vjpU78igEC5+a/5UW7DR/0dKfuVERQaoqyIsa6fphyNmVoO0yBl5twIHKSFj9y72jdWJ22jSImEDvhpQ5eKJV+6JkHve0Qg==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OS3PR01MB8019.jpnprd01.prod.outlook.com (2603:1096:604:1bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 05:12:37 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 05:12:37 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] atop: upgrade 2.12.0 -> 2.12.1
Thread-Topic: [oe][meta-oe][PATCH] atop: upgrade 2.12.0 -> 2.12.1
Thread-Index: AQHcpvWLN9oQugCioEalvEnJXoZeBbWo3WZG
Date: Wed, 11 Mar 2026 05:12:37 +0000
Message-ID: 
 <OS7PR01MB1444471175386EFA651C2E4979B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <1897BCDD621DFE0A.1454197@lists.openembedded.org>
In-Reply-To: <1897BCDD621DFE0A.1454197@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-11T05:12:37.039Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OS3PR01MB8019:EE_
x-ms-office365-filtering-correlation-id: 0be0dc3a-6ca1-41b2-b9ae-08de7f2ccfe7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|13003099007|8096899003|38070700021|7053199007|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 gHXYZ2cUGlmBHO/+KhnHEhgHkiVvR6ezwjGEzBcuPQskKO7RoK6X8IGOiCKzvOjkn7KmafyUOpW8ErhYaq6osYrLuwmjWgBzMKKFFx7nWQ0n0CR919X03LW0Fr1P3XerFQnf3RedKGtAAAKZ0WmlxCvWb0b0gJMJ+h+8VlxJfRlmK4Q2Ux7FQoGf7A07poklteljzpSNhjCx45EnbmH5c3j+30nOeZqx0Rc/Czx+Fx2yv/5djAjbKSvetvX0FuI12MWdkGWry8rwMCB//0UwSJAyO//8lzuz/0Sg4B31MfXsCWydz82q/yZOL7Lq/qlUQSz4v/9OOnJ4GmvQduViKsbJs/+JNeT8JpS0q5Bu7T7eaO1wxIbUI8AQOf8nEKOtIXn1d5jJzI36ekbikxtz9LcqdQBwp7aEpOgbfayq6ZRgtlLCjDRflCISnYDSLVaQBxFCoRnpF/oK6O3rnJSKktIt50WBMAiRqX+Fu8OfTlQhSAugaXcdNe/AvTPZDk0XzKr1k1CrYJaCTUV7JIDrTaj9Ks7cEiflOC1JjEj8ByjP39eSbxFaMm5OJdEzwU8bjQfAYzml6IDZ8NDVsxckFMwh/mXQH3cLSZh7DO/Ryb+/34OamIe96On/nrk0T5zH/xtKsk0J/JCms4r+Ndv8kNKQRPhbOh81eE9JcPSqgAnQ4XC6VjeIEzJV21yacsCLqpB7VvzQQuC3awLPqkdZI6ejijb/t0W/CYgVaMLa+kcviIP8ourkTFxdMOmFJ5gpQO5UGiKp31g3fXQfQS6wEg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(13003099007)(8096899003)(38070700021)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?c1p2WWZ3RXQrMnZTMlhFK1dzcDAzcHNrQ1p0cjN6WEtPdkxKaWNtTWxhNkxj?=
 =?gb2312?B?aS93d3o2c2JrR3BxSkkzQmZWVFRsbE9hcE1DZ2pZazZEN0VFRVpVS0pXcUJq?=
 =?gb2312?B?SmxGZndXWFV6WlNIM1hiWmZYMkZveGhvWmkrVE53cG51THk0cG9HR05OUUhG?=
 =?gb2312?B?YWF3Zi9iaERJRmZkb3phRzZWKzdsQUFtUloxYzNXbVJMcklCbVp6OUlHejgx?=
 =?gb2312?B?dkY0ZGNLSlZ6bUFpYkl0dEsrYnVPa0lINFVyeGkyNzhyY21xbmlmVFF5YWty?=
 =?gb2312?B?bG14WUkyZVM4dklpNDV6LzBwMlBSQkZNbWc0SGhGSzQxZTlBbnN3ZnRGMDc5?=
 =?gb2312?B?MlhhT0pWZWVIWG5IeHFEdFZZcTJaYXB4QVB6RXJUR2FMcGcxa2NCb3BpS3I3?=
 =?gb2312?B?U3FhSVY2cDBRKzc5TTlBZVB5d3loQ1dxZFQ1VjNzMXdLa3UrRUZkODhWT2Vx?=
 =?gb2312?B?QTR1UzNQM0lSYm9NNEhjNHBOeHAwbTBuOUU4YWtIODdzaFV2VjBuVjRKMUdG?=
 =?gb2312?B?aHNCSTZNZHRYZ0JISEdIZkUxSlljVllnekpRa0J5ME9VenZlNk9IZWZPU001?=
 =?gb2312?B?MDduYnV6M3JXRWg1UlMwK0RTRjRjOXVPcGI3ZVhxMC9OeGY4cEhNblJCUWU5?=
 =?gb2312?B?OFgvYUVWcEpSVSt0RWUrQ2MzWmlUTlZDWThpN0NhQXRLV2huUW9ZUzFFRm1V?=
 =?gb2312?B?QVNRSkl0Qlp3aDIvOXNmbFFpaFdpK1pxa2V1dU5lYlE3YWpEYi80N0JPY2RM?=
 =?gb2312?B?MUFyOTdYZ3ZpZkQ3ZzltRjN3b0hqakdLWGtUNVZ5YXRQWVdxRWs2Z3RnWnp4?=
 =?gb2312?B?RnFBTDFSbkFEcjFQZFJEdll3Rit0eEwvam5SVktKUVNiMVVoZFlMVTlTUGxR?=
 =?gb2312?B?a1FDeHRpQ2NOaFdEeERFZ0M5SjNNTmpPVFhCaXFrODFUdTRZTlk5bXR0Vmhv?=
 =?gb2312?B?dG9HSG5xS056QUFNWGtGRng0cUNZc2ttNjB2bmZETE42TUhKTlJzZEE2ZnZ2?=
 =?gb2312?B?ZGxMbVJrRzRKQTRuaUpienUyY0tRTzFsekRhMWtyWXg3V1FpaFhNQ0E5RlBS?=
 =?gb2312?B?cmNaUFllQnptQ0diVko0UlJ5L3pxMjhPTHpQY3ROcHQ2Z2ZGTVh2bER6dXoz?=
 =?gb2312?B?SVozWFpGU0kzZTRiN2JySFdBUU5GVTB2TTY0ZGp6RUFZQjdLbjFJQkVDaU1I?=
 =?gb2312?B?R3NhbHF0VFgyZS9sRUNUOVNkUkpra294TWFTZFh1ZFFReTdIdkJVQ1VPQlgx?=
 =?gb2312?B?emFyT2l6OWlCUDR2dUJkdzVIV1VSRUxTZTBaUEVkcjVtNlZ1Z0ZvWVdUSWtE?=
 =?gb2312?B?QjZIZjFlSllyUGE0VHpTUXE0MFQyTU40Z2FJRkphV1JJZ0w2Qi9lZ000UHF4?=
 =?gb2312?B?dWNqTC9SQmpzR0haSEhtSTBqYU9pL2JaNGtpamhSMURKdHU4eG1sY1dFdkNu?=
 =?gb2312?B?bDFWeCtqdWwxeVF6TXN1QTZJd2NnRmh3MzVnQXg1NmYyWVVFa0Y3NkZ0OXY5?=
 =?gb2312?B?ZU5rUTRFODZmUXhmMDJ1ZFJ4THRpM0tMSlRMbFpmZzBWWE9LUUdCM3VJcDd6?=
 =?gb2312?B?VjEzRDJjclFvZWt4MDhQOU1JbENIRFplUUZDWk0valkraXhkL29paG4raDdE?=
 =?gb2312?B?dGdaN2R3anZ3QmFzQkx2QklLZjVnV3JVRHNqYmprL3gyL0tEK2UzaFB3dHM3?=
 =?gb2312?B?dFovbXVqQ1dmNGllSmxJa3dTZjRMYzNNZHM3eDdEQzlFZjFKeERRTEhodWd1?=
 =?gb2312?B?V093UUYyTXNPc1puQnpubWplcVVuQ0ovdHpYZmJjbkhLUmN3U1pRamdUdFFT?=
 =?gb2312?B?NjV6UWFsRVpwMDA3dFYwa21KeGdJN1hmeWd1RDBaR2dBV0NhNXFtZXRvc2lD?=
 =?gb2312?B?WUZ6Wk80QVhFd1lhNVdvazNyVXd3ZXc1ZHR1ZGtKbEtDcVZXdVNqN3Bpc3Vm?=
 =?gb2312?B?WWZsSnlKWlJvbEV6aENhbDBlcUEwVmcwZElQL0FPNTg1R3RHYURpamRTRXRp?=
 =?gb2312?B?OS8rQ3dZQXVKOFVKbURMM25ma3lVb05Ydzd6dyt6ejhMZ1Y0S0VseXJMT0Ry?=
 =?gb2312?B?UHVHQUw1dklsWVFrbUo3cXp0RFhwZDJZeURoT0NJZ05ocU5GSG1VeGxoVW4z?=
 =?gb2312?B?YTBXL3hlVjdEd2VTQmx2S0NxQmZpVlplTVEzMURoekEvU05DMmUwMVZrVjla?=
 =?gb2312?B?d0ZBaDBPUFBvNG9MTEVCNkY4OVhudFZIZXFGTkRVcHZLUnFTcW9CMVV0WjQ4?=
 =?gb2312?B?RXd3TUZpVGZpK0hjS2dpM0w3dXlOQm1ERXBQTWM3YnRXaUhrNUNmRmRNR2t1?=
 =?gb2312?B?OFB1cmVpWFNqLzhFY254VHVsOW5JVy9mdVU3WFl2WmpTZmlzWURNdz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB1444471175386EFA651C2E4979B47AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	TsS3S7oLi9lCR4CBG8KVdtsHli0c8PReq0KDyXFo8m9q22VAr9of6OcS/Tp+XzUqxQ1yEmHrKprw/Ez9tDnCzDlRFwYQd4qGURy7D4Xwkh6RxlEbLkUS6sc1jLV7bgan3ieJwY5A0rvERyTZ2QY6/rnSX89pOeRq6r65h1ro95TySoONi9Odz4Khskyb+5kz7hWoSWqi6b0yqRPvd/nUt8lLsLN44WU2QlE2kHaJN+GmtJwhp0QXT/cDa7mhzn3DRL3osA5ZFYmUS6ap4CD07MKv5JAsRNb7cJ5E078noWAG5SWpubohcEq1snxoX7XhccWhOZymo+gDC/DLUd5RUw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be0dc3a-6ca1-41b2-b9ae-08de7f2ccfe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 05:12:37.6036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FClCQ70GQPjLzQz9TLkXcFsuRTqiv1LgaAa99Q7CvYhKYPi32asHP2Vj8589VJkh12UmwSLYPh5DfV+g1Y6KdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125059

--_000_OS7PR01MB1444471175386EFA651C2E4979B47AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHtIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQq3osvNyrG85DogMjAyNsTqMtTCMjbI1SAxNTo1Nw0KytW8/sjLOiBvcGVuZW1iZWRk
ZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBbb2VdW21ldGEtb2VdW1BBVENIXSBhdG9wOiB1cGdy
YWRlIDIuMTIuMCAtPiAyLjEyLjENCg0KVmVyc2lvbiAyLjEyLjENCiAgQnVnIHNvbHV0aW9uOiB0
ZXN0cyBkdXJpbmcgYXBwZW5kIG9mIGV4aXN0aW5nIHJhdyBsb2cgYXJlIGxlc3Mgc3RyaWN0IG5v
dy4NCg0KU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4N
Ci0tLQ0KIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2F0b3Ave2F0b3BfMi4xMi4wLmJiID0+IGF0
b3BfMi4xMi4xLmJifSB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYXRvcC97YXRvcF8y
LjEyLjAuYmIgPT4gYXRvcF8yLjEyLjEuYmJ9ICg5NiUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9hdG9wL2F0b3BfMi4xMi4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvYXRvcC9hdG9wXzIuMTIuMS5iYg0Kc2ltaWxhcml0eSBpbmRleCA5NiUNCnJlbmFtZSBm
cm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2F0b3AvYXRvcF8yLjEyLjAuYmINCnJlbmFtZSB0
byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9hdG9wL2F0b3BfMi4xMi4xLmJiDQppbmRleCAzNDg0
OTMyNDViLi40Y2E3NGVkYmFmIDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
YXRvcC9hdG9wXzIuMTIuMC5iYg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYXRvcC9h
dG9wXzIuMTIuMS5iYg0KQEAgLTIyLDcgKzIyLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmF0
b3B0b29sLm5sL2Rvd25sb2FkLyR7QlB9LnRhci5neiBcDQogICAgICAgICAgICBmaWxlOi8vZml4
LXBlcm1pc3Npb25zLnBhdGNoIFwNCiAgICAgICAgICAgIGZpbGU6Ly9zeXN2aW5pdC1pbXBsZW1l
bnQtc3RhdHVzLnBhdGNoIFwNCiAgICAgICAgICAgICINCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MGQwOWVjYzkwYzE0ZTZlZjQxYzIyZTNjNTdjMTQyYzNlNGZiOWNmM2M5NDM3OTA3N2EzM2M5NjFk
NTM0MzA4NiINCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGZkYmU2N2M1ZGZhZjg5NDA1NjM5ZTE4
NTk5ZjRlYWU3Nzk3ODA3M2ZmYTU0ZjNjNzhjMzY4YWI1NGJkMTJmNiINCg0KIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL2F0b3B0b29sLm5sL2Rvd25sb2FkYXRvcC5waHAiDQogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspLnRhciINCi0tDQoyLjQzLjAN
Cg0K

--_000_OS7PR01MB1444471175386EFA651C2E4979B47AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedde=
d.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C226=C8=D5 15:57<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-devel@lists.openembedded.org &lt;op=
enembedded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [oe][meta-oe][PATCH] atop: upgrade 2.12.0 -&gt; 2.12.1=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Version 2.12.1<br>
&nbsp; Bug solution: tests during append of existing raw log are less stric=
t now.<br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-support/atop/{atop_2.12.0.bb =3D&gt; atop_2.12.1.bb} =
| 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-oe/recipes-support/atop/{atop_2.12.0.bb =3D&gt; atop_2.12=
.1.bb} (96%)<br>
<br>
diff --git a/meta-oe/recipes-support/atop/atop_2.12.0.bb b/meta-oe/recipes-=
support/atop/atop_2.12.1.bb<br>
similarity index 96%<br>
rename from meta-oe/recipes-support/atop/atop_2.12.0.bb<br>
rename to meta-oe/recipes-support/atop/atop_2.12.1.bb<br>
index 348493245b..4ca74edbaf 100644<br>
--- a/meta-oe/recipes-support/atop/atop_2.12.0.bb<br>
+++ b/meta-oe/recipes-support/atop/atop_2.12.1.bb<br>
@@ -22,7 +22,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://www.atoptool.nl=
/download/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://fix-permissions.patch">file://fix-permissions.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://sysvinit-implement-status.patch">file://sysvinit-implement-statu=
s.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c9437=
9077a33c961d5343086&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4fdbe67c5dfaf89405639e18599f4eae77978073ffa54=
f3c78c368ab54bd12f6&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://atoptool.nl/downloada=
top.php">https://atoptool.nl/downloadatop.php</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+).tar&quot;<=
br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB1444471175386EFA651C2E4979B47AOS7PR01MB14444jp_--

