Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF9C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 07:31:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.82])
 by mx.groups.io with SMTP id smtpd.web11.18174.1673422286709314811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 23:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=pFlby/Jw;
 spf=pass (domain: siemens.com, ip: 40.107.249.82, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Naiaq+8wTO62/M/QlFG94vGpj0FbHKMvlpwbqHnLu504KZqOeagFExTsVpWwpGxs1PWQT85wmoCn3t/bRGhdq6Et4vnl8DiJiRDihuW5At6rtLaf/UHyZ/k8LUplhbCv8i0D30oxop4B7BfC/nKpU18FehXmBx04mHLMi6rQ++JSZGm1KtAiybB7UTKC5FyBpMmURI5VmEEQhRSxqQjUbHkj9m3DIKuCCdbZ+sI3a8UzOxo0NFjNmEQsGAbnBQJHI88YqPiVEWnq+DZI0zu/25j5StHKatHW5OShKbDChj+If/zjc0yvMvJTbS3urQda3/pf0aywVAWDY4sWVUy5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDPUfDrOunWAql//PEJkNW3oQ1LhSBnI0fEWFfDLNG4=;
 b=HsWgVUW1WipxdgfQ4TwmR8i1XvJyq3QJMMMvdpVs1AYCx2Xg6ZeW7uV/QcSX+Qg3RO7eZuifZbQ5EFDvEf5w3wL+lEjCDLjrTN6rZw5pkt7eQQdizabZ8pKz4YwpMPOh87mrWcDP2cTO2Ac2wrT4qf8G2meW+BiIRPT9lqVmxaqUUZ+abcQgGrtQdWy2qYPoJNB0Vpsexl4e04FLPlQWsrNMxCuBnnqCmJYkh0aBIpAP4Q6T0/XTADHjxlYU7z98qBkWS+s4VE/6Bh63+FuvQoh7lpv1wkaAmXfk7a4SmayTGokHZ0V4MiqF2LAzXCfw+c7jfUcB/4fBVsalyo1h2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDPUfDrOunWAql//PEJkNW3oQ1LhSBnI0fEWFfDLNG4=;
 b=pFlby/Jw+rLAzq3LXPExrfk2yuAV5GRLgeRm/5iBAWoF5yM7+yGc0YBVeQptrJ8xOIEzYIKe4kxXCO5oswZ9YbCdmGlHn3n7kS5/5C+1hTrD6mspa9FKzvH6rn3YW5mazCZNexuUCnr4YFINf8Hw3Af4ZHFbdPlLotROv9s4x4ixcs9rY/hMBdm4vjYNMDryVFy1E0kClqkoK4M8KZCny4QCpfDbLiLPjK+GXbiOG8nhIiBCic1lruUxjC5u8iZmxcziKiIrz8LKDKopeYYxh+zlwNc7S307eNMxC4sMY42YDVxss9SlorhOfvetT7uV3XGWSi5sbr7rbxpHd2T2Ag==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB3518.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:140::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 07:31:23 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b1b4:7747:54f9:cfd5]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b1b4:7747:54f9:cfd5%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 07:31:23 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: gRPC
