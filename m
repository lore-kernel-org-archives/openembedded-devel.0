Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36754E92702
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 14:02:09 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.70])
 by mx.groups.io with SMTP id smtpd.web11.16158.1696514520308267039
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 07:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bWYxjxcb;
 spf=pass (domain: axis.com, ip: 40.107.104.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC60Bsk3hxerM/7uWs6MQpUR4ySz2SfB5XQYxoFho+/FT+Pw+ZOybQWHveFBBYA59A0x2tW5tFOqDWwTjxdJ9IiISQaVRB/QrVZ7PaFnNndx4QoMGkRLPjx7Lr7uu3PXCCs00mhU7JuCFvigK8EOAKy1PAt6HBLpCC4H3NNRE91fuw2WCpwc53IzhO6ad+6Z5HTmV6/wRWKvgo+pUd4f/99PqswSiXeFtz7GjXsL2UhCw9Kn68G6ewyHsJsw2FmSThjV6lUu+neLV1y0lQpUPA+AQtzGsS58xJCGDhyy0wfT4c59b18+FOuMeb2bADp620+OUCLQee94V7wFuyi0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsvIbHRoBIFw3M5DinI5df/LgVFe6lmLY682kPzUgsQ=;
 b=kBOw+y8HOShGSNeRIe++xjFJBWozxXsB8GdRssjwYTWqio+PXZRtW29KciBcacO3+QzNw/KmwQ7FSVhaHkRpoIKTpKGKXTz8hHYXamTJCoib4Cr2n2fI2sI2/V1bQDPXq000E232jeaOxYS3XS9a3ki+BN+3STnhSmz8HwMi9+o/GH+O9Ym+n/VMZ8W4k15gl6xkOmGeuSpq+lwT0lc5wYjeSi/waMDC/7KFP3KQ7kVl2GXQ/6dj89UxX1rGQnxX7/A2hFD7g4mEsMXb7JlRvSpd/QGlvVvOnUFG4/XHoZ+Pr8uJlHaIHkdGA2W9B8RG82r2fRyfKVYsxe53iOuAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsvIbHRoBIFw3M5DinI5df/LgVFe6lmLY682kPzUgsQ=;
 b=bWYxjxcba4gGwHRGnyR4STdU+hgWIVsebAxc/2GTG2ekcY0aV0T0HavmMDWD+0AIq/IGyqulqXABSnSrowjMwy5tir12Eyp9aaTqeXk8nlXBJPvnsfXsEaIIkG6owRKDw9mKM5E4W/nienFoId7bV945MXS6s+oLW0m54mTsSgo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9697.eurprd02.prod.outlook.com (2603:10a6:102:319::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 14:01:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 14:01:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Development (openembedded-devel@lists.openembedded.org)"
	<openembedded-devel@lists.openembedded.org>
Subject: What are the plans for the nanbield branch?
Thread-Topic: What are the plans for the nanbield branch?
Thread-Index: Adn3kvj9DFpxZsnSRUS1BGvBlU3xaQ==
Date: Thu, 5 Oct 2023 14:01:56 +0000
Message-ID: 
 <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9697:EE_
x-ms-office365-filtering-correlation-id: 124dbaf4-04c4-4714-9725-08dbc5aba2fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w22qeN8fr1JIVCtgz9iCyz3HyRM7OQcg4YABhgGnIPdYP2pWMBtkIHTDYGFt5KsFOktRDNPkGocxt5hDjXzo2JDjSx4Unw5IE6/Sw9uysj3WP20eRSPv7leZ1jLiK8JwiC/LVN10jwBICiLL7kl+yDDrwP41dB7zGfNcWWC2CdVi+jcJqEJ1xZUfZbkIUveYzkg92xvQl5hXc1QjYj1iN/NWAFA4DrZ/WSix0F7daM7V0+uZZk349fEF2HCW4bfzEFQZowSyMAWPa2tOyRWbkra/f/eTZaM95On3qCRsi0ZC87I1Yr4RsnPuMtukQ2ZfInSUgkhnfVNSCR9vx5h1ojQcXIz/C+gRCKnb1657+qYVy9hvz3hiw4ajCCgvGe1NETFHW4vLk0GYSVS9+UNFWiGtFQlNMo7C8xFNp2W3ohnwMn/ctajdlbgH1DalaikD0jFGvQKTGrgwZ8YifEeZKmlbS13FeaK7/weewqmCo66NcIVt0l+05bLcY9WiZXMZbJyJ0Zp1fwkH3bEYT9MTeO3Q7OWr0M3gn/fTpdKAhphMDJGZBM42Lfofh7VT80LJW2kEeRbLtzxmj0Orfm4C2fm6Zl6xtgmlmdITHkfmBOD9rGOScPVa5Yyhr2UC44Su
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(55016003)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(41300700001)(6916009)(316002)(38070700005)(38100700002)(478600001)(2906002)(86362001)(4744005)(5660300002)(8936002)(8676002)(44832011)(52536014)(83380400001)(9686003)(122000001)(33656002)(6506007)(7696005)(71200400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0lItbc2dmcjVtMC6zRB9t5p63C307gvOwjlHFC3G+TBW0AMqzcEGrwo2KY0B?=
 =?us-ascii?Q?avgtMkNfdhlY6/NmVJxYGAZPdaNUzGUIpiIqCDM9dJ+zoW2alXih5zVLs8qQ?=
 =?us-ascii?Q?FqP4iHh8CCzV6gnz/yC3kfz6WVt8XoG3PPT7Lmr0DMq/PJwPA+mV9U4prNcy?=
 =?us-ascii?Q?/1oHGn91A1MLCPlFhIH0rNCl5IhvltMpF8lSqc0+tjCl+pvhoxb3jhm2IMJ/?=
 =?us-ascii?Q?ReShiecdw8kGyP2b4GuyD1o62j8nK+jg1FzC+7ulGV1Jx+C7jvCy/8Oza1gH?=
 =?us-ascii?Q?MdvVBZ8bn/a0S0dU45pMKDHPXSjynNozNiElGkJ9yq1zKQjcS2HWLclRGlS8?=
 =?us-ascii?Q?A72ZW8LgUWgaGLCTeyuCaRJCbFH8i6rBAZ2pjhTANe2v9nYfLwMYNqYcftVQ?=
 =?us-ascii?Q?90eQx+wXddaruvdofU/ajm+c8VX3E2YR2WSKC+B6cynrhjNxqdS1EUteVJca?=
 =?us-ascii?Q?LjM5V/7x0cQVkzBxZMTdtKMclH3/3tMfRq/3cABMoPKsUEMgonko5k34o0BH?=
 =?us-ascii?Q?AtMH+JV/iXO06F5OLgKL3X77e/TLdQ7a44egPpqHDO24Mc9iwaEghOBQ8H6H?=
 =?us-ascii?Q?DXMY77ilNYPil6GQoyo4sr+8JgSSnXZBWV0yr8wZtyzQYwXDpWDKZGUaAphn?=
 =?us-ascii?Q?YVXrhioUWNHF0Sr6bGAociX09wnq4aC3ffMdpXkZlaZUQYTEVeTfTKx6P8+V?=
 =?us-ascii?Q?B9t/Ai1jP+Eksv9+5emWP/+5JOjJneE891+NJLdlS1pd/ESxYUjwKjhSSpRs?=
 =?us-ascii?Q?yCL6COSjFvT1QxW1gnzWmz6HLFdujoiZHf72anZZ4iXX2xOySHDH/XHqTcBl?=
 =?us-ascii?Q?VodfuTWLgl70hrIXiWMffYTzYhkTxBuvM71SzlKAcPVETM0SJX+x7UxSas/s?=
 =?us-ascii?Q?cIfyubxTufLHQ4NKo7S3Qob5+sjM9N47gsK7nMT4Cf7PPAN9b0QhDoWaJC20?=
 =?us-ascii?Q?OuFQ1838aUVYC5pV/Ccg2jlmtazJcgrFJg/VWSF5vOEs4IRgcHL3MeCuRGG+?=
 =?us-ascii?Q?z729SIpDA99PYWd086zEHjf1pH/Rqo+1jRxCayVcqgF3uzJRI1W8a4OEITwZ?=
 =?us-ascii?Q?MamhYNNTqC4TAnAn1Be68EVF7WAgeosqZ6chw6mAB1NSeUo+n/gZ9GlCcPLf?=
 =?us-ascii?Q?ClDDKBCVmdU+mIN3g4g/TgM3tECCTrhPmZ6UVBrP3pnCMvv+u/TCU1D5UNDq?=
 =?us-ascii?Q?JKJ1pYHPjGHwsAxq9kmqYdVTaRctopYHzH5W+WF3xlySsHeOOl6WkruY1eKS?=
 =?us-ascii?Q?whkfXOZQ/F3EUHHmQkLiROaOYHvWKCA0QDSmfQRVZdjjG5YuPGfIz79yUksf?=
 =?us-ascii?Q?Pdine20IjbXhNHSsKvcFiGLoMw7ynvGYgMKUDDf8u8Pn/B55SZfhxg6+wQUc?=
 =?us-ascii?Q?4qRt/udGSrCAeup3jxDW3YxtOvZThdINbRLiYsD5hKVjcdUb7pzM/QhUuufU?=
 =?us-ascii?Q?YJEklHja2D6USSDtdReVce3QX+3kWYw6+JD6eJZcvPoUMME8qSLJ9bVWadTx?=
 =?us-ascii?Q?hxqPqWFjc2jCh+oiIMRi7FcQaKU2qvPpnL3WVs+fvGIIn0u1JS4d0SyQF5sT?=
 =?us-ascii?Q?XCJUlsQcVWdlki0HtzY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124dbaf4-04c4-4714-9725-08dbc5aba2fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 14:01:56.7144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGGF6yGsR9//6eD9uTVigtGxBG109k1mfWTem98PqZG2rVWFkO3uLvhuoyW2Shdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9697
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 14:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105357

Khem and Armin,

what are the plans for the nanbield branch, given that is was=20
branched off long before the actual Nanbield release? Do you plan=20
on merging master into it once Nanbield is released, or will it=20
stay as it is and relevant parts will have to be backported?=20

The reason I ask is because I am currently working on preparing=20
our layers for the upgrade to Nanbield and currently there is=20
quite a big difference between the nanbield branch and the master=20
branch in meta-openembedded. Thus it would help to know if should=20
continue to track the master branch for meta-openembedded, or if=20
I should revert to the nanbield branch.

//Peter


