Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025E6C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:16:36 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web11.68047.1698318991646836726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 04:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=GjhN0A5b;
 spf=pass (domain: navimatix.de, ip: 40.107.7.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0mCJHlI2IyKAD0ltHJkGDDnA53BsVsvY2bBhdlvGzROgGW5eA7JBnsWrT37OLpP/wRK318oMcrBD+W4udE+ev9wbrOf1Um4JIzV1Byswn3UegRR4n5bHG/v/MIKZz0eQparUfGyXvFU+kyMi3X3XDh2aIrgdd5uIIGUcVwKmu45q/cHpL22ZT/SegPYCuwFoFsRWULWG/aXRCxWKlaX0KBsTMAxh+hrXyy/9FuiSQsJPTzmqGYjPa0WqVLP0BWX7bSBjRVvKnPDVNi4jnhtaDB2kH3VIFiRvreLAXttERFYzu6RjH1+5xevPnv/LMd3s5++8KGhynAziVrGm6KtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4ZM8NeAE3LUGwpd5O8bQYeJVw5IGKgE1+QFyVg/O0o=;
 b=j+nDhRyvYP2iRGn1dNuz0E/ll8oGaTlJcALDG+zISPg+YRbhKsuefB9C12ADUueCkFQp11BtF9l0ZF+/VXWj3qvgN/Ny/oG4pCnzE8+SEnUaeciriyMO/OMWP2jToogNc7hAIw17dmpHQ7rT7DrktOaQtGVkd2kFlnJ8OP6atJZ/Qmm64ujaZ56oP7lO0ZCWMDvOpRZ8NoE/o0Cz+PvrPFvVkjLdIorwnzYgE+ZuZzVPZpqHL7kUNF5MyiVJ67pCfcqJTu8FaWfBVewAG9ZZZ7QQs+40JTLzhU+3p5LMkr4UXLHo1qtYCDKiXTgfb4DtlAfAoToIfeRxm9OPVQ1xVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4ZM8NeAE3LUGwpd5O8bQYeJVw5IGKgE1+QFyVg/O0o=;
 b=GjhN0A5bG+LBwnvuYdYjm7JsSijQKZgBsymU3mz6ebiqhCG0gl/JXJln6mJkYhUrSH2CcRFYRmsFmdkt7aznIFEzq6UkY2v9AqJd2JW7eLUWcdOo0eeVEBfIk2blV/SpCbu0+MsuNWnrfSWJVoNMYjWaupyoq+aotxXW3vbmxX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PR3PR01MB6572.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:65::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 11:16:27 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 11:16:27 +0000
Message-ID: <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de>
Date: Thu, 26 Oct 2023 13:16:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
Content-Language: en-US, de-DE
To: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::15) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PR3PR01MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 0451f0d8-1689-476b-92bb-08dbd614fefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1g8DnGopkFAallSFHSVi4zw6ZMtIo1wzxR8S7Z46qkDXFOhO0goHtyE3X2vslU3W3XbDKMj9cnfapNNVs3BCuxoDrHbc67Er32pBHqgnKHwBkYjVo06NSSww1c9qBMVJI7R3HhFtfyzd9ae955f/qApSVOrSU+973ysn/fs+OzK9CN8rOPEMox5r/H2IqGhs0Qi8w7mJZicO2RItDh+OYjtaJUPjhLolmTeQgbCvxswkyOnS0Jx7reiGxUiehyDzu6IRp5VTn9iQ8xlgpi/NEjAwCPdJfNB2UljdJsNBajWXoJP53a+OzkGc6VQGM5sOYzEiw89wZxePMwNxDnP04K8GMsqn/R7a6LJg8AkmJXem0EQwV1S+6fXFDwqYhlZeX6Tfi8bUS15Ax/HvkZeV5s1orcWNANzRVBYktAyopb+yDcj0aYThsGUZm7TMEQBt++SC56Eh1RB42S0NegzXOqznZb8raW8YTWDUpRUx0QBiGym/aSpcn9RaPHxvDQKnYyIQp29qj36qX+TCMIvL7s9RKI5RDR0xXswBHSiT4V95WANlOamhy+4+VhdqUpC9MFrxRqfnZ9JwvJDOiiHzu+RBJxzbsW3d0l9uDZBNuek=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(53546011)(6506007)(6512007)(31686004)(66946007)(110136005)(2616005)(6486002)(478600001)(26005)(316002)(66476007)(66556008)(8676002)(8936002)(4326008)(41300700001)(5660300002)(2906002)(86362001)(36756003)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WvUd3n+1OEJiZ2CR4kXmO6Zo+XQ+6H05FMX7HUgviCaXDqHGVkLOueMcA5+Q?=
 =?us-ascii?Q?kUnpJXrACm7fLk5LWTLocZlijgo1G8vp1ypLR5yhaZCSIW3moAuvcmodB4OW?=
 =?us-ascii?Q?Hu3j/nAE4hDDAoDCKAey2rDl0Lu4Cd/ueKaRY6Ep3xrtuSvQTByfrjFmtxGi?=
 =?us-ascii?Q?1K0W7WQp5QOPoDkJ+jTW/cwKJYRl+rFehP8PyJN6HY20US+4vaBs69eWYRoH?=
 =?us-ascii?Q?RTlTsNxsKQAOUcu+44JlxJTPluSJO0EdFyi84+LnmExi+j1zXVmZG5Chhkpq?=
 =?us-ascii?Q?BBaf+a4F48Yb3z/5emLCaiqWlMUPnGEjxRMqmOYVpKOORbu9LCm9zwE8xE3r?=
 =?us-ascii?Q?Udt/qJpflKcJDCmmSzMutfjaMYJdTJBQrVmL6RFvrA+KaBnJsqSJnlvlQ19k?=
 =?us-ascii?Q?8QQfMA8mI4452ORfBaDa/12afsBzxMYpclNlvxKwD+E9ayCzzOXK7zYTJxuU?=
 =?us-ascii?Q?tMaDtS/r8D26WN7togNN94kfcb1X29sYANmuQTuac/BWy/+j5BCV5jHE+fvx?=
 =?us-ascii?Q?CWC6FUGP9Wv0WrQ4hMC+EuEvtF2YQU3lg5QdxFdoTs5RPheN/TAlM9mge5xg?=
 =?us-ascii?Q?0R7u/dOW+2fxERSoCunj4v8g44Oqzr8vDx09mv5LAb1740N2A85Eq/9UFcsa?=
 =?us-ascii?Q?4C4/6P1iNdDEZ3ACDxEpVsooeKRy/QkUwP8DNDahJWV4m8E6QojVxJwwUQXi?=
 =?us-ascii?Q?R3Cau7Go/QlVwZpcUGv5c3hFKGH5rbIqJWvxnexuESeSXD3DsTTRPWOmFQII?=
 =?us-ascii?Q?7FYnlR/OiLBzvcRRC92aaS2ea2zqPsMk6s/Yhd1KiLE5EGuVoXLLdqZeO004?=
 =?us-ascii?Q?YBO/uicz9rWb38LIMRjBnYg4l6C0nXM3rmZkd3xlRExslic/R7cr1ewbvnrL?=
 =?us-ascii?Q?vRhXa6FGQdr4aloAJaXMkb6JvuzcMgfeI84tNPRcg8UryZjvMi17N2aGCpcg?=
 =?us-ascii?Q?3tUDYK7wHcnp0EzFknyhxa8h2RIpMWNTtO+/V7CkRqohuN1rGLazhsVP66wO?=
 =?us-ascii?Q?AZwi0McVfQxDitAE1gQzAqQnVuPueWRlflAWr/vYOYU1nRM36YaAbKM202Q/?=
 =?us-ascii?Q?96TOUZdhodM+X9fMvhh7CAxfT2ln5ldlYssiFcOMcAEI/+24z4WuIH8aNgQH?=
 =?us-ascii?Q?hHJqvIpv1wfGaQlIw9sUOtKBykqiCHStv1XHp4GT3uRis2/6IBzl/8O56ekl?=
 =?us-ascii?Q?GUY4l4tK/25o21gqjr8dhi8wVFbpA0tl3MFaPPq2qQdXir07dbZut/oRY2A4?=
 =?us-ascii?Q?tPEVSTcK0pEow4PuRy4hgLlz4OLpyn6VgCPpPSRS6X57w/gUrnymWtW8lwWg?=
 =?us-ascii?Q?/K5I6xLG+HoSnYjyYF607/f/rL7vpdVuK/UF4Z+2/4Y/E7IFip4AXfCWiDTE?=
 =?us-ascii?Q?jAyPtO0CYszDoRhbvL8NDMjhIQxT242qUskFEBRsSX8qasClcVkB+qig92MV?=
 =?us-ascii?Q?bMPRiH0X6p/ipP6kfVPXBu5AJoWjwuNaNp/cseT0vPJ91aFA7rPr7N020vRH?=
 =?us-ascii?Q?UnOsK1TzvOMhvAu+C3UwSLj7p0452Q+l1/o9CIieUn/u43v9jwK+Sn3VrV/y?=
 =?us-ascii?Q?WYzQvoZilDey+UIGwUwy+5sdNZKpVhhRxKOeh9I20cWY5Q9rYBPJD3VB7zxg?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0451f0d8-1689-476b-92bb-08dbd614fefc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:16:27.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkfJQ3EIOWhh3mSfiuNYbGokV11/jIyUOMUfj3QuTn1gG1UzK33dp/tJtrUJn/aflhTLzJJZIFGUdF+Nm0v1tcCJBxJb8GbaC2eoxhOV4QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6572
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105741

