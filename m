Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6372C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 09:39:30 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12944.1785836367284116564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 02:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=PtgssPil;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=2676215baf=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748DPW12980631;
	Tue, 4 Aug 2026 09:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=S-DKIM-20210427; bh=M87/v+0vAOYwhjA5HF
	9R9pWGkdwYqzjSrJ/5wcnPvAA=; b=PtgssPilU6QAdTeg7rMBgdsQgd/UCtPq/s
	E8Yxc4qmKl/wiuGrImo0ELzlSbDIdsD4mdwoYvpVs59Ps1+9APJq1fJAYJFsp0pV
	+/6ljMdn0ZQM4xyHOSGQqKxAM2ldmrUspTIIupc8T6gYHO9+I41BxabYrYt1dIFK
	mBJUDFJPoB8UHcNZrVWDiYPgEIem1ID8uaaOyz8+cyYdj/hrDnNrvm0/bmQCOPlK
	9KlV+jmAtUfmOz4TgtuU1gKp+IpxU4tq4ukF4NglZ5fZRls7CPzVzc4iFfxP79u5
	y1FezPjHNJ+G7rsiSiOYF7bKELtvPf3LihreZwbz5MPlTTtiVCQQ==
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4fu3uvhtfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 09:39:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1ZcbfYFHPEw+v6Cr2yG9HFnn5F0d1siGRZBRJ3pGcKAwKPZC8oTqKsVvcCgmthU5Euq2dAqmZ+vU4hM1aD6ZE9grejWmadVbvcaKWUvVjJi6+GILT4eENHmPIda487Cbq863HDqQte33lZp6Ywk+N4dBUEtctPrFXUOQHicU52He0LHj89tfYIxFdwjkS33QKE9bzE/peJU+uziafdijykY8yEjgFirwhtnnXgQgPsm7m5hCl4L9fXbhE8zDpoqTnvf1HEUAnYX/pEtN8tGdBU0v5rRqD53w749amHDKrCfj92Fi958v3lF/bN3CdQ91J9i85YxgIDmZNBQSdIqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEcylqDfbCkKbbfAJLPSWXwQOlpJqcDorFouGDFqLFw=;
 b=YGkg2br4DOZnvbz19rZmVU/ZsF7W5tYx8Z5YP3IEbUefy03tjM1aY56/ks1NC7Q7BMJ8Ozcn4eYPvkMm9vdv6SrsnJ8/dKO5QtvWuCcx9SY6NYBoavggDU0mzy4lsgUz1TCqm65joGDYbZOKPJ3kFJJtpRlpBjF9JVgkXVNKZOy9gS2AIpbmOsMKLmFASz8TgRcNlaPMqVMlJrIz9l+WWFJKbHiOLKBcoKxNx/IlQZD8cVij8+eL3p/Ali/8y+sHR7xePeZtYrpNh8MUK5lyiQzkClkLEpC5t0eX5XuLIBWb4fuTAITEIfQF1qpYNMU+Vn5w1Chf07/1zCFe2rPSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from VI2PR01MB11434.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:26e::11) by DB8PR01MB6439.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:153::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 09:39:20 +0000
Received: from VI2PR01MB11434.eurprd01.prod.exchangelabs.com
 ([fe80::ff09:eafd:68dd:455d]) by
 VI2PR01MB11434.eurprd01.prod.exchangelabs.com ([fe80::ff09:eafd:68dd:455d%6])
 with mapi id 15.21.0270.017; Tue, 4 Aug 2026 09:39:20 +0000
From: "Rastetter, Rouven.ext" <Rouven.Rastetter.ext@karlstorz.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [Ext] Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide target
 kernel version
Thread-Index: AQHdI2wzaguokjr5y0WWQdlEsmqtg7aM/y8AgACiVFc=
Date: Tue, 4 Aug 2026 09:39:20 +0000
Message-ID: 
 <VI2PR01MB11434CD485920AA5F167B2BA7DBD42@VI2PR01MB11434.eurprd01.prod.exchangelabs.com>
