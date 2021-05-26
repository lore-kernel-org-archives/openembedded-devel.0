Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.73])
 by mx.groups.io with SMTP id smtpd.web11.1531.1622054757809558431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 11:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=RVENdusi;
 spf=pass (domain: kpit.com, ip: 40.107.139.73, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T06YWcu+7wUXheUmQjCXHAekxJT0SToUX9YwbA6oK4tL3OqkbnA3+LxwAZhuUJtdwsqSyhWxou8E8ZHF/5ZsUf2SR40CHvf0fl0IjSL8nAU941i/NpRKysf0L5w5c1RK8zMhlM+RL14B9TB1spy9gaq3nJ9J7NYUDJdteRfQz8mQ6FFwAoJevrUsYWtD3ab3T2ymJz43PxEBMUKZPuCvxAOaj2gT36IB/LZth8nxYnSz2yk9Quc6ot700G2GEO3Grkcvd28u846VzydWuPL9x+LVNdqRAQkdy8kMjtND04AddM5/IOu1InYmrIPXogjWyK9bimi2hAqRPWjB0R4+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExyyPn7gbsijRsFP85gt6gpXY/H9ydVW5uR2pcwS6vU=;
 b=h0jRcI9U1vzqx2didN34nqScYKMf8dgnXkNE5nuPo11f48nP8lO2Ytr0RBBF9m21v3oCxnLD/LY8dj6rYM9Wz/Lqt/ld9HPYjr1hRso9azf4buX6FZ8YNwpEIkKGYfw75+mS0md0f8Ol8YcCI1oU4nL3wzUlgp0Ikgj4HFTpNERGYp5AACzCvPC90WQMbNkvQXMmfM6eecLW3iN+KsYcqJvm+oD0dZfwU4GSX12mD9ezr6GAHnz2cpYP67Rbj4GThDG6ZqBCfeVFntIEYYB7MFmfEDKxEcrqURsvLR5FvL6Yh+Dd2wIrVdGn9J/KnfDTRHBUMZ3LBLqAh9MJBX0SNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExyyPn7gbsijRsFP85gt6gpXY/H9ydVW5uR2pcwS6vU=;
 b=RVENdusiafFh0nbWfXspGubCvW1KHU9gqshN2Aap+qaEsbdjuvd15gRaLjz/oy5ibhYM4UYzmlX7TzIN6cnCifBqkcjlMJ33wvGpS2BACSO6hvdY0Iy9514Ipt5HoVKKNPBTzCPgTYdB43aAtHkV2L7ViEa6XrJDxVTzdGE/bzA=
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PN0PR01MB5139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 18:45:50 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 18:45:49 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Thread-Topic: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package
 lib7z.so needed for fastboot
Thread-Index: AQHXUlUm8vJxs/F9nU6gRM2XI5Zjcqr2C3yAgAAOfZ4=
Date: Wed, 26 May 2021 18:45:49 +0000
Message-ID: 
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210526173229.553-1-Nisha.Parrakat@kpit.com>,<57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
In-Reply-To: <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2003:c0:f3b:b059:2045:540e:5c15:60e1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 399e3c4c-6e35-444d-1878-08d920767b5a
x-ms-traffictypediagnostic: PN0PR01MB5139:
x-microsoft-antispam-prvs: 
 <PN0PR01MB51390378BDCA85074BAAC9C0EE249@PN0PR01MB5139.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G79Ds5336Ks6h2nhWzdHPjDGF8EWodEJwFjQw8AbtdLQbongBtzEFvkzkDuZSdksAH8q3GfqRtvKgnWXCT1XVL41MtZjcJ0dlWipB72ZjrKMsO1fmftbRNwOTB0KZOc4VxiJ8VgDMStgAPneVT/nxLWDQ8j8nPz+NM3EJG3dzb6IBufAJNlm3aVctElzcjIHz7Na7OHj280w9EI0ts62Ed2/PBXEEfU/ByFIRER6DJtUtfJTEcdCXacWf0SuBGa7uYWbyYSQAITq4MoiuygWnevlQZh8nfvHHNc9ka54Uxlll6S+FDIURINMpbxIo0QttOsZ2XUJ/fHobWPnAULehyq3dgcRYOYrgQPIf1TWyDLupAIVqeSVb7Lq1AORs6YjKiBxL2G0wlBDpMW/Omw5ZMCbDpB0WAiwRreN1olWpSSixcb+Y/MHNlUoEwJOUEocVbqwEj7puqD15T6Af2zZhx1uaP5qX41IY1oHTpPpQz1GCTkpL42UTRj3Z2j/bIYrGFapFXVBf1gOwRXzIfBZ1prfeFyhy15N+2ePTERpnEbGvAk42d7uoUnF0ZkimeG94cWRuCVtpawav2D35RZdvMyDR3U72We0uBxvLriF7pFklTsPdZBTv7XKORWoTIJyd/gvAoREpTDGn+jgOqrDmYCdB4YiVmg7qOPy4CL2g1UP8v7AqN3gRT72n1hAEKI/wmX+zE3d/3dSJyyGb4bxgZGxosFNmSSsKuFWVBqvCAV/O3jf7Avr7inw0btHHoaEmwx7VPOYMsTK/4S1K7Mgeg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(19627405001)(2906002)(38100700002)(53546011)(186003)(66574015)(66556008)(64756008)(18265965003)(33656002)(91956017)(86362001)(66446008)(76116006)(498600001)(45080400002)(110136005)(66476007)(122000001)(83380400001)(8936002)(66946007)(5660300002)(8676002)(52536014)(7696005)(9686003)(71200400001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?APKQz3/X16j9aRX7zdwCTaOd88KDX8qMPOiY+O9d54YtUrwnkS+TJQNREF?=
 =?iso-8859-1?Q?HaN+VBRVwvYwd9E/6BdJ7TOpEZkeHosSmk6Vv44LdRMv4dl3gH25xp6Cmg?=
 =?iso-8859-1?Q?XVZiuEFF3/lWo9ob1gqoTl/kls5N+KJTz+5HkzOE26a5Izg4v3tFtKPZJm?=
 =?iso-8859-1?Q?6dnrVQoDoad5U5vCvj6cxJfnXcYVeUNnpChbAQG8V1OexRSyMjma2Vm8oe?=
 =?iso-8859-1?Q?TLptyKDRtTWYEvFzB/LCmsDgomx0n5y1aY5v+FmihkkkDeeyVz1iFXKoly?=
 =?iso-8859-1?Q?H+eS+FcMI+DQiRhJn1elc8s5jHC4ts6cp/Alm1LfGLMZq4N239Vay4gE9y?=
 =?iso-8859-1?Q?FNtTt4134N6dR9WuzL68Hgu2piP5bxDMzsIttkKtheLSd+mpUvW7wC1HYr?=
 =?iso-8859-1?Q?i2WaSkeU1kv+zT2GIUdm3m0kUtITD1wLumjQ8bqctCeb/4yLCeV4Dwk+NE?=
 =?iso-8859-1?Q?kr5H31mSwO7Xzkx9SCqXJYF12TM8gIZZI7lYM3It3J9uGZi0Hzl6F0hp2t?=
 =?iso-8859-1?Q?MYECqUtGVxTnIc4x/BqYwQbUbDwsC7ELqMh2jHH+LkuUaEI3ggsYLcSW0o?=
 =?iso-8859-1?Q?o9gXOJbv1mawz+NdYj105VR427FXurv6PZ9mV+ziI42N4rrMj6wYt/TRhD?=
 =?iso-8859-1?Q?HILmUjydwuAASFm3cxqdvxS0PQnbVC+7VnZwRcON1kSu8CRbIs65XDiWbb?=
 =?iso-8859-1?Q?VByPazZzYwHKHjbQ+VvJDQ6du10pMlD7uZSkBE7+hLGOFzi8nBn7/2noAc?=
 =?iso-8859-1?Q?HjH9xvmITooG40huEkKDI2PoLpSerKl2FaB5ehEYya/h7mAhf8uT3B7tN3?=
 =?iso-8859-1?Q?XD38Xc41EBtfe+Gyp3XwrV0cr8aPIEej+EygVSI6xmEzu4k2m9mixQ/SoA?=
 =?iso-8859-1?Q?oo9UX4XDCnT663ZRu1DFqhu2ASPp/KotkoWS5N4nMmo3XbzmdY21rKzmxw?=
 =?iso-8859-1?Q?0y9A20bEWjs3rdtqKlMuzQH2sjtNpM0YPBsqQL7dUjliSQkmzC0/l2hqgR?=
 =?iso-8859-1?Q?tS1Sao5AU5bpax9Q5NbAQgMqscm1F5GijeyRV5pPN/1EwUQQfgb95PnARX?=
 =?iso-8859-1?Q?l9MqiekX54uzlEfx2AZ789TsXSBFUmbqouG4tlMwsdqgfbgnohvV4WjEN0?=
 =?iso-8859-1?Q?uzE60O9jLc9De8ZBrKYLVEA8vUitgONv2pu5LYI1ViMJCq3Vjs15nbJ8ND?=
 =?iso-8859-1?Q?DFi5PjlaWgW0muW/qy/w5Ri53U1S3tdrpWTb+RohTAq9CONF53ARQaT480?=
 =?iso-8859-1?Q?DexKaR43Xri00LcCLa6um8SoONJJJwAbJ4TCZoTb/y4hPFvB5eXokFKAzB?=
 =?iso-8859-1?Q?tvTLWC9WHDc64Z1A5ngAu/bzf6tGweqz1AVD7h48Hl3ZEr4W9Pc8jLON+f?=
 =?iso-8859-1?Q?Yt/ZAsyA7yBOwiIztLaHO2sKwfYIxuS8CPOvPH/Y3OOjxh1B0iYhM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 399e3c4c-6e35-444d-1878-08d920767b5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 18:45:49.4440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A19l5XUpymI5mcYr6qGrj3c4qTl9owZ07LaK23LE0BY9aATtmx60DgDqzrjg2Q/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5139
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_PN0PR01MB52838F54DAB2752439C8C9BEEE249PN0PR01MB5283INDP_"

--_000_PN0PR01MB52838F54DAB2752439C8C9BEEE249PN0PR01MB5283INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi Khem,
It is rebased to master already. do you want me to upstream to master-next =
too ?

Regards,
Ms Nisha Parrakat
KPIT Technologies GmbH



________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org>
Sent: 26 May 2021 19:53
To: Nisha Parrakat <Nisha.Parrakat@kpit.com>; openembedded-devel@lists.open=
embedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib=
7z.so needed for fastboot

please rebase these patches on top of master or master-next and resend.

On 5/26/21 10:32 AM, Nisha Parrakat wrote:
> From: Nisha Parrakat <nisha.parrakat@kpit.com>
>
> a) use option 7z to build the lib7z.so library
> This is needed for android-tools for building fastboot
> from android-tools
>
> b) Packaged the lib7z.so and codec libraries as a part of this recipe
> Fastboot RDepends on it lib7z.so
>
> c) Fixed a C++17 forbidden error when lib7z.so is built
>
> fixes the below error
>
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'vi=
rtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT=
*)':
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of a=
n operand of type 'bool' in 'operator++' is forbidden in C++17
> |   308 |           numMethods++;
> |       |           ^~~~~~~~~~
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an=
 operand of type 'bool' in 'operator++' is forbidden in C++17
