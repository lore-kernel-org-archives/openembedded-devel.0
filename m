Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE24C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 22:39:01 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.49])
 by mx.groups.io with SMTP id smtpd.web10.33510.1678487933591517513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 14:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=LyHg+42H;
 spf=pass (domain: advantech.cz, ip: 40.107.117.49, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miB51lOb5M6Lhhr7m5iqNXJABbQbTdle8HYK3cZw/W5B/k9huBYyilGDGVKs5M629pgfl18r57412lTbgn8M8L0rLYhHx2TYqNzsNSCgUZtdncgheC2PHOduG6Purdi/qVWjrNX9GG4Rx4zS5OLY0BU8vQzVx5aAPffy0UETBwojTpamzw/SglBaoagyoRcBr/AlOtieIIb6aDpVShz8VtPThz47FvlTRrlpxB0+hIj+A+LbRpz3yHib0D6U6rxbDflYh7DUXlbCCB2xPebuUgDXddkIfUzJ7Xp9/4G69/+JV35cvgr5zVefvFSMuvx/puIVR235AguRb7crAzev1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d0e/hot/Bopb691oeUQkdVDLT+AcEniwD2bWKzmqqA=;
 b=NTkBFF5VWNignWyMyNq4NbZh2c/5YmhHnvK5YplEt9wXpW4hAMUHw70Kbs38T4zZYmiqGsgAYIBz59yiXn7lFrcYrAWLU3Q+LObHKwKisPs9+WJmalIwg8DcKVhmgezn6G4RgH4ql0b/U2XTNlUqKjLlHWZMJdjhzLuvULj6ssCRi/0SQLpSr0T/9bGnxxxrmEqpOCkbvOUmPmL86e9/csNogbW3scB+BgejBfO0De8gj3T7Aoc6zMA4bFkZIbFh3NDgMMxwLQLXzZWhvk1rRNaY05h5iZLp5FnETHAUeosEsaHZv9yUrjvcRyQDd3gFKWtxACDGDPvEL1zFuPPUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d0e/hot/Bopb691oeUQkdVDLT+AcEniwD2bWKzmqqA=;
 b=LyHg+42HaeaDLxq+r3vhsBbTw3eEa6I5yCoQrk0EOQ2fXpacMWQhqJxUTgYwsNbil/2QEtyy54xJG+FebWk4QKmVVhO1tO+co3q7MJ4jrIQm6fJ8fPwSbisxMR9zpYa2qWHSbWTN+RnuPXnvv8xQgsqCAIvltWRY9g4/H409mi2vYNhsWvimq8ZixHb63Y8PufnCIVmLghB80unhfGVapMQSQtIyRXuYBQj6kPNESzM+azF6J1t9CuAmhyJCPYNFmxD4UsCcOBKFsyzNjrKD4Z5+qI3lGBHd5EUf0sQHIjChOiVwzDMW4j/TIywCjT3c9hEd16W8+J1HdfMmT/muOQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5658.apcprd02.prod.outlook.com (2603:1096:4:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 22:38:48 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d%5]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 22:38:48 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] openvpn: upgrade 2.6.0 -> 2.6.1
Thread-Topic: [meta-networking][PATCH] openvpn: upgrade 2.6.0 -> 2.6.1
Thread-Index: AdlToK2Ulx0dGx0bSsGRt/Vlkct82g==
Date: Fri, 10 Mar 2023 22:38:48 +0000
Message-ID: 
 <TY2PR02MB36787909E9FA028F90CAFB3C81BA9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5658:EE_
