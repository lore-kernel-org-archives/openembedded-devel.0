Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119A1106F30D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:11:21 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43954.1774516280321733035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 02:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=Mp7FSwfB;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.21, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZncCG72qcnlHnVSBsao/9/o5IYQf9L+MRKrzIl7Fkz9PaQkmtseRdDoghDFQHsQD46Kv6B3MLgdQtDL85D7UYWDfJ8PAHbrePQras1Uo43d71GRgQf39suIkd5NHoRXW+0jgwuVVskag13ItQ/mtayOhxzCIvHJOBg0N0Yurjym40rzN64J54aIo+EhglypwAync8jWj1vggdvzPkZvYScgMavtRqI95QCsdbxpTKPAgfqZWqTC7z/EzLavOWPy/9k0rcvNrVLvaYbU2W8skS5zypugDhoU1Fo5Zii/9Bp/axSjJ7Pk7c8/0YA9shjBv3ttifiaK+2iygzs+qbR1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMK8kin4T198HkrGlJEJjDliFef59eTnA9wYjV1aNF0=;
 b=E92NswoadBxfu4L2H53itm7AflzOj6KVOR+g/3COTRXknsImC9MggqTMXNszx9S0fMUP+c/8ZzY1ooP3g3075qjcMoHQvkwujwqAB5uNxGAtqBcVWQGV2vIuCoh12MvLEtEmnEnMjhu49FYOPgyZuKx+aw33/v4EHKeJkFzsicsH1UOzlUd6oeWYF6SCMewS7r/hdcQdU89skjwYWnRN6giOi/z/NNUseicng329oEkGgaS9m3vMCLTihvaxLiIZS0X5fyZQzpUIQGw55XLmfNE97zR1QUW7Ic3vX2cq6Nd+iye+UaJCLCus/K3FUFWtNHxXOnYDmH17C6tYxVMN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMK8kin4T198HkrGlJEJjDliFef59eTnA9wYjV1aNF0=;
 b=Mp7FSwfB3e1zqgr/xDTZNCfYTxkOEeYHacOAPXGY67/DQnNqQ5QHR+p+ywEAJGqliH7rOTQcneAqN1VwknrhnZ0Ycw2ru/o+eZH61NVoTvRNP5pAxtkA3ANqYqDMC4kt7zJBBnT+Lg2C+g+PNuqgSF/TNbpXY9I8LaEyQEbQDAiuWVxZEq3u9Rn3IaT2+mOd2NGvv3QdDQDP6LhU+IKgGf6ii5Ql+XeBbH2IfktFipI+Q4M7XRB2thVu5yV0e40bHoDsFGImPFggLFqC4JgmrFLLU9ODIWG6QL8MhnU76tFXIeLU9akf4CqBG5nUif4NWyLHqW3i2NyOaoOX3dEmzA==
