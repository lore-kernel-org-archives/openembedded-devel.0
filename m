Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF23C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 03:58:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.118])
 by mx.groups.io with SMTP id smtpd.web08.28901.1658980719470259630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=CIl3WuVR;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.118,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWTfawLLusHBtbwPpyUfqMnb6cw9lUc+oRDNqdVlhK2VsO8kzZmQqCaoJjxSJniQMmhuWFVyiAHLsBoUd5CG3qRye70jK7m/gKSItYwIvuBP3Q2ofRzh2Emp5Z88HZuOHmWSMId37Pv7HzUw1Gj7tikwxA7YyLX9MYJPbxBkOC80zWMteE9m33kN3p/sLN7a2J1d8pjqd0X8L0iqfQffGFab0Z3wBpgbX7Fl87F/oFKl7P2HO9p6cTrB7fQK2zI2ohkpBM16ED1dVidbv4OP4hxmhaGn8L3r7FkaVRA6e5G/cSfw2LDwuLhhWcxt9ZskTwhdPBFmcpugBjlMlhhGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pjyxBqx7/BySHUK3xP4hcgP/9Sbhu19Ob/xy1I0EWU=;
 b=UbiJhzTlyG4TTLe9VO5UaKHeeMYfiUmDdg7uq7DkheH8gXqlhf132OonoAUQczdqVvcMnZuyvCCKHSNBLHv2z0lD7TMKlEQqlLsmFJTjQnV6J+8tfuF2CdcMbF8fEQ7ZKPogcd3PduwwZ+INIhS3UzkR7Rt3m+BLzpCvz1g62jFX//lIYgmlJTTPfLt2nwtG3C5v7M711J7JwwaxCSjTvApJktN6I0rNFSy7tnuaAqxGrzfp5wKSjTjzCHJY6TWTQEvHH56KQGEFtCysAt/vZRMrXiHcBviwfUBX9MHFqo25MAYJEbPjTC4eZZq+a7WXh7EO8Y/TY+uWMJn0A2dGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pjyxBqx7/BySHUK3xP4hcgP/9Sbhu19Ob/xy1I0EWU=;
 b=CIl3WuVRWz6vSaA6FxqwfvbmPmMP6JCzN60jiWU8wtQo3WkfKvuBa4Fh3mMa3QwQ/mc7uMbj4NGWPRUfhQazparKWJ4a+1YcrejaVpVIom6Hgdnp5BHSpI1SMEXvyQZoOJpUYp8qdCm9GCiQG2n/DTrJXJbAv0vV6TsJ/x4N/bY=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 AM0PR06MB5681.eurprd06.prod.outlook.com (2603:10a6:208:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Thu, 28 Jul
 2022 03:58:35 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 03:58:35 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v1] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
Thread-Topic: [oe] [meta-python][PATCH v1] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
Thread-Index: AQHYoZ2tVYB11kOsSUymoIxwZeXg6K2SUgyAgADXJUw=
Date: Thu, 28 Jul 2022 03:58:35 +0000
Message-ID: 
 <DB6PR06MB40086A55A20A27286BD49667BC969@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <20220727094550.2519009-1-johannes.schneider@leica-geosystems.com>
 <9b6e137e-0e05-21e1-4a28-646e5c805663@gmail.com>
