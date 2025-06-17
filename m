Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902D8C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:49:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.web10.14531.1750152303464239249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hU2HA6OF;
 spf=pass (domain: prevas.dk, ip: 40.107.130.18, mailfrom: claus.stovgaard@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv0UTn6VgH/9HE9COVaR6Ktreg1boReCL32tIzIAJ6lYv/K0SyT8uAmGCKGEGQ+yXyzSO7yn4b4gRRugYzUYlDfDEVYaNAmH5iS+WruM/h4W9v/5qqfizGjih9RzQkMb42E+Kxen9/Qcp2CgjHx2nesQO/+rxQj8MKXfM6zZ01QILV0Y+/FpARWGerhtrihqB6pZY7EjoDpB17hZL711f453tQQNRMAPBvhfaZkaMLQzg1Jz9l7FUn1uMjOBmpRaDoR70vlQdixCXKWuSxPX59IjiCT3FwnBy5pgWSu5vRtwfErPADG2BxNq5tIZnIUR6HqWUIIZ1zT6ui5AGe7ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRR2aNVTVqLHMlfQ7jYvPcho6/1x/z98XOLpP/y9EB0=;
 b=Vm93R3KCFoRGdj7EubA3fQzRPxHQaPEnQZg9d0t77HPNXTZDgrIF926+SVAvrjL9GWWcfheM2a8NQXRokGFmZfbakLQr1WrMCw6m7l+u47bFy24RHMkgL9nW76h3Q/zhrexS54Q1lIkY98G81u8ZltHVwVuRrPW/ajfOLCdaNM4D0jqDP2O1dZv3TQ0LE9k+L3Pg0lhZmhrzJ9j4Axrj5l8szV0YAgYUhyl077JsvvMWXDU74V2gJ4INkJvKDQRzD/11qjSci8BAJniZiKNZnk8xkwhtgzx4aeBAYKZPUVmFNoXgg9Z6ayRCViabISKG83sV10xXZVLrbfQCpfzD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRR2aNVTVqLHMlfQ7jYvPcho6/1x/z98XOLpP/y9EB0=;
 b=hU2HA6OF5Jj2/45uyI5YgW9YCgEeB5OPtu4g/06n68GQYyOf5Eg8c8vhpiSzr+Hl6qtqjzz2J5dnDGRbL4nG+p6NwSLrvw1omTQs3ZUZyjcolF24SnOukmscvWDQEhS92g37PP18679h7xC6fgkvKffPCWkvECSR9K7xNJfCO0E=
Received: from DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:329::18)
 by AM7PR10MB3746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 17 Jun
 2025 09:24:59 +0000
Received: from DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edea:7a8e:e14:dc6c]) by DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edea:7a8e:e14:dc6c%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:24:59 +0000
From: Claus Stovgaard <claus.stovgaard@prevas.dk>
To: "omri.sarig13@gmail.com" <omri.sarig13@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [oe] [meta-python][PATCH v3] python3-varlink: Add recipe
Thread-Topic: [oe] [meta-python][PATCH v3] python3-varlink: Add recipe
Thread-Index: AQHb32my4MzqCnkbi0+zVGv+uburBA==
Date: Tue, 17 Jun 2025 09:24:59 +0000
Message-ID: <eb4d021dd4d3594a2d12decceb6b743071e5ff42.camel@prevas.dk>
References: <20250321084632.1889809-1-omri.sarig13@gmail.com>
	 <CAMKF1sqhQ=SuV2Je2T3NsZV-YZjGtmr3eAqKWC8=ttXUxfQieQ@mail.gmail.com>
	 <e198791b-f3fc-4865-b038-1e4b8c874db0@gmail.com>
