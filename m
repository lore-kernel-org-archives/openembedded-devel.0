Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C48C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:12:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web11.42290.1676985769015011564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 05:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=QhiAl7VJ;
 spf=pass (domain: spinetix.com, ip: 40.107.7.43, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbpQ/xd/OgPEGV1F2GYpNSMIor0wH6QOlrLoiUeh2mtUiNlPaR1hUYnulN4sLkOuSQz7XZ2H9lCvmx6SsYeTVYvGBDZ27vf6+o3si0URzFeMPSnoonseEC0z+rUvHCKt584RJJB/OoZ2F/58U3QQS1mDGP6vlOb2G0Id9ilF7EL/6WG3PFEDc49h6q843WMs0R7e/OgovH1FDGyw3kdS2sesAPRh4P7GdJCkoYCNDRYIJpm6XgKUxfh+rDNAG8ZgVqaCVJyw6o78Hc7co3XFOEkFdu+KBLzGQ5Sh7L3kcM34W4+6CtGQRUROn+Qe86NA16LZ8aaoi5V5aRegP+v4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUSev6amRSkMKnuVreSW8gCzjnsZjpaFgIdKVz3Lm94=;
 b=Lz+y7gLJw3nP3fv0hj/5W8eyjyjFMAiJOnuEdJOzCV4PSn8QFcJGPCapaU7LH49Zi8SQxkiD+mugliWoHNVVNpqmsqBPc+NTqN1r+erK+3K9IXxkmD9+BPS81kJcjCL6FfkIzLbZMxaMsUK0ivTbW85iGu7zI5qraTATPsUbVe2KRvkIFjMCoVBMyQC92ejd0Yrz6XvzxO3Sk+i2zpMCtTtw+n7nECUV30TMQhMt/QjDthG0TxEn/G+opwIc8zLRuzYYH/11Qv+1OhckWQ0u43P6NX3lnB3OmsWJGknNO770OnbseIruod1GjEeMOsj2a1JgJtErTTfJM0xrzSdtAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUSev6amRSkMKnuVreSW8gCzjnsZjpaFgIdKVz3Lm94=;
 b=QhiAl7VJW58jRPwPNPqx8QZjlt1q7qQLnw5NffeMAgnvtKmpeXtwiPCpn8WzSQeNeoK9Vxxvtjh77tmcWzoyy6Hac3qeV9ys86jH03fO9VFcHk8Jf34GqO1O2ijaaqsL7zZr6OofpLj0ybNDEw6/Ol/Uyk4LYkwSsCFdDWylrYM=
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by GV0P278MB0161.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.31; Tue, 21 Feb
 2023 13:22:45 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17%9]) with mapi id 15.20.6086.031; Tue, 21 Feb 2023
 13:22:45 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Thread-Topic: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Thread-Index: AQHZO6sXuoN1sDlDE0qUmZKFHI+U1q7Zd6sw
Date: Tue, 21 Feb 2023 13:22:45 +0000
Message-ID: 
 <ZR0P278MB03793315CA3EF98B9871DA79F1A59@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
