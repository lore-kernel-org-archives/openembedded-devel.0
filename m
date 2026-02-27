Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB0CFD5311
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 08:54:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91377.1772182466978834929
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 00:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=i2miAawA;
 spf=pass (domain: siemens.com, ip: 52.101.65.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1YUiq0xEryJce1FdRtzk8QBociLeHgfR2Q4Bkp4Oqabn0j5UBbimKCBiX04fE8htCh0oAim5Ka6yFFRWEwDy3qoeubDYAFEhL59U4OYrjvatm0EN8QnBnfPuAEvwVdHXLLi5twClFIPPk6lUjqD/zyRLDpW5rYsEKZfMPt4ZV5oCgKcK3welfwElmqH51fHSQSc3BxmQgarmm5DrGlYdyvEaLNfwU6bOQpL7bO/kOYcN5DANxcXG9T7MVpmUAnLCqeh+85YF1Rpv3s5veCdkknMmZwi2SGXUX9HaX07vvOxXPKl+FknpwicQKRG8+piqA8KJ6pFESQbkSfvvZA4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58bOV5vG9ALUXx7WdS+Ul52tCqL+hIqkhv0iSYebp1E=;
 b=wvGmQ2b4QYkkQp8iP5kt/Puq+EAdfCxaGCD7eXIzuJHqfV+c2F2jT1Pj0bbMf975ETb0UhIKhKfM5/sK6MgYgCJyjpKf8d7lCmgXP2VKRelCQT+TMKeHO3+AFVd/cAgQ35i9paK4oPCKKYemjgmY1oSZ04OTUL8a9axlOmfFnwVMaw6TnbL2jpTdWfbrYDBl8oEca40FT1psmppq2yqvbbDqTz7BNUGboDqjJYDgVhpXz/43WH3B0TeBo4+8aCVsS4IOtPtHz6EswY66ygC1hlt0RYtAtmiYCm3Euxm7njYpRRl8na5prGbUZSgl5T6qqiXc6qo7jhS5XAUOMTkbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58bOV5vG9ALUXx7WdS+Ul52tCqL+hIqkhv0iSYebp1E=;
 b=i2miAawAOmJMD+hiwCa28e57OjWOSBY8ULE1DHE2Ux77RxsTwlQCA/kitunPeE575fFo/BZ2xlQq03E1KHufP25PtvEbY1mGBKMX/TsZALqNWBeywXESJaMi5ZPHypokVUEZyF5eFOZDgTJZo2KU7BaGSGUrBOtaBynFwAhCUz/hFwPuJsIC6tlkWcHaNA+odTmSuNdIfdU0ZcAsXcMbhJQlF/xZAxGV4LlLKOdnWiIXZzSTHxY8LqC5L1eoHsXiuujxPkLRGURV716QTpZthzGQGcn9sSrH10ejlkmBJUWj7RA+myBtEuh7NBaTtpjRKJeCWIYDlLmEELLiVY/wLQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 08:54:23 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 08:54:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "feroz.afshan@gmail.com" <feroz.afshan@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Net-snmp upgrade to 5.9.5
Thread-Topic: [oe] Net-snmp upgrade to 5.9.5
Thread-Index: AQHcp39q0HtM8ly4jUiYE+egU7lb27WWPILw
Date: Fri, 27 Feb 2026 08:54:22 +0000
Message-ID: 
 <AS1PR10MB56974C92F0A1ADBAD52FEA7BFD73A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CA+ZN1cdtUfAf9b36tpvye9JxgsUSgm28c5C-4WZ3VzTMXMJzcA@mail.gmail.com>
 <CA+ZN1cf8HJLV6RNcGoS3wzHNKBJPLckT=2d8+Z-wMMi6oKMt7A@mail.gmail.com>
In-Reply-To: 
 <CA+ZN1cf8HJLV6RNcGoS3wzHNKBJPLckT=2d8+Z-wMMi6oKMt7A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ee09278a-fadf-4725-9323-7587f86cd585;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-27T08:47:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9285:EE_
x-ms-office365-filtering-correlation-id: 4dc5fb13-360e-4e2c-2033-08de75ddcd7d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 YE+sectATSGMZmGAN89TYTCjZ6DBnD6BzMvNoZoyYPMeo7Vs6q2U6x2Cx3KUuFLpmudztwhG5ftht66eVzb8D5opLVMEsjGJ6vElqeb3tXCVGt5tY8sCcky7y498jWFwwKR73u2o36JmEq1v02AUlu24ebS+V9dr1Mm5SJJ+4idxr11+/USFDgsrvB1cp2poBClZwmFE8TkeMocIgU8Nbdrk+APGRaAvXlyf16d+3YJdILQw5ERL0W9nPhbQecmPwtdxPjeyxzHfhdi6viYcT3Kz7rruraBPAOiMazoSBMia+9OzIOBo+T0ucdxw265gw3Y17PnPvHs1fkahAjKr68G1ayPU6oyQVd5KB16VPtyeOFtE9nMLlNym6eMGT+ACR95H+FhTfHPRpKO0Yd+MnouHwcVueCm5ZERmERHOCsQWySWvzdOpHbsIXGsABD8CH/2T+ZpmgiBPuB4rEYXwRLVttsKE4fUkPLE23Wcaggab4wSbi8CegQZ5ouXMT2TrhVlnvVH5+kuEASVspItxlCPAG9MXEuPDFBNDmC9Vn5Egb1TDhlp1N8nYfu9MTDORdkt8npUqCzC4vTHHulv2BKFvW5l/3+tFlPcniUZMaF0yGRAUTkbpHCRm5EHcIkZB4jclKAY6C5uj0kNPDr5zh9mTuOHSvh/tYKPvNN3abYWjDZxPQeD/Kq78+iHxpDvLmlZyOUBL3jRtExnzaMqOzlRfSWLH3pgI0EUwjDWvV1NNDn7ORNbbsIvQ7hUHmMU5QESPXm8yOeKP0mtWDYkWOE5bbXSHzO6nwr5Uj5DPPhI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UStjd251YTg5SmhISE9JaDFtS2JDVC9ZSld1bHBvU25PUlRVbDBFWklub1Rv?=
 =?utf-8?B?UEpqYTdLU0wvT3VKN2lvTldrdEQwWTVxak4rTk52akJtZElMV1RnN1EyU21S?=
 =?utf-8?B?Rm1VemgrSVJwQ2RLZDBWaGRpd3hqVThUcFpLemNNQTZldHRFeENDRjFGYURW?=
 =?utf-8?B?dEcwcGdJMjc5aUlTWk93TDV3R2ZIbDFNRHNNcjVwMmkyZFRYLzFXRzQ4UHlL?=
 =?utf-8?B?Qld5d0V5WUZLczBGbHQ4Tk4ydG1TVEdlbDdlQno1Z09RR2NPYi9rYWJZUnMr?=
 =?utf-8?B?QUNxNGZlSDFGMmpHYS9RV1JGOHlldTZPN0dSeXFTNFViSVlCQzFhOEhvRlda?=
 =?utf-8?B?dEtvNHNZZ2dtSkpOcWxQK2NNS1E3YXIvMFQxMEtUZ3NQOWpJM1hzMGRwZW80?=
 =?utf-8?B?RnRaa0Fjcmhpb1NKZ2R6ZnE0ZExXN3VwQTY5cGd4dE1sckdqYXNWZFp4KzVB?=
 =?utf-8?B?QUlxQnhPTnRlbnEzV2ova1BWejFjM2E1NjlVMEFlSG5jSXhiR1RuczR5Wkty?=
 =?utf-8?B?SlhkYU8yeGpORmc5S3k3bkJLL2puSkd0azNnQ2tpcVVIdk43Y2E4Smw1L2FD?=
 =?utf-8?B?enlOUGtsRW5vQnZrRUZCaDVHaWZoUlVGMjZQQTUyVHNxdTluN0VVaE5yaUZR?=
 =?utf-8?B?a3F4NWlaOGJkYlIxWDFGL0pjb2VTUHVaTjBudUpNS1FNNjMvNUxWNFNvTVlY?=
 =?utf-8?B?OW1wUHJaY05qMTdYM1hiM252bVJNbkFmOWhaTEdSRDlNUWhKdmhXK3A5Ym9Q?=
 =?utf-8?B?a0xEMUJOOXhhYlRCZm9wS2xrdzZyZ01QQk1CdDcyb0lzTlpzYUNnMnlpNHI0?=
 =?utf-8?B?dUtiVHFvL3ptL0UzN0ZRdnloV0tNZFpvNHhvUWU1cU9zS3JGUDJkYW9iS0pr?=
 =?utf-8?B?Mzh6NnBPMzhWTGJJQmpTbmt6d1BreGJwL1hzUFJlK0p3ZlkxOHNROUs4bG5s?=
 =?utf-8?B?ZUU3cWxKeTdLQkJjMnFwTHc4RTdmRXptYU9QcCtzY2I2QXV4RHpHa1U0K3FZ?=
 =?utf-8?B?dTlMdkd3RGkyUUtSZHlHdVdVT0xjT3c1V1c5ZnFjOGJSQjU1SXVIQmhVVkR5?=
 =?utf-8?B?Sk5GQlVLZmsxLzVDeG8xQ2x2Q08rbDZiM2kvemhTUGFMNnpnNGROK0lmQngr?=
 =?utf-8?B?aUsrWG15aGRhSjViZjcwOEcxVVVvZUNxK2NMMmZaVlZXZExieXVaODA4S1Vu?=
 =?utf-8?B?Tjk1T0tXOVBSS1Z3YXdHd1dXZEc2RmRpYmNhbE9kNzk3SmVYY09OK2NWUXB4?=
 =?utf-8?B?ZEV5WVo4TjVOenAwYkxVZlc5VjAwWms5MUhpbjhiTGhMcE1aNW5xT2o4MXR0?=
 =?utf-8?B?ZVkvcHVvTDN0T2JPYXVrRytkV3h3eEdXMFpCRXVaTHFLWm1nNXZ2eUdQQkt0?=
 =?utf-8?B?TUVLaHVGMjNkQ3ZjeXV5enRsemlsdGhyQ1dRbnR4TEV3b09oeUUycjZ5Rllp?=
 =?utf-8?B?aW9BVjEzbmUrNWVHd25yS2RJRHRvTktMQVF3UENtOUl3aEtsckcweFhSeG8w?=
 =?utf-8?B?OHNoL1c4dkgxY0dhQy92NlZPZHoyMHdnWHdCZnc0MmtmdUpkdmQzb0pYTk53?=
 =?utf-8?B?Ung1YkUzUk0rUVRiOHA4WS9NajUyTit0dXFqZjduLzdJY3R5bHFGUEM5RGE0?=
 =?utf-8?B?d000NUxXMEx0c0JiOGd5OEFsSzNWZERoandhN3BjSkZrc0xIYk5SOHJZT0tR?=
 =?utf-8?B?WmM0WWdIRVBkaS9kREIvYTV0WVVYOXpCZHNNWDcrMUJvSTA1a3dsL1R3NTdk?=
 =?utf-8?B?Y3BLY1FYd3BEUTlBcVdhUFNhRVg0akRMZWRKSDlGRzlQRnphK0hZZUFVTXVG?=
 =?utf-8?B?NXVvaFYzaEFSNFdjaFI5ZlUyOEplT2tPRkVMQndaSmN6ZVZ3ZmdEck5ZeHQ2?=
 =?utf-8?B?bmhycktQL2t0TkVaZDdtYzZXb1J4MU5yOEV3S2s1TmNyNUtQbG4yL0hZWll5?=
 =?utf-8?B?NUlrdk50dEpqWG1JcGo1QnkzS0tzZjJmLzJQaEY1UXNQZjYzR0RGQVFUR3ND?=
 =?utf-8?B?akxhZkluR3BDV0dkWERWNkxScmVzZkZXSUEzRzd5ZWFxbVIrbFNlVkpkNXUr?=
 =?utf-8?B?NGhDc1hZdUtwU0lFbjZuZjZHRkZKZE9ndXNHV2swV2o3ZVJzQTlCcnJPTkNH?=
 =?utf-8?B?blVIU0RJSVlBMml6RG1zTGZQRXBTZjlDRStzSVM2L3JKOFJacnpGSnQ4Uklt?=
 =?utf-8?B?Q2NrYU05anU4Z3o3N2xSQU92dTBUMHRXcjFzZjZuQVpSTkpaQW85ZTJ2MGxw?=
 =?utf-8?B?NExMbndOZUVQV0JMU0xqZytlODMwTUp4Qzh5WUdmMng3T244NkllYjMreFJZ?=
 =?utf-8?B?dklwb1JBYWRrTDJwMDZYUXNlYzlOVm1UZXFNSjJ0am1OWXJpVVN3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc5fb13-360e-4e2c-2033-08de75ddcd7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 08:54:22.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2R7Gjrii+RhUhUzEl3MOweGJDAy59kjAjhfI2Ae+vqQOXzRfcxVPvxBo4kXOAflUqlkxLI/Vg7YSM1laBC0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9285
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 08:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124694

SGVsbG8sDQoNClRoYXQncyBob3cgTFRTIHJlbGVhc2VzIHdvcmsgaW4gTGludXggZGlzdHJpYnV0
aW9ucy4NClZlcnNpb25zIGFyZSBub3QgYmVpbmcgdXBkYXRlZCwgb25seSBwYXRjaGVzIGFyZSBi
ZWluZyBiYWNrcG9ydGVkLg0KWW91IGNhbiBkZWxpdmVyIHNwZHgvdmV4IGluZm9ybWF0aW9uIHRv
IHlvdXIgdXNlcnMgdG8gaW5mb3JtIHRoZW0gYWJvdXQgcGF0Y2hlZCB2dWxuZXJhYmlsaXRpZXMu
DQpJZiBMVFMgc3RyYXRlZ3kgaXMgbm90IHN1aXRhYmxlIGZvciB5b3UsIHBsZWFzZSB1cGRhdGUg
dG8gbGF0ZXN0IFlvY3RvIHJlbGVhc2UuDQoNClNvbWUgYmFja2dyb3VuZCBpbmZvOg0KaHR0cHM6
Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9TdGFibGVfUmVsZWFzZV9hbmRfTFRTDQpodHRw
czovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL0xUU19CYWNrZ3JvdW5kDQoNClBldGVyDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEZBIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjcsIDIwMjYgMDo0Nw0KPiBUbzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogW29lXSBOZXQtc25t
cCB1cGdyYWRlIHRvIDUuOS41DQo+IA0KPiBIaSwNCj4gDQo+IEkgd291bGQgbGlrZSB0byBrbm93
IGlmIHRoZXJlIGlzIGEgcGxhbiB0byB1cGdyYWRlIG5ldC1zbm1wIHRvIDUuOS41Lg0KPiANCj4g
SSBzZWUgdGhhdCB3ZSBiYWNrcG9ydGluZyBhbGwgdGhlIHZ1bG5lcmFiaWxpdGllcyBhbmQgaW1w
b3J0YW50IGZpeGVzIHRvIDUuOS40IGluIExUUw0KPiBicmFuY2ggKHNjYXJ0aGdhcCkuDQo+IA0K
PiBBcyBwZXIgTlZELCBpdCByZWNvbW1lbmRzIHVwZ3JhZGluZyAgdG8gNS45LjUvNS4xMC5wcmUy
IHRvIGFkZHJlc3MgQ1ZFLTIwMjUtDQo+IDY4NjE1Lg0KPiANCj4gaHR0cHM6Ly9udmQubmlzdC5n
b3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNjg2MTUNCj4gDQo+IFNpbmNlIHZ1bG5lcmFibGUgdG9v
bHMgcmVwb3J0LCBuZXQtc25tcCA1LjkuNCBpcyB2dWxuZXJhYmxlIHRvIENWRS0yMDI1LTY4NjE1
LA0KPiBkZXNwaXRlIHRoZSBmaXggaXMgYmFja3BvcnRlZCB0byA1LjkuNCwgcmFpc2VzIGEgZmFs
c2UgYWxhcm0gYW1vbmcgdXNlcnMuDQo+IA0KPiBJIHRoaW5rIGl0J3MgYmV0dGVyIHdlIHVwZ3Jh
ZGUgTFRTIGJyYW5jaCBOZXRTTk1QIHRvIHZlcnNpb24gNS45LjUuDQo+IA0KPiANCj4gUmVnYXJk
cywNCj4gRmVyb3ogQWhtZWQNCg==