> |   318 |         numMethods++;
>
> Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> ---
>   ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++++++++++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
>   2 files changed, 44 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMetho=
ds_from_bool_to_unsigned.patch
>
> diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_=
bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMet=
hods_from_bool_to_unsigned.patch
> new file mode 100644
> index 000000000..edde52593
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to=
_unsigned.patch
> @@ -0,0 +1,25 @@
> +fixes the below error
> +
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'v=
irtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIAN=
T*)':
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of =
an operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   308 |           numMethods++;
> +|       |           ^~~~~~~~~~
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of a=
n operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   318 |         numMethods++;
> +
> +
> +use unsigned instead of bool
> +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> +
> +Upstream-Status: Pending
> +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.9974=
02701 +0000
> ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.6656=
04125 +0000
> +@@ -298,7 +298,7 @@
> +
> +       AString res;
> +
> +-      bool numMethods =3D 0;
> ++      unsigned numMethods =3D 0;
> +       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
> +       {
> +         if (methodMask & ((UInt32)1 << i
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/reci=
pes-extended/p7zip/p7zip_16.02.bb
> index 13479a90f..ada49114c 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fdownloads.sourceforge.net%2Fp7zip%2Fp7zip%2F%24&amp;=
data=3D04%7C01%7CNisha.Parrakat%40kpit.com%7C4007f511cd0b4b0d527b08d9206f39=
56%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637576484370502332%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DVGFDLma%2Bgwj5%2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%=
3D&amp;reserved=3D0{PV}/p7zip_${PV}_src_al
>              file://do_not_override_compiler_and_do_not_strip.patch \
>              file://CVE-2017-17969.patch \
>              file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
> +           file://change_numMethods_from_bool_to_unsigned.patch \
>              "
>
>   SRC_URI[md5sum] =3D "a0128d661cfe7cc8c121e73519c54fbf"
> @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D "5eb20ac0e2944f6cb9c2d51dd6c45=
18941c185347d4089ea89087ffdd6
>
>   S =3D "${WORKDIR}/${BPN}_${PV}"
>
> +do_compile_append() {
> +    oe_runmake 7z
> +}
> +FILES_${PN} +=3D "${libdir}/* ${bindir}/7z"
> +
> +FILES_SOLIBSDEV =3D ""
> +INSANE_SKIP_${PN} +=3D "dev-so"
> +
>   do_install() {
>          install -d ${D}${bindir}
> -       install -m 0755 ${S}/bin/* ${D}${bindir}
> +       install -d ${D}${bindir}/Codecs
> +       install -d ${D}${libdir}
> +       install -d ${D}${libdir}/Codecs
> +       install -m 0755 ${S}/bin/7za ${D}${bindir}
>          ln -s 7za ${D}${bindir}/7z
> +       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> +       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
>   }
>
> -BBCLASSEXTEND =3D "native"
> +RPROVIDES_${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
> +RPROVIDES_${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN0PR01MB52838F54DAB2752439C8C9BEEE249PN0PR01MB5283INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt">hi Khem,</span><br>
<span style=3D"margin:0px;font-size:12pt">It is rebased to master already. =
do you want me to upstream to master-next too ?</span><br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<font size=3D"2" face=3D"Calibri,Arial,Helvetica,sans-serif" color=3D"#0033=
66"><span style=3D"font-size:10pt"><font face=3D"Calibri,Arial,Helvetica,sa=
ns-serif"><font size=3D"1" face=3D"Tahoma"><span style=3D"font-size:13px">
<div style=3D"margin-top:0; margin-bottom:0"><font size=3D"2" face=3D"Calib=
ri,Arial,Helvetica,sans-serif">Regards,</font></div>
<div style=3D"margin-top:0; margin-bottom:0"><font size=3D"2" face=3D"Calib=
ri,Arial,Helvetica,sans-serif">Ms Nisha Parrakat<br>
</font></div>
<div style=3D"margin-top:0; margin-bottom:0"><font size=3D"2" face=3D"Calib=
ri,Arial,Helvetica,sans-serif">KPIT Technologies GmbH<br>
</font></div>
</span></font></font></span></font><br>
<br>
</div>
</div>
</div>
</div>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lists=
.openembedded.org&gt;<br>
<b>Sent:</b> 26 May 2021 19:53<br>
<b>To:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; openembedded-dev=
el@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and pack=
age lib7z.so needed for fastboot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">please rebase these patches on top of master or ma=
ster-next and resend.<br>
<br>
On 5/26/21 10:32 AM, Nisha Parrakat wrote:<br>
&gt; From: Nisha Parrakat &lt;nisha.parrakat@kpit.com&gt;<br>
&gt; <br>
&gt; a) use option 7z to build the lib7z.so library<br>
&gt; This is needed for android-tools for building fastboot<br>
&gt; from android-tools<br>
&gt; <br>
&gt; b) Packaged the lib7z.so and codec libraries as a part of this recipe<=
br>
&gt; Fastboot RDepends on it lib7z.so<br>
&gt; <br>
&gt; c) Fixed a C++17 forbidden error when lib7z.so is built<br>
&gt; <br>
&gt; fixes the below error<br>
&gt; <br>
&gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function =
'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARI=
ANT*)':<br>
&gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use o=
f an operand of type 'bool' in 'operator++' is forbidden in C++17<br>
&gt; |&nbsp;&nbsp; 308 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; numMethods++;<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~<br>
&gt; | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of=
 an operand of type 'bool' in 'operator++' is forbidden in C++17<br>
&gt; |&nbsp;&nbsp; 318 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nu=
mMethods++;<br>
&gt; <br>
&gt; Signed-off-by: Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 +++++++=
+++++++--<br>
&gt;&nbsp;&nbsp; 2 files changed, 44 insertions(+), 2 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-extended/p7zip/files/ch=
ange_numMethods_from_bool_to_unsigned.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_fr=
om_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_num=
Methods_from_bool_to_unsigned.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..edde52593<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool=
_to_unsigned.patch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +fixes the below error<br>
&gt; +<br>
&gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function=
 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVAR=
IANT*)':<br>
&gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use =
of an operand of type 'bool' in 'operator++' is forbidden in C++17<br>
&gt; +|&nbsp;&nbsp; 308 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; numMethods++;<br>
&gt; +|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~<br>
&gt; +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use o=
f an operand of type 'bool' in 'operator++' is forbidden in C++17<br>
&gt; +|&nbsp;&nbsp; 318 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n=
umMethods++;<br>
&gt; +<br>
&gt; +<br>
&gt; +use unsigned instead of bool<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 2021-05-20 10:51:56.997402701 +0000<br>
&gt; ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 2021-05-20 10:52:16.665604125 +0000<br>
&gt; +@@ -298,7 +298,7 @@<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AString res;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool numMethods =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned numMethods =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (unsigned i =3D 0; i &lt; AR=
RAY_SIZE(k_Methods); i++)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (methodMask &amp;=
 ((UInt32)1 &lt;&lt; i<br>
&gt; diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/r=
ecipes-extended/p7zip/p7zip_16.02.bb<br>
&gt; index 13479a90f..ada49114c 100644<br>
&gt; --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb<br>
&gt; +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb<br>
&gt; @@ -9,6 +9,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdownloads.sourceforge.net%2=
Fp7zip%2Fp7zip%2F%24&amp;amp;data=3D04%7C01%7CNisha.Parrakat%40kpit.com%7C4=
007f511cd0b4b0d527b08d9206f3956%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637576484370502332%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVGFDLma%2Bgwj5%=
2BsqrJlZRql2MDK4kKghHvq0FBP9pXP4%3D&amp;amp;reserved=3D0{PV}/p7zip_${PV}_sr=
c_al<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://do_not_override_compiler_and_do_not_strip.patch">=
file://do_not_override_compiler_and_do_not_strip.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2017-17969.patch">file://CVE-2017-17969.patch=
</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch">=
file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://change_numMethods_from_bool_to_unsigned.patch">file://change_num=
Methods_from_bool_to_unsigned.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;<br>
&gt; <br>
&gt;&nbsp;&nbsp; SRC_URI[md5sum] =3D &quot;a0128d661cfe7cc8c121e73519c54fbf=
&quot;<br>
&gt; @@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D &quot;5eb20ac0e2944f6cb9c2d=
51dd6c4518941c185347d4089ea89087ffdd6<br>
&gt; <br>
&gt;&nbsp;&nbsp; S =3D &quot;${WORKDIR}/${BPN}_${PV}&quot;<br>
&gt; <br>
&gt; +do_compile_append() {<br>
&gt; +&nbsp;&nbsp;&nbsp; oe_runmake 7z<br>
&gt; +}<br>
&gt; +FILES_${PN} +=3D &quot;${libdir}/* ${bindir}/7z&quot;<br>
&gt; +<br>
&gt; +FILES_SOLIBSDEV =3D &quot;&quot;<br>
&gt; +INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
&gt; +<br>
&gt;&nbsp;&nbsp; do_install() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}$=
{bindir}<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${S}/bin/* ${D}$=
{bindir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${bindir}/Codecs<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${libdir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${libdir}/Codecs<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${S}/bin/7za ${D=
}${bindir}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -s 7za ${D}${=
bindir}/7z<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${S}/bin/Codecs/=
* ${D}${libdir}/Codecs/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 0755 ${S}/bin/7z.so $=
{D}${libdir}/lib7z.so<br>
&gt;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; +RPROVIDES_${PN} +=3D &quot;lib7z.so()(64bit) 7z lib7z.so&quot;<br>
&gt; +RPROVIDES_${PN}-dev +=3D &quot;lib7z.so()(64bit) 7z lib7z.so&quot;<br=
>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt; <br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt; <br>
</div>
</span></font></div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN0PR01MB52838F54DAB2752439C8C9BEEE249PN0PR01MB5283INDP_--
