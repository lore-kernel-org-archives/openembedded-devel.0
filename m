Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88F7C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 18:04:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.66])
 by mx.groups.io with SMTP id smtpd.web11.14047.1739037863672396240
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 10:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zEr6xDdf;
 spf=pass (domain: siemens.com, ip: 40.107.22.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgPhMw9F/DGdUhIAcZLQI1WVE9G6QpZLsLEVnwH1B5Z9q+NwYUX0vszGUKlkxFfd0L5rIcPj/K8y1B4lMQiDyzuJMR1I4qZ44QoZDICIdJV177cMXhOX2XWX34S0skEHdDt6+eMOts6ZRVHevZV5icIVcG+dSj2lfF32LqfgnbMGhtDbiPVRzgZq56AH/JTGRZzBnH6NRMlxxadE67CZZ+w5qd8AIPdt1G9GbYUobqm/HGWuW9o1GGgqhVLjWwuOv78/FSE2irkIythRjFTNzWYpNAhyWL05rVOMC5uUrIJ4UdLAGiWo7vDYhQmSdJ2+4crjkUMJhaUstdL+RrUxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDXym0fRbMJlnkNkthDJvilE/srda1KQvun0kjmnFcE=;
 b=o+cBGthaL7WRKBMJocRmBOglS3m0aa9DmI0bCmqShBR63XsW9t6z9BqJtdORbY9vhXT+I3XDIJbeZDlhcU5SuHWMLuCmxOeMhm0oH3J5LMN4WrNMIAnqyiLc9FPWilksaf5OEHUa9GmrOF+dKx4XmPivYI/Hj3MsGiiPbTdrcX6J1Bs4RklS0rG/tq4J88BkJB6SZoSdYift7iVdF5DrDP5DKkYw40HVwcS1SMcPrPziyVKJbK6MTubjKZT6fLJtqvlUx65bxzpxNiMc/IbVT3kT/tpKg+d5IxPMJB5RQRFg/n3glZ8pUpJor+yAA3pxIe293dHLA+oo87jekJh3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDXym0fRbMJlnkNkthDJvilE/srda1KQvun0kjmnFcE=;
 b=zEr6xDdf2Ka48jLIWmPgt8hyzOqelLkCaPwHFYkbl+i0bQYbVsxTKc/nj0GDH26PwQqz5OZw+FXiZjNb5t0U2unqBa6x0Zvpfz1y/KkIuM18RGAIUudsyeouL4PN2uqF1PH8cntKOC8EL6UO94Mjt3cXwXF5ji9HQ6sX3WOrYHC2kGSt+HNOYlr4Csg1EPfFkJDPOLvqNEnTX6mUtgo5V9Azv+ldxbXj/YuPJLDk7xtWiAtErsg5lB1byA35j0rO4V1T1qx6B/8XzWDgIjJ/Lk1gRZlzfSf+5gyzMYSWOaJNCqBehafIOQ44dAbY+lGLoOGJWJOIp4je/udJ54qTEg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DBAPR10MB4091.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.5; Sat, 8 Feb
 2025 18:04:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8445.005; Sat, 8 Feb 2025
 18:04:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package config
Thread-Topic: [oe] [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package config
Thread-Index: AQHbejq2B7BTCBqu90qE5KG/vNerNbM9rRkAgAAEAGA=
Date: Sat, 8 Feb 2025 18:04:19 +0000
Message-ID: 
 <AS1PR10MB569711835D42CC78E89BC505FDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250208150308.2451484-1-peter.marko@siemens.com>
 <20250208150308.2451484-3-peter.marko@siemens.com>
 <8abe2241-03de-405c-a862-d4c4c5e754c7@gmail.com>
In-Reply-To: <8abe2241-03de-405c-a862-d4c4c5e754c7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c68b4e4b-e226-45da-acba-7c4e7a836053;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-08T17:56:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DBAPR10MB4091:EE_
x-ms-office365-filtering-correlation-id: fc774587-0e99-48de-53e8-08dd486b0260
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MTZVRGdnUUllVHg1VzVXSkw2WHpyWEw3WnZDS1l5ZFg1WXVXNzNPbXFHVWpS?=
 =?utf-8?B?NldiTWF5MkJZUS85V0Vld2ZTRlVFTlE4MjhNRUt5NTNHRUVKL1V4dkpXek5T?=
 =?utf-8?B?MDhSZ3g4cHFCcnp3UXBrM3VYSFhndFhyWHJpTUVmSUJpUE8zYVhGN0NiNkJx?=
 =?utf-8?B?NHhkamtLRVZFaXFLN2h3WFpVOUIxdzlKMzR3bHZkTzFvMjRpMU1GRFp5Ykp1?=
 =?utf-8?B?U1l0WmFtRzJab2lDT1FRUjBySnFOQkRqOFZpOWxTUWxxNFl4cnN1bFZsdnpJ?=
 =?utf-8?B?K1h4bE1DWHRSaXNpQjBRYlBKQWY2WkhtSERTTWROc2xXVDNjTEFMTUxiQU5Y?=
 =?utf-8?B?L0NHeGRPeE5Ya2w2SGdYNi9ENFVqRXFWVlRTdUVlVUNQZmJKV0o1T2ZDRXlr?=
 =?utf-8?B?VGJsekZPc3podGk2QWFISExMNEl1N01sVk1nYXBROTAzNmZHNjE5WW4wd2da?=
 =?utf-8?B?NzZRNTI1bTJrYW5rNzg4WEZNRW43WDB4WkVLTGlTVjFnamZvVHRQZ2hDRTFD?=
 =?utf-8?B?MG9wV1RyQ0hNWWZzeGw3NDR1ZGo0bHpJL1c1cnFIL2JEQWw2U3BpajArdW9m?=
 =?utf-8?B?emtZdzhvMFlEOE5uMjFsc01tMnpSRlM5dDlTRUR1c1NsaWxUR214eEplK3Jp?=
 =?utf-8?B?bE5JWGhMeDc1bW55THdWSUYyekVzM2VnYk5uelpqb2lwbFAzdE9LY3lDUE4v?=
 =?utf-8?B?TlBmV3NzWlNqNnpMWXAwMU12cmtaZXpWMWtwUFRsdi9VdmtleEUwVEljanpB?=
 =?utf-8?B?WWxpT3NVTDhXR2o4THRPdGU4NjE3cCszZVhMZXlTQkRQSXI1blNPOWNKU0pu?=
 =?utf-8?B?WG9LRi9HU3ozd0tZRkRCVXhZMmVKeXBIMGFiTGRpL3ZUamxJZjRISmxVR3NE?=
 =?utf-8?B?S0xFOG05czdUam41TkN2eG1EUnBsN2JSM1l5YXQwd1pFbG9UZHBubFVmRkJV?=
 =?utf-8?B?V09sZUZWRCtQY3lZekVEQU5tbkVDWnluTHZ6ei9PVUFsRytqK29sMkhJaDlP?=
 =?utf-8?B?YmNXMi9LU2tOaXVRWmNCQk1EdGcvejdCbUt0MGZIaE5haGcwaytLU05LQ21I?=
 =?utf-8?B?anBiNHZscDcyTndnVEphTU5tNnhubU12WUhnWHR5MjNoZGdXZVpaWTF0aEVv?=
 =?utf-8?B?M3lQY0REcElHdzlyM1U2UXFpOUpMWTNBc2ExV2ZhVEgySGxsMDB4dUppQ1pp?=
 =?utf-8?B?RlVBRGk5cmZUTDErejhvYXRwVTdEYjd4MERpTVk3OU02VWY1U096SDhvakFI?=
 =?utf-8?B?K3lPdytyUTBkTWRKdm1iVWI2TkdXZHZWWDExQ3JseTlPbElXZzNrMm8vbzNE?=
 =?utf-8?B?bFoyb25pZzlqM2RRRmF5RnJLdjFoaHBqQ3BHRWNBMnlhMWpsZ3llSkhvWU1i?=
 =?utf-8?B?bi9jWnJmaFR0V0J0c2tZL21tbm1QZ2FYREh4RXdSVUErbXdtQjNlVFBhNXli?=
 =?utf-8?B?aWhIMmxveUhIZVF6cHpoWTlEdW91T1lhUEMxSURmSEdWS2U3aEFjQTRIQUdP?=
 =?utf-8?B?eUFrWGxCVFNqNWlJTndib1QxeFNHMm1vSVo2RXdtQzFXVzlvRGthNU0vU1FU?=
 =?utf-8?B?eUI5WmxHclhWYnF5eWgraXloYWs4a0MyZzVDNkhKcTRYUFM1UHR4dlo3a3Vp?=
 =?utf-8?B?dVg5Z1M2OXc3LzF0V29oSE9HQWJIemxDdmxDVlk4M29pUHNRL1I5Vnl3RThI?=
 =?utf-8?B?eXljKzlrdnQ5K1V5TjFxT0dNV0p3ZTFUd00wS3hKWUhLZ2gxNXJlYTZxZzQ5?=
 =?utf-8?B?V2EwVHRUazJzazFPc2Z6TmxqR2kxOWlyUEVWK0VhNkVxZFFhTzNReU11STdT?=
 =?utf-8?B?QWljSEdtWlRDb013NGZCSmxNcUplekw1UldKTUphbjh4ME1ZYWgvc2czbk0y?=
 =?utf-8?B?RG9Jc2N6eld4ajNFeFBlOURSQnRVS0MyWTJkQU9QNklqK25lVGhNQ0FpaElp?=
 =?utf-8?Q?r+9CZU8qBEaSQ84yWGwBk/PYUJJ/D8tK?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M05ybkQ1QStRdkJmK2M5UUVwWDI5YVAxMllRU2tJeVRwNURLL3NHb3dIdHF3?=
 =?utf-8?B?aWhuNDZuUEdGQ3hPU2ltL2d3UG1YMm9Ca1Y3dDRpbHhiWUVjMmszLzZmelY0?=
 =?utf-8?B?NDBYYTc3TU9RQXpVcWlUSTNxV1lkRlJmSTQySEN4bmlISHh4cjRXNU0yOVFZ?=
 =?utf-8?B?R1A3SHRDaXhsZFQ5ZlcwSGFENk5oYnd1WksxVWtSZ3c2R0tGMUxXT2dFUWNR?=
 =?utf-8?B?amlhcUVEaW1mQjZUSXF2TDhBcXF0ZWc5bnRQZTNVdTBxZDB2bTBVK1dNZ0la?=
 =?utf-8?B?VHB1aHdxbWl0MDZkbzZLM3kvSFVRQTJZRW1wb1NiY1pBKytGcXNsWklMSVRK?=
 =?utf-8?B?N3l2UzNCS0FackIwOWxQSXdSSnAvcFdhRmZSN0lCS0d1dEo5M0c0WXRDTWhr?=
 =?utf-8?B?V3JtVlVhaUFjL0pGeTV1Q0w4M0lielZ5d3JGN0pLcGk4cFhveWcxYnl4RlF5?=
 =?utf-8?B?S2o2MGhhL2ZPNmdhR2w5d25aczQySWx2MTYyckFNUkI1c1pQSFlwamowcWZq?=
 =?utf-8?B?OVNzOTZHamRjU09zanNBWnY4akVwZXhnMWF0QnJVVWZVN3lMYjJid1VKZjhN?=
 =?utf-8?B?ZG5WNTJXcmE3UXl4OStON2gxSytuNGYwaFRYTzZqKzhXZjkxbVhSd3g1TENq?=
 =?utf-8?B?Mkp6NnFTTjc1VDg4KzBESVhobWthTDNxM1M3aWFZb3N4dkhueGVvbmFzdXJG?=
 =?utf-8?B?ZTJ6UjFuMUtNQTMzQ1VYdmxEMEl1ako0OWFrT0Z2bURBWk5KcjE5SCt3Zmd1?=
 =?utf-8?B?T2FqU0VsOUJFYXRXd2tNVnFNeklvQmxUN3kyOVIwaG1oS0tMZzdjWTN0MW1L?=
 =?utf-8?B?MDh6emFSQnZCY28rbEluZjRZVTEzbE1xdmlCVmZyOXB3OGVEUFE0bWhpNWd1?=
 =?utf-8?B?eG96aW5UNkM0MlpPRWNHSzZTQmdoWnpsRjN5eHErQW4wN05VaEdHZFNXU0Z6?=
 =?utf-8?B?S010cUVpWER4bzlnZnh2SXdaYzVScXpoN2tFR3Q4OFlTZ3I5OE9sTDZIWEpk?=
 =?utf-8?B?RDBrcnVzQUF0dTVHNkp4eTJ5eHFzZ0tNZ2dYbWhyVElNSDkycWlnL2xnMDRy?=
 =?utf-8?B?TnE5emQwRWF5cHluMnVWWWxVZ2N2SmpQYW1jYmh4ZTdVblRNZjZjM29ZQTc5?=
 =?utf-8?B?SDFHSjdkdWRaay9tbWluMTgzdmRzcDQ3Yk52NEplb1ZpNWdyNnVmY2tYZm1P?=
 =?utf-8?B?U0hUWWY4a1lSVlUvbmUxUzdPelVsVUdLa0ZyR0h3REFCeWVQNzl4ajliaHZH?=
 =?utf-8?B?TmREQWVsNHFZZkc5Mk9GU3Q0NnZhRGdvbXJQMHU3V0dxajFYbjd6dnpXbnpC?=
 =?utf-8?B?dGZaZ1ZpTE1aTTcvMkdvM1AxQWE4ZEUxRElZd3phRmdsd2Nlb1drQ1ZSZHdn?=
 =?utf-8?B?SzRtUDV5Uno3QzZKTHlsMS9uVnI4dWZRcC9mblQvNERMcXVCNlEyTVNsaGpv?=
 =?utf-8?B?ZW1sNERwWkczL1RWeGlLcll4WGszcW5qZTdKOGd2RkRPT2oydm1DakRzeGJY?=
 =?utf-8?B?TW1CSVZoRWZkU2FnTHd6cjJVNm53c0lXOXU0TVN5SDFjS0kxclFxRXVKV3dr?=
 =?utf-8?B?enpueXdJdVI0NmhuY2RBaDBWYlR1Wk5sdkZyQ0RGMHdQR0VBeENYakVEQjlz?=
 =?utf-8?B?S3JhRXFPdHhpSVl5bXNqTVozUlFjbGJ0dStxeWJTbmlSNG96R1ZXcm5pYisv?=
 =?utf-8?B?TERaWFlJN1pSejdVLzU2SWpKOGFWdTZLLzI5MlRZb09vcFl6Z2h6WEsyNmh2?=
 =?utf-8?B?THVHSTNtaEpkM0lsemRIU1Q3MU96QzBodnJucUZFY21WSlZjUnVsUW5WbEVj?=
 =?utf-8?B?ejMvWkN1Q1RTMXpzaWY5YnZzYzRNZWs4L3dvc3hhRnFocXg4THJYMkdtU0JB?=
 =?utf-8?B?VlRxaHhzVmlaUXdpRHJnVzIrRW5adGZuRWM3MC80c2pmY01tYmpIUExqUFdM?=
 =?utf-8?B?MzRJNmNEbkdLNm5JbE1XY2ZocmxRT0JPNkFmVUZPeGFsd3V6NDFtb0krYjJN?=
 =?utf-8?B?NUc1dU9JUHNLcjM2NFZkYkFtcUlpOFZySDBhL1dNQytmQzVycmsyakNrL0ZQ?=
 =?utf-8?B?VmQ1aTkzQTRORUNuYjRYdXZnb2dWN2NZallrdS8vQ1dtZVhsdFVPYzdtQjhs?=
 =?utf-8?Q?ME38FkYmDMS2YkqfA2XQXTgvq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc774587-0e99-48de-53e8-08dd486b0260
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 18:04:19.4823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JI73sA6hzdecOQvWESTwKwuJpZeppJk/sNWaBT2eh/4htMybj7Mi8sa4VB7FxiJRSsI7mEyZAbIAhw+OJq4/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 18:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115315

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkg
PHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDgsIDIw
MjUgMTg6NDINCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFy
a29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMy80XSBncnBjOiBmaXgg
cHJvdG9idWYtbGl0ZSBwYWNrYWdlIGNvbmZpZw0KPiANCj4gPiBOb3RlOiBmb3IgbmF0aXZlLCB0
aGlzIHBhY2thZ2Vjb25maWcgZG9lcyBub3QgZXZlbiBjb21waWxlIGFuZCBmb3INCj4gPiB0YXJn
ZXQgaXQgZmFpbHMgdG8gbGluay4NCj4gU2luY2UgaXQgY291bGRuJ3QgYmUgbW9yZSBicm9rZW4g
ZXZlbiBpZiBpdCB0cmllZCwgd2hhdCBkbyB5b3UgdGhpbmsNCj4gYWJvdXQgZHJvcHBpbmcgdGhp
cyBjb25mIGFsdG9nZXRoZXIgYW5kIHNpbXBseSBoYXJkLWRpc2FibGluZyBpdCBpbg0KPiBFWFRS
QV9PRUNNQUtFIChpZiBpdCdzIG5vdCBvZmYgYnkgZGVmYXVsdCk/DQoNClNpbmNlIEknbSBub3Qg
dXNpbmcgaXQsIEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3BpbmlvbiBvbiB0aGlzLg0KUmVtb3Zpbmcg
YnJva2VuIGZlYXR1cmVzIGlzIGdvb2QsIGJ1dCBtYXliZSB0aGlzIHdvcmtzDQppbiBhbGwgb3Ro
ZXIgcmVsZWFzZXMgYW5kIGl0J3MgYnJva2VuIG9ubHkgdGVtcG9yYXJpbHk/DQoNCkknZCBkZWZl
ciB0aGlzIHF1ZXN0aW9uIHRvIEtoZW0uDQoNCkluIGdlbmVyYWwsIHRoaXMgaXMgYSBwcm9ibGVt
IHdpdGggbW9zdCBvZiBub24tZGVmYXVsdA0KcGFja2FnZWNvbmZpZyBvcHRpb25zIC0gbm90IHRl
c3RlZCB0aGluZ3MgYXJlIHNsb3dseSByb3R0aW5nLg0KSWRlYWxseSB0aGVyZSB3b3VsZCBiZSBh
dXRvYnVpbGRlciB0ZXN0IHdpdGggYWx0ZXJuYXRpdmUgY29uZmlndXJhdGlvbiBmb3IgYWxsIHJl
Y2lwZXMuLi4NCg0KUGV0ZXINCg==

