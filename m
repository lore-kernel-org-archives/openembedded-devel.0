Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2023FCEEA8
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:12:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43882.1772021532121860455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PBuhbdG7;
 spf=pass (domain: siemens.com, ip: 52.101.65.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyMFYnjlnW0ymhrZMSP+FnEuitMRA9FviiTaF9w7hu/h/7sCJtgRIerR+pRRe0UjWoWYtlIeF45W1RA4vJGbsL22Fz8Q6cR3rawpcZ0oRgN9vsmhK48ikrsCKOqMb1VrsfdPMlZrUWfehrXyvE6QLpxaxlbvt2vr61OqG/RgLr8uR+O3MTXwxBBa7OAIIF8z1cscG+jAW+pLYDa/wayvxPQm1Hr1Y1khGApwJvtXI+gW9X4AtMbc33QEdbKWJQSguH9K0o/Wi7Rzixct4Rr1ynHY3exiIPVfemB3WGI2mIhelAqy/p1c489WjF3etUoUrzpU+10twVQ3OfWVIay/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlCLqvXiueUi+JJItVwX+40Cri8h/5Vc/Bfd3ax+Sno=;
 b=D+ltmGaFy4bPJ8VQjXwqaLzHrpf6oGHB7NODd13jkisJpcYgygAeGGzbV5mxCXD4BR0MAGXsK0CGackR5CsO35AFFSkBRkv40sgOg40LV/7dvmuMT9/H+BTBZYqUNjG4wpGTaveh4K+dpoeOicas4XPEBJAnVUv5nW8MVy9QsM0MUAsmsUsFjG1076x0VX65eWzjh7U59KW4Ab3tDVVcq3Vre1mTA5H/3TVqGjce0oMT0mRVy/TekLnN28rlKQMepjNRoeV1Wawmiv1GUv34ZqATfYHCWTED523/AtLgLUwoJS1riOJZSZbR44/+F4tx7HZBzUbQdCoxxvWv+S2NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlCLqvXiueUi+JJItVwX+40Cri8h/5Vc/Bfd3ax+Sno=;
 b=PBuhbdG7Pxktptm4EkwHKOUvv/8jEvIMN4UijLHI1brHeAaGppNSz9jRY9gk3JRUxGE8EMQKdJzi6dDgmS1wfdMPLlnsAbqFP0K9MXppmP/Z7R0J0a7Qpd+Lqc3xLvjIZtPYr7SZ4mbRG8RMn+elfj1O9QcMSVL7eMkIetKsY40tI7xEfz2v06JJDZAGIAlGPXG2jnFehIivrp2AETnV8i+iVwSeXAQmz68fMPqyNNl4sBZR9ggTgT0YvMZ864mBjcqANul5ZW5wF5lGUvFS3xS1Ep4Z+G5HuIPgYFdBHHOzTrmSFhwqb7e2KaJ5BHLjnmzOo94nZE2pkD7zQ2rtcA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 25 Feb
 2026 12:12:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 12:12:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] CVE report - master - 2026-02-23
Thread-Topic: [oe] CVE report - master - 2026-02-23
Thread-Index: AQHcpJvP0zIKQxkEjUGGQvkHgifr77WTVNUAgAABLzA=
Date: Wed, 25 Feb 2026 12:12:07 +0000
Message-ID: 
 <AS1PR10MB5697E46664E7BB655C2E0C8AFD75A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260223080942.2282331-2-skandigraun@gmail.com>
 <08f026da-7cda-47fb-984f-6a7c8103ee9c@gmail.com>
