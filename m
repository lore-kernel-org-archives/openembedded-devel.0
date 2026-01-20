Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DF7D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:57:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6819.1768917456106230389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=n11YsB4q;
 spf=pass (domain: axis.com, ip: 40.107.162.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmtCENnnewWMyEj/lMIZPBVlxtH27Bruvszrt9OFzTDcYllQ1GuhP5LFP1nRsaWpElOrxUDRSLDzzar8Lfs/MYbK2x76GJ8f9ts2oYflQJxaCfqLnOyb5Mv4cJ6TyVwjwPH+tRPAjZ1td55vFUE9q73goNp6UuttCkvOVBpJc+FDJieJOgWi58/UZuUGC6E/1Sim1Z/nlG3bMMuSop3oNyVQB65DDks2sycYCg4twehiMT8OTImM8AuxfVGth2zDQdhWIhaWYhNCtgo4zoF7/Aq/32LW+L4UkGwtmNZwsLAhRw3RtzeMTsqPVAUmWW8CkAA2ACXYWxQzrF8Equs7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbN67jddxXIizYLY3W31fkZw3u6TpKLZ7XgrRioAyt0=;
 b=HcehDAoi5+J/M4rAlMQkqma2WOPLDzkK2AkqBEs/DvbgWEuvXNhN/9MWRKYimbh0NH+cLVd56pPCqIX3A2Pro42wc3SJRpXbiCy6QXJvtg1olKJARII8it4vhTojyDPPIV6xUOcLXve1ESCXST0isL0BGXHZvUBQZ63Yf+5I5W5HZ29ypzOyTH5PHsUkDpzUzclgSSyzl2Gn8bw/OX2HtzZpXi09tupiO/2a9ZvNxC6gIySeJ56Y5AHsJapML4xoClY9M4KnxZlCt/45CwKH+SQmczr7A2Z0BmCpiCMg9i1lhNbRFNZr+MzlINRGRhISFynoAgXYOI8s+cBHt0N4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbN67jddxXIizYLY3W31fkZw3u6TpKLZ7XgrRioAyt0=;
 b=n11YsB4qrULXNNY60Bt1dwoi+IIH0fbndBfVub4op1EMRYADICflQuWKNE3/+HPIjyTp0spoFSlwhLA3sLRnzRV+DJYI7QUy9n0B5RNUciOAzYaQIj7Ebw1xKTqxO1qOI44QWydTtpHV1fmncgQegXjp1In0LyGkfQs+AnZo1IY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB10642.eurprd02.prod.outlook.com (2603:10a6:150:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 20 Jan
 2026 13:57:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9520.003; Tue, 20 Jan 2026
 13:57:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "frederikbraendstrup@gmail.com" <frederikbraendstrup@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH v3] glaze: add recipe
Thread-Topic: [oe] [PATCH v3] glaze: add recipe
Thread-Index: AQHciT9k0iR0WAuLJkuSc+mHDdmr67VbFhjA
Date: Tue, 20 Jan 2026 13:57:29 +0000
Message-ID: 
 <DB5PR02MB10213684AAECDAE76758A53A8EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
 <20260119122944.1111081-2-frederikbraendstrup@gmail.com>
In-Reply-To: <20260119122944.1111081-2-frederikbraendstrup@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB10642:EE_
x-ms-office365-filtering-correlation-id: 35d84503-f181-4a91-4e80-08de582bd9cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|19132099003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?tdkY6dMEaXDV7sql2WlI0r+K/MGm3zeDZvALkZJ/WLK7TQG5bzCJxjSwAw?=
 =?iso-8859-1?Q?jqOzAfqYPFbxU1ynnxqWu1PhKtzmsckxDCTXQEPUp+GY8ep80q6fhfT1o6?=
 =?iso-8859-1?Q?ST3S2pXOGY6Ffrp4j1c0YdgpaGbGlb2hPmfEJFtkKrVhhIh0Be6GBirCiL?=
 =?iso-8859-1?Q?MmRT23PW9JUubWU+5JZFzMD/HIltGWgRhX9FG0UZ3zxWsVmDAQzYgAM2FD?=
 =?iso-8859-1?Q?6/ODzIcIj160DrUBRh2JHnVkXbX2eqD++EOknHvGkZRbK8SjPMkiaSU3+2?=
 =?iso-8859-1?Q?0HowSc1GxuhMpV1y9HVU5Ogk+nqyitKuLH6N9vhaCSsXEoLhV6R4oQGnuc?=
 =?iso-8859-1?Q?mNTJucXKANrmnOPNHyHxn5++SQcGiatX0gn7JY0TUmFpf5Q6MBsG+PVHVG?=
 =?iso-8859-1?Q?xlZoT2+nFEwlFm7sfD+fnokovEQ/WX8NSPtvUEetlNU6Rzqi771dWw3nbw?=
 =?iso-8859-1?Q?rFSLygc+0pvVr6c7fYY4WjvB3Qag35FGpWHps8jhivLHeWn/K66o9lYc0H?=
 =?iso-8859-1?Q?VMZQiF+6p0EO9Kl4NrAWMnD8R25kEKfVJEtesLwgd0neAfcJsC4Y2EisCi?=
 =?iso-8859-1?Q?IoDx9YWwEbIxZgvOxbIij/HAJt+/NhMW7wYebXrnGfwKn73Tvk46ivs4vT?=
 =?iso-8859-1?Q?p83B6Nci5rvKgplVIaPGSkmojcYTSVS5Dv3hHwwyKTrhtVdgsnuRrtlUpp?=
 =?iso-8859-1?Q?a0PcebvclF82ACbSA3RwC6kzObls/gjY4sFyc+WTo7TdX/b2TB7P1n60HX?=
 =?iso-8859-1?Q?4SY6bAPyuTRiUEtHHQPES1S5D9iTdw/qm1ClUGugAQSlQPX6jmRPsgarw+?=
 =?iso-8859-1?Q?IV2PpJZNtnXvUzkWRtxmYW9XENQFFL0eCEmUxGJHe+5XFcXX4+GEltO/2g?=
 =?iso-8859-1?Q?4Jtzxsi1/xbcNrJsgGb/0/s6TRQjCr+YvYr0OD48iOa8EiWNurqScT73g5?=
 =?iso-8859-1?Q?HJri43bnD8zUVF3UwhXFUL+rYsOvSRVUZAQxHNeeKF8D2H4asyZj09tzFk?=
 =?iso-8859-1?Q?ERW5evKMx2xp9kPVG2sa1GBrtObTQEl80PECf3vuWC5et8aXRb8p1or9eY?=
 =?iso-8859-1?Q?FJVw16Cq2NY91IZ56IRmwBaPDL7JDzUa/Hw7nOX4XW616ZhDtAuBAVAz75?=
 =?iso-8859-1?Q?9qKrLwIYDL8XFt79Hp3y3KfAc0N1L5ZMA+bwPKzz6Y2l5guafeVSqcaPvL?=
 =?iso-8859-1?Q?YETzGAtFqfTGZX08a9rUvRnkEmhSrBGA57os8w2GkM77soNHY9/kUpp5Tx?=
 =?iso-8859-1?Q?JSQmeTeoqqCvrlonfabjDkTTZ/S6OkULlAVDlDFAaN5EXuP16oekYT62QX?=
 =?iso-8859-1?Q?iF3YXkqeTuWiWZ0SpKYjJgnkeg1fRiLkCWj/owCZomu+f8TyatrnRmznqc?=
 =?iso-8859-1?Q?s3tItX4L7gj6ug61saJAZwTeEbZevjkHDPQnPaUIyemL32FOD5kleV33lk?=
 =?iso-8859-1?Q?uTplh+YjQwh75/8ZOohqMKDRBReF+gvmQHUgHBLTzTvaqHrmkxLHc4Q86t?=
 =?iso-8859-1?Q?66mBSvpQj+2+RDS84aFQncCO4SjhTNg1gkSSWU4zcIDJcj/aBdmMzrGuTo?=
 =?iso-8859-1?Q?k2iSrRjt1REM54yEzQXZhrw5pF8SOFme0eR8/A7xOI6m0kgYkVKoTZuPa/?=
 =?iso-8859-1?Q?yN8EJfEQOYk0Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(19132099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ueZ3pV6vAK0HSaPwMJ6yD9b6Bn4dIAcVSe1AWPuwcUOI5tIoYKObGZC6Qq?=
 =?iso-8859-1?Q?5rKeSH0s/PoK5d40cg9EZ/d1nDDQCxyh01TQQc6npw4/0IVAvyhl7o5u5i?=
 =?iso-8859-1?Q?SfO2CjDGAKtXe1yzWblrl6aiQPnmRtW0aH9aKXPIC0HvjIx/OOM8UH3ygM?=
 =?iso-8859-1?Q?OREPMIzjuh3kWE7KV0ugfdKBHNi3PgXdkBwz6bVVkBocD5zO+OTAsOil8y?=
 =?iso-8859-1?Q?Pj+z39zHiP/4lNpkLqmDL/s+DfQP9w+DBiqb0P4vTews+7d5NkMQce+iMP?=
 =?iso-8859-1?Q?OCtJXz3PUr/t0mUnCNTaJsTz6Mi6W86Ynlgfsz/eYWrJX967bCJZKuym6w?=
 =?iso-8859-1?Q?OmAEgqFsdmR2ozLR/h27Oy0gjcBhg/sL3f7O0aYiwFCCvSyohBiKF8pl5r?=
 =?iso-8859-1?Q?1WZhSv8d6nuAB4KE/Y/L42DwwIzj2RPNTEUUiHsk14oIs4jGEgFL1/33qx?=
 =?iso-8859-1?Q?hXGktt5PW4NtMEaE5Ps+SLtTuZ2Sv2btVv2CE4pyyWnZ+zIc4aUZk4XZ9Z?=
 =?iso-8859-1?Q?boWJT4dRgWzJSZokT3PYvnEpnRjAGeWwIIYbGBDCdEDca0aortluPncrNy?=
 =?iso-8859-1?Q?wbtkQITb7GD+5F+tfg8Gh0t+jPL25stczRqO318w768z/smVMunhW779+q?=
 =?iso-8859-1?Q?PxF1ilKLhoieBAWZTGhGutPgzadF/qEFC4EPhflIDgUkayTFrOB2sIm8UE?=
 =?iso-8859-1?Q?MOBc5m3+KnWBu7DO/D6YBwuzOtTs8aD+VM5FRYw/4Tpi31PMW7dbLBaAHS?=
 =?iso-8859-1?Q?lP+r9STxiMVI4W0Re2ECeavg0lsIGu0PSJevavKPbI9Tz3MNUgK5UnH/I4?=
 =?iso-8859-1?Q?6qWoBWzbookqRiaBMO8hIRFMfq5VH4hG20gik6VFLhMLzatjfKa9em0i9b?=
 =?iso-8859-1?Q?93WT6NRtsa3EyqeyzRGc7ioS8UQzd3gdPLh/F03DZ5BBSN+USE48AMQwZU?=
 =?iso-8859-1?Q?U4/D3BsJrcfGUxkuk1HvybOUgVEu5NhZlFpjuh8pyEdFA8IjOWwaD/Lv2J?=
 =?iso-8859-1?Q?oGb/y8HMKp79L3VMsqFTNzEsZi63jXQ6AgCjFzEyWFMoeQ1U63mw5wP36F?=
 =?iso-8859-1?Q?YUhOWVhyZksgNfXPkIr1c/ZmZr8mA+Rd22lNuaPuZh7rKD7X6MT5eYpa6+?=
 =?iso-8859-1?Q?rLOgx87QpY1xtpczdS4ztq8EUXaY/AFXdR2it43LtAivfoB8PArWLafTD+?=
 =?iso-8859-1?Q?z1Hbjiq8foxgXO0YHaLwA6VC75gW9LPRynt8NiVfl7CJfjcIDqIELFqcOV?=
 =?iso-8859-1?Q?Ua7Cx736E27PuU+XVHFXLmxu8I0U7eny+5Q9X5gv3wQa0ZEZADMI8zrq2W?=
 =?iso-8859-1?Q?m8TfXAwMdE5IPcpEoQJktouxEu87CMZu90WBU7jGFb9g8CuCxaJKqVeF2b?=
 =?iso-8859-1?Q?35v2BiRm1OYpZNHWL9BwcEmZvjQ5R36uM4qolGTZK4z883wDY7FvLuHdK0?=
 =?iso-8859-1?Q?XVin8ey0xGmAyf3vbPbkp3zZ9mHjtkvKK5kV0JREt9GGQuiLRGr/bZS5YZ?=
 =?iso-8859-1?Q?neNXq6CBEcq0IQXGydheFkWmuZ4z17aRA55bvh0/mUlnoGTk33Y+65M8mK?=
 =?iso-8859-1?Q?f/QBLCJ0IrdS/RiC9g3ofSAZ5T6Sojl7SgUYElTQYZ1xZ0jPJor3dlNyv9?=
 =?iso-8859-1?Q?kJTn2fECxVglekQYkRDdAh6Ks0PSeUgEL6Lu4z41X/sFwU/1mQ5rs1hrQj?=
 =?iso-8859-1?Q?gg0ZLRtnvga7zLPpB0QaSthvpAD2HqmXt2PAkR6M+j6WQEJeKPgbXPFBgD?=
 =?iso-8859-1?Q?KevKarPuoiezKToT7YL37c4X4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d84503-f181-4a91-4e80-08de582bd9cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 13:57:29.3619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X99PgvFygUDnn0CdFZG2RqtCS/8/qkgCdp9zI2Vv8Pt89iTcJ08wzt1CRPiazscv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10642
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 13:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123670

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Frederik Br=E6ndstrup via lists.openembedde=
d.org
> Sent: den 19 januari 2026 13:30
> To: openembedded-devel@lists.openembedded.org
> Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> Subject: [oe] [PATCH v3] glaze: add recipe
>=20
> ---
>  meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb
>=20
> diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recip=
es-support/glaze/glaze_7.0.1.bb
> new file mode 100644
> index 0000000000..6526b1d8a3
> --- /dev/null
> +++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Extremely fast, in memory, JSON and reflection library =
for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
> +HOMEPAGE =3D "https://stephenberry.github.io/glaze/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf50485c846dbbb=
ed8"
> +
> +SRC_URI =3D "git://github.com/stephenberry/glaze;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}"
> +
> +SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF -D=
glaze_ENABLE_FUZZING=3DOFF"
> +
> --

We use the following recipe for glaze:

SUMMARY =3D "Header-only C++23 JSON library with compile time reflection"
HOMEPAGE =3D "https://github.com/stephenberry/glaze"

LICENSE =3D "MIT"
LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf50485c846dbbbed8=
"

SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"

SRC_URI =3D "git://github.com/stephenberry/glaze;protocol=3Dhttps;branch=3D=
main"

inherit cmake

EXTRA_OECMAKE +=3D "-Dglaze_BUILD_EXAMPLES=3DOFF -Dglaze_DEVELOPER_MODE=3DO=
FF"

do_install:append() {
    install -d ${D}${datadir}/cmake/${BPN}
    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
}

# Glaze is a header-only C++ library, so the main package will be empty.
ALLOW_EMPTY:${PN} =3D "1"

BBCLASSEXTEND =3D "native"

I believe there a some pieces that you may want to pick up.

//Peter


