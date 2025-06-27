Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C75C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 10:35:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.6])
 by mx.groups.io with SMTP id smtpd.web11.10418.1751020523646865975
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 03:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=aoQX+AdU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.6, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5Pwuwhn6XsIA6j0T5tuxDNRJXH2HF28WMZHeKdkaSXoKtnWmv6vPjPsD0IyV85kHDrD20PISmkrymsSnavvqEaL37014GdwIMfVrkNKSvLB7wsLi3cKO9ELNcD+rhb8uEHk+/ZJ0npCEmSTnXrK4u/st7cuIMJU7czeNBaRaGhVdCG6dveCabjkwVp31QO4N5++pGLacYHIEyv/hhXXvwytieoKqr2GxU2VU9v3FzrhiMDvbylbv97J9w2D7UBzqRbLzKVtWIZtFBXtv1+iAYD4pZBX2fR8UNHBI04BKC0YOvUozBX2L0hJpazCvO9ZVu5QOkvgV6xHByzPgZi1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFtPPV0t12kipGXp4cQZloPb5sfynjrOcn6XLG6XoE4=;
 b=UfE2G4aRp6T5IH2gotoH1b9Ogxfzc1udhe4JOQq5qRGf7F9v/QbMLpIbNEudQcMkUobKt/3MLzz7F+W1fkMQSlnIGUkIVMPbM/X04pLunH9FJDw/N3dJl8GMGprJUkv/BJyyA9fDsFB8zaVoztENx0w1mDB3hMAZgC3Q6V5Y03PZ9wgs8c3X6i08kOcjAQD3KYTS/xPukmQRRePW0XT9FWa3WyOtVVkjTXfHTi/0IcIuDP6bCegZ6CTxueR2tBz2iTroDn31fyHq+1ckYbnTG85oAjfMNPBN91D/LxvIbPYKqeeB/Z88lPezqbvVxLCRKS27cnGyrF0THXiO3luxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFtPPV0t12kipGXp4cQZloPb5sfynjrOcn6XLG6XoE4=;
 b=aoQX+AdUcsCWDeszXbIN5oN/5Q5GYBvbIjzZNno5ViBGiDhLuUxw5nw9AuTO5AoPfmSbinwNxEuaBBvh7Rbvb1478hFiJ6rxKnSQi3ozGsk2uo1jBsLI5lTiMj4GWibMZLe2OSOYdrhrDM+qgZ2XfHOGfV+uaWRsgpHoFIfflk4=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by VE1PR06MB6975.eurprd06.prod.outlook.com (2603:10a6:800:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 10:35:19 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%4]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 10:35:18 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Khem Raj <raj.khem@gmail.com>, "jlu@pengutronix.de" <jlu@pengutronix.de>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-oe v3 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
