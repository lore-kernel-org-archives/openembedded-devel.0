Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B107C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:02:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.52457.1746457362215201032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kEVP3i4L;
 spf=pass (domain: axis.com, ip: 40.107.22.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzWelms4I5VR30JfK+/Ga2JebvbHBPquk/k9nVN1Mo5SG5JoGWZq85Gh+W2QW6V5y7s/8+R5Zc5cbrSKUWEf6kq8f7Msi0HOdW885wWrj+VcbawR5WhjNmdM5iUtrbdC80owOGYyaZpRXqjDzqXypmbYwE2A0WKbnmhEa5+9thitmoKdogbK83t/DYtbWheqzKKGrJPjMU+7rTYW284DNTZMYKIL+lAA8ORMj67TG6EVDjGUepcS3bLRYP6D9LUZIng/jG1bX5Dj4Cvj0/72H73skZsSTlnmmmPnDWadxPQj/KOmnus27xgqd6+Faelv3Tn4lDx4EBlVlXhFjNiKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6svLq+llp4RbkgENBxtfMP0qd/RC3CZF0QmD3W8Gsxw=;
 b=UTU3vbJNZHiMNTwKcS5QeNNiqP/sut7bPr+I+1q/EFfq18mx2R5j6c+Siup8UHLQropeNA9e12GLUdXnRP6qL/QIK8O9soSiBuh5Hj5lsb8aoEWltqDtu1fmY8Y+7bPoR8vdDxZpvsDsCf4k4Q9ibW+Y5tTwQ57drDzKSDc43eD+0ksGGqTAz7R6Ch1773S62YkeY10ylQSk7ihVVtucFce748WwjYGbKaW5gVCRr90kkn2lHY7b1s+JlKD1AV6S1jsm5v92VWLENXrPoI9uMU7UD6QL7ED8Pg4TOqsyVnD5Y6qXs4jjOq+7OMUriu4bRfuRb+oGxaV3x8cD6SeX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6svLq+llp4RbkgENBxtfMP0qd/RC3CZF0QmD3W8Gsxw=;
 b=kEVP3i4L8R9YXCibm7Gnc0k1rBpoY3PFFrZVV74klmoNEu5tLJvmY9n73pcx4+kQ/cDGjloWrAS4Sgr57Y8LrLvBdYIewuhpBmbyRT4ZBcCqyrOqDkwByoTRXDL5P0budTDS5gFaKRbCYiLqWslPwncnqOF4n6kYto/vfyA/t40=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB10957.eurprd02.prod.outlook.com (2603:10a6:102:485::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Mon, 5 May
 2025 15:02:39 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8722.011; Mon, 5 May 2025
 15:02:39 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "nguyenthaithuanalg@gmail.com" <nguyenthaithuanalg@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Thread-Topic: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++
 logger.
Thread-Index: AQHbvbg5wHK7HyNaNUK2WkMbKOJUNbPEISRg
Date: Mon, 5 May 2025 15:02:38 +0000
Message-ID: 
 <DB5PR02MB1021377F89A2488F765DF4F43EF8E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250504040417.5733-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250504040417.5733-1-nguyenthaithuanalg@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB10957:EE_
x-ms-office365-filtering-correlation-id: 8fb509c6-f191-43ac-b31e-08dd8be5e0b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z2dXVzRQT1ZNU1RCc05GSWZZb0xaajZmeUs4SlByQnArZEJjQk1mM05mNHJD?=
 =?utf-8?B?bnhvS1huN2FtdWQ3WWJsQ1JwVXpHam10TWNLU29tOFd0b0xaeUFJUGMzaXk1?=
 =?utf-8?B?RHN1S0Q2N3VaQkN4MjhaREJ3SEVjcFBiTmMrT05IdUhTNlZ1eUNiemVIN1Ex?=
 =?utf-8?B?bnFMbDJ4ckJMeEk4YnVscmZYT0xlS3ZDMUtqK2VVUjNZbHlhcDc0dkZZeHFW?=
 =?utf-8?B?MzBMSHVtYjhBbnVGaTJ3Q2Y2UE1YMCsrZHNCeEpzc0lBVWkrdVJuTDZYRWRm?=
 =?utf-8?B?NWJTQXJpa0VtVXJQLzlWQ2tXeHFUMndKYUQwODBBQ0JUdUVZRENSemJkMEph?=
 =?utf-8?B?WnBxL1o2bVV0MlVDeWpCS3lnMmNxZ2pYdVIrc3hZbVZMSHVaSFZhNWUxeFlC?=
 =?utf-8?B?MXF3NXVLQlcvWGJIMXF3VjllWHAvODRhNlVEeVhZS2Zjc2ZSM3A4M0Z4dzMx?=
 =?utf-8?B?Tzc5emFyZnFQd3p3ZWVrcm9oRm9QRHFWNW1OTEt3TXF2U2NDbENWdjYxUjl3?=
 =?utf-8?B?QWUxSzRzcm51QjB2dUgxcGZPb0tHdFRmb0ZWVFQwN2tkeDgySW55a0NVcEN5?=
 =?utf-8?B?elZVNEpwRll5MStkN3p4TzloK2liOGxReHhEaWREWlFZWUdIWDlITFVWL2Fl?=
 =?utf-8?B?MzZOSG8zbUFTZDZ3cE1OOVdMMzNVbDNnQUJ2K0NTYk9JNDFlOG9zcmoxN1Jz?=
 =?utf-8?B?dHc5RURMYXVNK29qcHJMcjFnb2dKWkVzQ1Rtcm1VOHVOd1lKR3ArQUREb00v?=
 =?utf-8?B?WVZjVm9mZnkyV0xZakZ1Z0JFeDZoOEZaVzYrazNROG0wNlNxcU5hZXhHOUs5?=
 =?utf-8?B?dzh1ZHlpcjVLeGt0eXUyZjRic2NTRy9PdWtDalZtR3JHRnFZWWdRa1BNYldK?=
 =?utf-8?B?Uk1CUzR0OWZydE9EVW5MVE9PZzh5eXRPV0d4NEFMMUVxZDRJcFhEYnZOQlJ3?=
 =?utf-8?B?R2F2QkNtcjBrTTdFSmNxZHcvcEs4TEkxWFBCeGl3K2VZT0s2M3dsdWFEMGdP?=
 =?utf-8?B?Z3RaaXFMWmRkN1BSc082d1BnRkdxdmo4cVczcWp5Q2RqU05aT1NjcVVkTDI2?=
 =?utf-8?B?V1R6WnJZUXpoMUt0UWdmOUlxSktSb2d5M2loUFRZckpQUDBHUTc1RU5kcGNk?=
 =?utf-8?B?T04xc3VuWGxtWkxBQUJGYllsZllNNmp4NzZJSmFOU0tQZFdvU1dIamdrS0ZF?=
 =?utf-8?B?K2VNbzFVeldOR2c3bUtHTFhGNi9KT0pVYUZFVzFKYURFdGMvc0x2ZEpJcSta?=
 =?utf-8?B?ZlNMZ05GYUFXVW96K2NORlkxZWNqb1VwcFpzQlZJdGxSd0h6WThKeE16Mlds?=
 =?utf-8?B?ZU94NHpIMDZBSlB0QlEvclJIQU1FbDlidXZ4RDVDZklqZlFYeFN3NnZEMFhp?=
 =?utf-8?B?UklMNGdNSzNLMG5Jakl3T2JMZHdlRFNqWFVRUjBVdmhmdUF1UEtpNldjdlBQ?=
 =?utf-8?B?R2JTQlQ5NkxURitiK3hjemt6S2QxU2w5NTRjcmRhWWxXVyt1OGxlcTdENnEz?=
 =?utf-8?B?eGFYYlIyUjBsQjdCck5CZDdWdlloR3lxT25NODI1MzdMbzk2RFk2dW1IRy9k?=
 =?utf-8?B?MUhDb3JXWlF1QUlRZ0FhK1JTTVFJeGI4OWx5WXpnUHhpdThFa2dQV3NNY3BH?=
 =?utf-8?B?SE5WZTkxN1IrN0dqdS9hZzVQclc2K0ZNaDU5VHFtak9XWUhhQjJBOE9nbU9U?=
 =?utf-8?B?dzVUUVdCczZGSVh3cTF0ZG1sRHJoUVBPMDkyZjlBWE1YeHJRVzJTRHA3MENn?=
 =?utf-8?B?LzBNZjd1TGhML0dKQmIxNmt6YURGdm5JaFUrTXg5WU5BbEFaREJBZVRnSzZ2?=
 =?utf-8?B?ams0Mk8rVmU0ODk4Zlhya2wzajlJT0JxYWNhYS9qa2pjYlVpSytpdS93NU5W?=
 =?utf-8?B?LzFvUkxuTFZNRkZiZmphUjZ5NlNLYVp5NU1kQXNIL2EzbmxjbWNRVEJjZ1hT?=
 =?utf-8?B?REhtOVFJNVFaeXEzMFlWRjFCR2Vzem5XTlllU0xWaHFKZVRQTU1DSE5YNWw0?=
 =?utf-8?B?NXhYalJDdUZnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFpBTVNaMzdESmJDbm9BWUx6aTVyb1FIanIxNGlmTXJ0U0RLTk9QWDhZUzA2?=
 =?utf-8?B?eXlwUy8wUjZyR3hGUGFSc2Jxbm1kVXBDM3p6a0dtbVZjTndUMzVFR3Q0bGZp?=
 =?utf-8?B?cTBpcWNrb0hkMGVyR2R3Y2x6c21wbHlnSE1nN1crZ0dEbktUWVdKaytJSXU0?=
 =?utf-8?B?d0FZQ1Ruc0xodkhKVzNVclJYY0ZIR09STzYrNWFtU25QRlYyVmF3eFpoZ1Np?=
 =?utf-8?B?RzJKV0h0MGJZU3htT1lsdkhmckpiRUZ6WXkwOE12SmZsTVEzOFB1VjY1WDA0?=
 =?utf-8?B?bXBZN2JTN3BERGpzV0VxWFpPQmRGL3BpdDA1blJDOElNZTIwRmZRbUl6WkVZ?=
 =?utf-8?B?MFhLRGNHUmFFOHdtWGNzcmxPZnFKUCtKS0JxYVM0VitGTFZtWEdPcE8wUGlT?=
 =?utf-8?B?SVFIZ2h1UWxtWkVHSjI5N0NraDBuUjc2QmszYWhuZWhKUWY0VlZRbHNTaDN0?=
 =?utf-8?B?WXhPdnlHd2psUFdqTGxiVHdiTzhkUzRiYVJzQml0cTBTMmZLVUxjV2wzc3Vt?=
 =?utf-8?B?TXRUT0NsMWc0L1Y0ME5rRkZUaU9uQ055WGpjQWpEMTQ5NzdnNTVWSE9Wbmox?=
 =?utf-8?B?YzRvTENua0wyZjA0a3J3WWFYTzhITWRRQVNscGlZYjV6ZktXdEJINElSTEF3?=
 =?utf-8?B?NEJMZmJGTUQzUGVSNjF2aDU4RTlmWXRmMFRaenl6M0orWFN5UDQ0aFBHOHRo?=
 =?utf-8?B?Qk8wRG5EcmlwN0g3MzdPRGJFZXAxT0Q0Uld6ZENqUWVGL2FPRWVrMWZzZmpy?=
 =?utf-8?B?OG1IaktsNkdQRENZRVgybmM4Zk5mYllVWVAwaTcrLzBwNndrb0VWT3hXUU8w?=
 =?utf-8?B?VmJvOHBNMWNWT2ZnbTlOelJmNHRIOUNFSEFuMFE2Y2RONUJpa2VvOHBGbWRr?=
 =?utf-8?B?a1RkbkkvdWR3Mk5OS1dXL2ZPUWdkTDNRYnNVdndOUVlDZUdYY3ZScU4zc2Jt?=
 =?utf-8?B?SDYzU0hSTWpONGxQKzBkaGUwb3Q2R0xOZmUydUM5R3kwVGtVa09GVk1IalpC?=
 =?utf-8?B?ZUFibk54cjhQVGw0Snd2R2pkVnB1WmlmREtMNFJNS3dmQnBtaHpFd0xSejdW?=
 =?utf-8?B?Z01aeUZhelVEU3pvT2NuWC9CV1R3V1NwUVlUOE5xLzNzUXVuZXVaeHZMcU0z?=
 =?utf-8?B?bEoyZW42b1VPWGN0eW5UMnlDVHYwVlpwWjg5dFFybkY2dmVSdms5QjZodUhh?=
 =?utf-8?B?UEFpVW5GWndqMzYxMkZKcEVoZ2ZVRmpRdFR2ZkVwZzR3VmtVOFZNeUZiaGtO?=
 =?utf-8?B?ZzdYRTd1WjM0N29xVTBwaUk0bmMxek50ZnkrSitaU2NCaEpRNjI3b2xCMFRm?=
 =?utf-8?B?NEFORnk4QjQxeWlyaU4wVjBZUHdaVTllVGxpMDlmdDBtYm01b3BTb3hScExl?=
 =?utf-8?B?TGlIS28vdEZmSkxVbklVdGUxVFMrdFlRcldNN1lXQWM4NUlxWEZxMUFGd3J3?=
 =?utf-8?B?cFdEMWQzaktFb0luYkFJNDRtMXFxQ3FIYXpHc1dRdjNQc05VbTMvMEI0Nk9t?=
 =?utf-8?B?VzlFeVZuY1JIS3ZTeStWbFhybXNuNXJHcEVDYUtqbUV1UG8xVWdyRWtPNkxW?=
 =?utf-8?B?ZmlWYWZPak1NSE8zMDN4U3pGSUNRVU5Pc2dxMGFqME53eHg4WnpoN2Q5cjRh?=
 =?utf-8?B?MlltVktDYWJESlVIanBucnN3UjgwMnpVazZxZjZwQ0xnRnVsZDRrMWpGM1Vm?=
 =?utf-8?B?Sjk2QlFWbjR6UERVazBCKzFxWTNQTFVUVFp0MWIxZmYzc2l6ZzJLcFRXQWlD?=
 =?utf-8?B?ZVkzRWlxWmJ0dENwNlBKQW1JUi9sZmRpc3RkK2pLQ2hqTDBtWGI5bDBTTmI1?=
 =?utf-8?B?MkdEV1I1aUJxTGhZbGtMdkpTaWNtRFFlUG12dXNReHhnbms3bm4rRW1XRmxB?=
 =?utf-8?B?LzZjSzY2VGxsZ2dqVm43TVJXUjZGb0lLeGxxaThxV1d4L1R1MHpJZVRmWmZo?=
 =?utf-8?B?c2lpV2xqdlNPSGV3aWxQT1p1MG82UUlZeTNGZ01ROEdOdWZVeVZvZ0Ntenhz?=
 =?utf-8?B?c21hQWYwSzZJYnRyQitCUjN3Q1pMTjU0T1ducG5RbStuZlM4UkpiR0FyRFdv?=
 =?utf-8?B?NnlWOUFDRzNmaWsySU9welFqd25ZVEdIWmg1d3pDcitvaTBvSDE0MkhMM3NO?=
 =?utf-8?Q?6/Is=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb509c6-f191-43ac-b31e-08dd8be5e0b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 15:02:38.9733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihmyfAkYM3z3f1qfIR4zktU+TGg2WoJFaM2P5AT81WQfbBOWA9tIDp/zODNzJXv8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB10957
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117318

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBUaHU/biBOZ3V5P24tVGjDoWkgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU2VudDogZGVuIDQgbWFqIDIwMjUgMDY6MDQNCj4gVG86IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBUaHVhbiBOZ3V5ZW4gVGhh
aSA8bmd1eWVudGhhaXRodWFuYWxnQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW29lXSBbbWV0YS1v
ZV1bUEFUQ0hdIGxpYnNpbXBsZWxvZzogQWRkIGEgdmVyc2F0aWxlIEMvQysrIGxvZ2dlci4NCg0K
VGhhdCBpcyBub3Qgd2hhdCB0aGlzIGNvbW1pdCBkb2VzLiBBIG1vcmUgY29ycmVjdCBzdWJqZWN0
IHdvdWxkIGJlOg0KDQpsaWJzaW1wbGVsb2c6IE1vdmUgdG8gcmVjaXBlcy1zdXBwb3J0DQoNCj4g
DQo+IC0gTW92ZSAibGlic2ltcGxlbG9nIiB0byAicmVjaXBlcy1zdXBwb3J0Ii4NCg0KQW5kIHRo
aXMgY2FuIGJlIHJlbW92ZWQgc2luY2UgaXQgbm93IG1hdGNoZXMgdGhlIHN1YmplY3QuDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRodWFuIE5ndXllbiBUaGFpIDxuZ3V5ZW50aGFpdGh1YW5hbGdA
Z21haWwuY29tPg0KPiAtLS0NCj4gIC4uLi9saWJzaW1wbGVsb2cvbGlic2ltcGxlbG9nXzEuMC42
LmJiICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMA0KPiAgMSBmaWxlIGNoYW5nZWQsIDAg
aW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBtZXRhLW9lL3tyZWNpcGVz
LWxpYnNpbXBsZWxvZyA9PiByZWNpcGVzLQ0KPiBzdXBwb3J0fS9saWJzaW1wbGVsb2cvbGlic2lt
cGxlbG9nXzEuMC42LmJiICgxMDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1saWJzaW1wbGVsb2cvbGlic2ltcGxlbG9nL2xpYnNpbXBsZWxvZ18xLjAuNi5iYiBiL21ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNpbXBsZWxvZy9saWJzaW1wbGVsb2dfMS4wLjYuYmINCj4g
c2ltaWxhcml0eSBpbmRleCAxMDAlDQo+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1saWJz
aW1wbGVsb2cvbGlic2ltcGxlbG9nL2xpYnNpbXBsZWxvZ18xLjAuNi5iYg0KPiByZW5hbWUgdG8g
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic2ltcGxlbG9nL2xpYnNpbXBsZWxvZ18xLjAuNi5i
Yg0KPiAtLQ0KPiAyLjQ3LjENCg0KLy9QZXRlcg0KDQo=