References: <20230208104926.26497-1-valeria.petrov@spinetix.com>
In-Reply-To: <20230208104926.26497-1-valeria.petrov@spinetix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0379:EE_|GV0P278MB0161:EE_
x-ms-office365-filtering-correlation-id: 10b466f7-78cd-4be1-c95d-08db140eb853
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IUWiUOP6IPR1QLopqPZVQPf8cDW8ErUMBKzvNgVPvORbgk145NgFpbCz669+BwgecNmvqexDWPmG2YRXQiAf/eado0go2ZmTWw4JE1Kr6LwSBrmElb7izf8ErdkgLL0hvu2XvPXUR64MnjzNOfjtb2xGm1bnIvqSHUSWFWTfY2+v3pFYTLZJsy7B7Q4tqfzUi0sDq9T2Vb0OoJYYbIBEHmk1mrmU3IzerLeG6Xw4nPS5C91YQ8xzgpTGxG2fm337h+HC32n2nWi1tPdPML9hgxzAIZ4wzX3n3PLF0Qc7UQMjBoOnsFooiDR/7zTZjXhR8EdObtlwvOgyhjhGpQjaE7n0gZ0EfmSGbqOxYOGWLWilTG7gD3Jtx6/f+Po2XEkxrxEljFLhg6BRpifjvbf54XKUV1KVi56W9jX2l5lZCd8rG5YrCjHuCErGXXANlEXYQPbl99ROslepL+IXj+LUudEqMNpqInOdYwlFd+WhAX5/kT4ZxlLSZqeUWWGoflOO6DGn1Ft0EPlcu7O3uGpx0pMYDig3yMNVdKoDCF2KccPC8Djo1Ya+pvmOxfaKCImV3Ku5cKTNwu6/WRhBTuIn1bwx4UgPVjFGw6r9C7OUQ8cmqFPBwIP8/6wKl03I8PH03Cka8IvXyKLCIuJMaJ4DSd1el5h9gO8paX4oU9MxBeBAIp2pr3TPVHpsohqkmJL1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39840400004)(376002)(366004)(136003)(451199018)(41300700001)(2906002)(38070700005)(7696005)(66556008)(6506007)(53546011)(5660300002)(52536014)(8936002)(316002)(33656002)(4326008)(8676002)(6916009)(54906003)(55016003)(478600001)(66476007)(966005)(76116006)(86362001)(71200400001)(66946007)(66446008)(64756008)(9686003)(122000001)(38100700002)(186003)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OTRsa2ltR2lqM3dneExLTklSUUJBUHo0TkdtZHY1UEhSL0ZCK2w4YUxTSVVQ?=
 =?utf-8?B?YWJDKzlzOWJMRUpVencyVndHRWFuQWhmenFLVWQ4eEc5M0ZodnBwdUZPWlNt?=
 =?utf-8?B?bm1jSUNtOW40bmlmTVhoR1JINkNNTFkycHRHUGhkS25ieG9LbVNCNVJ1d0tr?=
 =?utf-8?B?byt4eXFxQ20vZkRFVDhlWDlYcllINWZVeW1vUTlIZUdNSUdWWmU3SXRUUko5?=
 =?utf-8?B?akJyd05XKzhmMm9XcHdwKzVRZEFjQ29JekNUaWtIN2ZZZyt6WG1ROEFRcDJ6?=
 =?utf-8?B?aHFEM0tPVWNFK0dCTU14R2RwT0dIaG9GYXN5V3g3ZElGbFZWR2lvMWhUVkdu?=
 =?utf-8?B?Z1VrK2t1TzBHZW9JV3M2Y005cE9nem1tdWVKVy93MzJ2cHdBNXlidGltOWwy?=
 =?utf-8?B?TDVLUnFhY21veVN6Wlh6THNOQkpDUThKSXVJQWZrYUlabWRnQVZuR2JnUjFR?=
 =?utf-8?B?S1c3T0pHMGtvTEZ2MnFkbExVWldub0ZIbU1mN3hnN2tOc2xPV20rUHJ3RmxP?=
 =?utf-8?B?WW9LeEQ0dmd2cmU2S0VZeGdDMGRCa2tlLzFQTFBYMW9IZzlyTnFQTG9tTndL?=
 =?utf-8?B?UDEyemRrbTBQVE5YeDArYWdGeVord2YxajVCM3FJdm9DTkp5dndyZmhDL3U4?=
 =?utf-8?B?czJmMGIvVk8vb3BkOXEySWxaaXZhZW5ZRzV0VHhjZENKcDllOVpWNGd2Z1BL?=
 =?utf-8?B?RkwrSHk5eFRxc3NUUFhMRXN0WlcvMUlac2pwczV3UjRiMmhIUmtuRmc5NWg3?=
 =?utf-8?B?ejFJZWhDYWF1T0l5TWg4WlYwc0cySlpNSGN2bDdhb091SklEV3RPUHZWc2E2?=
 =?utf-8?B?STU4VmlkY1k2c2xqaHhJTlhWY2ZPYU1FdEZWUFBLZEhzRkZ0U2pweXpJdDRF?=
 =?utf-8?B?UEx3NmlXRHErOWNEeUEvcjEraHVBVWdqelF0N2lwVlFhRmp4YVV5L2I4SFVk?=
 =?utf-8?B?TitnOHV1bjU4ZWkvbVFVK3Rmb0E1dWk5SGMzZFc1R3BWMjVwOWhkMVNhLzVv?=
 =?utf-8?B?RFZ5ZmF5RWVmdm85TElYQTV1d0JnOHZ4SW9EL1diM3lDblZzQUFXazI2eStL?=
 =?utf-8?B?SE9SRzBBYmJWUXM1NjBwVTV2V3QwVGpGdVdRN05WRFlvS0d3cWhHWVE3OHgy?=
 =?utf-8?B?LzM3eHNjSXhnejVDaGN4eXAvS0JjYlRReGwrZ3RVWUFBYXVtUXVqQkpBMjgw?=
 =?utf-8?B?WUtCTXUyNzRaU3QzdHVzVTBBak5vdnV5dGs5bzBubG5rcU94OHo5MVhQZU1O?=
 =?utf-8?B?Q2JYV29lRUVyKy9oY1hsTjRSUXRkTlh3b0JxYkVid1dEQ2lEV0k1d01WSkti?=
 =?utf-8?B?YnFKaWorTFNsYkc1bXMya00wT3E4VlI5WnJJRC96VmZyTytlUVpOY2FhWW1u?=
 =?utf-8?B?S2xxc2NBdkp5a1FpV29jRi94R1FoKzM2ZlJxcFRHYjlQMjkzSHgzMUJtMnV2?=
 =?utf-8?B?TFpneFRNdTkyZlBnb1VEenpMdUlPd29LK1E4TnlSYXhqMG02MEdSZmxWK3Zq?=
 =?utf-8?B?U09KWDI4YTZYQVNydlFOSXFONTB4bmdxZ0NtZWNvV2tFMkV6SlNjUStlbS9X?=
 =?utf-8?B?RFpzdTN2djBPRkNZalpONEVNUGJQTkNveHRyV010Ykt1QXNpSXFqSC84eUZv?=
 =?utf-8?B?dWFXVUlONnZxTVc4VE5BQ2phOEVDalF0SzBkWDZSL2VWVWFjK2srT2xiUzNJ?=
 =?utf-8?B?YW55OHVwTTQzUXdWbjhaZjFiSVovemdQOWR5bXlsQ1VhdjQ4VVcyWWY1ZUxw?=
 =?utf-8?B?UmozSU5CMHdFQTBPNlBKUkpzcmpTY3Jxc1NZMThTWE1sdHhPRUNWZDNPb0cz?=
 =?utf-8?B?aUl3TnIvcHFKL2tZa2JMOVoxR0E2cUxBNWp4MGRZTm5qWjFOZzZWdDh5SW9l?=
 =?utf-8?B?VDhqUE1OR3pIajEyNjM0Q2tKMU9kWTI4dFEzd0xLOFg3VUN5RTBqZVE2VVky?=
 =?utf-8?B?UmFaR1NDWFNTQ3NKZzJTRDgxaTRxNDVsYWN4MG9HWnhFWUV0TnpLM1VxS3VK?=
 =?utf-8?B?M3BwVCtLM3JKUDdJV21EUG16N2VISStoN1dmVnFFSGF3NW1tMldEOTRnRGF0?=
 =?utf-8?B?c3U0UUcwZkErWWNPbThZTS96V24wQWJHS21RdER2bzE5MzNyVFY5RFV1V2ti?=
 =?utf-8?B?ZEpGU1dwUk1xQnMraWpNSnRGMDhFemt2UHBPalp4MmFnT29rMkdzcUFaWWd0?=
 =?utf-8?B?S0E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b466f7-78cd-4be1-c95d-08db140eb853
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 13:22:45.7497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m71R8AHL8k+THWdO+sJ1SXPCklHwig81OK7uDCdziEA/+APXSBpj/tgcF7ILJ9HWSWL8+yNj7QODWX9ugz+EN/dWcoEewJmvp27dWCdcYwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0161
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 14:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101187