References: <20260803171813.318922-1-rouven.rastetter.ext@karlstorz.com>
 <CAMKF1sqR1+U6Afm7DWYSB1CEbxVAFhTrR2zOVN6WLGgooOe8Xg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqR1+U6Afm7DWYSB1CEbxVAFhTrR2zOVN6WLGgooOe8Xg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR01MB11434:EE_|DB8PR01MB6439:EE_
x-ms-office365-filtering-correlation-id: b3eebc7d-ed99-44e9-5969-08def20c4289
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|23010399003|376014|366016|1800799024|13003099007|10067099003|38070700021|11063799006|56012099006|18002099003|22082099003|3023799007|4143699003|8096899003;
x-microsoft-antispam-message-info: 
 0wn9ftmkH3kf4ptKOemgPxg3izac9oJuOlkai1Fc8kJdNdEVNtvpLS6ACo3ms6+mOamFwGSh8lnV/rOXMUCQ5+UzTsD/WNpYvNQBOBD7m2kf3+5/powd+criVs3VLFNF8Lj75b1D2spBcWosnMeK8Ag2eej+4lJ8JWsB984Hez9Hzr0yz0Z9sTvjdWuBq98GleCsPBQuC+SEYg80mWdhoxf6YE1a1ND+Y2GlfJ+Dw7GNAqO5m1TL1hLpbRGi6VBO2kYX53nigHykkgdJYwTUwdwqzkJlaxUlTCwHyg1YhaiSDUOg3OVDbVrb79gdNAc2/0MsePFpY8tjYNIxzGZxokYYG2VyUkn78p8Jc7piR06nAZokXj2W3b77LDkogIHzAvtdqBwf3C+jHxk57uetoOtl4xBcIaW1vNBdR7GIoWiY2wskRdr79QtQN/XOygTMCKFSfPd7Pmo95WJIcGakxaxRllt5PWyyc4HFiLeoCL8zXk3qWuiddcR2h3mB2XiOkYoGmV+TzeMQvPWElP0c+BTkDt+rRLTQ38gRmIg0+L9+GAEKrUqOETwgXsFMJ4CxxAIDOVDFmxNdJCyLs99HVg75LgViusi/6zVdKRQGUGrZM3S7mGoqLWTFfAsIiAoslALMJijVBbljBk2ydZElxPC6lXXabxky8B4Z/XKQzEo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR01MB11434.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(23010399003)(376014)(366016)(1800799024)(13003099007)(10067099003)(38070700021)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(4143699003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qjd5SmxDdGpkeHc4UGNNR2lYUmdmcWxZNXFLMEZuVTNDdXFWTHVmMUhRUHI5?=
 =?utf-8?B?Mm1DZVRWcTlnclVYaW9EWHRTQllYQTNSS0k5bEJGbjdMbVJHd2hYT3FubXls?=
 =?utf-8?B?eGd3UWdjZXJiME9Yd0czSDNnYnZGVDdlaDArTlM4VGFXOEEzQjJWWHhkWUdX?=
 =?utf-8?B?RS83NjVRT2hRYkdWL3NYVnZvQU5TY3YzdnBpVGU4NEErVWVsTUxodUxwcHdF?=
 =?utf-8?B?QVZSN1BBamxNTjBZcCt3ZDhwTlBjZWUxaXJ6UzlKa1ZtaTcrMm45K0U0RWIz?=
 =?utf-8?B?ZHBNTUYzR0pmcHI5Wm8rUExkT2dJRy9mazM4Q01QUDVRSGdnZzFnOThxNmhu?=
 =?utf-8?B?anNHcmoxK3RFU09ReEtwMHpOVk9ULzhsY2pGVXI3ZEJJTDdEM0tlOWlEVVox?=
 =?utf-8?B?S2wxOFhWQ3o3WmdPUVZhTEF6ZmN5Mk5BZmZWQjFJMW1XSnE1Rm5iNExydGJn?=
 =?utf-8?B?ejJlaGhiNzNrYVFRUVFTZ29iVGJKRHNvZXlJa3RlS29XMXJiYmI0SjB4ZXNy?=
 =?utf-8?B?TzdxVUg2cGcvZzk2Zjg1WU5kRnlkd2g1OW9xUTZCa1VEclg0TkROUkh2Qjhx?=
 =?utf-8?B?Q0Q3UG5CaXNHb3UxcTdpR05Xcyt0cmQya205cUJxTEtwRnVQQ1lDR0xVNnZC?=
 =?utf-8?B?Zm0zcmJzeDI2ZEtyWEIyMFVLQklNMkQ0S1ErMlhqQkRhL1FGRDRIeE82SU9X?=
 =?utf-8?B?eU9pUW9sQVpGNjdrcFYrWENxQ0lFM2Z0Qnk5bndZMnpaN2U0L3hUdGhtMms0?=
 =?utf-8?B?MnZ2ZGp1aW5IM0krUGdnckZnZVlMZ2JTenM5Q291b1NpYXR0ZmMxbWo1UFEy?=
 =?utf-8?B?TFU2Q1dqb0dmKy9iSWpqY2NybjU5d3h6Zi9XbnhNR2d5Q1lrWDU3OFhqdHJ6?=
 =?utf-8?B?am80MmtNKzM1OUpHM0ErUTdyL2xnOU5CUklYVFlmOUVMcmtxNTRXVFlGNC9Z?=
 =?utf-8?B?bnMwWnlxK0IyQU5XVVlnT2ZMcTNLNFRnOXJSUlpPenVjbndKTnFKejFCQkI3?=
 =?utf-8?B?U2lhNjlZMG15bWUvRStKNkVUVGN5akUzNE1GNTc5Z2hxQ2FGUkxrNVBQSHR6?=
 =?utf-8?B?RmIzWU1OL1JVK1FWWmNFM0x4aW94Rk9ndkdTWWlYMUR2OGJIcG91WlIzbHdM?=
 =?utf-8?B?NWluMDJlS1gwdGl3aktBMjFUMVZ4ZTIwd3pBMVA1YnpnZU0yMDFhLzBFSTJB?=
 =?utf-8?B?cmJjY3l1RXc5WTljZm0wMTJKK052K0xuUnNubzZQaEl4L24yamVqRnV5UlJB?=
 =?utf-8?B?Q2VjNklqUlQ3NnI1eS9WUmZEbFNta3NyUjJKNUpWeUcybGxEQjZxaHlMeHFu?=
 =?utf-8?B?OFNxckNhdlRhdWhtUUs0RlU0R2VHNXpPMmhBYkxlbDgrR2pyT0lQTFRER2Vu?=
 =?utf-8?B?Y3ppTURGUS9BdkhOaVFQZEZRcnIzNGF4ZjdBTzYwTWhtcVFpbHhZd2l2cWxL?=
 =?utf-8?B?T28rd0liZTFRbUwvZnB3S2ZULzkzbDQvRDRiVzJvcy9EeEJHYkdFRVlFNElq?=
 =?utf-8?B?Q0Z2dEJ6RncwTk9PQTRoZ0J5VzBCUW8yL3BoTHc5TW1DbzlrTnhQMGp6Z2VS?=
 =?utf-8?B?dENsZnZPS1pLZGtpZzd6M0hCNmprVTNZcUVCak5kVnRoN2loZkxXQ1ZOWkxJ?=
 =?utf-8?B?QjI5MXE0ME5oOGFyeVozb1pHTEZvSGdjY2Z4YkQ2Q1dJUnJzMkhLblVZRm9Y?=
 =?utf-8?B?Q2Mwa1ptVm5IQXVRWjFKd2o4N09IUzFESmR1VzEzSkhQMmFLS3JBTHQyWXRr?=
 =?utf-8?B?NTNZM1pMSVhCQkQxNDByUEMzSzlLczBOdndJc1JFZ0tjNmJvWjk3Z215TnE3?=
 =?utf-8?B?Y1BuVkF4RWVzMmhiL056ejhUSml4cEdqMVlzOVlrbXExQlhEUGdOaFdhNUZ4?=
 =?utf-8?B?bU0vTWZRbG53cGZqNHp2aGpSV0FtMCtiRXFrWHZSbWdhV2p4dG9aWkpBREdz?=
 =?utf-8?B?Q291MFlQTkFXblp6a2c5aTZjaGxtZDN4cHhTWEVYN1hZZC9kS0draTU4WUgy?=
 =?utf-8?B?VkF6S2toN0RGOEVDbTJScEwyamwza1JPbURhZHVISlNqMzVDTnpTZklmQTBu?=
 =?utf-8?B?UnkxV3FRY01vVTVxL1B3eDhTL29QWjNNUlZYclo4cnlDZENjM0tLTU9mZUFI?=
 =?utf-8?B?VkM5dk1MeXlSQWNLc3B0dTdmY1I2bjBSTjRNaTRtUTlpcFBid0Z1TlR3bkpp?=
 =?utf-8?B?OUloSk45QU81NTBDTk9QWUpTVVprTjFyc3drUmJqcmZuSG5TekVqMlRUMk53?=
 =?utf-8?B?QTd1L0NiOHlZTlFXek1aZEZVNXdOZUhNREhSWFV2a0NkRkpWNlhjTElnT2VI?=
 =?utf-8?B?TmtwWmJBRWVXZklaei9LOEVIczJtQnkrVDE2ODl4cTJxWCtVSnZCa0c5RG1G?=
 =?utf-8?Q?hOiOI+FpYBwmt/GI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI2PR01MB11434CD485920AA5F167B2BA7DBD42VI2PR01MB11434eu_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	HTDA3ymWS5pmyI+x6MGqbUGwhfxvfx8PaZY2ksxWogrCOgkCp3C8ogxbtMyQEBoBixit3JhhGTnv/OKKWf2kfYr3xi6CJ5tPcBtIddu19uM8z6Q4QZ8RWdn9i02fHv5m2KTQrcpoOuawoiHLs6sgqE1bQv/RvqaaAHTPyoyYZo/Sj15Jms2UlfdUG6I42rZq2FfSq6EjFfG3w/uV5h7d4m6YMnMXIQaW042LS+g5zQ5HjukQuCGlj1Koku5IyiNoBHUISoMBpSwWYopR4bYbrRLvIkOcHglsBa5ikZnC5AOdvBTZPssvwZPm/EaSI1wiSZogC/aij3xmpHdh3aZi7Q==
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR01MB11434.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3eebc7d-ed99-44e9-5969-08def20c4289
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 09:39:20.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vpn8ihdo4hMInRa3PTwG9R7LVRSgZMqkGClK7rRuNcbcQzgKsQoPDyyWDnovjEnaEwPpo1XvFni1DTuc8DdtoyLMw7bjg/se6ajYnzufCaviz2PZ9dsyCSdinRfvmAom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6439
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA3NSBTYWx0ZWRfX69+bia78LOOs
 3tC8KKK8WGp0GybO4c8X9et2WOjx/gE4iOL85sJAMVDRhNYB+o6U9PqMnNNO9eetx4yq2VPcWVr
 T6DGT1VECGOCVQ2fTLDJ2jM9JVRD5xdQReiUrtPLJyxPMjIFnNzl
X-Proofpoint-ORIG-GUID: s6c1_ZaOV4GMeVpp0oTaJcznkTNpMQ7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA3NSBTYWx0ZWRfXzRTozgKVcTAD
 mRStGUTDVZtvRJXIQ7W489j09FCiW9wvbB+rgNcMzlqbARhHIVy2qtRe2bkVrr5FaOCrnyEr8eM
 NXT3zOgz3H4ZzH6+z1lJagpfxvKMYYv/rsATZPKOIsxkLnpebSo6pK7re1qRTJyOrE/i+/8bg7b
 if3wNsSOR2zZbaO+GbRYs6Rv+vIxwgzNPD1rFKEJCdHkjOp9QHKS/YlTGTRVB8xbAQZhH36i9LJ
 0AgMnzttDGPSjCu9AoRoo/ZESfI+0AJLzo3pn9PPFajbjM7SfBupd03sg3Llg2LPReKZ9bcmMlf
 72EZHuL3LCbF2tT8lIhZOQHUvR/FLvGdEvpNWXIadwA/WuV2OBayeAI5EJago/YG/OFgK/Vl2sm
 wqARX0bRwIWFx09U9mxyZMZoz/XrTC3+lA/4Y5bE3nQojZFTtdqCS8Ou7/4KcSVSGeX0AIze2s5
 78Ybn6zFixfJTLZ9h5g==
X-Authority-Analysis: v=2.4 cv=bZlbluPB c=1 sm=1 tr=0 ts=6a71b34b cx=c_pps
 a=4hkPnzPWF5dDNVFVY+J6sg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22 a=-VCclSYHLTda9MBvNMHz:22
 a=RpNjiQI2AAAA:8 a=Q4-j1AaZAAAA:8 a=7zkKd5b7AAAA:8 a=pGLkceISAAAA:8
 a=n9SCklZpAAAA:8 a=I-W8BvFOD5YIKe0_4HUA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=Y7sFFPFacH6dMruAnHcA:9 a=tqdMzFhGG8mD8GCBlf4leDhY3gs=:19
 a=-c124cvzILIwIy5f:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=s4142C9f8xt5yEUcTmgt:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: s6c1_ZaOV4GMeVpp0oTaJcznkTNpMQ7W
Subject: AW:  Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide target
 kernel version
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 09:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128743

--_000_VI2PR01MB11434CD485920AA5F167B2BA7DBD42VI2PR01MB11434eu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


linux-kernel-base is deprecated in oe-core/master now. I would suggest to u=
se the new ways of using it via oe.kernel.get_version_file

Good to know, I will provide a separate patch for master then. But for the =
wrynose branch this would be the way to go right?

________________________________
Von: Khem Raj <raj.khem@gmail.com>
Gesendet: Dienstag, 4. August 2026 01:51
An: Rastetter, Rouven.ext <Rouven.Rastetter.ext@karlstorz.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Betreff: [Ext] Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide target k=
ernel version

On Mon, Aug 3, 2026 at 10:=E2=80=8A19 AM Rouven Rastetter via lists.=E2=80=
=8Aopenembedded.=E2=80=8Aorg <rouven.=E2=80=8Arastetter.=E2=80=8Aext=3Dkarl=
storz.=E2=80=8Acom@=E2=80=8Alists.=E2=80=8Aopenembedded.=E2=80=8Aorg> wrote=
: The Makefile uses `uname` to determine the kernel version. We must overri=
de this with the actual



On Mon, Aug 3, 2026 at 10:19=E2=80=AFAM Rouven Rastetter via lists.openembe=
dded.org<https://urldefense.com/v3/__http://lists.openembedded.org__;!!Lw1u=
GqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nsp=
TcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1K3QcFIE$> <rouven.rastetter.ext=3Dkarlsto=
rz.com@lists.openembedded.org<mailto:karlstorz.com@lists.openembedded.org>>=
 wrote:
The Makefile uses `uname` to determine the kernel version. We must
override this with the actual target kernel version.

The kernel version might be empty during parsing (e.g. when using
linux-dummy), therefore `or ''` is needed.
---
 .../vboxguestdrivers/vboxguestdrivers_7.2.14.bb<https://urldefense.com/v3/=
__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyO=
OsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9it=
Vq1O_1M_cL$>               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.=
14.bb<https://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1=
uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8ns=
pTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$> b/meta-oe/recipes-support/vbox=
guestdrivers/vboxguestdrivers_7.2.14.bb<https://urldefense.com/v3/__http://=
vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRt=
j6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_c=
L$>
index 18fda0393d..6a870c267c 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb<h=
ttps://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvt=
J_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMy=
tRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb<h=
ttps://urldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvt=
J_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMy=
tRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$>
@@ -14,7 +14,7 @@ DEPENDS =3D "virtual/kernel"
 # compiler-runtime deps needed to compile and link the userspace utility.
 DEPENDS +=3D "virtual/compilerlibs virtual/libc"

-inherit module kernel-module-split
+inherit linux-kernel-base module kernel-module-split

linux-kernel-base is deprecated in oe-core/master now. I would suggest to u=
se the new ways of using it via oe.kernel.get_version_file


 COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm64)"

