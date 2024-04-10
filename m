Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EDECD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 11:39:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.121])
 by mx.groups.io with SMTP id smtpd.web10.163523.1712749182221113926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 04:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bgKOS5Rx;
 spf=pass (domain: axis.com, ip: 40.107.7.121, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV5SOpmGr7amEjqXeGJPLVaVtLihVHkw8nU4f1zOOSAL91LQr5ebOKzGGcpEEl7D3dTvPJ5OavJ5Bn3SWAxwmx8Go7v2BRG3PHT41uo/WAzKjUIwdOJHhj9Wim5azCsRAgtGCPuGPZ54rEavZ16kB2imqwh8iP1UXwMLE2NWqsLP+ht21J1APpP/EENtJ1egCIE1dME4sojNhOFS58yEAn0UUvQUhLYll5N/TTLsPlIZeXguejNbbCy/YKmK+nuXPTLEBsOiYkaMBZ2nNgJeCtqmKZO/2m9EgHr7uUTO3ooadLJ5Y4KJAcdqHoJBLbKovBUZSMkpCAwRFM2Q8DqJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZczC5n6BvD+Z3XpEjclhsFzZBkaGN5Q+/Z7ss5/zW7U=;
 b=RheiCnltR8zIn/bJmmEdWKxo0BIHf63L1k22yjQROwbC2ezuKdbk0IanT25yAqXl18qM7Q+pJhvGGqK6y/JkEDHhGXRvpnnRRAg3XDesaM34ojYO+o/yeXGxjHHgaHzyqe76Lhzm+bFXcgnJNpX43J1ONUlA07wyaZUZ5mdmfKOmHaqjovYO+GuJzke2xfigg06+dS281mlgwPHkgvBk1cMiUSGh22OQ1KlyhmGAR5Qyu0BCb6ukqCSX6Vcnh7iIqvCnCIkhBq+LQqWXSkXZnpj1oGsvbBmyWopoeo/Yw9InYWGRzwxa/0QNcwozhAE2W85XchzcrZ4gjs5Eq9vNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZczC5n6BvD+Z3XpEjclhsFzZBkaGN5Q+/Z7ss5/zW7U=;
 b=bgKOS5Rx08v+CqXu8i1ALpKngFM63qnYAXN5Z7TuwTPFq68uYBD+m2NZLIoNECtkrCg6QqXMJawumMQT0pBcwUEPhFwSA2gjkp5lBGrHHiUZGPHSh8bJIl8t7r8PuoZOL1OkFC6ma+mm2kqSJlFM4VZb41QTrkFoBfErhnjkPfY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6062.eurprd02.prod.outlook.com (2603:10a6:800:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 11:39:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 11:39:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Maksim Perevozchikov <m.perevozchikov@yadro.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] nginx: Disable login for www user
Thread-Topic: [oe] [PATCH] nginx: Disable login for www user
Thread-Index: AQHaiYs5AFkKQA4k6Uy1cSB+e5siELFhTyLAgAAR2rA=
Date: Wed, 10 Apr 2024 11:39:38 +0000
Message-ID: 
 <DB5PR02MB10213B19468F641CAA564E2E1EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17C43F56512DABD8.16800@lists.openembedded.org>
 <2fa7a8e0b00040caa6f7ecb4537cbac3@yadro.com>
In-Reply-To: <2fa7a8e0b00040caa6f7ecb4537cbac3@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6062:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 A1n+dc2sFnMrgEIhLxp4/vf6Zw1e8Ll29TsQ5DEx/w1UZ7dV5AxuQuwV0JUb3mDmpZmtfoLD4pMyPRlkQyuRGeFInewvQSxbRBoSibC+L9To0NoWHMyAE+uFTdkSclR5+Oeku9mE0tCCUgrjrA8H6KKpfbmBuzFFjzOrDraUvA9d8gQWr5yd+AhVKwk5oikLnQjww4UqrR/GfI8h8bFi0BEDfcHpbdU6e8vHwKPUHc8rhoitceJIQ4eY0BdNpY0eUzKDSMb7lnmZaTvuCIVj7oesetpN6oLkEDPsYh0IRc4OkvwqQ5hcdufIUFTHAs8Fz9VZwXZODDTRgmhzDTaRhYx5mrY/wmMySMp/quInm4ji+Ha1CGC+x9JpL9vDgCA1PJG9Fdg7OerHIoJsOZWCdgr16wsEnI4j+8jWtDWfCKqYFdicKg1TccyT8UREjmFeQUMJOSIv1CyrxI4e28+Pezx0Z2y4jJ1qHod/wJZBi8z8dtQ7TS/FXgoxX2cd/T+qyTUHvO6YIVEiZ/K76f7JlouvTIaJouHC7dIDpPE49EDavqCQFtb0fOch3+gZ8WkiJJdtyFHgVvM7GVmKib55dB7nNjUI8iWeMSfPGrihV1XU+Z2tvMsKplQ/c6KKsNGchBfDIq1vuSwVx3b/b7oQze4BWObUq4b9hR3PhqzfHlk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5RGDaSnDPFtw5Mz8a/nufS0RI4JsF9K5ExnXi618GVKV4apfbgTIt1VTmsMc?=
 =?us-ascii?Q?VUb+Sc5B7TlBtC1OeNzG3gFd8LMZcCGvtfZ1GcIGQwlCadpqBxNLZv6mdZcR?=
 =?us-ascii?Q?Wubg1xK7qeWi0StQmos7Rl6a16KN3LsFK/OYKrIbF8SoGd49cNPRkRHKlsFD?=
 =?us-ascii?Q?oJG7I9rIzpWTw/5ACh3ufPdiQC5NCyvDhnLJO+GoZHjG7ydiFpsJt5dREsMV?=
 =?us-ascii?Q?ARGqzs3Gq+/gcNYY7eGAI1tp+MQAPyAlugP4KvK9yj3d6sFIGQg2e5bnvVtU?=
 =?us-ascii?Q?gaLNwiWSqymi++lV2+cAsP8KPbVRihv42hNKWxsHRdzUcNbplWVZomf7KaCL?=
 =?us-ascii?Q?Z8LGmh4CGRBItk9Dnp8YjOhn+5+94B8GaTDj8D9pyj8lHK8gmL9O0J4QSMQF?=
 =?us-ascii?Q?t+IqhZ/mwRw6QtPAZIwisxvUOGkfyJ+lpEIOPS8DhWo10HUSvfCoeowm/soY?=
 =?us-ascii?Q?qggCJGsp/hIHXlF8dBCeJ2dTlB9rcpvyodyKT+x7N1089+gQNE7J8kNugLH3?=
 =?us-ascii?Q?HeS7W6RxIZmRrfhci4oyv5trrIltl/OqfUXGiluhXC6MO4amMoI+n7qFu9ov?=
 =?us-ascii?Q?H7D/O/y0ZlLMDN5oX/1zijRMRhLsNuKRfnLlS+/Cwk+aR7l0zcGf654ixU2R?=
 =?us-ascii?Q?yRsBj3uUkfbTesxvbgyZ1YIWNhpf0TPHMA3hDYjgpoD1PJmv14b2kMdR/MDs?=
 =?us-ascii?Q?gSYXoo3lMHcHIlXu3bE5oD4v+VwPUaV2jwGxFQpiQGYRRRRWGOzok54nEJZu?=
 =?us-ascii?Q?7McUUm5DCNZpD1DudO7MgCJW54YofqNYVHj70poUvplu2Bj0HDVAHNBDQWU0?=
 =?us-ascii?Q?yJh7Xz7++qponhO69LKjdopP65zTSf+Tv/LQ3Y/f11EUYMaiP6PeYuGhStU7?=
 =?us-ascii?Q?WyyBBpzU6X+s8K2RwIcK/7YVercgD8PyhU1tMy3/VJ10+gK4CEYH5ROOAF3a?=
 =?us-ascii?Q?T97bSOJ5hEQOjeL8+khTzwU7FQqn4jISWAUXQielw+XRP/1wHB7ZWus4wBXo?=
 =?us-ascii?Q?sR8tYtLn0rcv+oczSjSvA5fd4/ctP2DD+ly1GinL2+AwBAcTe77xkO/NrkoP?=
 =?us-ascii?Q?l/maK0UYlfqLMXJwTX10dcG6Z6FFt4XA5++FQaZWg8+KQCWKlIXG6BS1uqNs?=
 =?us-ascii?Q?lQ0KwWxLUEOmY8puJUXC2vG5jlPoss54bamH5RjtItahnMzZ8E2prdd8loDg?=
 =?us-ascii?Q?EhQCEyTalWuu7XcoBJS6n7jN5m5aLZ3+ACAUCs8SMxs0d/2B1qAQt+z+3E6U?=
 =?us-ascii?Q?Yo/f85YUp5FigrFNwMSgx90uqt2veUndBcGz4S9fUqLuooxSvawlUePlKeFe?=
 =?us-ascii?Q?sybJDh1ZjGKBbwGuK4P+kyg23vmTWkLm6rg5WxfM0byAmUXHmHP+JLwOlJMb?=
 =?us-ascii?Q?mpetOmJYldaYRKW0pp529jvURF+0M0RLSUdH0yoVxT0InNEq3RGqgpU370gS?=
 =?us-ascii?Q?vGdCZsvYh+He6nyDN/MPDg82C1/mcrvdXTxpsSXonsdFrHR6TbFQCu/DVbw5?=
 =?us-ascii?Q?m40KuGxKKYCNhXncRoBhAlJ2WJPvkGxQmGDxHaEHaSIvtWSQrFQ3RV6eZl7F?=
 =?us-ascii?Q?grqSvZgNEdzOjNAj5+o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f5df2a-06ab-4617-d0ac-08dc5952e77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 11:39:38.5653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+bfp8QhK6m19mlHBSJb1yFqq3xkxBYKgpXQOUdkWURHmtD8jAtdFXPLStdG1ci4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 11:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109889

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Maksim Perevozchikov
> Sent: den 10 april 2024 12:25
> To: Maksim Perevozchikov <m.perevozchikov@yadro.com>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] nginx: Disable login for www user
>=20
> Hi Folks,
>=20
> I've found out that the patch has an issue. Should I issue the new patch
> or there is a way to fix the original one?

Amend the commit to contain the necessary changes, then create a new=20
version of the patch. Make sure to note that this the second version of=20
the patch. You can do this by adding -v2 as option to git format-patch.
It is also appreciated if you comment the patch with what has changed=20
compared to the previous version. You can do this by adding any relevant=20
information after the line with three dashes ("---").

//Peter

>=20
> Thanks for reply,
> Maxim
>=20
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Maksim Perevozchikov
> Sent: Monday, April 8, 2024 11:02 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maksim Perevozchikov <m.perevozchikov@yadro.com>
> Subject: [oe] [PATCH] nginx: Disable login for www user
>=20
> Signed-off-by: Maxim Perevozchikov <m.perevozchikov@yadro.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
> index f65c20971..439e28a8f 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -186,4 +186,5 @@ USERADD_PARAM:${PN} =3D " \
>      --system --no-create-home \
>      --home ${NGINX_WWWDIR} \
>      --groups www-data \
> -    --user-group ${NGINX_USER}"
> +    --user-group ${NGINX_USER} \
> +    --shell ${base_sbindir}/nologin"
> --
> 2.30.2


