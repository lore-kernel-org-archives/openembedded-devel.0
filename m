Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B11C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:42:59 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.46])
 by mx.groups.io with SMTP id smtpd.web10.20860.1747910573153411695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 03:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=FPK7wfVf;
 spf=pass (domain: renesas.com, ip: 52.101.228.46, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHE6qmUMRGZ9BZFeOwCSSyL0LnLYt38tWLhwIZVEFeobNGjKeyhqvSoZIkZaJWEeVJWQMawP4lifDYlFkIV5GlUnAGX554TICuFIB4SL2eu1XBtxAhCHA1afPU6CjOTWELvWp9YsuXnqTRKX6vwpMnUq1VjTNgxEl6Gcj64l+1KVsc/WKAAzMs0TBPkubZVbn1IMQNGX27MaIhmQfkSqZ+fZXFKucltmky4VV0W90bLvGmmqg6MV6X2FTksAesmPA85WCDxkn2/MFZ0vMD/AtuCUwzylzNrszud/mLUZF2EnWDcM2Kd8NQkMoiH+AajLQqwg39Rou4pZ4WTpRYMcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laCaRFkqyBDM8B8ICJwfJcW2GwUBySWxqevodjrk17E=;
 b=f/fMljsnmRFl5AmmDOstJehhvBOUGyHa32qf5ljetypD/VainEwmb2SIY30BmKPNNiiAnGJia49z7HALhyHgsT/yxUylqnMx/tYLsvpv9uzU/yD1np5tnDu3nlQzsNNv6Yx4UDr6e4JZb8unsMGA+IM+fQUKUJeRFDXsjitoKsbsgfYvUeuenU+olscQyPV+VyADxwj7asvnxqUy299xbHj6+5KjHJe/55P83sdAwxDFtSsGz95GmcI1t04JOlsxGBA/pRJK+7fNokbpWJ4iLCVoV23khDJ6m4HJpdCLroYuV2IIQoQrg1FUBlaMNVsSP2Wq0MYQbIp+QvpHCG9BKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laCaRFkqyBDM8B8ICJwfJcW2GwUBySWxqevodjrk17E=;
 b=FPK7wfVfwQYxhqCmTidFJivNjCV3oU88EM06kwXS7Q+j5YehVeJebuuX41geWTPHKH9qmW22w8W3RieC5H7JRc1s+8PTq/myFZJeCW4yuUj01wlzOVfSsEROSpP+jvE9N8vjFYKvHFhq+ntHX/7DCRSDPUYwAt2g+nLFAJQzZoM=
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com (2603:1096:604:c6::8)
 by OSCPR01MB12659.jpnprd01.prod.outlook.com (2603:1096:604:33c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:42:49 +0000
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b]) by OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:42:49 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Paul Barker <paul.barker.ct@bp.renesas.com>, Ross
 Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Topic: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
Thread-Index: AdvHdSEI4cqzGwtvRK2R3/3yqcMGlQBMUnMAADbIrAAABG6AgABbEQcA
Date: Thu, 22 May 2025 10:42:49 +0000
Message-ID: 
 <OS3PR01MB58969DAE6D53C31F87A3E851B799A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
References: 
 <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
 <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
 <18414313C64AFFDA.26643@lists.openembedded.org>