Thread-Topic: gRPC
Thread-Index: AQHZJY60vfVbk9eiN0axk2UE/bSI3g==
Date: Wed, 11 Jan 2023 07:31:23 +0000
Message-ID: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|VI1PR10MB3518:EE_
x-ms-office365-filtering-correlation-id: bddeda6c-c4c4-4076-0ca9-08daf3a5d74d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 piMuWIAGyxyv3wwjrEHie2DiDanrrT84ebSvdvTVamnSH4hi9dUD/fPWzuFWaNl7CgU46qK7GxzVT3lzNy2hyjWMoR1mJDlYLunvegPzHDarLq4nfJbHJxQ5yGvKL6fcpaw0laLKRfb9RrPDkU4kmS5Ebh2Fvr2PfqbK/nvdMvQ0NVwycDP+MpPn53nKibqUEnebwwygiMa68Tqu244kZ6ZjEyBHK213sTfS1Z/qCUe53diDmCuzmi1jwrLrGGrk9Qk3jIsz6nUA9tTmUVYyEhkVlFtvGfjOgwqzt5SdzY/ixX7aRUvP995v9amSvsv5o+qVnEqTtVl6//Dqq3Qh5cK1P5koK1MCrfr9YzvxrYPOfej68JXzBbUwWl7T/KH5WQH7Uq0pgcLrXdaOIQwY7gb52/6Pi8yPSH6vt4ejnq6lsa4yFGTufEtqs4wr2tyFTo4lX1t7Y67ybIG7Gj9NmAGO9n/Ara5ExabDv2cUptShyzcFAdooAucRdBjk0nx/ox7M1BWBVzOLaHmfFtKWUvPpIdfqr/zXy6k9Zg+nL51/C6kv4WioRJhehGgiGZm5ecYViSP6UyCXp2o5OMxkHiS0Fcvm6lic0ItetX19G55xQdYH4OtfEMnAcO0HcK/LPHOWol076xBMJk1FzYZfxiKttpnqFxZ5INWyfD09GFrax1lm7PVtfAoW9MNlAU7w8KejrugrQBtMxPJpjK0y3z2TxsbBi2ugw+5Ds3YXAbC+DqFpHADkmV6lLHYI6ik8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(66946007)(41300700001)(2906002)(8936002)(5660300002)(36756003)(8676002)(91956017)(76116006)(6916009)(66446008)(66476007)(64756008)(6512007)(66556008)(316002)(71200400001)(478600001)(6486002)(6506007)(558084003)(4326008)(186003)(26005)(2616005)(7116003)(3480700007)(86362001)(82960400001)(38100700002)(122000001)(38070700005)(124863001)(199113001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZXFjTkNVaXd5elp0Wk9wT2lYbTZSelh5cnNiWDFncHRvQ29GYllDbVA2N2lY?=
 =?utf-8?B?VGlqdGsxVGtVSWNRMWwzWlZrUHozUHloNklnQjdEMmNsdVpLSitaZWFRemwz?=
 =?utf-8?B?Q0NXL3ZWSDhaRFZrbFRwSlNCdll2SHpaMXB4RGlnT3RHRE8vM252V1BmdnFq?=
 =?utf-8?B?dk8wOGswSkNMTE1QTzYzWnpuU2M3WFBsTnkwa0t2RDQ5ZlJDUXY3RWRHZkRT?=
 =?utf-8?B?UFRaT25aanROeExjWXJ4MUhnVnZqYmR2SWVKV0hoaHhudkYvRldTa1pNR2dG?=
 =?utf-8?B?Y1RhUWc3ek9qVTB4VklaZ0ZyYWJxN2tHUGxqenpRajZRU3orQmlUKzVPVjlm?=
 =?utf-8?B?aXJ4SnVoM2lwa050Y3d1djVwYVhBbGVjbHV4b2xSeFJ5eWlqUnNTSFIzY1FV?=
 =?utf-8?B?dXVESGZqUWc5aTdFWWpqSWViYlZXTHFHeUwxVVhmdXFqc1dsdno1YVBaYUE4?=
 =?utf-8?B?a2ZPZ3gwa3ZVbCswUk45ZjFGZlNkd0drMTByY0tETGk0NHBXUGRKOTlyK2w0?=
 =?utf-8?B?WHZjcjlBRTd4SUxPVlBNMWVwTXM1ZmQxWWlDTkNWaDlWTkdVL1o0MmZiTzhF?=
 =?utf-8?B?N2ZqVjhOQUlZcDdySm5oYXFtYmx1eFU0V0xCem9lUkNIVlBMajNSN1NhekR3?=
 =?utf-8?B?VzdwcFJRQkNibjhpNUFSdk5rKzBsdVFtaHFXTmk5RXdra1lBcVdnSzZOTEpM?=
 =?utf-8?B?K2NXRDJQSmIxeEFaOUFWZFgwcDBsTEpTcmR2b2JFNEgzbVlTS0JBbWVaMVJ5?=
 =?utf-8?B?WkFMc3YzaGdpUFZpalAwWWM4MmNFOUx4M3NlSzV6SjNrY2pCc0hzT3VIeXFX?=
 =?utf-8?B?aEZ4SVJadUFqOEd3Rng1YlhCNjNkcXlxWUhkNHBGMXRIUFBmSm1yODhoWXpW?=
 =?utf-8?B?MFd0QnVIWlNlblZMbGVEMVUxV0gwUWRGdzQranlubjF3K3RxTE9iV1d0RjRt?=
 =?utf-8?B?eVFFWTJsTEZXT2VkY0VESDk2WldKbCtGVGRldTlQZllpN2dETk9NK05sR0dL?=
 =?utf-8?B?ZVFaVk9MSVdWb0liOXJxMmZZRldYaVZwbE1NQVExem52bnVrNFBVOXFVSG1v?=
 =?utf-8?B?Zmk2RmtQOHRoMVZmcEhKN2VkYUxnQ2tOVk92ZjhwamFXcjlBWXR1NXRHbU5y?=
 =?utf-8?B?NkNoNllhczYvVGdEUXc5aXI2d0xWMjd3UTVLUnBsMmk4Q1E3T3ZqaDVlZFF2?=
 =?utf-8?B?dmV1RUU4bDU5RWJBeW9ldGRhOTAwMDVKYzNQTnMxQmVNczM0c21adVU0VzNl?=
 =?utf-8?B?c21sTGREbXo2TnI2VFZrczBhS2gvZ0JaS2VOMUdGWEtIU0IzQXkyQzMwMGZV?=
 =?utf-8?B?ODg2cjA2YmJoQ1N0SU9iRS9rTXZHTVlPUndFYjVsRTBMck0xbEp2eUozdHd6?=
 =?utf-8?B?ci9HYU1wUGRSZmdRbmczTUl6dEd0czNJRnRFWnYzMVBKa0k1eERWVGpxMDlL?=
 =?utf-8?B?SDRRYW9YRk1QOXFsVzg5ZkxWd09xUlY4RjRZOENSeU9Ca1RwMTJDTUkwVUdp?=
 =?utf-8?B?aFRDSXMvOERiR29hd09HeHRhVmdPbGxKWmE0MG5yS1RpbGgxS1M2V3k1UlNq?=
 =?utf-8?B?NFp3eEpnbWZmUmJhcG1HZjF2UWdFazRtSVZYVmZVMTcxMU9SS2VnSC9LQ3Fk?=
 =?utf-8?B?SjVDYWNvejdGTGRjNlNRemhrUFpOL2FjbGVBU2NaM2JFZmZlbmtmVCtNTEtG?=
 =?utf-8?B?Zmw1Y3Q0M0VId0M4VXk2ZHRXNzlMZGxUZ2VTYzNYUkc4Mk1ET0NwOStWYUlR?=
 =?utf-8?B?WlFmRzJQOXUzQUNyWnIvb2pQMm5wb3dubEU4Y0N5R1RnQWdJQ0QvR053YWtP?=
 =?utf-8?B?WW52VXJva1lTdGZqWGtxYjBGZk42MVpLeUg1SHIxb2RxZFdHVHdDL05ycFB1?=
 =?utf-8?B?d2IrcjFKamlBcDBFK0lXM3gxMy8xbDA4RTMxQ2ZnaVpTSEpna21VdEMySGtJ?=
 =?utf-8?B?Q2U3c1FSeFFYSklLNjJpVS81cXBzdmU0YlFwU3JiN01MUXp4L1QxdXh1QXdT?=
 =?utf-8?B?K2NVWjFkYmtFWVZhLzdGOWdMNVFOVzVvM3piNFBPeHovNHVZa29NUWlBamQz?=
 =?utf-8?B?VTN3V2dsVHN3WnhEVzErYUdMWlJzUGNFc2tZVytSdTNMZkdwYzNrN3M3VDdJ?=
 =?utf-8?B?djAya21GMUxWckpLbGZ5cDgwMlNyQVp6eHJheCtBR3pFR3VXeHl3Y1U3ZDNW?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <739C0E31904D744FB426301E9FA2208C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bddeda6c-c4c4-4076-0ca9-08daf3a5d74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 07:31:23.3494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oJEbEkE8/y030GPqCguNhhAXUsUH89jSFuHmRVUIEL9beDWcqsp/Fsw7CXv0Zwamw7xReCNZR8UuEqGCoJZL1+3QWcWvgdvz7kCP8M0JBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3518
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 07:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100544

SGVsbG8gU3RldmUsDQoNCkkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IGdSUEMuIFdvdWxkIGl0IGJl
IHBvc3NpYmxlIHRvIGJhY2twb3J0DQpnUlBDKGdycGNfMS41MC4xLmJiKSBmcm9tIG1hc3RlciB0
byBraXJrc3RvbmUgYnJhbmNoPyBUaGVyZSBhcmUgc29tZQ0KQ1ZFcyByZXBvcnRlZCAoZm9yIHRo
ZSBjdXJyZW50IHZlcnNpb24pIGFuZCBnb2luZyB0byBuZXdlciB2ZXJzaW9uDQp3b3VsZCBiZSBi
ZXR0ZXIgc29sdXRpb24gSSBndWVzcy4NCg0KVGhhbmsgeW91LA0KQW5kcmVqDQo=