@@ -32,7 +32,7 @@ S:task-patch =3D "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH =3D "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 =3D "amd64"

-EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_=
VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${STAGING_K=
ERNEL_DIR}=3D${KERNEL_SRC_PATH} -ffile-prefix-map=3D${STAGING_KERNEL_BUILDD=
IR}=3D${KERNEL_SRC_PATH}'"
+EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KERN_MA=
J=3D'${@(get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') or '').split(=
'.')[0]}' KBUILD_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-=
map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} -ffile-prefix-map=3D${STAG=
ING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}'"

 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS =3D "all"

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#128696): https://lists.openembedded.org/g/openembedded-=
devel/message/128696<https://urldefense.com/v3/__https://lists.openembedded=
.org/g/openembedded-devel/message/128696__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cA=
yPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW=
-k9itVq1Bd60O3W$>
Mute This Topic: https://lists.openembedded.org/mt/120580604/1997914<https:=
//urldefense.com/v3/__https://lists.openembedded.org/mt/120580604/1997914__=
;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj=
4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1JjzgnAr$>
Group Owner: openembedded-devel+owner@lists.openembedded.org<mailto:openemb=
edded-devel%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub<http=
s://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel=
/unsub__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6=
JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1Efr4Ozd$> [raj.khem@gmail.=
com<mailto:raj.khem@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_VI2PR01MB11434CD485920AA5F167B2BA7DBD42VI2PR01MB11434eu_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);" class=3D"elementToProof">
<div style=3D"direction: ltr; font-family: Aptos, &quot;Aptos_EmbeddedFont&=
quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
linux-kernel-base is deprecated in oe-core/master now. I would suggest to u=
se the new ways of using it via&nbsp;oe.kernel.get_version_file</div>
</blockquote>
<div style=3D"direction: ltr; font-family: Aptos, &quot;Aptos_EmbeddedFont&=
quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, &quot;Aptos_EmbeddedFont&=
quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Good to know, I will provide a separate patch for master then. But for the =
wrynose branch this would be the way to go right?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>Von:</b> Khem Raj &lt;raj.khem@gmail.com&gt;<br>
<b>Gesendet:</b> Dienstag, 4. August 2026 01:51<br>
<b>An:</b> Rastetter, Rouven.ext &lt;Rouven.Rastetter.ext@karlstorz.com&gt;=
<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Betreff:</b> [Ext] Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Provide t=
arget kernel version</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"line-height: 1px; display: none; font-size: 1px; color: rgb(2=
55, 255, 255);">
On Mon, Aug 3, 2026 at 10:=E2=80=8A19 AM Rouven Rastetter via lists.=E2=80=
=8Aopenembedded.=E2=80=8Aorg &lt;rouven.=E2=80=8Arastetter.=E2=80=8Aext=3Dk=
arlstorz.=E2=80=8Acom@=E2=80=8Alists.=E2=80=8Aopenembedded.=E2=80=8Aorg&gt;=
 wrote: The Makefile uses `uname` to determine the kernel version. We must =