In-Reply-To: <18414313C64AFFDA.26643@lists.openembedded.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB5896:EE_|OSCPR01MB12659:EE_
x-ms-office365-filtering-correlation-id: 84674757-2a43-4005-fe95-08dd991d656d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MGw5QXFYbjlBOTZnQkMrZU9UK0xyVFJZMG1TUnNQSlhrc3piTVJUZFNkRDkx?=
 =?utf-8?B?N3JHQ3JRaUVyWDFFYnIrTml5TFJzZEYzUHROQTU3K3Bud3ZwU3NGYlBYMjU3?=
 =?utf-8?B?bkM5aEU1eGJFckdQaUk4TDNicittWHlVaGFkalZNSVdGM0wxaEh0eWxXbFR3?=
 =?utf-8?B?K1RyQ1hMY0lEcDRxdjJGRWRXZXZnUVBaL1U1eUYvSUZlRnN6RGFPNG1vWURt?=
 =?utf-8?B?MVZHZ2F2VThUMndPcXlmdjBJYTV0UXBCUWlyQUNOQVBjbnVnVDFTcGEwcUU4?=
 =?utf-8?B?bjFVbit1eE5NUXpHL1ZVZ3h3R1V4b1I0VVlLaWVEQUtkd21SQWtjcnRQb095?=
 =?utf-8?B?VFVQVlY0aENDTGFSMDVRNTMxOHcxTUFGSHBDT1ZxT0o0OExLOS9Ea2dYTWdh?=
 =?utf-8?B?MTc0LzFDVlBsU2ZpNFJPdEUzbFcvL0cyVzJDc0laSW14ZU9la3Nyb1g0UzRT?=
 =?utf-8?B?VU9aNnU0M2J5V3NhUGFySlFtYVhCS21NdHh1OWZpbU9pM0pSZDNpQmtrMC9O?=
 =?utf-8?B?MFEveGtLYWt6eVFFUlVHeGwwVTB5bklXSkgxZ003azZoSk85YnZRY2lTTlhC?=
 =?utf-8?B?R1c5MFFGVjdEWGVGcDh6Yk5DclIxQkQ5cmZsZm5FT3FPejgwUnl3WU5vd00y?=
 =?utf-8?B?TkJibmRoNEVaa0s1SXpzajRTazJ6cDJrWGltVlc4d0FnYUZva25tckZqWFJx?=
 =?utf-8?B?dThudjExSm5MMUJreEdzK25mT3RGRnp0L2J3Q1hvaG12aXN3aTYzWk4rWllR?=
 =?utf-8?B?WFRHZU1YZ0dqQlM2cTZ1c2gzbnFBTEhVc3VXaCtnV3Fhd1dxazZ2M0dnN1BC?=
 =?utf-8?B?WWVhbGhIUCthUm85UEd1TzdBYUs5SHJBUHhNK1hBbytOVHZ3bm9FN3BzQ1NK?=
 =?utf-8?B?ZjRQcWJxTzBOaWQrR1IyclB3QytieXFETHh5V1FMc3h2ZUx6WXZhcGI1MlYx?=
 =?utf-8?B?amIzSk9DMWYwd2k1Wk9RcUJTWkNRL21MdHlSL0E4SGUxYmdXcmZqbFhJU0tq?=
 =?utf-8?B?UHZxZnFmbmlEUzQ3bXByekQxNVhvVHJUbUxRYitjaUdzREFoVUxXV2JvU2RY?=
 =?utf-8?B?N2dXUy96bWlBN0NHSzF3dW1MVXNxNmtNaHN0VGFrQ1BCMjVCYldWdkV2V3hr?=
 =?utf-8?B?SU9zM0VEWHJSa29lL0xxZFcxTGF1NEdvdGU1QVlJZHFqdjUrYTNkOGRiMGRF?=
 =?utf-8?B?TkNpOS9HUlF3em8zZ242YUxhQjg4bTlsVTV4NFRTVmZuQWhVVmlVZkE0QkND?=
 =?utf-8?B?VGdWVHpUaWgzakhNLzZsd2NzaGd2SkNkTUk0Nm8ycTMwMjJyVkQyQnJRT2JH?=
 =?utf-8?B?UTNyRDMxeEVpUEdYbG5FcjU1TDQ1K0Y5N0dsbDNrRW9XR2VqRjBmSmFxOW5D?=
 =?utf-8?B?Z1BCaW5xRUJ3RThhbjBlcS9QanoyMkhCRkNVQ0x3enpmcUJ0NStsSnE1cEcv?=
 =?utf-8?B?UCtDK0FpZkRZN0tveDdCNVgyTnhNZVgvbmZJRjN4YUpYZ1lNVUlVc0ZieDZB?=
 =?utf-8?B?UVp0OGRuYmcrSk9nWFdwN0xkOG55ZUN1R25MVWFZMldTalFTMHYybTBjTmJU?=
 =?utf-8?B?amRPZlFqeVhieUliMTd5a3dlTFQxc2JNZ3NxRHk0MmxrY2tRaUQvejNVZlVo?=
 =?utf-8?B?WWhici9RSFlzOVFBenBBNUVDS3pNa2JhdVRmN2YybWpWcUE3UEpiUVJQNUpG?=
 =?utf-8?B?N1ZNZUtIZk14MDgzOSsxYlkvUnhrd1NoelA1QWtBaFprVklkVGtzRXdxTWNq?=
 =?utf-8?B?bGRpVHRZcm9kTlRPSnlWMFQreGlzQWFBZTBoZ3Y2V0lRTlpTRWswaEIxUFJQ?=
 =?utf-8?B?V044SW95QWUycTYzWWhGQjZ5OGRuWngvK1Q1UnBsdGtHelVocm95YlZCbldM?=
 =?utf-8?B?TktaSk5mWi9ZamRuSDJFVUZ2dDZ2VWxJQm1IampScXVwekVDWmJHbnM3SWFx?=
 =?utf-8?B?TUEzakxWYUFvZ3RWK3dlWWtvR3p4QjUwdGZZbGhIRGNkZ1Nod2N0aFlsYk5i?=
 =?utf-8?B?WDdyeTlHTk9RPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB5896.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVA1M3hxNmVkdkU4L1NQVzd5cWlQQkVERkM3ZElvZDI1Uk5tUmF4cGJKOE96?=
 =?utf-8?B?UCtnTkRoekFLOUhkTm5rZHNWMC9PZUkzMmdRb2dvUlNVSkZLOVhXUEExQnNF?=
 =?utf-8?B?MlE1dDR0ak5wMEFSUHpTWG5iSGVvT3lNL2cyT0xhRlNYUHJyU2UyTm0vV2Yw?=
 =?utf-8?B?U1F2RWozeUF0bE9TSFdTTi9Td1NqekJuSkthS2JDN1F6WXU3ajJ0NlpVaDNu?=
 =?utf-8?B?ajdzS0NRTnV0SzlXakpHbkptaTdHbnVtWUYvYW1LeWNjU3JGdmNsWVB4MHoz?=
 =?utf-8?B?VnlKaldTK2pVbHAzSVd6elRES3M4NDRQWVRqa3hHK2pYeCsvY2dQblVpNXJO?=
 =?utf-8?B?OXFyOGF1QVowb3RreFlIZCtqQzBiQkxwM2YvdTJUUGRXellUci85K3BBZWIz?=
 =?utf-8?B?OWFJbTJzSTc4a3I5RWx4MU9ucTF1QWpHd2xqOGs4ZGd1Vm9xamh2UUtLS1dZ?=
 =?utf-8?B?NHZkZU81YVlFTkp2Z2V1M1ZYK0VyekdqOXVoek8zc1B2d0xML0FqcDcvNVRD?=
 =?utf-8?B?NXlkUjRrbm84cFVGQndEZ0xqbkQ1UDZKV1ZUZTlQTEduZkcxNHdZY0FtMGdk?=
 =?utf-8?B?WDRrYlJkRHk3WEZSaW1VcXU4bGEwQVZCY3pQQ2xMTmJSMFRLWkZCcE16WWMy?=
 =?utf-8?B?OWEzL2o3KytQR21OTXJxbTcwSC9sTlQzL01zb1QyTnRvSkNhaTN5ZXREOGFs?=
 =?utf-8?B?cWFKTVkwaTZHK2hEdE5KMEhhajMxbGxYUTBydXJNWWpiM0FsYjFvZHA0MkZn?=
 =?utf-8?B?WXhJc3pLdGd0U3p6eFZTblZ3dXpyMnFnUDlWUWlIaUxiTEU3NGhuY2ZKNldy?=
 =?utf-8?B?bGw4SlZKazgyM0ozTkx1NkloOTNvODNFTWx0OG1rSDlQaUlBTEh2NzlNeEJ4?=
 =?utf-8?B?dysvUU5ZOHBqWEpVa0pYQ1lDYnFBczRpZG5McWZGRlgzWnRoRHluQS9oYzJ2?=
 =?utf-8?B?TlhmcS91RGNXNXFRUG5LMDBJanlpaGFadERwa210NEFiVC84cFJZWVRkM1J0?=
 =?utf-8?B?K3U5UnNhS1NKblhub015YU55VE9SbFhKRTdJTWJoaUNJTGsxYjJ3bGtsNmN2?=
 =?utf-8?B?Tjk3dXVtTVluSXMwMmw5UHBhTnhrOXFERUNrdjE4aVZZcTFiSE9zanpFTm5M?=
 =?utf-8?B?a2hYY0FQYkJPaWVtZWFsREM0cWswYVAxR1d5b3F5N085VEQzUXNxSVhKUWI4?=
 =?utf-8?B?M0VMQW4zcTNLK2dZdU90Qjh5c29YYi9QVjFZa0J5d2RwSjBOK09YamJEbFJk?=
 =?utf-8?B?YXdNbGUyMlI1eld1S3pnQW1ZZ0hUSSs0LzlHakh3RUxTL3BYa05wN0V6a3lJ?=
 =?utf-8?B?OXlVdDhkVng4UDVGdU44NmdyTERQa0ZzZk4reTJ4SHA4WFo2SGluYjJhclE5?=
 =?utf-8?B?bXp2RWhDMnl3R2xONTEreU1qd1d2bXY3Tk5lWWpvajhFaDhrUWYzZmxjbWZh?=
 =?utf-8?B?WFpVRmVHNUtHQUdkdklMNTBBYU1nUjFYQkozdVhhcS9wZW9xMHE3SzgrRzda?=
 =?utf-8?B?eWkxTHVYR0pjdWRHekRhQVdGMGNJRnFyRzhCbnZtamxzRHUyM2hzcTF0OVZL?=
 =?utf-8?B?NjUxV0l2dlFydHFGMG40Y3o3UmY5VkIvYTNxdm9iRURKbUJPc0xkd0FIN09s?=
 =?utf-8?B?MUlzV20xQW93by9tOURjOEVKL0xsU2ZBSlltK1Uxa0p5UjV2SDNXaGV2cTJX?=
 =?utf-8?B?bWVDdDY5QVc4Nm1VV29aOGpxRVRGdnJveDQ4UTdxcTRJZFJLdkRVcTJpbnJS?=
 =?utf-8?B?T3RVaHVMb1F5Qi9hOTNWd3lGSEt0NUxadDE3c2UwYWdJQlpqTVJFc0pFaVZs?=
 =?utf-8?B?ZDdzUDdHeFpVRW1ua2JmSnFTM3Q4V2pwRVZJOW5WZE50dHV4ZW42WkhEZmhG?=
 =?utf-8?B?SldpZm9BMWhpc3NiZmttWVpzQ2RlbzExQWJSTVI3TFkzOEloQzdKVzJOakZm?=
 =?utf-8?B?U0M0NjgzTkZNQ1BzTTRzUnU1REVIdlZEOCttcUZRV2t5cnJ4TkNXSnYwRk1Q?=
 =?utf-8?B?Q0lpK2kraG5kV2xob0RaM21jQzZVNDdlb2tveTNVbU04Q0czakg2V1JoMCsr?=
 =?utf-8?B?T21QWUJqb2Y5NmxqcDBCaFFEV2hKdVZNTlkxLzd1V1ZSbkVFWVl2bCs5Vm42?=
 =?utf-8?B?TytQamhYZFNVY2VUSTMrSERCVWdwUEQ5Z2xkdktpWit1WVovalVOQlFSUnlV?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB5896.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84674757-2a43-4005-fe95-08dd991d656d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 10:42:49.1010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoyCngNBs17R/JeQhlIvtkvUCr6TrEFPoV/1W3p6Y5T9SnJ4Py9EEKyZeTayqNUPRdbnKRxM0wyF2qdtXcsmVvXOImE8WdYishPT0ppR0ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12659
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 10:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117583