In-Reply-To: <e198791b-f3fc-4865-b038-1e4b8c874db0@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB5145:EE_|AM7PR10MB3746:EE_
x-ms-office365-filtering-correlation-id: d7b366b0-67ee-4d40-91a3-08ddad80d4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Wm1tZW9zaFVkSE8yOStYYzNPZlhnSjIyYmNjZDA4bXhHUk1lMmVRcGwxRzNU?=
 =?utf-8?B?MVp4WlpEdVdQeW1IK2xKdlhqd2hHTFRXdkl4L1d5aURod09pZnNxM0Joam9I?=
 =?utf-8?B?N1dvWmgrL3lsNzdRbnNTcmxxQ1dWWnVxVis4T3hWK2R2a1hxMDhrckpKQ1Nw?=
 =?utf-8?B?NkNSaU5Jd0tNVXhDZk9SL3ZJeHdEZnorU3cvNHB5TGhkZ1VhYUkrdjg4Zy9I?=
 =?utf-8?B?b2VrVXkzQlpYbkhCZ3BKT0ZUaC84UmNPbDB6aWJMUjhEUzh6K2tMNzhGSEVW?=
 =?utf-8?B?Wnp5YTArQU4zNk80alUxNTZjQy9xMWhMdGxCRCtvdUhFdDVaRDBJbUgraTMv?=
 =?utf-8?B?TTk1Qk55NDFwNnN4TFIyTElac0pjS2s0UG1mOUJTemtvR3hueEZHeE04bDg4?=
 =?utf-8?B?TlF2REJ1R3JQakFMSHo0MCtCRzg1Y0RqU0VtaEU3Y1FPYXhEb01GM1laOGVI?=
 =?utf-8?B?M0NEcXIwU0NJbTNsaHZFUnRqRFZDMFFtQjRKY1p4M3pxaEZDaXN5WVE3SjEz?=
 =?utf-8?B?SDVaRnFWR3JGdDRBVm9KeS95UzV6VWg2M1lDamhSdFpnRUVzTmc4Y0JkZGsx?=
 =?utf-8?B?ZTd1Rm1uUW83S1NLMkttZUJUUFk3eURFRzRNeFhSNnR3aWpSS1ZSLzFsTHVv?=
 =?utf-8?B?a0Q1UTFwTC9NNXl1WVExbG1IRnFIZlZaRmV4NGpYczQrTFRwMllMaEVGRWY0?=
 =?utf-8?B?VTRZS2xUWnhRLzd4ZUV5aFRZQ3hOZmdSVXJuaVpQRC9hdTFVbS9BTFlrV0d3?=
 =?utf-8?B?K1ZZeTdFYTR0THdiSWtDcDZ3azRGYU1RcmN1eGxXSzlCb0wrZTJSc21RRjFM?=
 =?utf-8?B?c0hTQ0Q5VWl1aG1qY0w5RitLZGdMN2lpSDhTKzlJckRJeUNrWnJKUzFWUEpT?=
 =?utf-8?B?Z1VzVUVRUnJ0VjhmZDdocEJJMzVURkdFdEpoRjNicW9SL0J2T2NmZmtzQ3FR?=
 =?utf-8?B?em5TUW9JVWJONytzQjVXZVRDK2YzaXVsbTUxN3lRT2Vub2dLSWZqN0JaeHlu?=
 =?utf-8?B?UmEycTJXZk5zbEJpQVNvZTB4OVh3VG8wSjE4MjZCUzB4VDc1VHFZRWNBTzZs?=
 =?utf-8?B?VXZrbXJ1dUgzamY1TmF1enlRTlBkczR1bWlwS1diN3FIUnF1c1dHY3prSU0w?=
 =?utf-8?B?RXk5U2xDdnNkSFZRMEpid0Z2Vk1jM0RqZ2Z6UUhxUEhMOGtNenlKMGZ0NGRB?=
 =?utf-8?B?T1NXcitEUjR4NEwzVExFcEJvS0lacWNWTWhYakNqbzAwZXFHZ3BIMWlzZjh6?=
 =?utf-8?B?UjdPRkhBejRZWVZ1YmJwUHJEQ3BLR1dBUjhiMkxhRktuV2VST0puc2xtempo?=
 =?utf-8?B?TUx3NEt4cmhrb2c3Mmc5WnJZYm01RUxPdjVRU0Y4NTRGM09aTVBMV3ExKzFB?=
 =?utf-8?B?ZFZJbW54Y0dlaWd0cXJxWVpHbVZHTTBMSWoxd0kvMGxzOUNaUUJBQTNibTda?=
 =?utf-8?B?VFpPQXEycnJ3b01ieGE0Vm1rNVF5QU1NVnhDMGIvU1dlSDdIMVV3ZnByZ3Jt?=
 =?utf-8?B?M2dhM3BFcWhmTUtTL3ZhbVBDQWJaSTBUcExwdEEybGxPT2tadE1LY1dPSGJq?=
 =?utf-8?B?NC9kelRjTzB1Sm44eUdoc1I3Mm9NSkxyTEUzUzFHY01VMjJiWWZWQkhDdFVC?=
 =?utf-8?B?bUczRUxrYS9WM1loSTFEY3hjQ2pxTmpSTVQwR2tQS2poZEJhUDNTOUF2L2dJ?=
 =?utf-8?B?bGpIK3RPR2VTNm5RRXlNRjA1TmR5VVI2QTcvUXZPNHJtODlpd2orTjA0VWJF?=
 =?utf-8?B?cFdFNHRiSHNuQUdIbmdwNHg4TzUzY1dzcEE2aUF6bXVoNjBJcVJoeTBRWGtN?=
 =?utf-8?B?eWRPb05SYjNwYXF4Y2hySTAyTUFtVFVoQzliMDUxK1hxSVlsV0RLKzJyQmNP?=
 =?utf-8?B?RzR0NFNrU3E3OGNZblAzQ0p5R1hEeWRqMXdNZ1psWCtveWdkL3VudGlNaUZ4?=
 =?utf-8?B?eDIxMDlsQUdhQmVQQ0ZGV0hKL2VjbFNyazlnckJVM3ZhdjdWWm9tMG1VY2xz?=
 =?utf-8?Q?mrlcdoYbsWpaZmOZfyZSE8+zsBVfUE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWE4TzdxbWQ2QUdMdDF5ZlRrWnU3UDNYN1dVYk1BODlrNTdWRjNReEVaVnlV?=
 =?utf-8?B?RjloVDFIZDNvMUJCS1Vma0Iyclo2YjVyd3JUQnZHRlNEOWN0NE5OMkd2SGFP?=
 =?utf-8?B?V0VibkRrY20zMElXKzZXWklndExFWk8zNU5Dc0J0Z3hrNG41SHg4RkVveUtn?=
 =?utf-8?B?WllBQkxNWnNaQTlJekppckxoRWY3dFgySldkcWw0K085eUhQaGlXQnY2OUZP?=
 =?utf-8?B?VUV3WWllMDFubWN3ejZneG9ubUh1MzZCWSt0UUt5NGw1MWpkYXgwMHRpZnY0?=
 =?utf-8?B?S2FpcFA1WUZQeVk4eDBsUnF0VUs5VnIvNmxUdXYydHdZNGNQSG1STGtSY0t2?=
 =?utf-8?B?UU9Mc1N1cjYyT3I4dnQ1dloyUmNaa2syYU1MYitUNTBxYmYycjd5K3dtcmtT?=
 =?utf-8?B?NTdQNHF2RnlkSDNiT1NWaHBsUXJCQXdnM01Wekd3cURqNjJiWG5BMU1KOUxB?=
 =?utf-8?B?YlJHaGYzMHVERGF1SEdTSGlPVWl3NXJoTDQ0cTFiZDB1QUxITmtzVytOTXE1?=
 =?utf-8?B?TGhPUWRCZXVxQmJyZ1UrQVdseHZZcWVReGNLOEMxcFJaTm9wL2dKdEdFRGY3?=
 =?utf-8?B?UFA1RDBldUxaZGNHK2tBQUNZTmxiRGNMSnhjMm85TnRPdCtWT1hYa3dwWVE5?=
 =?utf-8?B?Z2NsUkdUL3JVNVJMdSsyakRtRGNWaFNnUUtUcFA2dkpkTEIyVVhMMFBybEhW?=
 =?utf-8?B?NzF3TFpITjdYKzZmV1dWZDlBU29tc0pUVVdWTGF4VVY5Sk12YmlCanBGOFNB?=
 =?utf-8?B?dy8xc2pWaTdyWW1GOGJyTWdJRTZFTVpHRDQ1SjZzKzB1emJTc3ZpOG5CcFZD?=
 =?utf-8?B?UmhSY2hQTG41SlQ1TnZTNmdpaDhoc3BvTGZjSFVacG52REk5K1VDaGhicERG?=
 =?utf-8?B?bDBiZmVQZlBRQVM2dmtkY2NkUVpnNUxZelFzdVJjQTYwbE5XMEIwYlNQZExQ?=
 =?utf-8?B?M2JIaXc4dGNuOUFWWXNISmdtVlNmZWpvenVwcWZoT0Y5SnhrUDh4MjBid0xS?=
 =?utf-8?B?ZVIxT3pGa1lyNnFmS1BTcXpnd3Axdk5PazFYS3djYTNEU0dLS2pWOG9vb2dU?=
 =?utf-8?B?SGREdk0wdS9uWnAwdXRpcnhRM01SZlljTFBjeW5jcHdFRFU3bHU2NmVTTFkx?=
 =?utf-8?B?YUpBRW91eHdZUktkWmFJTTlWRVpXSUFWRzdxb21wZnRlZzRzUzNSclFRb0t6?=
 =?utf-8?B?UkE2M1pHZk1FR1VsNnFUakp2Z24vKzlvaGxzYkxGMzB5UVBJZzlnVEdDeVJn?=
 =?utf-8?B?akd1dFpTblVRRS9DeUJrVkxoZnVLRXh6bmdpMDU3WU5MMW5hNUM0VVFiV2ZZ?=
 =?utf-8?B?SWRNdURrUE1CY0Z3a25DUGsxZko5RVZUTkI0YUNPL0E3dEtGNWF5VWN5eEFF?=
 =?utf-8?B?R3A2ODZPTld0ODQ4c2NqdWRIa3RDcy9HU0t0YWdrcGt1UjQrblpiUmp1TjQ1?=
 =?utf-8?B?ditrWUN1YS93aWdTWnNVVjJlY1pHeG5sajNaTkpuVG53UWtJWHBtNk1iWHV4?=
 =?utf-8?B?MGtXdW96eTMycktXUHJ1RDFGdXlaUkZjcWtRU0l6MTZ5VkJqMmpobFhEN25q?=
 =?utf-8?B?QmJTdm9zTGlPdGVJQ2ppUnQwdDh1TXBFazlaeDZRakFjSWk1WWNMUUk3NzI2?=
 =?utf-8?B?WU9BZEI1WWw3ZWtaMTdBWlFzMzFYcUwybEZDbFlPNWtMTmJtdlF6WEt3VW5Q?=
 =?utf-8?B?RWlzQy9LbnlBVytEUjkrbjlFQWd0aVNPTXdQS3JYT0xrYk1kN1RNMkgyeVJ1?=
 =?utf-8?B?d3RzdW01WnpXb3ZFN2VpQTdxWHJhcEQ4NmpUQzJ6VFNYbGtvT0RnNTI2ZXlu?=
 =?utf-8?B?UGw0UWwvd21MbHR2YzFVSTc1RE03NFNWSmdVRWVFTTl1RFh1Z2ZGSDcwZkFm?=
 =?utf-8?B?R0o3cmU2NCtFOWVFUVhsWTVoV3hVTCtIYkdOaXRQWjhjWUxma3M3aVdBMzZm?=
 =?utf-8?B?dVo5cFNJRnh6dFNQdWR2dzYwMUVkUTlIcEZaaGdFY0FNSm5PRm5KOEZqSm1j?=
 =?utf-8?B?RU05SEZ2cGxoZ3BEZEtoNHdYaGt0Q0ZvQTZsMWNEczNxenU5cUxRSng2SUUz?=
 =?utf-8?B?UnZHZ2E5SFFIdllMVkIyV3NEZUs1MjNjalVaY1VmMW1iNjFhTmRLMVBjQUVG?=
 =?utf-8?Q?/IxZA14enRuWjKMaJBhhAc3mC?=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5145.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b366b0-67ee-4d40-91a3-08ddad80d4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 09:24:59.0826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJgTk4O4W0X4ARwHgKco/hQX0NiBVXcYQtdTFYkfpepYeeJabQa0hyR8WUbY/4su6i59MTCwDZAakhRYpCtvJYrgCyJ+zqMf9FSaCXBGxFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3746
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D4D5FA5C88B6147B1C7173DC35CE714@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 09:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117924

