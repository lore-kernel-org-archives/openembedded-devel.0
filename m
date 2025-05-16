Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4F1C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:56:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web11.18291.1747414565474836442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kGsR0veU;
 spf=pass (domain: axis.com, ip: 40.107.22.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwqDvqMxcscl+km/eOc30tCsmhvCAJAMndhbzyOT89XSy+ieg+FR4oFA8fH4deu/y+7AIFO7+KRaLgImOWr9pWIVmx5FOXRelMUv2RB/Lz5XCO7BSKa70a2qpO+RJU0KVMUHYaDvLdTtpLy5OEaoFW8qR0yY/eXJUKAO3Qwii57jBtM+A00Qin9IAAi5b2T7g6gkeUg5OpO3PycnUjn0Sa5st6/XJqV5DcZy5GkFt5b04jOCpTsRjzTqqJ9aTrgV6n+jGq66BcyFeu3hzcbupOgG/XgUDQBbeS574Fz/TsPF1MNwKfOiBugUSs+L1ZxRfsRX1DZsEJa4ZUEWaMOvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcF1+NBN7BFPymIDBIof3L/jg4yzM4EGMRhYCFwkED0=;
 b=Jqx/awY5L/g3wsqIC4xAGhqySfqdcNOBRkRU+aiyMCEkH/GmxK7mHz8ih17J4V12kKcKOKUVN2i9QYmnpxsZIlFYPg0EFXnl1KYbrAcOPh4lqypU2A/+Nr4d4de/IO5mwemptj9PN8VDPcuOFm1c9nZZWJUlmN86xkP6RydI4EIQH/W6KyujqxdzzWwb1ck5YXgt+JHl/Rd/bu8JY8LTKNOnW3RWqcqWQIqtk9cm9OQupE2we7pVCuT9f96CKmLgrHFzHceQVlo2FhbsKAhxwJe2o4aMEGub0wXIT3bf6RJFSs3otcDtwKQlrkIOb5qsNjecn87LNLxUsDZV2uUuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcF1+NBN7BFPymIDBIof3L/jg4yzM4EGMRhYCFwkED0=;
 b=kGsR0veUb7Iy9SO4z+5aimfESQtxo9p9KHV1s3t5WwFGx72RKYOvkrss/7Hnr6CY1IcoG5J1uTNlH4FigLk2Veh/xXl3BO/djWuV5B/J4V3Q0UVeiqpBPoA7LhzbGOjhOYpyIVnK6Jcx8feYVJQNoVay0a9PrvWPdaXl68F9Wjw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8490.eurprd02.prod.outlook.com (2603:10a6:150:9e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Fri, 16 May
 2025 16:56:01 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8722.024; Fri, 16 May 2025
 16:56:01 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] libsoup-2.4: Add recipe
Thread-Topic: [oe] [meta-oe][PATCH] libsoup-2.4: Add recipe
Thread-Index: AQHbxn1DICF1SCR3xEmQSx9i412fzrPVdrjw
Date: Fri, 16 May 2025 16:56:01 +0000
Message-ID: 
 <DB5PR02MB10213F7B7704CDAFF96B487A3EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250516114435.1936780-1-pkj@axis.com>
 <CAMKF1sqwaZy-+-nOhF4GQA+KA_CtszOZgg6J8rh4h9nNEdP9gw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqwaZy-+-nOhF4GQA+KA_CtszOZgg6J8rh4h9nNEdP9gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8490:EE_
x-ms-office365-filtering-correlation-id: 7524cf81-0eff-45fb-9be1-08dd949a89f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YnltUytuS0hYZHJsbGlDNllHelhQMTlpb2gwaFNRZ2VMN3d1UUhyRi8rN3Fy?=
 =?utf-8?B?Ri9ZTzdzV3ByRytOY3ByS25HOStoVGcvTlE1eGZkbjFWNlZXUFpaOUsrSEF0?=
 =?utf-8?B?eFBJT2ZDS3FibmlvVGw0M2N5ZFdLZUM5MnUwZi92dXpGRFFOVXNXQ090RmtW?=
 =?utf-8?B?WGI1anNvaTFrVC9VREVJVE9XdkVSeXVCaFB2Wk5KUDRkeVIvcTJRRnJocG5I?=
 =?utf-8?B?ZDdqeDBwZ2Jsc0trY3RHZ0Vab0JLbCtSZzg2UUoyMVlvc25PNFlKOUlUcXk1?=
 =?utf-8?B?NHhVQ1gwR3FWVmM2TUZIcVcxYy9wQ0Z1WGZoNHZQWTFKUkhLclpPcUlRbjht?=
 =?utf-8?B?NVJXTDlsOFRCeTJybG5nTWFOK09DQjJlTWxmRVNrc25JVUZYWFA0RWF4bkcr?=
 =?utf-8?B?N05hTFlGWWdVN2d6eFlrQ29peWtISkxyWVZxcnlHVHZ2RkNuYzhKaGJCRGdJ?=
 =?utf-8?B?dEdUa21OL1ZwajRJYXZTanF3NVliUHRXSDJzQ1c0Vkl6a2ZRLzh0OEV2TGRr?=
 =?utf-8?B?MytPMVExTFJDZ0FoMkF5c25FMXp4cStuOXhLSWhKSXlQUnlIRkRLV2UzSDRp?=
 =?utf-8?B?NStFT2FNK3dCOGZJUFcvZWovUm80V0VXT2k1N29zbGZPdmpMTnJxZXY5cytE?=
 =?utf-8?B?MUdsTDR4eVhLMno4OUwzcGdBRWJBYmFMSHlrL25wUVpKMitxc29tNk9uSGpl?=
 =?utf-8?B?T0dXZlFyZ1g0TFZZMlJneU81ZngwWkxRdENhaEpzeXcrYWR0cFY4Y2xZdHMx?=
 =?utf-8?B?Q0ZlL1VPRUxScUVWMG5uOWRhc3l3cElrdUFEZGhUNU9KMXM0dEpYaFYwcE1R?=
 =?utf-8?B?TFZLZnZodUJvcEI5dStHeEJaWFdIM1VDN0s3cjVvSUY3WTJrZ2R6TzRUSTNG?=
 =?utf-8?B?dzFxeUo4V0NzT1JFak1hbWowN1RVcUdxSWlJdUl2akR0dll4UDRDK0E2UzBl?=
 =?utf-8?B?MUI4cFc3d3JNZDBuaGZOU2lmSzY1cDJYbG9QbU1PK1UyQmRkNGxEVUV5Nkpz?=
 =?utf-8?B?MVprQ0JhRllsWTFVYXJRQlorbVlDb0xCakdNZTR4T1hxS1R5ZEw1VXh5Um5a?=
 =?utf-8?B?UmZ1anhiYVoxWm9tK09MQWZ5WU0yOXptUkl4THJWOEtVRXRCeVVIR205cTZH?=
 =?utf-8?B?aERQb1htcEY4aENzNG5pQmZkTFlXclhXRXNSQXpad0lCd2NHSlB5MmdyWExI?=
 =?utf-8?B?T2RRcXBtd1o3V1pUNUdCM0R5d1dJZ083RHVjOXE0NUMxODh0cks2KzQ5TkIy?=
 =?utf-8?B?U0RkY0tRMHliV1F0RjN3MStZMmNXR1ZkWW1OZEpNUkZLV2dOOHZwSEh2cnlv?=
 =?utf-8?B?U09aOUhpcUdzTytIb3ZQaDhjKzZWVzBELzlsVm9QOHliM0ROVndVemh4SG9E?=
 =?utf-8?B?Um5XeElrdWJUY3lZQXIrMUo1QmN6U0MvV3Y3Rk5yeitSazg1cDJQU28xVE9X?=
 =?utf-8?B?ZVQ5RUVWZEF6YW9xcHc5Tmo3Mm1pM2hPaGo4aGZ6eVZGcG9wa25zZXE2MVZo?=
 =?utf-8?B?d3BxZ3RFZ0l4MjE1eXd5NGF6Vld2TGJlaEg5NW5pdExQYWNPMnk4N0NUVGd2?=
 =?utf-8?B?TFN0VEV1TkR0UUhDMndwcTZGTDhsVCtRV1lFQkRqUWtyRFA4VzhMbkNuZWFv?=
 =?utf-8?B?WmJBejZURWxma2doeGJhK3RZR2RCcTJybU5EVks4N1BDcHo5SFd6L0t6bUpa?=
 =?utf-8?B?bjBYQU50eDFKV0NzS1lrZUk4MGNsdkMzRVppdGhVam1wQy9XbVJpSk9LeWk5?=
 =?utf-8?B?NGsyTXRNR0kvU3Z4aHMrT1NHQ0ZNMncvQjN5dDUxdy9ZbzJ6LzlraG9vUmRM?=
 =?utf-8?B?L0x5YW50bzRmTGtjb25mdE5HMEF6TVlJdzkyOVVPWGR2R0JzQlN4Y1NZZFA3?=
 =?utf-8?B?UE5kMlZ6NmNjUkJCbGN1RGtLVXZFc0ZWTGVNTE9tTVhGb0hPYmRacFV5YTZ1?=
 =?utf-8?B?YmVCWFRFdU55elRaemJMUzFyQ3RZb2tiaDhRNytscVRGelZrdy9ud2Y1cS9W?=
 =?utf-8?B?QVBLTW00T0FBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z3ZUVjZWb0RvQm45amdoK1kyYUpOck1oSXhtTTArUVY2cGJWQzJjN0JxdTNw?=
 =?utf-8?B?U25XNExyQzZFVEU2R1J6Z2pZRmJGVm1ZdzBrcjRrQWNOU0JGMWh4YWFlRWVj?=
 =?utf-8?B?enNEWGpEVENBVDRQcU9zUlI4MS9Rbzd0azhGWVlTMTFIcFB6S0JBdjZsRTlB?=
 =?utf-8?B?UEhPblExYmpHRFNEQjU1anRCZDhCdmwrbmQzK09vWk5Zc0NCeDRwMXF0aE5O?=
 =?utf-8?B?RXdwZU1ZZVV5R0ZEN290bnhHVi9hL2JYclhIcTFkNHh4eUhma3RMTjluQnlv?=
 =?utf-8?B?VEtmT3hnUWFKOGJZdFcxWmlCK3U2TUVxWllIVmdyaFZoUlNTYkZiNHFTSEhz?=
 =?utf-8?B?cjlXd1RSSFpKVG04WTdPOGJTMkh1WUV5N2MyQUZqUjdISTMxRWdWMTEwMEVm?=
 =?utf-8?B?VE16Nm5OMC8rNVZOT3krOXArVjR1Wm5jWkE1THZnZHkvbXNvaDQ1ZEw1RjRG?=
 =?utf-8?B?ZlppbkVVa3ROMXdSMC9RaUtvZTZnWlNSbXVwKzRPcFovaG1mclorNzBVdDVy?=
 =?utf-8?B?OGhSaGozcHJHN2RaSmlDZHhmS21iS2g1bjczZVE1TTRxSkNobWg1SUZjVmZM?=
 =?utf-8?B?TmlZY2hEbWx5cjI2WThRdlRNaEFHQTc5eHRRRjdRYzBiRis3Wm1rWlJNcG9m?=
 =?utf-8?B?K05KaTIzRERLVE9zVmF6OWx4eGR4OXp0eGlsUXdjZDZQQWdkNnd5d1pXVGZO?=
 =?utf-8?B?dVd1K2toTXJEOVhYWW1GTU5uVVVXd2cwZ3o1NEczc0JrWG14bUJSZHZmNmRC?=
 =?utf-8?B?dzI3SVVLZzY2a2dZbHRBSHhOU0M3ZGgzc1Y1ZjVMK1RjK3NkY2xLck10VDF1?=
 =?utf-8?B?bFZySmlIbUk1c3V3YnJuMmY3ZWNPZDVZdFV1Y1p2Z1VXR2xMWHo2SnF5UFNq?=
 =?utf-8?B?WDU0NXBZOEhYd0VQWGNFS1psSDlMZzdwMTQ5aElKWGlWbzZKY0hndTFzcUdU?=
 =?utf-8?B?WVNHaFQ4VlRycys4dkVRalJsaFRveXdkQXo3REdZa2Jmb05rS1JBTHVtUHhy?=
 =?utf-8?B?RW9aSzNkU2xGK29hS2J3ZUY4K3VrTUd4U0VyU29IUWdrV1dvQVkzdWh6NkFo?=
 =?utf-8?B?ZkVhQUJKQ3JaQUhnaWQza2l2TFNIVHlDVktKUks2RVdxWEVDM0VZWU40cG5j?=
 =?utf-8?B?d0lRc1hERGx0RHBkcXZrbVNHSDAxM0tFWnVPYjRrZitBTGJQWG1jRU92ZC8w?=
 =?utf-8?B?MDJTQ2F5T3VRejlJeG1wZzhzdEpvRVlDVFJQYlpWby8zM0crNUEyNng5MlNs?=
 =?utf-8?B?Y2VrTGpGY3lQeEtYV3JmQXh0bHJZN0NWbXNOeGhlZ2hNNnVZbWp2bFBmYkFX?=
 =?utf-8?B?bDBCRzBETFNOSmw2SktiS2JqeFlqb251WGd6VzN3aVp2dTdrdkJzZDZ2OXFj?=
 =?utf-8?B?Vm5wbmJtV00vWnhScXpFUG8xSDhGbGpMbitoQjBURXAyeXdCcWlDNTArenBq?=
 =?utf-8?B?UlBqd2pSWitMbFFlODJvS2tMRFpuVGxRM1pJanlDdWd4RWNpaVlOQTgvZTNT?=
 =?utf-8?B?dXh5aWh6WTh1LzF6bW8xSFkxUmt3dTU2NmdKd25KdGMzcnlRQW9XVVBDZ0k3?=
 =?utf-8?B?NEQ5Q0pGMkRFMytUdXYreG1paHpEZm1mcFNMeFg5VVEzcWhsakIxWVRidzBS?=
 =?utf-8?B?Tmx6T2xIei9JZG9kdk9DVXZrVUhmRGFBenYrTXRhNlFUK1grT2szSW1UQ2lr?=
 =?utf-8?B?MXhGUHhHVGwzUVJLQnZWdFV4dTl1ZDRIdlJFZ1pvTTA5QW1QZk5HajZmVEdk?=
 =?utf-8?B?akNzd1B2SGtvV3FyUWtCMnVaTXBKQmp1UENJSm9uNnRkb2lzMko4anRqWG9h?=
 =?utf-8?B?WEliSGZpa3VhK2M3bWYzc2d2NjJGZy9qeHQ0R0RZNy9pRHMrNTI4aG9uY2M3?=
 =?utf-8?B?RndXMmIwUS9wQXZOZUpkSjJpa1lTMXFpQldhZFNvelFhQWR6MnFwQXd6N2d3?=
 =?utf-8?B?NE1ITWl2OHJzcHJCc3ZkTFNVSFVseFVMaU5jajM4WWcwOHdVaUdJemc5eStR?=
 =?utf-8?B?TnJ6WSs3QXd1ZThZTTFlWTcwYXh0N3NvcGdLTVcyTXUzV3JMNm5WT0E0aS9K?=
 =?utf-8?B?aDV3VE9XRVIvZ3UvWjBtZ3ZiQWN1M043N2V5RXBhaS84Rlpndkk0MmJEUFp3?=
 =?utf-8?Q?0KOU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7524cf81-0eff-45fb-9be1-08dd949a89f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 16:56:01.6172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOdGoXxPsHtHQ79EetoUpu2JqNOffyCt74WQJ3F4AMyI2H+9zSX/YNkcWqYCTnK9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117436

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTYgbWFqIDIwMjUgMTg6MTENCj4gVG86IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21l
dGEtb2VdW1BBVENIXSBsaWJzb3VwLTIuNDogQWRkIHJlY2lwZQ0KPiANCj4gVGhhbmtzIGZvciB0
aGUgcGF0Y2gsIEkgdGhpbmsgYmVmb3JlIEkgYWNjZXB0IHRoaXMgcGF0Y2ggaXQgd291bGQgYmUN
Cj4gZ29vZCB0byB0YWtlIGFuZCBvcHBvcnR1bml0eSB0byBtaW5pbWl6ZSBpdHMgdXNlIGluIG1l
dGEtb3BlbmVtYmVkZGVkIHJlY2lwZXMNCj4gSSBoYXZlIHNlbnQgZmV3IHBhdGNoZXMsIHRoZXJl
IGFyZSBzb21lIGhhcmQgZGVwZW5kZW5jaWVzIGxlZnQgdG8gYWRkcmVzcw0KPiANCj4gIHhmY2U0
LXdlYXRoZXItcGx1Z2luLCBsaWJyZXN0LCBnc3RkLCBsaWJnZGF0YSwgZGxleW5hLXNlcnZlciBh
bmQgZGxleW5hLXNlcnZlcg0KPiANCj4gQWxsIG90aGVyIHVzZWNhc2VzIGFyZSBlaXRoZXIgbWln
cmF0ZWQgdG8gdXNlIGxpYnNvdXAzIG9yIGFyZSBwYWNrYWdlDQo+IGNvbmZpZ3MgZGlzYWJsZWQg
YnkgZGVmYXVsdC4NCg0KT2suIEknbGwgYWRkIGl0IHRvIG9uZSBvZiBvdXIgb3duIGxheWVycyB0
aGVuIGZvciBub3cgYXMgd2Ugc3RpbGwgaGF2ZSBhIA0KbnVtYmVyIG9mIHJlY2lwZXMgdGhhdCBy
ZWx5IG9uIGxpYnNvdXAtMi40LiBBbmQgaW5mb3JtIG91ciBkZXZlbG9wZXJzIA0KdGhhdCBpdCBp
cyB0aW1lIHRvIHVwZGF0ZS4uLg0KDQovL1BldGVyDQoNCg==

