Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97600CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 22:55:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.92])
 by mx.groups.io with SMTP id smtpd.web11.24009.1755298542398563856
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 15:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=RKNHCSBg;
 spf=pass (domain: phytec.de, ip: 40.107.20.92, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+zqDfkSH3K9hu4aV/jqZyIodGkUatjFqMYdGMytJnSz3nnOuAycE8RxLLYNDw18Yfv6aZYw0ZZ5xhVqhXaJh57fSajpXh6ievENQuN12EhBdy+R3S6Q12JHKLODKm7fsWvwznRhnRnCZrERVFfZeYaRPPxFnXtiY/iajCLsSmmM2uPIZ2At4D6qBlgodLX1vNtGAyL67Sa8MYW7Af38eSFHLQ0AZmmBwb4HdsXEKQSC5eXJLNGvZ9BXYMyDg5Qf7Ch0I2JDmNUQgQEZWOLRTZxcd/ZCRsagUNZyK5oWiAxNFlTxRSw3hPsVfXfZqFDnb8yHXYQBlO32kH3Nyx6IOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiXRH+sjwZkFmsOIk3WBO5oLZU/+DKmL+srYoo7fXYc=;
 b=QLrePy5WH5nNMR6t3WZWWoLIJRUetClibIjvUMMmqLpb/RhvaX+ZwRpxVxZJ68bK8WQR0UXOyYPNknJc/xq89I6eKVIHoWhvy316RCFIumu7FxUhwW6TyX/sGWPBNVBJjY5RjayC9O2naBz0sBUKZ+Qcg0weNmRjotn/5EjR87DZctpnfI4JDxMGGtz8SCD/oHkJP8EqW/sQzdPAKWRMOU4Mm2E01eSuUe02ZM02xdgx3/CbyjvAte1dfE2Ezra0GuwF17EMqbgJCqb1Si3B+S1kPCvFnT5msZ4XKl/C2MMDPvlmTE+uoetn/zLqRGU/hDv2NHIhJ0myMOg9Ok/3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiXRH+sjwZkFmsOIk3WBO5oLZU/+DKmL+srYoo7fXYc=;
 b=RKNHCSBgQ8IFdOUpNvqJUb4rqhR8FFPPjusJsetPhBtgO+p1Z4PV5v42pzG11PIV3ywSwz4KqkTmU/4OHJQXBcRa/0yDiKtJ8UGiNKpdR1bUVb02WfKU7yWz1oNmWunnyXHhxSPLT0Nc878AFaVSBH5dv1jtIEONOSU0vyct1bmZYHY0Sq2KSBncgM/UCCMr1xxMOW95FafT9XlPS7HWeoVNvCHwauX6+ptNHei/ElkB9NUlD1KItSdIfN905b1lP9eLHsUdUdoV+Y8u4Bc420COnBrMDIX/6Gz9WhroRB5vMhU+TDUlXf6pNf0mtYZYil2dg6ftTBGDWWL12bTfQg==
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by VI1P195MB0494.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:55:39 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:55:39 +0000
From: Daniel Schultz <D.Schultz@phytec.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Topic: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Index: AQHcDW3nN2Ofg+vGIku09hGxrLp8kbRi93UAgAA+pwCAAR53AA==
Date: Fri, 15 Aug 2025 22:55:39 +0000
Message-ID: <c4e4f132-de11-4499-a053-a6b530fe207d@phytec.de>
References: <20250814225042.3310913-1-d.schultz@phytec.de>
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
 <AS1PR10MB56976A442C0ACF5610557FC4FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56976A442C0ACF5610557FC4FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P195MB2484:EE_|VI1P195MB0494:EE_
x-ms-office365-filtering-correlation-id: 8ba3727e-ab3c-4c99-671d-08dddc4edad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aXFQQzl0QlVmUkE1NVozMjVIbTZ5a05ja3pOLzBtejVsT3QvQ042a1d1MHRs?=
 =?utf-8?B?ZFdxYlp3UjExTFhUMjNFVWhtT2xJTHNlNmdqMm40K3EzM0hUcGZBNnZ1Nzkz?=
 =?utf-8?B?VXIyQ2tFNG9aMm1wV2phSGw1TENpTnRsMUE4Q09WMWtQazkrYTBXbWo4cWVD?=
 =?utf-8?B?VkxNbmVpR2ZwcjJpRmg3V21peGdmdGVtUXZyWllhdHlwWWtHaGlkZkcrWUJO?=
 =?utf-8?B?bGpqWVFNYkw0RUV6Z05SR2pNc1RZK1N5UVNQRXhqRFlhczRqdU9HaDQxV01x?=
 =?utf-8?B?bHZpd1YxaTJ0MnN4a1EwV0dkUk0rZVdVck0rTGx4NnVrcStmeUROR2VtWENY?=
 =?utf-8?B?Tm9RZ2xZL1l0dGN3b2h3aEtpODEyZ2RmRGZsdFZiS3M5cnBzeHpvYlZqUXcv?=
 =?utf-8?B?bms2RG91WDhFeTFaVG1LNWwyb0xKNnhxeG5FY3F0Q0FtUUdTakE4b0J2L2Fi?=
 =?utf-8?B?bTg3Tnd0Y0h3V1ZZT1FFc0IvbnZEWDdEMUcxSUI2eHR3S0FnTkozcUxWQ1RH?=
 =?utf-8?B?TG9LTGNaM25mSG9nSGh3bXp4VXR5SGQ1NHVadmxTSUphdE5sQ2pvY0pQcFFm?=
 =?utf-8?B?ZmxtZXowalJ4MEgxeXJIWjd5QUZCT3d5UmZUR2hadHFiSXZwaUFBaVdnVytV?=
 =?utf-8?B?ZmRwaVloMnYvbmIyMXpkWnNidjNiNUhBMHF1U25XS2dSdXJubDVsc2NxMDhD?=
 =?utf-8?B?TmhFQm5pbjllVTh1amtFeFFpQUtMQWhkOGlyNlZFdElaNTJ6d0Y0aithRm9J?=
 =?utf-8?B?NDlDelZYN2E4S0EzZXVPY0N6MjhpSHZHa0FoVEJPNm5BY2tNRnJuTlNSK1lK?=
 =?utf-8?B?RGpMdDlQVnNYa0lmRGhkTFVpM1NIeFk0WWMxQmVBUkt3ZnJ3Rk9nRnNxa0kz?=
 =?utf-8?B?Vy9Udnh1QlhBMFZmdlliaWdOeDRYQzdRK1IyL3YxdDR0emZhZ0t0S3J4aDFI?=
 =?utf-8?B?NEoyRTFDMDA0eDgzdjg3bGNCSERSbFdsSjBJQSt6eDlibnVCOEcxQjlmbWFp?=
 =?utf-8?B?ejIxaEt2SW5iTmRLKzFZQlQ5RG5xQnZyOThhWExKQzIzZk12RkFJVEhIekg3?=
 =?utf-8?B?NDFjZnZHUFViWVR1bmwxdGZIVmI0UzdwV0tzNTR4VEJvTzlJdnNzTFkyZ2Fq?=
 =?utf-8?B?NzQzQlJNbWxFampNZmdacEd2R3pCQ3BNa0ZKMVQwSURFTlR4UlJob3Q4ajY1?=
 =?utf-8?B?RG5VNXhIdHBkTW5HdEZPaFJZM1BSRG5qVFVPUHU2WkFmdytiYUw2MHdoclFH?=
 =?utf-8?B?MDNmQjF0UTJQM2kwN0hWODdpcDVJT1dpOVVSRzZKRXBxY1B5MHFpWXdaQ2R4?=
 =?utf-8?B?ZkVVbXhTRDhyTU5kaWFzWk1rS1IzZWNpRTJJZ2Y5LzFvZzU0L1NLdS95Y1ha?=
 =?utf-8?B?TC96ZlFvK2ZDdzAvV2lNdU9HYmpOdFFwa3N2ZVhVVkFDY3VxbWc1dDQwSnF3?=
 =?utf-8?B?ai8yZERBVnFRQWVZMHFoU1dIQ20yVWRxb2V6VEIvb25BNzMzWEFxZWthWXZW?=
 =?utf-8?B?bHFsZXdzaC9xRXdVYS91ck4xZ1VKTmlhSWtML0NwRU9PS1pyMkJWdUdMQVBY?=
 =?utf-8?B?Vjc2VlFEVVJZV1U1TFdDUzhZZS93RG8xeTZyK3F4Z2FaQ2k4b3FFNVRzZkZR?=
 =?utf-8?B?WHJaL0p2SmdTWlJ2ZmlzWTl2cVhPeDBVV0taNGlYUUJ3dVJ2NXRycVVmVWRz?=
 =?utf-8?B?VDMvSFhtVk02UHc3S09GSExHM0M1ZklmS2F5Q1NTL29zMWEzZk5kcHNBS01H?=
 =?utf-8?B?VjR1RmFidlF6Y1RveHl5S1VmbkdvRmoxam4vMnpYZzBqaXBoQVoyYk9oejY5?=
 =?utf-8?B?eVN3MCtTZGVXTlFZek15QlRFZXcwVis0R1VJS1lXN09rb2gvVk94U1VIQkJW?=
 =?utf-8?B?ME45Q1RhMUI4dTJ5QXN3c0p4cWI4dzdlTGwxRmV1WDF5cXhiN255cFgyV2lV?=
 =?utf-8?B?SDRGa25oMFUydVhkYTV3WGhYKzB6NjBWOFlxVTNJMUZvRmczQTQrOTBSSFlW?=
 =?utf-8?B?VVFOeVdLVWFRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rm9zRXc4UHcrYXQ5NjJ2eVIzNmdmT3JxbUdIbTlGVGZCSWFBaktST1ZoblAr?=
 =?utf-8?B?WkdvYkFPZkwxUjloclEwQnEyRkF1c2hWTDdPSUxYbVhvbTJJdmdzVnpSN0dB?=
 =?utf-8?B?dDBRT0dPSDJUcGRHam1PQm5zQVlCOFFWcm5NcFJCNGNVTDEvRXZVNWNXaEIz?=
 =?utf-8?B?Z0o0ZmRQdURURUJEVXVFOFRXcC9rVGJYZVlPRW4yb3BXQjFvUzlzN012cjZ1?=
 =?utf-8?B?d2NydlMycy84QTFZZUxHU04rZjdqd1pWZmRBVWZLWG12NExXWjlDWmNKZGUy?=
 =?utf-8?B?ZXdmbEZ0eDFKWExqUWNSTEk2aC9PWFZYcWhZWjhVOFo1SUF0eU1obDlpUmFh?=
 =?utf-8?B?eGl6TFlxZXlpQU9IUDY0L0Q0MzMvUTUzV1RCUllSbFdzRU16aDV6U1JmRzda?=
 =?utf-8?B?RjEybHgyaHhTRkdXMXp5UXpZcnF0MUhtUkZPQ3JGaWpPQmRrZ0NMS2NIRHpN?=
 =?utf-8?B?VjMyYlVnVWxrSHlwSEhxNFliWG95U1dFY251K1BIZHZEalpudTkvK0RlTmE0?=
 =?utf-8?B?M0hPYkpXTFhOL1FuQTFsc0QyeC8rT01XU01VYTJ2ZnhpbjRNaXAwVCtzRHN1?=
 =?utf-8?B?aUtJRHY3TWxlSXRYU01CRG9hbVcyZ01YWmYxM3pnUUQzNEs4N0pveFlva1Rj?=
 =?utf-8?B?MmJrRFZvcmM5a1FJVXFDQ2p5Rm0zUlUzQTc1bWh3aWFpSVU3dXhMS3RYZjNY?=
 =?utf-8?B?OFZYRFBrRGdLT1BXbGl4L1ZhVUNuUCt6ME9GclJUanlyNThTYk8xOTk2S0dq?=
 =?utf-8?B?YkNDeU5aeHJlQ0hDdkZIc0o2MFM1Q1U2UmFrd2c5ak93OFVsSmhQczg1dEV5?=
 =?utf-8?B?bWlQZWczQ01Md1ZkVmpCWlFRNzQ3cHRpR2V6VHZQVGgxN1lqTE8xTWVzbE91?=
 =?utf-8?B?UDdIQzBucXdQTldzbjE0S2ovTnBVNTlOK0xnREhvbGg1M3BUMThaWDlockVz?=
 =?utf-8?B?RUcxQ0dGZE5rU3lxbXB5eFJHT3V6QWJrc21iWGROMlpuaWYwMzNhQTI5SVF2?=
 =?utf-8?B?L2k2OHBOTlN2MnZ1WjRhODVGeFp2MUd2U2h2TkdMNDN4a1pPM2VabER4MDVQ?=
 =?utf-8?B?RDFxb2tENmlrQS9LTHRYNExVVVl6OWhEb0o2NUpTMUFPQURXVGhVaHdFLzZX?=
 =?utf-8?B?ZnFVbitsTUk2OHZGNG5HdTI1ZmgzL1g4NnJvK3hMNEY2VUx3RWpUZGMxc1hp?=
 =?utf-8?B?eVBGaElsMVV5YXRzRkVKZXMxZ2JxV0hNQU11a2NMLzdQd2JXeFpaeTdrNlFs?=
 =?utf-8?B?WkM2NGw4aDNxYXI1YnptaEZETGtFTzdHSXBndSs3MmUzNW5xM0JJbWNoK3hz?=
 =?utf-8?B?aFBBQkkyRVJPQjE1YmxUbXpteGpMRythZm5nUXdFZDBDTXBYbXZjNVJMREZh?=
 =?utf-8?B?a25zY1lmRXVyaU5PeTZWMWk2dmxGaGxyNEx1eHM3VnNoYndyK0VZL1FidGR3?=
 =?utf-8?B?SWZ6R1M1SGM2MFhYSVA3aEtwak1pWFBhOUpBS1AyajhtMXQ4VlNPRGFCZ0N5?=
 =?utf-8?B?bjNCVk1LVy9FVVZHLzZadUMzS3ZFSHlVd29uVEhDcXpXZzNFbU9SMldiVUo3?=
 =?utf-8?B?SW5QTGtEY0RxRzAwdHlnUGp1RzlCSWNIK01NbUpPSmpUaFA5ZDl1blZVNlcz?=
 =?utf-8?B?dTlYTnY2QytQVUh2VXBQQnFEOUJPMjVEWVE1N1hBV3pLVzNUUllZOFE3eTd1?=
 =?utf-8?B?dllJZjU1UXJHNmJZL0ZHSVFoTTRpVVVqTFZCbzNQbmRQZ3orT2RuYzJpMWl6?=
 =?utf-8?B?SmNpN01YaFhUMEtyTy83bzZ1MUtXR1p6UWloM0NqUVA1Q0FTYTVwZCtiNXFC?=
 =?utf-8?B?dGI5MncrWVFURnZaR3BDcE5FYmVTRFJLMG81N2szc25iR3NjT0trMmpQSjQw?=
 =?utf-8?B?blpXVElVOHVVZzYxRkhjSWpBeHgvbGxEaUJoWlF6amRla3VjZVBmS0RSZHFq?=
 =?utf-8?B?b0pUWkxzb1RHcVBucDljYWdzUmdWbW0ySTRicVl5UUZVQjBMVmR0Vi9GQ1Jz?=
 =?utf-8?B?em9kcjJCdVhGVWNyZHpheG1rOUNoQ0JQbElvSEZpMVFVeFFOazUyNkNhK2hZ?=
 =?utf-8?B?T1o5QVV2WVkxZC9rOWZXUW8zbHJ0WHBaOWlCR2dNdVFraHZBazRESURucjE4?=
 =?utf-8?Q?TPfo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AC7B14C5B9DA74DB1C336323A569B55@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba3727e-ab3c-4c99-671d-08dddc4edad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 22:55:39.2641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7/vPA+I1hDGJu0oxEwaEdSnpb7V0B3nxV8Ed/eK0QIWg0TifKZrKkh6RY4juRfXFdF+YWrEDDN7YLfaTPXrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0494
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 22:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118977

d2UncmUgYWxzbyB1c2luZyBtZXRhLWFybSBhbmQgYXBwYXJlbnRseSBURi1BIGlzIGFsc28gZmV0
Y2hpbmcgbWJlZHRscy4gDQpNYXliZSBpdCdzIHNvbWVob3cgcmVsYXRlZCB0byB0aGF0IGxheWVy
Pw0KDQotIERhbmllbA0KDQpPbiA4LzE0LzI1IDIyOjUwLCBNYXJrbywgUGV0ZXIgd3JvdGU6DQo+
IFRoYXQgZXJyb3IgaXMgc2hvd24gb25seSB3aGVuICI7cmV2PSR7UFZ9IiBpcyBzcGVjaWZpZWQg
KHdoaWNoIGlzIG5vdCB0aGUgY2FzZSBpbiB0aGlzIHJlY2lwZSkgb3IgYSBsYXllciBtb2RpZmll
cyBzb21ldGhpbmcuDQo+IEZldGNoaW5nIHdvcmtzIGZvciBtZSB3aXRob3V0IHRoaXMgcGF0Y2gg
anVzdCBmaW5lLg0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+
PiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWogdmlh
DQo+PiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNSwg
MjAyNSA0OjA2DQo+PiBUbzogZC5zY2h1bHR6QHBoeXRlYy5kZQ0KPj4gQ2M6IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyB1cHN0cmVhbUBsaXN0cy5waHl0ZWMuZGUN
Cj4+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSBtZXRhLW5ldHdv
cmtpbmc6IG1iZWR0bHM6IFJlbW92ZQ0KPj4gdGFnIGZyb20gU1JDX1VSSQ0KPj4NCj4+IEkgd29u
ZGVyIHdoeSBpdCB3b3JrcyBvbiBhdXRvYnVpbGRlci4gQ2FuIHlvdSB0cnkgd2l0aCBiaXRiYWtl
IC1jY2xlYW5hbGwgPw0KPj4gYW5kIHNlZSBpZiBmZXRjaGluZyB3b3Jrcy4gSSBjYW4gc2VlIHRo
ZSBTUkNSRVYgaXMgc2FtZSBhcyB2My42LjQgdGFnLg0KPj4NCj4+IE9uIFRodSwgQXVnIDE0LCAy
MDI1IGF0IDM6NTHigK9QTSBEYW5pZWwgU2NodWx0eiB2aWENCj4+IGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGQuc2NodWx0ej1waHl0ZWMuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4+IHdy
b3RlOg0KPj4+IFRoaXMgcmVjaXBlIHVzZXMgU1JDUkVWIGFzIHdlbGwgYXMgZGVmaW5lcyBhIHRh
ZyBpbiB0aGUgU1JDX1VSSS4NCj4+PiBPbmx5IHVzZSBTUkNSRVYgc2luY2UgdGhpcyB3aWxsIGdl
bmVyYXRlIGFuIGVycm9yLg0KPj4+DQo+Pj4gRml4IGZvbGxvd2luZyBlcnJvcjoNCj4+PiAgICBb
Li4uXSBGZXRjaEVycm9yOiBGZXRjaGVyIGZhaWx1cmU6IENvbmZsaWN0aW5nIHJldmlzaW9ucw0K
Pj4+ICAgIChjNzY1YzgzMWU1YzJhMDk3MTQxMDY5MmY5MmY3YTgxZDZlYzY1ZWMyIGZyb20gU1JD
UkVWIGFuZCB2My42LjQNCj4+PiAgICBmcm9tIHRoZSB1cmwpIGZvdW5kLCBwbGVhc2Ugc3BlY2lm
eSBvbmUgdmFsaWQgdmFsdWUNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBTY2h1bHR6
IDxkLnNjaHVsdHpAcGh5dGVjLmRlPg0KPj4+IC0tLQ0KPj4+ICAgbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYiB8IDIgKy0NCj4+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxz
L21iZWR0bHNfMy42LjQuYmINCj4+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2
aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYg0KPj4+IGluZGV4IDg4YjUwYTQwNmIuLmEwZGM2
YTY4OWEgMTAwNjQ0DQo+Pj4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2
aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYg0KPj4+ICsrKyBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmINCj4+PiBAQCAtMjMs
NyArMjMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0NCj4+ICJmaWxlOi8vTElDRU5TRTttZDU9Mzc5
ZDU4MTk5MzdhNmMyZjFlZjE2MzBkMzQxZTAyNmQiDQo+Pj4gICBTRUNUSU9OID0gImxpYnMiDQo+
Pj4NCj4+PiAgIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+Pj4gLVNSQ19VUkkgPSAiZ2l0c206Ly9n
aXRodWIuY29tL01iZWQtDQo+PiBUTFMvbWJlZHRscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1iZWR0bHMtMy42O3RhZz12JHtQVn0gXA0KPj4+ICtTUkNfVVJJID0gImdpdHNtOi8vZ2l0aHVi
LmNvbS9NYmVkLQ0KPj4gVExTL21iZWR0bHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYmVk
dGxzLTMuNiBcDQo+Pj4gICAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPj4+ICAgICAg
ICAgICAgICAiDQo+Pj4NCj4+PiAtLQ0KPj4+IDIuMjUuMQ0KPj4+DQo+Pj4NCj4+Pg0KPj4+DQoN
Cg==