override this with the actual</div>
<div style=3D"line-height: 1px; display: none; font-size: 1px; color: rgb(2=
55, 255, 255);">
</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">On Mon, Aug 3, 2026 at 10:19=E2=80=AFAM Rouv=
en Rastetter via
<a href=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!Lw=
1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8n=
spTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1K3QcFIE$" id=3D"OWA82bb653b-e4bb-e168-0=
f05-2e77a43b13b2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a> &lt;rouven.rastetter.ext=3D<a href=3D"mailto:kar=
lstorz.com@lists.openembedded.org" id=3D"OWA6d24e70e-fa88-b7ec-d9b0-64e5f07=
d77a2" class=3D"OWAAutoLink">karlstorz.com@lists.openembedded.org</a>&gt; w=
rote:</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">The Makefile uses `uname` to determine the k=
ernel version. We must<br>
override this with the actual target kernel version.<br>
<br>
The kernel version might be empty during parsing (e.g. when using<br>
linux-dummy), therefore `or ''` is needed.<br>
---<br>
&nbsp;.../vboxguestdrivers/<a href=3D"https://urldefense.com/v3/__http://vb=
oxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6=
u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1O_1M_cL$=
" id=3D"OWAd6cc4839-7624-11ff-afa0-c6a3926475bc" class=3D"OWAAutoLink" data=
-auth=3D"NotApplicable">vboxguestdrivers_7.2.14.bb</a>&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://ur=
ldefense.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et=
-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_=
tEknFQ2dqGW-k9itVq1O_1M_cL$" id=3D"OWAaa13fe21-7f1a-0fce-2db6-8a164773e9aa"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">vboxguestdrivers_7.2.14.=
bb</a>
 b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefense.c=
