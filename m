Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75776CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 21:44:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.55])
 by mx.groups.io with SMTP id smtpd.web11.2258.1760046242107367114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 14:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bRvz+NIe;
 spf=pass (domain: axis.com, ip: 40.107.130.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXlNtncN352XPFGGnkhYugL/DmKj/hup4/3YInq0PujhxT6JTACW+J4h3YlScNpHAK236teGhxIFCs/6/g2ysJwEwpFA4OLOD7K5axPyYxNmSQ48TggJdR/xt8eIXAwmQIgkXjiXysc/mXJqFDkFPaIOA4n/LUTQtz4h6TQuvXSZJIf7cghlc/UiVo6rIakHxfZZbx3Eg9RA8ah3qeu2SdhNebGH2FAI0+pBnf96mwb3EICtN5A49FhYnhYSqK7ljNkdixzvVJ0tPKAdMDkvyo0qqXCcuV9VB+CoFB7rzXcg09pA/AUp24L0uq3Yr/pDAzNru28v72N5C3IL629CRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPkaj9qe8z6hU6a370Ao9ihC3EFNMY5YNsgD0t/C0Dk=;
 b=Se1hwdxb96xybdfPiR1pjlhR15JKByvekwiodFkdCVRCKPnq524JdUa9ACko1TLxRuQvUKbcvf8h0TeIuUZhnqg7jV0ZeEu32NEkQdYIcAvKH+mRwKqc6ooDd91FS7qK5cU4auemzTpY7Gphs3sWBhunUgXlRA2gp0Sb96Ak4SX3q2S6SAODXMks2VNiT/IgFWrhHsFFLYTs9NmSC2eMdmwJd2YUwF7keVyL0eLIsZxQaIVpVcNrjr+Z1rlSmpsO+4vDxudPaVzZ0Qy/2GSLdKw+Sme13tuEdzmR4GedXM2L5Ova+Ruipeb4EKurhlyoTtIBitKWGe6HwQqTUWwgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPkaj9qe8z6hU6a370Ao9ihC3EFNMY5YNsgD0t/C0Dk=;
 b=bRvz+NIeQObytEQSScvTyLXSQmtqCQQw1ScjGaOd1sB1BSn5XArhR6qnOT5fJKEPXzroS9sSPGLjhiRLeSyNmkCoStXXeXt0r+/MJJNFxwvrDp2gmBW1E4LjTqat9qUo0puI/10ztn/UKnjM/K5aOXccbqKAguhBBwi/z/RfLjQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB6753.eurprd02.prod.outlook.com (2603:10a6:20b:2c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 21:43:58 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 21:43:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Last call for Walnascar patches
Thread-Topic: [oe] Last call for Walnascar patches
Thread-Index: AQHcOT95YwEeauXXU0C5+RCr5uGccrS6WCCw
Date: Thu, 9 Oct 2025 21:43:57 +0000
Message-ID: 
 <DB5PR02MB102138E2023F0AF2403B2ECAAEFEEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <6822ecae-ec76-4cc2-84d1-b2aa7efe0698@gmail.com>
In-Reply-To: <6822ecae-ec76-4cc2-84d1-b2aa7efe0698@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB6753:EE_
x-ms-office365-filtering-correlation-id: 44fa91a3-0950-4312-7392-08de077cf3c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MHlVQndvN2F5VVlRRHd2VXlVb3lmZjBlbWMwQUd3OGFCdHF4ZStXTWJzUlQ0?=
 =?utf-8?B?Tk45djkvS3VoVzlJYWptOGluU0pCQmJIWU9rc3JmaCtaQ2RibkZacUtsazV6?=
 =?utf-8?B?c3lSMGQrc0w3dWY1aU1lZG8vOWRBU242ZnNXckFFTU5oajJ3eVVFMjBHbis0?=
 =?utf-8?B?UjlnS0hYaklLQlhkbWR0VThPNGRFU3ZqeXBoRHhGOEZIcDhVRWxrRkM4T1Uw?=
 =?utf-8?B?eFhFSnp3a0hPZkVNWVcyay9kNUY1RStCcXh0ZmZqV2tFK2JGcHdVR1llMzMx?=
 =?utf-8?B?M09IWlB0MTI1V1lDTjZXWUI3Z2VtaVYwS05tZkpKeTR2T0JINlgxekpUWFpp?=
 =?utf-8?B?UkFUM1IzSkRXUlJaS0FZU1IrZDdoeHg1ZWt4azVocVpUMmlhRjFSSjg1V3F1?=
 =?utf-8?B?WDFwdEhaamI0QzUrMzd1WGMvRkJ2L1BCQ0JlZkE5NXF3QzlQQzkvWjZkVEFE?=
 =?utf-8?B?YjZDeE0zZjNJUmV5M0Uvd2JtRm5hQVU5Ymgwa2I1OUNqVysyUFRGblpFVC9y?=
 =?utf-8?B?VlpKYWtUaW41SW1lYkM5d0dtZEt2YjFmVENEVUY5N2hvWWFmODlVblMxeVhw?=
 =?utf-8?B?alc3UUNEME53NDdwL1pLTnBVdVYrTGZSWjVKWm9ZR0tIcmZuNElKZjd0SzhZ?=
 =?utf-8?B?MWUrSXRWTWZkSHN1RTBBSklZSXl3WDZ5aU1tRjcwRStYMFNBZEx4UDJDY3hW?=
 =?utf-8?B?cGdzQ1UxemFUT2JWQkZsMzhsTnp0ZktyQjhGMFZrWnZpM3cyWWhmbWxScDlP?=
 =?utf-8?B?eFRKV051WnFBN1AzQ0RDNDd0ZkxlZXowQ0tZVDVyWmlqa01pU0RFSWxIOUkz?=
 =?utf-8?B?OFZvdndQbjdwUkZjUDBHeHBLMHJUc1FXeEJ6aldkMTRNazRESXQrTmwxVllr?=
 =?utf-8?B?dkNmVFVMSGFNd0VsWE5yZlJmNmQ2OURlTmszejNZaFduYkcxcWRvaURDZS9l?=
 =?utf-8?B?c0hrOUZZbGJjaGhkYjNSL3JyNVlDeU83bnBPT0EvQUhGb0kzaTlUdWxoNjVv?=
 =?utf-8?B?R2UyeTJ3anRxT3R6Umt6WmEwWTNKRkRkajRNenJGM1RSK1pNRmpRK2ZpeDRz?=
 =?utf-8?B?b3krbjdNU1c0TU5lTW9TcnpMYjQvNm9jUng4bmJmMGc5MFVLU0czZjJjYzQy?=
 =?utf-8?B?bEdjN2pFaSswZ0tGZ3lIKzExT1ZGS1ZLNlpEY3UrdHdyYkx2aG1CNldOdjZL?=
 =?utf-8?B?QmEvSVJNd0xPcEpRS296cDhZMGdZWitpMUVKWmtMcENWNkt1Ykk2N3RHTXZj?=
 =?utf-8?B?M0RQSjY5SnlxeXRNcStLZmo1Z1o5YnFyM21TS2JsZURZdExJRytnSDAyUHJO?=
 =?utf-8?B?RHpOMUY2dExOTnREREplRzRTdndtcDY2eVMwQ2FUT2c4ell1YUFBQ2dqYk9w?=
 =?utf-8?B?Z3duNEx4TjZGL2ttTWdUSDZkTk1PZ1d0dGdBa3pnUit5WUxza0hFY3J3MnVB?=
 =?utf-8?B?WHB4YVFGendxSDlJNmJPRFFldDkyVC9UVmxNNUgrbWREYXovK0p0U0xUQnB6?=
 =?utf-8?B?Ynl1NVRRUSt1L3dtMzZoRnhuejJ3WVhQOENONERsYytsMlVZZzJrWGRCNkFZ?=
 =?utf-8?B?Vm44TDJXWkdwWWhmdEVxanRYbmVoUW1CV0RRREU4RmVoUW9ZTnRNZXovZkRX?=
 =?utf-8?B?K1NNdCtDNytDMkFQRVdNb293UHBhekh4aWV4aVFHcEtRN1FvbEU3NUQ4Wm1m?=
 =?utf-8?B?RWhja1JSNTVGK0MwakFDY0tQR0cyeUZzL0o5UG9xK1dIWDQ5ZzkxeEhkMGs4?=
 =?utf-8?B?dmhnMGFiRllEY204T0xsT0N0QUYzU2djSnJQZkFPWExSa21oQ05lNzFVb0NC?=
 =?utf-8?B?cHpteFVBWUk4WCtRR1JtVnJxQjVFd3BKNDljTU5CTjQ0aVd3V0NhdW9DQjd6?=
 =?utf-8?B?VDJIaktTQmlYaklqOWVDbnl0SDg3bnZPM0hmc3lENVl0UndyZmNwdytBbDlj?=
 =?utf-8?B?cXJuM3IrRVJzUmpYeW1KckNTVG8vN3VsMnAzL0ZzeEJxbXdvK2xtMUwyM3NG?=
 =?utf-8?B?OHNiUG03WCt0R2JlSUxlenBFVWdLYlljOXg0Rzc5UEdZT2NET2ZQSjZMd1Nj?=
 =?utf-8?Q?e6c3rX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akFiNFhkZFQvc2g5OS9ETnhhWXVndHEzdGtXcnFjejRwK3JVWXcxNDN0NkxF?=
 =?utf-8?B?RTIzMGlGb0FuQjFEYXYxS1lzRWQzYjhLZHk1YjFKaCs2ajh6WlZ1S2dxTlRH?=
 =?utf-8?B?dlVnOWlMMTZPSm5zRndUK2hwTGxBMVpCbFA0eUE5SndvZWk0WXplY1kvUTYy?=
 =?utf-8?B?cVVGRmorVHpIZDlMeTM3NjJJaXRkSXNSRjgwbHlxTTREaVhackVKc3NMVWRa?=
 =?utf-8?B?OHQ3U1c4MXV6VHd0YkhLeDgxajBBck54WWxNZCtZTDJyd0YwREp5UFNpT0dk?=
 =?utf-8?B?OFRqNjNHS0lIY2J5enRsN29BZEdGbkd0N3JickVJdkNoZWR5STJQekduTXRp?=
 =?utf-8?B?dlM1Y2ZZZkFVYkVVdHNuNEExNmZ5VkZTR2JOMkFRckV5MCtCQUI5OWt4bFg0?=
 =?utf-8?B?ODg1cEJnTTBqU0U3aFUzNmR3bTM0OUlXN0ZxcnlKYTJaRVE3ZDNNNTU0SUpG?=
 =?utf-8?B?dzBGK05PZFdCa2hqZUF2M0cxYks4Y1FKbHoyZmRKSVJUVGU3cERuNHlMRmdD?=
 =?utf-8?B?ZVQ4NDFuSUtja1hBYkdXaUE1UkttUXZheWJOdDR1VVdnSnJ6VkE2N2NqMUFu?=
 =?utf-8?B?ak1BYm9lVG1DMVMwVld2ZERnUHEyYlhTWi9GSnR6aCtCOStES1g1bDV0MXBX?=
 =?utf-8?B?cDdvbWpDRmNwR3B1WldabGJlTWw5aXMvNmJna3hFTHFoaDNWcVFPRTBiYWln?=
 =?utf-8?B?Qmk4NXM4VWEycGpFbE5zQzl0Q3VzQ3ErQmRkMFI5ZVp0ODI1N3pQN1I2RElt?=
 =?utf-8?B?MmhGQWtPMWZUWVBqakkvUDZSRVFrQW5SSWpHbkRsVXdIclh3UXlaTWpRUEp0?=
 =?utf-8?B?KzZsK0ZKd0F6OTltMmxNOHZmeDZsM0VFdzFrNjFFWVB2MklHVjNvTGZod3Bk?=
 =?utf-8?B?ZDlLS3FZU3NabkE2eTd1UHk4WlIzc1RxVlI4Z0tUcWltUDVPOEZ5MkUzSTZy?=
 =?utf-8?B?bFE4Vmpndmc1QnVlWDlXMmFIdU94K0l4TWlRSXE3cFRlaGw5a2QwQXVnQkZ4?=
 =?utf-8?B?eU4zdHJQWW9SNmJ6Tk1PUGJMajBsc0NOcWFUZko4NFZ1dXBIUWpmbDkyb0Iy?=
 =?utf-8?B?R09COUErUThSMkFwTmJrMWpqcisxNnZwWW5iRlhSRlJuMllEa290RjIxSU1u?=
 =?utf-8?B?QjVzRy91UVB3dXZ1UDFmUkdldTNWVzZqV3RTUC9Mbi83R0VrQTJLQ3YwNFhv?=
 =?utf-8?B?cmVvNWIzb2h2MFhLTWZJSVhJbUNXV0VVL1V5akJPQTJBNXllZGdpcmtlVUFC?=
 =?utf-8?B?VC9qYzkyUE5JSHlZNi81UkhlRjJVOEUvRXhLalFQVmlzSUx5WmNoazRScDdP?=
 =?utf-8?B?QmxPblhHbG0rR0ZxZ0w4elNVSEo0bTYzRzVOc3Y2STRnTjFhQTl1MzFuRG5i?=
 =?utf-8?B?SXJtbTJzajJiMFMvOENETW5EOGlaSVBvZkJ4Z3hGWld6aklSb2MrQmU3QXNy?=
 =?utf-8?B?VGhMQ28vYi94eVUySWFvSm16bUhYM2lHYy9iTktRNkZqelF3Vkl3V1k1VnVQ?=
 =?utf-8?B?L1VBSlRka2tRVGpUY1hUbW9rbGl4S2xvc1g5NG5OTmR0djF3S1NTekhxQ2ww?=
 =?utf-8?B?aHkyd0V6Y3pVU2h6Vjl1YkdLTnJHQ1pDUy9IeCtrbU0zZzVkbmt5UGcyRDBk?=
 =?utf-8?B?VE9HT3V2K2QxWm1GSTgwcytoQzMwRHJxQlI0bm5nc0NrRWp2YTRvN0xzZGc4?=
 =?utf-8?B?bTZ0U2tld0FaMnVJaVNKNlZSL09tSTdLUThEZ2hGd3lQc3ZCejhTZG1EaW93?=
 =?utf-8?B?KzltWmh1eE9TMDV1YTZJTWRSSFA0OU44aElqWjFzcUNaamlqN2tNV3VIZXMy?=
 =?utf-8?B?bUozQ1gwYW1jbk1wVG9uUDd3R3JUSTltSCtEV2JNWTlTcGxmZnVpeGRQdEJl?=
 =?utf-8?B?aVE3NktBeXFxc0Jnd25uSEFYTDJNSjdTOVA5OUJia2lxempHZjM0VUhaWGU0?=
 =?utf-8?B?cHZIMldseENFcXBJMDZlOW5wcEpqSno2ZjVrUElmKytEWkNVdHUzVVZKV2p1?=
 =?utf-8?B?aldXeGJFM2J6c3BObDNPUmFKVkV1UFg4NDBTVFFmTFNQMFVMNFY1Q2VURVBi?=
 =?utf-8?B?R2xiUWwrZzdNRGxDOVc0Q2xDMnBWM0xsV0s1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fa91a3-0950-4312-7392-08de077cf3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 21:43:58.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVO88yr4NV+8cUttUfPK90+DsZGApTGcz1JtlsEJVYLLdtZpRi2M5z4Stl7bTvNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6753
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120454

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTZW50OiBkZW4gOSBva3RvYmVyIDIwMjUgMTk6MDkNCj4gVG86IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtvZV0gTGFzdCBj
YWxsIGZvciBXYWxuYXNjYXIgcGF0Y2hlcw0KPiANCj4gSGVsbG8sDQo+IA0KPiBUaGUgbGFzdCBt
ZXJnZSBmb3IgV2FsbmFzY2FyIGJyYW5jaCBvZiBtZXRhLW9lIGlzIHBsYW5uZWQgc29vbiAtIEkN
Cj4gaW50ZW5kIHRvIHN1Ym1pdCB0aGUgUFIgZWFybHkgbmV4dCB3ZWVrLg0KPiANCj4gSWYgdGhl
cmUgaXMgc29tZXRoaW5nIHlvdSB3b3VsZCBsaWtlIHRvIGdldCBpbnRvIGl0IHN0aWxsLCBwbGVh
c2Ugc2VuZA0KPiBpdCBieSB0aGUgZW5kIG9mIEZyaWRheSwgdG9tb3Jyb3cuDQo+IA0KPiBUaGFu
ayB5b3UuDQoNCldoZXJlIGNhbiB3ZSBzZWUgd2hhdCB5b3UgaGF2ZSBzdGFnZWQgZm9yIFdhbG5h
c2Nhcj8NCg0KLy9QZXRlcg0KDQo=

