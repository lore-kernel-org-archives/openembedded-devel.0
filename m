Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5702DC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:14:46 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.116])
 by mx.groups.io with SMTP id smtpd.web09.10142.1637169284161427877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=dRvi3WM0;
 spf=pass (domain: skidata.com, ip: 40.107.5.116,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrdbTkUXSdAxhT7CZyjMeRFBlfz8QFUMF4irZTBY5fnQEZ7D6tK+cohwDgFD2auOtHJwyk1l37bLWXYHf70eGngxUVEJBKv8o3S35kv1PyEIqSfEmYFA6tDJuwuF3JD0pZ7sYxIOxNslvRf2CD9dnZ6VvXvjotYh8+nX3HJpdEHNb/wp9Uh2eFB2hf673uaHEwQNJKYZ5VX+wp41Y6ZxpTrC+cVqELZZgO3NVez7rKbrUcTdsWZlesPiZMRgT0UKjYXS4Gmg4E8nJpjvAt4bggN+53IhL55MnlV9OjUAyaC0JmreOIgWQEyF5Pguw8nUHg5NGzXG6bKCGulk52RSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7wAv3RzJaanIH4KuI4sEZcMpUPO35OmET4ep1eiMQI=;
 b=fq6m8Gkx+LvmBfZs5grOgUNvKC+Uqs6LfstvvrkMg5vzsIr402Cy8OzGPcbXboEEtMpCvWM39lHxxIgM7bskfWtzgWvuYQTK5XkRwJl0r/S7OE9DLltrdE9Iz6otmq8TTzaojm4CPjWC1wHwD6m/YlE6p+HjH8rjHz4PU/qDUdgNWZXQr20k1wEqmwOPFK1UED6PZq0XzSthGk4hepCj7rjaQggMVzB7nlXqMgo2GJTWxNmwNY+cenRITPGjTnRZ56z0B8mV38/2NOKaVY+78sOKbtIkAL/9F/tqZP1IEkn2rEYbltCA34+J3Siax7bdGRga7ATd2oXeFYb8800LAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7wAv3RzJaanIH4KuI4sEZcMpUPO35OmET4ep1eiMQI=;
 b=dRvi3WM0szp43FBMqmVz2VhFfVhWCAn0gQK2U2KFfBML3e1iQVInojNmus87bM5jWNc9DGyl1quZKNOeaTC9Rd6VGvPgrnMEAus9CmSS+7VYgGxGrmhRhg+IZrGGx5/CHXyw9HsLHhXi48/vO2aCaEJNRXsiooRbAdYkngu3FuLCy+6FryIo29p6x1LUtHd4xRCwQkbMMNUViBs+kysXtjMyBDn5UTGEYC0nnU0vbNDgXFAA55NzU/TsqXQV+F2+DurCbvvXA4lY6yeVliRrdDFhTXTaGGaWT4O8pZYBn4JMtiiG8YWmWNttXwiPoK4eyr4L7XlFt35Y4Ev0hNDaXA==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR0501MB2414.eurprd05.prod.outlook.com (2603:10a6:800:67::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 17:14:41 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 17:14:41 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Thread-Topic: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Thread-Index: AQHXx1dQFO71uz5oX0itvpesgjmtHKwIEH+AgAAMvACAAAFMAA==
Date: Wed, 17 Nov 2021 17:14:40 +0000
Message-ID: <YZU4gC8iJXFaNrTd@ltleri2>
References: <20211022151212.268140-1-jbrunet@baylibre.com>
 <YZUsu/w5bRkoZdG4@ltleri2> <1jilwqpuzu.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jilwqpuzu.fsf@starbuckisacylon.baylibre.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f3d37ba-c537-4a71-0194-08d9a9edbe29
x-ms-traffictypediagnostic: VI1PR0501MB2414:
x-microsoft-antispam-prvs: 
 <VI1PR0501MB24144A5FCE86ECC02AEB6847F09A9@VI1PR0501MB2414.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xWAVn4fX+aiGqkPOwYZgEeXGbsKuVClWKlxp9GIPsbnXtMV8mj5XDC+yftWAYG6ohU7cPJK3etr7UK3ejWyNiCcUkzynjgLx67RIjsF2/UjvqYC7ai1z1JNCODkFRbxCoc7MYTcsN+zAic188J6WAgQ6mbP2baq+2Qia2WQAcWY0HlrKt1MhfzcUCo5FHHoChmBHAPyDBlVeQFtA3Ou0Ita7BbOpiLVzj+gnVmZYlpem0jUFq4kUAgvnBha7fRMv1Erhz+4TXYC6+tMeMILX4iXQw4+rAySqQ7jdBEbpBGwmbNpUNGoIWRYLFwCgP33iexpN22c1ocMY1eB5mB9zkcx2GHwRGLIr/YmiCfYOCsT5Fu2WY2Q69/sd/ubopL5P4KeiKkFnpv/a/FbAa+7GwrFggDRlsaMgqUpUKauOes2g1QPGa2+OthMrFEwObSSPoFMIeKxKxhOVhVn4Fh1pcSEWt18r1mHzCvZQGnZEIAEaNTJxjBPf6pucLKOgqnWBPh8Xxy0LSDHqxcY6hKtyetUJmpHATlcGxI97YfNuz+B6i9YmOvjyt6eYU7vbgns1USXvOWEmocHIKbcrwYEhkEhXyMg43WezPvUzHymXboHlh740E8YXupOduy0RO7XRFbNzzAIApPz1N1hv3aJyhimx1TtJUFie2qFdaUJHJ10QdQBeOuA+0UpdLMNvkLrI2WyJx/bQ6W/PTmxQEDsEzg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66946007)(508600001)(66476007)(2906002)(66556008)(64756008)(66446008)(6486002)(91956017)(4326008)(5660300002)(33716001)(26005)(8676002)(8936002)(6506007)(38070700005)(186003)(76116006)(38100700002)(122000001)(71200400001)(316002)(6916009)(9686003)(4744005)(86362001)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pXCXJUr9CozVOS2RUBEcZCKKYtjxQs9Y/81e9C6VC3GUB9gJKmCWB7ii5KPH?=
 =?us-ascii?Q?kwkGHrUufK6Db8R0jl5iFK0NyXg2NkZOkuvsXhmGjgVhop5pOJqgFNTKi6Lw?=
 =?us-ascii?Q?3CraCn7TJgLcaSn9nYtLHx8qrXg8RGF3a2ls4jteLQqeA7B9E/RRXVPMfaP1?=
 =?us-ascii?Q?SjJzxXFgDpeKg0hnQ025Yv/Twun5adDpUA5YNU3I5Ho3BkHvKQfZBX3vuSRk?=
 =?us-ascii?Q?gmFi/OjkIaQVbJgdrS8vMoUYuH26WWOzU0aS0Y2QpqzcWOh1JDxVPIU6tuy6?=
 =?us-ascii?Q?iOoGfByNxhLawxeq/ImYR89E/0oCY1GpwX0hXppY0tgi61F2P+d761rui/ix?=
 =?us-ascii?Q?GJkjn7EFzEWZdvPrCtWsHgPvGKRS/jPpac8zK6M8IEQv6xTHI86yLUfSaG00?=
 =?us-ascii?Q?9ZXXNtADhBQtoEIEYAQuKe5L+FQ1L4EoaUGLHa3AKIs8yMIKyzJEQy5KYb0h?=
 =?us-ascii?Q?AXsz5QBYZPcOMO8g9LMBFKASCcEiuje9PDk0v8wggK9+f/nkwZ2zjsO2rUfM?=
 =?us-ascii?Q?zlaJygDtROH8aES9T4g769H4L3Kj/AivvAe6HKkQlvnHXKQCS6YCp/vQd+ox?=
 =?us-ascii?Q?6z8Q0NrNaFbWGepbdcLAa+TZiLP1FMgfzKowA9Jwx9UCgF4T2/udM6bT54vS?=
 =?us-ascii?Q?cRMS/a5Wwwdxo1O8b/WpvC0X7+aSMnzpqA7lYu+Jo6d+2EtM3EZbRS07/PCz?=
 =?us-ascii?Q?f8WRm3hLXi/uhW4a4QoRK7Ynbxay8q6I7y16miWlPUqsbH4R0qIZvfOi8oP7?=
 =?us-ascii?Q?hx9waGwMhyUkaxUltUx1GghsOGT00wqIABKvov3C73CRVvs+CyKb88hbH8Rl?=
 =?us-ascii?Q?l97bjQNSfE+y5wQdmvGcsol46OBsyD+7axYVZgkWTb3YB90yV3pO+UZ0KW7G?=
 =?us-ascii?Q?dwskAFQ9n8lxlhZtBlzn639ytS2i1FDz0vWLS0cmX+VPVyzfZmhxJCnunbEZ?=
 =?us-ascii?Q?hrhcl6qgnpaqTnaXpXvjW9OZ/Ah+IxyxmmWlQJsAnHaOs+F8ZwsKQq8upST2?=
 =?us-ascii?Q?sQwO2jwf/aOw3biWhuQoAake2o6xmEH9EvZtw9l11fg1JnIPl9bjKXKdhkdK?=
 =?us-ascii?Q?NznKg4cVJtwlQZOHRTQwyyZVqxnfqx0FFm9+rIwM9ceT9h0c/zsuoJM28fsh?=
 =?us-ascii?Q?F9GUqaDP6FU5+1mJPC/ADozZKBN3FbBzocj8gJu/fHVyC7eT9guI1UZg8Vjh?=
 =?us-ascii?Q?TEBbrPcbpsfCNpM6XAlx9zhY3hxa1WJGnHDlOj6EwPLYlQcAnQfinkBthalZ?=
 =?us-ascii?Q?JbdXLB5E6ryKUT7OY3qC3haP29J+DwxtBtR5VsPWl3Nq75/SS39gGX0duF+F?=
 =?us-ascii?Q?45CnjTmAxepiFAB2xWay+ndMVIKXN58AFjo1XJxopxSOIzjiGjTqfjCsKJBB?=
 =?us-ascii?Q?waNwRXpl0xvz0fY4VboldRMqq45sWiZINUfGZrqvzTh2bD/VwpSinVumf5NZ?=
 =?us-ascii?Q?Dx7MGdQgsjiy07NLHO6lkPC3Oi6nv2MPjkxTeZ5A9zSVoZdmNV4vdAVyC0TL?=
 =?us-ascii?Q?OX3K9Ac9Ae0Gr1ee/9OAjq6MbuTEHOmRuaAaavsK1KbiaSCday3yW/MANbSe?=
 =?us-ascii?Q?OPYsjwPvTfzh3PAC+e8P7B7ESSk8LGxBb7bhCQO+d4+QjG1LHk+ZVsV2j/Mv?=
 =?us-ascii?Q?zNk8uSkWKYIOpVioRM1flqv+6u31zJ3jLl2J12Hju7KDRSEylmyK0KA6xM4l?=
 =?us-ascii?Q?0ZM6cTw/4dTzLSHDtMxb441kT/Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04858CAE98CE1C4593E56C988912DFCB@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f3d37ba-c537-4a71-0194-08d9a9edbe29
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 17:14:40.9848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 o0z4H637I4oAZY+w2FdoaGZ7k7O435M8wrFGmmYJ/gRgOZIiXYBmSW4yYhI8eHWGTTq2ALUF740CyTxGQdrGIKptBXyPPYRAhqI7LmJ7DDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0501MB2414
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 17:14:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94008

On Wed, Nov 17, 2021 at 06:10:02PM +0100, Jerome Brunet wrote:
>=20
> On Wed 17 Nov 2021 at 16:24, Richard Leitner - SKIDATA <Richard.Leitner@s=
kidata.com> wrote:
>=20
> > Hi Jerome,
> >
> > thanks for the patch! I've just applied it to master-next and if everyt=
hing
> > goes well it will be merged to master after some testing.
> > If you want to see it backported to other branches please let me know!
>=20
> It would be great to have an hardknott branch and have it on it.
> Having an hardknott branch would help with override syntax change coming
> with honister

I've just created a hardknott branch with the same head as master. As
soon I've tested master-next I'll also add it to hardknott.

regards;rl=

