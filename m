Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA0BC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:40:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.130])
 by mx.groups.io with SMTP id smtpd.web11.48648.1711363244581779477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=DCPndbfu;
 spf=pass (domain: nedap.com, ip: 40.107.8.130, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeMNZtFwtGCaAeTw/GHjZ2ZuuB4YUJwqkwymZerKzMVBsyFricXZyYBm+lK/2rG9mm4d8tmJACy6kfNoxfu/ST4v8Un1V4XOdfjhuoa2GZ0uKtDsfXrS7Rhum+l3vIUuJff6ZwH0OW02EjmB2ZAcAijosV/ykSQuzsII/yWPV9ZC2on30RPvggJ7tqJso8ffTzJYIA7VKXHTpqydnOUYCFm8X5b85od+i4I24EBD0H5KDJz9dr+ntIb41lTcTiuGwsf6eJCf1l7WHiUETxnDmh7jf3fcZctaa6b0xIyqA61MEX4x1IjaA84SXl9nUkG+Jej2EO/wNJ2DLvDmBSWn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMnvFwh9xb9pX8+UnF7jBw0EqNlX7Vdx1Pao/AvmcL0=;
 b=fZZTAJK/i9sAjMg6t202NHaeQ+cK32R3Bo4mjgWvwpK+2SUqsj+7kB+aF7J87kWrhJh7UN81iInXd+8vG1dvPmobIylp5YpHRCsdvFSqqUFF6ZjRF1XFzDLo5PhwaJltIKA2DUI1gNp1LXQ2+QfjdOGs8dy0VrDaVzFn/lobj7nHItrIP74L1JBMZiYpNbznR1w8tdazHwGrp9f8CCyNM5ISYW1wAvx2i5gc8C1MHID7pXNWaLu1U+WnIwaiu2fOiJH1vKFhWrL9qZlmbI5NruMSsffZNnWQz1wGd4RE7ikNc/YlSc+9uULxHfzHre888rSdRT3LF29UCpjAVxgkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMnvFwh9xb9pX8+UnF7jBw0EqNlX7Vdx1Pao/AvmcL0=;
 b=DCPndbfulLK3cBxeVJR81Cxi6cD33hBx4lHlSDQ9BYLMa9VVfGsveELvGnYeisEgs1M7adj/MPdEfqvv25yJXBNFQnqE1g+qiwr2sqqReHIwPiXyUCHsfSxMmnNl/B5CEX2pzWdVfHXH8bUgXDrBKDrf2111OEn7Ptzb9LITQss=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AM7PR10MB3937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:170::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 10:40:40 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 10:40:40 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Tim Orling <ticotimo@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"henning@itconsulting-heinold.de" <henning@itconsulting-heinold.de>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"richard.leitner@skidata.com" <richard.leitner@skidata.com>
Subject: RE: [oe] [meta-java][PATCH 3/3] rxtx: Remove obsolete rename of
 libtool
Thread-Topic: [oe] [meta-java][PATCH 3/3] rxtx: Remove obsolete rename of
 libtool
Thread-Index: AQHZmuFukxn11LxlSEGd3ozrYLV5J7FHue8AgAJRQ3A=
Date: Mon, 25 Mar 2024 10:40:40 +0000
Message-ID: 
 <VI1PR10MB3182BB9126E26C25D17EEB72F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20230609144646.1977-1-jermain.horsman@nedap.com>
 <20230609144646.1977-3-jermain.horsman@nedap.com>
 <CANx9H-DSMeHjAyVTeLKzPCxEd9UASas5nO4tdctN7H2HTeFERg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-DSMeHjAyVTeLKzPCxEd9UASas5nO4tdctN7H2HTeFERg@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AM7PR10MB3937:EE_
x-ms-office365-filtering-correlation-id: 65ef3880-d8df-4c1e-812a-08dc4cb803d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 huLIAS7q7ajS8Ji6R26U7MIaZtZDRZLD9ZyUTRDg03uVkBXeKQNtL8pLuyZADkIl1EIGyf8tNkUze3GeMX82O9xsCa2WOTig3zawco+BYsu2fuoWQEF7/VFWE6dprrYr8P9CIlpXZ42wiuYhgism/yMzQr6OG0Dc6lJGnonJ7G5nj384yna+82ZO9/9EwsL3B1ZJcffcV6jSmUbr3F7V2puhws77zYouQ/JrdduTNJmMFPc0sK0nAXpRUs0MslQPVNr3Ma6rKBUKP8BBOHXSfOMvpioMckqGUtufbdbTSJ7rx3DmzRTHDcpwQGRMVAS2bI9LF5A53nOxEPKaq6aG4DaoAMWHPYssQC+h500hiPS+MuwTzxdSTDW94UdiVfw+fWmJltopNNmhXnECMQIA4aw7MAGRb1MMaU9r+v5zmepqk7nTLC3i3XlyN2l75H2dM8sbbyWLJAvf3kVdhbH3wQzdTWVzfuBWrd3RoqHLN0DIgir+SNpv10shezgeEcwCF+ifEra+4QnetFr8LilDfxiTPrwpYc5km73d0m1nZRi+U+g3GaaXqgmRLEwIAB9I7fwhF3/dh1tL0q/o1qoIqZZq12dNBNZCj3SYvV6ng+GmZO15hK84TCnxaSSx3dT25UnoYNfhIOU4wvwkIqFtzbb/QC2bvTpNdxvyd/OTiwKExyLhzE6cTvQ0iPDG1h9Johk3HS1Y/yNG6nPK9GlZhA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFBFVzlOeTdWVGdyT1NHemE0QURkZ0FVVGo2QytFSXVUajJkQWpNcEFPNUhJ?=
 =?utf-8?B?NkNJeWI1SFBwMjRLaXJTcEFUN0VZdHF0S1lhNEhvaXJJRnFBY092MTNSNytR?=
 =?utf-8?B?VkJFWUU4T25PY2Y1VVFEbXorTXpsZExtdWZ5UmhuVHBGaXI5SmlMUWlETGFZ?=
 =?utf-8?B?bHNvcUVZejV5dFZJamJCOHk2T1dPTlBrdCtDSndaU000ZVdubzUyd2FFVXBY?=
 =?utf-8?B?STVONmc3dlNIUnlyNDNReFBIQWkyQjBDa0MvUEFGS3pyVHc3UHNrYVp1N0ZC?=
 =?utf-8?B?WkxOREVha1lTS3BRUkMxekh1clBiUEo3T2lkZVdPNUY3VlBsT1FTN0pyc1Nq?=
 =?utf-8?B?SnpFMUcwWWsvVnZBU3JjVmM2MmVHZ2llcmNQZWswTnVpTE5MR29LdVc0SEE1?=
 =?utf-8?B?UzZ1SHlxYTRjV1dLSmZrOEM3NmVGcDAwc2Fnb3NSZXpkUXViZDBrelFVQzhP?=
 =?utf-8?B?SkRjWW9HVHRUaWIwckZ5Y0twNFE5NDNUeFJoRlo1UExHT00yWVdrYXg0Mk5z?=
 =?utf-8?B?aGNPSUxSNWZ2Wkl4MTZ2a3NtTWw4QkJRSVNhcGI5K3Vnc2lYWVNQZXdqK1ls?=
 =?utf-8?B?bUxCWkFzTWt4eFVHY0tUN3F2MTFyUjdjR1FPdzBXSnNzcysxQ0VOKzQ3ZWFY?=
 =?utf-8?B?TFB4R1Nla2RLUXdoN0d1T0x4RWFuU1V0UzlCN0ozeE11K285bXdRd0hLTndk?=
 =?utf-8?B?cC9ZeGdKM1Nud09pY0xSYkNPZjFnRnh3UUVPc2J5SlVmOHA5TTJTL0Q5T0U1?=
 =?utf-8?B?K1VZMHk4YjNJcncwcXBBVWpnNzFHYXZla2VNMXpPRUFxNlJFMlNqYXAwRmJT?=
 =?utf-8?B?V0tpNFFpdDMyV3B5YkcrUzRqZFdWMmw3QUoxV3l1cFBTSzRHVVVMWWRXWWZ5?=
 =?utf-8?B?WSsxZzVmN25SUUdWbFV1bDh4NnhSZDVuYW9hTHpLMnE2aGllemt5TVNGdHlE?=
 =?utf-8?B?bXBPVjI1SGR3QTRnZ3lDWGlxZnUralBDM295dDRtRU9GYktjMVFvNHhXUFYr?=
 =?utf-8?B?SHZ3anlweFY1aGpjK3UvNmZiVVI3bzNzcjUxTXNoVSszNVQzRWlMTEFDYUJt?=
 =?utf-8?B?bm5VV3YvbmpwVXA0Z3dVbTBUMVY2OGdvOGliblNyc0Y2WDRFSnlveU9GdG5L?=
 =?utf-8?B?NlNpZ3VGZnlMNXdjYVN3U1BXcDBpV1VnQ091ZE05UWl6QitHU2w4YSswTlI2?=
 =?utf-8?B?aW9FSEhicmRPcnZnenhqS1pNLzFuWVNJOGRqNEM3VlBaZnd3YU5yRXdaSU9r?=
 =?utf-8?B?aXpVU2cwMzJIQjZxRGtBMWs4OHhQSjhhRzJFUEZVdWdyNHcwemNMRGQwMG1o?=
 =?utf-8?B?OTNCVU9NMTJTYy9rczdIT1dMSUh6d3o3bGpUTlI2R3VncWtzRXVyNmxhYVBN?=
 =?utf-8?B?Q0c1YUpqNGN1YlM4N1BiaVdVZHNRTmszaDlxemRtNUlqQ241MExYYTRiVmJj?=
 =?utf-8?B?ZG95Qlg1dW9vT05Nc2grL1hnSVo5aGpUWkE5OGZvY1VEVUQvb0tyb1FNeEhO?=
 =?utf-8?B?R3RVN3E2SlVqVDlFWVozbW53M0w1Zk9FM25TY2Q2TkpoajFibFdyYjZwRllv?=
 =?utf-8?B?Rkp3WEFNbG95bEphWjJRSDhGdTZ0VDR4VDBnL09uNi81THlOZktaZEJ6VG93?=
 =?utf-8?B?dnhEaTEwUnBtV280RVFoc0E3SWQvVWNPeUhBd0RtQlN2c0dZSFdNVzZJQmtv?=
 =?utf-8?B?b1BxWVk5K2NXcFo1blJLckl0d3BJNUgwRmRyRWRkOEp4QXNuTVJjWUtUeFBB?=
 =?utf-8?B?cWZUWENTNERHOGh4RWJOWFQzNDNhQmc5bkxMSHE1d1lnZGtzL1VIQjVDcU1T?=
 =?utf-8?B?UXBlVFVLVGp3MFQyNnZKQnQzdzE0dGdxWkFKckZUNWpvS0g4ZlN0amU4T2Vs?=
 =?utf-8?B?RUd5YXkvVUhDaEZKRlVFOEVMS0ltNmJ1NHVBTlBQRm95c3N5NTVHSkFRWnlK?=
 =?utf-8?B?SUpJR045SUFoSXJjV253K0syc2VRQm56SzN1c2pURjQ5WFZPb1lSdGVieU5i?=
 =?utf-8?B?YmZVbnZ5c29lb0wwZzZKWEdzMVpkbWJzbE5hR0tuWFpBQm51RSsvQmpZTGlw?=
 =?utf-8?B?ak1ZRy9sb3VXblQ1YldwQ2VuSDk4ZXlYMWtOL1FBaWxHK1kwdlp0RDdRWTdl?=
 =?utf-8?Q?CGmFTKqI4tr6uPYf6h/ZfdlJY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ef3880-d8df-4c1e-812a-08dc4cb803d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 10:40:40.0939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBJN8JMcAxupkfL8Au1t+zB77+pL4qpi/U+yIMhXo29dLH0m61p1zOOeOhqZLEUtfwX2+mK+QIZLpwe6lqhPYPSKxRt47lv49CiplLOtQLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3937
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 10:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109575

PiBTdGlsbCBzZWVpbmcgYSBkb19jb21waWxlIGZhaWx1cmUgKGF0dGFjaGVkKQ0KDQpJIGJlbGll
dmUgdGhpcyBpcyBjYXVzZWQgYnkgc3N0YXRlIGJlaW5nIGluY29ycmVjdCwNCklmIHlvdSBkbyBh
IGNsZWFuIGJ1aWxkIHRoaXMgc2hvdWxkIG5vdCBoYXBwZW4uDQoNCj4gQ2FuIHlvdSBpbnZlc3Rp
Z2F0ZSBhbmQgc2VuZCBhIHJldmlzZWQgc29sdXRpb24/DQoNCkkgY291bGQgaW5jcmVhc2UgdGhl
IFBSLCBJIGJlbGlldmUgdGhhdCBzaG91bGQgcHJldmVudCB0aGUgaXNzdWUuDQpXb3VsZCB0aGF0
IGJlIGFjY2VwdGFibGU/DQoNClNpbmNlcmVseSwNCg0KSmVybWFpbiBIb3JzbWFuDQo=