Received: from TYCPR01MB7122.jpnprd01.prod.outlook.com (2603:1096:400:c1::5)
 by TY4PR01MB15806.jpnprd01.prod.outlook.com (2603:1096:405:2bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:11:16 +0000
Received: from TYCPR01MB7122.jpnprd01.prod.outlook.com
 ([fe80::18db:d416:9511:f396]) by TYCPR01MB7122.jpnprd01.prod.outlook.com
 ([fe80::18db:d416:9511:f396%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 09:11:16 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Ruoqin Zheng (Fujitsu)"
	<zhengrq.fnst@fujitsu.com>
Subject: Re: [oe][meta-oe][PATCH] openct: Fix openct.service waring
Thread-Topic: [oe][meta-oe][PATCH] openct: Fix openct.service waring
Thread-Index: AQHcvQA0W/vTBHo/d0qNl5Ljq2jJmLXAhnv5
Date: Thu, 26 Mar 2026 09:11:16 +0000
Message-ID: 
 <TYCPR01MB712255E96E3585DA6FFF8AE18B56A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
References: <18A059078217E40E.57592@lists.openembedded.org>
In-Reply-To: <18A059078217E40E.57592@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-26T09:11:15.857Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB7122:EE_|TY4PR01MB15806:EE_
x-ms-office365-filtering-correlation-id: 6389316b-f0bc-44be-5b68-08de8b17a2d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|1580799027|13003099007|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 OzrI4/nRMD12NFA8wPRdpZ3l9gDJjW0X/to7DyrEd4q3FQZQzekFgP91X0d4doJ6UCEgkNX2urnGr9Yxta8EMXLcfuHIAPlx7YLO7J6OgKm+MKQ4W5eVHjNl6UviPSfTxQ3vzdQtbsu7hNb3EDG3F7m26tNS668mLbcLkLcckUEGxmouZqfBx8m30xdqrccSI/MTxQhgWUa1l5BkC77Nh9hV/Q946pzB2yMkedQLOMkctCsNtRvpWGiLGf79n+VNMafRvtadbhhz6VTSwPhWekZ2orp/LgHZs4OLBWBuVehDOWCC81v9n6+t/+ceZYqMUW1VXjQU/AHa8ssSCbaaTZkunIeM5IQXJXrJ8krTRr1XGBz8BCUoB2Kys+tRD9kZYdGDEnB7SoEIxYuUwPyhSV0DZMuNPjpd+p5dNhtkDuAe3JcgSp0XDUYAwqtfXejyuDgzCDJKdGPhBzziWdBXhuw7KYiTLOXkYYPcwD3oX8Jg3YQAqfg/XdHcVY7uHtSdDDpbu5r22GAi9VJ7t4Qk1Em/PxtK1KcjTw7NYrbPAFkCkScw3wUCcx4Us4WhC4kyxQq+ynbArFy5KpeqACnc+Y8VdxkzJ6sOsdB8bVF9NcvXlYzXq88do4hMainvcJ1Y3D3zOcMES2uNeeM/s0Xv8skBEJByrBWCsJD5wDNeYcW/lT33/luWoFEIXVCwGbHGWDsCdS/pbkcY0MPubMTLM9bwG1iBL8LvIc7fowWB+13OrlLNAYObPG0H0yNMIqTTt5k8J+/juiBUw5H+rNJXKpzEg5cjZR1MPee2taZhTn0rhOVAHZ+eyU453++qLTGW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB7122.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(1580799027)(13003099007)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RmN4cTVBbkpTL29oY3E4YWloWHlIUDF2QVcreXd0V3U5bVNxSlpUaFNBS1dN?=
 =?gb2312?B?NVQ4cVEvK3g3VHMwRzNBazNzWitWV0c0YXFXa1RYVlJDZjJPczJabTQwTDRP?=
 =?gb2312?B?RU5vRVBDaSt5eDFiQmJnRi9hWGJ1Z0dPd3lqR3pCNDR2RXNoazRLQU9SNHFs?=
 =?gb2312?B?RTU3REthUGFJZ1MrSnFFZ2N3QldBajZVWFl1MVgzUkdZZWNQQ3pOdzROdUNO?=
 =?gb2312?B?cURiZkRRcjBCRVhwM1RRWHcraldLLzV2OWVVOVd5aHc1dzZMNXZhQk95YUxt?=
 =?gb2312?B?OEoyT0c3b1FwQ21UemdYeDFRNmF6d1A5MDlSMmtCNmFGTkwxVFFpdEw1QkZF?=
 =?gb2312?B?K1E3QjRMRjRPRXNtRjBURUs2UGlKNkdkaWEyNERBN3dOSzAzTzhnSkg2dHY1?=
 =?gb2312?B?MWlzYURJUkh5bzczWTVzd1JTR1hBd1IwUDNha00zdEhUaXFSQk04ekVOajdz?=
 =?gb2312?B?N0l3TUYrOHpxQWtkVzUwTUJCMHpHTlIxUTFqY0o0QnVCOUF5ZzV6VHY1QStp?=
 =?gb2312?B?dEV1WWtCalA3Z1BoS0RuMXQ3UFlKc2NONlFlbnZHUjZJbzRQdEhJeVRxVUNL?=
 =?gb2312?B?Y01LM3p1ZEZxVmRVVmRxV3Q3VmdNdlNkZDZUTW15N2lrNzFRWHcvOG1INkRC?=
 =?gb2312?B?YVp5UWd2bzhqdjVXdFRCUFJYdmhPdWFIZGw4bFFwdUZPSjhvVmVrT05DaEp4?=
 =?gb2312?B?bS91NER2Tk9DWmR1K3oxRDVmME92U2pacUpIWnRzcmlkeDU0S2J4MnNUN2h0?=
 =?gb2312?B?ZnBjKzRCYStFT240T3MwNi84aXhDMmhLQ0p3UmpucHo0MjFtakx3aEttZkZ5?=
 =?gb2312?B?anBPSmlmK2RNc2ZVclBSVlBGRUhteGR4a01yNzJvUE5aOU5aL2MrOTZ0NE1l?=
 =?gb2312?B?RmQyYjdudVhnNHhwZGhTNnVETXF3ZVVrMkkvMGliZlV3UVNhdysvMXVRa1ZI?=
 =?gb2312?B?YVQxQlNTblFtczBZQVFJNjdYSkpBSlFkamRRYW9KRzM3M2ZKbm1kQUwvN1hR?=
 =?gb2312?B?TEFoekhacVZtdk8zZ3ZXOXlSTXV3T3RxOGNPcEhGQVJNSld3QVg2WXczWkRo?=
 =?gb2312?B?OXMwUUFBSDJKbFhKM0R3a1NUK0pZemhZcWloUzE2YU16SFNnelVvYzVoMTRu?=
 =?gb2312?B?cUlpZGdqM1RkazlOOHYrV3IyOElFOW0xbEltT3h1c1Z1eDZJaHRBQTFJRUdL?=
 =?gb2312?B?QzJPY0RTWDZBek41Ly8vTlFJZll3ajA2aWVQWE1VK1BFaEZyNHF1Mll1aVZx?=
 =?gb2312?B?S3d5cWFQUkJoaEdtVStWVUJCUHQvWFFPNWhWelp0ZFJtVnEzN0Vkc0lWRE5h?=
 =?gb2312?B?bGM2c0tjeE81d2h3TVd4OU1ndnRXNTRxTmhjVmo2bnlJNklxdG1aMGRvL2Vu?=
 =?gb2312?B?aE9Ta01wRnRzWmM1Sk1IRlg5YXA2N3NPOXdtbmRIYjNEYlM2bENLWmhCSmdv?=
 =?gb2312?B?NlNHdTVRMGJIcjVZMWliZzI0Qkg0Y1ZQZmRwL2w0ZG8va1YwNkxHbHlsME41?=
 =?gb2312?B?Mi9kODFLOWpsM2pRYlNKVnNzVUZSYmhiZXhPOXN3cDc4ZXAvZ3lSN2oyenUw?=
 =?gb2312?B?NVVUQWVDQ0F5b0RPcUVOT2lQNWtIb25mdmJxNU5rY3dWUFhweUtJdzZNZlVt?=
 =?gb2312?B?UkZiMGFlYW9ZQm41QVZ4cW9DMDFCT0EwT3pFa0FaMG5seFpDT1dqOUkwakNW?=
 =?gb2312?B?dWNPRzYxSjR0NzdFMXFHS3RrQ3pkRWkxRG1EZ3NUL0gvNFZMOURwZk9hRTlQ?=
 =?gb2312?B?djdkOTlDdlFTb1RHcDQ5NGVKb2NZeXR2NUVZcWNidFdIaCtHcTloWDRNM0w2?=
 =?gb2312?B?RSsrSmRFSW9qMG9nRC9IbEd0WjFmZFFRRStReTdWUnhQVjRtaFJsNEJUYlly?=
 =?gb2312?B?U3paYS96enJGcm9zNmlLM2pOV0hpYm1kQjc0ZW1lem1nT29hNFRJVVFLZS9o?=
 =?gb2312?B?VDNUWGJzdWk1Y2Nidm55b005S1gxTkpsajdYR3NVeFgzM0JjVFcvT1I4QzFG?=
 =?gb2312?B?SkduN0xuT3AzR1QvVUVNaHhtdE9aUHhDMnIxRVRmTDBZN3N4dUZhaENjYkd1?=
 =?gb2312?B?MkcxQ2hqdHVSYTkxREp3L3RzMmlndGdkZXZ2QjZ3UVpEUkI2VzhscHBWc0lx?=
 =?gb2312?B?MnFwWDJZdmZIV3BuTHQyNVd5a21iUk9RcjZOelFEMkJ5anFzdVJVME5Ba0pD?=
 =?gb2312?B?eXJpeWdwS2tiSmp0Ulh5REI2TDhxYWdFenRrMEQxL3ZHV2pVeklTTFM3emdN?=
 =?gb2312?B?MnVSLzFvRVhrcml5elNVZ1VFbVM0ZDNJWW1RRG9HNTlldTZqcmt4azQ5ZmpR?=
 =?gb2312?B?WFVZTzhBck1jeXV5TVVqQzZWcE9lTkpPL0E3aVI1S016Ry9QcTRZUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TYCPR01MB712255E96E3585DA6FFF8AE18B56ATYCPR01MB7122jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	k6t0CkhsbxvlBt1LC8/hLoeW/rWlpzgscxoP4NMwF0MHxNe0HQ/qpr3R0LyCqxY+4+kMgVP53mOJPCUZn1nPTy5yCqcqy5P3kgJ7iexiIQyJp6UM4fEGxeMR6MbnG5tDrK6O+E2Q1ZQ3CpOKDacPNWMjozyp10F1jT9y+0COI8jT0bcmiz/zUzdv6lNdN9H+LUjlsMSOUXkXplLgU5Wt+8bWA9ktfzuYvjukYf4dgB3+tZgQJVHFEtm545rY4zloBwX6iOAQOugkg2Aj42XLre7C1B1DSWkkuxJl018OuFvX9286na14Hh4QJOgofyWvEVvbAozq+Tgv8tzOEh97Uw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB7122.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6389316b-f0bc-44be-5b68-08de8b17a2d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 09:11:16.5237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsfWKund7aUJR6LtvdgC5YhHwYn2KlD4+K+SW/sPho98+Mu4YOkVpTbaCDmNvX6Q/nkLMCvitw/HdwIrQe1lArh4W5lK01EzBDsm9wVBxaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15806
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125640

--_000_TYCPR01MB712255E96E3585DA6FFF8AE18B56ATYCPR01MB7122jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsDQoNCiAgIFRoZXJlIGlzIG5vIG1haW50YWluZXIgZm9yIG9wZW5jdCBmb3IgYSBsb25n
IHRpbWUuDQogICBNYXliZSB3ZSBjb3VsZCBkcm9wIGl0IGZyb20gbWV0YS1vZT8NCg0KWmhlbmcN
Cg0KLS0NCg0KDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gb24gYmVoYWxmIG9mIHpoZW5ncnVvcWluIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDx6aGVuZ3JxLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NClNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNiwgMjAyNiAxNzowOA0KVG86
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFtvZV1bbWV0YS1vZV1bUEFU
Q0hdIG9wZW5jdDogRml4IG9wZW5jdC5zZXJ2aWNlIHdhcmluZw0KDQpbWW91IGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIHpoZW5ncnEuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KRml4IGZvbGxvd2luZyBzeXN0ZW0gdW5z
YWZlIHdhcmluZw0KDQovdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9vcGVuY3Quc2VydmljZToxMDog
VW5pdCB1c2VzIEtpbGxNb2RlPW5vbmUuIFRoaXMgaXMgdW5zYWZlLCBhcyBpdCBkaXNhYmxlcyBz
eXN0ZW1kJ3MgcHJvY2VzcyBsaWZlY3ljbGUgbWFuYWdlbWVudCBmb3IgdGhlIHNlcnZpY2UuIFBs
ZWFzZSB1cGRhdGUgdGhlIHNlcnZpY2UgdG8gdXNlIGEgc2FmZXIgS2lsbE1vZGU9LCBzdWNoIGFz
ICdtaXhlZCcgb3IgJ2NvbnRyb2wtZ3JvdXAnLiBTdXBwb3J0IGZvciBLaWxsTW9kZT1ub25lIGlz
IGRlcHJlY2F0ZWQgYW5kIHdpbGwgZXZlbnR1YWxseSBiZSByZW1vdmVkLg0KDQpTaWduZWQtb2Zm
LWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4NCi0tLQ0KIG1ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L29wZW5jdC9vcGVuY3Qvb3BlbmN0LnNlcnZpY2UgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVuY3Qvb3BlbmN0L29wZW5jdC5zZXJ2aWNl
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmN0L29wZW5jdC9vcGVuY3Quc2VydmljZQ0K
aW5kZXggYzllYzQ5N2ZhNS4uNTdkZThjMGE4OCAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L29wZW5jdC9vcGVuY3Qvb3BlbmN0LnNlcnZpY2UNCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L29wZW5jdC9vcGVuY3Qvb3BlbmN0LnNlcnZpY2UNCkBAIC03LDcgKzcsNyBA
QCBFbnZpcm9ubWVudEZpbGU9LS9ldGMvc3lzY29uZmlnL29wZW5jdA0KIEV4ZWNTdGFydD0vdXNy
L3NiaW4vb3BlbmN0LWNvbnRyb2wgJE9QRU5DVF9PUFRJT05TIGluaXQNCiBFeGVjU3RvcD0vdXNy
L3NiaW4vb3BlbmN0LWNvbnRyb2wgJE9QRU5DVF9PUFRJT05TIHNodXRkb3duDQogUmVtYWluQWZ0
ZXJFeGl0PXllcw0KLUtpbGxNb2RlPW5vbmUNCitLaWxsTW9kZT1taXhlZA0KDQogW0luc3RhbGxd
DQogV2FudGVkQnk9bXVsdGktdXNlci50YXJnZXQNCi0tDQoyLjQzLjANCg0K

--_000_TYCPR01MB712255E96E3585DA6FFF8AE18B56ATYCPR01MB7122jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi All</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;There is no maintainer for openct for a long time.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;Maybe we could drop it from meta-oe?</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Zheng</div>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 10.5p=
t;" class=3D"elementToProof">
--</p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 10.5p=
t;" class=3D"elementToProof">
<span style=3D"font-family: =B5=C8=CF=DF;"><br>
</span></p>
<p style=3D"margin: 0cm; font-family: =B5=C8=CF=DF; font-size: 11pt;" class=
=3D"elementToProof">
&nbsp;</p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of zhengruoqin via lists.openembedded.org
 &lt;zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, March 26, 2026 17:08<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH] openct: Fix openct.service waring</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from zhengrq.fnst=3Dfuj=
itsu.com@lists.openembedded.org. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Fix following system unsafe waring<br>
<br>
/usr/lib/systemd/system/openct.service:10: Unit uses KillMode=3Dnone. This =
is unsafe, as it disables systemd's process lifecycle management for the se=
rvice. Please update the service to use a safer KillMode=3D, such as 'mixed=
' or 'control-group'. Support for KillMode=3Dnone
 is deprecated and will eventually be removed.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-support/openct/openct/openct.service | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe=
/recipes-support/openct/openct/openct.service<br>
index c9ec497fa5..57de8c0a88 100644<br>
--- a/meta-oe/recipes-support/openct/openct/openct.service<br>
+++ b/meta-oe/recipes-support/openct/openct/openct.service<br>
@@ -7,7 +7,7 @@ EnvironmentFile=3D-/etc/sysconfig/openct<br>
&nbsp;ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init<br>
&nbsp;ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown<br>
&nbsp;RemainAfterExit=3Dyes<br>
-KillMode=3Dnone<br>
+KillMode=3Dmixed<br>
<br>
&nbsp;[Install]<br>
&nbsp;WantedBy=3Dmulti-user.target<br>
--<br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TYCPR01MB712255E96E3585DA6FFF8AE18B56ATYCPR01MB7122jpnp_--

