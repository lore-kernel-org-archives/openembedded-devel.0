Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84159C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 03:51:52 +0000 (UTC)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com
 [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web11.24811.1660708302838399957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 20:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=AGQBQHd0;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1660708304; x=1692244304;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PzYMkIvtcSthoEGFaIXlLEGBPz9tuWQjLTT9FTyBBkI=;
  b=AGQBQHd0j54ATc3FQrFtJa/PRC9h3ijkOTO1o2f7YtmBNU4Wl1XcjE7D
   FDapjQT7t6Gdm6jDc86X71PBbbvP7xPFMoYiPbukuyDtZb8hfT2yApV2k
   iN2kKt+Jxm3Pk4fRhGPfcWRkHgsXdknHL2KL6zMm5Xx1cgVpa5cApR5nS
   yH9SUemntGecMwQCsUitMVT8wpO9SgF6O14R3ut6xF8ToeiXMCJZ9g+IK
   3hEbSl2+lSpE+5+55CK3iWe9JGzOpWf137Z4hoNtT2JkDI9d9J0BDFFVm
   ZfKp3w2WN5rNYplkXB1cc2mixqOF3rIXC3+IVfL/uUGhuQ9iHxuzoRZ8N
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="62785209"
X-IronPort-AV: E=Sophos;i="5.93,242,1654527600";
   d="scan'208";a="62785209"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 12:51:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHb40vIq9G4C+Qvofesl41khtdGKnX/F9elfvecguc7++YWAy9eWwBqI43LPAUvP5b1n3fgRMh7GXcNCVip14KV//0PhI3lAicCCfZdLOEqh/gKg8y9MvpQwH0qVg0nnKEg/q5SdmfdftXKrDwcTOSfgvSkrf2YpwURCcnUHMuE3/APOzlYyTq3rD61ASd+8ZDWWlVaBWGRk67QWUCWXm1ANnatQbHGinRykwK+/RS1fOWoetdvuGjshP4p/37t7rtPmxXvJoF0UMe3lcRx7ZhQHtbJ8k9En522Z8ZEcun/wqQ5U7ooxthVY1s002TkwV0Dv80xVefFLUNa7oNWX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzYMkIvtcSthoEGFaIXlLEGBPz9tuWQjLTT9FTyBBkI=;
 b=K62e8SO5mCv1QJ0Ybk5rg6S4vUlToxA732rfUXlfS9FDd+XFCRfz31DjrfFq1A4nqM5tmJS8Gou6T2qnhYoVpsyPDLZzcIg/5+ozY0ckT6oElJIZuHF6gIdZCtvdJo1vwTPZLYZitmxUz14x3PfcRHgWMitMivt5hJfj/df8NuBSE/Kj/4REdmPKCS1D96BtpGHJV2/PBHwdHqMSBIQIRTbYcpGstQ6yEgEII3GcfgaIsgldQzpL6GdOh2gB0D7wpLNiql80Y71Lg+jBFIFmlUNSS2r+czFRuuprBFVrhAYb/M55kMWNlp0j0rcyCGULl5XPIrM45nstjivDSPJjbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com (2603:1096:604:f1::6)
 by TY2PR01MB3051.jpnprd01.prod.outlook.com (2603:1096:404:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 03:51:37 +0000
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::a48a:df3e:3338:953f]) by OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::a48a:df3e:3338:953f%7]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 03:51:36 +0000
From: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [PATCH] [oe] [meta-python] [PATCH] python3-asttokens: upgrade
 2.0.5 -> 2.0.7
Thread-Topic: [PATCH] [oe] [meta-python] [PATCH] python3-asttokens: upgrade
 2.0.5 -> 2.0.7
Thread-Index: AQHYsecum83HMbw+dUaAF6R9V/cyEa2ydSIA
Date: Wed, 17 Aug 2022 03:51:36 +0000
Message-ID: 
 <OS3PR01MB62417C34A2118FB8328C02E78B6A9@OS3PR01MB6241.jpnprd01.prod.outlook.com>