x-ms-office365-filtering-correlation-id: 0ca2fc6f-7a79-40ff-502d-08db21b8372a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cn2Nm8M7npEAmVKzcjylRKXaL5JxOR2vm8epjEYWHaWy5OqVr9Er9BEnIbC/diT5FiSQZNMMs/qYGwLKMmcfSWTvOyDrzikX6DPp+fwqvy6QD+o1AfB5e96SORcro3HGnY7HoD0Vm2G4MTQA4pTRw3RlJ+r1+5CTT0CE4e1KDzH28XBKV95Va39YVlgEEPVUJSgs+HIlVQfqC42utSBSIGw7VKxYp40/+OBT8n8esyom8nB+/YF7xB+nP4r8VQzRXh4XCQX8psMbhqi0gXbfFuOJYtTlskf0WO6hEdDqSPyEzR5BkyyiiPexcaoG3yBoqqxpMZkVtA7NINZVWl44l5nlyQBWfCd540400VNpGCv9UrhuhM8/fZ2nUsdjgqID2apDABZiIuOJR2j51hAjNzLnCi07/xDpKleW4xn+YDt8bpUpZOs+E//i0JvuwxDDFoBX8dNO2F4c0+jIs63EEgft3m/9q7yEWylrNXveomlxYXzIlfNb8snfc+L18RLCT0dX+91E/xQe1uBeOZGFlgslmB782eD9JxQ0BCOwbHjAfq2Mx0RyfK3hklWn4bxX+O3xuf+xplJGsYrE0ykovPOZn1A5cZXp+E24d1FZYNPMaZwo9DlheRiDfgt9/aMbsmAj41eQTGvEyUbFxOPp2xOn6/JMzM/w1PP4wohTEIb1eeu2XbGHrt6J/DMMk/Hc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(33656002)(186003)(316002)(478600001)(966005)(71200400001)(7696005)(5660300002)(52536014)(66946007)(44832011)(64756008)(2906002)(8936002)(66446008)(76116006)(66476007)(8676002)(41300700001)(6916009)(66556008)(55016003)(122000001)(26005)(38100700002)(38070700005)(9686003)(86362001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MW1VM0ljMjhJckV0b3dPVjdmTnJycEtwYUkzU29JVUpQSk00eXE5ZjMwbTZD?=
 =?utf-8?B?MWd4dEhRSUc5alltc0xLdXZ6VTU4cW9Od2VjOXhXZU5KRGljaGFkTXZIcmxa?=
 =?utf-8?B?Y2hRR09MUVQ2N1JCWnFHVnltSzQ5clBUZ1lnd05jamdIdloyRFExWklMN0Ir?=
 =?utf-8?B?bUV3bUZEcHdqems4TEVjNG5VZlNGL1JBUDRSbGpYd1dWcHFIckZESUI4Sjhl?=
 =?utf-8?B?ZGJuMkU3bnIxand3T1hadkdXNnJKRkpYWmN4MUlINzIzVVU2bzllOGJVMFl0?=
 =?utf-8?B?c1hMZlFIMDRXT3dZUTBSbjY5L1UrMXZ6SjlVNlREQVNBUHNaOTFvYXhBU3NW?=
 =?utf-8?B?QXg4NzBCYnlKUWlDVEVmSk1vSFpLVUdYRkdUbVpCQURhcmprQ055NlJ4UHJp?=
 =?utf-8?B?MHNISEcxUnBCbWJqcWYyMWRyUUtYUnFmNTM3SGNvbWpUVVIyTWxmS3BQZWc3?=
 =?utf-8?B?K29iMWFwZWQwZmVwUnFwdnFYdXdqU2VoNTNqY2M3ODRTV3ZycjBoSEpRWENL?=
 =?utf-8?B?cld1dmk0Q0lTTm50ZkxtSVlQY08zS1VuV3d1dllXL2JVNkovZTZlbzBMZzhW?=
 =?utf-8?B?dW9iOXJzTW15dHloTk5ncE1BWVNhbEozUzhNNkZ6Mm9CSktma1B6MGt3SGJ1?=
 =?utf-8?B?K1pZWW5jRXhTTitGMTZJN09tS3FiZDhrTWJrVEc4UDBoeVl6NzEvWjloLzk0?=
 =?utf-8?B?YktoUjE0elFVMVcrbUZpcWxVZ0VZSS83MndFS3dTdXVjb3pEbGlhZmRxdzVW?=
 =?utf-8?B?NWNVZkM5ck1wVlVGUXEvS2E2WjlNNUovSWF4SFhRYnhJclVDdXU3djZUY3hM?=
 =?utf-8?B?bFl1dXFnbzZSelBrbk9qQWcvd3d6cnliRE13U3N2aXIwL3NYaVVvTFVVcHh0?=
 =?utf-8?B?ZmpFSFdXQjJUYy9Pd1B5V2lMWmVkNEZlM3E5Yy8yOFd2bGFJS05tWkh3aGFF?=
 =?utf-8?B?Um1vVlFBSitPRXBINzVXOHk1bzY5cDcweStKZDVubzA4RmVNY1lDam1vSFli?=
 =?utf-8?B?QWhTVnZ1cytaZFBycXJ2alVPRXJ1c0hoUy9JU2RCeHZyVjFkRk5pQzVMWmJs?=
 =?utf-8?B?T2l5RWFSTlZ4bCtsWjhuTm5zN0hzcXFFL05lQnRyajNDOVRkOWpKR1NKL2xV?=
 =?utf-8?B?MlJMVEdlbEVoSzNMZW9KWnVLNm5QRy9xdUQ0bFhwYkVqTlRCYjZIUEFOR2Nk?=
 =?utf-8?B?N1ZucHpJQlZEYXFvQlFKYkw2c1k1dUdDOXBvRnNCc2ZDRDd6ZkVUZ3FvU3I0?=
 =?utf-8?B?ejREYzljTk9OTlVCT1JobS9hVTU1eFIyQ0l0NXRXcDhYRUpIc3JxR1BITFZG?=
 =?utf-8?B?YmZqbnlYUmdMbVJvV1JRTTF3R055UGlLVVRCRjVqekpkWXpIci9wSk1xaGlu?=
 =?utf-8?B?SDJOQ3ErUC9KNmx1VUFudk1ZWnJGRFRQelhMRUk3anR2ZXdIM3FPWmpORjBH?=
 =?utf-8?B?UVZPMkpUOWMzVmx3WTJDMExsUzZRb0doK0FtU0FIYnBiVjIwbmFsbWpYSEhh?=
 =?utf-8?B?ZDBXb0NacnZwbU1saDh1ck03czlrTVhSWWdQemlUTitwLzF5S0MwODg4KzJT?=
 =?utf-8?B?SWtIQUZ0amp6SzMyOEc2Q0tEbzVyU3VwTTJrN3lUN0FoNlRmRnRiNmlKMHBO?=
 =?utf-8?B?a3dxSk5LY3pWd3dweis2bzk5ZmxhY1U3R21WQlhCeTNPRk9oc2JUcjY5VTEx?=
 =?utf-8?B?d3gyYlVLWkVUR3hqNU9QUllVL0hSRG5ENmFlNkpkR2VCb3ZMMzJ2TUh5aWRY?=
 =?utf-8?B?emdjUUhIMXFiRndSQW5wUFdFVXM5bUlTSEs0ZHBWM1paQjVsSFMxZ0VHb2NX?=
 =?utf-8?B?dW44czFFYitDR21yT1lYWVJ2V21vSnB1N0U4MFk3S3diWDRpQXlNNW8rUkVq?=
 =?utf-8?B?ZlJWcEZneVFxTlJ5b3VwQzA5SW03ZzVRRStOUnZNUElMdmJNVHZuOHo3dURW?=
 =?utf-8?B?ZlRkTTFOVS90dVY5TUsyOVZJZ01xSU50TzVNNEFtL29rakpYczZ0djIrQm9r?=
 =?utf-8?B?WjRSOXN6aDFQNHJ2QlFZWFNFNTM2SkU4MHpqd1hMMTVFR1hjZWJONi9zUmNw?=
 =?utf-8?B?WjEvL0VyQWRLcndiZjMraWdwV2phTFdsYmFkZEhyOTBCNUF6ajBpVkxFWjBp?=
 =?utf-8?B?dmUwNG5ERmJwVVAvTStZQmNpM29FTU5aSmxtREs5ZHJFOHBWVDlRNU9sNmU1?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca2fc6f-7a79-40ff-502d-08db21b8372a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 22:38:48.5963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Yp+ecHZl/K+MXR2hdAlxwFgCUsL6wkStzGh1enG9XUxic2q0HhhvjpsEPNPboYchraw7kwFBTI0zWU0a7kuWL5XbHTojy+rtVPo9+TbH6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5658
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 22:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101498

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRodWIuY29tL09wZW5WUE4vb3BlbnZwbi9ibG9iL3YyLjYu
MS9DaGFuZ2VzLnJzdA0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRoYXJkIDxwZXRyLmdvdHRo
YXJkQGFkdmFudGVjaC5jej4NCi0tLQ0KIC4uLi9vcGVudnBuL3tvcGVudnBuXzIuNi4wLmJiID0+
IG9wZW52cG5fMi42LjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCiByZW5hbWUgbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC9vcGVudnBuL3tvcGVudnBuXzIuNi4wLmJiID0+IG9wZW52cG5fMi42LjEu
YmJ9ICg5NyUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0
L29wZW52cG4vb3BlbnZwbl8yLjYuMC5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBv
cnQvb3BlbnZwbi9vcGVudnBuXzIuNi4xLmJiDQpzaW1pbGFyaXR5IGluZGV4IDk3JQ0KcmVuYW1l
IGZyb20gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG5fMi42
LjAuYmINCnJlbmFtZSB0byBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29wZW52cG4v
b3BlbnZwbl8yLjYuMS5iYg0KaW5kZXggYzhhYjZjYjQ2Li4yMGRhYzc5OGIgMTAwNjQ0DQotLS0g
YS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29wZW52cG4vb3BlbnZwbl8yLjYuMC5i
Yg0KKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG5f
Mi42LjEuYmINCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3N3dXBkYXRlLm9w
ZW52cG4ub3JnL2NvbW11bml0eS9yZWxlYXNlcy8ke0JQfS50YXIuZ3ogXA0KIA0KIFVQU1RSRUFN
X0NIRUNLX1VSSSA9ICJodHRwczovL29wZW52cG4ubmV0L2NvbW11bml0eS1kb3dubG9hZHMiDQog
DQotU1JDX1VSSVtzaGEyNTZzdW1dID0gImViZWM5MzMyNjNjOTg1MGVmNmY3Y2UxMjVlMmYyMjIx
NGJlNjBiMWNiYjhjY2ZmMTg4OTI2NDNmZTA4M2FlOGYiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjhjYmM0ZmQ4Y2UyN2I4NTEwN2I0NDk4MzNjM2IzMGZiMDVmMWNhM2M4MWI0NmEwYmE4NjU4MDM2
OTQ0MjY2YmMiDQogDQogIyBDVkUtMjAyMC03MjI0IGFuZCBDVkUtMjAyMC0yNzU2OSBhcmUgZm9y
IEF2aWF0cml4IE9wZW5WUE4gY2xpZW50LCBub3QgZm9yIG9wZW52cG4uDQogQ1ZFX0NIRUNLX0lH
Tk9SRSArPSAiQ1ZFLTIwMjAtNzIyNCBDVkUtMjAyMC0yNzU2OSINCi0tIA0KMi4zNC4xDQoNCg==

