Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7695BFCC9B0
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:20:06 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13863.1773206404306447307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=dRkO2ofV;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.23, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHi9/z20bgInqy5KHzyC+cXjDAP/kBlAYtHLaDz1ZS53eJeHGqeIIpwf2Tdk2/6RzsOTdNZ2idLunGsPcIJEFsnsRkoz05WChuF6a9mVLOPYnIsevBPxyOVjrZq+xBG80rGi1gOWFBiuVfoHGO9QpT7OLx0Qrb4Jf2+NlyEaeYlEo7+uDbPtCW4WiIyzGpxMJHdR6lQXQSMrifoMRJ+STlNQUCbJfiIFguAbWiV6dwbSSW0gAdGSuYZL3lEFohGHrjSB0Dj6t2fpJLASgMTOgX/myQCC92JS2wkiJ0SCd877yceSo2MF4x62JNgHvd/yGLqG4Lboltkkpx3lY7cOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i7UYKZsy4H5N2IWtg/1TNBh4QBWt9NtYVH5AilJADk=;
 b=FJYPq9mOMR2xcxyIVqWMFcsvOYkLQ7iGXy6lmIs2tqvgEvqoxrHQGTdMmoT7QEaOlXql7U7nKDydRIQlVJMV8ugIY1kSIHmKC7jislZ3kQcuMSDHTk70EpuyKpSkwPIkR4WaIk6l4y2rLctuZJFAYLwBPttpuHuRaohmHl1HDox4TieocHyFOHc9ojAegs0+rDA5TRL8sd9DjgIbSnTys7l5ZhRAbTNgtZ4WgbPKNVqSbnnxthdgm6nVJg1u6yDYyDKLyhwDGZ6fftk3o/nW4tHNmG4BWc8SX6LFwIRROuv10mrJK8vM+GG5cvJUONqzS+pMeNV10GfkScP0ooKO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i7UYKZsy4H5N2IWtg/1TNBh4QBWt9NtYVH5AilJADk=;
 b=dRkO2ofVBmlAw6hJVijp9X7iPa38gZ+9f8t2Q2RXcUpNak/rBeVOustyR5bdLBR7t1Mso36cLjyoVO0z2+btfOQsLbv5ts+bsKPFptSMN4XMZ1+Mj4Mgu8k+j9TfuUWAI4H7GFN+dMyURrbw08xxARgQmOrDMUmaIHJ7plMKiF2hOS/yE4NyWaGun0ZzbLc+66GXH8oBnH3QAOKrdJeo69XbXKubs0GYJ7nzuTx0c3U5FHt6hEeBwhexjVwefThXBDV/sVSAn1JtMeqWmzuH/gsz9pacU5iOWxs1hU2yCJmyKnA+a2uVAqfXvsY7CRoEQC/TYcr39qJPAvQUD1x62g==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by TY4PR01MB17571.jpnprd01.prod.outlook.com (2603:1096:405:34a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 05:20:00 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 05:19:59 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-python][PATCH] python3-fastapi-cli: upgrade 0.0.20 ->
 0.0.24
Thread-Topic: [oe][meta-python][PATCH] python3-fastapi-cli: upgrade 0.0.20 ->
 0.0.24
Thread-Index: AQHcp8rGauO4uBrZbk+i+oeirnlWIbWo3cuY
Date: Wed, 11 Mar 2026 05:19:59 +0000
Message-ID: 
 <OS7PR01MB14444F32E377A4873BCE24D999B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
 <18981023E82CFDB8.1454197@lists.openembedded.org>
