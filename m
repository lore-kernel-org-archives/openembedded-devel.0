Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C60DC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:38:03 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.42])
 by mx.groups.io with SMTP id smtpd.web11.22654.1747751881729892716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 07:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=drMw2BJL;
 spf=pass (domain: renesas.com, ip: 52.101.125.42, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIEKp0BfcJgOmHyAEX3Tokk9r2IfxzC+d4xxihvaWqz5aK4Fm2ocYD1BprGpq7NGM9VySajM3dgBkiP4JLlA7cvt+xdIPW+kaVsBS3LlszqUQ+oWGtqWJHh7QsokBCP32u1u0+bjQdtUWZ/tY0eLHFB7tzkw1WpIf6S3PRJnqeW12HBrqqwTvOO4gcul/kYbVEg7F5iiqDXhg71ri/nlM9R82W7M2s2P5YgZ7WtQoClLnDV/XvGThL7qUkd3QXxb9zsnDPcB0bqMzSpwYF/QORg8dc0GpPPz1W0LiQey3oeGvk3H9UajPWBCVHDECKA2hnHxmawYUeoHqNU8A4DeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyrYbt7e4E+EWELTngw18br0ayzBNTk+4K7x9uXz704=;
 b=YuUU2p6MhM/pR4NiBI07Hk2rISCsv/o0GDyGneK21zKMNJl7lJIhH0kEj+wSbnvQsVfQjHQxxIJFvM6VCgG/VyTSMu1bRdvVxkKsGv3rF687yZ+blpYRC0WzZP83KVizgdO8U5cWbPbU1M6y/mR/3MlrVGvIZ/xRkLA5ROTMqdde219t6KeOWueOMqwKUBF82oPuzWfFNksGhsa17Dq1wbB3GZX7M3nmqeIGnDNR2ZiWoWCycOEd4q8rtokPMW0TT4OAlIWktMkeS5XJkNvGli+ybKqJMvAyZIx5idXJ1w/+GrckzBpH2Zjg/csBhUCJoQ+w2Dwt59oGUsLK+bN2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrYbt7e4E+EWELTngw18br0ayzBNTk+4K7x9uXz704=;
 b=drMw2BJL7ORsHHQapt2SXgK6PMmv3wg+RWch6Ngg4ccu4j5VSLked9LcvjHpSUgEKIduA6DP+Wtuwnsc0FOhBHyWIC7+/z0XzAh6/vYmny0K/gVN2Oo9K7CsNHXu1Kz2ZpU49exDqLXzH23XthlPUzU7lqaB3rab+N0gY9DjW4Y=
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com (2603:1096:604:c6::8)
 by OS9PR01MB14001.jpnprd01.prod.outlook.com (2603:1096:604:35e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Tue, 20 May
 2025 14:37:56 +0000
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b]) by OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b%7]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 14:37:56 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Topic: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Index: AdvHdSEI4cqzGwtvRK2R3/3yqcMGlQBMUnMAADbIrAAABG6AgA==
Date: Tue, 20 May 2025 14:37:56 +0000
Message-ID: 
 <OS3PR01MB58965D1C9EA34FFD60523FF5B79FA@OS3PR01MB5896.jpnprd01.prod.outlook.com>
References: 
 <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
 <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB5896:EE_|OS9PR01MB14001:EE_