SGVsbG8gYWxsLA0KDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9u
IEJlaGFsZiBPZiBDaHJpcyBQYXRlcnNvbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTZW50OiAyMCBNYXkgMjAyNSAxNTozOA0KPiANCj4gSGVsbG8gQWxleGFuZGVyLA0KPiANCj4g
PiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gPiBT
ZW50OiAyMCBNYXkgMjAyNSAxMzoyMA0KPiA+DQo+ID4gT24gTW9uLCAxOSBNYXkgMjAyNSBhdCAx
MjoxMSwgUGF1bCBCYXJrZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA8cGF1bC5i
YXJrZXIuY3Q9YnAucmVuZXNhcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
ID4gPiBJcyBhbiBhbGxhcmNoIHBhY2thZ2UgYWxsb3dlZCB0byBoYXZlIGFyY2gtc3BlY2lmaWMg
b3IgbWFjaGluZS0NCj4gc3BlY2lmaWMNCj4gPiA+IHBhY2thZ2VzIGluIFJERVBFTkRTL1JSRUNP
TU1FTkRTPyBBbmQgaXMgYW4gYXJjaC1zcGVjaWZpYyBwYWNrYWdlDQo+ID4gPiBhbGxvd2VkIHRv
IGhhdmUgbWFjaGluZS1zcGVjaWZpYyBwYWNrYWdlcyBpbiBSREVQRU5EUy9SUkVDT01NRU5EUz8N
Cj4gPg0KPiA+IEkgdGhpbmsgdGhlIGFuc3dlciBpcyBubyB0byBib3RoLCBidXQgZG9uJ3QgaGF2
ZSB0aW1lIHRvIHJlc2VhcmNoIGFuDQo+ID4gYXV0aG9yaXRhdGl2ZSBhbnN3ZXIuIEFsbGFyY2gg
aW4gcGFydGljdWxhciBzZWVtcyBpbnRlbmRlZCBmb3IgcmVjaXBlcw0KPiA+IHRoYXQgb25seSBp
bnN0YWxsIGRhdGEgYnV0IG5vdCBzY3JpcHRzIChvciwgb2J2aW91c2x5LCBiaW5hcmllcykuDQo+
ID4NCj4gPiBEb2VzIHRoZSBpc3N1ZSBnbyBhd2F5IGlmIGFsbGFyY2ggaXMgZHJvcHBlZCBmcm9t
IHRoZSBvZmZlbmRpbmcgcmVjaXBlcz8NCj4gDQo+IElmIEkgcmVtb3ZlIGFsbGFyY2ggZnJvbSBz
bWFydHlfNS40LjMuYmIgdGhlbiB0aGlzIHJlY2lwZSBubyBsb25nZXIgZmFpbHMNCj4gOikNCg0K
SSd2ZSBzdWJtaXR0ZWQgYSBwYXRjaCB0byByZW1vdmUgYWxsYXJjaCBmcm9tIHNtYXJ0eS4NCg0K
PiBrZXJuZWwtaGFyZGVuaW5nLWNoZWNrZXJfMC42LjEwLmJiIGRvZXNuJ3QgdXNlIGFsbGFyY2gu
DQo+IElmIEkgcmVtb3ZlIGFsbGFyY2ggZnJvbSBzcGVjdHJlLW1lbHRkb3duLWNoZWNrZXJfMC40
Ni5iYiBJIHN0aWxsIHNlZSBhbg0KPiBpc3N1ZQ0KDQpXZSBzdGlsbCBoYXZlIGlzc3VlcyB3aXRo
IHRoZXNlIHJlY2lwZXMgdGhvdWdoLg0KDQpJcyBpdCBva2F5IHRvIGp1c3QgbWFyayB0aGVzZSBy
ZWNpcGVzIGFzIG1hY2hpbmUtc3BlY2lmaWM/IChlLmcuIFBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJ
TkVfQVJDSH0iKQ0KT3IgaXMgdGhpcyBqdXN0IGhpZGluZyBhbiB1bmRlcmxheWluZyBpc3N1ZT8N
Cg0KZS5nLg0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXNlY3VyaXR5L2tlcm5lbC1o
YXJkZW5pbmctY2hlY2tlci9rZXJuZWwtaGFyZGVuaW5nLWNoZWNrZXJfMC42LjEwLmJiIGIvbWV0
YS1vZS9yZWNpcGVzLXNlY3VyaXR5L2tlcm5lbC1oYXJkZW5pbmctY2hlY2tlci9rZXJuZWwtaGFy
ZGVuaW5nLWNoZWNrZXJfMC42LjEwLmJiDQppbmRleCAxZGFmNWQ4YzcwNTUuLmY0ODE2ZTczM2Jm
ZSAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1zZWN1cml0eS9rZXJuZWwtaGFyZGVuaW5n
LWNoZWNrZXIva2VybmVsLWhhcmRlbmluZy1jaGVja2VyXzAuNi4xMC5iYg0KKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLXNlY3VyaXR5L2tlcm5lbC1oYXJkZW5pbmctY2hlY2tlci9rZXJuZWwtaGFyZGVu
aW5nLWNoZWNrZXJfMC42LjEwLmJiDQpAQCAtMTcsNiArMTcsOCBAQCBTUkNSRVYgPSAiZjRkYmUy
NThmZjNkMzc0ODk5NjJlYTljZjIxMDE5MmFlN2ZmOTI4MCINCiANCiBTID0gIiR7VU5QQUNLRElS
fS9naXQiDQogDQorUEFDS0FHRV9BUkNIID0gIiR7TUFDSElORV9BUkNIfSINCisNCiBSREVQRU5E
Uzoke1BOfSA9ICJcDQogICAgIHB5dGhvbjMtanNvbiBcDQogIg0KZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1zZWN1cml0eS9zcGVjdHJlLW1lbHRkb3duLWNoZWNrZXIvc3BlY3RyZS1tZWx0
ZG93bi1jaGVja2VyXzAuNDYuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc2VjdXJpdHkvc3BlY3RyZS1t
ZWx0ZG93bi1jaGVja2VyL3NwZWN0cmUtbWVsdGRvd24tY2hlY2tlcl8wLjQ2LmJiDQppbmRleCBj
NjU5M2VhNzQyOWYuLjQwODU4MjU4YzM5NiAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1z
ZWN1cml0eS9zcGVjdHJlLW1lbHRkb3duLWNoZWNrZXIvc3BlY3RyZS1tZWx0ZG93bi1jaGVja2Vy
XzAuNDYuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1zZWN1cml0eS9zcGVjdHJlLW1lbHRkb3du
LWNoZWNrZXIvc3BlY3RyZS1tZWx0ZG93bi1jaGVja2VyXzAuNDYuYmINCkBAIC0yNiw3ICsyNiw3
IEBAIFJSRUNPTU1FTkRTOiR7UE59ID0gIlwNCiANCiBJTkhJQklUX0RFRkFVTFRfREVQUyA9ICIx
Ig0KIA0KLWluaGVyaXQgYWxsYXJjaA0KK1BBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0i
DQoNCg0KDQpUaGFua3MsIENocmlzDQo=

