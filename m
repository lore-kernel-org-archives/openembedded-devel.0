Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1932C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 22:39:31 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.70])
 by mx.groups.io with SMTP id smtpd.web11.33587.1678487964909537044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 14:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=XhIERGjT;
 spf=pass (domain: advantech.cz, ip: 40.107.117.70, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIvvKsANHdEr8zDAry/PSL8az+LgkHS6p8cu1khsY4OvjP+fiffZTUxLlAofHZHwSE6/xbDEh/j77NdtRFII054FBg4QU0D1OyJAf42zfS6qNYJZOGDMG1hJ3+FhzrhtXaOVlxkHFv44oYJItzejXhswLvUXoK4qmVS83KiyYmgjqQ74WWvs0lL6ZP2Ls2TCj5727RX6ITKVia4F1E1UaKM6W9Wg1EDjBBy0C0IYZ5SCaR4LhWnI1LxpeObmgsxZBspdDx7zdgLwFRVVKJFnEP5igr9XwzDy9dx+KLfSJ/UwnbjicmptEjkbxi2U4EO6Tu6US6a/7OsayE0wRGlOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWt8AnPDu4dvi46LT3b1GQC71NJ1KBI7J/WJpcSOF4w=;
 b=Yf3voYbLA8Epvu2+zjmRJW6nQiLO+L1D2J5KaXtaK3CrpNRTChNJp+hAZD6CuafP3coQElmtbImcDrwIVe4JoPDy4di1bYzYYoCM8ydYIw0SeNdja4MAY2mqGwcJoi2/uOaDrCbbXRy5Pyvxg3g5p0Mb1MRiu/0SOGmADOkSDAWUbP8N4O9KdgES/BURhWaJC1QoeXTOfJSVqr2UP5pomxSnOaP27DYGjM/5Mp2wkt8aY3EixGKMlhGqq6aDx1xymB+f/BbS+OGkeDc2dVJMW3jltBJGzHw0+shovIsLuz+ttRRiBbLWqAZQxAzOqEO/Lfpe2EBXQzUce/6Uf8giwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWt8AnPDu4dvi46LT3b1GQC71NJ1KBI7J/WJpcSOF4w=;
 b=XhIERGjTIxevwvDQ7I5WFWkSIzF7g+VlSPW8aKLuz6rqz0hJigtDlzhSqwawGKjDnFa3f6jBidadL9F6k9EUZsZPJtYnzTFh5YRPHC29mAXAaFoms7lXUIwePGT4lbftM+OK7YAVr2YTFX18JDVPxxbkktsOCuDJEE5JitAzTNVrlTyAi4GGB7LbeErxneZ4vEka+QF937UZmg+jHBfBPi61/5GlC5v4/z2kU/J4lDDoyDyR/UW97k3MKj1coUiEymjyELMI5FXQecMmxCgxp1lvVt6JjizY9aPq/baP+A7AECNib0r4uw8M5bB6KxuX8Gg0lVn+VThEadOLYKvFOQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5658.apcprd02.prod.outlook.com (2603:1096:4:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 22:39:21 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d%5]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 22:39:21 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmbim: upgrade 1.28.2 -> 1.28.4
Thread-Topic: [meta-oe][PATCH] libmbim: upgrade 1.28.2 -> 1.28.4
Thread-Index: AdlToGeaWoLyMB1WTDurUane5uwjaw==
Date: Fri, 10 Mar 2023 22:39:21 +0000
Message-ID: 
 <TY2PR02MB3678C054A358C1161A96E71D81BA9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5658:EE_
x-ms-office365-filtering-correlation-id: d7cbb818-5ec8-4476-6af0-08db21b84ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dQjS6zi9/ir4M1/SsE+9XFKAzDEI3fcfYkcOXQZmBJC79MzWrEQwCGh3+InhJmsbXiTqA92OQcuQJfBtpz6aDncQDWtMEw+tZqDTfYIf4Pem6X5FfE5rj6yipfGWrc0SVsoAK+bXhhcN2XviLZsmSyzKaEizwVnApMAZgMM0KHvbhO2z8KQrutXZOAEKkSC1KFyigtPnlYndCQNddhmrW+oaa8b1KglEiz4kOrMHZFYyA0t5epjwfw+kH/0iZe3yw1JQrrKWyjGhF6GzXRhSSoCKi1NegarP9OmVI+RxUDoUN3RUk8Z/OezXILRpxhiT6nS2oNOBcv6+dRBBEOgspwSi8dxCV8EGT0z6MIo3oTihZsipIdIsIdx1vqXa6QpUNd/A63iYW+lZwgNkUl4w8ffEv06skr5SQf5ys5gCNh+8SybsWOMSPaQ6ktzSQ1TjzORmbwy4yHPx8jNRVDxKDwXYauxJG0OJJvbhldscnM46GfQSiK03O1p+R19NVVvFQI4mPQOWxZpb9a4OvI7V09X0lb2Cnd2BMinpzVaGg7ionW39eabGRqxMwirhf7z5dlSl7lfNpy7n4ignASQiN78EDINQ1yRdYIJYFotRohoBGvH7wSyOs7IN3pPaOxZS2loOiFhF5a1i6OnWAxo/jQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(33656002)(186003)(316002)(478600001)(966005)(71200400001)(7696005)(5660300002)(52536014)(66946007)(44832011)(64756008)(2906002)(8936002)(66446008)(76116006)(66476007)(8676002)(41300700001)(6916009)(66556008)(55016003)(122000001)(26005)(38100700002)(38070700005)(9686003)(86362001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmFYR0hyTXE4bFhWbGVlM3dEVXZYTVExZWYyNW5OUVEzOGtEKzAwUzZDMjdU?=
 =?utf-8?B?aEtwNGpVVDNTOEtSRFNwYmx1VnJsQ2ZaQzR5ODRoTHdZNnVqRHJiYnIvMjRB?=
 =?utf-8?B?OHJlSHp6V3pXb3RVZDRYUDVRV2R5MmUwRlVCMW5SNVQrNmNGcE9LT0dJcUpl?=
 =?utf-8?B?U25jYVY1WW5DeHk1QjArUnZLTFZtTHVTdkhMNFdxLy9pdjRFMDZveDhwVUtn?=
 =?utf-8?B?MStwb2VVcnVCUzFLaFpROFRhQm81TExhV2Q2ZGpwMDJLL1FZMjlDdVdnUnZp?=
 =?utf-8?B?K24veHZjcGFWY2g3VXp2bmFhb2hkaTdITW5YZ3dla2tucXpzVHdZcm1MZjJ0?=
 =?utf-8?B?MzVpT3EzNnFTQkxhNEdBZi82U2dxTXU1UGRiRmdDakpZN3pGNWt5Ni9iSGhy?=
 =?utf-8?B?cVdCTWZaVGRxV0UxVnRWU1VLUkNCdE5mUXRKZ2JMQjFhNjA3VDlYeEkreS9P?=
 =?utf-8?B?NnpVRUhiR2RHOVUwUlV6TkhZN1BzN3JON0RKNlpmc0dDR1hySmhyQThoeFpp?=
 =?utf-8?B?b2IyWmM3eUxldGd3QTlmRkpmS1p2U0ZPcFduU2M0Q2NTajd5NVExakhxSmNJ?=
 =?utf-8?B?ZGxVaUdpejdoMTZTNzRJY25EbDhsc2FZMDFNZGlxSjZFcW52VnZjbGV3WTRG?=
 =?utf-8?B?WFo2alBHRDhsbkV3Skdqa2NaTTAwQVVzUE9sbWxnaEZ5V1VWRUJYQXR1eHB4?=
 =?utf-8?B?bzh3c2xRb2lWbThOeWpRekd6OXRadWtobzNiYXZXQUx3V0E2QmNwU2FkbFVS?=
 =?utf-8?B?Nm5RUEM2VUt5ZWNGVGxoWExzZjVRTUFKV0tuOTlINFVDa3MyVlR6YlgxUFNW?=
 =?utf-8?B?aFZyeHNkbDc2djE3c0ZSMkh2R0VKeFZXczR0MXZ2M0hta0xFNDBuNHNqNzQ5?=
 =?utf-8?B?Y2FESjFMaXdTWVlMK2RhZVFSU1pvMEF5K1pPajZPVEhaQjdwWnZRNmlONWpS?=
 =?utf-8?B?N1pBK0hVMVI4MlgrZTlJNlpXRm9PeWRVcHNKaHNYd3kwZ0JuMjRWTVZYR25M?=
 =?utf-8?B?ci9OUmhNRjdYb1VpbE9uYU5qQlA3QTdHZnRIUHdiS0RhZjVKYWd1bjFLWVZG?=
 =?utf-8?B?QUlJcGRsdWVhbGd4NG5LaUtweTFiUUJ1Wlp2eWZnNEpqSVdDMDAwU0dRZTcx?=
 =?utf-8?B?UjRGSzRLZGlzcVlGZmtHN3NvKzN6b1lGc0VNRGNBcGlBR0RrZ0ZmWlhSOFhJ?=
 =?utf-8?B?RXFsVlNSZEFIV0QyenVLQzZadTZPMllMek5URDVUNXYxWWFFNDFMVjRBbVVM?=
 =?utf-8?B?VFo2UnNTcnBBV1BXdG5BVzRvR20yRTYxZnJmV3ozdEY3bFpwaUN2alVGdDI1?=
 =?utf-8?B?QlBNRncxYVhZUjg3MTgrcnBBY0EyNTNlOEZORG5TTyt5cDBzbStiN2E5YWcx?=
 =?utf-8?B?S0N4MEM4Zmw5UG9wWGQ5YW04YnZJd3hDR3MwcDdlK3MxQnI0RDhDYW1idTBv?=
 =?utf-8?B?UCt4d1ZmODRmYm0xcVd5S0p4VmtvUDVPV2ovT3VVVDQ5d3d3bEg3bFZ3ZExo?=
 =?utf-8?B?dkFwRkdqcTBPaEhyekZPSEdnZjdGazM2VEVQVUNYNlhBaTQwZGd2WndWQmxV?=
 =?utf-8?B?VXoyWXNFV0dMWmU2dFlZK3ZlbkFzaVBySDhQSmJkdFlhZklUdEFUamc1UnNm?=
 =?utf-8?B?U2tnRFRpbjhsUk4zcmt5K3hHUDA1QTVNL3B2SEc5bE9ud3B3MmgxeVRQUDNG?=
 =?utf-8?B?RjNhcGlBUFpJM3NIL0hsaEd3N3kvdCtHdFJZcnFWTVNrYnR2eFlaaUY4Qzc1?=
 =?utf-8?B?a01PN2dnT0NnOTZFbWlkWDM1SWlUbmc2ZEhSQnd6OUZuOGFKZGdRVkpDRVBy?=
 =?utf-8?B?MlFDSVBxVXhsMGNyRS80TE9xWWswUkJ2eW8ydEdBNExYenV5ajd4NVVvTllz?=
 =?utf-8?B?YUhrak9ZakhDcnFnYjcva3Brb0NxNDdnQkQ5MlZCclhPTE9nYndCakNCbE1N?=
 =?utf-8?B?Z0Q0NDVGUVpZVUdjbG43Zzl0Umx3QzZwZUJJbEQ4dFR4emp0QWozTzlqQXRR?=
 =?utf-8?B?UmJzZUYreExWQ0ZZR1M0alI4ZWJpcUtYSXV1UmlBck5sVFlvb21DSjZ1aU04?=
 =?utf-8?B?ZmgzTmVBaXF2RTRyRFFpZkJ3RTA0OVgxbUFYcTJzZHJyYXlCeTBPT1hFQnlD?=
 =?utf-8?B?M0k5TzNjN3NNbC9PWDF1RVFhaTV3TFRRcnJjRXp3UFZUN0VzTVUzeWlwUXM2?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cbb818-5ec8-4476-6af0-08db21b84ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 22:39:21.5157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/jwnitgtTThXXrZzCBCiQ3O8CPazaxdgz/pTvUpqq20319sj/dopTRpApnMDpHbRDtQ/3IY9yfCzBJU5LND0l2WHAABDprwmcc+RXIUUMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5658
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 22:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101500

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJh
bmQvbGlibWJpbS8tL2Jsb2IvMS4yOC40L05FV1MNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0
aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vbGlibWJpbS97bGli
bWJpbV8xLjI4LjIuYmIgPT4gbGlibWJpbV8xLjI4LjQuYmJ9ICAgICAgICAgICAgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQogcmVuYW1lIG1l
dGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS97bGlibWJpbV8xLjI4LjIuYmIgPT4g
bGlibWJpbV8xLjI4LjQuYmJ9ICg5NCUpDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjI4LjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjI4LjQuYmINCnNpbWlsYXJpdHkgaW5kZXgg
OTQlDQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGli
bWJpbV8xLjI4LjIuYmINCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xp
Ym1iaW0vbGlibWJpbV8xLjI4LjQuYmINCmluZGV4IGE1NDliZGVkOC4uYTM1ZDk4OThlIDEwMDY0
NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4y
OC4yLmJiDQorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJp
bV8xLjI4LjQuYmINCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0y
LjAtbmF0aXZlIGxpYmd1ZGV2Ig0KIA0KIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGJhc2gtY29t
cGxldGlvbiBnb2JqZWN0LWludHJvc3BlY3Rpb24NCiANCi1TUkNSRVYgPSAiYzk0Yjg1OGQxYzVh
OTgyMzhhZGYwZTYwMDZlNDUzYzk4NGM4ZTVkNSINCitTUkNSRVYgPSAiN2YxYzc5MDdjNDY1NGJh
NWM2MTlhNjM1Y2VmNTQ3NWNhMTYxZDAyNyINCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvbW9iaWxlLWJyb2FkYmFuZC9saWJtYmltLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWJpbS0xLTI4Ig0KIA0KIFMgPSAiJHtXT1JLRElSfS9naXQiDQotLSANCjIuMzQuMQ0K
DQo=

