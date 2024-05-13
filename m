Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219C8C25B5F
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 07:07:28 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.54278.1715584042685282970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 00:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ii4MxOFn;
 spf=pass (domain: siemens.com, ip: 40.107.20.74, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwg0kvUVMt/eFQ0wnd9FjrdGRGxWTTQ99L1vcG6cpecypXMRNSKsLOOSuVli+AMQJCr8jZ5rebqXsK7rwnBuIBgSTNtmWwGUYn9WiMfpKyKUu5cQ5GvyMQQEJSqfEhV4VlRBZcYiauPJwSVb+IsiCkgCr2Bn8OLXKQWP+ecGEKCQRS1B14ASfOsAT6iKIXHDmwrkOgjjmzsspYY5RJXhNyC0XxlwnZh3HYpsy1HEHTKkr2TDgVa/1z/+zNnf/PD7wzamKkr6HMLRumeUX9cXe1FwcwRfFnv6ziU0225YJ+PoXIcPuw2Izzp5JfPQ8CDcHI4fM+QmfgCt/aTbiS/LoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpjE2veQp+Cf7hNwWB8K19n8uMNCT9ITDyns4TUcFHM=;
 b=jwB686qxAeWc+xS693eCGZdFEcdGgO/yuwDTBuYEibD6gwuFj5MnvQbjSvbfiI+tqP4klMzMS3GClWMJirg8w2/yF/ll1BgfQo+zrbOWkq5rRrMM0L5R3RlNZOm1aWwx70zedjewpfGzXoCdQVfKN+pihW3jelpZwWcxInL1tIoA0dkZCHW0NQNeEAiN0AcZ1z3CpcBfSmkQOtg5En/jL/d1Q0RWjKErJJvAfyHCBjL5buDMjA+5LpB4dWdeivqnDvBA8yVgCLh4hlNGv2909aCgnopu6VOG5yZOy36sHf6faFiLZPEM8OIi3uaQW+H9ZYOESnMLk5yeErfsH4+NjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpjE2veQp+Cf7hNwWB8K19n8uMNCT9ITDyns4TUcFHM=;
 b=Ii4MxOFnCmkoHdCSxRaZtCEQEwnez9Gu52N7nsiiIOomOSDr1zbb992kfk5coM1KY6m/iwRsXln9j7uETS6VS/dQF5R4Oo+MKLll2x2xObMm4T7lc2RtoTUGMtoYYglfcPTmEyaymvWGApGEFWhqsudbkJO98KNoayDsKpvMprFIVFypVdaHmG9gnqPHmr3Vmlx3s6VSZOwe0pYNUUnx6a1Y0gf4ck6oii7CWbr1g0+naNk3AVO8xGWNHQFdxw3ECzq4i6qh87yGIjF8B3bXoy+FXICQyTaxs2/auopRgbiVDuCaEYX9ZbRj6jsB7mIrzAvoe05R4zAMThgHX4ifNQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5619.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 07:07:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 07:07:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Topic: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Index: AQHaoTk+GH44EaHSxUm43hPKQLiNzbGTmeWAgAEqnwA=
Date: Mon, 13 May 2024 07:07:19 +0000
Message-ID: 
 <AS1PR10MB569796A83B44FB15E1C4DA9FFDE22@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240508111609.4157976-1-peter.marko@siemens.com>
 <DB5PR02MB102130DD69A5E5A8236BE2033EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102130DD69A5E5A8236BE2033EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=401b0dae-d2cc-47d0-9cfc-315b4b0ce5ab;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-13T07:02:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5619:EE_
x-ms-office365-filtering-correlation-id: ad7a7469-5531-4cee-592a-08dc731b5495
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?fPkTybK9tq2X4SlHqPy9JmY17eFXL2/9N65hKH6NRbpfsm/jhuHroVKE9Qsv?=
 =?us-ascii?Q?pVhut/uSFvJd5qgkDu0oDEe5LZZ71FRry+7ylj2ekh4VClZCy1rPEGKIHNW4?=
 =?us-ascii?Q?1nt4NoWqPl19uU1q4T5AzHfSoh7AxIPsLEXk1EV/AHzS1D+r7Hi8vU8sjvjH?=
 =?us-ascii?Q?o11L4M9yIQ2fgR4qv0uRK9NJAm/6yhw87NwT8WQ4iuUUUSlM9eLoL+0He+6F?=
 =?us-ascii?Q?jSoorrmOJ8pojo4BHH/YwoaPZqqYJOf/7zae37BibDM1oaqHoufV80v6kls1?=
 =?us-ascii?Q?Sk+pPUsrb4D4BdVOH4T9tsBCM/9rPlP/1iCBbrUNX90GdstcHg5PBACxmwa0?=
 =?us-ascii?Q?WvNwjAOQhsRuxliWhaVHtNcfYVLKn2wDQrA3WjNlUv8DTdTqO0gHNB2an4D/?=
 =?us-ascii?Q?B19REm3PtAdVcKGqOmsk6C91Mt0QgwM3z4pfoxcDYOfmpMBdeYbBeBG/iP5p?=
 =?us-ascii?Q?dyPM33FDm7XHeank6FT3T1DmN+h49PJVEnEwkw8S/2qqo/fv7Bjws/Nj70GT?=
 =?us-ascii?Q?+yFhylTAroZb0ciascv6pzpoX7W14N2huiEHOGq2Ri0XwFcB+m8E8DUovfzE?=
 =?us-ascii?Q?/aomADMsVZvmKqMgf7WPO+3pOpGZ1M54tJM16LZyyjgS8c5ICJHhvghc+gWq?=
 =?us-ascii?Q?VI9gqsZst7hTS7y61LOdRgfHrx9GiqUunf6dhaMz5vARlgmefTbSMIs4IT/A?=
 =?us-ascii?Q?/JTpW0j0jvAmJGU09aO1W0h0vymGovJbU1SZMSvsrCRlA6wUCG/UiT+aRhVn?=
 =?us-ascii?Q?GmQ5lkk/kLCMKtBkwuj8AuvaLQuVAxM4evE9TvThgdoiTSGUaLZVrUa3A9bm?=
 =?us-ascii?Q?aiuvzN76MyglRKOaCRgD2xnXIPsDXLj7xSVpPpOBZXxO5UNR25lt0sFWK3MO?=
 =?us-ascii?Q?0gmaMA4V3UIsUnbUZDqjE7nvu4C0BuOlhi1cLPeWbzPuDDGXLlJQim+5o03T?=
 =?us-ascii?Q?P/wtBfW7ukUroddwwR16vhl3kBgiST1q5yemkzDJ6eU+ia/mEfYGvHZd+F5e?=
 =?us-ascii?Q?T6gXczwlwGhf0dD+ww/9WO6IhbBdFYO35b4SYDkfNF+2k1y90lwkveXlv2m8?=
 =?us-ascii?Q?9O48HgU94NLmpqG3IY/aacXTOxen/AjeRfHjN0c1iFc4ScunHuh4pQjCv2HC?=
 =?us-ascii?Q?Jf2kHEpOrbROq7Wof/6BiGJT7dRFK8qCsbYHGb3hupnSD3LYNRq6UVxLknvl?=
 =?us-ascii?Q?59Qdyv/tttLd6ViRJP4LuPYPXkJZ786nGsq0JrWM/hLsy7gynOCP/hHom6Ym?=
 =?us-ascii?Q?S3CQCXO4oNSr5cLtDWAt0moX5bJgmn4DOVQjMG3rdZzXvGtppDOkGENa2yWS?=
 =?us-ascii?Q?4PVDGOplorUWQzYYFDMb+nuCBFYU5BdRJD2LhcL1yJbBlA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?f/btY/PrdE5unswqZ0HiFXWHuWMh8ARVrxZq/ZwhGoR6gtxKi6b4imo7OL9m?=
 =?us-ascii?Q?NXW6H9cw9+buAwczytYjjbm46lBD5Hr5DMoItUL+IiEoO0QLa7F/p9rDB9b2?=
 =?us-ascii?Q?4cPV742zEqRjZvj4ODdmHt62sfX+TDSzfumdJ5S93O+samnFYBgPKZkmIXz8?=
 =?us-ascii?Q?QYVzhepn15QnrJkOv8mpxu9DmM3uXBwvAAdNmPalJsUz/x82SkC5OM5bU1oO?=
 =?us-ascii?Q?faXNifkDWw1CoblQEz4Fp5aZYAEMBoApqXkyo4Jpc7dsLQfZ333xFLu47Q79?=
 =?us-ascii?Q?a/vqbzuk8e9dA44Se3AwN4RPW4KzfAYAD/gygIeKdu6OdSL2gIXx7lH6wBTy?=
 =?us-ascii?Q?4uNDIhCZ/AIIWksDB2IfqnY9eiUidCckTKCp8jPHMmlZjWkRlSIUH1OV65eU?=
 =?us-ascii?Q?i9ouspe3rnonk6IcK2Ox0CbNjw6O0vBrv18s+/RIGQW0ugt9zU3kn5BSPTQk?=
 =?us-ascii?Q?jHwYRclG/Ph7sD8oI2J4m6cMHOwWDX2Vfp5oB1s+mnRMLXVNwfhrOTKN/t9K?=
 =?us-ascii?Q?qjsbHI39zV4p+KEo8F6QaZ2uQcivEIEz/IdrUXI+VS0nZja6F84+a37V3G3V?=
 =?us-ascii?Q?YNloQB+K4ZjfshIn9yiCRhTiRpejU2EKGoulHVh5I5LbaF9kQcWv/94oIw8V?=
 =?us-ascii?Q?Mku0D7RfgHavYa3qXkXOYH6GR8NNFDFNyiY2Mg7vh5lsD/+ulvyV5ImdztYZ?=
 =?us-ascii?Q?x2bkFcmps0k4sSh9g9nY5LjP6d9pw1yruZOLTivajiCKnRIBtuZ0+429HbZW?=
 =?us-ascii?Q?QsRwM49/l9SBbX6GA9pN/r3imYALhg4muSMuuXNrd6FgaojL+pNznmuAOT1u?=
 =?us-ascii?Q?ccPn6CJr7UQASCP4qX99HNTadHqPOlbrOOLV9S0DHmC+AtVVmNTt300j+kFO?=
 =?us-ascii?Q?SoNd8/HjloRbSkUKPbXLt/KNorSP7bAxlv8c9ks6GPAoAW8HIQbW+hZAhRhb?=
 =?us-ascii?Q?LUIobsxrDOucxz2Fv3elFnxKwO8viISQqid5dm9Y+a1FD4bpdALr/wOtEgGp?=
 =?us-ascii?Q?QAPD4TvLxvk43LPLbdZUnHr9OJr0QcMsNaB6zM0Hc0R/V0Rpppfe1duDrTq7?=
 =?us-ascii?Q?9wSDTapVJGMmM1YlUmuY4rZufyLeDm0dJT1HvFISsxVxoIQTwUmKhmOCDHpF?=
 =?us-ascii?Q?EfMiQlQXLO61rbWOBtLqbOuM/CgMm7grOPZFb3ajIpufGhWeoY9pZV4Bn3p9?=
 =?us-ascii?Q?0fUYSJXITYaa6lXa0VGr2+MKBXGmXMlFI8dNG1OMLgl/3M29vKnCkRnxRQgv?=
 =?us-ascii?Q?ZJVKUgJh0dtKE00P2VSTKhWlrCxNe4y8KYgAOmGgeb7B1AT5qsPRstJexyMl?=
 =?us-ascii?Q?v49V0nxm7COKld5WFg2sbsnCrO11mCsYaspGQq2liryL6yYM0UUR/E1TeK7h?=
 =?us-ascii?Q?8tc51rzTUf1OS4K9f3rfoXpJSXda6WX2Y8u0oLk2y0sLvoqjMNGr6LETAtBs?=
 =?us-ascii?Q?+FmlI8wvL1CdZDlTM72rp065rQyMphn+/TC7jlb7g2tzuh9SOT1ToyMZH+6E?=
 =?us-ascii?Q?SoTi5xYixpb5rctGa5CeUA3icZbEQycDQD2JkuQc9xB2hYv1wPuqk9Ygflgb?=
 =?us-ascii?Q?UIaw1gYZallbfA+/ZtVEeDBa3/UIE1+fVvhEHzwk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7a7469-5531-4cee-592a-08dc731b5495
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 07:07:19.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaVBrgsLb+G7N6fmy9hFWE3kR7pZXVbUf8PvfWvV4zvNIrHaQEa2TQAq+I1Tr/xcnyqYD4A5Zto/Ovbh76pcdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5619
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 07:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110335

> >  # Don't include so files in dev package -FILES:${PN}-dev =3D=20
> > "${includedir} ${libdir}/cmake"
> > +FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig=
"
>
> This wouldn't be needed if FILES:${PN} wasn't set using FILES:${PN} =3D "=
${libdir}" earlier.
>
> A better way to achieve that *.so files are packaged in the base package =
is to do:
>
> SOLIBS =3D ".so*"
> FILES_SOLIBSDEV =3D ""
> INSANE_SKIP:${PN} +=3D "dev-so"
>

The patch is already merged, so I'm not sending a v2 anymore, but thanks fo=
r the hint for my future patches.
I wanted to do the least intrusive change as I don't understand why the sol=
ibsdev are needed in the main package.
And larger reworks usually trigger those kind of discussions which I was no=
t ready to answer.

Peter

