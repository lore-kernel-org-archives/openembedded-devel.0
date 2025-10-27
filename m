Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CA1CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:25:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.111])
 by mx.groups.io with SMTP id smtpd.web11.28537.1761560735780911230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=B7MxDI1Z;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.111, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfoT/t0jl/v3KohTl35vLvhzX+Njs2IHZuiOhRdhldvXS1EosjCmgGTZyMkC2hUyh8UNe/WNHpr64EIza5JtVsmsZQwO4Q16lrqvfLDTrkdN/3+xKnPqUHzUH4K5NzIhBzkzkw6caOkFTuPJ+QyHwiXHtvbknFZXxG5WJwT4BZakY2JRd09cjY/MPjnMVknSsQeigJ6ZPbh46ZfdTZOPE+iQeAl2xFNYd6rBBnT3Pmp7lTijT5/JS1StjEShDjPd04mvWpLsQwU0UoRSh7JA+F675JNRjmB8MBS+e6UIH//ACjBbdHUV+ugshIMP1wLE9fhC8RJXgfQc1LEgeawBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAXlh4WFotDFHiQb4arSWswTjgHYF7JQOp9STGZEoRw=;
 b=WC7W7QY2pdAbGUY4MJ0A0ALa9OTTmNnx2VxlJbL6cNstGKHsQTe6b96i/7TY6VYDRq2PrmhaYrA8k0EslhcCdsJDNXaT8NfiOOdO51JajWINXufM+wnvPVovEOhubyKBI6MBeo4BHK74tMlr1WHnmNhMCw9x3/oaTJwIqAp/6qMkZYdp8TrmBctSIXrAHFR4HQxovKQKoIPHa4MCIC2Y7ybBpty4OPKUSkfbK4bkA4NZAfJeSjh0kKnRAhgG7nCSwF2w9oU+XETpI4DY94s3hwmU6bdxjFIE7nwqUqyECN5iZ+pOtdOC5OUsXYavlz/kmIHB1/nDv2FyY32hpxBUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAXlh4WFotDFHiQb4arSWswTjgHYF7JQOp9STGZEoRw=;
 b=B7MxDI1ZX3oHjup3mjZ51bWE888m/wfHmiJNbHS3Z3o4SqNTkqAq4PlnKPb5X5FXusOjFQ0p5oFt/T4HdPFuC8y6KQz1/fj9hRtagFTscKW9nAqu4XT3GSRfKX9UzQ6NnP2NRiOsclc+7DmXKYURvAOuQQfB0pp0vDgIz6PMKncC9dgKRX7ZVakPZRsedQCiClGGJ3eVInK1k6slA1fAdMyHM1qmZNPBMA6Eaz3lJjVgP+2YYz9VoebbAvggnl0kQhbDjLXu50u4OyUrv+evjYSHjop9KsjlVR+OCYd3hY+SySs4A6SbD6YBkhnzdVkm1DLT4LBHPLp0bRD/glwJqw==
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 PNXP287MB4351.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 10:25:28 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:25:28 +0000
From: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [scarthgap][PATCH] imagemagick: adds ptest for imagemagick
 recipe
Thread-Topic: [oe] [scarthgap][PATCH] imagemagick: adds ptest for imagemagick
 recipe
Thread-Index: AQHcRv4xd0kYKmlkC0yxe8Uy3MWVNrTVupUAgAANoACAAADnAIAAAGLP
Date: Mon, 27 Oct 2025 10:25:28 +0000
Message-ID: 
 <PN0P287MB0358EE8233269D72C41901E689FCA@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
References: <09ba1133-9de9-4bd6-8d59-4cc87b2b2aae@gmail.com>
 <798.1761560334206814866@lists.openembedded.org>
 <a04706c7-3ac2-456c-8333-cf6a793fa6a8@gmail.com>