References: <1660249019-20179-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <d3dc6dc7-7288-59aa-c7c5-4c6190c1beb5@gmail.com>
In-Reply-To: <d3dc6dc7-7288-59aa-c7c5-4c6190c1beb5@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzhiNWI1MWQtMzQzZS00MWI3LWI0NDAtMWZhMThmMzk4?=
 =?utf-8?B?YjA3O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wOC0xN1QwMzo1MDoxOVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c2a5c5c-85b1-42b0-8f2b-08da8003c8a5
x-ms-traffictypediagnostic: TY2PR01MB3051:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bXunErLOhbtL/xP1NbA0cCbi074IF6OXiBH2/Ps/qjipQbK3CYvkuJg03P2i7Ddj0kjDDbdetOCX9abmCCYbB1SUsOOlfit3/Yxek03EtnHneHbBSKjqbNjL3Lo9qFgkL+z07Jn3eQq4Tcvp9yU6GugumXCgb5KgSl/XFrHgIDsas+N1BrpCCI8e/3mVPSZ73ZVOHzFP6x0D0FIOwFgcrMKdryS+xhCpsOCIuYUVj/MPik0JL+N2aF2cPJsJ7XhPk8lksRUzdXcEH4zLVRnV4FhHaHPZOVL5FYCDaa/BXoAK2tJNFtB4gJmhheuac2Xk3koW4Kihmpx0TI5nqPAIgCXG6waU8dErl6Hx+8dhVLpsQNeImoEKV8KgjKFeQEb3SFmETQwQZhkoYtzcVFMd55r/iHTcJ5CqDiAhcyhzGvj48UwvlrWTxtHbguEWolxW9YVO16O9rt7vAJWQHWDBPi4OO1X1oaRD8q8obVw59CfUqxGSDgpa908EP/wDd+1UAlnquIQvHy/Prip52Zo1pgn/gp/F2MTdAq7/gs+q4ib0sCvONXVpPuF2Dvm+aSEMAr4b1ayAr4PQE6blvbiE7nxI/GNeO14bcfjCWa7wb705q+mM0j84xBtXS7z8T2FfNbj/VhQ2oo4nuPKwwWT43sRZqf6vwqgEqtCOav7E0egssqQ2j8813/5UfVsJ7bmZ4E0JIt8GRWzKMjY6OOE3yGgJz14De2ilQNurW2Wxskw4Pw5izQR4IXCYxPL/wd5ncXuGX1IayhHYWXoMm7JA1Ae7C0CTH0aF+59WQherzNHBnludhZ6CIGmnbq5BdS24RYxtL2hZU/hRsyty06bz/19m7A3SEMKmvxLIcGnkhM0ad4KGCRixs3LL4dq6quHHgM1/6Tx6NUYINWye4yYqPw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6241.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(38070700005)(2906002)(82960400001)(966005)(86362001)(6916009)(316002)(5660300002)(71200400001)(26005)(85182001)(41300700001)(55016003)(1580799003)(52536014)(8936002)(122000001)(186003)(76116006)(8676002)(478600001)(64756008)(33656002)(66476007)(66946007)(66446008)(66556008)(53546011)(9686003)(7696005)(6506007)(4326008)(38100700002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0RCaVdUYmxwaXRZaWo5T1RBWGJHL1F6VGZCWWx0N0NncTREWkRibFBianNa?=
 =?utf-8?B?cld3ek1IamN0VE1BTUFHMzc3STRYOHRYeXVBenJzQzFSRFM0L3kvb2VlQTc1?=
 =?utf-8?B?OExyb29NQXYyck9wZUVqQmphd0RFT0JEQlBiTUVhNzZQdUc4Nmg4cGNUTGpB?=
 =?utf-8?B?T2o0VzBkaEZxdWd1Q1hBZjRhZDd1ek1MelV1QlptdjBiSnZwbW9VOTZLQzFQ?=
 =?utf-8?B?dWFKdFRPYTdDeGJaK2o4MzJwd2lPWnRJK2hhZ0Z5SkpwV01SZXI4Y2JJeCs4?=
 =?utf-8?B?dEx6WmtUb0h1VmpQOEZlaGd2cXBJMGhBVVJMbW9Zc0EwaUpGeFBOUmxKb093?=
 =?utf-8?B?TU5Ha1RldEFaZEV0SlVLaXlEOGZXN0MrNFFNZmF6KzJrTXhHYm9KdzdRRG8x?=
 =?utf-8?B?YTg4NllUS0VBM2IxLzZjSU50bXBDdGpwem9QR3o0UkNrVUZ5dVJSYW5WRFdI?=
 =?utf-8?B?TGFHMDBnUVFUY1lwQUM1MkRlalNYejNEM1Q3U2pZK2JneFBFaVNmZG0zUHhR?=
 =?utf-8?B?bVdQajZRV3E2RmFDdk1VeU1JcjhiQ3daZWJ4T1Q0NFZYb2JMTlhhODB0UkRt?=
 =?utf-8?B?ekhkdUFEbHJ3cVFxMEVuU2V2SWFHaS83em1sVHFwNEdEL29ueVpoYWtWQ1RN?=
 =?utf-8?B?bm03S0xnTHNpbVhHKzh5WDFpV3cxbnVhQ3pJanRYdXBqUXNSbmhFQnB3ZXRY?=
 =?utf-8?B?M1hjanlzS2wvWjYzaU0zVGhXTmZrRXBlZU40WFNvODY4TVFaL0xVa3lEd0tB?=
 =?utf-8?B?OEd1NkQ1Z0RYa1NKQ0ZHem8vWU9zRXlGMGoxN1EwNTdzUTZGUWdkK1pBdjZh?=
 =?utf-8?B?TlR5aVI2WkdOYjFaVW5mNWk1Zkc0MEFLZGtmSGUrS2g5UTFCZ1hDYTZ3MFJp?=
 =?utf-8?B?M3FackQ5bnF3b1ovemlSOVJiU29saWtRbHVQQ0wxaC9ZbUk5V0d0MkdPbk1k?=
 =?utf-8?B?UHYzTnhyNEpzcDRId2tVL0wrVGE3enJKSkNRSGlJVVFMQzFHNVlKcHRWUUcx?=
 =?utf-8?B?RDN6MWFYd1ZFa0xZQ25oVXJnY0VraThxR2kwSVg0TU1LNDJBaWNEL3Bjei9N?=
 =?utf-8?B?VkdpeEFHMnFaRmwrM3pRZUVJQk1adFVFOCtxWnFYZk1zSy8rUUFGNmgvaHdT?=
 =?utf-8?B?NSsxSElSQ3U3TzhQb1ZrWEtobWRydXJHdTlRUWIwRFhoa2NqSitGdjFiblJu?=
 =?utf-8?B?K1liZFlQcWs0a3dYRURxbHcwaG9GZkRlQVNOVVdVeGtxM05QSitocElVNjBK?=
 =?utf-8?B?ZEV2TjI3VFp2VFZiSlNValRiZDlPTXVLU3drQUxnTXR0OGUwaUhNSHBsRUE1?=
 =?utf-8?B?OEtpVFhBZExEZWNZQmNhOUI2Q3gzTjNFbTJ0S25aTThXeXlWVlJiS09Qb1k3?=
 =?utf-8?B?Rm5iaXU0Qm1SZHRpRVhuWXg3OXNLRUFTOWE4bDlQc094Uk5mZEZ6TjBwTGE3?=
 =?utf-8?B?QzB5OThkT2hiZHk2a3ZYUWdRTlpmeXc1K3dMKzRzZTI0UE95OVd4QS9nTXlH?=
 =?utf-8?B?Yzl5Z1Y3WENqd2dtcTJzK2s1dlliKzljb3h5UHFDM3hSSHhSMG9JaVdJcm9y?=
 =?utf-8?B?Y2Y5VDYzWDZUVm9INmJEdDdXdC9acVU4TENoMGpsU0l0ZEUwWFRjZUo5bFdn?=
 =?utf-8?B?aUExam94SFpBcUoyZTBxbVcwSGcxZFIxRW5nZ1dEYlIzV3NNUXlYcEhuZFd1?=
 =?utf-8?B?bjZyQ01EUEplTllIaWt6THZxZlNKUDZqUU9RNHAwSXNqOGE0QnhmS0Y3Y1A3?=
 =?utf-8?B?SXp6Q2xBMUttYWRwQ1g1RW9FWnZyV25qY2dEOTZwVUpPcUppR0I5RmtHbnda?=
 =?utf-8?B?VnpsaGZ1cE9kajdGR0ZoUExSSVlGU05tbXRjUnNjUmhhRFVIcmVKR09WakY5?=
 =?utf-8?B?N21VU3EvNUFHZkNrRjI0Tk5yZGNPVjFzcENkSFVEa2NZK2F4SWNZMlM1UWxK?=
 =?utf-8?B?b0x0eU5NVFRKd2N6YTlVd0VuNkd0aGJabmZueFNuemxvMDFWaVhGY0Q5OCtD?=
 =?utf-8?B?N0FJMEl2VklSVlBZZmZ5U2N4Q000amRMMDBBTWQ3TzU5SjFvVFU1SnpoYVhP?=
 =?utf-8?B?eXdCbHVDcWtLZUc4cld3VDlhK2hneFIxV1U0WVYyNkNtckZUMmJJTklNek12?=
 =?utf-8?Q?Dp0pnxLcr2DYqE9c7Fl3rYA9y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	dvL8MmJuvFD3OAVNGnxHGAJkhgfgQeTVJMpui0x/+b/PxoztgbQTia68QH9KMDHL5tp9J1/UV7ORL5BAe17aqr/c5t+pyotQ5N6/SiqB+Q2cF61qlZ3KhtIlUbNle9ghlme0CmeHJ9QsdP2WAEDgEhWI/ZHB4HZJKW5CvLTT+LW6WS8T4xZL2iUGMUTYlpAO3er67NdvrwEsoGSFnq1XHkH9g8LHc5vJuzFjeJToHDfzmcy7W3dYnrjSxhFyYt1K2unfiib1Xib4SkhV1AjRCWitn+ZvfPWyPTBTEgSsnauyFR8ufcDJ2k1GittnetiNJKEOyDyFdZ9GGFaRdVYm+jrLCOlYcQrAnxV7ulNFtYoHOMU22E3eo3KweiFgDSBwEQGhcj2+4IhIwu6Xy5NyZ+/Sk69nytlow38ltLvbROCReMrJNriaiROgxkyDOT+1jCJ2fOa+jEB2f3AZ9UMY95OFEyYPAWiPNcc620baUz4+QYtrQT1fitXLeFLplOtqQ/7oWrLPir4C6JEvFi6e2kmxX5RkwifPmNXiXYqFqyVQRX2qPsIiLnVohRqtsEbSCqRIva3mTbZcuZfSGJ/hHekfBO6W/Vw+aCgguGS3fctH5N8mHPUCkWq8HJrSBHXI2TXCk9qBDBF7sCXZxmTKBbsBfNTMz01fuIioOJZIHqEcIsImMOatwcmUU/6mEvZcatMNQRzUgiZpj9Ec2DkbOx4iTeKXP/7zLZUwyzEitMDuDbu+RWDAvq/gLKEPweYm9B2jRo1fr08u+qegqXTnAhlB2WQ8dvG/xpAq9vunvWsLH+c+9wWFn5YAjs4cp2OR
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6241.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c2a5c5c-85b1-42b0-8f2b-08da8003c8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 03:51:36.5271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 MlLnOEsOmhNF17irn2PSaI2WX+bD6z+oSvz4wbaZDHB+RQf/CffrofI3BNoQ7ZcQtPtjb3pLo12TKGCsPDHGRrFqf3w1g8dUnSDObCIYohA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 03:51:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98287

SGkgS2hlbQ0KDQpJJ20gc29ycnkgZm9yIHRoYXQgcHJvYmxlbS4NCkFuZCBJIGhhdmUgYWRqdXN0
ZWQgbXkgc3lzdGVtIGNsb2NrLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29m
dHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9hZCwgU29m
dHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVu
Z3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXVndXN0IDE3LCAyMDIyIDExOjEyIEFNDQo+IFRvOiBaaGVuZywgUnVvcWluL+mDkSDoi6Xp
kqYgPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtvZV0gW21ldGEtcHl0
aG9uXSBbUEFUQ0hdIHB5dGhvbjMtYXN0dG9rZW5zOg0KPiB1cGdyYWRlIDIuMC41IC0+IDIuMC43
DQo+IA0KPiBwbGVhc2UgYWRqdXN0IHlvdXIgc3lzdGVtIGNsb2NrIGJlZm9yZSBzZW5kaW5nIHBh
dGNoZXMuIFRoZXkgYXJlIGFnYWluDQo+IGFycml2aW5nIGluIHBhc3QgZGF0ZXMuDQo+IA0KPiBP
biA4LzExLzIyIDE6MTYgUE0sIHpoZW5ncnVvcWluIHdyb3RlOg0KPiA+IEFkZCBkZXBlbmRlbmNl
IHB5dGhvbjMtc2l4DQo+ID4NCj4gPiBDaGFuZ2Vsb2c6DQo+ID4gRml4IGFzdHJvaWQgdHlwZSBj
aGVja2luZyBpbXBvcnQgZXJyb3JzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9x
aW4gPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLnl0aG9uMy1h
c3R0b2tlbnNfMi4wLjUuYmIgPT4gcHl0aG9uMy1hc3R0b2tlbnNfMi4wLjcuYmJ9IHwgNg0KPiAr
KysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPiAgIHJlbmFtZQ0KPiA+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLWFzdHRva2Vuc18yLjAuNS5iYiA9Pg0KPiA+IHB5dGhvbjMtYXN0dG9rZW5zXzIu
MC43LmJifSAoNzMlKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hc3R0b2tlbnNfMi4wLjUuYmINCj4gPiBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXN0dG9rZW5zXzIuMC43
LmJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA3MyUNCj4gPiByZW5hbWUgZnJvbQ0KPiA+IG1ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXN0dG9rZW5zXzIuMC41LmJi
DQo+ID4gcmVuYW1lIHRvDQo+ID4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1hc3R0b2tlbnNfMi4wLjcuYmINCj4gPiBpbmRleCBkYTQ5MDQwZDc2Li41ZTNjYTll
MzBmIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYXN0dG9rZW5zXzIuMC41LmJiDQo+ID4gKysrIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hc3R0b2tlbnNfMi4wLjcuYmINCj4gPiBAQCAtNyw4
ICs3LDEyIEBAIFBZUElfUEFDS0FHRSA9ICJhc3R0b2tlbnMiDQo+ID4NCj4gPiAgIGluaGVyaXQg
cHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhDQo+ID4NCj4gPiAtU1JDX1VSSVtzaGEy
NTZzdW1dID0NCj4gIjlhNTRjMTE0ZjAyYzdhOTQ4MGQ1NjU1MDkzMjU0NmEzZjFmZTcxZDhhMDJm
MWJjN2NjZDBlZTNlZTM1Y2YNCj4gNGQ1Ig0KPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAi
ODQ0NDM1M2U0ZTJhOTk2NjFjOGRmYjg1ZWM5YzAyZWVkZGVkMDhmMDAwNjIzNGJmZjdkYjQ0YTA2
ODQwDQo+IGFjYzIiDQo+ID4NCj4gPiAgIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1z
Y20tbmF0aXZlIg0KPiA+DQo+ID4gK1JERVBFTkRTOiR7UE59ICs9ICIgXA0KPiA+ICsJJHtQWVRI
T05fUE59LXNpeCBcDQo+ID4gKyINCj4gPiArDQo+ID4gICBCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSINCj4gPg0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcv
UmVwbHkgT25saW5lICgjOTgyNzIpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk4MjcyDQo+ID4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTMwNzM1NDUvMTk5NzkxNA0KPiA+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

