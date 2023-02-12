Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D127AC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 18:03:36 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.65])
 by mx.groups.io with SMTP id smtpd.web11.16405.1676225005049128604
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 10:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=eO6pDEkY;
 spf=pass (domain: advantech.cz, ip: 40.107.117.65, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM1xcLi+o9n17yLZOH2xyOMFMQaRhhWhyQzjwg3jIA9mrMDaQo16uVap8vsZojlkR9/QMmNruJU+SqrybQxoBiHR9nD1fg9/gORcXbUmtO9QaGFCb5NpAMfkUt5eLoMLv5bDa1ubLRQ0otLi2bHA6Li5bI3+gaSEb1X02rQ/d83AJASB3e9Hvjz/R35XaPbHqehNHvLDPkVBEzRrt6g5JttMAtYbY0cYuJQJ1tUkXJQVOQ2lQedty8Sfe2BqD5+6EBxExpzCO8WvxdRmRqEPWq75DwXdg+K80FT/qGmIKjj7uYaCDoGwPKHfNCuTdGdvnBLTr8hwmQ0hXPBz+LwqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dTeQOHWIjOIPTtDTtgfScLU+aWsh2uvUQ8SAcE1hmo=;
 b=kwVGRLO3g0a6zCWNL2aXX2O10LLfZge4Ad8q5YcYjx6P5Xc/Ydv9aapvuB9ICnku/+Oy9NWDZh5d4vrhMJRjdFaGtKHRJbhbw42u3pko8NDfQkPBTndCkT2r3y1tVEMmpw8KVzNwnKVux/febAwRiJEiFI6YegxzTCx7Mf9njjfsKuFDkNWh5q1hyk3Fye+uS0CBDwvqu7Aw4EoFY/LEw1Lhf9jXD/G+z25zfxPRrIq71dSxoVgwvF9fBco8fUvWXNilheVR7wnbb65n63Y9fmyKGEYAAvcwvzmFuh89QnyqarkKF9IBzi+nd2YLVjFp7sCQ7VpJV1SPcH0TpKqmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dTeQOHWIjOIPTtDTtgfScLU+aWsh2uvUQ8SAcE1hmo=;
 b=eO6pDEkYIwVWFu7H7q2eFLT81PYcA06lrkxUSDZm+TFBG7ZIDUWNanTntHQJinQtmwALX2qbjQYlhL6dOZ2PUkiSGmDkT/IyKX5Sa1dry/E4Tuj8Z3vo0YOCttDOJxTAE4bHCM80eBrdL1p0ZvivLIEdmwc2wgpwcRld442Ki0M5an6+2E2cJr+VPVbx7bSrPdF3uQQrepJe3Lir2le/OCVNphC6ipHnKsq8AHBpXha1ucSPMfhFa49AaEVTUTmac/K8UYxfBCW/xus67lkuyKOf0u3vkOZCc5NyoqcZJ3xjtRyghOlUsQVqz26gT+d1lO8IiepR6kSBfvzZmDm/+w==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SG2PR02MB5673.apcprd02.prod.outlook.com (2603:1096:4:1cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 18:03:18 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 18:03:18 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 0/3] modemmanager: upgrade to the new stable branch
 1.20.x
Thread-Topic: [meta-oe][PATCH 0/3] modemmanager: upgrade to the new stable
 branch 1.20.x
Thread-Index: Adk/CLLXqcydDp91RxC0H2+htNN7GA==
Date: Sun, 12 Feb 2023 18:03:17 +0000
Message-ID: 
 <TY2PR02MB36782F9EBE6DBFDF3854F4D981DC9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SG2PR02MB5673:EE_
x-ms-office365-filtering-correlation-id: e9ef98c5-c3ec-44b5-a21a-08db0d236b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JURz0NnxNjhIMFI/OhIo5lZxEy1hJ8IpR4XEiILxyh4Zy+EmunIWtNHRRgj1flXIsxSY2IwIJxbd0BcPIENIrjMowMOcsw4aTqZVe1BlhOqkPvjkD+e7teSlkkMlHIqCpkAb0iv/eok21QqkpJ7M5/3yGEJsYktIoKGSOUTDd0L5pZR1btsP90og/dYYd+zpaFsTQHeGxsZk4z2ldBltklRnaZGH0xHAv/2aZtTHs9c1N9cZnkxPUZvmwf9LochwVAWHdirTEPEOLhQuK1O/snRXlli/Ubv3ZHYvTlr9W8G2NL/X3IDqbj1bYjUM7rf9XLdTgBswJJn8NGBOODFAndkjRHoR1nCRxhPcovlPwyy/UagGks+ljDvM9+Wq1aU0fP2ka5QlhjIZHD7Nke2Y+wHC9o7fEPIwno0zIzH/djVAaD6zdTobsS2kHLa+ofDTCFn1At2lARvfriwor7EVsBwSgGD7ERoqL+CXOSAHyL1aiay/l2Ad/+D0eaZom7M8kg7yxlDiu4EN3WEVqcHmZ9HCxaHuK5G/O2h78w+TqX28TB9kxrFePz+de/T4ZR2jC41pUkIFiJejdI4u9oiW4CqZXCh9fk4jsgGWX3gfLkbXLTnPFL8FsWFpFWOtAoi88Sqqd1DMxvNft2w9Xnr5xQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(451199018)(41300700001)(66446008)(52536014)(66946007)(66556008)(64756008)(44832011)(8676002)(5660300002)(66476007)(6916009)(316002)(8936002)(76116006)(2906002)(71200400001)(7696005)(478600001)(966005)(186003)(6506007)(26005)(9686003)(33656002)(55016003)(83380400001)(122000001)(38100700002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VHdqZUk4dlIveDVXbkRGQ1VXcExSSmREN0NoUjlPRGlCWng3dndScDJTLzBQ?=
 =?utf-8?B?WHM0VHRueGFWTUlhR2JqbDc2VUg5ckVNT1Jpazd1OUZidlJPbnhSZy8yak1o?=
 =?utf-8?B?SCtzdFpwTmlQdktyZmRJazgzNGxUWUJ5ZlQwWElHWDluaXpBbXBpZTZBelVs?=
 =?utf-8?B?QjRaa254R0ozY2pvb3dTZVlhRzBrNmZYNUpFRWVVdGljbWhJaEE5NENFKy9l?=
 =?utf-8?B?SS9yeUlLMUJUeUtRM0VBYjNTL0dnRkRIdncyaW9PZTR6LzUxQmNabDZ0K2hs?=
 =?utf-8?B?cFBOaUx2UFhLc3FFaFBLS0V5bE9CT09WZFFXaGkrUDNGM0hGckp4RmNxekFT?=
 =?utf-8?B?U3hzSTdEcG9RWFNRS0YyT2VpRWpOZkt2blphT1FMV3VneGIwcXg0SHJtUXcx?=
 =?utf-8?B?Sy8wZGJjSUhLVUNtMGtRcDQ0V01TSkU3MlQvL2lKZjlOdzRmR01NU3o2a3dB?=
 =?utf-8?B?OWt4K0trbnE2UFVJOFYvVnBzOXZ4V29YdWNOdFFvcFNxVnY0ai9aM0J5SjF4?=
 =?utf-8?B?cHdXRmhuWHFxUWdobU5mRkp6S3dYc2wrV0x4MnNWVzcrSVpUYm90T05sM0w0?=
 =?utf-8?B?MHkyT01mc2Z4OTdWT1NuM0lOL3NRRTVlTDRYaEQ5WWEzSnhOY2JHZE1nZjFD?=
 =?utf-8?B?S0dmR3QxUGliTE5uQnJLamovcHJjSGM3VnlTZlN3alc4VHp5V0MvQzNmazZ6?=
 =?utf-8?B?WitZb0wxRUhqdUUzN09HMXgzc09zNmlaSlhSSExSWW9vSzlBOVIvMnc2YU9L?=
 =?utf-8?B?cGl5WGtXNzAvcVMzRnNvVytsdXdweFd1d3RSV2pZZjZZYi9QZndJOWx5MlZH?=
 =?utf-8?B?TjBEWTJPbkVMS28vdUMxbXJ5U3Jhc3Mzclp2bUNQK0lKNzNZUUtrREl0bTBL?=
 =?utf-8?B?aHJhWGpEVGR2eVE1YXBWQ2J6d2FyNXkyMGtMa2xQS0tYTTBjcm1hTmlvUVVp?=
 =?utf-8?B?bkJDcWh6OEJiemh4djliUndZazFXNktySzFlczJsYjh3TlhmQXBFaGRWKysw?=
 =?utf-8?B?VS9NM1p1VkVMdFlCSXh0bER6eXFtWkE1bXRqS1Y4NjYxUUQvZlJ3U0ZBY3Jn?=
 =?utf-8?B?OHpabHZXcndzY05PcXRHQTEvZ1V1bjBYci9LR3B0ZjNzWUxmSXprVXJ1SFYz?=
 =?utf-8?B?ejBpOTNYLzlGM2p6cFFGL2tXVGJNS0YrRm5tcEtjRWdOcmpTK2NYaW5vYWV1?=
 =?utf-8?B?S1BMRTk2aUtLdU5GK1pPTXlCaGptRXdrdUkwNzNWZXN1aFFBTlp0UUdkUHVu?=
 =?utf-8?B?aHd5UFN6UDFJR0g1dFBlZkl4NncycDBzc1VvVzZZY0xuMlUrYWs0Rk42S3pr?=
 =?utf-8?B?aUNaVEl0VVp3VW5ydHE0MkhOUU9oVVdSSFF4cndCMmVBaGlQaC84S3g4aFhu?=
 =?utf-8?B?eDhCK1c3WmVFM05FV2NSa2FWVHgxVjJET1M5bFFjV1pDMkx3RzJRb3RabHF6?=
 =?utf-8?B?Rmo2RE9vbVJZL3I4N3JJOWZYa3JQSDY0NU5vQTV6TEFybURPUTFUNHdVU1U1?=
 =?utf-8?B?MEM4OUFHa28wQW51WVd4SlkvMEJoejRibE10SDJLeHFTaFpPYllOZmJVcVFY?=
 =?utf-8?B?eUg3bExrK1lWWnRONUhMRDBFYmRKd3ZOTDZsUUNhWEVibll3bXJkUG9jSDdh?=
 =?utf-8?B?Vk1JTTRPc2V2WW1mcDJja3E3K01CWUVSeC8wbmNhL2ZRY0VKc2ZHakd0bUta?=
 =?utf-8?B?Q0Q2T0RHeTFoYjlFVFFKNDBMakJBZzRWeHBMeEN5ajRrSDVoVUlCaXpsMHQ5?=
 =?utf-8?B?V0NBQkVIRnhxa3pvZmhDcHRXY2s2ZWZqdWRySGJNWm16ZHhjOXZCamNRT0FT?=
 =?utf-8?B?T0JZUkh6MWZZclZWQVBJRCs4djIyUFBtSFpWSk1Pc0d2VkJ1VGIrRzlTZkUy?=
 =?utf-8?B?ekhramNiUS9scmtKWm5VL3I5UW9TZFJsVVBKbUgyYjloWVJ4Zkx0YkNZQzdL?=
 =?utf-8?B?eHltVmhoamVkR0NUSUo0L2NOTWZ2dmVUajhtT3hLckliZU5xOFgzamVzWER4?=
 =?utf-8?B?OGtWVno0eVBXMXREM3ZVci9uc0c1S2lTb1VQTkNzRUVUNGd2ZkFCZHZDbWZ1?=
 =?utf-8?B?RWg3ZmIvME50Q0d0bGJHOTVKWTVhYUtCS3pyZThkY1hiM3lhVi8yS054KzRW?=
 =?utf-8?B?dEdEN3J2UllBWTJhWldQZVlZaG83TzBtY21Ocm05dXlXc0dLQlJxeUpVU0x5?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ef98c5-c3ec-44b5-a21a-08db0d236b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 18:03:17.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4ul34LENMD9w2c6LH55Bt9YRAO3P1mCojLGoWkeAFdrkAoWO6r6ScsLGUNZ8kWSFHidWdhJi0ZH0JqvKe8ukKvFM/rU5y8H1nsJxJsyEms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5673
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 18:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101056

VXBncmFkZSB0aGUgQ2VsbHVsYXIgbW9kZW0gY29udHJvbCBhbmQgY29ubmVjdGl2aXR5IHRvb2xz
IFsxXSB0byB0aGUNCm5leHQgbWFqb3IgdmVyc2lvbi4gSW4gZ2VuZXJhbDoNCiAtIFRoaXMgdmVy
c2lvbiByZXF1aXJlcyBsaWJtYmltID49IDEuMjguMCBhbmQgbGlicW1pID49IDEuMzIuMC4NCiAt
IFRoZXJlIGlzIG5vIGxvbmdlciBhbiB1cHN0cmVhbS1wcm92aWRlZCBzb3VyY2UgdGFyYmFsbCBh
bmQgdGhlDQogICBnaXQgdGFnIHNob3VsZCBiZSB1c2VkIGluc3RlYWQuDQogLSBUaGUgR05VIGF1
dG90b29scyBzdXBwb3J0IGhhcyBiZWVuIGZ1bGx5IHJlbW92ZWQgYW5kIHRoZSBtZXNvbg0KICAg
YnVpbGQgc3lzdGVtIHNob3VsZCBiZSB1c2VkIGluc3RlYWQuDQoNClsxXTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJhbmQNCg0KUGV0ciBHb3R0aGFyZCAoMyk6
DQogIGxpYnFtaTogdXBncmFkZSAxLjMwLjggLT4gMS4zMi4yDQogIGxpYm1iaW06IHVwZ3JhZGUg
MS4yNi40IC0+IDEuMjguMg0KICBtb2RlbW1hbmFnZXI6IHVwZ3JhZGUgMS4xOC4xMiAtPiAxLjIw
LjQNCg0KIC4uLi9saWJtYmltL2xpYm1iaW1fMS4yNi40LmJiICAgICAgICAgICAgICAgICB8IDE1
IC0tLS0NCiAuLi4vbGlibWJpbS9saWJtYmltXzEuMjguMi5iYiAgICAgICAgICAgICAgICAgfCAy
MiArKysrKysNCiAuLi4vMDAwMS1idWlsZC11c2UtcHl0aG9uMy1ldmVyeXdoZXJlLnBhdGNoICAg
fCAzMyAtLS0tLS0tLS0NCiAuLi4ve2xpYnFtaV8xLjMwLjguYmIgPT4gbGlicW1pXzEuMzIuMi5i
Yn0gICAgfCAgOCArLS0NCiAuLi4tc2hlbGwtc2NyaXB0cy10by11c2UtYmluLXNoLWZvci11c2Uu
cGF0Y2ggfCA3MCAtLS0tLS0tLS0tLS0tLS0tLS0tDQogLi4uYWdlcl8xLjE4LjEyLmJiID0+IG1v
ZGVtbWFuYWdlcl8xLjIwLjQuYmJ9IHwgIDkgKy0tDQogNiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAxMzEgZGVsZXRpb25zKC0pDQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMjYuNC5iYg0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8x
LjI4LjIuYmINCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9saWJxbWkvZmlsZXMvMDAwMS1idWlsZC11c2UtcHl0aG9uMy1ldmVyeXdoZXJlLnBhdGNoDQog
cmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicW1pL3tsaWJxbWlfMS4zMC44
LmJiID0+IGxpYnFtaV8xLjMyLjIuYmJ9ICg3NyUpDQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEt
b2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2VyL2ZpbGVzLzAwMDEtY29yZS1zd2l0
Y2gtYmFzaC1zaGVsbC1zY3JpcHRzLXRvLXVzZS1iaW4tc2gtZm9yLXVzZS5wYXRjaA0KIHJlbmFt
ZSBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci97bW9kZW1tYW5hZ2Vy
XzEuMTguMTIuYmIgPT4gbW9kZW1tYW5hZ2VyXzEuMjAuNC5iYn0gKDg3JSkNCg0KLS0gDQoyLjM0
LjENCg0K