On 26.10.23 10:34, Jose Quaresma wrote:
>=20
>=20
> Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu no
> dia quarta, 25/10/2023 =C3=A0(s) 18:18:
>=20
>     I wonder if something like below would help
>=20
>     diff --git
>     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     index 2cff48c39c3..6133721334c 100644
>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
>=20
>     =C2=A0do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>     openssl-native:do_populate_sysroot"
>     =C2=A0do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodul=
es"
>     -
>     +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sysroo=
t"
>=20
>=20
> This doesn't solve the problem because at compile time the openssl is
> already there on native sysroot

How about a patch like this:

```
diff --git i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb w=
/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0e420a25d9..182abd0233 100644
--- i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ w/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,6 +18,10 @@ RDEPENDS:${PN}-dev =3D ""
 DEPENDS +=3D "bc-native bison-native"
 DEPENDS +=3D "gmp-native"
=20
+BUILD_LDFLAGS =3D+ "-L /build/tmp/sysroots-components/x86_64/openssl-nativ=
e/usr/lib \
+       -Wl,-rpath-link,/build/tmp/sysroots-components/x86_64/openssl-nativ=
e/usr/lib \
+       -Wl,-rpath,/build/tmp/sysroots-components/x86_64/openssl-native/usr=
/lib"
+
 EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"=
 HOSTCPP=3D"${BUILD_CPP}""
 EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFL=
AGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
=20
```

Regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena =20
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