In-Reply-To: <18981023E82CFDB8.1454197@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-11T05:19:59.160Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|TY4PR01MB17571:EE_
x-ms-office365-filtering-correlation-id: 5711aedd-de14-45e8-f7f7-08de7f2dd788
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|22082099003|18002099003|56012099003|38070700021|13003099007|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 WdgxE3WUJJh0Jmq+Po6NiLI60hrj+pL6nueuuRyl0TeBmD7zTMssZ85YNgZgM1aNAvihqYCdvjRrTn53uJnib3TpDcnhtzIbbiQ2F/AxA9YxvPXsgdS+Iya+dYDBh+ymou1aoNrACOTi+SvXE8J1nNvuf7ZI6mZEZxh6V5a7Xgilf+r6IgmYIvvIIbBlYs+8EBHGWri8a8Liu3NGi1qvwiCsBzIPikoHQZUYXcnWDEh/X0YDqeMIf76ztgBlPszA2n2Ou7W1bBQxvKZwSe1XqQYoM5uN+ftJsP0W8DyvMLDlUs+cVRyi/J0XgxaSMoygE13A0aRb5+7zI4JxzWCpt1mM/wQTak+vtBaqUOb35S9hKAN1PTA2UX+YYU1O96+Mz+C7DuIfbrTaF0tfYrkgg4PddSBDkWbMOMYN9sL+HAn+w9VbOVd+GYNFBSG7BJ4y5qDsiPATNBSdoubV5hOHJnRe/b5fqY+tx1vUxd/q9EuGy3akk3X3flb1NKj5/IJTzZ2fCK6qvde9/bcAxh2J1TJhgDANNO8Zl0Cqhk/5UHDYo7P6YYrlGC7uAvgsluFB9HhYj157DnAeejTKfXRocoDbp6ZV53HGXiQpbpXfA7q3QGPOBB5SxN88KtTf8p/oQM9NCx1kbwawOjNL2rA3YXMR8b1Y4IlOa77XHu6zqcyYpLJdtWQx3XMTanIt9UuBw8sEOV68bRM8s5TBNvthJfB921i2yExx5g7omUEcVF0xERTlPxOmaCFNHmibUctP0fxVtULgoQcz2TNEytEovA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(22082099003)(18002099003)(56012099003)(38070700021)(13003099007)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?QTFEcjhBb2hBWkNuZnpETUVyaExSK2k1dXJUNDF1RDA3eHdWTDZpNVVqVlpV?=
 =?gb2312?B?VHo3ZFdZSjhlMzl2YWhBMWF6SkZMQklubWFSUHMwcEIrSWZkd1E2cGFDSDhv?=
 =?gb2312?B?OThFTk9CUTJnYlNRZHMwUW9YaUltbHpBOHVPK3BxZ1pjck9seTdETjFBdjFD?=
 =?gb2312?B?S01vcWxqdWJnU3RCS0dId1FYZ0N1cG9NbXhtLzVSNE9jczNJNkdNN3V6Mkdh?=
 =?gb2312?B?T0thYUpMVjV0UXdXRkh1QkxrQ29kbldvWXErOVNCSGVhK1BYMy95akpSN3g4?=
 =?gb2312?B?SEdyRjM0aHBVdll1V0VhL3hXdFhna045MUdOcGlJTXpMcHIxdTRjSXQ2MlZL?=
 =?gb2312?B?L3ZPay92RGN6U2tNd0FwVExpcnloVVpiRnI4aW12ZDFHY3AwdzN3R3RhWDRn?=
 =?gb2312?B?dFY0N0s5anhHM21JOUhLTXQ3OVRkY2pNUVFWVlNjNVZIeDhTZGxaY3RDZDg5?=
 =?gb2312?B?TWVXK3FGY29oQ3MxQzBtQnRQVWxqdElqL01BUWZHakFENHQvTkU1SEk0VFVl?=
 =?gb2312?B?a0IzTWQyUERsTCsrQjJ4WG1xYXFXQ1d2dHM0RldSMEdlV3V3dll6NFVkK1ZD?=
 =?gb2312?B?MTRHV0FvRGRncmFRRDhDSk5vYjF0ZmU2OEhlT0Q3K2IvWmR2Qk5EVmNVRzhV?=
 =?gb2312?B?UGUzbTc5N0VYdUVFN3NIZkNGQnRRRWVJMWp6MEZHYkI0eTV5UndLUjJCOHVJ?=
 =?gb2312?B?WXUrcitGU0p1aG5WS1phMkMvRlZlWDNkTG1iYzUrb1pTZUxyRUxuckJ6THc3?=
 =?gb2312?B?dGczc09wdHJwZ3E4Q25Bb0RlV29vcFMzTEdhU1puQ0hwb0ozN045MnhhUWFO?=
 =?gb2312?B?N01IcWd1cnhNM0h1Wm9zRDh3OGxMNjNEdzVVekdBcXQwcTBjM29MSXpmcmZn?=
 =?gb2312?B?S05BZjlNYW1SSmZjbjczT3AwRW9WbGFTVi9GSi9jSS90eWRINGdUaVJOcGc4?=
 =?gb2312?B?ZGRLdndqZnZ4dE1OMWNPZVZmWnZNYWZYWkdzdldYbHVyUVBrL0plcTA3cTlm?=
 =?gb2312?B?aUlCMVo3VVNiQmtjajRGeVdoSkZwU3FPYXg4Rm54UW9TalQ1TkwvN1h5cmVJ?=
 =?gb2312?B?UWdzVGR2aXZadG80UTdvNEdDZy91eXlIckdJaXY3WlB4b1ZyVW5HeHVOZGhT?=
 =?gb2312?B?Vi8wZ3FiZEdlaWc0Wnh4YktqMFVOQ0hhK0hSdmk4dURxYW85d211TEd4Q3hI?=
 =?gb2312?B?MWVoa1ZZNWNnY0RQdTNzamZoRkg3TzE0QVFDNDB2SW5UOVd2UmFFbktDQlNx?=
 =?gb2312?B?azgzQWREKy9UbHBrUDVHbDNkWllvdXpGR3Nqc1VSREQwTHUxWFZvQmF0Wk9O?=
 =?gb2312?B?b3hFT1ptK3VOU2VMMDExTHpKMWxuZHQyaElzMFp1Q2FHWVJaODh6Y3dHVVph?=
 =?gb2312?B?S1RLcnFjc2VydHdMUDJFMDNvN1ZPNVY5SEhFMXplcFd2aTR3VWwvQjVOYUty?=
 =?gb2312?B?SUowNzVBLzNaaUxxNW9zS0l0UEt1TmlMZkMzNU1GYWIrL09uSTB0MHN3a2hW?=
 =?gb2312?B?MHRDRnJSQnRXaldwL0tRNGNRVzd6NkZobEpLWUpoLzRzd3hPeTViTitOcjc1?=
 =?gb2312?B?eGNhSy80Y2FZTTlGMCtCeHBIREhhWEx4azFhWTJJVEhSOEtlUGQzTjJ6T2I4?=
 =?gb2312?B?Z0c3c3lpTU9ZUS84UTRjTGlLeGNPdFI0OXZOY3VRekFkVTdaSFJzSWJWTzBP?=
 =?gb2312?B?TlZBRld1UTVLNVVEMk9DeU9yTGtEdkpnWnp5QVJlZnh1TWJ6UDhOQk1vZUhO?=
 =?gb2312?B?ejMwUmt1MTlDWlJNeERFS1h2UmNUNDhKdXh1aS9tUkRWV040TFh5L0NYOTgy?=
 =?gb2312?B?d0szY00zZlFrcnJnOXo3bUU1c1NkS2dUT2hoYjJkMkNpaGNYc1h1NHd6SVF6?=
 =?gb2312?B?ZDZFNnRZZEt6K2p4ZEFQbUN0U2F5cUFoa3FOWmFmS2dCcno1THVvdUp5SUhL?=
 =?gb2312?B?SHIydjZpOXVyRXNMelEwQ0o0YVE4QmpnN1Z5QkhjRWNBN1cvKzFhSVVDa2NF?=
 =?gb2312?B?N2Uwdnh5ZXU5ZldyQU1may93dGNCNTQ0WWphZi9reFpJN0lJVG11a3dENFBs?=
 =?gb2312?B?L25TRDhDd29SdVRGdzlYOHhEdVYwZk8xK1l2YjYwaTFiOElpbzdvN0tkajdt?=
 =?gb2312?B?MTFRdm1rZ3cxeU1YUWhRVlowMGZxOXdmSDY2WlNlRGh3ekVUOGEvV05QSTFV?=
 =?gb2312?B?MTdYMkxRV2xOckNRMy91MjdyNlNJUkdwa2REclViUGs5U1V4NUVsMzBCTnlH?=
 =?gb2312?B?STRDeGFMTjI4ZHR1dlNGdXdnTzVBWTN2NHNtM3EwV24weEdFU3pqU0pOSmZD?=
 =?gb2312?B?WjFjTUhSZ1pyVUxXLzdMdGp6SDlYd1JzV3p2c2YrQmdSaGI1QUI1Zz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444F32E377A4873BCE24D999B47AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	k9C5gk1o4+H2XFlTlj224PS6Xm4DUoar5GsoLdozyKO2ualm4MSDr9B0HJh0bRf4Zj14CA2VBxCUjFijekBDm1XXMnlqy4FCTQDmKTg5/lkNqYpgzaLATrK5WxlFpJ5uXPzOoWQrAMuCVaGJx9V+0NHY5GLgb/1NdLIhqu9uKlDfr7jgD+z3FM31cYX/BpQHv/xzyih7TG4/BGxaeCG4U3Ue8zznnJWZxrfdmBLjBs6iXeVJmcJHzaCR04drd5IvchK/L4zO/YGSjCdokD40QBsHR/z26bxqSSt6/wMcGc/aPgKsicPK4+7P2YSUFATblVpxoQ7jMKtXKv5/y4EpGg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5711aedd-de14-45e8-f7f7-08de7f2dd788
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 05:19:59.9318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kyTfufP79VDC6opW3XEVva8oai50ncdXGBaJq2OGNmsCg1Ab+oJaNndMKWBjdBXzN3rQo9Q/4WrNoEBzbkz3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17571
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125061