Thread-Topic: [PATCH meta-oe v3 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
Thread-Index: AQHb5yX5PtB4PJ8Ay0uEdzwoIGgYubQWpPyAgAAqh98=
Date: Fri, 27 Jun 2025 10:35:18 +0000
Message-ID: 
 <AM8PR06MB7521D93585DF4F130F063658BC45A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
 <20250627-signing-set-ca-v3-1-030812797c6a@leica-geosystems.com>
 <CAMKF1sonO=SsLeNj71XaO-khTanMeDFnczN5i5C+uufauHT9+Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sonO=SsLeNj71XaO-khTanMeDFnczN5i5C+uufauHT9+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|VE1PR06MB6975:EE_
x-ms-office365-filtering-correlation-id: b46b45e2-e55e-4cbc-62a6-08ddb5664fea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QlA3bldLRVNyS0VpMzc4czZWSmk1SU4rdDgxNWEvRWp4TVcyYUJSSXp2RUdZ?=
 =?utf-8?B?eC8yTGlLa0FSUmFGN2VpR1dWSWc2R2xJNDVBbGQ0VGNYck9BTjV2d3loTno3?=
 =?utf-8?B?ekE0czZKSEpFQ2lVK1JaZG5KdzN0MGhRY1ZOaWRsWkdieGMvLzRvNHhrRmhy?=
 =?utf-8?B?akF1VG5wK1Z1ZFhYOUJKdnNYTEQ2Wk9xYVBJVFJvRnNMZEZYQVFwNTdzWUZV?=
 =?utf-8?B?Sk5uMmIwM00wc2VIVk5VbFNpRitsdjMwUmRRME1BNDlRYnVEb2k2RXV6L2Zx?=
 =?utf-8?B?RGdtclBxY2FPVHJoblJyMnJlb1BjOGxJZW16Q2IwbW1rc3MzNjk2NDVNRXV6?=
 =?utf-8?B?V0ozdG91allFeG82ZnRENTQ1aG10Qi8xOG11TWc4YU51ZkNQWTAyVUVqaDVt?=
 =?utf-8?B?eVB6cmNhQndBNldkbmlnM1YyZzNaaTd2VGREYkx6aVBEVFl1cDcxaUFublBs?=
 =?utf-8?B?ZFBCSHY4eXFQVFZTcXFPM3Y3YWgxWDZYMlU2UURHL25OeExCd1dCdVNXRGFK?=
 =?utf-8?B?MExjeE1BVTNQbm9HaEZRdERJTTBLUExYZFpDR0JuSDNVV2toMUk2YmJuVW11?=
 =?utf-8?B?REdwbndqOXAyVVF4akV1aGswRGNNZHpZNkR4OTdsZXBuaW8zSVpJVUU0ai93?=
 =?utf-8?B?RnNEdzBWcTVQd3lBUEQ1U25mc2FuaUFFMlFiRjk5azFtc1hCNkg3Z0hiTkNQ?=
 =?utf-8?B?blJXeG9zNktTYkpsdlNMdXVkUDB5MWZJczBIcnpmbmxqTTloQWkvR3VQaG9E?=
 =?utf-8?B?TURrMkhqcjU1bG80RHVsaXAzNjE4cWc1L25Ua05zcm5BdXp2QVBRZE5uOTlR?=
 =?utf-8?B?MWVsY29mOXZMeVBkVk5CU3I0TnZ4aEhTd1VTOU1uY0I5d2EzbUJRek5RZFNr?=
 =?utf-8?B?TVlCbzk4bE5JTGhUb29QWmEzdEg5NTkzeG9NcjBoMGdtODNsdGlla01TQ0g5?=
 =?utf-8?B?U0lXamxBVDZ4aXZqNW1HbnNwc1RFb2xZV2lGYVNrKzBTMW96OWtzMk5lMjQ1?=
 =?utf-8?B?ZXFac3E5YUNwTXpBeFVOTGhZdFNpYzhPd0VDSnJQTUlueTR2Mi8zZ1Z3VWp3?=
 =?utf-8?B?dS9YNHM0b3dyUDMvTlppWWp1QU1hZFZtM29HSE9EYXUxYms5b2lOYzdjU0pm?=
 =?utf-8?B?eGRnTVZVbkhPVHZxdEkvc3ZpMDM1ckYyMXh0RTBLQkZrVWhPT2Q2dDgxR0tG?=
 =?utf-8?B?WXowbXdLK2thUCtFS3RaOSswamFXaC84Zi90NW5wUk1hWXQ0cGRad2ozN2Mz?=
 =?utf-8?B?TUE2UjJBVjJqeTJNMjNBc0p5Q3lkcWxOTE51Q21xTFBFVnl2ZERGbWpDZE5G?=
 =?utf-8?B?SlB4d2E1a1RzOHJtTXRpR3pOSzNOSnhBZ1hBRCtSSXI3WG1jQ3VpMUNrWWgr?=
 =?utf-8?B?cFc0U1g5MzhxRHpscDlZczdpN2k1RmhTWGR3UXo5b3R6VkdZYXpmdmw1bEdY?=
 =?utf-8?B?cSszTmswQ2Q2SmlDTXc5eW80OTl4eERSNjJMeHV0bzZWOHRjc1ZhdXp2QW1T?=
 =?utf-8?B?MDV3QW12dlprWjQ4eHJKVGRxUXRKZmU1a291WStXS3o5OHI2clYvOXV0cTlU?=
 =?utf-8?B?U0VGaVdZZzRzbDkxdzI4Q2J3MFB4UXFnY0owSnBRTSsvRTNhQ2Z1b3FaVHZW?=
 =?utf-8?B?Ykh5UUpwclBLcG9TL2hhejZjb3NzWFdHdmhvQjI1Zkp2c016K1cwSmNrTWIy?=
 =?utf-8?B?cHVBUkNsc3d2cm1yTEsvY2FaVmZZZ0VBaU4zNUUyWDlwZlh0MWtUbWlYSTZM?=
 =?utf-8?B?c0xYcDNRS2pac1Y0dHRGbHR6YXhmbC9qbGdVSU1idnN6TnJONlFXRGdNUHd3?=
 =?utf-8?B?NXFCRm5CbzNPb3M2T3cvWkQxMGZDMmlHWjc0dXdVZDEwL3o4UWpjOHNCTzFi?=
 =?utf-8?B?NHB2UHNzZFVmaEtMWEM1d3pRWXN5dEJsRFlLdDk5Y1ZEd0RlbU1KUFhqRDlX?=
 =?utf-8?B?cTNmcU5jeUV0SldlSHlkY1ZKbTRQUy9OQUhZMkoxNGhaRnpPWEtwQVIycjMy?=
 =?utf-8?B?NEdhQzNFVDBnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bjBYVldKR0NudGlNYWNNcUhSZzJ1Wnh0L0d4T3BSY2NoZXUzNUh1RWYxUXkr?=
 =?utf-8?B?bmtvMCtQTFNhVnJrMUlqSlhlMDZqZ255Z0VZU2hiNlNvNTd1MTBnWllwV3NF?=
 =?utf-8?B?RnhFVi9DWUErb3Jab1pDUkI4VXIwUU5PR3FrUDh2WkhlNWZVWnptVklJSVZj?=
 =?utf-8?B?WlFKbUkzWUdZVHB4bGZmcGdhS1VISVNIUmVUZkcveXZidmxQRUMxTEg1dUxQ?=
 =?utf-8?B?K2ZtbzI0Z2pGNEFubzNxNDFTTlhKMTFDbFk2TWRIbkNSTHpvRTMxNEFidHlk?=
 =?utf-8?B?OFEzS1dTNjl1RGJYdHRtclRocW1KTVhBSEhzZHhOTjY4WWJzOHVPdk5DWENv?=
 =?utf-8?B?dEZabzY4NEI4clQxQW5IOUJVL0ZsRXFiWk1URjl1akpiTzB5Q0RYZ1NiTWNC?=
 =?utf-8?B?NFpmdkdXR3JDdVl3ZWZRUVlSaXFXaUNqWHJnZzlhSmdvRVhpOEMrSHdOWlRZ?=
 =?utf-8?B?Qm1kSHdheGdjSE55OFBuUUQ4bzZGTlB6dmVEbStsaHpjVjI1YnlvS0dRUDlh?=
 =?utf-8?B?OCt0Q2RaUkR4Tmo3alQ2QjdnajZmaFI1MWJ4RlNYWkNhT3c2Wm90VStrc3do?=
 =?utf-8?B?UXY1NnB6ZmdjUGhUckVjeTYzZHVhQTBlOW93c3JJZ2RRVGgzWHcxU2xUdjN1?=
 =?utf-8?B?T1p1VXZSWEEvU2VzUjlITmpLS3pkOFlueUFFK2ZaOHFzeWFXNEtwalJiUHNQ?=
 =?utf-8?B?R3JkenBoNFBreUVqSk0rSUN6S3VyL0RYanNwWmhxMTIzdUxKQ0JNamZ5MUFS?=
 =?utf-8?B?d084WVYza3hLeVdGZEJMampVQ3Rod2VoSDVMN2JBaE1qTGIweEVaMlBadkFG?=
 =?utf-8?B?WnZjN1h4QkJyUFNnRjY2WlZuZGNaNkV5ZkovVC9LSE0wMzNiSXVzREVXbVNT?=
 =?utf-8?B?cnp1U09Gb1orQW1RTXE0T1Zjb0RSWU5zM2F5K1BwTlkrb2tqb2NudEU0M2tt?=
 =?utf-8?B?aTlRbjIwTGRBZ3FqRWc3WVYxMlhKdVZTeTNkalZBVml3SjVFTjBwQ1NlS0l6?=
 =?utf-8?B?cC9YSmpHV1dDWHd4cDdpNHduQ3hxeU5iUjlqcUZTMWJDdlQ2eitmVWNDby8w?=
 =?utf-8?B?OVN1eGhGZ0lwNWF4OG42em9yRWgzZTE2aWVlbHJGUUx2d3NGeWtxNjRBSUdk?=
 =?utf-8?B?S1lMRHR3SnFzbVVMZ3c3SENJdVBmcWJGYXI2dWJIV1pyUEM1ZmpKWHFoMW9Q?=
 =?utf-8?B?alZpZDB4ZG1MUE9pZElYcjFyR2IrZ1pDZGlDOTdUTDdnSzlJNzN5RjVJUkt5?=
 =?utf-8?B?QnFUVHRDejJILy9vRERzNGN3SEJ0TnFtNkFUYU5BcVQ2cmE0TWZNVGU2YStB?=
 =?utf-8?B?Tnl0Qi8zbiswWjc4NWIwQ0E0bnNUV0NSOGduNnlrZmpzVi9xeHJqU3ZMcmtx?=
 =?utf-8?B?MGdSVE9YN2xQaHowQjRsTThWZUVndmxSK3d2eDVRTDFXd2RkMDgyVXFyTFZC?=
 =?utf-8?B?WTVnUWhLT1hjQk9QNGM3Umh3ZnlMQ2FtNFVVZGtrbnEvMFpSNlBtZm8yelVl?=
 =?utf-8?B?OFB2RnVDV0JSd0ZsbGRtVG02TXNCZWp3akhQSzl0ajl4bndBYUVZL0xCaXVh?=
 =?utf-8?B?bnRKSEpkejNxZk5XMytqUnZKdU4vYnF5TXRiSHpyeUxxcFhMVkNBVzc5bEoz?=
 =?utf-8?B?WUtEQW9xOUhoeHg3bnhxMGQ2dGg2V1VFUDdra01MQmNybmxQVTNCUkVvNGls?=
 =?utf-8?B?MEkrSnJLZ2xYS25Xejc1clBDYmhoWU40bXl1MzVrR3JrNHdkT3BPckhVVFh4?=
 =?utf-8?B?Mk1wSVVBdWExN0NSOWZTaUdkMGRJQmExM2JaR2tyNWtlQ21KT09FRFZiVERW?=
 =?utf-8?B?ZDQ0a2lxNlEwZUZ0dEpTWVdCU1ZrSkhaOHhtc244QlkwUkhjRUo2aVAwTkt3?=
 =?utf-8?B?b0tDSlU3dWlyYkZtdHVTVDJGeC9scmdOd0lGNzVVYko5SzRDdW0yUVM0d1Bs?=
 =?utf-8?B?ZGZRSDhxQmJ4TGV1RXFKUHJnQ1RLcHA0Yk1oZlBOdERWVWJVcVVRRkFOamNC?=
 =?utf-8?B?SWZXU2J6K1RjVitLTjVMQndEcUxKaENiL21kVHUrcjNiUThYVFJvWkpqY2U4?=
 =?utf-8?B?SUZEclRzaDJQbGxmTG8xSzRCZ1ptMTR6TCtGRFZyS2pxSmxkMXZOQTVlWnh0?=
 =?utf-8?B?SHppMzRlcnFORi9KS1AvU2ZOVDdJTW4xWURvUWJNN0U4MEFQY2FtV054UUha?=
 =?utf-8?B?NmFONVFxSzJUcFNCYkxqdjRhcEF0SkRVaGkwOGJUQWhnSjdwUmZqaStqdnF0?=
 =?utf-8?Q?mWx3PUhq7vZ6NJYd6gT6bs9q2CfhrreFVFuJjxiOmg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46b45e2-e55e-4cbc-62a6-08ddb5664fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 10:35:18.8291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aa4fXcxPr/OBnY1bQx2uaHl8UXxissBtWcJk7BdEn3HVaJEGqaRew1l2AHKlB+OUPMf9YzfmAHIgrwj/qDVn95CgjMzekFc+HT0Xz666Hh7uEMs96VTPvn4Q4azx11Rw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6975
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 10:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118145

SG9pLA0KDQoNCj4gUGxlYXNlIHJlYmFzZSB0aGlzIG9uIHRvcCBvZiBsYXRlc3QgbWFzdGVyIG9y
IG1hc3Rlci1uZXh0IGFuZCByZXNlbmQsDQppdCBkb2VzIG5vdCBhcHBseSBjbGVhbmx5Lg0KDQpB
Q0sNCg0KQEphbjogIHYzIGFkZGVkIHRoZSBjb21tZW50L3VzZS1jYXNlIHlvdSBwb2ludGVkIG91
dCBhbmQgaSBtaXNzZWQgLSBhbnl0aGluZyBlbHNlIHRoYXQgc2hvdWxkIGJlIGZpeGVkIGZvciB2
ND8gKC06DQoNCg0KZ3J1w58NCkpvaGFubmVzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQpTZW50
OiBGcmlkYXksIEp1bmUgMjcsIDIwMjUgMTA6MDENClRvOiBTQ0hORUlERVIgSm9oYW5uZXMNCkNj
OiBqbHVAcGVuZ3V0cm9uaXguZGU7IEdFTy1DSEhFUi1ic3AtZGV2ZWxvcG1lbnQ7IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIG1l
dGEtb2UgdjMgMS82XSBzaWduaW5nLmJiY2xhc3M6IHJlZmFjdG9yIHNpZ25pbmdfaW1wb3J0X2Nl
cnRfZnJvbV8qDQoNCltTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0
IG9mdGVuIGdldCBlbWFpbCBmcm9tIHJhai5raGVtQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMg
aXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNh
dGlvbiBdDQoNClRoaXMgZW1haWwgaXMgbm90IGZyb20gSGV4YWdvbuKAmXMgT2ZmaWNlIDM2NSBp
bnN0YW5jZS4gUGxlYXNlIGJlIGNhcmVmdWwgd2hpbGUgY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcg
YXR0YWNobWVudHMsIG9yIHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuDQoNCg0KUGxlYXNlIHJlYmFz
ZSB0aGlzIG9uIHRvcCBvZiBsYXRlc3QgbWFzdGVyIG9yIG1hc3Rlci1uZXh0IGFuZCByZXNlbmQs
DQppdCBkb2VzIG5vdCBhcHBseSBjbGVhbmx5Lg0KDQpPbiBUaHUsIEp1biAyNiwgMjAyNSBhdCAx
MDo0MOKAr1BNIEpvaGFubmVzIFNjaG5laWRlcg0KPGpvaGFubmVzLnNjaG5laWRlckBsZWljYS1n
ZW9zeXN0ZW1zLmNvbT4gd3JvdGU6DQo+DQo+IFJlZmFjdG9yIHRoZSB0d28gbWV0aG9kcyB0byBp
bXBvcnQgY2VydGlmaWNhdGVzIGZyb20gUEVNL0RFUiB0byBiZQ0KPiB1c2FibGUgaW5kZXBlbmRl
bnRseSBmcm9tIGtleW1hdGVyaWFsIHRoYXQgaXMgbGlua2VkIHRvIGEgcm9sZS4NCj4NCj4gQnkg
aGF2aW5nIHRoZSBpbXBvcnRfY2VydF9mcm9tIG1ldGhvZHMgY3JlYXRlIGEgc3RvcmFnZSBsb2Nh
dGlvbiAoYWthDQo+IHJvbGUpIGluIHRoZSBzb2Z0aHNtIGR5bmFtaWNhbGx5LiAgVGhpcyB3YXkg
Y2VydGlmaWNhdGVzIGNhbiAtIGJ1dA0KPiBkb24ndCBoYXZlIHRvIC0gYmUgbGlua2VkIHRvIGEg
a2V5LCBvciBjYW4gc3RhbmQgb24gdGhlaXIgb3duIGlmIGNoYWluDQo+IG9mIGNlcnRpZmljYXRl
cyBmcm9tIGEgUEtJIGhhcyB0byBiZSBtYW5hZ2VkLg0KPg0KPiBSZXZpZXdlZC1ieTogSmFuIEx1
ZWJiZSA8amx1QHBlbmd1dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbm5lcyBTY2hu
ZWlkZXIgPGpvaGFubmVzLnNjaG5laWRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gLS0tDQo+
ICBtZXRhLW9lL2NsYXNzZXMvc2lnbmluZy5iYmNsYXNzIHwgNDIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBtZXRhLW9lL2NsYXNzZXMvc2ln
bmluZy5iYmNsYXNzIG1ldGEtb2UvY2xhc3Nlcy9zaWduaW5nLmJiY2xhc3MNCj4gaW5kZXggOGFm
N2JiZjhlMC4uYzc2ODM3MTE1MSAxMDA2NDQNCj4gLS0tIG1ldGEtb2UvY2xhc3Nlcy9zaWduaW5n
LmJiY2xhc3MNCj4gKysrIG1ldGEtb2UvY2xhc3Nlcy9zaWduaW5nLmJiY2xhc3MNCj4gQEAgLTEy
MywxNSArMTIzLDI2IEBAIHNpZ25pbmdfaW1wb3J0X2RlZmluZV9yb2xlKCkgew0KPiAgICAgIGVj
aG8gIl9TSUdOSU5HX1BLQ1MxMV9NT0RVTEVfJHtyb2xlfV89XCJzb2Z0aHNtXCIiID4+ICRfU0lH
TklOR19FTlZfRklMRV8NCj4gIH0NCj4NCj4gLSMgc2lnbmluZ19pbXBvcnRfY2VydF9mcm9tX2Rl
ciA8cm9sZT4gPGRlcj4NCj4gKyMgc2lnbmluZ19pbXBvcnRfY2VydF9mcm9tX2RlciA8Y2VydF9u
YW1lPiA8ZGVyPg0KPiAgIw0KPiAtIyBJbXBvcnQgYSBjZXJ0aWZpY2F0ZSBmcm9tIERFUiBmaWxl
IHRvIGEgcm9sZS4gVG8gYmUgdXNlZA0KPiAtIyB3aXRoIFNvZnRIU00uDQo+ICsjIEltcG9ydCBh
IGNlcnRpZmljYXRlIGZyb20gREVSIGZpbGUgdG8gYSBjZXJ0X25hbWUuDQo+ICsjIFdoZXJlIHRo
ZSA8Y2VydF9uYW1lPiBjYW4gZWl0aGVyIGJlIGEgcHJldmlvdXNseSBzZXR1cA0KPiArIyBzaWdu
aW5nX2ltcG9ydF9kZWZpbmVfcm9sZSBsaW5raW5nIHRoZSBjZXJ0aWZpY2F0ZSB0byBhIHNpZ25p
bmcga2V5LA0KPiArIyBvciBhIG5ldyBpZGVudGlmaWVyIHdoZW4gZGVhbGluZyB3aXRoIGEgc3Rh
bmRhbG9uZSBjZXJ0aWZpY2F0ZS4NCj4gKyMNCj4gKyMgVG8gYmUgdXNlZCB3aXRoIFNvZnRIU00u
DQo+ICBzaWduaW5nX2ltcG9ydF9jZXJ0X2Zyb21fZGVyKCkgew0KPiAtICAgIGxvY2FsIHJvbGU9
IiR7MX0iDQo+ICsgICAgbG9jYWwgY2VydF9uYW1lPSIkezF9Ig0KPiAgICAgIGxvY2FsIGRlcj0i
JHsyfSINCj4NCj4gLSAgICBzaWduaW5nX3BrY3MxMV90b29sIC0tdHlwZSBjZXJ0IC0td3JpdGUt
b2JqZWN0ICIke2Rlcn0iIC0tbGFiZWwgIiR7cm9sZX0iDQo+ICsgICAgIyBjaGVjayB3ZXRoZXIg
dGhlIGNlcnRfbmFtZS9yb2xlIG5lZWRzIHRvIGJlIGRlZmluZWQgZmlyc3QsDQo+ICsgICAgIyBv
ciBkbyBzbyBvdGhlcndpc2UNCj4gKyAgICBsb2NhbCB1cmk9JChzaWdpbmdfZ2V0X3VyaSAkY2Vy
dF9uYW1lKQ0KPiArICAgIGlmIFsgLXogIiR1cmkiIF07IHRoZW4NCj4gKyAgICAgICAgc2lnbmlu
Z19pbXBvcnRfZGVmaW5lX3JvbGUgIiRjZXJ0X25hbWUiDQo+ICsgICAgZmkNCj4gKw0KPiArICAg
IHNpZ25pbmdfcGtjczExX3Rvb2wgLS10eXBlIGNlcnQgLS13cml0ZS1vYmplY3QgIiR7ZGVyfSIg
LS1sYWJlbCAiJHtjZXJ0X25hbWV9Ig0KPiAgfQ0KPg0KPiAgIyBzaWduaW5nX2ltcG9ydF9jZXJ0
X2NoYWluX2Zyb21fcGVtIDxyb2xlPiA8cGVtPg0KPiBAQCAtMTY0LDE3ICsxNzUsMjggQEAgc2ln
bmluZ19pbXBvcnRfY2VydF9jaGFpbl9mcm9tX3BlbSgpIHsNCj4gICAgICAgICAgZG9uZQ0KPiAg
fQ0KPg0KPiAtIyBzaWduaW5nX2ltcG9ydF9jZXJ0X2Zyb21fcGVtIDxyb2xlPiA8cGVtPg0KPiAr
IyBzaWduaW5nX2ltcG9ydF9jZXJ0X2Zyb21fcGVtIDxjZXJ0X25hbWU+IDxwZW0+DQo+ICAjDQo+
IC0jIEltcG9ydCBhIGNlcnRpZmljYXRlIGZyb20gUEVNIGZpbGUgdG8gYSByb2xlLiBUbyBiZSB1
c2VkDQo+IC0jIHdpdGggU29mdEhTTS4NCj4gKyMgSW1wb3J0IGEgY2VydGlmaWNhdGUgZnJvbSBQ
RU0gZmlsZSB0byBhIGNlcnRfbmFtZS4NCj4gKyMgV2hlcmUgdGhlIDxjZXJ0X25hbWU+IGNhbiBl
aXRoZXIgYmUgYSBwcmV2aW91c2x5IHNldHVwDQo+ICsjIHNpZ25pbmdfaW1wb3J0X2RlZmluZV9y
b2xlIGxpbmtpbmcgdGhlIGNlcnRpZmljYXRlIHRvIGEgc2lnbmluZyBrZXksDQo+ICsjIG9yIGEg
bmV3IGlkZW50aWZpZXIgd2hlbiBkZWFsaW5nIHdpdGggYSBzdGFuZGFsb25lIGNlcnRpZmljYXRl
Lg0KPiArIw0KPiArIyBUbyBiZSB1c2VkIHdpdGggU29mdEhTTS4NCj4gIHNpZ25pbmdfaW1wb3J0
X2NlcnRfZnJvbV9wZW0oKSB7DQo+IC0gICAgbG9jYWwgcm9sZT0iJHsxfSINCj4gKyAgICBsb2Nh
bCBjZXJ0X25hbWU9IiR7MX0iDQo+ICAgICAgbG9jYWwgcGVtPSIkezJ9Ig0KPg0KPiArICAgICMg
Y2hlY2sgd2V0aGVyIHRoZSBjZXJ0X25hbWUvcm9sZSBuZWVkcyB0byBiZSBkZWZpbmVkIGZpcnN0
LA0KPiArICAgICMgb3IgZG8gc28gb3RoZXJ3aXNlDQo+ICsgICAgbG9jYWwgdXJpPSQoc2lnaW5n
X2dldF91cmkgJGNlcnRfbmFtZSkNCj4gKyAgICBpZiBbIC16ICIkdXJpIiBdOyB0aGVuDQo+ICsg
ICAgICAgIHNpZ25pbmdfaW1wb3J0X2RlZmluZV9yb2xlICIkY2VydF9uYW1lIg0KPiArICAgIGZp
DQo+ICsNCj4gICAgICBvcGVuc3NsIHg1MDkgXA0KPiAgICAgICAgICAtaW4gIiR7cGVtfSIgLWlu
Zm9ybSBwZW0gLW91dGZvcm0gZGVyIHwNCj4gLSAgICBzaWduaW5nX3BrY3MxMV90b29sIC0tdHlw
ZSBjZXJ0IC0td3JpdGUtb2JqZWN0IC9wcm9jL3NlbGYvZmQvMCAtLWxhYmVsICIke3JvbGV9Ig0K
PiArICAgIHNpZ25pbmdfcGtjczExX3Rvb2wgLS10eXBlIGNlcnQgLS13cml0ZS1vYmplY3QgL3By
b2Mvc2VsZi9mZC8wIC0tbGFiZWwgIiR7Y2VydF9uYW1lfSINCj4gIH0NCj4NCj4gICMgc2lnbmlu
Z19pbXBvcnRfcHVia2V5X2Zyb21fZGVyIDxyb2xlPiA8ZGVyPg0KPg0KPiAtLQ0KPiAyLjQzLjAN
Cj4NCg==

