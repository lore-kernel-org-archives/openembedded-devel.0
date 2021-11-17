Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9224EC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:59:03 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.123])
 by mx.groups.io with SMTP id smtpd.web10.9034.1637164741106550540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=w30NJzxf;
 spf=pass (domain: skidata.com, ip: 40.107.14.123,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzBweunkwkRPJ2Cv+zYRelCNhKidA+6b8lnrSp26qS+cBIJl+L+qs8EdRYGH/HyOpd6xN1EvowxFmSChfNH8clMReMb9LeL0GekCZwGqBpxHMp2WhkcucI6kVL/NdxKe9MA9JiSpS8p0+w3nLR0WEauzIpnX0FSn6ERH8JRN7zKva1bzQ3tcZStwZbyaW56Fam8X4whIT4+Wc5cZmcEcPWZMM0i9GjfwPw/mTUb4cQ6UuC12g6eZZaIpkFLJNkKuao4pOSdxU6BLofjbr5oVnQ8gZTBypcRubiVEDY5u2I0tne20Cl4pYbxlBP+ya2AnlS78/BC3QEQT4dGd5Dducg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBeUS1dPv0IKPKf6PZUXfiNvrjD3B7e6ndN5byB6Huw=;
 b=LbPARxCVlpblI7Sz/0LDT50hKRN0r288eoz3kwcHlYj2FacuJHNY7vMAznRGNGgjoobj3tbUASA7p4P2Tprn7EaVlx2GJI1iv7V/+iof/WGYCYG0GFMTqrtNlcH8wX2/HSA1gkq8cLldtqKd4M/5RznWOmd1Zhe0sUR6Gkdw5CFixMm1PGK/MtJCaMK9b3ab6jGNCAXCiJ4mPwrPeOqHzqQA8bgee2yuHYGFglUG6C8GRNPUdWVRHfaqgijsb5zV93x5FbtOQV2fr7SmO3mEGTT9+SmbLffE7FUTtqb8BBf7WZDk8lrtLaL/Tb0kkaNyVXnGsrlYWxzSHaHZ9z9cKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBeUS1dPv0IKPKf6PZUXfiNvrjD3B7e6ndN5byB6Huw=;
 b=w30NJzxfnzUwvybT5MfDnuaK/wHgFPqOe9Hd0hpUdkLp0hBMvb67BTDpC41jaxCf99/RwmIoBYrJApPqaCWPCo+R5ZxJb3AYV4oUpxrXX63crC63Si314aWcVURqQxd9kUEWPYSZZJVUCGQQCbQHHavMQcRrica0LLA+Oug/09c38faD3lsMieq6kb2p9KJ0BaKLUg4dZSp9nKq0cHmgVobZ4foSyWTcayZTrF8jUhlhPesu3NVEbRbogeS6GjokRi03uT8wh+8T3ROcpSQifqJZyyNFsS+pD11dUwGFwsasttAiwLPL3Mg1uojLUeosZaf+nlJA7q7BUcL7LLbAhw==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR0502MB3982.eurprd05.prod.outlook.com (2603:10a6:803:24::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 15:58:58 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 15:58:58 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "akash.hadke@kpit.com" <akash.hadke@kpit.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][dunfell][PATCH v2] xerces-j: Whitelisted
 CVE-2018-2799
Thread-Topic: [oe] [meta-java][dunfell][PATCH v2] xerces-j: Whitelisted
 CVE-2018-2799
Thread-Index: AQHX2JXgoR/acC7jqkWK9OgxuPj/Y6wH5uKA
Date: Wed, 17 Nov 2021 15:58:57 +0000
Message-ID: <YZUmwTszmK7mnFoa@ltleri2>
References: <20210811113227.31942-1-jainsaloni0918@gmail.com>
 <21195.1636811626386711470@lists.openembedded.org>
In-Reply-To: <21195.1636811626386711470@lists.openembedded.org>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63377405-32e0-40ce-b154-08d9a9e32a33
x-ms-traffictypediagnostic: VI1PR0502MB3982:
x-microsoft-antispam-prvs: 
 <VI1PR0502MB398254360CF2B9B21AC43217F09A9@VI1PR0502MB3982.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pe0/Xz7dlGmjvBeznmplpYPRggB4fkxMEyZlUcx7/I8GjrXKoNKnRXtGXEdNJvHdEA8/hKf9ugmWlNKYFaAVc8jQXs3n406GFZlql/69rFPvUvzpWUTPIs7/Q8H4kPeKPNrNv3NwCtVj9qga1yAS1mNjVCl9KEQ8+7QgeTI4fHCPkaNClmb4GOagSS976tbTZopaCKwG4ufLno1g3UZ8F/KiZpi+afXRfjYE2j5He6a/AGJw5vC+iYB6KVTaPNsm9uUc6bfBubDIINUVGZrOCzeltNLN4weYfv3pI9cf+ZzE2iS+47iQ9AQdurZ5XtgmtYbeGxTfZO2ar551e4+rcfCsOG++ujeL64x1288sb+z7Qc16P9nMXZUqF6X/JAG0XzexgOMzAlNXBHrW0Wy+hP4DZyioVGNJXbBWWd+d8TvweLkHZgIGedKouqdgS703Ros2vqctcb3bTpmLmdv6kZ7eMQeJuFfx9PMVhGSqDvtZ4JY+zCgwLMhRxEiUEAjMqCnx+XAp5gT561DSkAQ39lsWBehx5mZWvd5kHmfW10+tBpOlLoQ+aS/vboPkRAWXg4leaY6EV0mAO3dvSJPZj1nqzA7ME4oCV77pEStaMKYeiCx9M/LNid+e6Cwd+B8eYn/kmFFhV5vA4qgPhFWMoDKRuTUQ8zasobQ8ZtXHtGhJRmXHtk0DO93qUcQkY1+PYjJW5iudFIPthf0Rng7/6A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33716001)(2906002)(26005)(6916009)(86362001)(316002)(6506007)(558084003)(508600001)(83380400001)(4326008)(6512007)(9686003)(66476007)(8676002)(8936002)(71200400001)(122000001)(6486002)(66446008)(66946007)(91956017)(76116006)(38070700005)(38100700002)(64756008)(66556008)(186003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nxDxaZwuahYvdTmM3/F1J/dY/rzI/lvn4mztEXoboY8ARxr9iji7asz+qgrh?=
 =?us-ascii?Q?AiL6a3inwAe6XsmJyAQFUjaCcAD1QtZdVoC87H2e70+n57Y7EvsaZMaYBqvI?=
 =?us-ascii?Q?oiIpA8oz6BQAbRY6NerOlLMB7XRGSvQfSuOwypPH6NpUdPA5WLHyYPfNWRGw?=
 =?us-ascii?Q?ybFP6crL1eCw1O6cK3btY33zD2i/VN8uKIGRthuybLnqdzaOFP+QDjfdHW3Q?=
 =?us-ascii?Q?9DKkUw6572/1DlWXyJ7ktlTHHm46FQQtW62TTCc3RRvbBkTpb8yDVsZiPhFp?=
 =?us-ascii?Q?+Palww4TGXymoJbOLGLkXM9IKZgogDg7BJmBvYQBwfHt4N1mEtwc9O+feYx2?=
 =?us-ascii?Q?d2Iyoyw6EYy8+9kOTaJQ108t8mY5xkR+feRQsyUcNpC/3Ug5ZFLNlHL0TDWf?=
 =?us-ascii?Q?kwtb5bCQq1QeUxJfLmVu2i+6UzMG0aUB6/MwlfAvJggA0hSSw7TgPWC2+Io8?=
 =?us-ascii?Q?TUxByaQ8LlcsEaFxU6CxDd2y+zVjhHMyzv8lW1mJYRu8TZB8JjoNDLUMvDgv?=
 =?us-ascii?Q?0MiBuT0IOGRj5b2MYRlwiq5eU0Ej2mmyYXj//IBa5tvoRrsYAkh6In3AfwkO?=
 =?us-ascii?Q?cDwJ6buT/57aE2EGxJZEYrPoudqzRE9IscdOawzTdnM5vfTMmCkdepDB98Qo?=
 =?us-ascii?Q?/GblR2AJjEFEuDx/xnuh+BSx8ljT2KfHvCWKBFK/HJnqIDr7RJ0WGh4QZ5UO?=
 =?us-ascii?Q?dZJHqMnvElWSd4M/HvfDBeqvM6uToizBUcoJwoXZHG2g49WW9cqQbVaThCoI?=
 =?us-ascii?Q?OnNgJ/VxA3uJ0UrApD5PC1vI8oxzrYP+K3lWhf3dLvU39H0mUP2fiqQoyBy4?=
 =?us-ascii?Q?4jUt8ji37U3sxjqk4lgL27WbRz6cO5hFTjnK7weU+B4TNl1bLNhoIUnbVBvZ?=
 =?us-ascii?Q?Yxh+jixFlM7A4uX3UrHhiC4cQ8HphbimVICgMs2N7D6I0A2B7MWgogcH+wOc?=
 =?us-ascii?Q?l6toQCuHQKoCeuFzoBZ/4PM4I8bJmqv3JkRid/LDsQLjVE3qWHMDfh01Vhuq?=
 =?us-ascii?Q?xX1syXa40LlkTb5KjoZLTPJQQo3GbdeQFcR2Bnry+XIA5CavoHtW3iEO6Wb1?=
 =?us-ascii?Q?+eLgqpRZSq4jr3oxewwd7YEh1lLDFAM9JtfXLdBGqMOA1kWJmHvEZH1Nfiy5?=
 =?us-ascii?Q?rG4VevJmGAAHv3dIGyXzXkbEFxPaKZFCypeXwYPzJhrhDMYjRwiXUWiYEBBs?=
 =?us-ascii?Q?ajcFaRxjWX1KlW4IBf0oXe+7ofHm4si3grAcvtQjidd+JjXbqNJkiIPr9gIZ?=
 =?us-ascii?Q?gJThltLIr4Zn8vBKbnMo8njAVXbmmM930Zet9LjJdVZyeWnV+lO0E50tZ3AJ?=
 =?us-ascii?Q?P7r2Hi4eE2TEqX9PPCIRvWKEG04zTQ8i2a9tRvtdHqgW4u99fj0GLWxv/6sW?=
 =?us-ascii?Q?JgJ4kIlC3czvxxX5/dP1o+WvrsuI4IWMDq9Qszt7lM+KrR6Kh3PgN6Ch0xT7?=
 =?us-ascii?Q?QmU8zplsTBG4mT0Lm0rhrRgEpqOYqVsi0tXKt+rLA9YOCwpgDvS00TthALRZ?=
 =?us-ascii?Q?rEt1tCxC+thXDCfvaSgFu8wzgfQ656pVk941a+cP3CuYVq+nDSHUAcx0NYsB?=
 =?us-ascii?Q?irhpKmTmktlfrPSb1FntN5sZBfrGq7e91580bFGVIi2KxNPLMVNkbHLpW65Z?=
 =?us-ascii?Q?Nj/ubydCmX2fflp3mt09+Ngiu4k4JTMr77uIh7uCCczk+TO9V4nNJYKKNPGN?=
 =?us-ascii?Q?Z9l6sRMOma/9+/eEzpxkZDhrro0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89292992E085C44BA9AFF24C83BA5826@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63377405-32e0-40ce-b154-08d9a9e32a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 15:58:57.9162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +Ksd/uqgCBqfwrQu8h8HJq6Z/yMJqP4zIKeqUQtCN6p8DtZ+42iAdve82ayvsRsc1qFseoysLIcuCM8SModjHl6q25bid1TiXrPF6cs/qFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3982
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 15:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94000

Hi Akash,

On Sat, Nov 13, 2021 at 05:53:46AM -0800, akash hadke via lists.openembedde=
d.org wrote:
> Hi,
>=20
> Is there any update on this? Is it going to integrate into dunfell?

Thanks for the reminder.
It seems my CI script missed the final push.

I'm sorry!

Everything should be up2date now.

regards;rl=

