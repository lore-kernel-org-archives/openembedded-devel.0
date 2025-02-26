Return-Path: <piotr.l.lewicki@hitachienergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3ACC19F2E
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 14:20:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.52])
 by mx.groups.io with SMTP id smtpd.web11.6940.1740579592428791053
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 06:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hitachienergy.com header.s=selector1 header.b=ce1Egsfc;
 spf=pass (domain: hitachienergy.com, ip: 40.107.247.52, mailfrom: piotr.l.lewicki@hitachienergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebH50SJATutdpMjBqj9j85IOCDfpEjUQrOvx6TrrMFfX7gvhHUYbB3J7Q68+y9V9BdvnSNqr7Smndj7DD1/6SAp766+yArEZbG8RyR6H5IU307IqdCdGpmIV4fmshXueHJXM+kpLvFZlhycutqANZ/EGIdI47ilpf7pue4HQefra2IIx1uZlo8VbIIo+WaB/czsqb7FFZJSit1FObigwV/KioT5NvJh6GpnQ+nefnJQG2mI4qwlpBY1ZwyFpa2eii0anYuHOLUfFS6qOVlvRXi1e54D8blek8Zg8nWBKrqVUa2XrYCMr8LX9ttO/J5l41mVevfPhhVx4WS7vXvKmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt+jZUNUMR/R0DVxAa5lhMV3/x2WR7o9pjvOYVjr2Mk=;
 b=TcbxksKwDs5M3zqbCS/QvOKmW4X8aJCHmCpGplnmiLFRDRofhfYMVMfnaGgedNl68q7z1rSMfVGoWYeIvW+kkj09g7RJwGHuVvwJ2LSuEb49yR42bU3gjXoOt3+f2Mj45KH30lsjfngijZMGQjr9OcJ6rf1LqxHpJkoftGsDgdRATMtkwx4kcpONs9f782ilrz/GS2MZcY8B678s+GwvIsyvbN9qXB7CDW/pJlqtGa6bADfn+tQfGQEVN2LfLZZ9P54HwYXI27BbYUG1KewWz/wRmTL4PpJxw8HU6Wg6BdO/H/0ldhRLbq1JXfaqnxaRrNnVAhPhZBnGhLx7eoQedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt+jZUNUMR/R0DVxAa5lhMV3/x2WR7o9pjvOYVjr2Mk=;
 b=ce1EgsfcbCcS4U6qP+iVsSzjsfCbYc/38SaTcXHYaMgDoO7/n16kcSnxETsUQmmpUkfJdGrbkbFdJbeQ4uyXBZfGUqwxFO6Slg+ZYoJ8gCuUDAf1gUjAqq+tsns8QQTI6ZmdpcX5waLDFlTqSgAt3OWQN6X/DUO7RA4OAJkrxyuMGMlWuwRLxM02drvIedTuGGtIkW7ie3YocNHElOJ6jOCxoCkOY5K5XDgzGmfcj2inas6geyn9asWxEE74DxCgKhYn80u2kjZwrLF4BJtevIl+GJ8s9FoaEV3b2Np7uftpTWFAfbic26zVCaq57dYrj7PTNNP3Pv6UEW4aEWNgQw==
Received: from AM0PR06MB4260.eurprd06.prod.outlook.com (2603:10a6:208:7b::14)
 by PAXPR06MB7725.eurprd06.prod.outlook.com (2603:10a6:102:de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 14:19:49 +0000
Received: from AM0PR06MB4260.eurprd06.prod.outlook.com
 ([fe80::581f:41c7:7551:98c9]) by AM0PR06MB4260.eurprd06.prod.outlook.com
 ([fe80::581f:41c7:7551:98c9%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 14:19:49 +0000
From: Piotr L Lewicki <piotr.l.lewicki@hitachienergy.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [kirkstone] [PATCH] lapack: upgrade 3.10.0 -> 3.10.1
Thread-Topic: [oe] [meta-oe] [kirkstone] [PATCH] lapack: upgrade 3.10.0 ->
 3.10.1
Thread-Index: AQHbiFin/VXkFfnLHkOy2ifqoLRczg==
Date: Wed, 26 Feb 2025 14:19:49 +0000
Message-ID: 
 <AM0PR06MB42602AD86B9D3F0F567027CEABC22@AM0PR06MB4260.eurprd06.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR06MB4260:EE_|PAXPR06MB7725:EE_
x-ms-office365-filtering-correlation-id: a5d28b9d-b38f-4ee0-6189-08dd5670a0da
x-abb-o365-disclaimer: PLPGS
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WmlQb0tqckhuSTcxUlByVUROR2k4Sk16VjdOejVIL0ZNZ05MaStTdjBjbDBp?=
 =?utf-8?B?ZWpYWEV1MEFDZjlzUUpYZ0krblZ0dXVTRWlPUHZ4QThWcFQwMmVnKzNlR29U?=
 =?utf-8?B?RVgrbHBtdUZCTXZ2ajh2ZjgweXRDVURodXRkUzFoOXVYdWNSNTd4RjdHTkhD?=
 =?utf-8?B?T0NWaUtOSUo2K3d0T2kyN25YVENnR0dTQkl2NTY5WTJpRE53dHg1N09uaDRj?=
 =?utf-8?B?V1J4Uy9wWWRIYWx3eGQ1S3pPbzdqOTM1TWhocm5NOUNoK0JsajViRTFEbkdt?=
 =?utf-8?B?amV6N1JQRjZPSHJxV1A1Z01yd0NqeGgwMVNtMFpNLzdaRU81Y2ZxYTJwSFZh?=
 =?utf-8?B?bmc2M2tJak5DdlBRK0RFTFh4WDJMU2x2aTZ5eTJOQXZ4MVFFanZUdXRCRUs3?=
 =?utf-8?B?Q0xBenQ3dlBYUjlLVzhXa25oUHMwUE94UmtULzgvZENtd085dU0yMVZCZ01u?=
 =?utf-8?B?aEs3NmczN0RseXpXVG54UWEwM1JPRFplSUwzK0U1VXlIY3lDb2VuVVNUeGIz?=
 =?utf-8?B?MWlVRGVkekhoenM5dkFoTmsweEFIaDRPWXpUeGQvR0tXMHNTVVNJNXRkend0?=
 =?utf-8?B?a05TQ1lDV01BVW54M3BpNTgwZVdLWkZRUFlSdmtHUy9SQTcyZTAwQXJTdDMy?=
 =?utf-8?B?dTlUUzZYbllIZ2hjQnZOY0J1dkpYb0p3ckM4NDUreU94ZHBtM28wVDVMN0Qw?=
 =?utf-8?B?Rk5HM2dSaUUrYUY1Z29MeDNBTCtuWlhjZi90TzZERVJHSkViSHV6L3RPekNC?=
 =?utf-8?B?ZjhpcHU3VnFxQjRuSk0yaDNpQTB3UVduczdWanJjcXJNN1E4YVg3MnRjNFRt?=
 =?utf-8?B?VFZZWGVNWjVrbVNXczJHeXJSSHpHZ1Y5SmNrVGQ0UVpaTnIrRHBheTBTYWs3?=
 =?utf-8?B?WlhmbU15alRaWm9DUzFhaTRhbXg5ZTUwb3o4Qk96b3Ira3Z0cXg3anNnazRB?=
 =?utf-8?B?UWxzT1pYK3JkcmJiaEp3WGhyL1l5Wm5UT1lBY1A1TjN5TjZya0REbTVMVjJE?=
 =?utf-8?B?dFFwMWI3U2dOK1R3N3RGVjVVSExjZ1orYU1lUStEOEp5M2pSc0tlU2RocEhn?=
 =?utf-8?B?RFRoU1hpWEtFUnBqWXVUdVJ0aGJiQ0xFQ0NtSktINENWVWRCT291TG5EUExV?=
 =?utf-8?B?ZkNWaTM5UWdNYVZCS1F0Q1lVeFEwOE90V2VZSnQ1ODU2YSthcWxWL1NGaUVz?=
 =?utf-8?B?Ukc3UTJiTzcxbkpaZFJoVXdtN25UU2poRTI2dGlqSzFhRkpsWk1vakRzWWNH?=
 =?utf-8?B?TzJjR04xUDRTeklBYzYxN1RPOSsybzNwY2t6K3crSS9MM3FPcmdlcGo1ZjRE?=
 =?utf-8?B?cFhZWmVTWmo2cCs4TVFOSFkvZ1FvWWxIMWtjK1pZUlpWK0NpNyt0Ny9IaERs?=
 =?utf-8?B?QnJRblJYc1RPMW9mTmZJTHVabnFhc3UwZXh6V295SHUwcXQ5dHJmTHZNYy9m?=
 =?utf-8?B?UmJtUlJ0bWQ3OG0zQWV0dkRHakFFVmdVOU5saHJULzAwMVNiWTdlZFE0VTho?=
 =?utf-8?B?ZmJ4Mnh4ZklZL29naGZ0Y3dmVFhuTzd1VWh6dE1ROC9mQzF1cWJZYXBudWR3?=
 =?utf-8?B?Sk1SUlhXS2h2L29OZnU2WFpBRlYrUnkxLzR4Ny9sam8rUTd6akx1WUExbUtQ?=
 =?utf-8?B?YVVYZUp2NG5Yd2RqVGJMcXhRRk5vdElvalpYN3R5NWtzZmx6V1MxWFJUUkFo?=
 =?utf-8?B?anRZdHVmT1pTM21xSkN3VmkrQWY1T2d4MWRWdjJKTUJMQ25oSFZqZ0o2amxv?=
 =?utf-8?B?Wmk4UHdoT0RUTGhJZnhVbU5YMUFhYzNWSk9udDcwTlB2ZVo2VGc5N1F3OWxV?=
 =?utf-8?B?WHJPc3RyZVh1SWRyVk84REhFalRzL1Yxb01FUXRaZjZXZHRLejNzZjFXZW1I?=
 =?utf-8?B?dEdDdG5HNDV1L2Q5SmtYL2tnUDRWZHZBWXNIbmVZK0pPd0E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB4260.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0FORHNBRU1lazRaaXlsQlR3djNKOUEzZkxQRGZ3Q3FqNjdKOCtpSmRHUlAz?=
 =?utf-8?B?UjhFanoxUVR5Y29KRTAyWkVoTVR4QkJ5SmpZN29LbXFWQUEycGJOeDdXVldB?=
 =?utf-8?B?THlYcXVFdk9WRGVkcVMxc3ppbHd4NHJkWXVxYi90ZXdlbkErVW5mMGl6SUZR?=
 =?utf-8?B?MkFRQWpSaWd5Nkp3dHR2cWJjQ29LMU9BRFBOL2dHa0c0T2o2bnJ0YXBLVVFk?=
 =?utf-8?B?eGM0NGx2YjBnb25hTDcxbHpkODI5eVJ1a3BrMXNQSzVTRHJvc2xXZmczVmJO?=
 =?utf-8?B?R2txZ1hPRUhnUlp5UkpDNk5nNTI2TExaTzB2OHhSdHpjQm0rUWR6YzdMQysz?=
 =?utf-8?B?WVQ1d0pIN1Z6TmE4UW0vTDNhY3NXMkd0dWhMTGlMOTdEZ1E0ZytuMFM2c3hZ?=
 =?utf-8?B?Zm1aZnBZWFBCSzZ2SEE4OElIeEhQOHRzR3luMGsvUGJhQXE1WU5QUi9oT3Ra?=
 =?utf-8?B?VHBBUjdZRTBiMVhadVZWM1FoQVdFMDBlbDVWSU5jdHAvMlQrcWdYWDFyUTFl?=
 =?utf-8?B?Y3VRblJ0VE5acmF1QkZKQnZRNWsvMitHS25laytlRitOYk55WTNIUldZT2x2?=
 =?utf-8?B?S0ZlcG53Wk44MGZlMFFLTWFlMnk2UGdoZHptYjRTOEEycnYzVFpzQWY2QXc5?=
 =?utf-8?B?anhXWkhsV0xwZHpwMzJwREZrcnRGMU1PYWxUcFZiVzRqVitFTXF2VlFQUkNo?=
 =?utf-8?B?d21uZzQwWWJmbVYwQXFHbHQyMkkwMVhBajV6OUhxM3ZLM01BalU5R292U0Nw?=
 =?utf-8?B?Mm81SmJ5VjRwUEpRYysyUzQvYVkrOVQwZlZoeHl2VUxaUThCbFRYKzU1Y0o4?=
 =?utf-8?B?aE52Vy9BSTAzbzFSYkpuSDl2aG9HcjFaU3dQc3FNNkMvZXBZMUhCRmJqWDdt?=
 =?utf-8?B?VzlXYlo0UmhVVUsvSUhXRnFHRFN1UXNrbXFQNkkzWnVwdmx2c3BYTzFpUTBx?=
 =?utf-8?B?aUdCQVVUU09RRSsrOTA4ZXl2L3o1OHMwNEFnVW9QMnlRaXA3SXl6eXpyYUZR?=
 =?utf-8?B?NU55SmdLUkJVSDdSSlZaQ2FvRjdiMUlxQmFPRHNuVUZQS1lIdm8ybUF5V0Ir?=
 =?utf-8?B?TDRzdEtnNnBGOE11UWtKOXdxbWx5dWFXMmgyTWFDb2J4NDRsQWQ2c2ZYUkN1?=
 =?utf-8?B?cWlyQlBsUVVsdDZCMVBtMXhTUlJOUTREQ1pONEk4Q0RYVEo3N0JuZW5PNVhu?=
 =?utf-8?B?OXlUWk00bnlqK2YvbXZLMVhOM2NJVU43cDg2SE9IMHAxS1NIeE16dkFFalN5?=
 =?utf-8?B?c09qRDlwbTBVOVRHTkM3bnlsd3hvdUNqOER2dmFWSHQ4bXRWb3dTZzd4QnBm?=
 =?utf-8?B?dEdzSVNJQWZwNjQvVC9VZFJCc3FoNlBoaXJIZGc3ODd0R2tLU3ExKzl2Wmxy?=
 =?utf-8?B?Qmp3blhsdGoxSUw0emFyb3BhMWU2ZnUrN2M4RmxrRjlGTzFUQ29vTnlOaFdh?=
 =?utf-8?B?S3c4VDNaekF0UnBvM2xTUDhnQXRoVWZXOUwyZzFjSEZNSFVsZnphaUQ2bzM4?=
 =?utf-8?B?YUdRQkNOT2lTbVNiS0NaUDdkSmhNcHdIYXFxaGtxRi9sZU9XZEczMWl1alBZ?=
 =?utf-8?B?dU0vTVJveUxyRGJiRHBmQW1NTGwxZVUvaVFsRnlOMENwZ0VrSmVlb3RZRnpm?=
 =?utf-8?B?YzJ0Z3YxeFgrMTJybUdOTEtsbTBqcDIwMjdza2luSTJqVWg1cjNzUzk4YmlC?=
 =?utf-8?B?cm85dEpLcnFmQVJGUE05bW04bCtVc3hDUGl0REZ2VG1TS3RoM2xwWXpXQklh?=
 =?utf-8?B?eFBNV1FTTzM0VkY2WG1EYXhrTHpGUklGV2JkeTY0T1paU1NSRElyMVhqSTNp?=
 =?utf-8?B?dHhTdDJJcXhQR1NNdlpoaFB5aHNsWmlCSy80dk5IYkFacTgzdC9Hc1lPQmRO?=
 =?utf-8?B?WnRNK3B0UmptUmhIODdBU09oWWwvSG8xMUZKZmxGWllLK2VqODFXamdNdG43?=
 =?utf-8?B?NVM2WFV6YkJkbUN6aVc4V2RpNnJtK3BNUm1ESnNhMEJMdlgwS1FYSVFvbFZI?=
 =?utf-8?B?ZVE5SC9nYmUzZk0rU1JhTTkweTVYM1pJUmp5NURiRjAxUjF1ZUtydkYwNDhy?=
 =?utf-8?B?MjlmWnJ5MlpkK2gwVnNSVmRzRHdPQWJobVVQM2J2RjdtUXFXeWx2WTMzZ0Ix?=
 =?utf-8?B?MThHN1duZm5WSVV0bDRoUThlbWIrbkxYclFpbldBN29PZmxqKzR2ejVCdmdh?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB4260.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d28b9d-b38f-4ee0-6189-08dd5670a0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 14:19:49.1095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5PIXFknxYdYs3kKBB5qwR1D0Yj1x14X66pKRTdRTdJh/zqlwlXNzjCPByksEWz3oAF697B7CyfrIGe8ZMe+y8D6amnC/saiCo3xxmoQei1bKUjq3RWutWe4Q6mH6ZeQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 14:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115650

SGVsbG8sDQpJJ20gdXNpbmcga2lya3N0b25lIGJyYW5jaCBvZiBtZXRhLW9wZW5lbWJlZGRlZCBh
bmQgbGFwYWNrIHJlY2lwZSBoYXMgbm90IGJlZW4gdXBkYXRlZCB0aGVyZSB0byB0aGUgdmVyc2lv
biB3aGVyZSB0aGUgQ1ZFLTIwMjEtNDA0OCBnZXRzIGZpeGVkLg0KSSd2ZSBub3RpY2VkIHRoYXQg
c3VjaCBhbiB1cGRhdGUgaGFzIGJlZW4gZG9uZSBvbiB0aGUgc2NhcnRoZ2FwIGJyYW5jaCBzbyBp
dCB3b3VsZCBiZSBuaWNlIHRvIGNoZXJyeS1waWNrIHRoYXQgY29tbWl0Lg0KU29ycnkgaWYgdGhp
cyBpcyBub3QgdGhlIHJpZ2h0IGdyb3VwLiBJZiB0aGF0J3MgdGhlIGNhc2UgLSBwbGVhc2UgcG9p
bnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbi4NCg0KUGF0Y2ggYnkgV2FuZyBNaW5neXUgYXR0
YWNoZWQgYmVsb3cuDQoNCkJlc3QsDQpQaW90ciBMZXdpY2tpDQoNCi0tLQ0KDQpGcm9tIDI2Nzdj
ZDI4YTc4YWE5MzU4M2Q1MjkwNWQyMDA5OTA4YjQ1YjZkYjAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxDQpGcm9tOiB3YW5nbXkgPHdhbmdteUBmdWppdHN1LmNvbT4NCkRhdGU6IE1vbiwgMjUgQXBy
IDIwMjIgMTU6MzY6MTYgKzA4MDANClN1YmplY3Q6IFtQQVRDSF0gbGFwYWNrOiB1cGdyYWRlIDMu
MTAuMCAtPiAzLjEwLjENCg0KQ2hhbmdlbG9nOg0KaHR0cDovL25ldGxpYi5vcmcvbGFwYWNrL2xh
cGFjay0zLjEwLjEuaHRtbA0KDQpTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1
aml0c3UuY29tPg0KU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4N
ClNpZ25lZC1vZmYtYnk6IFBpb3RyIExld2lja2kgPHBpb3RyLmwubGV3aWNraUBoaXRhY2hpZW5l
cmd5LmNvbT4NCi0tLQ0KIC4uLi9sYXBhY2sve2xhcGFja18zLjEwLjAuYmIgPT4gbGFwYWNrXzMu
MTAuMS5iYn0gICAgICAgICAgICAgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
bGFwYWNrL3tsYXBhY2tfMy4xMC4wLmJiID0+IGxhcGFja18zLjEwLjEuYmJ9ICg4NiUpDQoNCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbGFwYWNrL2xhcGFja18zLjEwLjAu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbGFwYWNrL2xhcGFja18zLjEwLjEuYmINCnNp
bWlsYXJpdHkgaW5kZXggODYlDQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
bGFwYWNrL2xhcGFja18zLjEwLjAuYmINCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtZGV2dG9v
bHMvbGFwYWNrL2xhcGFja18zLjEwLjEuYmINCmluZGV4IDg3ZDUxZDhhNGQuLjE1ZjM5NGUxM2Ug
MTAwNjQ0DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbGFwYWNrL2xhcGFja18zLjEw
LjAuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9sYXBhY2svbGFwYWNrXzMuMTAu
MS5iYg0KQEAgLTEsNyArMSw3IEBADQogU1VNTUFSWSA9ICJMaW5lYXIgQWxnZWJyYSBQQUNLYWdl
Ig0KIFVSTCA9ICJodHRwOi8vd3d3Lm5ldGxpYi5vcmcvbGFwYWNrIg0KIExJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIg0KLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM5OTAy
ODI5YmEwYzJjYmFjMWIwZGViZmI3NWE0MTZiIg0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWEzMmM5OWYyNGQwOTdjNzJkMTg1N2U1MzNiNTU2NDJiIg0KDQogIyBSZWNp
cGUgbmVlZHMgRk9SVFJBTiBzdXBwb3J0IChjb3BpZWQgZnJvbSBjb25mL2xvY2FsLmNvbmYuc2Ft
cGxlLmV4dGVuZGVkKQ0KICMgRW5hYmxpbmcgRk9SVFJBTg0KQEAgLTEzLDcgKzEzLDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9Mzk5MDI4MjliYTBjMmNiYWMxYjBk
ZWJmYjc1YTQxNmIiDQoNCiBERVBFTkRTID0gImxpYmdmb3J0cmFuIg0KDQotU1JDUkVWID0gImFh
NjMxYjRiNGJkMTNmNmFlMmRiYWI5YWU5ZGEyMDllMWUwNWIwZmMiDQorU1JDUkVWID0gIjMyYjA2
MmEzMzM1MmUwNTc3MWRjYzAxYjk4MWViZTk2MWJmMmU0MmYiDQogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL1JlZmVyZW5jZS1MQVBBQ0svbGFwYWNrLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFzdGVyIg0KIFMgPSAiJHtXT1JLRElSfS9naXQiDQoNCi0tDQoyLjM0LjENCg0KDQoNCg0K
SGl0YWNoaSBFbmVyZ3kgU2VydmljZXMgU3AuIHogby4gby4geiBzaWVkemlixIUgdyBXYXJzemF3
aWUsIGFkcmVzOiBXYXJzemF3YSAwNC03MTMsIHVsLiDFu2VnYcWEc2thIDEsIHdwaXNhbmEgZG8g
UmVqZXN0cnUgUHJ6ZWRzacSZYmlvcmPDs3cgS3Jham93ZWdvIFJlamVzdHJ1IFPEhWRvd2VnbyBw
cm93YWR6b25lZ28gdyBTxIVkemllIFJlam9ub3d5bSBkbGEgbS4gc3QuIFdhcnN6YXd5LCBYSVYg
V3lkemlhxYIgR29zcG9kYXJjenkgS3Jham93ZWdvIFJlamVzdHJ1IFPEhWRvd2VnbyBwb2QgbnIg
S1JTIDAwMDA3ODc3MTksIG5yIFJFR09OOiAzODM0MzEzNzAsIG5yIE5JUDogOTUyMjE5NjkyMywg
bnIgQkRPOiAwMDAxNDc2MTEsIGthcGl0YcWCIHpha8WCYWRvd3kgMTQgNDAzIDg1MCwwMCB6xYIu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KSGl0YWNoaSBFbmVyZ3kgU2Vydmlj
ZXMgU3AuIHogby4gby4gd2l0aCByZWdpc3RlcmVkIHNlYXQgYXQgMSDFu2VnYW5za2EgU3RyZWV0
LCAwNC03MTMgV2Fyc2F3LCBQb2xhbmQsIHJlZ2lzdGVyZWQgaW4gdGhlIFJlZ2lzdGVyIG9mIEVu
dHJlcHJlbmV1cnMgb2YgdGhlIFBvbGlzaCBDb3VydCBSZWdpc3RlciBtYWludGFpbmVkIGJ5IHRo
ZSBEaXN0cmljdCBDb3VydCBmb3IgdGhlIENhcGl0YWwgQ2l0eSBvZiBXYXJzYXcsIFhJViBFY29u
b21pYyBEZXBhcnRtZW50LCB1bmRlciBLUlMgTm8uIDAwMDA3ODc3MTksIFJFR09OIE5vLiAoc3Rh
dGlzdGljYWwgbnVtYmVyKTogMzgzNDMxMzcwLCBOSVAgTm8uICh0YXhwYXllciBpZGVudGlmaWNh
dGlvbiBudW1iZXIpIFBMOTUyMjE5NjkyMywgQkRPIE5vLiAoV0VFRSByZWdpc3RyYXRpb24gbnVt
YmVyKSAwMDAxNDc2MTEsIHNoYXJlIGNhcGl0YWw6IDE0IDQwMyA4NTAsMDAgUExOLg0K

