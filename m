Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D95EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 08:38:08 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web11.3410.1689669483611646681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 01:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=qRye1q3E;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1689669484; x=1721205484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=beLUiPzh0/8HThiiN0+COMwbJuODeYF9LAFtodynQxA=;
  b=qRye1q3EqZQaD3kZDOTumXqY7ORutBB0DcLAyvyruKyddGjfWHBwCjsN
   cm6601PHTrGY9+LPYdPJObPy02HF6cvhH5t5JNasbc+Ht5X0iyb/zj8wn
   9RlDYQL3y/psxljwoVqD7rO2kcHzXurMBDIKsehUHMZ/09RnquEq5hsir
   GDPmutRAP2DCirJOY8eVmLZvnBGKYFeUjiKsqWN3RykrWJJA6QCAMkeES
   6OG0+GuvZUJ0wUzyGqSla/Cm20vWbjL7J4LAAplidSJ5+DBvwsyKPO8Wu
   oWkNiCrObC8euGTmuF35oL3AFioJP+g35YSghaWA0kidb20II6ZUgYk5a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="89588920"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="89588920"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 17:38:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjz6fj4PCWLNXRWkZ+AZfi1YlZTLBvlVeld0Xx1BNX49y+fxnl3/98qE11ExGzfyTwg+RTeUgWlv8cffJ4ryVl/F5JPa7IxtAuvOJGFbDTN8IgoInXscN47MEG+Zuma8ymVMjwQjrn3XGNeRli7DOBNT5BdWe3anH+lIbBorEpaI2hlra6Z3gCYiqRBl6TDBnRvHzFXQD4ln5LGj2z/c0JfS5lFJLnOQaBskCPVOca9t4th8Hc46QS7BAjvrzrjp9z04bBVeEs5ATC2KS3tMzf00lcqnwg0jic9u5OgHCye8rarMzRjtzhn1XPSB3FzQWPS302lRjQ1+IV/U3AL2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beLUiPzh0/8HThiiN0+COMwbJuODeYF9LAFtodynQxA=;
 b=W4eF9X7I4vf4YAC296QufjM5ak5LmPH6drVTtM5bf8nmNUG8eZgi21gBtxl4bequXs50GnoMq3GucW/0axnfpPlNkvFtbKyl7ETqdWhSym0heHKPPMleC9m7AimYGibCv+hcjky5/0ohkjTEoKWGybtPCmTLp9J2C2CsOLIBMUBtiP+BWQs1PclTZ+VYMPMgvXbgNHdcTqtEaW5YLB2waVC86ZGE0j7+ZYWXGzgnT/WaPLSmoHFgdLJzYbM6Jpw2BGhvtnfuTMPGxbMcMpqkpBy/Cp10qk3QDpfY4PV8gKcvP0BNRhWBroMeCuy4GqRaytVwPrNmvP3y+YtSB7HRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 08:37:54 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::5e80:ea3b:2632:aac3]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::5e80:ea3b:2632:aac3%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 08:37:54 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
Thread-Topic: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
Thread-Index: AQHZte6wG/0iTeH9d0CYA9Eyj/tPl6+50m2AgAVXo+A=
Date: Tue, 18 Jul 2023 08:37:54 +0000
Message-ID: 
 <OSBPR01MB1845A75403C0F960DE2ABEDFDC38A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
 <1689296444-28141-3-git-send-email-wangmy@fujitsu.com>
 <CAMKF1srup6UtozS8i_i=gwcMAG1WO2zRyVZ_de6zLtSB9Lqx8Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srup6UtozS8i_i=gwcMAG1WO2zRyVZ_de6zLtSB9Lqx8Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YmQ3MDBmZGUtMmU5ZC00ZmU1LTg5NDgtNWUxNDkxMjk0?=
 =?utf-8?B?NjkyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNy0xOFQwNzozOToyMFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TYCPR01MB12093:EE_
