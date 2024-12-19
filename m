Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D300E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:17:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web10.127080.1734607017024241016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=g0YG5lKD;
 spf=pass (domain: siemens.com, ip: 40.107.21.64, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaELZP0F3U/B1yh4ytCMbrCbC/Hu28h/91/pX40f9vCHgdDdHXtua44AEdNF8Ep8c336rx+G/TI9IlMpmErPeh+WjqIHrGkfASwxFUZVPigtf8/RY84pqekXT7bGE3Ui+hf4jrqSrvj9wge2uPhGIPoKC2tI+sGdbY+5d6HBlBB1WniQmg4z7C022oY4+Ztxd7PQZ+whaBNC4oT2wb82MkDhrexbocWMnChoqX58+TXyRQFueb4qW1JOEc1lgjQJOOcnrmRGjHvNtL+ntJSkF1B3GA5exlWW+z4HSNNRShmOSYwQnBSONUBi7UBIcGG6s+QOt0G9bh+JaoKYbbQAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktdp/OMc5sfJDEoyzKHlfBzSRzvBO20C1J7DMUE++Jc=;
 b=Tbz56VPhj959ydDYgpEdwPdAN/y7WjNeUEra1Ah8ExQ84shUUAWjNYNal6CrIvMfHmz08Z1qmzfOMhsHmCZyCjksJczlE1JVWRMe+YJ29SBBC+lnV3LhN46zgt9pY81SrVvX2DmZRDSM/x/3wCSop4JLiWI5TAg7FoFBpeMDBiYFDCwrYRDfNt4IJ6zkpNerk0X8W08+octdwesHTa2PGUEroPFF+N7xQ4n0JiodgsPdCTMCT68PJy2m9YbjBNKQdzAvdAMTVOuUx2kGWPX1X65bE6AZPoMJpYGSemg+b15xDzq7DlwVRFi+1XN48/O/8R1CXl22RBf/fhWy2RzOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ktdp/OMc5sfJDEoyzKHlfBzSRzvBO20C1J7DMUE++Jc=;
 b=g0YG5lKD84iUMR8s4X7J1FNNQKO9LtmDnOIQO0tB4xAaIsrglv2CwJxKjUqd5v8yJXIDedK2GRlHadCx/NxggCkUXKdPVxgC5XTH6CaMLWLF10pqt3mC98DR3xedC9lIpQCzsnVa5gYTF/4EeXVkSLuF2IQ2evxQzQqwDBssI1c1gn6L6lTQ8gMBaI2zjlZ5XoBKMyfbZL9+QRsy3X+FQCYUR/13fHVFr2kNINJPDRSxMLO75J9v+IkyhvZL8/VfyOQ7O21wh6vrO+ctWoGUiA8DKnH60YjccNAJAjt6XxoFiRWHdfubXXXdSWggDVGJii/EU+zYkxxDELhd6+Kk3A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB8335.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:238::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 11:16:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 11:16:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH V3 1/3] Use 7zip 2409 to replace p7zip 16.02
Thread-Topic: [oe] [PATCH V3 1/3] Use 7zip 2409 to replace p7zip 16.02
Thread-Index: AQHbUfrFDwhkPPtYUEipDwXP4fEerbLtaaSg
Date: Thu, 19 Dec 2024 11:16:50 +0000
Message-ID: 
 <AS1PR10MB56970FC2F2501CF87E509A52FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241219091404.113636-1-hongxu.jia@windriver.com>
 <20241219094524.3435317-1-hongxu.jia@windriver.com>