In-Reply-To: <a04706c7-3ac2-456c-8333-cf6a793fa6a8@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB0358:EE_|PNXP287MB4351:EE_
x-ms-office365-filtering-correlation-id: a380584d-efe0-46ec-5297-08de15432669
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|31052699007|39142699007|376014|1800799024|366016|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Qd3IQX9iyJaQcXJeX+ZtRZ2Kk2oWKPmEnA/GseQU8zTs4W+1OJkLwL1HxINY?=
 =?us-ascii?Q?t0ZbcpDz2U4Vj+Upu/UErjKS35cE3bR+Q9KSOCY4R8FgDfpcs8Lk8ul57eRM?=
 =?us-ascii?Q?u3rL2oBSHTymXQXaYC7+kj7Nms4zPD4e9WkYMJ9Bc+w3+IuagYrgpE1thpr7?=
 =?us-ascii?Q?odXHjFaOXhxMtPa/wI4SueEV3TQEamXtkNNZNBdBpE4zUj+v3TIDhVxuXgRN?=
 =?us-ascii?Q?78wPzuL96ab8WvcWP5fcGNMBM5FGAFs+SB0Sxxr8+T+yRQ3U9+AfmCJCG4ob?=
 =?us-ascii?Q?rGm9pNcYS8sCuOfLQUvkDrxW7czBNDlfY4/YrW5N4YUIKt0jJisKU8Li7xjN?=
 =?us-ascii?Q?Dp3QQgPSK451YuOIAuhqfTVUX4DRKWTAEWXhKwtPjXqTsUaBD1IOsVrQdpLB?=
 =?us-ascii?Q?yG2Xoot0mLFm1KUcQfe3hxgIltY4hHbb37BbxkXvvZ0bYk1QJQgZexNfgx/t?=
 =?us-ascii?Q?gZa9r8w/PD/R/L4Ql1a9sG/CPdpYUrafATPLvtx5gKVvsURNeiEvLQZzZWAc?=
 =?us-ascii?Q?P7sbwXKpYKjoY0DY7FaOmWjF4eNxxj8EbSD7GCSzfNhgSz4apNSA9MsNnL3d?=
 =?us-ascii?Q?XACQHic7NNAnLj/Cw4OCq1CxOJ1qxJqG+evrchLB90cHGjjs6bkoHf65Y80U?=
 =?us-ascii?Q?0X9fRRiIRwjUzFgCGfA9eSbpDhT3bb4QigRoLYcaL+NWfGt12NKP2CBnI/Ff?=
 =?us-ascii?Q?GyYbsMhDxiGQBVHwv5vFlXc7Iy5MI5/G4b46oFrMFtwXdJCd/6LxNj9+GuNH?=
 =?us-ascii?Q?z3xSdsNr7dfLLmcvYNuCd78ij08JHivoyjGAvUP9Jrq2uDmGv0fMHeeBei6F?=
 =?us-ascii?Q?vaA+FU+Py4msKM5M/tNPwmxG7CjT5dWXwCRtwheiF5pGU0URT4UF3S+SCBsy?=
 =?us-ascii?Q?r26jB4a7CIDqNny/IQ2ikI74ATMtlVyCuqaRJ6CBNwivJ7PJ2NcnuoYlyvw7?=
 =?us-ascii?Q?AuNkof4Bn3Pi8mw84pILS9TkGaM6OafmA7/c6/jIdqpGUJVECA+ageYnvcr8?=
 =?us-ascii?Q?j+W4DSdPKEs0HDRNkwTb4iS1X1ldgppp3CwAbnEFWIH9gUyKejPSqLin0Qwc?=
 =?us-ascii?Q?Z827RL0DQJDEhWb5+iE9YDgSdFy8JK1awc050JHx+WB5cp4x/XRBQbCIDdPX?=
 =?us-ascii?Q?ZA3FZanUI9VtmV/0+uYWKrpdYIEmruYAaHWy6CQS78pl5XIDhMDmzrBYUTp8?=
 =?us-ascii?Q?UTBT+hbNxyvY/IWM3Igs5XkA9fe0//AQopL/5j6X+VCcSdNKSnaNWcxFZ48M?=
 =?us-ascii?Q?JXVA2BB03TS79WdEZvjO9aExroiXotDAlct8I5rEu8fR0I5mbx657vp/ydfR?=
 =?us-ascii?Q?txpe8ZUzEHUBhJWNm5bXvclYFzKUza9EmIuU+V+p6nRtKWRT1QVwh4uO/XSy?=
 =?us-ascii?Q?ZInuv42+p0mxsgI+ZuvXGSEEjf9PqFsEKeFKqV4/H9WXKXKUBvmD72OzHVnS?=
 =?us-ascii?Q?K6RnBXWGcx8SBm9GbHB4xXUzXjpGbdWt486RGSKoVQHAz+7Zobr/YWPwYB8r?=
 =?us-ascii?Q?zcYpGniVOci6jrwV9FZ5bgTsSsIqrgEDi8PM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(31052699007)(39142699007)(376014)(1800799024)(366016)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K+36Y5HwtMbWPZ3ivJor4XbQ6TfD/lLva2UdE63qTqlTfvjarP3KqnHd5EeB?=
 =?us-ascii?Q?v620sZtv0jlDdfKjJyasF3CtPRC64MTkDaZqKfAhTNAwi3qFWioIMGNtpFNv?=
 =?us-ascii?Q?1vKYLag8HLTQ0cRMEdm+CYGTEKc8bSiAeWllNekt36sSpSCMQ5PqacdsWuy0?=
 =?us-ascii?Q?7Lls2oyEiCtFAbUbijXq/OigYY9TfI0VYSmex/6I4A9P0Ax0P44ZpVpLtJgY?=
 =?us-ascii?Q?m7GcZsJE4KPUXfR4Ol35BwIFhYvJOIJrKwCKF0Zf/U2vKdNSHN5jHpP2ipAf?=
 =?us-ascii?Q?KyljVZvQDEwT7QgOt8jAAdip17ZNdBkFMvUbU8Ixg6YygcIZmbcaAGnlqFxW?=
 =?us-ascii?Q?0QA4oIQvENsSOR2GqSn1hBG+Mpd+Gx8jtn0Vs3YPzV6YdbbUJGOfhM27jPeS?=
 =?us-ascii?Q?97Q62J5f3c1H1IZ3RyhFktUo2/AsSFbbyBuT2OZEBNFakV+xO9Th9aFYFBVx?=
 =?us-ascii?Q?8jqvyhxqKcIhUZTN2+UGDZCa4AWZUJ0om3CQXnGz6kspZrRm4vcVtorkpebu?=
 =?us-ascii?Q?LstK6k86cAK5QGaWWEgW20lO/aAq0G3pl4EsjdbSCrY4QpAnMDdsu+0SNZwF?=
 =?us-ascii?Q?W1pvLWjUpqx6H4GrBSFZprVYDqXIylpjzq/utwP3cpPAzHmFKRfGCV/Md/+0?=
 =?us-ascii?Q?d3sd/4qCOIPYXkzMhGqL4zmSFjt1b9BMDX9Xmpgb+6B/rmruYAxxrJgXiXPN?=
 =?us-ascii?Q?puYladn+4iQcX6eCY44HW5GugPVqoCWcDxwhT0r107J0XNQTYoavChRWddnJ?=
 =?us-ascii?Q?y1lIfjkhq8cVrqv2iC7zhpk6vpEFmCgxdZnIuCmMF1Hcw2qWxP8FiV1/7tHm?=
 =?us-ascii?Q?mnqdc73I5TKzs5znvG4I/9EwQZFXY4sgfxl2nD0ONFrooaaKbM8evI+roGYF?=
 =?us-ascii?Q?B6fkzPBDqs87Z5813BOa/HFoq5jjKT/bTXTALZA+dmgxxh3qAx7jueq/KHrX?=
 =?us-ascii?Q?56rhzQPf+kom75C3PpkHbmk/Kat3Z0pwr1YgjqQWX21O1sn4WKvH+cHonlzc?=
 =?us-ascii?Q?51jSRANX2dXGSGeS8NgnFTfgpwfOphpJR/x/T2Ojn1OMqzH9SSelciv3mcPN?=
 =?us-ascii?Q?52friXyrS5a2dYk5MDFhKyW1wj4T8mpoXJktzoM9j1VP7c87i4cZt/Xozknv?=
 =?us-ascii?Q?dZcbTgCqgcagWHHohGgt+np3bW7ac23YxAjxfyRRLeP08srRFGvIb074R5OI?=
 =?us-ascii?Q?YVbjofGmB2MMYRRKqF721a8I+19zJfeZv/evbOvPZda+h1r9sNejFZC2LIww?=
 =?us-ascii?Q?vpRPnjky/6DiLMjsmdU7R3J2jvpUaDm8GclRhq7lXx0iDbtXW8p3ZwP08b6z?=
 =?us-ascii?Q?z+pZkSvKE78na9mGETewRIfEZjgkipCMMGMkVNiQYEbcErZuDUuA32YJit7V?=
 =?us-ascii?Q?L5QTaBgBbmeGZrRm1dcWBf9GDEGHBNb7ET2cpMRi2IBnq8wKgCcKxeisUfm/?=
 =?us-ascii?Q?HP0igxWABCJlFsxfcNS41qgMreJhn92XITQ+FBRVvjTsK+YU7GhwzupI4Ti5?=
 =?us-ascii?Q?+Ucn9RoITkHihjpt3p+zNfVmLUQS39R6nCueXa1t2fSeQaNXmuE12gapqPzr?=
 =?us-ascii?Q?X98iSLE96AKQWWwWcnEtFZ3Knm6yJBBNz4xMmkLbo+pNLzvfO11I1AqM0deQ?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB0358EE8233269D72C41901E689FCAPN0P287MB0358INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a380584d-efe0-46ec-5297-08de15432669
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 10:25:28.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKxMoV5891thyQWbq6BlDMN8Mbo+rnzGP4s4NBGBuBqxhFqmh+vd4GeeWRONhBcuQrxelKUBliQZHwYiP0nk+02hrI92mmv/EmZWK7mkAKcFtLF11FFJ4SgD2nwdf/UM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4351
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 10:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121033