x-ms-office365-filtering-correlation-id: dcec3967-2c3b-4cb5-6e5f-08db876a47c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cU1gKFKSg/czirjDaAHgLfxKKnEUnwSURqCKCA/tbTz2/c1e1cUknPQkLiTWN0U9XwqdodoJG5EGHoP7id57O7iNrk4Ap9nSG86uipPomoUtHeWAn2TlJZE012ArMPNSMT2ldYA5bBFAQwINjuBw62DWCDAzQHR1F1XbkdmjsshaTUHn8tIy6wT0qvGmkuuoAW8zZuog4C6gZEq0Psc8Jhh/bnlyWIDKjTqKYOT3Ed8L3//PomigkinhXJZJbiuR1H2vWki9CkJpJBnpkS6FBSzAm4K5L2VV3091+28yGLNJ3KBzzXtK4QNusXGklmMJ+Tnvj+5DH4y2/GSY7WsXPm/fLfqZQQcYPg0VikYAAHqJrKCYC1iYQysQXHd7Fn8GjjQhqy/2WMwY/vAiJV2IKvE5esOSnAOMEqOAIFXU5yNTlYf5EBFnXe5XAxppXhVw+rxiYXeA/2ZSAKW7mKnZCooyiwLYiXWrzYh7uU50AWONOGGHpsyRbXc9K1n9LQql26quV0EAQs9x1IkbQXH2i7bmBTSiy34VCk1NI8NwlO0KJfmwUdHSuFtGokrenV20Y+txJ1OGFJmR0Mdw/AJurKGsvutrtUZS9cgKhBCdLFOjNVaABQI+7cd6pNE75poQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(1590799018)(451199021)(966005)(55016003)(1580799015)(53546011)(6506007)(66899021)(9686003)(26005)(38100700002)(85182001)(122000001)(38070700005)(8936002)(5660300002)(8676002)(52536014)(2906002)(4326008)(66946007)(316002)(86362001)(6916009)(76116006)(64756008)(66446008)(66476007)(66556008)(41300700001)(33656002)(7696005)(71200400001)(82960400001)(478600001)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3VZWFQ1bU9VcElXZHdLL0xGNzZza1RTcXU0UTdQREkvQVVFYmhucE9vTHlI?=
 =?utf-8?B?OTZraWZpeW9QMHRITjZWcmdiU0JObE5qS05MOWV1Z08yWjVaMk1mN1hacGJp?=
 =?utf-8?B?R1JDQlQ5RS9ZNkhJcUMwRXNyTUJCYlZueUpzZjAxcHc0ZVJTSnZ4MFpRNXQ5?=
 =?utf-8?B?SUExbURjZGJkbzR4TjVFbmhReVcvajBQVUhVNnBERzJLYkcyVnZHTGY2ZXFK?=
 =?utf-8?B?ME01WXQ5Wk0vOFlwVXIxS1NjM1FxN3Zzek5lQVRuOGYwZ0Y3a3hPZm82QUIz?=
 =?utf-8?B?SWNURDdxNS84YnFKWThsT1hsdGk0dU1UTEtRR1pEd3lXWGhMVUNoYlVRY0g4?=
 =?utf-8?B?aVJsMUNYL1ZWVEttREF5RXMxYmhyaEVXZjhIQ0RsSTFNL00rYlB3dklMZkRG?=
 =?utf-8?B?aU0yUlVSc0ovTU5uellJWnVvdkptRFk0ZW5NK3hCOHRpZkZnd1NEdlp6T2lp?=
 =?utf-8?B?SFFaZVkxSnRPMXl1YWVSOExjSWxtZlFEUTFvRWZKZ2JuTFZ5R2NiYUdYOHd5?=
 =?utf-8?B?cFkxNyszTXg3L0grK24rYjd1SG1WWnRKVVdrQ3FFanNZbXdNTTdPTitCOW9a?=
 =?utf-8?B?RXBIVWNHQWFneGdIa1M4Y1QwWXIrYTkxZ09xakUxMFlUSHBNME9XR2ZFalVL?=
 =?utf-8?B?Q0R1cGxCd2w3Y0NON2FqR1N5emR4eW01RVBGdFZKYUVKSzExY0h0YmUyRW8z?=
 =?utf-8?B?UFVXbFRndHo2b1ZmRmk0T0U0N0tiVHpvazQ5bHRCeFlITTl5R1dTMXB6cmJ1?=
 =?utf-8?B?Y1F4b2R1eEY3NUEvRlZOdlZ0dkRpV2MveUdWbGZMdStwc3R1dWFqWmF1dlJW?=
 =?utf-8?B?OWNkdzNUaG9PV1V0WkwzY1JEeG9mR1pkYktocTF6ODlEMkZnNGtoNW9xQUZv?=
 =?utf-8?B?VlNPaDJwc3FzZ2kxVW9Wejg5Nmc1OS9HTDZBVzhkMXFVajZRbXFwR3VLZVM0?=
 =?utf-8?B?L3IxYUFXUGtiS2xNbkpDdmJLUkVTQTZpSG1wS1dYTkg5SjFRYlE1TnNlejBj?=
 =?utf-8?B?NDE1UW95YzIwaHArVmp0NFZ6S0RWZlpxc3FuR2dkdmRHVWZ5SFZFakdZSEl5?=
 =?utf-8?B?ekNiMnllYW1yVkVxZm1zcktobTR1NWR5MEM5QjhRamRIa3I1QWNHRndoUnpR?=
 =?utf-8?B?TjBmY3VNOUJzeUl1QlNzVHMvVkR1cmt0OWdHZkp0SkxNcXZZdEw4a3ZnaXpi?=
 =?utf-8?B?WlAyWDl5R09jQmhCbEQ4L1lRYXErUEVzdHdQVXhvWW1NbHE1dkYzQkJrcERj?=
 =?utf-8?B?dm5OUmZjZExaYVIrRlNnVWdVazdUei9naDdRSFV2RG4rOEFpVTkvZ3J2elFl?=
 =?utf-8?B?M05jSTVncEI1UkE5cEVxV3RoOGM3WC8xaEV3N3VCL2NXMGZ3K21sRUtmSllV?=
 =?utf-8?B?UExLR0hNd1RkR0F5cnYrQzdBZDB3ZmtTSmtMZkUwY2pzL25XV1hFdFZ6ekx1?=
 =?utf-8?B?aG1rejQ1MWZMTWNHMnJsNzZteU1uRE9TUFh1Y1YxV1h1WGtBb3FvOFJad2Vq?=
 =?utf-8?B?eVh0MC9ZYVhqY2lSeEZjNm04Zit2SjRIVmxTWjlOb2JLUXhBNHRSUGQxc2JS?=
 =?utf-8?B?dXEzU1kzOTRtbDRScmdsRUZEN3lxd2IwOXVEVWM5ckN1a011SXYyNDNUWG1h?=
 =?utf-8?B?d0srTkduelhEdTBIbkRpNFRESDFEa1VWdjdNYlVhaitoVS9KbE1XMGlFRXVM?=
 =?utf-8?B?Q1dRNnpzQXBKRDVNd3RLS3RQL21NZ3JKRHJtTGFSVHk0ZzhGTThSbGNkZ3k5?=
 =?utf-8?B?N09VUzFHa24zODNLSUNqenA4YUtjNXJrSE5hYVZIZXVmVUtGTFBPc0MxWjdM?=
 =?utf-8?B?ZmI3Y01kWnZ0Q1lrTnhnWmxqQnlpdFJZcHFvQktQRklVZlR1djRlSXlJaFJs?=
 =?utf-8?B?K2t5RHJTNDY2NkdXTkk3VDBydVkxcWc4YVBWSkdDUmZ6RjEzeGxMNEZ4Vmo5?=
 =?utf-8?B?QmN4eXk4ZFl1a25nTUdBTjdEc2hlL05yeHBRUmF6SzI4emdhVXBjbnROMTZC?=
 =?utf-8?B?VlRVM3hJNHY3Tm1FS2pPenpNeUVsS0hyb0ZabHY4RGFWbDg2elJQaEtNTTha?=
 =?utf-8?B?WDVacDBGMklyNXRkQ2s1N1NqZ29KN3hxNDA0dEtZWG02c3RjUDhMV2FEZVBI?=
 =?utf-8?Q?y7QgKK+0ZbFXkCQvRDR7f0BoW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mM1Dn/vGxQKQr4CaisG2F+2oS2zY2kq5j2mCqaGa9qyw1Syna6VfF4qYlwDbEGkTzT0hMA8j8SbkkjzgYjDBm4RcWdbl3TZj53ytGkbbAoSugzjH9uBz8E3mJfLiaD7hNIcwR476Yzcu2Z4bu0Y5umFPBivLuWFYpGNGGDvDJlOWJJSZq6988A4rei4Lpu1PSsMvaNrE2QEN4OcWQpI+81Jw1OlzV/e6SD5LuezXedx2ZR8Bn6bv9JgiSZ605k4ZccQNwSHpAfdGwnSW/smiW6WK/JggolnKI3NNXvhPjs6Vgk7aLX+0vMJuNRaFJ6Vko8jzOD7sDWMUYje4K3KN7Tia5z5yCnLEwW2MaW2Jf37KOwKQ8HP+nMEd4/rn0umH3MyLqHIQRg7KJNdhvnpJttVt78ihLSfgjrDlQAmOYWySDRqRuQNVvglNv4Xwz18skpxDTNnpbPiIVKKiM3HqONkgxJG4AqtwJ4wK+A53Y8/pOdrf84NKk/eCLkd9tIub1Ktj1Hbv5/smTW0QbryHaeLpZ21S/0V4QConPKeFqXRoR0CZvSIlU12eL+3dRx2/PWu67DxpRe+wRNhOcVDjmo/4qBQtYIBfclI7k/dJ50TShhApYtzyft4vN3mg4vM/tuIl/pKtbZPhySgiB6A+SXkCqXlRSSDLTlaG9O4ivqRxV9THFcim40zt3k2RsjUTMHg94rzQZZjYrL8OVF31+VIjiuStdBVogmUMWNGPo733vsMdbWWhd79fqIMhU7V7oqKQ97232jDbPEhOj78DWl+MlVA7CgZAY7jXSKeVI3RWQ886KKgdQasPtQlGl8QI
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcec3967-2c3b-4cb5-6e5f-08db876a47c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 08:37:54.3546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8LwDNQSU5lVTPpBT1X7s6vkVkRBNz53aN0DJ7mv8Hno5+oJ/3TQ59AR4NA2wzJh3StHYxGwdU1i/Ny++xBoPaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 08:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103939

