Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C06C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:09:18 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.40])
 by mx.groups.io with SMTP id smtpd.web10.6471.1690358949798963673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=j1LzN0Tk;
 spf=pass (domain: siemens.com, ip: 40.107.13.40, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhbpm4sNkZCN3qFf9ZBZGBNmTKjdSBUZAbpcoU/5vJJc6X5fkAuMw+V6L61adaNc75U05bgVFvm0f3w0VTI/Cki4NejbosnQRPCOnQWuFTB/HF3wWtZlJpCnGXDK930uQHRke7YZQ4LXBZdzsiBey9yFFKoNdPtlWQ2Nb9u5Wmgb6vk/KbZ/vX9B8P9L22MvH4ysI3LPoywmjmPuhBSjC2no0sEepNYs6KUAVeNSb1Z7gAsK750PP4I4szhFPLzo69f9SSVCmY+wDy/bYizqR6BkqG5RYQ9+xP8oIg6HQ4ikQO3+iHt7Lu5pA1AGEMrMIsYV1HwUlTDE4FWYDf858A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2sB2zvFdnQ7Jo9LmyBbDG+8HxmGKKhjhcUtg1D0GFw=;
 b=hwOmGoWYft1DlQiwlQcTrDsvjx3gSKQxrzq4o0BqNl8F0xnOaOu1/IsCjd+34WJEGTzuvrHWnnDqwvc3HQqiaNAlaKOwmXtTyHPLA7D78SvJ5QPwxNUxqW6OUItWOjivWHd8K4bQQg3r9ZDIqE/wiXw+2czKBbauvh08khdUMAopePFdXz2fzvEpizPEW2cnvsdomCgvxrsK5j5Z6NqX2rQGKkZlE82cnOE5uDVQt8gWsSBNfLtJE2cmwFenL6e91ayttvQaFYerpQPpOCJN+f9ZCoSvX/XTJjcGZ+Nm3JdcNZDK6v0b92hR8VSv8U3DHacTQs7gjl/kf6iaXnc+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2sB2zvFdnQ7Jo9LmyBbDG+8HxmGKKhjhcUtg1D0GFw=;
 b=j1LzN0TkX5RJU/Z/loHfYr81zfSr3eKFa7UVsYhHJKLYQLhY+TzVOYTe7bc7dDZR5nEYgt09GfBepZgnuetHp+pggR2TIli4mq6dROwBzt2XVWCNLGNMbxRGbcRQmS21uvm/931vWnO90xIDkbbwCPAItQGPvdL6Fg7o2vFcyN8P/brI0jCasqW4d4/zKKOiFb6wd5RS8lAXJXK/IjGuAbi4Ac1IuteWclTPMW0hbNG4Gpp6lLsMDrNFME3xVJerfbNVbZhua0ER5YBwltnrW3J5mF82bWWnoP9L+yyarkNvKj9l2yncN/jMkpaddZWI1eb1hyjL8PqKmYTIKn5dLg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PAVPR10MB7281.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 08:09:06 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b9e:6317:5a95:9edb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b9e:6317:5a95:9edb%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:09:06 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to
 CVE_STATUS
Thread-Topic: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to
 CVE_STATUS
Thread-Index: AQHZviMBksx6c2MNRUOdjk989bvkwq/LtJ4A
Date: Wed, 26 Jul 2023 08:09:06 +0000
Message-ID: <23f21fb658e12efe80dce29b82c1fa87cd60874d.camel@siemens.com>
References: <20230724113527.141274-1-andrej.valek@siemens.com>
In-Reply-To: <20230724113527.141274-1-andrej.valek@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|PAVPR10MB7281:EE_
x-ms-office365-filtering-correlation-id: 3fac722f-4165-440b-8606-08db8daf9539
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WLtvlwOt6rO7f3kCFQ7qGbU2AWoFOOiqeMNRl3KKjhrzgbn+jrmGVI+9JAjISAXAnOLrgJArP4rXiueIg+3RP+S3Ky6HA6YDv8TXkPemJVcQ6KVxgI6n2/hXAhdmk806P3JOXinqU8CAW6FFvTCBHpz30vUw0i+9Svd4yCooqU4iRc2O69uomnXDcWZJZHmy82XBvSA/gzq0KBmRpxD3v+icUl8+ha0iPKwW87TZ0tkyCB+hKo8KlmWZGm8RT+O0iflufhS5jIV+qUhQtg1la7QR1eBOjIn5cMI1MxXl9y8Ik3NRvdVuCv3ec6AVnc/k6ezQrNHkE3xN99sOUoEqdDput2jotJkoNHvVUOQ9WhGQW9hIZD5ZkwYmk++psbVnYhVTgXZosiCawEfHbMCUFKwZl88FJh0SYck9WnnnjjnkYXV0/n7tYgk6fLeuqLq4eFX8ZUqyZI1LT+C5PBCe1i1X5Msr0WAhlig2encmwovMH71SzVbmZ1c/eM/na9TUOwSKE0vGhEz2EkHJPpA7e4zUUagppczWANscOxOYLsFvknidoE1QS7AD0ZxgrnVpKQn9TKZlg9wv4pBH5gnurs547nasHoxe/Vrvvc0+C8I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(2906002)(316002)(8676002)(8936002)(5660300002)(38070700005)(4744005)(41300700001)(36756003)(86362001)(966005)(6512007)(26005)(6506007)(478600001)(71200400001)(6486002)(82960400001)(186003)(2616005)(64756008)(6916009)(66446008)(4326008)(66476007)(66556008)(38100700002)(76116006)(91956017)(122000001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UlIxWHNXaTNkQTFPZTRvYVM1dWEyS3ZJTUU5MVhCT2Z2RGo2Snpjdmw0Z3k2?=
 =?utf-8?B?QTJxWnk5UWFweE1DRTFmL1dqdFFmaHJkYWJ0M0F6ZXRHTDV3a0lkWGNKU0Zp?=
 =?utf-8?B?WGhpOWFDWGU1c21ueHZESHRXSDg1M1VRamlvQVJzUUVOeldMZWRQZmNiQTZH?=
 =?utf-8?B?a1kyYmJiUVJqSWlOZjl4TndWRkxZdFFlcGpnVWZYM0Yyakd4L29CZ3dFWDhW?=
 =?utf-8?B?ZS9RTUt3QTFQNGJsTkdYaTFmbEsyTWF6cGlHd2FzdnMvL3REY2RKZVIvNDBT?=
 =?utf-8?B?OUtDMzFOL2QrTFJuRWh1dGZKR1JGNklzeTIrMWx5UWtMdXZuNnlDMm16aU9U?=
 =?utf-8?B?RHg2cHJER3crdXRwN1RyK2tTTEJCbENrcnA2R2Q3QWpEcDVER1c0VW9GRC9V?=
 =?utf-8?B?VmQydUVZS2JIN21QK1p6ek5HSkxES2JaMEpldXJoalJJRlVtbEdwU2doZHJB?=
 =?utf-8?B?bE9ja1BkRzl3c3RYeEEyZEtkcldnTTJIOTdkZWtuT0ZkR0hNZTRSeThmMXRF?=
 =?utf-8?B?dVJpbTk5TXBSTGF1MlVkNDUwVTVFWjFveW5mTVFTVkdyZlNQUlBkSE01WSs5?=
 =?utf-8?B?OGhHVnhCZjhMTEJiTDFtZmNVQ2ZBK0xPNkJPQW1wQjZIVnJmVnFadmd0eCtM?=
 =?utf-8?B?MWlkTmE3QkxVb1dJa1o3SFF1V096OWlXbm5YVkZCUVh3bU5DSjhFYnlkM1FI?=
 =?utf-8?B?VXdaNGdMN2ZvUWtoOVJweUF3NjVMNlZrdmdOcEQ2WDJXQ0JKRFdoTWZZcFJ5?=
 =?utf-8?B?YS9nMXErcGdhMjRHd3piaGl2SnY3ajhNdE1IRDNYSHMyNi9aSDQydFRxWGFB?=
 =?utf-8?B?K1N6OUIrNFluQzZlRlUxQTZ0MVRkUW0yYmVjc04yU1I3aTdvSDBxOTFpY2Fr?=
 =?utf-8?B?ZGVFSldEd1RUSXkrQzBMSTl1d3dCSjhXeXFtc054dGxiZktzdStQcE0wU0Qx?=
 =?utf-8?B?WlZUa2VzUjBXQ29YVTE1MHhxRjQ5OXVRWkpVNW9kekRuUDhzanA4ZUVGbW1w?=
 =?utf-8?B?aDl5bEhub1NEOXdHQnV1cEQ4MjMvSnFmZWE4dE5pNnliQTFWNmZvRGFWcDIw?=
 =?utf-8?B?WGMvUVZMMlowY09ORDUwVStUVW1WbVZwVGh4R0FURjVxSUhRUlMrS05EaHV2?=
 =?utf-8?B?Uk1KbUJzNXE5SnZxR0ozdWM5Mi8rWTBTL1dTdjZSNnhKVW5tOFNuTEJML2xr?=
 =?utf-8?B?SmxpUzUzaW05NjBFV090SVFXNWpBTi9PTzFpWHhxZmF6ekpGajd2OGRJaEd0?=
 =?utf-8?B?QklvUjdUL0RLU3dZK0M0MXluYlVBNkZTVmZudkx6Z2RaRiszSFJFVXFlTStS?=
 =?utf-8?B?SkhhZnNPRFFXdnZUaWlUWWpKQzd0UEFGUFoxUTJuTzNhdDdGckowWVhkM3VP?=
 =?utf-8?B?SnB0cTNxaU1QTk1ia2VPa2tzMDRqWWZodktpbkNxK1cxTmhZTm1IaERwbU1R?=
 =?utf-8?B?T2ZkSEdDOENVcTRJYlJ2ZngwVStOdVJPemdXRFJGaUJTU2FTOVFuWEtsMGhp?=
 =?utf-8?B?TjZ1K1F2aDh3N1ZBeTVyUVhaM1FJSVlEaFJUSUdmSTFPeTZ4bzVWcGVWRnBy?=
 =?utf-8?B?RUZRNXVmN05LNlJwbGljVzRBS2J0UW9RbHQyWDBXYy9oS2EzbkwyRXJVMEhu?=
 =?utf-8?B?NUtkZFdxek91L2g0a2lHY1VxWGlIQysyUlhiejFkK1VmWENqT2RGR0xPNGU4?=
 =?utf-8?B?b1N6bkttaWxjV0N1YTIyS1VXVDZQZTJ4c2lWSFJQRFUvUVFnNDZnYVhNajYy?=
 =?utf-8?B?UkhyQ0pZUEpuaHlCZHBpUkJYOUtzL0paOFBlYjdJMHNKQ2g1L0RjYTRtRTVZ?=
 =?utf-8?B?RnRydDA5MW5VL3gxUCtFcDQ0UzhOdEdyQ043c3AwNnF4YURTZmtCTldNV1c0?=
 =?utf-8?B?TmxyMCtGZy81MDkydFRrQnF5WmlrWlhCM0w5ZGw1blR1ZjNDZEp6Q1pEd2k5?=
 =?utf-8?B?V0lqUVhGSnNSZ3pnc0sxUmZ4ZStabWcwTGJoekIxeE9MSkdoZ1hzbTB0WGZG?=
 =?utf-8?B?WjNvcFJQaEMxNW8zRXluczVGcE1Xajd4aytzTVgwK3o4RWRBUHRSckcyYVk3?=
 =?utf-8?B?cTBrSS9qSXhUSSs1K2dOeDN5a2RzaFIrcmwvMDJuNGV2WWgwYWpPQUk0cUJB?=
 =?utf-8?B?aGhqbndJZzBlYi9hY21LS1B5TVRzeWhQeXA3ZlB4ejd3dTduam5KWnlPV0Rt?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA56DF790D809747BE6B6266DBCC5D3F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fac722f-4165-440b-8606-08db8daf9539
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 08:09:06.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7atZhdw4LU5BsF/fwWNWTTbrjUyPw3vePf5VPHIw/xumcJ0FjjPRzsBVTgEQpgW5/3/eWoV+rUJyjWvsrCPb/SVrd/3zNl7ZBLrTBRXVBtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7281
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 08:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104030

SGVsbG8gUmFqLA0KDQpOb3Qgc3VyZSBpZiB5b3UgcmVhbGl6ZWQsIHRoYXQgSSBtYWRlIGEgaHVn
ZSAiY29udmVyc2lvbiIgZm9yIG1ldGEtb2UgYXMgc2FtZSBhcw0KaGVyZQ0KaHR0cHM6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC8/aWQ9YzE1ZTUwNmE0Njc0ZTU1ODkyMmM1YTc1
NTEyY2EyYjVjMjk2Y2Q0NA0KLg0KDQpDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBjYXJlIG9mIGl0
Pw0KDQpUaGFua3MsDQpBbmRyZWoNCg0KT24gTW9uLCAyMDIzLTA3LTI0IGF0IDEzOjM1ICswMjAw
LCBBbmRyZWogVmFsZWsgd3JvdGU6DQo+IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQoNCg==