--_000_OS7PR01MB14444F32E377A4873BCE24D999B47AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHtIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQq3osvNyrG85DogMjAyNsTqMtTCMjfI1SAxNzoyMw0KytW8/sjLOiBvcGVuZW1iZWRk
ZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBbb2VdW21ldGEtcHl0aG9uXVtQQVRDSF0gcHl0aG9u
My1mYXN0YXBpLWNsaTogdXBncmFkZSAwLjAuMjAgLT4gMC4wLjI0DQoNCkNoYW5nZWxvZw0KICBo
dHRwczovL2dpdGh1Yi5jb20vZmFzdGFwaS9mYXN0YXBpLWNsaS9yZWxlYXNlcy90YWcvMC4wLjI0
DQoNClNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQot
LS0NCiAuLi5ob24zLWZhc3RhcGktY2xpXzAuMC4yMC5iYiA9PiBweXRob24zLWZhc3RhcGktY2xp
XzAuMC4yNC5iYn0gfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQogcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLWZhc3RhcGktY2xpXzAuMC4yMC5iYiA9PiBweXRob24zLWZhc3RhcGktY2xpXzAuMC4y
NC5iYn0gKDgzJSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZmFzdGFwaS1jbGlfMC4wLjIwLmJiIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mYXN0YXBpLWNsaV8wLjAuMjQuYmINCnNpbWlsYXJp
dHkgaW5kZXggODMlDQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWZhc3RhcGktY2xpXzAuMC4yMC5iYg0KcmVuYW1lIHRvIG1ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFzdGFwaS1jbGlfMC4wLjI0LmJiDQpp
bmRleCA3NmRkYjQwOWJjLi45MDYyNGI4NmE1IDEwMDY0NA0KLS0tIGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mYXN0YXBpLWNsaV8wLjAuMjAuYmINCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFzdGFwaS1jbGlf
MC4wLjI0LmJiDQpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9mYXN0YXBpLnRp
YW5nb2xvLmNvbS8iDQogTElDRU5TRSA9ICJNSVQiDQogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9ZTBjZjhkODExZWEyMDQ2NTI5NDAzNzA3YjI2NmZiNWEiDQoNCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDE3YzI2MzRmN2I5NmI2YjU2MGJjMTZiMDAzNWVkMDQ3ZDUyM2M5
MTIwMTEzOTVmNDlmMDBhNDIxNjkyYmMzYSINCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWFmYzlj
OWUyMWQ3ZWJjOGEzY2E1ZTMxNzkwY2Q4ZDgzNzc0MmJlN2U0ZjhiOTIzNmU5OWNiMzQ1MWYwZGUw
MCINCg0KIGluaGVyaXQgcHlwaSBweXRob25fcGRtDQoNCi0tDQoyLjQzLjANCg0K