UGluZy4NCg0KVGhhbmtzLA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVmFs
ZXJpYSBQZXRyb3YgDQpTZW50OiBXZWRuZXNkYXksIDggRmVicnVhcnkgMjAyMyAxMTo1MA0KVG86
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogV2FuZyBNaW5n
eXUgPHdhbmdteUBmdWppdHN1LmNvbT47IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQpT
dWJqZWN0OiBbbWV0YS1vZV1bZHVuZmVsbF1bUEFUQ0hdIGFwYWNoZTI6IHVwZ3JhZGUgMi40LjU0
IC0+IDIuNC41NQ0KDQpGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KDQpD
aGFuZ2Vsb2c6DQpodHRwczovL2Rvd25sb2Fkcy5hcGFjaGUub3JnL2h0dHBkL0NIQU5HRVNfMi40
LjU1DQoNClNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQpT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KLS0tDQogLi4uL2Fw
YWNoZTIve2FwYWNoZTJfMi40LjU0LmJiID0+IGFwYWNoZTJfMi40LjU1LmJifSAgICAgICAgICAg
IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAg
cmVuYW1lIG1ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBhY2hlMi97YXBhY2hlMl8yLjQu
NTQuYmIgPT4gYXBhY2hlMl8yLjQuNTUuYmJ9ICg5OSUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLXdl
YnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8yLjQuNTQuYmIgYi9tZXRhLXdl
YnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8yLjQuNTUuYmINCnNpbWlsYXJp
dHkgaW5kZXggOTklDQpyZW5hbWUgZnJvbSBtZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2Fw
YWNoZTIvYXBhY2hlMl8yLjQuNTQuYmINCnJlbmFtZSB0byBtZXRhLXdlYnNlcnZlci9yZWNpcGVz
LWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8yLjQuNTUuYmINCmluZGV4IDJmZGY5MjYyOTIuLjBhZDk3
YTUzOTEgMTAwNjQ0DQotLS0gYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIv
YXBhY2hlMl8yLjQuNTQuYmINCisrKyBiL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBh
Y2hlMi9hcGFjaGUyXzIuNC41NS5iYg0KQEAgLTI2LDcgKzI2LDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtdGFyZ2V0ID0gIiBcDQogICAgICAgICAgICAiDQogDQogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9YmRkZWRkZmFjODBiMmM5YTg4MjI0MWQwMDhiYjQxYzMiDQot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImViMzk3ZmVlZWZjY2FmMjU0ZjhkNDVkZTM3NjhkOWQ2OGU4
ZTczODUxYzQ5YWZkNWI3MTc2ZDFlY2Y4MGMzNDAiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEx
ZDZiYTE5ZTM2YzBiOTNjYTYyZTQ3ZTZmZmMyZDJmMjg4NDk0MjY5NGJjZTBmMjNmMzljNzFiZGM1
ZjY5YWMiDQogDQogUyA9ICIke1dPUktESVJ9L2h0dHBkLSR7UFZ9Ig0KIA0KLS0NCjIuMjUuMQ0K
DQo=