T24gRnJpLCAyMDI1LTAzLTIxIGF0IDEwOjUyICswMTAwLCBPbXJpIFNhcmlnIHZpYQpsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IAo+IE9uIDMvMjEvMjUgMTA6NDAsIEtoZW0gUmFqIHdy
b3RlOgo+ID4gT24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMTo0N+KAr0FNIE9tcmkgU2FyaWcgdmlh
Cj4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gPiA8b21yaS5zYXJpZzEzPWdtYWlsLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToKPiA+ID4gQWRkIGEgcHl0aG9uIHJlY2lwZSB0
byBpbnN0YWxsIHRoZSBweXRob24gaW1wbGVtZW50YXRpb24gZm9yIHRoZQo+ID4gPiB2YXJsaW5r
Cj4gPiA+IGludGVyZmFjZS4KPiA+ID4gCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBPbXJp
IFNhcmlnIDxvbXJpLnNhcmlnMTNAZ21haWwuY29tPgo+ID4gPiAtLS0KCj4gPiA+ICtSREVQRU5E
Uzoke1BOfSArPSAiIFwKPiA+ID4gK8KgwqDCoCBweXRob24zLWNvcmUgXAo+ID4gPiArwqDCoMKg
IHB5dGhvbjMtZGF0ZXRpbWUgXAo+ID4gPiArwqDCoMKgIHB5dGhvbjMtaW8gXAo+ID4gPiArwqDC
oMKgIHB5dGhvbjMtanNvbiBcCj4gPiA+ICvCoMKgwqAgcHl0aG9uMy1uZXRjbGllbnQgXAo+ID4g
PiArwqDCoMKgIHB5dGhvbjMtbmV0c2VydmVyIFwKPiA+ID4gK8KgwqDCoCBweXRob24zLXNoZWxs
IFwKPiA+ID4gK8KgwqDCoCBweXRob24zLXN0cmluZ29sZCBcCj4gPiA+ICvCoMKgwqAgcHl0aG9u
My11bml0dGVzdCBcCj4gPiA+ICsiCj4gPiBJIHRoaW5rIHNvbWUgb2YgdGhlIHJkZXBzIGhlcmUg
YXJlIG9ubHkgbmVlZGVkIHRvIHJ1biBwdGVzdHMsIHRoZXkKPiA+IHNob3VsZCBiZSBtb3ZlZCB0
byBSREVQRU5EUzoke1BOfS1wdGVzdCByZGVwcwo+IAo+IFRoYW5rcyBmb3IgdGhlIGZhc3QgcmVw
bHkuCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcHl0aG9uLXZhcmxpbmsgcmVwb3NpdG9y
eSBpbnN0YWxscyB0aGUgdGVzdCAKPiBmaWxlcyBhcyBwYXJ0IG9mIHRoZSBwYWNrYWdlIChzbyBp
dCdsbCBiZSBhdmFpbGFibGUgaW4gCj4gYC91c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNrYWdl
cy92YXJsaW5rL3Rlc3RzL2Agb24gdGhlIHRhcmdldCksCj4gYW5kIAo+IHRoZXNlIGZpbGVzIGFs
c28gY29udGFpbnMgdGhlIGV4YW1wbGUgY29kZSBmb3IgdGhlIHJlcG9zaXRvcnkuCj4gCj4gSSd2
ZSBkaXNjdXNzZWQgZXhhY3RseSB0aGF0IGlzc3VlIHdpdGggQHBldGVyIG1hcmtvIG9uIHRoZSBz
ZWNvbmQgCj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2ggaGVyZToKPiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTYxNzIKPiAKPiBJZiB5
b3Ugc3RpbGwgdGhpbmsgdGhhdCB3ZSBzaG91bGQgc3BsaXQgdGhhdCwgYW5kIGhhdmUgc29tZSBz
b2x1dGlvbgo+IGZvciAKPiB0aGUgaW5zdGFsbGVkIHRlc3RzIGRpcmVjdG9yeSAoZWl0aGVyIGxl
YXZlIGl0IHRoZXJlLCB3aXRob3V0Cj4gYWxsb3dpbmcgCj4gdGhlIHVzZXIgdG8gcnVuLWl0LCBv
ciBtYW51YWxseSByZW1vdmUgdGhlbSBmcm9tIHRoZSBpbnN0YWxsYXRpb24pLCBJCj4gY2FuIGRv
IHRoYXQuIFBsZWFzZSBsZXQgbWUga25vdy4KPiAKPiA+IAo+ID4gCj4gPiA+ICsKPiA+ID4gK1BU
RVNUX1BZVEVTVF9ESVIgPSAidmFybGluay90ZXN0cyIKPiA+ID4gCgpIaSBLaGVtCgpJIGFtIHdv
cmtpbmcgb24gYSBwcm9qZWN0IHdoZXJlIEkgYWxzbyBuZWVkIHRoZSBweXRob24zLXZhcmxpbmsK
cGFja2FnZSwgc28gd2FzIHdvbmRlcmluZyB3aGF0IHRoZSBzdGF0ZSB3YXMgcmVnYXJkaW5nIGJl
aW5nIHBhcnQgb2YKbWV0YS1vcGVuZW1iZWRkZWQuCgpBIHNtYWxsIG5vdGljZS4gT21yaSBoYXMg
bW92ZWQgZnJvbSB3b3JraW5nIGZvciBQcmV2YXMgdG8gT3RpY29uLCBzbyBJCndpbGwgdHJ5IHRv
IGZvbGxvdyB1cCBvbiBoaXMgYmVoYXZlLgoKSGF2ZSBhIG5pY2UgZGF5LgoKUmVnYXJkcwpDbGF1
cwo=