x-ms-office365-filtering-correlation-id: 7515f106-f69e-4651-7a08-08dd97abe938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YmdTZnNQdWtBRXFaRFdEb3VyUVIzWnd6YkJpZGRvSE1DTmw5NzRuSlFHVWI4?=
 =?utf-8?B?UEZ5QklBMXduWUdtNWJSMXVsUHBJUVFmOU9CTjErR3JzdnVhUlRqSjB0RHpo?=
 =?utf-8?B?WmFOUmIwN2p6b01Pd1JBSnYvRCthOVBEelhXanY1SDA5NlZRZitTQW1seGdI?=
 =?utf-8?B?MW90UE1mOFVnQ2grVkU1ZG9mbmVacXpXdGdOb3ZmNXNZdEQ0RFFOTVFwZnlz?=
 =?utf-8?B?NjczckZnS3MyUmNldG1oM1F5LzN0UGIyQnRSSTVYdHN3bkFYdkVFeE90dTV1?=
 =?utf-8?B?cjg4bTNuUHlOSUFSOVQ3YmovdEtFRmdQUEVacFZrelpNU2Z0UDZXQTVXaXFY?=
 =?utf-8?B?ZEcremtOLzlJcHVya3Q5Y1EyL21pT050L0t1MFc5dnI2a1lPMiswdURoMUlC?=
 =?utf-8?B?azVhb0FwVmJTeDd1ZFNsKzFjYUhETlNYSEJxdUtQYlhMci9kcFdxeGdCMGVF?=
 =?utf-8?B?T0lKTzNrZHYrODNjQm1CbGNPZTdpOG5kM1Nlazd0SUJsRmRMQXZaSmVVVjJn?=
 =?utf-8?B?amY0WnJYOVhxNnBpQmR2NHpBKzdGTjdhMm14Z1B3bTkyODR1di9FK3d0cG0r?=
 =?utf-8?B?ZTQ2aVFlUWhLMnBTR2pQTzB1c2Z3NDZVYlZRU0p2bDhNM2pjRkVRdVh1K2gv?=
 =?utf-8?B?bnZ2MWFOZ0o3YU1uUDQ0TXFianM0Y1QreFpIQ3VjRGlZMWp6RmNyQ1hYY29U?=
 =?utf-8?B?TG13UGVJdVQyQWZwdHRUWE5WU2FxYVk4ZjlDTnYxNmFqVisrSy9DVWJqYytG?=
 =?utf-8?B?blBxZWFtdVlWTTVWNnp6NVphVUU3S3BpZ2l3aGZmNjNIa0RoVHJLa2s3Zyt0?=
 =?utf-8?B?WllFTGhrdHlrdG1yTW5DT2tCVVlPeW1MZVc2Yzl0aXowMm1LQUc3bzJtSmkw?=
 =?utf-8?B?UmZwZjU2K3VCSHh3T3VxWVl2MlNEbGNZQXcvb2FjcGJJVkJyM2dpRmNhOC9T?=
 =?utf-8?B?bG9Ka1krQlhwTmtzaThTVVNxWDJYN3ZiYVB5MVVtZTVnSTgwaVFlUjlzR3BT?=
 =?utf-8?B?dis4RWgrK3lxYkFuUDJ6Ui9jeUVLOXFCbzVLVGhGM0d2RG1tK0NCN0xxbmdM?=
 =?utf-8?B?WVI0UFJ5NUdKUmVpY0NpUmo1THZOUnMvOTg3bGRna0JhdTkxZ3V0TEN2ckJN?=
 =?utf-8?B?SWJkRXBndEZONVVtaFFuZWJkQk1xSXVLN084Mi9vTXhzRXd1YUROeU0zNVpx?=
 =?utf-8?B?dXdGMEJzdm8xRVZjZ3NwUEZNMmR1dnUxODU1TEhRdG1VeEhnL3M2Nmp2cG0x?=
 =?utf-8?B?TVhlNFQwOUEzR2NDNHlIbkJ1ekVFOWlhY2djVE1qaUZtczdzQUxxaFZlWmhV?=
 =?utf-8?B?KzR4UWJOcmd1NTBaTWlIQllGK3BGWmRtSkpYQ0dHL0cxZXlkUE5janRLOW1h?=
 =?utf-8?B?K3dKdUc0MFM1c29JcHBKSnkwU2dhR25vSFpoQ3ExNlVEQnhZQVFYbHJvQ3JM?=
 =?utf-8?B?QVpaM2MxTVNpL0pGcDdZdWNkejFxYzV0a0hUMUZ4ZzJtZ1VkMVZOdjNnNi9h?=
 =?utf-8?B?Z3R6UkczSlJsbkVGRFdGQjNaY2pVZDVXZUp5RHRJMVFCV1k4L21xTU9ScGU5?=
 =?utf-8?B?ODhIbTFaQXNKMStXcUU3QzZtbnRxZE5rb2xwcVhhekxtYjVENEJubDZKTXNq?=
 =?utf-8?B?b3JiazVBNE45STcrUy9ZeW5YclphTVllNG1Ja0lXTXpoelhROW5OK3o0ek9y?=
 =?utf-8?B?cW9ZRGFHbHIzUC90MEwxZTNTYlQ2MzUvZjFHSGI1dUpqLzVORkNWTmpFN21W?=
 =?utf-8?B?ZWlxNXhBaXdoaDRrSFNrM2habXJNaWJMK21GOElTZUd0TzBvQ0F0UzRXNXAr?=
 =?utf-8?B?T1BldXlMaUtpeTl5SmxIaVFDdjd4UzFVaEJtVzFjTnRhWk4vQzhDYm9PUW1V?=
 =?utf-8?B?ckRFTndOOGJUMng0Y1NIZ3RMWWxKTzBwa2pRZlVycDh2blk4MjFsSWczVHZ4?=
 =?utf-8?B?Z1NTejBiVVhpSnVvcU1Eb1d6YkE2WmYyeFNLN0hWQjlVWmhvSENkRGtVQzJ2?=
 =?utf-8?B?dUg2bmtNWEZ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB5896.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFdPT3g2T3pCUU92VisvOHBNZjM0ZFBBR25vdnU3QzFlZ2JIY3dEeCs0WnNk?=
 =?utf-8?B?SC9RU0d0Zy9PeGpJVG5UU0hMTktBdDI3ak5kNmJMUE1USHRRd2RJMVQ2TmNF?=
 =?utf-8?B?Z3c2cnErUGZJdEgvNDM0MXhtc2xvbDdHRUpGWEtPTGZXRlVyR2dQTjdCZk9H?=
 =?utf-8?B?UUMrakVBY1Joc0Z5VE1nSHpoMWV0aCtqaDZrUWpzS2l0VHRyTVVFaW81RjEz?=
 =?utf-8?B?Zk15RU1laU9SbkZOTEVCeWh2Wmc3eTFVeFh6c1k2WXZRNC9rRWViMCtTampN?=
 =?utf-8?B?SEwvclpJb3Q1YTFJY1JQTWVIeHQyenJ2QjR6TE9HOFVMTzJFWDd1dGI4dXpF?=
 =?utf-8?B?aEZPNGJzNWVxdGs5a3ZTSzhucHozaHNBWGIyUXM2MDFrZ085SFQ2T2lSb1VO?=
 =?utf-8?B?QmNzK1ZEUUhrWm5GR04zTzVSTldzYzNwR2VodjFZMjVSMXZoVFFpRElVdkRx?=
 =?utf-8?B?dnBFT2hEK2sxSzlUeEZRdnJGWllkQWxDcnNXZ2tvdUdaZGZVRlh6MUJ6bWlw?=
 =?utf-8?B?WDdqMFZnY2pKSHNqMGlYTGVHRWlmRDhMbDBkYjltNEpsNk1nMEZCbDVmUFho?=
 =?utf-8?B?ZjBZM3AwMHZPUFAyY0JvR3RZdWZEQXY5UjdrUHFuMkoxeDNEVm1OU3FBeUgz?=
 =?utf-8?B?U2g5U005WWVxb1N3aVR3dHFiSnRvazJpMU1pOFN0Kzd0bGhaRHQwZklxUXU0?=
 =?utf-8?B?Yk9IYWVrUTZySnlHZmkweWZURTRnWExRUE44K1FSZ2p5NXg3YUhSWjhHcjQ5?=
 =?utf-8?B?QkpLejNQVkczMVZNWVBWdFU4SG9HLy95ZHE5a25PbG83NjJocnd2TWpzNWtQ?=
 =?utf-8?B?Y1dhcmw3TVVsbXdNTzlwQ2FKQ0M4QzBQdWs3aDJqcXllRkIwcWdsOENlSzc3?=
 =?utf-8?B?dGYwSGVjdlVTNDFWZUoyMVVrR2hGaWpCcVdhVlYxcFgzNjc4UTZ1cmpnZWVy?=
 =?utf-8?B?M2Y1OHl1Zmh5Y00vZ0dZUDBqZlQvL1F4bHdhM1h5RjdRR3V5VTBXWElnNEQr?=
 =?utf-8?B?NVI5VStOczdSMERHeG9FaG1QdkI0Zkk2dS84d0ZRTVp6UjJ5RVJHUTNmOStu?=
 =?utf-8?B?SVJkMzhod2pJSUFOSVVaek9RK0E0TE1FOEZxdXJZekFyVGtrdlRvWEpzcEZX?=
 =?utf-8?B?SVZGM2xxQzNESzJvR2d1SGk1YjlpUVhMTXB4ckFOUDFxRmo2dGJFcU9JMHBn?=
 =?utf-8?B?aVVwcG1Sc1BBZnJzcmFaYU9JV0JKWFRnWmc5MHRwZlFTc2NpeHI5S0U4bTJF?=
 =?utf-8?B?WEpLVnBXLzlsWmM0MzEzSjdSTXJwYUdSUU1XUU5EWEZUZ0FjSUlsWEV1M2Zp?=
 =?utf-8?B?c0x6WThacE1Kc1dMRzRvMFFhUU0vV0VKWjdranNCZ1FheWxIeEV6Um43NkVj?=
 =?utf-8?B?Rzh2VHl6TWtRK1lxRWVqelJJTUZDc2psNkR3elQ3Z05lNzNxSzNlS3ZYUk9o?=
 =?utf-8?B?NFl2WGxWSUkzUWcvTno4b0tZdmR1N0hpQ0hFTWdUSjY0cDBQanhWZkRsNzVE?=
 =?utf-8?B?OWpDTkdCQkptc2E2ZHN0UVplemkxT2NxdXBtaXA5TWFBM1BrOGdOVHh6MFJ5?=
 =?utf-8?B?QktEREZaOUc4cVlWY0wxdFQ1eUJqSUJHbXNQclp1TWo1eS9XS2JsOGdhaXRD?=
 =?utf-8?B?RXkweE5aSlZ5SUR5UW44YkYxaTN1a21mYko2a3Z4SHRyTllMcmdEQlFQdjNG?=
 =?utf-8?B?UGdJZk1JRVZqT0lsVm5odXlPcjdOSVNrM2lJTU9vNzJwQkd2aGx1ak12MjBY?=
 =?utf-8?B?YkZZMDFVSmZZYlV4akJNNjNvcEh3RGppYldpNmpoU25VcWxxcmtBZE9VZmV1?=
 =?utf-8?B?a1p2OVdlYVo3ZG0ycENoaWNzWTgyUFlzS0IrMzNjc3NlejB2a1loamlhV0Rk?=
 =?utf-8?B?a1hSbUxnQkN2cnJqYWRFQ1R4RjUyL0VjU2o4M2xtQjB6MlpuSGE0a2hZWjJW?=
 =?utf-8?B?bFRmSjlVSmR5N2ZraUJ4MXFXZEVvTXlRQW9kNWhsUTJjMHdHSVByTy9hb3F1?=
 =?utf-8?B?U2wxcUNMRG5YQmRMb1lCd3JHOEVkN1J1ZUwydEJGenUzck9CMEIvczEwUVp4?=
 =?utf-8?B?YVRyUUZ2N2x1SmVxUTV0K0ZxWjB3eVRRS1NtUzczQldTWHpwMW42dDltMkNx?=
 =?utf-8?B?NkNvUjltWmg0U2ordUtGQVpRVVdCcEF5MUxncFZVeGtLRXBTNVcyMmxWS3FU?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB5896.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7515f106-f69e-4651-7a08-08dd97abe938
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 14:37:56.3886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqbHMKl1qEQr/4yzs8Acp71Hi9azDeLTiHs0pKEdxrEqkQZSXdpg20ExOUhYRBLix7PZ0wavMBgjKsodUiMLUxGhKN0+vvPCnT1OwoZlPp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14001
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 14:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117513

