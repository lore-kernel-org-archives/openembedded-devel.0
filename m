Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B64C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:11:28 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.53047.1746457881323907811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mLYxwrkr;
 spf=pass (domain: axis.com, ip: 40.107.20.73, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMXxG8tfyEi/bvTSWwNzk+SGZVNh/wedLYZGTLKQmAFRFDnQEJtRGyGdKOrXC4nGAmoALj7VawgmBsHzj8QJKUnSXtfKJ07Fuw+5cm9jnCQJ2rmOD1SR7MPa1pgvqQWfkOdQyH6F4a/juAKZEuomvET6Wzg3hcuCY/kLAfC1D/tNjNJ4KMGpwOGb2OmdeJ4dZ9lbr9KKV5usqXUPql3Z3D4JaW+d9PLPT1/EefZoAbUbDAErQiSJLceURKXpNjsb+uF71MbyPvTfGtKJNK1hQ99Dwi9NXAKLak+eKagl1/BL0kd0L2jhdTfrsK4jbPlBdy762I1J4EdTRmxkUQvCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzvVCHh8fMbKS6d5kCJkwQGj9noaauG9OltRRBym1cQ=;
 b=VbP/S5d3r6WkBCzb3c08zfRC0mfZoJUQHbbIrNN2i3ZcaIf5Aycb2M1DyxMWZEsXz2k3z3RfNq5glP/0Ey/ddwR+Opr9T3r2H++4FC1vondwtV2YyLk5GhPTB+zSHllAZf4S2kl1dwwxC5aYCkaulR9TS9cNMrETJXufqg+bLxqjN6csjh4wNgI7/5O59JOKyKd5/sC6KLteow9pefB+FG6Psb08Xa2W7NlFAXSMDPiCGI61lSrOfKpkQ/QbqU/oUdOUc63Nt/yHC6nuydPk7TRQA2P26UUnw5NBZjLrci6D9IKJwb9sOjtNVJZ8dQWqQa7iGFvQSdAL4moeA83zcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzvVCHh8fMbKS6d5kCJkwQGj9noaauG9OltRRBym1cQ=;
 b=mLYxwrkrVzpnoto+4/CHYCMZHJ24cNo2xtxLN6AoArfVK7A9BBQJVOZP1O3jSlmtnk2DpcnRCsE4rKQE4v0tPMflAUlFiUKxcmbBW6mS4cODQ6uAyi2POKFlTg6nD7QGPRvtBFdkudN9pENqOIbvyqIyq/8N8pr/ktfG6ezsjqI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6119.eurprd02.prod.outlook.com (2603:10a6:10:180::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.12; Mon, 5 May
 2025 15:11:18 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8722.011; Mon, 5 May 2025
 15:11:17 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "nguyenthaithuanalg@gmail.com" <nguyenthaithuanalg@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] libserialmodule: Async C/C++ Serial/COM +
 cross-OS
Thread-Topic: [oe] [meta-oe][PATCH] libserialmodule: Async C/C++ Serial/COM +
 cross-OS
Thread-Index: AQHbvbhjaYZzNK5goU6xH10+NwizZ7PEIiyA
Date: Mon, 5 May 2025 15:11:17 +0000
Message-ID: 
 <DB5PR02MB10213E78F7E079E80B0F92314EF8E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250505111849.13909-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250505111849.13909-1-nguyenthaithuanalg@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6119:EE_
x-ms-office365-filtering-correlation-id: 391b3a99-3330-4b11-5257-08dd8be715ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TWRHMnRaZnllcFpuT1pveDRGVC8ycWNhd0w1MmZKYUZkeTZ1Q09tWDk3WnN2?=
 =?utf-8?B?REVoYU0vbU54MERSTWQ2Rk5VcFVGdld5dXRPaS9YRU1lTkVWYzNJSmU4cldP?=
 =?utf-8?B?Z1A0aWpDWFduOXc4Q1pidGU5MEpOSk9uWTAxSURuMnYwSklqejZWcVo1Yzl1?=
 =?utf-8?B?Y1NyRkNvYXhGSE13RC9WdzJQZ0ozQzFhWU9PdFlTY0cwZTg1Umdnai9aL1pJ?=
 =?utf-8?B?bnk2QVBiZ0RtWTZuaVNMb1NVNTBrLzBXY1JQRG83M05JN3F1VTNKVDY1anRU?=
 =?utf-8?B?ek0rS0Vkajc5akoxYUQvWlI1TnpwWERZdDRrVlE2Zi8xWTZOMmpJOFVxcXBD?=
 =?utf-8?B?M0N0bk5TaktTaXNSK01VdXlaM0k3YzY3TENvblpEY2M2YU5NaWZmK3ZZeGRQ?=
 =?utf-8?B?YWYzUUhudFJ0dWJDMEJnSVFKUXQ3azJ1cnhjemtGL1hiMTF5ZW1rUWtDV0lz?=
 =?utf-8?B?Wit2dThoNGgxYkFhU0lsc0U4ZW95Q1NKdWw3VWFBc1EzSGRuWnNUSGpabmZw?=
 =?utf-8?B?dDh2QUJzVnI2VFBjdGFOQnpPYnp0bjF6TlAraFpFN1RiRzRmSE1XNXJOblBm?=
 =?utf-8?B?NVhBZFZNUXVxNUpGcm44V3R0VUEvVWFrMDc3TlIrMThWMnNuNkpjQmV5WnRF?=
 =?utf-8?B?elJDWW9ibW1uc0tCUk5iOVhFTGNjZDVUT1BoRU4xOHlBYlJTZFVzUTZ0YjhJ?=
 =?utf-8?B?RGUyZVZac2lVMmdrM1lWN3RUeFQxU2RnUDRoVDExV0svUE9oMExrVFZMNXdL?=
 =?utf-8?B?Zzd1TVpsUkEvTXhaUmtPaGlpSFhKajlhRlVxU1UzVkp6WGZlRURHdktPWXg3?=
 =?utf-8?B?Y2IvWlhtZjFEK1NlOVI4eEJOZlVQbVNvT3JLK080eEs2K3pVcHlHa1UxZHpD?=
 =?utf-8?B?OGcxSVFDTS84MmdUcERjeE9JMVBaSnJNZmpaUzdGUFY1YUR0bzJHbzkyUFJn?=
 =?utf-8?B?Ynh4ZzRjV1ROUWx1ZklTM2lUald0UzhJb3c5WWRSTnhjVXZxZy9zYTRTUkVt?=
 =?utf-8?B?dnNBVGtkQXdjaWppU0Z4SGFNQ2RNeE04S1c1SHh5amhtSVlMMis4SVlkWW1a?=
 =?utf-8?B?ZlhLY05sR3ZZR3FoNjlwMzdNVjZ4ems0WDRqd1dIVWdncDZFL1M4TU1kWE9i?=
 =?utf-8?B?bmlObUFCV24wUWdNT3lieVFZekQ0dlR3N2JuVk9jVzdjUDNYQU1Zd3JsNnU2?=
 =?utf-8?B?Slk4WWEvVGJuMXhDdkRNeUU2MndFSThRdVhmamRqZlhNSytMOXhhYkxuQzla?=
 =?utf-8?B?dlZOZVFsT1lkenVwcFo0WnpLRnZpVWlxL0d4SG1MMFVFUS8yMUs1VWd1K01E?=
 =?utf-8?B?WHpQUUtJZmUrTFdTUSt5TlVqNGx6cUxLVzY5RVZrTHlCQ0w5WWI5Y05oQi9F?=
 =?utf-8?B?ZUphcSt4bXQydzZPTHRyeFZiOTRxd2UzS2VUM1NvUjlFNzNna0xUK0NjcFll?=
 =?utf-8?B?cnRncTZ2a2RFc1BYZ2FlRG1sTHFzL1lCWDFlVldzdWRYdlR3d2d6Z1lMK2F2?=
 =?utf-8?B?VUFJeVVrNGh0YUpCOTdtSWoxNStHN0F5MXRvOVk5eHJzM1JOQ2NUUG8vYVFS?=
 =?utf-8?B?Rm90a3F3SVhYZ21CM1A2em9IZzRlQ0p6WkIzVFlrQWhkN1ppejVIT2lZVlB2?=
 =?utf-8?B?QmRkQzUzaTVIakdYU1R1UlR5UXY2cU9CdTdiaTAvTTEwRTY4ZGt0L21TZ2RH?=
 =?utf-8?B?Mkx3SzA2MWxSMEFlVllsVFpLOHhMSVh2ZzkwdGF3VDJsOHV6dm14MVU4dGt0?=
 =?utf-8?B?ZVhzcTgxTkFsRGZKRm9sclQ4TXVKMnZ1dWN2dzJQalpPS1BpSi8vWm1LNVU3?=
 =?utf-8?B?cE8rNDkyeFAwL3ZGS3F3OTVMeWxvK3c1cjBQM3Vlc0RXZ242cEpXazZ0azl3?=
 =?utf-8?B?Mk1zcVB3WnUzRjR2RjJZcWNyaU5odC9yK0xuSk94eW8zQjZuanJUV0tXVzRB?=
 =?utf-8?Q?LWvucw74qt0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bnAza3p5d0lUWjhvakhPUUJnUVBmNEZYcGRvclVvdUlRRUthVHZsNUlFbzFh?=
 =?utf-8?B?bDJ1QzNsamwxVmNkeFJTREN5a0R4dktqMFVlMVZ5bkt5KzFpc01FY0owNWJY?=
 =?utf-8?B?WTg0blY5bVVKOU1Kc1RGQ1ZST1A2UzJFU1NUTHFsVzdvRmoyYUh4Q2JIVUVZ?=
 =?utf-8?B?b3VzQVNOUWEyenhvcGF2bFJ0clcrakY1UitaY3dUOGsrYjVXM2tMVmY1NnVQ?=
 =?utf-8?B?Zks1YWRZYWVWN3hWMXR4MjJvazJsbkxtNWNDZ095bGE1SC9sRkExWTM3d0pO?=
 =?utf-8?B?WU1FWUlIQU40R3pTMm96a0dFZkhSbHg1QUNzSXAvZURjSzVSMmJWRlFBelB5?=
 =?utf-8?B?akp4WlhJdzQ2SUZNaXFhM25KTkt1amwzL2tBRnJadW54RnJxbU51Sms0WU9H?=
 =?utf-8?B?UUxjRHdHNUZqOTREcjZlK05zUEhPR2RKUkVnc2ozTnJXTS9ReitxOFZMcUtn?=
 =?utf-8?B?VnZBaUlkQ2dVWENnQ3BEOUUzNE1oVFkwWm5hWS9Fc3FLVVExbnlrbE1FNUxo?=
 =?utf-8?B?aG5vUUw4MWtMRUQzZk9jaWFTYUxZYWw5NjlhM0poM1YzeWZDYW04eXp2TnEw?=
 =?utf-8?B?YWt6YXA4ZjBuTE1PRDU0K0hrTXgxVlVRdXFmOExjTlR1bXZYcHVmUWFVVHJZ?=
 =?utf-8?B?SFBCYnlSSGJKWmRUTXJTWk4vMElTN3E3a1ZOeFJ4SkhDRDJ1dWMrdy9GV3RC?=
 =?utf-8?B?c2hMd1VYNVYvbldaTkhTNnh5djRha3IwcFZVTGZJWlFjWlBwZmR1OE81ZTdR?=
 =?utf-8?B?cnhtNEZDQmQvSGJ4TERoWU91Yzk3bnh6Q2xZSThNZ05yeDhMcEFDejlzQW1w?=
 =?utf-8?B?YWsxNFRibXV0d1NTVDJIbTN0aklGUkh0dFFoTUJKcUNCRmg1Y3BMUnVsTVpa?=
 =?utf-8?B?dnhxenBvY3VGdXhNdW51SkJQMVpzRlYrZVFkSHZIQlhhRVJxOXhSWlV4N1VS?=
 =?utf-8?B?VGc3eUlkS1RocC9OSVZtQk0vanMxYlU5MjFYbUN4ejNIWXVWY3JWajBnc20z?=
 =?utf-8?B?Z2MxQU1NejV2N3lXR1hOWnk3aWJPd2x1OUd1YjdjVE1qNXg5OG02aklobXps?=
 =?utf-8?B?N3podEloNmZzZDZhWlM0encyaG5kRzBRNDVCbkhyVDNFdjFVcDlkUzRRTlp3?=
 =?utf-8?B?dkNsamhZdWUxTVQ0NS9OVTY3bk8xL2EvdDR3bDZrS2FhM2hBQnEySjErNEdw?=
 =?utf-8?B?dGZ3b05HMGxuaFRIUUpQRmE4QjlqNjAva0RXdS9ONkkyUnZ5ZjVFWWQveWxq?=
 =?utf-8?B?Q2dhRnBBbkg1TE9nQWU4K3ZXSEpQWjh4Q3o3alN2V09mZmRBcndRR2xtS0NB?=
 =?utf-8?B?a2lRdnJoVThXS0xWK1M1b3ZoL1J1T0l6MHlsQkFhdWFFWlBhS1pKcURmZUVt?=
 =?utf-8?B?dFNCeVovdzAxSFZyMU8yQmVheW95M2xiNDlsNHduNURRaHpiQ2JtcW1WbkRl?=
 =?utf-8?B?UkgxcXpCNGdUSXRBbUQzblpuSXF3QXpPQm5wd3VYbU1sb1drZDNSMmo1aGdV?=
 =?utf-8?B?eWJ0Y3hLb2VvaUJZcnFBcjBVWGlieHY1VTU5MDllalcxTFdTUVJuV04wMjVs?=
 =?utf-8?B?cFlnYTV3ZkQvRjJuQmRJUS9LczRkWVJoenE5UFRDUDY5RzJ5ZGNTcWoyVGdx?=
 =?utf-8?B?UUQvYWczaGxsMXdPOE9WbkZxeG9GSk5sa2RvVjUzbVV6WUpjQlVyVlpRN1cz?=
 =?utf-8?B?MGhsd3ViaTBnOE95NGxpTDM4VWNKU0g4cmhqRVFvOWRVMytDMlFpSEZFVjZU?=
 =?utf-8?B?Vkg1M0hwU0VBNHNvUHRKOVpNb2NEQWIyNUE1bUJDZ3o0MVJZRUNoZ2lYczJz?=
 =?utf-8?B?djh1eTBUWUxXR3VKZjZHQ1o2L2FxMUxCSXgyRmRRcWVVTjZHVC82LzFaMVJw?=
 =?utf-8?B?S1p3UVE3ZE5mREM0UFFKUGFjbFArdExPRGRGdkxBVmJBZ2NjNC82aEwzS1Zp?=
 =?utf-8?B?SzNaUE9BZWg5QnVhZTlET2ZZcFp3RkFVM3hBazRrZ3pSOXcxY0NvQjdmSTZR?=
 =?utf-8?B?S0pqQlg0aVhNT0xoVXVmMS9MU0Q3WHZZa2FoTzlCK1NlYmZwNmdZVG9FLzla?=
 =?utf-8?B?bkxqWitiS0FiSi9kcXAwTXhXbzhJSTNrM0wyZnpzTXB2VjIwZlZwdVBsZXAx?=
 =?utf-8?Q?IcFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391b3a99-3330-4b11-5257-08dd8be715ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 15:11:17.9114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPgi7q0xhjPKcmglK+z3rPpZ8hBcVi8ZRmNPn3oGFG4btBC6JNwgqzVZZGORo/WA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117320

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBUaHU/biBOZ3V5P24tVGjDoWkgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU2VudDogZGVuIDUgbWFqIDIwMjUgMTM6MTkNCj4gVG86IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBUaHVhbiBOZ3V5ZW4gVGhh
aSA8bmd1eWVudGhhaXRodWFuYWxnQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW29lXSBbbWV0YS1v
ZV1bUEFUQ0hdIGxpYnNlcmlhbG1vZHVsZTogQXN5bmMgQy9DKysgU2VyaWFsL0NPTSArIGNyb3Nz
LU9TDQoNCkkgc3VnZ2VzdCBjaGFuZ2luZyB0aGUgc3ViamVjdCB0bzoNCg0KbGlic2VyaWFsbW9k
dWxlOiBBZGQgcmVjaXBlDQoNCkFuZCBpbnN0ZWFkIGFkZCBpbmZvcm1hdGlvbiBhYm91dCB3aGF0
IGl0IGRvZXMgdG8gdGhlIG1lc3NhZ2UgYm9keS4NCg0KPiANCj4gLSBEZXBlbmQgb246ICJzaW1w
bGVsb2ctdG9waWMiLg0KPiAtIFRoZSBmaXJzdCB2ZXJzaW9uIHYxLjAuMyBpcyBzZW50IHRvIE9w
ZW5FbWJlZGRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRodWFuIE5ndXllbiBUaGFpIDxuZ3V5
ZW50aGFpdGh1YW5hbGdAZ21haWwuY29tPg0KPiAtLS0NCj4gIC4uLi9saWJzZXJpYWxtb2R1bGUv
bGlic2VyaWFsbW9kdWxlXzEuMC4zLmJiICB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic2VyaWFsbW9kdWxlL2xpYnNlcmlhbG1vZHVsZV8xLjAu
My5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNlcmlh
bG1vZHVsZS9saWJzZXJpYWxtb2R1bGVfMS4wLjMuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9saWJzZXJpYWxtb2R1bGUvbGlic2VyaWFsbW9kdWxlXzEuMC4zLmJiDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmI3Y2NlODhhM2UNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzZXJpYWxtb2R1bGUvbGlic2Vy
aWFsbW9kdWxlXzEuMC4zLmJiDQo+IEBAIC0wLDAgKzEsMTkgQEANCj4gK1NVTU1BUlkgPSAiQSBs
aWJyYXJ5IGZvciBTZXJpYWwvQ09NIg0KPiArREVTQ1JJUFRJT04gPSAiQXN5bmMgQy9DKysgSS9P
IHdpdGggQ09NL1NlcmlhbCBQb3J0IExpYnJhcnkuIg0KPiArSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL3RodWFuYWxnL2xpYnNlcmlhbG1vZHVsZSINCj4gKw0KPiArTElDRU5TRSA9ICJN
SVQiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MjJjZGQz
ODJhNjI3NWNiNGMyZTc1YzUxNzk1MmFjN2MiDQo+ICsNCj4gK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0
QGdpdGh1Yi5jb20vdGh1YW5hbGcvbGlic2VyaWFsbW9kdWxlLmdpdDticmFuY2g9bWFpbjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9Ig0KPiArDQo+ICtTUkNSRVYgPSAiOWNmOTIwYWExZDNlZjFk
NGE0ZGU5YTE5ZTY5NTcxN2E2ZjA5Nzg5NCINCj4gKw0KPiArUyA9ICIke1dPUktESVJ9L2dpdCIN
Cj4gKw0KPiAraW5oZXJpdCBjbWFrZQ0KPiArREVQRU5EUyA9ICJsaWJzaW1wbGVsb2ciDQoNCk1v
dmUgdGhlIERFUEVORFMgbGluZSB1cCB0byBiZXR3ZWVuIExJQ19GSUxFU19DSEtTVU0gYW5kIFNS
Q19VUkkgdG8gDQpiZXR0ZXIgbWF0Y2ggY29tbW9uIHByYWN0aWNlLg0KDQo+ICsNCj4gKyMgU3Bl
Y2lmeSBhbnkgb3B0aW9ucyB5b3Ugd2FudCB0byBwYXNzIHRvIGNtYWtlIHVzaW5nIEVYVFJBX09F
Q01BS0U6DQoNClRoYXQgY29tbWVudCBjYW4gYmUgcmVtb3ZlZC4gSXQgd2FzIGFkZGVkIGJ5IHRo
ZSB0b29saW5nIHRvIGhlbHAgeW91Lg0KDQo+ICtFWFRSQV9PRUNNQUtFID0gIi1EVU5JWF9MSU5V
WD0xIC1ETUVUQV9PUEVORU1CRURERUQ9MSINCj4gKw0KPiAtLQ0KPiAyLjQ3LjENCg0KLy9QZXRl
cg0KDQo=