om/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!c=
AyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqG=
W-k9itVq1O_1M_cL$" id=3D"OWAc4e43a45-62e6-41d4-9ac4-2d711923154a" class=3D"=
OWAAutoLink" data-auth=3D"NotApplicable">vboxguestdrivers_7.2.14.bb</a><br>
index 18fda0393d..6a870c267c 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefens=
e.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwb=
o!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2=
dqGW-k9itVq1O_1M_cL$" id=3D"OWA44aa56c4-0e41-5d3b-8c21-b26d71979509" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">vboxguestdrivers_7.2.14.bb</a>=
<br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"https://urldefens=
e.com/v3/__http://vboxguestdrivers_7.2.14.bb__;!!Lw1uGqvHvtJ_psGG2Et-1voSwb=
o!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2=
dqGW-k9itVq1O_1M_cL$" id=3D"OWA57fa9db5-cea2-b030-7681-a1aad5ed81bf" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">vboxguestdrivers_7.2.14.bb</a>=
<br>
@@ -14,7 +14,7 @@ DEPENDS =3D &quot;virtual/kernel&quot;<br>
&nbsp;# compiler-runtime deps needed to compile and link the userspace util=
ity.<br>
&nbsp;DEPENDS +=3D &quot;virtual/compilerlibs virtual/libc&quot;<br>
<br>
-inherit module kernel-module-split<br>
+inherit linux-kernel-base module kernel-module-split</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">linux-kernel-base is deprecated in oe-core/m=
aster now. I would suggest to use the new ways of using it via&nbsp;oe.kern=
el.get_version_file</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;"><br>
&nbsp;COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm64)&quot;<br>
<br>
@@ -32,7 +32,7 @@ S:task-patch =3D &quot;${UNPACKDIR}/${BP}&quot;<br>
&nbsp;export VBOX_KBUILD_TARGET_ARCH =3D &quot;${ARCH}&quot;<br>
&nbsp;export VBOX_KBUILD_TARGET_ARCH:x86-64 =3D &quot;amd64&quot;<br>
<br>
-EXTRA_OEMAKE +=3D &quot;KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KB=
UILD_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=3D${STAG=
ING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} -ffile-prefix-map=3D${STAGING_KERNEL_B=
UILDDIR}=3D${KERNEL_SRC_PATH}'&quot;<br>
+EXTRA_OEMAKE +=3D &quot;KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KE=
RN_MAJ=3D'${@(get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') or '').s=
plit('.')[0]}' KBUILD_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -ffile-pr=
efix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH}
 -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}'&quot;=
