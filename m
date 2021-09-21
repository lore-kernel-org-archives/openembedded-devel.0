Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.109])
 by mx.groups.io with SMTP id smtpd.web12.3983.1632204117614041367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 23:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=qnCzJqI1;
 spf=pass (domain: skidata.com, ip: 40.107.20.109, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGBMK27S6C+kuoanowCQEdc0BA8CT9mEzP4zSGVa/i/1OXgl5axtg6n9thJuxtMxvrC5plj8vikmyg793r+pJtjMs2bv0D89vbIqe5cxXhWxtUKuYrbPCXEptDqNOUii0ZGEDwbEvwkE/LwNTj7m4EweYBiivyUkrNEVje3wr6OWYI4kvlCXxYgTqf5fjfDQUMH6KDj2UaQC+NohX8RJ/vqHQogzNp35encyZD9Te4PNN1WJdaWCxbREEgvCr+U+JrPihL1Gp1Q1+je9pKDWyLWhtlInVkqrAvBGt+xns79gN3Ppc6/G48hIVip720XhN+WuNLf7kAvE9aBF/6CNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fhIwqbpbaOdS3/tylI/U1hflB7pXWtDiAMc7lrR9JqQ=;
 b=W3zFpYp0VuSEZTyt/sQOWm+JSJbNsUy3vKr9UmXi1M64YOl87lRdO0pig72OOxWrqC6bHWq6OK0Kf5XxV4cqRCLfIsptY4w5AfpHtxAps+bnfco6/2EudtWdpPSqYa3Npw8UtgT9z1QMU2lcgdzHAlvHxpODXiHcMNuWD9VhdI/01gsYyAZ4YOgJS1R1t12EtU1acd44LVk4B0MILc/gFzG/OE6vWWTadoaLaRWh43pnI1UxL9LHgiPXeZCNbSTkA0IU9qt1OMOk0yUiTeauzdX+g5peauGC31igUr7j0++hRnSN/D8mMapTN0pGauu//qz+CZ+rJ9/p3Cr4ziUJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhIwqbpbaOdS3/tylI/U1hflB7pXWtDiAMc7lrR9JqQ=;
 b=qnCzJqI1XsYT+NDhRYsLgPMMIW9Cl2WvyVw3BnK4fJT3ViqFI0yrHb/SMl8c+BrPM1TrjHVDKnF/lccfmS6BKg8h3sDI46FtSgcafoVxmGyfbnlYYEARQL7W6eS/F1G4FW0tekR9L6tEKAtuius+JZoVtXXew1vQZgJjUE7rZqdy3IkiXRwByTqQAVM3TXL+NBSsswMh/S9KW7+6Bk5JGKoIpv1obZhPj0Ndt64n0D/FfoMftTe8pSo+Wxa4ZpOnUxFHaVbeAGov6lT7V5HsGu8ywCPa0x0NHRgkAI2TU1KvUFqJavfYAX2TakDLSJRSI5c+rFAEoIurB7ixKuxS1g==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR05MB6752.eurprd05.prod.outlook.com (2603:10a6:800:131::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 06:01:55 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::dc9b:c50d:7c4d:fae7]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::dc9b:c50d:7c4d:fae7%3]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 06:01:54 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: "geoffhp@gmail.com" <geoffhp@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Geoff Parker
	<geoffrey.parker@arthrex.com>
Subject: Re: [oe] [meta-java][PATCH] update recipes for new override syntax introduced in Yocto 3.4 honister
Thread-Topic: [oe] [meta-java][PATCH] update recipes for new override syntax
 introduced in Yocto 3.4 honister