In-Reply-To: <20241219094524.3435317-1-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b432564f-d8fc-4341-b96c-da0dd7571166;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-19T11:11:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB8335:EE_
x-ms-office365-filtering-correlation-id: 967f6e66-58db-403d-c5cc-08dd201ea2d0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WSMvOb+ys0aYno/435Zsbdwygrvr33cFjAourZ/7JlFBB5bx8O/09dCW9CNw?=
 =?us-ascii?Q?g36KOitZxWEU3t5OMU8JrlETNc6fVHhcYmgDu7O7JqRMZtI/IaP9fi/kTIjq?=
 =?us-ascii?Q?iu3fEqhAWnaYnw6qxINQPLWMqXsvp/InmyIHpq9Rotx4qqmWlZhyFuCKUDJf?=
 =?us-ascii?Q?NmIm5jpqfgYG8z3uEik5yxktJvnYTTYB2zlzsIRqkThUDNHbjFfXU7CCpu6B?=
 =?us-ascii?Q?sojSEPoAeyuQpACPof7ocdLsrkAkM0C8wtuOnPR05UNoyQ8TXeft4kwR6R+w?=
 =?us-ascii?Q?R//teJqqLkIj7t5PniQ4TJ+SVa8WsRR8p4kT+//NPASlngg32T7udsPZ+jL9?=
 =?us-ascii?Q?uIFYfaYrO8/D/E1kdewsdZYRKp7QyNgcBePzTCIBsHRF+sg/BHf6sbFKrZZ5?=
 =?us-ascii?Q?L5QjarLQKw7u6uZMmphoMYbMeP1onjshxh7OgHojtbGOmI6OZDQE+r6HrUPp?=
 =?us-ascii?Q?zTOk0/l5xeRUE7ITF/T0bvi0v/umFM8e8ujitz5Aorh7UD7IQ+ZdfU+zU4AY?=
 =?us-ascii?Q?YqOileRzBN3HIxhAmR0FGHKA43VatuYlO8kOeynQp06otOw9iG0wp9ksFlxg?=
 =?us-ascii?Q?qI6ulv3cZzS8RDsJbE0YDFeWHcskPd6ExYS2Vh9FSiNqbm+3ofBGDkoegnD6?=
 =?us-ascii?Q?x0jmVnUD5QHbbwSKqkftHVGjPyN3DJ68adtxVWTzSfhznAoGZDp5+mZPOR0T?=
 =?us-ascii?Q?9fqADledclyxk8jjoG96f0EscHmpJmKpq7XxdpnPyEz24w/k4UQjBGFXa8mM?=
 =?us-ascii?Q?/DoX7gKr0fSvAHIB572Ip+iOohuNmt8yDNTIVVrOP0ezLf2OmAE9JqFUSAFO?=
 =?us-ascii?Q?V1fv+h+/TdxSq4BQaN/4X4/n+pHZw0GJajnKYVW9d3MKp2Oqn292t7bW4E16?=
 =?us-ascii?Q?J9WPqnEH+QYNWWWlTySYUGQgoVav0ZWTounxPJB/VUFtD5ZuQMNiPccJkIjE?=
 =?us-ascii?Q?BMWoKoHxUmHOtJvDYX2cNgieA5lK0RXhD65N6jIT8o1ip6LJlnvkHDKcZGX4?=
 =?us-ascii?Q?tmk564UEyyKag8Rvy0lOZ78VBVVvu/Gnnsaj5jWTAzT8ejGxPItCDVCS+P/U?=
 =?us-ascii?Q?UqdlAa0xRmB5q+AbtPs/qqg9T0JM7Pum3p4GVk9CPrWwTCMp7bBWDLhecjAV?=
 =?us-ascii?Q?rh/oxfK11JUiMw78fYysTiUxU48b1z6prJMrBMLigV5a5kOXeydxvDRkJxvv?=
 =?us-ascii?Q?NC1oPqBj1NPdV8Bv2JBT59sq2uRJNX0VIse3j4xY44kMUv6rp3gPEihn5Jqx?=
 =?us-ascii?Q?pqLyAn7S9EsEekNzi2kX/gWW2RDGLePRaO1l0oXaPGaih2E1VxV1Vai7zANb?=
 =?us-ascii?Q?InWvzpiWiIRYpiSm22g9zqY3zn8uXBrbuE2e6Hc5bkBYluJLI6o3npF2Gyai?=
 =?us-ascii?Q?ePO+k+i+EQJvsGgwsJdFC/BbTI86?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RBFGHfTykfFFpt2BQIxp686AY8nzr6Lw0e7bkEYsY6JqZSc2IlFPGCsubhgG?=
 =?us-ascii?Q?ZE/hOnmv6hUbQIxjxsezjpr8t40blah+9XM4L2KZlYj9L9Bf+1Rcou3Omz90?=
 =?us-ascii?Q?djvoiwZpGGONU6rdeOJTOsYRUKPHH5pwWyPyWyiEN0hI84TdXRolcod22+gc?=
 =?us-ascii?Q?iaOsI3/QzFrYMEcz47in6Bh9TrfvmtmDsqWR4hoh2i6TAjXj0xlPyg+VUCfG?=
 =?us-ascii?Q?GZhW/9ik3H92c6ArmoAxY+4OPozunz85vn8gdZVz3NkRFz7VlZy0wpqCyIPr?=
 =?us-ascii?Q?MRYxBWyp9II1Tl7M4PlZx9nZW+eMDPVF3hfjRKrIeySEDrsWwOC7MkQGbSNc?=
 =?us-ascii?Q?NdDRPZvglzZyGBlpCVFjF3Pt0DsNq9g4i/QLM4fX5iJ0vhoKKeb56cvxfSKg?=
 =?us-ascii?Q?bq3tde/GFy/s1hKMoEqe9s01+o4H+kAmXfFiK/XwDg7UYwzEacLvlxx/6bOs?=
 =?us-ascii?Q?mek0F8pZPftIa7EJv8MMsYQ5oaqRkQHt17OpZRL8Jwd3vIPokJuW1bZQ7KC0?=
 =?us-ascii?Q?qAtIcZQMjfcpWiQ9G0LiS5BEGjLJlA68Yekwu1XwwcZzYJ5iQ64HywhOCFPN?=
 =?us-ascii?Q?aqVDMl2CFJy3lGPJjhmparDusDlDmmgDy73n/ZbTYMv8LDfClrkhJT4JENET?=
 =?us-ascii?Q?wP01v5UcQdYR5oRyEOcyZucE+a6xkEzlmbqwBztNsObkbGpVaBFG5PEdaRZ9?=
 =?us-ascii?Q?4zuFmI6FWpSXZCVuzxM5anJ1+h/UFJwZ1ggc3OZqUPMrYXzyAzT6S5nBtL6M?=
 =?us-ascii?Q?ZFKv1oB6oX5S10c3O9AnThJykOU66COwSGRHLcU3hexVK4gJqXWrUoO+zKeX?=
 =?us-ascii?Q?BZh1gvewYJTRxP6hIdyFRwmOkNv33RFS7wWl6VgZGlYboCBMFcc9Cn8qqev1?=
 =?us-ascii?Q?DMAhKiEau3j4jG6pMRrAZI+wkRzJpZanymmF24ZBLjeDjoTVveRpcBM5G4e8?=
 =?us-ascii?Q?8n60w26+oxa1H3NeFcm+8n50JPOB2tMt5q2KF3O2lVJ9LTvaeruNl1+QNPiN?=
 =?us-ascii?Q?d/gi9+5NbAfjL4jfrhso3uxUEnMWl/HA0H8M28GPfvQtkblNBanxjtI0p+Og?=
 =?us-ascii?Q?cOCXuS4UaOJy+PEU2YWYuljmUoImpRZ9gdvtxhTwDn5YwyQsk5IclQGFOAw9?=
 =?us-ascii?Q?r2YnH5aci/mDqE0wZ9O++FjTpm+msdu8Mvx9A62skjg/7V73iUJiOOcZGLFn?=
 =?us-ascii?Q?p7y3/+9Z1TgkWuqKN6CrAxdyR+2yInY7HpS0BGfHS5XOdH73quJ8JqmcR553?=
 =?us-ascii?Q?RGwpNu7xlojbyUHHo4jKPKM7TCttZkqAd8JoPVF0NXJ/vnEZH6E4k9Fymb2p?=
 =?us-ascii?Q?Mc+4JD+AiBzYoInyi19swmcOCsNcgBWmdk0fYP6CLvMmlI5FCR4ML9Ka8t4O?=
 =?us-ascii?Q?83x2Cv/VwkXy5Hg9Nb/N7VtxeLeO0/6iT9RjFOEOMlmf2nouGYp4eUg/RRnU?=
 =?us-ascii?Q?WWmVCZ4u+oLDKVaTHYu/+aGfvowH84Gi1TknD5OREOZ7ReaLQMz05Pf82C/S?=
 =?us-ascii?Q?E7LLAhuJ0ZmaxSqlHX2mGNEAX9nbFSkYR6/qCi9dR1GYHvk8yEc5vWzTU5T3?=
 =?us-ascii?Q?gl89tTpQUDi37nG/SG3RvZAd94RE/0CDguqU4DoP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 967f6e66-58db-403d-c5cc-08dd201ea2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 11:16:50.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr3mbx2SqHlziww1uV/eX2SyIgtZuVF7uOzs0XeHydf+cBLbMtSgvAqOq2wLCbRPGScx7eK3H3PJNt56XQtM6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8335
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 11:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114394