--_000_OS7PR01MB14444F32E377A4873BCE24D999B47AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedde=
d.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C227=C8=D5 17:23<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-devel@lists.openembedded.org &lt;op=
enembedded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [oe][meta-python][PATCH] python3-fastapi-cli: upgrade =
0.0.20 -&gt; 0.0.24</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Changelog<br>
&nbsp; <a href=3D"https://github.com/fastapi/fastapi-cli/releases/tag/0.0.2=
4">https://github.com/fastapi/fastapi-cli/releases/tag/0.0.24</a><br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;...hon3-fastapi-cli_0.0.20.bb =3D&gt; python3-fastapi-cli_0.0.24.bb} =
| 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.2=
0.bb =3D&gt; python3-fastapi-cli_0.0.24.bb} (83%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20=
.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb<br>
similarity index 83%<br>
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.=
bb<br>
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb=
<br>
index 76ddb409bc..90624b86a5 100644<br>
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb<br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://fastapi.tiangolo.com/=
">https://fastapi.tiangolo.com/</a>&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3De0cf8d811e=
a2046529403707b266fb5a">file://LICENSE;md5=3De0cf8d811ea2046529403707b266fb=
5a</a>&quot;<br>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;d17c2634f7b96b6b560bc16b0035ed047d523c9120113=
95f49f00a421692bc3a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1afc9c9e21d7ebc8a3ca5e31790cd8d837742be7e4f8b=
9236e99cb3451f0de00&quot;<br>
&nbsp;<br>
&nbsp;inherit pypi python_pdm<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB14444F32E377A4873BCE24D999B47AOS7PR01MB14444jp_--

