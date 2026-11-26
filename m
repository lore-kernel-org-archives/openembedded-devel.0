Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6838.1795733298615175319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 14:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JTZitgKm;
 spf=pass (domain: siemens.com, ip: 40.107.162.20, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLholowQjzaQDlDAF0nX05KPX+8SFBOJHS2U0CEeyoDF5EUAQcYnsyCRLUEpB+hVX02zJf2VT0R9clXvWTSo7vNuwRAII3ttbCiyp7u49qn0UBgcFShGWzbQ1615CPMehUuu5+Xg1Kl8WQVbGNseebmsZ0jK08z5uxUqtsPzw5SQZb6CV5WVXMwaT04sWHCnXbfRoAHqu9sjSvNu2PHEN9jq6nHIL5dR1Gmx+fq7K1yEqyCv/C91/5QYOxpH+/kUzzB/PJycFyew4Kr6fvTc3u6NMSEzE9Xc0+XeGw5mKrAmM3ZsbYVIcx4RVIyTGSPQsH4wztdzwJjjsrpAaU/wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p54owXHOgF6WHgv96Zd4jADei0vh2Dslt8i8x9RvFBQ=;
 b=vaw7k1VgNY9QwuOI2k99cPneLDPGyq6YsdDjbu7Joa8qBtib75qq2NGXh04E9jJ2t1fRpRwMqzIUTZMAAt+FFKCWzJLkOfY/7O5tcSYfmoCSfW8aE6gAS3nuuTMGsp951ZH0af3rcx4hTHYUyO52JNn2ryEL7SLdPFCF3CfuGP5had1L/6PLGb40dL5x3+Cu30YvBrzdPB3IobIjsppPWqwRn3zU1O/tJD6+cgcCLQoICG7MuLCEkq36l/tV3XWim0gd89sYh6lwVvlZLuBYcY8IYkGKOSTSyfbtZzM3ec2pEXREJB8os9e6UmMLJLxjYcvDStV5WoaTRGlVO34IDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p54owXHOgF6WHgv96Zd4jADei0vh2Dslt8i8x9RvFBQ=;
 b=JTZitgKmFFNU/VousSwlR8PyJOYfqHtHLEV8/3u/JF7PN8hJdyTCaYloqUh1L5ppZ+4zoIc7ZEWd8E+/ARBXU1n9HQVMPvMZFBgTtNi9y8VgsCFYMYHWfg4Q+QYIm0p/9MfnZsY4Hl7gSRXJ4u2VpI0aN4k5FQoUIEFYviDH0SLDWuL/4qc3Exj1luqcMLz2Knj1JnfPfwgeigTcleGkrPwV+V38tTrI+WPpvi3ItwNl16MOnF1pv+OU8kZlf6whfYtxYI8ca05hvQG+1O5/B0N9njrHuo6akUrFlR0zmcK5tIOeI2kEyKYTBmAkxu2mv7FygNRxPnD4C4bgj9YEzg==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PAVPR10MB7060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Thu, 26 Nov
 2026 22:48:14 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0688.001; Thu, 26 Nov 2026
 22:48:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "anuj.mittal@oss.qualcomm.com" <anuj.mittal@oss.qualcomm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH 1/4] nss: patch CVE-2024-11704
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 1/4] nss: patch CVE-2024-11704
Thread-Index: AQHdbX1+cMpU9Nzkd0icgKDdGl+SVbc28bsAgAojVEA=
Date: Thu, 26 Nov 2026 22:48:14 +0000
Message-ID: <AS8PR10MB50737FB80A7639A8FF4A83D9FD422@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261105232905.3707642-1-peter.marko@siemens.com>
 <CA+s=J=yawZOL4Tiz8dXMerA-RPFyKmPC7AthRmsdVa_3TMnjCw@mail.gmail.com>