<br>
<br>
&nbsp;# otherwise 5.2.22 builds just vboxguest<br>
&nbsp;MAKE_TARGETS =3D &quot;all&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128696): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/message/128696__;!!Lw1uGqvHvtJ=
_psGG2Et-1voSwbo!cAyPfyOOsfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMyt=
RMmyjV5_tEknFQ2dqGW-k9itVq1Bd60O3W$" id=3D"OWA3f53b015-3355-9466-09f5-aa451=
83c7fa4" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-devel/message/128696</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/120580604/1997914__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOOsf=
xcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itVq1=
JjzgnAr$" id=3D"OWA0519b09d-a7c6-bacf-18e1-294928ae96c3" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable">
https://lists.openembedded.org/mt/120580604/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" id=3D"OWA412f3568-8b35-cc12-a20d-82a92485364e" class=3D"OWAAutoLink">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-devel/unsub__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cAyPfyOO=
sfxcDtRtj6u9pMZv0OEOSnLiePM6JDDB_1lj4yH8nspTcwVMytRMmyjV5_tEknFQ2dqGW-k9itV=
q1Efr4Ozd$" id=3D"OWAc520045f-9c66-727d-9666-5e6b39a561e4" class=3D"OWAAuto=
Link" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" id=3D"OWAb9170c36-f3c9-11b1-8acc-30301792db2f" cl=
ass=3D"OWAAutoLink">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
</body>
</html>

--_000_VI2PR01MB11434CD485920AA5F167B2BA7DBD42VI2PR01MB11434eu_--