--_000_PN0P287MB0358EE8233269D72C41901E689FCAPN0P287MB0358INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure will add them in commit message.

Thanks ,
Ashish
________________________________
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: 27 October 2025 15:52
To: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>; openembedded-d=
evel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [scarthgap][PATCH] imagemagick: adds ptest for imagemagic=
k recipe

[You don't often get email from skandigraun@gmail.com. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On 10/27/25 11:18, AshishKumar Mishra via lists.openembedded.org wrote:
> Thanks Gyorgy Sarvari , for insight
> Will re-look at these suggestions and re-share the patch
>
> The problem with test cases in imagemagick were that it would require
> manual verification of files generated

I see. If the official testsuite requires human intervention, that
sounds like a good reason to me to do it your way only - could you
please include a note about this in the commit message?

> Example they require user to manually open the output file and then
> check if the drawing are proper or not .
>
> That i thought might not be usage for ptest , hence created an simple
> test which generates the source and then use that source for test
>
> Point-2 & Point-3 , i will work again on patch and share them shortly
>
> Thanks ,
> Ashish Kumar Mishra
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121031): https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fm=
essage%2F121031&data=3D05%7C02%7Cashishkumar.mishra%40bmwtechworks.in%7C496=
d7c58a2fc45b3155d08de1542b1d7%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C=
638971573369068551%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw=
LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s=
data=3DNUQ%2F5WeCok5vMKrfj%2BXtn0SMX1hRa%2FaQqujJl7mW7zQ%3D&reserved=3D0<ht=
tps://lists.openembedded.org/g/openembedded-devel/message/121031>
> Mute This Topic: https://ind01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F115970043%2F6084445&data=3D05%7C0=
2%7Cashishkumar.mishra%40bmwtechworks.in%7C496d7c58a2fc45b3155d08de1542b1d7=
%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C638971573369103850%7CUnknown%=
7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI=
kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DCLOuOgXoFO91AgTciUaV9H=
MLe%2BLDLckp77nILxTBWiA%3D&reserved=3D0<https://lists.openembedded.org/mt/1=
15970043/6084445>
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&data=3D05%7=
C02%7Cashishkumar.mishra%40bmwtechworks.in%7C496d7c58a2fc45b3155d08de1542b1=
d7%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C638971573369134477%7CUnknow=
n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjhP21V3cr9beBJe6V25G=
PIb8LVSY6Eir%2FTdb6yjS5nk%3D&reserved=3D0<https://lists.openembedded.org/g/=
openembedded-devel/unsub> [skandigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_PN0P287MB0358EE8233269D72C41901E689FCAPN0P287MB0358INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sure will add them in commit message.<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks ,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Ashish&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gyorgy Sarvari &lt;sk=
andigraun@gmail.com&gt;<br>
<b>Sent:</b> 27 October 2025 15:52<br>
<b>To:</b> AshishKumar Mishra &lt;AshishKumar.Mishra@bmwtechworks.in&gt;; o=
penembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.opene=
mbedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [scarthgap][PATCH] imagemagick: adds ptest for ima=
gemagick recipe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from skandigraun@gmail.=
com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Caution: &quot;External email, be cautious especially with link(s), attachm=
ent(s) or QR code(s)&quot;.<br>
<br>
On 10/27/25 11:18, AshishKumar Mishra via lists.openembedded.org wrote:<br>
&gt; Thanks Gyorgy Sarvari , for insight<br>
&gt; Will re-look at these suggestions and re-share the patch<br>
&gt;<br>
&gt; The problem with test cases in imagemagick were that it would require<=
br>
&gt; manual verification of files generated<br>
<br>
I see. If the official testsuite requires human intervention, that<br>
sounds like a good reason to me to do it your way only - could you<br>
please include a note about this in the commit message?<br>
<br>
&gt; Example they require user to manually open the output file and then<br=
>
&gt; check if the drawing are proper or not .<br>
&gt;<br>
&gt; That i thought might not be usage for ptest , hence created an simple<=
br>
&gt; test which generates the source and then use that source for test<br>
&gt;<br>
&gt; Point-2 &amp; Point-3 , i will work again on patch and share them shor=
tly<br>
&gt;<br>
&gt; Thanks ,<br>
&gt; Ashish Kumar Mishra<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#121031): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/121031">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F121031&amp;data=3D05%7=
C02%7Cashishkumar.mishra%40bmwtechworks.in%7C496d7c58a2fc45b3155d08de1542b1=
d7%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C638971573369068551%7CUnknow=
n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DNUQ%2F5WeCok5vMK=
rfj%2BXtn0SMX1hRa%2FaQqujJl7mW7zQ%3D&amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11597004=
3/6084445">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F115970043%2F6084445&amp;data=3D05%7C02%7Cashishkumar=
.mishra%40bmwtechworks.in%7C496d7c58a2fc45b3155d08de1542b1d7%7C970fa6fd1031=
4cc68c56488f3c61cd05%7C0%7C0%7C638971573369103850%7CUnknown%7CTWFpbGZsb3d8e=
yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs=
IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DCLOuOgXoFO91AgTciUaV9HMLe%2BLDLck=
p77nILxTBWiA%3D&amp;reserved=3D0</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;data=3D05%7C02%7Cashis=
hkumar.mishra%40bmwtechworks.in%7C496d7c58a2fc45b3155d08de1542b1d7%7C970fa6=
fd10314cc68c56488f3c61cd05%7C0%7C0%7C638971573369134477%7CUnknown%7CTWFpbGZ=
sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTW=
FpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DjhP21V3cr9beBJe6V25GPIb8LVS=
Y6Eir%2FTdb6yjS5nk%3D&amp;reserved=3D0</a>
 [skandigraun@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN0P287MB0358EE8233269D72C41901E689FCAPN0P287MB0358INDP_--