Hello,

Thanks for this patch, it looks much better than the one which we have star=
ted
(and which is now obsolete and should be removed from master-next now)

I have following problems with this patch however:
- version needs to be 24.09, not 2409 (you can take SRC_URI hack from  our =
patch)
- where does the bash dependency come from? gpl-3 is not nice without a goo=
d explanation...

Regards,
  Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of hongxu via
> lists.openembedded.org
> Sent: Thursday, December 19, 2024 10:45
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH V3 1/3] Use 7zip 2409 to replace p7zip 16.02
>=20
> According to DOC/readme.txt [1]:
>=20
>     7-Zip and p7zip
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     Now there are two different ports of 7-Zip for Linux/macOS:
>=20
>     1) p7zip - another port of 7-Zip for Linux, made by an independent de=
veloper.
>        The latest version of p7zip now is 16.02, and that p7zip 16.02 is =
outdated now.
>        http://sourceforge.net/projects/p7zip/
>=20
>     2) 7-Zip for Linux/macOS - this package - it's new code with all chan=
ges from
> latest 7-Zip for Windows
>=20
> Add recipe 7-zip [2] to instead of recipe p7zip[3] in which the upstream =
is dead
> since 2016
>=20
> Drop obsolete patches
> - CVE-2016-9296.patch
> - CVE-2017-17969.patch
> - CVE-2018-5996.patch
> - change_numMethods_from_bool_to_unsigned.patch
> - 0001-Fix-two-buffer-overflow-vulnerabilities.patch
> - 0001-Fix-narrowing-errors-Wc-11-narrowing.patch
>=20
> License-Update: DOC/License.txt: Add BSD-2-Clause & BSD-3-Clause
> License-Update: DOC/copying.txt: newline differs
>=20
> The codec libraries was removed since 21.02 [4]
>=20
> Refer debian to compile 7-zip [5]
>=20
> Add link 7z.so to lib7z.so and create wrapper to command 7za 7zr 7z
> which required running with absolute path to link the library
>=20
> [1] https://salsa.debian.org/debian/7zip/-
> /blob/master/DOC/readme.txt?ref_type=3Dheads
> [2] https://sourceforge.net/projects/p7zip/
> [3] https://www.7-zip.org/
> [4] https://github.com/p7zip-
> project/p7zip/commit/6c6ed1eba9ff0c0ded9323600f1f3c686d6b6692
> [5] https://salsa.debian.org/debian/7zip/-/blob/master/debian/rules
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../p7zip_16.02.bb =3D> 7zip/7zip_2409.bb}      |  60 +++--
>  .../0001-support-yocto-cross-compiling.patch  |  51 ++++
>  ...Fix-narrowing-errors-Wc-11-narrowing.patch |  49 ----
>  .../p7zip/files/CVE-2016-9296.patch           |  27 ---
>  .../p7zip/files/CVE-2017-17969.patch          |  40 ---
>  .../p7zip/files/CVE-2018-5996.patch           | 227 ------------------
>  ...nge_numMethods_from_bool_to_unsigned.patch |  34 ---
>  ...t_override_compiler_and_do_not_strip.patch |  38 ---
>  8 files changed, 87 insertions(+), 439 deletions(-)
>  rename meta-oe/recipes-extended/{p7zip/p7zip_16.02.bb =3D>
> 7zip/7zip_2409.bb} (22%)
>  create mode 100644 meta-oe/recipes-extended/7zip/files/0001-support-yoct=
o-
> cross-compiling.patch
>  delete mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowi=
ng-
> errors-Wc-11-narrowing.patch
>  delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-
> 9296.patch
>  delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2017-
> 17969.patch
>  delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-
> 5996.patch
>  delete mode 100644 meta-oe/recipes-
> extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>  delete mode 100644 meta-oe/recipes-
> extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
>=20
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/reci=
pes-
> extended/7zip/7zip_2409.bb
> similarity index 22%
> rename from meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> rename to meta-oe/recipes-extended/7zip/7zip_2409.bb
> index 789819a5e..0db9148ef 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_2409.bb
> @@ -1,46 +1,58 @@
>  SUMMARY =3D "7-zip is a commandline utility handling 7z archives."
>  HOMEPAGE =3D "http://www.7-zip.org/"
> -LICENSE =3D "LGPL-2.1-or-later & unRAR"
> -LIC_FILES_CHKSUM =3D
> "file://DOC/copying.txt;md5=3D4fbd65380cdd255951079008b364516c \
> +LICENSE =3D "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Claus=
e"
> +LIC_FILES_CHKSUM =3D
> "file://DOC/copying.txt;md5=3Db0d181292c99cf9bb2ae9166dd3a0239 \
>=20
> file://DOC/unRarLicense.txt;md5=3D9c87ddde469ef94aed153b0951d088de \
> -                    file://DOC/License.txt;md5=3D879598edf1f54dddb6930d7=
581357f8b"
> -
> -SRC_URI =3D
> "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.t=
ar.bz
> 2 \
> -           file://do_not_override_compiler_and_do_not_strip.patch \
> -           file://CVE-2017-17969.patch \
> -           file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
> -           file://change_numMethods_from_bool_to_unsigned.patch \
> -           file://CVE-2018-5996.patch \
> -           file://CVE-2016-9296.patch \
> +                    file://DOC/License.txt;md5=3D8bfe22e0285a3043b61ea40=
8d234c55d"
> +
> +SRC_URI =3D "https://www.7-zip.org/a/7z${PV}-src.tar.xz \
> +           file://0001-support-yocto-cross-compiling.patch \
>             "
>=20
> -SRC_URI[sha256sum] =3D
> "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
> +SRC_URI[sha256sum] =3D
> "49c05169f49572c1128453579af1632a952409ced028259381dac30726b6133a"
> +
> +UPSTREAM_CHECK_URI =3D "https://www.7-zip.org/download.html"
>=20
> -UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/p7zip"
> -UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> +S =3D "${WORKDIR}/sources"
> +UNPACKDIR =3D "${S}"
>=20
> -S =3D "${WORKDIR}/${BPN}_${PV}"
> +# Support Yocto cross compiling
> +EXTRA_OEMAKE +=3D " \
> +    CXXFLAGS_EXTRA=3D'${CXXFLAGS}' \
> +    CFLAGS_BASE2=3D'${CFLAGS}' \
> +    LDFLAGS_STATIC_3=3D'${LDFLAGS}' \
> +"
>=20
> -do_compile:append() {
> -    oe_runmake 7z
> +do_compile() {
> +    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ../../cmpl_gcc.mak
> +    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ../../cmpl_gcc.mak
> +    oe_runmake -C CPP/7zip/UI/Console        -f ../../cmpl_gcc.mak
> +    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ../../cmpl_gcc.mak
> +    oe_runmake -C CPP/7zip/Bundles/Alone     -f ../../cmpl_gcc.mak
> +    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ../../cmpl_gcc.mak
>  }
>  FILES:${PN} +=3D "${libdir}/* ${bindir}/7z"
>=20
>  FILES_SOLIBSDEV =3D ""
>  INSANE_SKIP:${PN} +=3D "dev-so"
> +RDEPENDS:${PN} =3D "bash"
>=20
>  do_install() {
>  	install -d ${D}${bindir}
> -	install -d ${D}${bindir}/Codecs
> +	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/g/7za ${D}${bindir}
> +	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/g/7zr ${D}${bindir}
> +	install -m 0755 ${S}/CPP/7zip/UI/Console/b/g/7z ${D}${bindir}
> +	for bin in 7za 7zr 7z; do
> +		create_cmdline_wrapper ${D}${bindir}/$bin
> +	done
> +
>  	install -d ${D}${libdir}
> -	install -d ${D}${libdir}/Codecs
> -	install -m 0755 ${S}/bin/7za ${D}${bindir}
> -	ln -s 7za ${D}${bindir}/7z
> -	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> -	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
> +	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/g/7z.so
> ${D}${libdir}/lib7z.so
> +	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
>  }
>=20
> -RPROVIDES:${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
> +PROVIDES +=3D "p7zip"
> +RPROVIDES:${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so p7zip"
>  RPROVIDES:${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross=
-
> compiling.patch b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-
> cross-compiling.patch
> new file mode 100644
> index 000000000..32b698ecd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-
> compiling.patch
> @@ -0,0 +1,51 @@
> +From 80321060ff24edee11d9ead8e21e9168f52d1d44 Mon Sep 17 00:00:00
> 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 18 Dec 2024 16:38:11 +0800
> +Subject: [PATCH] support yocto cross compiling
> +
> +Remove -s from $LFLAGS_STRIP, do not strip binary to workaournd
> +Yocto build warning
> +...
> +WARNING: 7zip-native-24.09-r0 do_populate_sysroot: File 'tmp/work/x86_64=
-
> linux/
> +7zip-native/24.09/recipe-sysroot-native/usr/lib/7z.so' from 7zip-native =
was
> already stripped,
> +this will prevent future debugging!
> +...
> +
> +Apply CC, CXX from environments
> +
> +Upstream-Status: Inappropriate [Yocto specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + CPP/7zip/7zip_gcc.mak | 2 +-
> + CPP/7zip/var_gcc.mak  | 2 --
> + 2 files changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/CPP/7zip/7zip_gcc.mak b/CPP/7zip/7zip_gcc.mak
> +index fcb580a..74a15d9 100755
> +--- a/CPP/7zip/7zip_gcc.mak
> ++++ b/CPP/7zip/7zip_gcc.mak
> +@@ -45,7 +45,7 @@ CFLAGS_DEBUG =3D -g
> + else
>=20
> + CFLAGS_DEBUG =3D -DNDEBUG
>=20
> + ifneq ($(CC), $(CROSS_COMPILE)clang)
>=20
> +-LFLAGS_STRIP =3D -s
>=20
> ++LFLAGS_STRIP =3D
>=20
> + endif
>=20
> + endif
>=20
> +
>=20
> +diff --git a/CPP/7zip/var_gcc.mak b/CPP/7zip/var_gcc.mak
> +index 803c8de..48a7c09 100755
> +--- a/CPP/7zip/var_gcc.mak
> ++++ b/CPP/7zip/var_gcc.mak
> +@@ -6,7 +6,5 @@ IS_ARM64=3D
> + CROSS_COMPILE=3D
>=20
> + MY_ARCH=3D
>=20
> + USE_ASM=3D
>=20
> +-CC=3D$(CROSS_COMPILE)gcc
>=20
> +-CXX=3D$(CROSS_COMPILE)g++
>=20
> +
>=20
> + # -march=3Darmv8-a+crc+crypto
>=20
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-erro=
rs-Wc-
> 11-narrowing.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-
> narrowing-errors-Wc-11-narrowing.patch
> deleted file mode 100644
> index 1f08d1603..000000000
> --- a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-1=
1-
> narrowing.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 653674e11872465dd5edf1c1e8413ea813d7e086 Mon Sep 17 00:00:00
> 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 23 Apr 2018 23:07:21 -0700
> -Subject: [PATCH] Fix narrowing errors -Wc++11-narrowing
> -
> -Clang 6.x finds these errors
> -
> -    ../../../../CPP/Windows/ErrorMsg.cpp:24:10: error: case value evalua=
tes to -
> 2147024809, which cannot be narrowed to type 'DWORD' (aka 'unsigned int')=
 [-
> Wc++11-narrowing]
> -        case E_INVALIDARG          : txt =3D "E_INVALIDARG"; break ;
> -             ^
> -
> -HRESULT causes the macro to be parsed as a signed long, so we need to fo=
rce it
> -to be checked as an unsigned long instead.
> -
> -also reported here https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D2=
24930
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - CPP/Windows/ErrorMsg.cpp | 14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/CPP/Windows/ErrorMsg.cpp b/CPP/Windows/ErrorMsg.cpp
> -index 99684ae..78a64ba 100644
> ---- a/CPP/Windows/ErrorMsg.cpp
> -+++ b/CPP/Windows/ErrorMsg.cpp
> -@@ -15,13 +15,13 @@ UString MyFormatMessage(DWORD errorCode)
> -
> -   switch(errorCode) {
> -     case ERROR_NO_MORE_FILES   : txt =3D "No more files"; break ;
> --    case E_NOTIMPL             : txt =3D "E_NOTIMPL"; break ;
> --    case E_NOINTERFACE         : txt =3D "E_NOINTERFACE"; break ;
> --    case E_ABORT               : txt =3D "E_ABORT"; break ;
> --    case E_FAIL                : txt =3D "E_FAIL"; break ;
> --    case STG_E_INVALIDFUNCTION : txt =3D "STG_E_INVALIDFUNCTION"; break=
 ;
> --    case E_OUTOFMEMORY         : txt =3D "E_OUTOFMEMORY"; break ;
> --    case E_INVALIDARG          : txt =3D "E_INVALIDARG"; break ;
> -+    case (DWORD) E_NOTIMPL             : txt =3D "E_NOTIMPL"; break ;
> -+    case (DWORD) E_NOINTERFACE         : txt =3D "E_NOINTERFACE"; break=
 ;
> -+    case (DWORD) E_ABORT               : txt =3D "E_ABORT"; break ;
> -+    case (DWORD) E_FAIL                : txt =3D "E_FAIL"; break ;
> -+    case (DWORD) STG_E_INVALIDFUNCTION : txt =3D
> "STG_E_INVALIDFUNCTION"; break ;
> -+    case (DWORD) E_OUTOFMEMORY         : txt =3D "E_OUTOFMEMORY"; break=
 ;
> -+    case (DWORD) E_INVALIDARG          : txt =3D "E_INVALIDARG"; break =
;
> -     case ERROR_DIRECTORY          : txt =3D "Error Directory"; break ;
> -     default:
> -       txt =3D strerror(errorCode);
> diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/m=
eta-
> oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
> deleted file mode 100644
> index 98e186cbf..000000000
> --- a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -p7zip: Update CVE-2016-9296 patch URL.
> -From: Robert Luberda <robert@debian.org>
> -Date: Sat, 19 Nov 2016 08:48:08 +0100
> -Subject: Fix nullptr dereference (CVE-2016-9296)
> -
> -Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
> -This patch file taken from Debian's patch set for p7zip
> -
> -Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/185/]
> -CVE: CVE-2016-9296
> -
> -Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> -
> -Index: p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
> -
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D
> ---- p7zip_16.02.orig/CPP/7zip/Archive/7z/7zIn.cpp
> -+++ p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
> -@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedS
> -       if (CrcCalc(data, unpackSize) !=3D folders.FolderCRCs.Vals[i])
> -         ThrowIncorrect();
> -   }
> --  HeadersSize +=3D folders.PackPositions[folders.NumPackStreams];
> -+  if (folders.PackPositions)
> -+      HeadersSize +=3D folders.PackPositions[folders.NumPackStreams];
> -   return S_OK;
> - }
> -
> diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
> b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
> deleted file mode 100644
> index 9ba107807..000000000
> --- a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 7f2da4f810b429ddb7afa0e252e3d02ced0eba87 Mon Sep 17 00:00:00
> 2001
> -From: Radovan Scasny <radovan.scasny@siemens.com>
> -Date: Tue, 20 Feb 2018 12:08:13 +0100
> -Subject: [PATCH] p7zip: Fix CVE-2017-17969
> -
> -[No upstream tracking] -- https://bugs.debian.org/cgi-
> bin/bugreport.cgi?bug=3D888297
> -
> -Heap-based buffer overflow in 7zip
> -
> -Compress/ShrinkDecoder.cpp: Heap-based buffer overflow
> -in the NCompress::NShrink::CDecoder::CodeReal method
> -in 7-Zip before 18.00 and p7zip allows remote attackers
> -to cause a denial of service (out-of-bounds write)
> -or potentially execute arbitrary code via a crafted ZIP archive.
> -
> -Upstream-Status: Backport
> [https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/8316/attac=
hm
> ent/CVE-2017-17969.patch]
> -CVE: CVE-2017-17969
> -Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
> -
> ----
> - CPP/7zip/Compress/ShrinkDecoder.cpp | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp
> b/CPP/7zip/Compress/ShrinkDecoder.cpp
> -index 80b7e67..5bb0559 100644
> ---- a/CPP/7zip/Compress/ShrinkDecoder.cpp
> -+++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
> -@@ -121,7 +121,12 @@ HRESULT CDecoder::CodeReal(ISequentialInStream
> *inStream, ISequentialOutStream *
> -     {
> -       _stack[i++] =3D _suffixes[cur];
> -       cur =3D _parents[cur];
> -+	  if (cur >=3D kNumItems || i >=3D kNumItems)
> -+	  	break;
> -     }
> -+
> -+	if (cur >=3D kNumItems || i >=3D kNumItems)
> -+		break;
> -
> -     _stack[i++] =3D (Byte)cur;
> -     lastChar2 =3D (Byte)cur;
> diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/m=
eta-
> oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
> deleted file mode 100644
> index 47868c982..000000000
> --- a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -From: Robert Luberda <robert@debian.org>
> -Date: Sun, 28 Jan 2018 23:47:40 +0100
> -Subject: CVE-2018-5996
> -
> -Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
> -applying a few changes from 7Zip 18.00-beta.
> -
> -Bug-Debian: https://bugs.debian.org/#888314
> -
> -Upstream-Status: Backport [https://sources.debian.org/data/non-free/p/p7=
zip-
> rar/16.02-3/debian/patches/06-CVE-2018-5996.patch]
> -CVE: CVE-2018-5996
> -
> -Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> ----
> - CPP/7zip/Compress/Rar1Decoder.cpp | 13 +++++++++----
> - CPP/7zip/Compress/Rar1Decoder.h   |  1 +
> - CPP/7zip/Compress/Rar2Decoder.cpp | 10 +++++++++-
> - CPP/7zip/Compress/Rar2Decoder.h   |  1 +
> - CPP/7zip/Compress/Rar3Decoder.cpp | 23 ++++++++++++++++++++---
> - CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
> - 6 files changed, 42 insertions(+), 8 deletions(-)
> -
> -diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp
> b/CPP/7zip/Compress/Rar1Decoder.cpp
> -index 1aaedcc..68030c7 100644
> ---- a/CPP/7zip/Compress/Rar1Decoder.cpp
> -+++ b/CPP/7zip/Compress/Rar1Decoder.cpp
> -@@ -29,7 +29,7 @@ public:
> - };
> - */
> -
> --CDecoder::CDecoder(): m_IsSolid(false) { }
> -+CDecoder::CDecoder(): m_IsSolid(false), _errorMode(false) { }
> -
> - void CDecoder::InitStructures()
> - {
> -@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream
> *inStream, ISequentialOutStream *
> -   InitData();
> -   if (!m_IsSolid)
> -   {
> -+    _errorMode =3D false;
> -     InitStructures();
> -     InitHuff();
> -   }
> -+
> -+  if (_errorMode)
> -+    return S_FALSE;
> -+
> -   if (m_UnpackSize > 0)
> -   {
> -     GetFlagsBuf();
> -@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream
> *inStream, ISequentialOutStream
> -     const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo
> *progress)
> - {
> -   try { return CodeReal(inStream, outStream, inSize, outSize, progress)=
; }
> --  catch(const CInBufferException &e) { return e.ErrorCode; }
> --  catch(const CLzOutWindowException &e) { return e.ErrorCode; }
> --  catch(...) { return S_FALSE; }
> -+  catch(const CInBufferException &e) { _errorMode =3D true; return e.Er=
rorCode; }
> -+  catch(const CLzOutWindowException &e) { _errorMode =3D true; return
> e.ErrorCode; }
> -+  catch(...) { _errorMode =3D true; return S_FALSE; }
> - }
> -
> - STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32
> size)
> -diff --git a/CPP/7zip/Compress/Rar1Decoder.h
> b/CPP/7zip/Compress/Rar1Decoder.h
> -index 630f089..01b606b 100644
> ---- a/CPP/7zip/Compress/Rar1Decoder.h
> -+++ b/CPP/7zip/Compress/Rar1Decoder.h
> -@@ -39,6 +39,7 @@ public:
> -
> -   Int64 m_UnpackSize;
> -   bool m_IsSolid;
> -+  bool _errorMode;
> -
> -   UInt32 ReadBits(int numBits);
> -   HRESULT CopyBlock(UInt32 distance, UInt32 len);
> -diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp
> b/CPP/7zip/Compress/Rar2Decoder.cpp
> -index b3f2b4b..0580c8d 100644
> ---- a/CPP/7zip/Compress/Rar2Decoder.cpp
> -+++ b/CPP/7zip/Compress/Rar2Decoder.cpp
> -@@ -80,7 +80,8 @@ static const UInt32 kHistorySize =3D 1 << 20;
> - static const UInt32 kWindowReservSize =3D (1 << 22) + 256;
> -
> - CDecoder::CDecoder():
> --  m_IsSolid(false)
> -+  m_IsSolid(false),
> -+  m_TablesOK(false)
> - {
> - }
> -
> -@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return
> m_InBitStream.ReadBits(numB
> -
> - bool CDecoder::ReadTables(void)
> - {
> -+  m_TablesOK =3D false;
> -+
> -   Byte levelLevels[kLevelTableSize];
> -   Byte newLevels[kMaxTableSize];
> -   m_AudioMode =3D (ReadBits(1) =3D=3D 1);
> -@@ -170,6 +173,8 @@ bool CDecoder::ReadTables(void)
> -   }
> -
> -   memcpy(m_LastLevels, newLevels, kMaxTableSize);
> -+  m_TablesOK =3D true;
> -+
> -   return true;
> - }
> -
> -@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream
> *inStream, ISequentialOutStream *
> -       return S_FALSE;
> -   }
> -
> -+  if (!m_TablesOK)
> -+    return S_FALSE;
> -+
> -   UInt64 startPos =3D m_OutWindowStream.GetProcessedSize();
> -   while (pos < unPackSize)
> -   {
> -diff --git a/CPP/7zip/Compress/Rar2Decoder.h
> b/CPP/7zip/Compress/Rar2Decoder.h
> -index 3a0535c..0e9005f 100644
> ---- a/CPP/7zip/Compress/Rar2Decoder.h
> -+++ b/CPP/7zip/Compress/Rar2Decoder.h
> -@@ -139,6 +139,7 @@ class CDecoder :
> -
> -   UInt64 m_PackSize;
> -   bool m_IsSolid;
> -+  bool m_TablesOK;
> -
> -   void InitStructures();
> -   UInt32 ReadBits(unsigned numBits);
> -diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp
> b/CPP/7zip/Compress/Rar3Decoder.cpp
> -index 3bf2513..6cb8a6a 100644
> ---- a/CPP/7zip/Compress/Rar3Decoder.cpp
> -+++ b/CPP/7zip/Compress/Rar3Decoder.cpp
> -@@ -92,7 +92,8 @@ CDecoder::CDecoder():
> -   _writtenFileSize(0),
> -   _vmData(0),
> -   _vmCode(0),
> --  m_IsSolid(false)
> -+  m_IsSolid(false),
> -+  _errorMode(false)
> - {
> -   Ppmd7_Construct(&_ppmd);
> - }
> -@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool
> &keepDecompressing)
> -     return InitPPM();
> -   }
> -
> -+  TablesRead =3D false;
> -+  TablesOK =3D false;
> -+
> -   _lzMode =3D true;
> -   PrevAlignBits =3D 0;
> -   PrevAlignCount =3D 0;
> -@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool
> &keepDecompressing)
> -       }
> -     }
> -   }
> -+  if (InputEofError())
> -+    return S_FALSE;
> -+
> -   TablesRead =3D true;
> -
> -   // original code has check here:
> -@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool
> &keepDecompressing)
> -   RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize +
> kAlignTableSize]));
> -
> -   memcpy(m_LastLevels, newLevels, kTablesSizesSum);
> -+
> -+  TablesOK =3D true;
> -+
> -   return S_OK;
> - }
> -
> -@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo
> *progress)
> -     PpmEscChar =3D 2;
> -     PpmError =3D true;
> -     InitFilters();
> -+    _errorMode =3D false;
> -   }
> -+
> -+  if (_errorMode)
> -+    return S_FALSE;
> -+
> -   if (!m_IsSolid || !TablesRead)
> -   {
> -     bool keepDecompressing;
> -@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo
> *progress)
> -     bool keepDecompressing;
> -     if (_lzMode)
> -     {
> -+      if (!TablesOK)
> -+        return S_FALSE;
> -       RINOK(DecodeLZ(keepDecompressing))
> -     }
> -     else
> -@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream
> *inStream, ISequentialOutStream
> -     _unpackSize =3D outSize ? *outSize : (UInt64)(Int64)-1;
> -     return CodeReal(progress);
> -   }
> --  catch(const CInBufferException &e)  { return e.ErrorCode; }
> --  catch(...) { return S_FALSE; }
> -+  catch(const CInBufferException &e)  { _errorMode =3D true; return e.E=
rrorCode; }
> -+  catch(...) { _errorMode =3D true; return S_FALSE; }
> -   // CNewException is possible here. But probably CNewException is caus=
ed
> -   // by error in data stream.
> - }
> -diff --git a/CPP/7zip/Compress/Rar3Decoder.h
> b/CPP/7zip/Compress/Rar3Decoder.h
> -index c130cec..2f72d7d 100644
> ---- a/CPP/7zip/Compress/Rar3Decoder.h
> -+++ b/CPP/7zip/Compress/Rar3Decoder.h
> -@@ -192,6 +192,7 @@ class CDecoder:
> -   UInt32 _lastFilter;
> -
> -   bool m_IsSolid;
> -+  bool _errorMode;
> -
> -   bool _lzMode;
> -   bool _unsupportedFilter;
> -@@ -200,6 +201,7 @@ class CDecoder:
> -   UInt32 PrevAlignCount;
> -
> -   bool TablesRead;
> -+  bool TablesOK;
> -
> -   CPpmd7 _ppmd;
> -   int PpmEscChar;
> -
> diff --git a/meta-oe/recipes-
> extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> b/meta-oe/recipes-
> extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> deleted file mode 100644
> index 93eb0588c..000000000
> --- a/meta-oe/recipes-
> extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 0820ef4b9238c1e39ae5bda32cc08cce3fd3ce89 Mon Sep 17 00:00:00
> 2001
> -From: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> -Date: Wed, 26 May 2021 19:59:28 +0000
> -Subject: [PATCH] fixes the below error
> -
> -| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'v=
irtual
> LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID,
> PROPVARIANT*)':
> -| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of =
an
> operand of type 'bool' in 'operator++' is forbidden in C++17
> -|   308 |           numMethods++;
> -|       |           ^~~~~~~~~~
> -| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of a=
n
> operand of type 'bool' in 'operator++' is forbidden in C++17
> -|   318 |         numMethods++;
> -
> -use unsigned instead of bool
> -Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> -
> -Upstream-Status: Pending
> -
> ----
> - CPP/7zip/Archive/Wim/WimHandler.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CPP/7zip/Archive/Wim/WimHandler.cpp
> b/CPP/7zip/Archive/Wim/WimHandler.cpp
> -index 27d3298..4ff5cfe 100644
> ---- a/CPP/7zip/Archive/Wim/WimHandler.cpp
> -+++ b/CPP/7zip/Archive/Wim/WimHandler.cpp
> -@@ -298,7 +298,7 @@ STDMETHODIMP
> CHandler::GetArchiveProperty(PROPID propID, PROPVARIANT *value)
> -
> -       AString res;
> -
> --      bool numMethods =3D 0;
> -+      unsigned numMethods =3D 0;
> -       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
> -       {
> -         if (methodMask & ((UInt32)1 << i))
> diff --git a/meta-oe/recipes-
> extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
> b/meta-oe/recipes-
> extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
> deleted file mode 100644
> index 2636e7f6f..000000000
> --- a/meta-oe/recipes-
> extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From b2aa209dfc5e59d6329b55b9764782334b63dbe8 Mon Sep 17 00:00:00
> 2001
> -From: Raphael Freudiger <raphael.freudiger@siemens.com>
> -Date: Wed, 11 Feb 2015 09:11:47 +0100
> -Subject: [PATCH] do not override compiler and do not strip
> -
> -The default makefile sets the compiler to g++ or gcc. This leads to a wr=
ong
> architecture when cross-compiling.
> -Remove the hardcoded compiler and just append the flags to CXX and CC.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
> -Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
> -
> ----
> - makefile.machine | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/makefile.machine b/makefile.machine
> -index 9e34c34..e9244d9 100644
> ---- a/makefile.machine
> -+++ b/makefile.machine
> -@@ -2,7 +2,7 @@
> - # makefile for Linux (x86, PPC, alpha ...)
> - #
> -
> --OPTFLAGS=3D-O -s
> -+OPTFLAGS=3D-O
> -
> - ALLFLAGS=3D${OPTFLAGS} -pipe \
> -     	-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE \
> -@@ -10,8 +10,6 @@ ALLFLAGS=3D${OPTFLAGS} -pipe \
> - 	-D_7ZIP_LARGE_PAGES \
> - 	$(LOCAL_FLAGS)
> -
> --CXX=3Dg++
> --CC=3Dgcc
> - CC_SHARED=3D-fPIC
> - LINK_SHARED=3D-fPIC -shared
> -
> --
> 2.34.1