Thread-Index: AQHXrmujbuyD3X9xE0SCiSnWfyXMHaut/4KA
Date: Tue, 21 Sep 2021 06:01:54 +0000
Message-ID: <YUl1UTrdACZuDh0S@ltleri2>
References: <20210920220522.938556-1-geoffhp@gmail.com>
In-Reply-To: <20210920220522.938556-1-geoffhp@gmail.com>
Accept-Language: en-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40357dcf-c136-4b9f-84e1-08d97cc55046
x-ms-traffictypediagnostic: VI1PR05MB6752:
x-microsoft-antispam-prvs: 
 <VI1PR05MB67521DB70E3BA7637CD0F00CF0A19@VI1PR05MB6752.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o6LOgemCDl1B7QIDWYILDdlBt+z5nDJLRDX1SW0CRpcI6VPJstL5VfRYXpKSaVvXlU4JbPY7e6D8qMb7/AeHaRyilYZ9e1Y8tPy8VRAS9KaI6N6KVokU0ULzUKcBC3/iCJKBINCCr00O8l/OEcqnrIF59k8mY1oj727Gb4wNq/I7QYkNr+0Otehz7SmdH+gx3LQG2f7yXw6ANxy2vIB5utx4uelYjwdSC12Ux+kiic9dAR2kQEe7XwtCQvKbk5Bm0EpOysfR5LL4GkMXtUdASKXZbGGYpfiTJwmsNaOQvFk9CvM5mYf3SVCcfDJjDpNXC1p0hOku52Ukjd+yo756ZEBN2Pomxy+VG/3cKOGfQX6srGDSNzyvV6CqpiDk9265bfVuQzVBF5oo1BrkGeIQRY8QfBJgf/rvTcoBt49Ohiwv8nXoKZT2NWFfYi4Wb5EpK+mDJRaULmEsvg+7/c8kNgpJxMRvgox7wOmqiOc4ROO+aQuoRG6LywDZLttwS3GLBuiQelZG5BqKKgtp+qY1KBKUAZdGCWpHz675sh6IldnAFDwA4dat+ctKX8Bp9haz/RBhjJqbc8tq4DWS+U7sqtujaQH+jVYUKIweeZj3qrW8qofTlF8Dph9WVvaD2YdYQnI0c9GwfrMpv5bLLVU9gOQftKLXLnfEQFr2NGRsjUw2renWqlCIq1th3mvzYtPZsH89WsWKrfikJdE5/U1PXg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6916009)(86362001)(66476007)(186003)(6512007)(66556008)(15650500001)(8936002)(64756008)(38100700002)(316002)(2906002)(6506007)(6486002)(26005)(122000001)(9686003)(5660300002)(71200400001)(66446008)(8676002)(66946007)(38070700005)(33716001)(508600001)(83380400001)(4326008)(54906003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WLwCKIWRnWp6fSgYA8GzAWxzsVh3TAHpmEwDWMellGPyx+oI6b6ZrAGWNa6D?=
 =?us-ascii?Q?KP9746NGAvtYa9FU2nt4icf0YoK94kuTz/PtojMGsuc3tJGiDK8X4nOtS8wZ?=
 =?us-ascii?Q?7hWuGAAOH1yraO8tjjd133hD9hnOlNvNsK+UAsbppzZwI+NV76zKOp4uglol?=
 =?us-ascii?Q?5aWqwYgx15NSz0RZxDp065MFZBQOUnTlMjc8EARLzGEdI1pD0e7ltwIzVjAG?=
 =?us-ascii?Q?4RbrJBwSj+ejRmFeDjRoFLgQBfAV/PeOJ+rkUJHVomSPq4lcdO8aJSa5zsgI?=
 =?us-ascii?Q?d/G0Ic4S4n3xOlEhFWjCd3ADGo2irVXCinvE8IqbV5GLqCEvChHP3Ea4zar9?=
 =?us-ascii?Q?VLXx4+H9KmLvEXB1qg1G7GOgyobbuTx5+ir7DomquLnkU91I8X7hfNkEv9Yk?=
 =?us-ascii?Q?CVVFA6fPCwge/ky/zDV/PEJynmEIjvwoNB1L00WwrB3PC/J4CfGr2C4IYgTR?=
 =?us-ascii?Q?V3Q7sNgDk0x5mLPsRMNjas0rm6aKPdiqi1dsXDtHbqiRPKFeRoqCSGmAbj5Y?=
 =?us-ascii?Q?OkAOQvL9PD+jwAqlfQhSg0zpFdSAEM8yY5NBVAS39vaJc0xBrhvjlmr6u5pT?=
 =?us-ascii?Q?xxV3PD8MB93ZXdg3eyYCzJo+A+99eDiVvGCdRpT6+/Kx9DoLdOwufxbrK8jx?=
 =?us-ascii?Q?Wu26hTNFhdxPtxZugFCOY4GvnrQLRfRK3itnuOSScuIOuXIsrEezf/l7YjKC?=
 =?us-ascii?Q?nrkhc/bWnXeIHO4Ah/yPsjp92vIWmNqFzeo214FDRQgFI909i5TB0JpKlKiT?=
 =?us-ascii?Q?PBvMWVCUVxtPCnFNTgZyzM+CY+TnGd7UAiS5nQGi2cSXBj2Tn6PlTAOLmEGA?=
 =?us-ascii?Q?CoGPAlqYz/Y33R13ltS2wXAdnjHR3X1Mlu8+2xHw5jPY+bAhtkUhqCOZAW8q?=
 =?us-ascii?Q?QR6Q4hAXwyNg6mcttAJPlcIuNZq7A9zRHN+cjtpWa/DAtd28+dHmuPfEeb8o?=
 =?us-ascii?Q?pvV6BBmhqYtYXY4vbh8Gq+MF4qdgJAZM6kFkyRGeBkFZvg9QiVTNxpjksIPH?=
 =?us-ascii?Q?BahTZqA9nQ74S0+KWCYZxRTuunSTWbkEypuY/vHFuhVl1N2OnojBCWJnA44q?=
 =?us-ascii?Q?qUHi1YaMUHdwVXuDJPv7K4SjP2IVR6Hf/r07sVQhL7OPuE2dISTUEuQyfgOG?=
 =?us-ascii?Q?AQWW/56OPLf27IHvpRPQewj9/nH/1ns29wC0kp7nTvkabAsHqCMZVkcuuQdE?=
 =?us-ascii?Q?fXSrgTFO/3cdHFr1hUdOClxzWb8N8gcn82NmUHU28f1r862jIt0GAgpXHAI7?=
 =?us-ascii?Q?Fp0lV2HqFGU92zpvWsWW19rcNUDsE0ZfknweoUyQK5zjC+3RmqBRthsKTH9E?=
 =?us-ascii?Q?ngi67bMPSEczsR7GK62tzzJRNp7KTy/lo0OZQX1rYIdthg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40357dcf-c136-4b9f-84e1-08d97cc55046
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 06:01:54.2704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IZH3lwrHpjlNx09J0nrcVSk27CoatvnjPiTqiQlYVtzQKwNRY41Vp1WqOSpuD+t/JfgzxCR7lyzpEBnaX2Qexeh2QZ9Bj3XMjMU/8lu3Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6752
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7FFC90A06947F4C97328D2DD1811407@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Geoff,

On Mon, Sep 20, 2021 at 03:05:22PM -0700, Geoff Parker via lists.openembedd=
ed.org wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>
>=20
> Ran convert-overrides.py script with some manual edits after review.

Thanks for the patch! Nonetheless we have a similar one already in
master-next. Can you please verify it fit's your needs and maybe give a
"Tested-by" or "Reviewed-by" tag for the commits from AJ Bagwell?

Thanks; rl

>=20
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  classes/java-library.bbclass                  |  6 +-
>  classes/openjdk-build-helper.bbclass          |  4 +-
>  classes/openjdk-test-image.bbclass            |  2 +-
>  classes/openjre-test-image.bbclass            |  2 +-
>  recipes-core/ant/ant-native_1.8.1.bb          |  2 +-
>  recipes-core/antlr/antlr_2.7.7.bb             |  6 +-
>  .../ca-certificates-java_20180516.bb          | 12 +--
>  .../cacao/cacao-initial-native_0.98.bb        |  2 +-
>  recipes-core/cacao/cacao_git.bb               | 24 +++---
>  .../classpath-initial-native_0.93.bb          |  2 +-
>  .../classpath/classpath-native_0.99.bb        |  2 +-
>  recipes-core/classpath/classpath.inc          | 40 +++++-----
>  recipes-core/cup/cup_0.10k.bb                 |  8 +-
>  recipes-core/fastjar/fastjar.inc              |  6 +-
>  recipes-core/icedtea/icedtea7-native.inc      | 20 ++---
>  .../icedtea/openjdk-7-release-03b147.inc      |  4 +-
>  .../commons-beanutils_1.8.0.bb                |  2 +-
>  .../commons-configuration_1.5.bb              |  2 +-
>  .../jakarta-commons/commons-digester_1.8.bb   |  2 +-
>  .../jakarta-commons/commons-discovery_0.4.bb  |  2 +-
>  .../jakarta-commons/commons-el_1.0.bb         |  2 +-
>  .../commons-fileupload_1.2.1.bb               |  2 +-
>  .../jakarta-commons/commons-httpclient_3.1.bb |  4 +-
>  .../jakarta-commons/commons-jxpath_1.3.bb     |  2 +-
>  .../jakarta-commons/commons-net_1.4.1.bb      |  4 +-
>  .../jamvm/jamvm-initial-native_1.4.5.bb       |  4 +-
>  recipes-core/jamvm/jamvm.inc                  | 30 ++++----
>  recipes-core/jamvm/jamvm_git.bb               |  2 +-
>  .../javasqlite/javasqlite_20150419.bb         | 10 +--
>  recipes-core/jcraft/jsch_0.1.40.bb            |  4 +-
>  recipes-core/jikes/jikes_1.22.bb              | 10 +--
>  recipes-core/jlex/jlex_1.2.6.bb               |  8 +-
>  recipes-core/libmatthew/libmatthew.inc        | 22 +++---
>  recipes-core/openjdk/openjdk-7-common.inc     | 76 +++++++++----------
>  recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb |  2 +-
>  recipes-core/openjdk/openjdk-8-common.inc     | 16 ++--
>  recipes-core/openjdk/openjdk-8-cross.inc      | 14 ++--
>  recipes-core/openjdk/openjdk-8-native.inc     | 18 ++---
>  .../openjdk/openjdk-8-release-aarch32.inc     | 30 ++++----
>  .../openjdk/openjdk-8-release-aarch64.inc     | 16 ++--
>  .../openjdk/openjdk-8-release-common.inc      | 54 ++++++-------
>  recipes-core/openjdk/openjdk-8-release.inc    |  4 +-
>  recipes-core/openjdk/openjdk-8_272.bb         | 24 +++---
>  recipes-core/openjdk/openjre-8_272.bb         | 16 ++--
>  recipes-core/rhino/rhino_1.7r4.bb             | 10 +--
>  recipes-core/servlet-api/jsp2.0_5.5.26.bb     |  2 +-
>  recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +-
>  recipes-core/xerces-j/xerces-j_2.11.0.bb      |  4 +-
>  recipes-core/xml-commons/jaxme_0.5.2.bb       |  2 +-
>  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb    |  4 +-
>  recipes-extended/dbus/dbus-java_2.7.bb        | 14 ++--
>  recipes-extended/rxtx/rxtx_2.2.0.bb           | 18 ++---
>  recipes-images/images/openjdk-7-test-image.bb |  2 +-
>  recipes-images/images/openjdk-8-test-image.bb |  2 +-
>  recipes-images/images/openjre-7-test-image.bb |  2 +-
>  recipes-images/images/openjre-8-test-image.bb |  2 +-
>  56 files changed, 295 insertions(+), 295 deletions(-)=