In-Reply-To: <08f026da-7cda-47fb-984f-6a7c8103ee9c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=57b506f6-5511-4b14-9f3e-effda10db07d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-25T12:09:39Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3640:EE_
x-ms-office365-filtering-correlation-id: 5091a992-e712-45a2-1fc8-08de746718d9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 Un/6NvFYoR2vK8jKSfvnKZU7NC4sHkQp6Od45RkaycQGUaeqeZB6QRFOX2CVe05OLSO8K/vQD7PcAtwaU8ebQ/cr5dB3/NIMVzS38o6n4fFTfLEAnuMS+hKBO+8AE1bVwjNj2Q4E3/sS78Cs4QSR0KdnPn1PoN7CxfBTOkF8Rf1mIODPFMG0oKew486KbHZdbozKiuEMQi8E+NMt3NiW1aBJayJsUynVDJNbJAsF1Uo2s6peSZrlJp8QrOQwlq+GRV1FCF0ukK4b2xaqLrJQe3aHCThgadmtV+BbfoPXFeE1nNuKmcQ2qWZbOg3ZcKiNNYfol+YZASUeI+r4HIDwKosLAzQkcC+bj6gSj+RDwMvBdAmkHUX3gFDKQglsKikquUu+ttzN882ldas3KJ/00pBltJILOob93VpXawARkrdeby6pVNXu48mfHfC/h7CFTyGqFafkbxjjzyQO8kBrwUPm3eJxmOyz483M6WwiCmBKmc3F63/mRK0xxr3dkfO6N4oxnaU9xj313Zb81PSTc9tIRHOMGLD97R0+wthiC8bv44iDWjmKRM+9UpfE4bIBhPfy1phfyZID4EZPBzrQkWxOwlYkpALJKXtJFVvNvKTc9DB1f26X/h+cI06NG6aaTod1sihR3GUpx625Gq7PRh1ajQ2VAOM0lCtt/UY7NGWP0Yoo745ujTjKiGx4SINXV0OmatKuAbClefIgumeATw4DEaEv17RUJLWJUwxCTCAVaBPySJ/pjlP5n2r0DVQB7hOH3qZwJR4AVtXXu4unsPcWHSTAvDx9bixdOHQ5AJA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MDJ1YlNJaXd0dTQzczBhSTBMQWs1bElWUWtSSHA5VzBPZ3FyL1RMRWY1UEtE?=
 =?utf-8?B?UnpuY2V3eitBVHU4S3Y5Q05xUjRvMEZYejhsR0RTbzVwWG9haU1PSW5HTmRy?=
 =?utf-8?B?Q0JoaHVXQTdGdVFyWEZUMXdaQVpGRGxNNFlXdjZhajhBNjhUWDRUUG83R0l6?=
 =?utf-8?B?ZytzT3VTb2U4K2FxblJmakJRWWZxVmVIV0Rka29JK1JRei8wangzK2ZETDRW?=
 =?utf-8?B?ODl4cjRYMlUyS082aDFmZXBrRWxSa1JpKzdsM2dMNHVGVTJHWkZkcTk2VjFY?=
 =?utf-8?B?WTRFR3EwckNZa1JuNkFJbUlEOUs3Rko2WTFmYmE4dUU1ZkgrRERKMDlxUDln?=
 =?utf-8?B?MEV3NWJvdVgwZXYvTlo4d1AwUTlCTnc0aVhhNkt6TFkvdWZnaXJDSVNiSUNF?=
 =?utf-8?B?YkJpaE52aWszcWEzc29RNUViSllDSFRETWxub1hHOGJhRG9nYnZZc0xOT1lU?=
 =?utf-8?B?ZlIvV21CMVNIeC9HRVl2V1B4VElXbmR3WnlORmhQZnd5WHU0c3FGYXd4QnU4?=
 =?utf-8?B?c0xHQldxMExGLzNvY1QwZHloWkxRc2hwblQxYmxvY2NsOVk4NTJXcHQwUnRR?=
 =?utf-8?B?cmswNHpVQmllcXRDVEkva29KYXAxSDV5Y0NYYW1QeGJHdzc3UkYvcEtPNE9C?=
 =?utf-8?B?OHdJQlZQSSs2U2hQZTZVL1FqRE1lQVZrbytoK1FUS1ozbENvZGJVaDJOUWQ3?=
 =?utf-8?B?K05FbllxczlBZzYzYjdOc0lNMGJmZU1nUThEQzBoZGtUaXE4RXZhQU4vd2pa?=
 =?utf-8?B?N1FpWlQwbEFoRGJIRTU1MFJTWmQxV0g4dUVyTzJCdXV5akJhbkpjVkY1V2tT?=
 =?utf-8?B?cWtqKzhPYStWOVdITnhJOGloc21RZlkxL2EzMFpiZG1nNUVTUE8zMTRmU2px?=
 =?utf-8?B?cEZ3QU9seE5TN2dWRi9tVDZTcndFZ2kzRld1R0ZkMTRZVkQrajl4bm5TZHNZ?=
 =?utf-8?B?SFFhQnAvaDllMGVCTWJPa2dPZStyMW5YbkptcnVobTRRRXVJTExSd21MWmh5?=
 =?utf-8?B?YXFiaWNSYkNMWERnL014OENzQkc4WE1IMTBKMEk0L2NpZVZNbjRQUStNQW1p?=
 =?utf-8?B?MWtna1UwK3dDaXlRS3dlem51RnlyT0VxWXJyMXptRkNNZWpMaDYvRitvbVVz?=
 =?utf-8?B?VnBnWVRKRzBuRURNTkp1Rm1DT1pjRi9IK0lXRW5VakwzYWJmNnpyZXdIWm52?=
 =?utf-8?B?cjJrdVVWWXJLaUpOc2J3M2R4MXZXRTd3VE5YcHd4ODBTdDg3bEdUSHdXOFpB?=
 =?utf-8?B?OFU2d08zZjE5SjBMckhORnJxbkhOUUw0dW44Q0lueVR3SFg3Tit5YS9hQmU2?=
 =?utf-8?B?OElnZll5aGNxZUMrcERQM1ZrZW1rUnlmWGZ0MjIxTnNMbjE0YnEwajU3c25z?=
 =?utf-8?B?bmN2aWZ5Z2QrbUZDdDAyQXcrcVlJbHdCcWpyZFFsaFF0cWI0RitNRTg3ZmpU?=
 =?utf-8?B?cFpSR1ZvREJjVDZ3Y3grV0dEcnAyUTdLYkl6VjNBMHQ4cXJmVkYwbC8zRFVC?=
 =?utf-8?B?VS9HVUpaTVNKZVFVZkVyd0xvYnBJaVZBVTZwRTMxSGN2ZEpkcEQ1b2M4Nk8x?=
 =?utf-8?B?TlRCc01VVlVVTHB5ZzZtcE94bEFWRytMS01mTk9iZXNHNTAzRlRLYVlNaU5t?=
 =?utf-8?B?U0cvSWYwSVRXQXcyWTZQQzZpNHczcWUxQ1JpZ212NXhzUk5JS1JFVTZYU1Qz?=
 =?utf-8?B?T2VuYjdCU0NEYVk5dXZoOHVUdDIzWjdrUEU3cUl0OGxFeTV1U3AyT2o4alhO?=
 =?utf-8?B?Unk1b1YzR0NkdzVTckRoZFdRb2M5cGJ3ME5MTlN1VElIa3IxSUpONWRkSjIy?=
 =?utf-8?B?ZDMrM3lhdjBiSTFzc3hsb29BVlI1dGVHUEYyWEpWYmhvalVOdVBDUUdRY0V3?=
 =?utf-8?B?U1UzVUpIYndyMko1MDdidXpYM3pwKy94dm5kYTdiSG1ZZWpvUVlGZkNJZWVU?=
 =?utf-8?B?MkthaURNYVpweUNKLzl1bDNrUktQeXdnZFcvUS90WVZCRzRaZk5hUXcrUHFa?=
 =?utf-8?B?TU40QzRMemk0MHhjUXk0RnltNFAwMVZhajVTem52WUdaZEVYbUMvODA1ODBQ?=
 =?utf-8?B?ZnpUekFtZkFiYyt1RGRNVmFkR1JzZVl4dCtuVVBTNVpaY1dZa2pDMHJlL2lC?=
 =?utf-8?B?REUxa1ljaDZiMmpsZjdPRWhiMnd0WEs4VGk1K3dsQjgwWFZXVllSRWY0NkNK?=
 =?utf-8?B?bDd4RUVkK01tUkcrYlQxZnF3ZUc1THF4ekQvWnJsQXFVRUE1VnZramZrbnlE?=
 =?utf-8?B?SlNsek5CQ2Jqa0tyZ1ZIZWw0NFZDYlhQUUgzSEc1ZVR5Y3dySHBpQi9XbVlN?=
 =?utf-8?B?UmYwZ2dXYW9Zbi9XSElyaFVuUUVmbWVQbFZUb2lDZ3pURUhZUEV4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5091a992-e712-45a2-1fc8-08de746718d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 12:12:08.0383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KSnBukHtAHwjOrXS1QPrixKh2pXjsdXpFO2LEltzCycfFeYDtWBMsq5/Ol/aMV4sWwGHtqiCchZFTiqyG5gIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3640
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 12:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124651

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEd5b3JneSBTYXJ2YXJpIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjUsIDIwMjYg
MTM6MDUNCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFN1YmplY3Q6IFJlOiBbb2VdIENWRSByZXBvcnQgLSBtYXN0ZXIgLSAyMDI2LTAyLTIzDQo+IA0K
PiBPbiAyLzIzLzI2IDA5OjA5LCBHeW9yZ3kgU2FydmFyaSB3cm90ZToNCj4gPiAgLSBmcmVlcmRw
OiBDVkUtMjAyNi0yMjg1MTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjYtMjI4NTENCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMjg1MjogaHR0cHM6Ly9udmQubmlz
dC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjI4NTINCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAy
Ni0yMjg1MzogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjI4NTMN
Cj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMjg1NjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVs
bi9kZXRhaWwvQ1ZFLTIwMjYtMjI4NTYNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMjg1Nzog
aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjI4NTcNCj4gPiAgLSBm
cmVlcmRwOiBDVkUtMjAyNi0yMjg1ODogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjYtMjI4NTgNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMjg1OTogaHR0cHM6Ly9u
dmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjI4NTkNCj4gPiAgLSBmcmVlcmRwOiBD
VkUtMjAyNi0yMzUzMDogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYt
MjM1MzANCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMzUzMTogaHR0cHM6Ly9udmQubmlzdC5n
b3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM1MzENCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0y
MzUzMjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM1MzINCj4g
PiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMzUzMzogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9k
ZXRhaWwvQ1ZFLTIwMjYtMjM1MzMNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMzUzNDogaHR0
cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM1MzQNCj4gPiAgLSBmcmVl
cmRwOiBDVkUtMjAyNi0yMzczMjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZF
LTIwMjYtMjM3MzINCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMzg4MzogaHR0cHM6Ly9udmQu
bmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM4ODMNCj4gPiAgLSBmcmVlcmRwOiBDVkUt
MjAyNi0yMzg4NDogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM4
ODQNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yMzk0ODogaHR0cHM6Ly9udmQubmlzdC5nb3Yv
dnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjM5NDgNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDQ5
MTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ0OTENCj4gPiAg
LSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY3NTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh
aWwvQ1ZFLTIwMjYtMjQ2NzUNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY3NjogaHR0cHM6
Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2NzYNCj4gPiAgLSBmcmVlcmRw
OiBDVkUtMjAyNi0yNDY3NzogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjYtMjQ2NzcNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY3ODogaHR0cHM6Ly9udmQubmlz
dC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2NzgNCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAy
Ni0yNDY3OTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2NzkN
Cj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY4MDogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVs
bi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2ODANCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY4MTog
aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2ODENCj4gPiAgLSBm
cmVlcmRwOiBDVkUtMjAyNi0yNDY4MjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjYtMjQ2ODINCj4gPiAgLSBmcmVlcmRwOiBDVkUtMjAyNi0yNDY4MzogaHR0cHM6Ly9u
dmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYtMjQ2ODMNCj4gPiAgLSBmcmVlcmRwOiBD
VkUtMjAyNi0yNDY4NDogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjYt
MjQ2ODQNCj4gPg0KPiANCj4gVGhlc2UgQ1ZFcyBhcmUgYWxsIGZvciBmcmVlcmRwIHYyLiBJbiBh
IGZldyBkYXlzIHRoZXJlIHdpbGwgYmUgYWJvdXQgMTENCj4gbW9yZSBtYWRlIHB1YmxpYy4NCj4g
VXBzdHJlYW0gaGFzIGp1c3QgcmVsZWFzZWQgYSBuZXcgdmVyc2lvbiBpbiB0aGUgMi54IHNlcmll
cywgdGhlIHZlcnkNCj4gbGFzdCBvbmUsIHRoZXkgc2F5IHRoYXQgIkZyb20gdGhpcyBwb2ludCBv
biB3ZSB3aWxsIG5vIGxvbmdlciBtYWludGFpbg0KPiB0aGlzIGJyYW5jaCBhbmQgdXJnZSBhbGwg
dG8gdXBncmFkZSB0byBGcmVlUkRQIDMueC4iDQo+IA0KPiBJdCBjb250YWlucyBzb21lIGZpeGVz
LCBidXQgbm90IGFsbCBDVkUgZml4ZXMgZnJvbSAzLnguDQo+IENvbnNpZGVyaW5nIHRoYXQgZnJl
ZXJkcDMgcmVjaXBlIGlzIGF2YWlsYWJsZSwgYW5kIHRoYXQgdmVyc2lvbiBpcyB3ZWxsDQo+IG1h
aW50YWluZWQsIHdoYXQgd291bGQgeW91IHNheSBpZiB3ZSBkcm9wcGVkIHRoZSB2MiByZWNpcGUg
aW5zdGVhZCBvZg0KPiB1cGdyYWRpbmcgaXQgdG8gdGhpcyBsYXN0IHZlcnNpb24gaW4gdGhpcyBz
ZXJpZXM/DQo+IA0KPiBJJ20gbm90IGEgZmFuIG9mIHNocmlua2luZyB0aGUgQ1ZFIGxpc3QgbGlr
ZSB0aGF0LCBidXQgdGhpcyByZWNpcGUncw0KPiBmdXR1cmUgZG9lc24ndCBsb29rIGJyaWdodC4u
Lg0KDQpEdWFsIHZlcnNpb25zIGxpa2UgdGhpcyBzaG91bGQgYmUgcmVtb3ZlZCBvbmVzIGFsbCBy
ZWNpcGVzIGRlcGVuZGluZyBvbiB0aGVtIGFyZSB1cGRhdGVkIHRvIHVzZSBuZXdlciB2ZXJzaW9u
Lg0KU28gdGhpcyBtZWFucyBsb29raW5nIGlmIHZsYyBhbmQgcmVtbWluYSByZWNpcGVzIHdvcmsg
d2l0aCBmcmVlcmRwMyBhbmQgaWYgc28uIERyb3AgdGhlIG9sZCByZXZpc2lvbi4NCg0KUGV0ZXIN
Cg==