In-Reply-To: <9b6e137e-0e05-21e1-4a28-646e5c805663@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 809b2eb7-b001-42e7-7e04-08da704d71fc
x-ms-traffictypediagnostic: AM0PR06MB5681:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qomu54Mb6upqBXPP2AYjbUI3kgA3HdVDJtfOcTk1uJ4yfCNju/j+fXo8gaas7QeZDRf28vyoYByHzU3+gs8Y/0jS4SdW5JscbjxqbSPnZpuDozlcJb3pksqq1kmPgIxnt95VjmPGJCE36/teVzM0pMe6K7oSA50AV/5DNKjzLQNC5jbmEBwmVrTJfeHOarJ5PNkEktXQu31sESt5B9r1nP0s4DSIzYUnJf/yvMLhyWkarAThYLjiBzLXCBHnWhyp+/aTiGFxG6aU7XMDYm2n+ZRfy3t19DNHo7jUJ0xGEqh4ON1XNEsseecPrQkWNoQTf6o64Dv75jFDIGiJvRjE2TlAyG5AozTxaUdlW6paWb2wBTc3420HRaeJ8mq4oJhLpZ/X9FCQ9BHiz25CWogEmUTS62f/H2/nnLDUfk97TZVxN20mez/DCCn4HQ7LZsa3zRUEPEwmoDuoxIpaQkCip6nhTFfxuJN4NsbP7hYd1bKNTL2ytQ9xWOqCizTtLbkTIPY4CxtLa2oTKZtw7vupYDFffQsUtvVhV6Xy5woptZrpQ+ZTQTQgfgVXpPcK2sU9JpwgRqlwl78mj0cgj6KNGhnrJCTSL2TP64RRANX/FXf2P7ip5/19+C15CyaPitG4eTPADVLDCidLm1YFbPtS8PXPC3DPzoeu7tzR3GcBUspAbpF5uFmwU8gQChXd/04A2mMIhmgAnItdA6yGHd8qM+vrQntHcA9jn1Odv02l3MY6A1j0lXJ8K+xmfSqnkPF30KE3eSlBQr8v2qGZHX5jo2XJEnYuPLWovNJ3LmpMyWnOUsKCWrI/gFQa0Y8u68CnTHOQ1wf+WRvjC3jGQpeK/w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(83380400001)(166002)(55016003)(186003)(122000001)(38070700005)(38100700002)(41300700001)(91956017)(26005)(7696005)(66446008)(64756008)(66476007)(66556008)(9686003)(66946007)(6506007)(76116006)(53546011)(316002)(966005)(478600001)(71200400001)(2906002)(45080400002)(8676002)(8936002)(52536014)(5660300002)(110136005)(86362001)(33656002)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?4BFLHxcG9JsKpXoS8noORZyU+fvTT2CKvNBMdEk54Xfk24kwmQFXPrVW?=
 =?Windows-1252?Q?3PZNjB9+MMnxVWWvR1S0KCxpKt9BH5SnXQDax6ClEf1/kxE4w9wbEPd/?=
 =?Windows-1252?Q?QDxkFr3nJZZQUH+B0VgiJ0kLe7zFXZtrGOhrQbqdeqYF2GhdrIUpl6m1?=
 =?Windows-1252?Q?iuVCFCaVP87FTANuXGJTlWJM3bIScSap7qreQYnuC1rICcJ0+fa5oCvb?=
 =?Windows-1252?Q?5oCjzRy+DbOPeT1gHUxX1AYNUBHA9nN7tqVtJL+/AOjC5PG33y1IceFz?=
 =?Windows-1252?Q?9Nlz75RtFov2DiJyWLBa+6BTFrUYLzk00LsH2BVFR2qaaRFs06zXmb4v?=
 =?Windows-1252?Q?gnm0gloOe8shvm3wud+Dhh4pa8Z0/dj0c4DBfKnwgq/y07ESCu1EBTBX?=
 =?Windows-1252?Q?zJjzWE+bSKqw3JG8Qxfa8YwazLhXJis4Hz77NcUoE5wE25ebtJGyP12/?=
 =?Windows-1252?Q?WR0VXmNXufxWoV5ruLD4aI96l+y405vD40tY8eZUJHSSEE7xYa2Rj+SZ?=
 =?Windows-1252?Q?fAb1PIwm0AHvg+5KDIMyyeQy9hEkUoppNCw9XPekJWJfoAljDPDCd0Zw?=
 =?Windows-1252?Q?jE7jicnzbsK8O6yBtLhS7Ho3R2xm8OYLIpUkYkJMWTXv/qJcJF3LRKaM?=
 =?Windows-1252?Q?Yg+FCQWAwKmgYZBn9ZXMeh+QFHs25CB3flKyhHwlmkHYCUFBmS1O4eBx?=
 =?Windows-1252?Q?246dL7ZBEiwxZY2aWKK0TucGVDjRppf50x/DmtTi//SsGi5RbWi6slLY?=
 =?Windows-1252?Q?xHuAre/ecXVaOURvX9u+uKw+LP017gwQrYteEevbTLdiHWfH2R4wErOc?=
 =?Windows-1252?Q?imHtuRJgl0NSTpN3IvbN7M8MyBXrL7ZckE3P/VBCbBZnZxQuFNcWNsMi?=
 =?Windows-1252?Q?Hw2V9iryVS6SxCZJsdFB5/yzbaMUFlYxsaN0jWTetzrWa/OIHXRLXhJG?=
 =?Windows-1252?Q?PlFrLW95NICizc0QBTkZ06Xor8Yd5SI0yLHYVm6vflE18h6v19TxoT6n?=
 =?Windows-1252?Q?WBFZ6adqkUpH7L6yuIyutn4nwD93Ol1xIfcXRAqOm1vCUFl03cYsaQeI?=
 =?Windows-1252?Q?vKdAviulp9YK1LokXEmjj6NOr/lNBEl4pf6We2/OsGbb+F+fE7MGjizi?=
 =?Windows-1252?Q?xRRPGpyblxo0eIvxrwd6EBxsA580Ng/XJdQ/QQv5qcJGlXyG9KnwUBAT?=
 =?Windows-1252?Q?iS9QVbj4jodoPBmLt9LveZSZGpa1yDUc+1vgAqpnf5EDRqwNtZ0daO2/?=
 =?Windows-1252?Q?hXmk8yyFSPv1hC2nBX8hDl5E7tBiw+IGn7oHcfr+0zmffL8pAUC1thNX?=
 =?Windows-1252?Q?lctP3H35G98M9zcWjl0NnmAvlVXmmEcI0qj9XFkw7uY4keZQuJoYH0ed?=
 =?Windows-1252?Q?/6zmD470NZ3qDjOOpR0luIzo+KwotvSLJ6F7ncFxieWoM+SFkmc/U5L/?=
 =?Windows-1252?Q?QSP9/R/UwwZtwW1iTRUT8EPhQFU4/TYpCijsevw/ZptGYPk9O1wQmXuP?=
 =?Windows-1252?Q?J//lkjRqTkWFTlGc18Hda0eFXRF3N0dSRikm7krKpCcWOUIiG9U9yYnb?=
 =?Windows-1252?Q?mqXUs/nvhTQlI5N2WOmd3SzGgJg5AS5MqgIuXZ8pWxidqP6Dd8ydmHLn?=
 =?Windows-1252?Q?ftUR833CJKbZKN8jtK6v++tFrpEQ2bj1fgEh/b3bb5h+VkBgCdFUGP+c?=
 =?Windows-1252?Q?oHvWxMgAryGpS9wSKICz3EQiCJkZgTAkqrRb1uDOsCe6x2IHfXUPpd06?=
 =?Windows-1252?Q?RbBs4/BTmSqU6GcAl4M=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB40086A55A20A27286BD49667BC969DB6PR06MB4008eurp_"
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 809b2eb7-b001-42e7-7e04-08da704d71fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 03:58:35.3043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zJDe+rn0AnK5pHk1T9PoRwNylpYYoUrD7pExX6J/S015hGtK55iwVyVDlHh41qQRv6sV2dfAl8UdUwiDKTUrVImb9zlckEkgxyb9pRvUuArEaRXVIfkrPkchG/Eu7Qu7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5681
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 03:58:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98031