RG8gSSBuZWVkIHRvIGNyZWF0ZSBhIHJ1bi1wdGVzdCB0byBjb25maXJtIHRoZSBwdGVzdD8gDQpP
ciBpcyB0aGVyZSBhbnkgb3RoZXIgd2F5IHRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0/DQoNCsKg
IC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERlcHQuSQ0KTmFuamluZyBG
dWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBOby4gNiBXZW56aHUg
Um9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUtODY2MzA1NjYtODU2OA0K
Q09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0
c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4g
U2VudDogU2F0dXJkYXksIEp1bHkgMTUsIDIwMjMgNjowNCBBTQ0KPiBUbzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXSBb
UEFUQ0hdIHd0bXBkYjogYWRkIG5ldyByZWNpcGUNCj4gDQo+IGZhaWxzIHRvIGJ1aWxkIHdpdGgg
cHRlc3RzDQo+IA0KPiB0ZXN0cy90c3QtZGxvcGVuLnAvdHN0LWRsb3Blbi5jLm86IGZpbGUgbm90
IHJlY29nbml6ZWQ6IGZpbGUgZm9ybWF0IG5vdCByZWNvZ25pemVkDQo+IA0KPiBzZWUgLSBodHRw
czovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzcxNjY1Ni8NCj4gDQo+
IE9uIFRodSwgSnVsIDEzLCAyMDIzIGF0IDY6MDHigK9QTSB3YW5nbXkgPHdhbmdteUBmdWppdHN1
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3Uu
Y29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlY2lwZXMtZXh0ZW5kZWQvd3RtcGRiL3d0bXBkYl8w
LjcuMS5iYiAgIHwgMzANCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNp
cGVzLWV4dGVuZGVkL3d0bXBkYi93dG1wZGJfMC43LjEuYmINCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvd3RtcGRiL3d0bXBkYl8wLjcuMS5iYg0KPiA+IGIv
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3d0bXBkYi93dG1wZGJfMC43LjEuYmINCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmMzYjk3YjA2MzANCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3d0bXBkYi93
dG1wZGJfMC43LjEuYmINCj4gPiBAQCAtMCwwICsxLDMwIEBADQo+ID4gK1NVTU1BUlkgPSAiWTIw
Mzggc2FmZSB2ZXJzaW9uIG9mIHd0bXAiDQo+ID4gK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS90aGt1a3VrL3d0bXBkYiINCj4gPiArREVTQ1JJUFRJT04gPSAibGFzdCByZXBvcnRzIHRo
ZSBsb2dpbiBhbmQgbG9nb3V0IHRpbWVzIG9mIHVzZXJzIGFuZCB3aGVuDQo+IHRoZSBtYWNoaW5l
IGdvdCByZWJvb3RlZC4iDQo+ID4gK0xJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIg0KPiA+ICtMSUNf
RklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT0wMjAwOTBhMDBiNjlkZDJhZjlh
YjgyZWIwMDAzZWEyYyINCj4gPiArU0VDVElPTiA9ICJsaWJzIg0KPiA+ICsNCj4gPiArU1JDUkVW
ID0gIjUwMmIxOWE0MWM3YTNiMWI1ZTcwOTY5YjE4MDg4NjgzODI1ZjcxZjgiDQo+ID4gKw0KPiA+
ICtTUkNfVVJJID0NCj4gImdpdDovL2dpdGh1Yi5jb20vdGhrdWt1ay93dG1wZGIuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIg0KPiA+ICsNCj4gPiArUyA9ICIke1dPUktESVJ9L2dpdCIN
Cj4gPiArDQo+ID4gK2luaGVyaXQgbWVzb24gcGtnY29uZmlnIHN5c3RlbWQNCj4gPiArDQo+ID4g
K0RFUEVORFMgKz0gIiAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3Bh
bScsICdsaWJwYW0nLCAnJywgZCl9DQo+IHNxbGl0ZTMgIg0KPiA+ICsNCj4gPiArU1lTVEVNRF9T
RVJWSUNFOiR7UE59ID0gInd0bXBkYi11cGRhdGUtYm9vdC5zZXJ2aWNlDQo+IHd0bXBkYi1yb3Rh
dGUuc2VydmljZSINCj4gPiArDQo+ID4gK0VYVFJBX09FTUVTT04gPSAiIC1EcGFtbGliZGlyPSR7
bGliZGlyfSINCj4gPiArDQo+ID4gK2RvX2luc3RhbGw6YXBwZW5kICgpIHsNCj4gPiArICAgICAg
IyBGaXggbWFrZWZpbGUgaGFyZGNvZGVkIHBhdGggYXNzdW1wdGlvbnMgZm9yIHN5c3RlbWQgKGFz
c3VtZXMNCj4gJHByZWZpeCkNCj4gPiArICAgICAgIyB3aXRob3V0IHVzcm1lcmdlIGRpc3RybyBm
ZWF0dXJlIGVuYWJsZWQNCj4gPiArICAgICAgaW5zdGFsbCAtZCBgZGlybmFtZSAke0R9JHtzeXN0
ZW1kX3VuaXRkaXJ9YA0KPiA+ICsgICAgICBtdiAke0R9JHtwcmVmaXh9L2xpYi9zeXN0ZW1kIGBk
aXJuYW1lICR7RH0ke3N5c3RlbWRfdW5pdGRpcn1gIH0NCj4gPiArDQo+ID4gK0ZJTEVTOiR7UE59
ICs9ICIgJHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfSAiDQo+ID4gK0ZJTEVTOiR7UE59ICs9ICIg
JHtsaWJkaXJ9ICINCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTAzODYwKToNCj4gPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8x
MDM4NjANCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMDAxMzI5NjUvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2
ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBb
cmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