SGVsbG8gQWxleGFuZGVyLA0KDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPg0KPiBTZW50OiAyMCBNYXkgMjAyNSAxMzoyMA0KPiANCj4gT24gTW9uLCAx
OSBNYXkgMjAyNSBhdCAxMjoxMSwgUGF1bCBCYXJrZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPHBhdWwuYmFya2VyLmN0PWJwLnJlbmVzYXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiA+IElzIGFuIGFsbGFyY2ggcGFja2FnZSBhbGxvd2VkIHRvIGhhdmUgYXJj
aC1zcGVjaWZpYyBvciBtYWNoaW5lLXNwZWNpZmljDQo+ID4gcGFja2FnZXMgaW4gUkRFUEVORFMv
UlJFQ09NTUVORFM/IEFuZCBpcyBhbiBhcmNoLXNwZWNpZmljIHBhY2thZ2UNCj4gPiBhbGxvd2Vk
IHRvIGhhdmUgbWFjaGluZS1zcGVjaWZpYyBwYWNrYWdlcyBpbiBSREVQRU5EUy9SUkVDT01NRU5E
Uz8NCj4gDQo+IEkgdGhpbmsgdGhlIGFuc3dlciBpcyBubyB0byBib3RoLCBidXQgZG9uJ3QgaGF2
ZSB0aW1lIHRvIHJlc2VhcmNoIGFuDQo+IGF1dGhvcml0YXRpdmUgYW5zd2VyLiBBbGxhcmNoIGlu
IHBhcnRpY3VsYXIgc2VlbXMgaW50ZW5kZWQgZm9yIHJlY2lwZXMNCj4gdGhhdCBvbmx5IGluc3Rh
bGwgZGF0YSBidXQgbm90IHNjcmlwdHMgKG9yLCBvYnZpb3VzbHksIGJpbmFyaWVzKS4NCj4gDQo+
IERvZXMgdGhlIGlzc3VlIGdvIGF3YXkgaWYgYWxsYXJjaCBpcyBkcm9wcGVkIGZyb20gdGhlIG9m
ZmVuZGluZyByZWNpcGVzPw0KDQprZXJuZWwtaGFyZGVuaW5nLWNoZWNrZXJfMC42LjEwLmJiIGRv
ZXNuJ3QgdXNlIGFsbGFyY2guDQpJZiBJIHJlbW92ZSBhbGxhcmNoIGZyb20gc21hcnRfNS40LjMu
YmIgdGhlbiB0aGlzIHJlY2lwZSBubyBsb25nZXIgZmFpbHMgOikNCklmIEkgcmVtb3ZlIGFsbGFy
Y2ggZnJvbSBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXJfMC40Ni5iYiBJIHN0aWxsIHNlZSBhbiBp
c3N1ZToNCg0KQXNzZXJ0aW9uRXJyb3I6IFRoZSBtYWNoaW5lcyBoYXZlIGNvbmZsaWN0aW5nIHNp
Z25hdHVyZXMgZm9yIHNvbWUgc2hhcmVkIHRhc2tzOg0KICAgY29ydGV4YTU1IHNwZWN0cmUtbWVs
dGRvd24tY2hlY2tlcjpkb19jcmVhdGVfcGFja2FnZV9zcGR4OiBlYTk3Y2Y1MTI1MDZkZmIxMGQ1
YWE0NjYzMWM1NmRlMmZmYTVjOWIzMzlhZGViNzMyZjViZjc0MzJiMDQ5YzQxIChzbWFyYy1yemcy
bCkgIT0gNmZjNDNjZjIzOGNhZDUxN2U4ZThjNjBlNzE4ODMzZTMwN2ZhZGUxZDIwOTc0OTZlOTM3
NDgzOTZlNTJlOWM1NyAoc21hcmMtcnpnMmxjKSAhPSA0OGEwM2UxNDdmNGFiN2Q0MGVjNjBiNzNi
OTI2YmNlZjY3OThhNDNmOTk4N2Y3Nzg5ZDVlMGQ3YjUxYzdkMDM0IChzbWFyYy1yemcydWwpICE9
IDE4MTc4MmM0YWE2YzhjMzkyYTM2Y2QwOGRiODA0NWRiMDFjMjZhYjI1Y2VjNTNlNmYwMDk4NGZl
ODVkYzRkYTcgKHNtYXJjLXJ6djJsKQ0KICAgY29ydGV4YTU3LWNvcnRleGE1MyBzcGVjdHJlLW1l
bHRkb3duLWNoZWNrZXI6ZG9fY3JlYXRlX3BhY2thZ2Vfc3BkeDogZDhmNTFjY2E2YWY1MDIxOWFl
ZTEwZDhjZTFkNWEwMDliZmZmY2I2NWE5MzRjMTEyN2ZlODA0ZjU2YzU5MDAwYyAoaGlob3BlLXJ6
ZzJoKSAhPSBhZTY1NDlkYzBmODIwNDI2ZmExYzhjOGZjYmEyYjUxZjc2NzIwMTY1MmJhYTQ4YTYx
ZjcwZDM5NGQzZmViMGQ2IChoaWhvcGUtcnpnMm0pDQoNCjQgdGFza3Mgd2hlcmUgbm90IGxpc3Rl
ZCBiZWNhdXNlIHNvbWUgb3RoZXIgdGFzayBvZiB0aGUgcmVjaXBlIGFscmVhZHkgZGlmZmVyZWQu
DQpJdCBpcyBsaWtlbHkgdGhhdCBkaWZmZXJlbmNlcyBmcm9tIGRpZmZlcmVudCByZWNpcGVzIGFs
c28gaGF2ZSB0aGUgc2FtZSByb290IGNhdXNlLg0KDQpUbyBpbnZlc3RpZ2F0ZSwgcnVuIGJpdGJh
a2UtZGlmZnNpZ3MgLXQgcmVjaXBlbmFtZSB0YXNrbmFtZSAtcyBmcm9tc2lnIHRvc2lnLg0KRXhh
bXBsZTogKGhpaG9wZS1yemcyaCkgIT0gKGhpaG9wZS1yemcybSkgaW4gdGhlIGxhc3QgbGluZQ0K
Q29tbWFuZDogYml0YmFrZS1kaWZmc2lncyAtdCBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXIgZG9f
Y3JlYXRlX3BhY2thZ2Vfc3BkeCAtcyBkOGY1MWNjYTZhZjUwMjE5YWVlMTBkOGNlMWQ1YTAwOWJm
ZmZjYjY1YTkzNGMxMTI3ZmU4MDRmNTZjNTkwMDBjIGFlNjU0OWRjMGY4MjA0MjZmYTFjOGM4ZmNi
YTJiNTFmNzY3MjAxNjUyYmFhNDhhNjFmNzBkMzk0ZDNmZWIwZDYNCiAgIE5PVEU6IFJlY29ubmVj
dGluZyB0byBiaXRiYWtlIHNlcnZlci4uLg0KICAgSGFzaCBmb3IgdGFzayBkZXBlbmRlbmN5IGxp
bnV4LWNpcDpkb19jcmVhdGVfc3BkeCBjaGFuZ2VkIGZyb20gNGRiNGUxYjQyNGQ3OTY5YmE4MGM4
ZTAzNDUwZWM3MGU4OGJhYjI2NmIxZTQzMDU0MzgxYWIxYzU3MmNmNTgwYSB0byBiZmViY2MzMTk1
YWEwMTA2NjMwZTJkM2NmN2ZjODMzNWRmODc2OGFkMDU5MTQzZDU0ZjcxNWIzOTllZWE4YjY5DQog
ICAgICAgSGFzaCBmb3IgdGFzayBkZXBlbmRlbmN5IGxpbnV4LWNpcDpkb19jb2xsZWN0X3NwZHhf
ZGVwcyBjaGFuZ2VkIGZyb20gYWUyMjE3MWJhYjJmNDU2YjQ3NDNmYjBjYTA1ZGU5MWExNmI2NWZl
NmJiZGRkNGNiOTdkMmVkMDRlNWQ0ZjY1MSB0byBlNDNlZDNmMmNlZTgxOThkOTE1MzVjZTM4MDU3
ZDk5NmNkYjhlNzJjMTBkNzUwOWMyNTQyZTY2NzY3ODJlYmRjDQogICAgICAgICAgIEhhc2ggZm9y
IHRhc2sgZGVwZW5kZW5jeSBsaW51eC1jaXA6ZG9fdW5wYWNrIGNoYW5nZWQgZnJvbSA2Y2YyZTdm
ZDFlMWQ2NzU3OGY2YmVkNzYxMzc4OTUzZjkxYThhNThkZjAxMDc2OThjYzI1OWMxOTg5Njc0ZGEx
IHRvIDVkOThmYTMxNjA2ZjA2ZjBlNDQxNmY5ZGY4MmY5N2ZkYzZmNjM3OTliNjU0ODY5MTJkYzRh
M2ZjN2Y4NzFmM2MNCiAgICAgICAgICAgICAgIGJhc2VoYXNoIGNoYW5nZWQgZnJvbSA1NTZmYWQ0
ZTQ0MjZhOTM5MGRlNmNjZGNjNjMxYWViMzVkMzkxY2NjOTY3NmY2YTQ4MTAyMzdlMmY1MDFjZjg1
IHRvIDcyYmVjZWQ2MjQyMGNjOTJmMjc2ZjhhMzFjZDRkZTNkNmY5ZTM4NzdiMTRmZmY5ZDgyZmY3
ZDg2Mzg1NWI3ZGENCiAgICAgICAgICAgICAgIFZhcmlhYmxlIE1BQ0hJTkUgdmFsdWUgY2hhbmdl
ZCBmcm9tICdoaWhvcGUtcnpnMmgnIHRvICdoaWhvcGUtcnpnMm0nDQoNCg0KDQpUaGFua3MsIENo
cmlzDQo=