--_000_DB6PR06MB40086A55A20A27286BD49667BC969DB6PR06MB4008eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>> -SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
>> -SRC_URI[sha256sum] =3D "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae=
8af6d9cd6458b9972"
>> +SRC_URI[md5sum] =3D "c8c7337d21a0e9a2e62d1708caf4bdbe"
>
>We dont need md5sums for SRC_URI anymore

ACK, removed with PATCH v2
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, July 27, 2022 17:07
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>; openembed=
ded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org=
>
Subject: Re: [oe] [meta-python][PATCH v1] python3-pystemd: Upgrade 0.8.0 ->=
 0.10.0:

[You don't often get email from raj.khem@gmail.com. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


On 7/27/22 5:45 AM, Johannes Schneider via lists.openembedded.org wrote:
> most important fix: version 0.8.0 errors out on dbus-lib interaction,
> which is fixed with the most recent commit
>
> 505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses
> 2d90700 pystemd: add copyright boilerplate to typing stubs
> 5b95888 pystemd: update branch name in github workflow
> 16817d2 Add type stub for pystemd.run
> 410fd77 (tag: v.0.9.0) update changelog for 0.9.0
> 71aae43 GetProcesses() - info about systemd version (#59)
> fcafd08 Also include .pxd and .pxi in the source distribution
> 475cd2f also support 3.9
> ea98275 some formatting options and start pystemd 0.9 development
> eb7d225 pystemd: update install instructions in README
> 6fdf2c8 Daily `arc lint --take BLACK`
> 50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>   .../{python3-pystemd_0.8.0.bb =3D> python3-pystemd_0.10.0.bb} | 6 +++--=
-
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =
=3D> python3-pystemd_0.10.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> index 0056a794f..0b8216e87 100644
> --- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> @@ -2,13 +2,13 @@ SUMMARY =3D "Python bindings for interacting with syste=
md over DBus"
>   LICENSE =3D "LGPL-2.1-only"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b364=
516c"
>
> -SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
> -SRC_URI[sha256sum] =3D "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8=
af6d9cd6458b9972"
> +SRC_URI[md5sum] =3D "c8c7337d21a0e9a2e62d1708caf4bdbe"

We dont need md5sums for SRC_URI anymore

> +SRC_URI[sha256sum] =3D "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7=
e29ec811fa2ae859"
>
>   DEPENDS =3D "systemd"
>   RDEPENDS:${PN} +=3D "python3-xml python3-pprint"
>   REQUIRED_DISTRO_FEATURES =3D "systemd"
>
> -inherit pypi setuptools3 features_check
> +inherit pypi setuptools3 features_check pkgconfig
>
>   BBCLASSEXTEND =3D "native"
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98002): https://eur02.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fme=
ssage%2F98002&amp;data=3D05%7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b=
16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C637945312763912507%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;sdata=3DA26xySR64VSMkPjX9L3YyGXZRHqU1lMNdv9w0MIsuXE%3D=
&amp;reserved=3D0
> Mute This Topic: https://eur02.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F92645896%2F1997914&amp;data=3D05%=
7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe549f=
6a%7C0%7C0%7C637945312764068765%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D0qKzT3SSdqjzzpHhsalnUiTPRtNeSvUw%2FIGUNx0Ll6E%3D&amp;reserved=3D0
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;data=3D=
05%7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe5=
49f6a%7C0%7C0%7C637945312764068765%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdat=
a=3DtFY4scyXlRdDTw5cGSya4%2FQYQQR84JbtWi187fk4naU%3D&amp;reserved=3D0 [raj.=
khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_DB6PR06MB40086A55A20A27286BD49667BC969DB6PR06MB4008eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<font size=3D"2"><span style=3D"font-size:11pt">&gt;&gt; -SRC_URI[md5sum] =
=3D &quot;f993739eca645749f18d4ccfd4a0fbf3&quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;cac2e42043ab28d43adf33dab493c6a3cf8a=
99794f824ae8af6d9cd6458b9972&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;c8c7337d21a0e9a2e62d1708caf4bdbe&quot;<=
br>
&gt;<br>
&gt;We dont need md5sums for SRC_URI anymore</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
ACK, removed with PATCH v2<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, July 27, 2022 17:07<br>
<b>To:</b> SCHNEIDER Johannes &lt;johannes.schneider@leica-geosystems.com&g=
t;; openembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.=
openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python][PATCH v1] python3-pystemd: Upgrade 0=
.8.0 -&gt; 0.10.0:</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from raj.khem@gmail.com=
. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.<br>
<br>
<br>
On 7/27/22 5:45 AM, Johannes Schneider via lists.openembedded.org wrote:<br=
>
&gt; most important fix: version 0.8.0 errors out on dbus-lib interaction,<=
br>
&gt; which is fixed with the most recent commit<br>
&gt;<br>
&gt; 505e2b5 (tag: v.0.10.0) add interactive_authorization options for buse=
s<br>
&gt; 2d90700 pystemd: add copyright boilerplate to typing stubs<br>
&gt; 5b95888 pystemd: update branch name in github workflow<br>
&gt; 16817d2 Add type stub for pystemd.run<br>
&gt; 410fd77 (tag: v.0.9.0) update changelog for 0.9.0<br>
&gt; 71aae43 GetProcesses() - info about systemd version (#59)<br>
&gt; fcafd08 Also include .pxd and .pxi in the source distribution<br>
&gt; 475cd2f also support 3.9<br>
&gt; ea98275 some formatting options and start pystemd 0.9 development<br>
&gt; eb7d225 pystemd: update install instructions in README<br>
&gt; 6fdf2c8 Daily `arc lint --take BLACK`<br>
&gt; 50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)<=
br>
&gt;<br>
&gt; Signed-off-by: Johannes Schneider &lt;johannes.schneider@leica-geosyst=
ems.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../{python3-pystemd_0.8.0.bb =3D&gt; python3-pystemd_0.10=
.0.bb} | 6 +++---<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&nbsp;&nbsp; rename meta-python/recipes-devtools/python/{python3-pystem=
d_0.8.0.bb =3D&gt; python3-pystemd_0.10.0.bb} (61%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0=
.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb<br>
&gt; similarity index 61%<br>
&gt; rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.=
bb<br>
&gt; rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.b=
b<br>
&gt; index 0056a794f..0b8216e87 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb<br=
>
&gt; @@ -2,13 +2,13 @@ SUMMARY =3D &quot;Python bindings for interacting wi=
th systemd over DBus&quot;<br>
&gt;&nbsp;&nbsp; LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=
=3D4fbd65380cdd255951079008b364516c">file://LICENSE;md5=3D4fbd65380cdd25595=
1079008b364516c</a>&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;f993739eca645749f18d4ccfd4a0fbf3&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;cac2e42043ab28d43adf33dab493c6a3cf8a9979=
4f824ae8af6d9cd6458b9972&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;c8c7337d21a0e9a2e62d1708caf4bdbe&quot;<br>
<br>
We dont need md5sums for SRC_URI anymore<br>
<br>
&gt; +SRC_URI[sha256sum] =3D &quot;d74a814bfda01085db1a8ad90be3cb27daf23a51=
ab6b03e7e29ec811fa2ae859&quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp; DEPENDS =3D &quot;systemd&quot;<br>
&gt;&nbsp;&nbsp; RDEPENDS:${PN} +=3D &quot;python3-xml python3-pprint&quot;=
<br>
&gt;&nbsp;&nbsp; REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
&gt;<br>
&gt; -inherit pypi setuptools3 features_check<br>
&gt; +inherit pypi setuptools3 features_check pkgconfig<br>
&gt;<br>
&gt;&nbsp;&nbsp; BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#98002): <a href=3D"https://eur02.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembed=
ded-devel%2Fmessage%2F98002&amp;amp;data=3D05%7C01%7C%7C2e5c717bdfee4581be8=
708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C6379453127639125=
07%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DA26xySR64VSMkPjX9L3YyGXZ=
RHqU1lMNdv9w0MIsuXE%3D&amp;amp;reserved=3D0">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F98002&amp;amp;data=3D0=
5%7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe54=
9f6a%7C0%7C0%7C637945312763912507%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;s=
data=3DA26xySR64VSMkPjX9L3YyGXZRHqU1lMNdv9w0MIsuXE%3D&amp;amp;reserved=3D0<=
/a><br>
&gt; Mute This Topic: <a href=3D"https://eur02.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fmt%2F92645896%2F1997914&=
amp;amp;data=3D05%7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f6=
4fe39f3e2db7fe549f6a%7C0%7C0%7C637945312764068765%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&amp;amp;sdata=3D0qKzT3SSdqjzzpHhsalnUiTPRtNeSvUw%2FIGUNx0Ll6E%3D&amp=
;amp;reserved=3D0">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F92645896%2F1997914&amp;amp;data=3D05%7C01%7C%7C2e5c7=
17bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C63=
7945312764068765%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D0qKzT3SSdq=
jzzpHhsalnUiTPRtNeSvUw%2FIGUNx0Ll6E%3D&amp;amp;reserved=3D0</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://eur02.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funs=
ub&amp;amp;data=3D05%7C01%7C%7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb=
8f64fe39f3e2db7fe549f6a%7C0%7C0%7C637945312764068765%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&amp;amp;sdata=3DtFY4scyXlRdDTw5cGSya4%2FQYQQR84JbtWi187fk4naU%3D&=
amp;amp;reserved=3D0">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;amp;data=3D05%7C01%7C%=
7C2e5c717bdfee4581be8708da6fe1c88b%7C1b16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7=
C0%7C637945312764068765%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DtFY=
4scyXlRdDTw5cGSya4%2FQYQQR84JbtWi187fk4naU%3D&amp;amp;reserved=3D0</a>
 [raj.khem@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB6PR06MB40086A55A20A27286BD49667BC969DB6PR06MB4008eurp_--