In-Reply-To: <CA+s=J=yawZOL4Tiz8dXMerA-RPFyKmPC7AthRmsdVa_3TMnjCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=72c33a10-7d72-4936-ab1b-62a56c56be4b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-26T22:46:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PAVPR10MB7060:EE_
x-ms-office365-filtering-correlation-id: 8d18e7ce-e24b-4c40-1fc2-08df4c0f5adf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|55112099003|261009223027099003|18002099003|11063799006|261022115727099003|4143699003|56012099006|261026140227099003|261026121527099003|261022105027099003|261021121427099003|261022075727099003|261028144727099003|261102123227099003|38070700021|261021123027099003|10067099003;
x-microsoft-antispam-message-info: AzrOWjcFoVWmN4U8jxfw9bMPpt50Bpl+wUVxJlqdZMyigr1bN5uKNOtRfd0+TAlAkcWyDKgu6NDjhMFa4L24xU+zThsymyzUretRqKxfMw2y1j0cut7EtGKAbcGdFkvk633y9gEHC3izskGY3LMt1uEWPlSE91mcCTiG0GB73qrnCNbaWygc7NHvWvVguqJp1QSwTaSQcOfOOFd+DlkD76HIi77uPHUjAkk/WOjd2oGojlpNtHy3SHLdmMUPY3Dka9SjaOHVQwWA3Wq/HsXP9pbR1ivszZ9ntzUfLB1pq7HcOOUfRkt6rk7WKY6gl7CWm36VizsbryniMRoA78JRcFyGVn5rw+XGPnxO0ra7zRE3uW5xfcS81OhZh6XcrF04TCtRdF7EJbg9Qy+OoMErudS1dCZJ4B10R4uFI6BiZ5jgLl7lt8gxLro3N/C15/HpiwBi2nHSXpHqzNvPtgxLQ7U/wH7ITdjGF6Gdi2wKMEZy8yDUEKsNTU9KZ6YNyjk4qgqiE6kdOXzE97jsbjdaE2z2wvuiZpcckrhdfWTdMkgysrjnKr1GQc683wcZBKPsXvdhOjnTJTwtbB4Miq1J4zg6H20jiatiG6ke87j2aEHiF8+N2rwjyHk2h5ojW0nrrY0SYnREKzphv12yxSwjei9LQz+tcqGkmZjFdxV0eMc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(55112099003)(261009223027099003)(18002099003)(11063799006)(261022115727099003)(4143699003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261102123227099003)(38070700021)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmNTUUdMeFBXeTB0cXRnbzNmVTRxaEQzdldBRlRRbFh2VC9rY0p6N3YzcEl6?=
 =?utf-8?B?TzRvby9MYkNFZkVjekhCenhkOG1IVFlDTExQbnZpSzNXMlVxRXVTakxpRXFu?=
 =?utf-8?B?ZXJ4bVZhNmw3MWZTbWRpYTFmOThSUHVkU2lQZjFOOHM2QzhsbExDZSs4V0Nh?=
 =?utf-8?B?dTRYbHlZc1FLK3VPbDBMR2swLzZhTGhqa0NYMW5FRElVNmc1VlBoZURTUE5O?=
 =?utf-8?B?VGhuNkZkbWYrOC9uZFVpRExwNzNGcTY5ZlZSNmFhVjFNR2w3OUU2UzJPaWZr?=
 =?utf-8?B?bDh3L3p6Q1RSUVNFMHFGZGNxbnRVSzBYMFR2Q3lRcGFOUldxOFFFRHRPRUhw?=
 =?utf-8?B?M1lrZjZaTVlkZDQvUWZqTFVjNmRqNzZHWng2THJnUnFjdGlEd3JXS05ocER1?=
 =?utf-8?B?elhlbEcrTUlpRmFoemxKZis2SWNmQU10TWtUUEdPb0lUNnVVeFNRSFFPVzRw?=
 =?utf-8?B?VS84SUZiSzZRWFVUK2VmZDM5N3d2Z0pPUWFOZkh4RWtpM1gyeU1RV05iNzBT?=
 =?utf-8?B?Nmc3WXN2S1pHOEh5Tm90ekJ6U0t5aTRtWW01cEtiYi80WWFiMWFZWDBpaUZz?=
 =?utf-8?B?dFkvMGZJMDkvTW8yc1VMbEk1aUpWd1ZkcUFoTHprbEgxMUZyVnYrbmYvOW12?=
 =?utf-8?B?N3lwQTRIaDE5TzAxSFFubjcrczgvL1graEpZMGY0TWVtdkZBSFZOY1d2M2Yr?=
 =?utf-8?B?ZlEvQmpOTEUzWmFRNFdSWUlTMHhiUGs1c1pRV29Eb1dGMVBZT29CSlByNlNq?=
 =?utf-8?B?TFlrc0grcG41MUgreWhiTWJ2WlYyellLN3hGdStWR3Jsa2cxa1p1a1MyNWlq?=
 =?utf-8?B?b2VGRUJtSGVKaUNuZ1pybXp0clZFc3U3c3BibEltcmx1bENISDIzcTRMcWJz?=
 =?utf-8?B?N2MxYUlnUUpCbWpJYThsem9ON3IvUFNRbElvUXByQis1YWpudkN6RVM5Yk9l?=
 =?utf-8?B?L2U4aEVXRHFCbXM4Umt3TThsMGtwN1VUbTNGVWZkT0x0Z2ZjdGhVOUlhZlJx?=
 =?utf-8?B?eDJlbXVmN3FJWnFoOWlTaXIxOWdJRDN0TEczR3RSak9CckQyOHNLV2FIYWpi?=
 =?utf-8?B?QzUrMnlZdnFUdC9DTjRRWnpLclQrMFZpK2pabzNvSFM0K0JaanRmN3Z4VnUx?=
 =?utf-8?B?ZFdXc0pEUUQ5a0QrZndUaHAzVDhBZ0l2ZUcyS0dUVDNncG5tZlZNODJ2QVIr?=
 =?utf-8?B?MzQ5YUMvN0t2MlNzck1yQnU5b0tDbEVQZlkxZ3RyOEsvN1p1aU92b3VaQWU5?=
 =?utf-8?B?aUJCUnF1TzlnY1l1bVVsUUlzcGNTKzlFMFJ0ejBBSG1EMGhhNXVpMlRlQ1lW?=
 =?utf-8?B?UFEyRnM1a3RqZlNtdEc5S1FEYlgwYUZsWkxaOU5EL2kzZWtrak9YRldremFy?=
 =?utf-8?B?YXI0MUVrcTBBVmxFNE5kQ2hsam1LVTcyTWpyeUZvSEZGVUptSmVRN1RxWi9T?=
 =?utf-8?B?dkZpM3ZiZlZUamZlNDdOS1dROXhlVTJSSE02eTFwMlpLU0k4VElrRkhoMy9m?=
 =?utf-8?B?K1NlOURwTHo5RlduTmhpdTVJSU9kVG5IRDJERDl2YzJWNkc1MmdkeE9NV09R?=
 =?utf-8?B?M1ZzSGhZY2VaRjY4Q1F5bkl3UlJRZGVXdi9Dek5BZWQyVDYwVFludzI0akNy?=
 =?utf-8?B?bDE0aXUreEloSC9oSDFGSzdweWh3V0NhOS92MTN3SEN2WldIR2xoTnZyd05p?=
 =?utf-8?B?ZFdKbmZSaUxnaUwyMWdkaGl0ZUlqR1N0SzV1ekNxWDBRS3pjK3FXVUgrQ3B2?=
 =?utf-8?B?ejZRNlZ1SlFBTEJtQWF4U0NtUlNkeXkrTWF6RXJjZXlUWURDMWc5SXFvVWRR?=
 =?utf-8?B?OVJqNWd4cURZVkZ1Q1hlRXBYTkpZTkRGVndFWjFBNVZsZmJYWGUvZUVGbElk?=
 =?utf-8?B?cXdMa3VuQWppbVNlRW5SR01OY1FxMlc1bXZrTmdqcE1KZTNNOFJXS0JNVktE?=
 =?utf-8?B?eFU0ZjRacUVYcVNuNnJsRXhXM0ZVTnZUNXBlcmpTeFFpQkprZ0p1aXR3OTZS?=
 =?utf-8?B?TnJjcmlaM2xUWnhSL0VKSDZYY3lCSER5aTRmZmEzcjN6N0I2UE5KUWRkYXVM?=
 =?utf-8?B?ejJDUEtjZ28zTUNPRXhZbHBDTTRkNHJSd2lhZWZ0S3BtYjRlUnNrRFcxeTNy?=
 =?utf-8?B?WmtNWHNXdnZRK1RJN1ZYUys4SHU3d21YVVlxblNrRjNsRHhBams3cTlpTGRk?=
 =?utf-8?B?b3Y3M3ZxYW04emlJdVFUSkxMdFoxS0JIdS9QeTRpMGJLNTZWb2p4aDZ6RThG?=
 =?utf-8?B?ZjdLL21DVFE0R2FOakVaZS93a05maGZaUjN0bG8wU0Q0cXd0ai9uMyt3WEZU?=
 =?utf-8?B?TWJjamhjRjBxb1BRU05QWGI5WGY1b1pIZVVuRWQ0bGVZZHdHUlpJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d18e7ce-e24b-4c40-1fc2-08df4c0f5adf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 22:48:14.2562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cT6yRJEuAZe4H5yNiRl2bKcj1QGe7KlCeykSXrW1T08zd+p4SSoyHCCPXc2s0UmLIR5kJlHrij2tL2Ss6fkvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 22:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133093

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW51aiBNaXR0YWwgdmlh
IG9wZW5lbWJlZGRlZC1kZXZlbA0KPiA8YW51ai5taXR0YWw9b3NzLnF1YWxjb21tLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDIwLCAyMDI2IDEy
OjU4IFBNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW3NjYXJ0aGdhcF1bUEFUQ0ggMS80
XSBuc3M6IHBhdGNoIENWRS0yMDI0LTExNzA0DQo+IA0KPiBPbiBGcmksIE5vdiA2LCAyMDI2IGF0
IDc6MjnigK9BTSBQZXRlciBNYXJrbyB2aWEgb3BlbmVtYmVkZGVkLWRldmVsDQo+IDxwZXRlci5t
YXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+
IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFBp
Y2sgcGF0Y2ggcmVmZXJlbmNpbmcgWzFdLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vYnVnemlsbGEu
bW96aWxsYS5vcmcvc2hvd19idWcuY2dpP2lkPTE4OTk0MDINCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAg
Li4uL2ltYWdlcy9tZXRhLW5ldHdvcmtpbmctaW1hZ2UtcHRlc3QuYmIgICAgIHwgIDIgKy0NCj4g
PiAgLi4uL25zcy9uc3MvQ1ZFLTIwMjQtMTE3MDQucGF0Y2ggICAgICAgICAgICAgIHwgMzAgKysr
KysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9uc3MvbnNzXzMu
OTguYmIgICAgICAgfCAgMSArDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvbnNzL25zcy9DVkUtMjAyNC0xMTcwNC5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvcmUvaW1hZ2VzL21ldGEtbmV0d29ya2luZy1p
bWFnZS1wdGVzdC5iYg0KPiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvcmUvaW1hZ2VzL21l
dGEtbmV0d29ya2luZy1pbWFnZS1wdGVzdC5iYg0KPiA+IGluZGV4IGI2MjM4ZDYxMDAzLi44NzRh
ZjljNmJkYSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb3JlL2lt
YWdlcy9tZXRhLW5ldHdvcmtpbmctaW1hZ2UtcHRlc3QuYmINCj4gPiArKysgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb3JlL2ltYWdlcy9tZXRhLW5ldHdvcmtpbmctaW1hZ2UtcHRlc3QuYmIN
Cj4gPiBAQCAtMzMsNyArMzMsNyBAQCBRQl9NRU06dmlydGNsYXNzLW1jZXh0ZW5kLW5mdGFibGVz
ID0gIi1tIDIwNDgiDQo+ID4gIFRFU1RfU1VJVEVTID0gInBpbmcgc3NoIHBhcnNlbG9ncyBwdGVz
dCINCj4gPg0KPiA+ICAjIFNhZGx5IGF0IHRoZSBtb21lbnQgdGhlIGZ1bGwgc2V0IG9mIHB0ZXN0
cyBpcyBub3Qgcm9idXN0IGVub3VnaCBhbmQgc3BvcmFkaWNhbGx5DQo+IGZhaWxzIGluIHJhbmRv
bSBwbGFjZXMNCj4gPiAtUFRFU1RfRVhQRUNUX0ZBSUxVUkUgPSAiMSINCj4gPiArI1BURVNUX0VY
UEVDVF9GQUlMVVJFID0gIjEiDQo+IA0KPiBXaHkgd2FzIHRoaXMgZG9uZT8NCg0KVGhlIEVYUEVD
VF9GQUlMVVJFIGlzIGhvcnJpYmxlIGluIHNjYXJ0aGdhcCBhbmQgSSdtIGFsd2F5cyBjb21tZW50
aW5nIHRoYXQgb3V0Lg0KVW5mb3J0dW5hdGVseSwgc29tZXRpbWVzIGl0IGhhcHBlbnMgdG8gZW5k
IHVwIGluIGEgY29tbWl0Lg0KSSdsbCByZXNlbmQgc2hvcnRseSB3aXRob3V0IHRoaXMuDQoNCj4g
DQo+IFRoYW5rcywNCj4gDQo+IEFudWoNCg==
