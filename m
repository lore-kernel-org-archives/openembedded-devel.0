Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.78])
 by mx.groups.io with SMTP id smtpd.web12.64131.1600099757038358922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 09:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jpnkHBQh;
 spf=pass (domain: windriver.com, ip: 40.107.237.78, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2NeCjOmQNydeC0hw5iGByN5Kg7IE6BS9t/AtrlX2ifb7UhCGa+x9ErWbHRY3wHykFUVNo2MtNU8nmSIjlgTcbnN7ca+tffBm95V2n5m7zB3hjLLvFwAK9TOtaYfeI8y+GPw4Fgr1K+20LOomlXXd2J/ncpedqSxJlLVAGJBScubXH1tNPzJullJN+cCUv2nfAE2oGtkkfDc21qVARrbv0ylIlxHW2aXsUcA1WG0Qtl2wbZhsNOpPTDkIf1u+4mNB5KIxrxOCIZe0LPXKSh3Jt6+1/xN4QBvfhN/XhA0we/xEq9HtSgyo3Vw2DAKpOIfXKsegi8fyvXZbJ8uyOR5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aabp3nAueygVgYFzETsxuBW+8Z4ZyovrABJkfXPvAHo=;
 b=lT1ZCf4fuDUHa7d9XN4wXfb8kAVVh7sVm5/QfkQuU5or35dsTqxzb4gjXJez7IQh2QyMiweKZkH2Qb28KIlOTGax3sfK/nekPxUtCTRbWAg9TkEGejyMJZcBBKCf6+AJp/TEGPst0u8bVs4QdNMBRuzchAJaAQXg66I6Tq3fOC3Z5vgTbC+UHF5WwqSvwaK5sCxUZ8+7J4YLQJR1GqBkMX2keE8lqz5rGaF/pdgxE8u4HuJjkJyv55aGIMquRr2CoqVZxc+y1LHLp23zxZrzUfG432uDelggTWVU0hl7WPui4eXZBEO5MOsht0kbM3/BMezEvefg6Y61PwYkDGF6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aabp3nAueygVgYFzETsxuBW+8Z4ZyovrABJkfXPvAHo=;
 b=jpnkHBQh/UP++eliLpW0P5xtfi2BLgTn1EQvBnP69lSDfqfYQlIK8CqJNtHLFmIBZGhYr/vdhZ7jSDke+jNEagvJ25vfLkwEyxFQjAxJHtQppUj78NGppVD0n3v9v2s7y7FhQaAJlXKjwgKYYK5S4RpuzYQ+J48E8/wFkLiZn7k=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3319.namprd11.prod.outlook.com (2603:10b6:a03:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 14 Sep
 2020 16:09:14 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 16:09:14 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
Thread-Topic: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two
 CVE's
Thread-Index: AQHWgfpkseX86deQpUy75Yi94EEpPqlkC00AgABw7wCAA+FuwA==
Date: Mon, 14 Sep 2020 16:09:14 +0000
Message-ID: 
 <BY5PR11MB39923B0DDC75D87A03F27CB088230@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <16314ABFB8306B25.8972@lists.openembedded.org>
 <BY5PR11MB39926180521D6CA4F1A98A9D88240@BY5PR11MB3992.namprd11.prod.outlook.com>
 <ac6084ed-0e65-3cd3-6f6f-c0dcc02dc677@gmail.com>
In-Reply-To: <ac6084ed-0e65-3cd3-6f6f-c0dcc02dc677@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1b6392c-5658-4a34-c95a-08d858c88675
x-ms-traffictypediagnostic: BYAPR11MB3319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB331985F4FB8515C4498BFAED88230@BYAPR11MB3319.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Tr+iVPTtVjUTOa+DkhzE8QWhmEtDotaq7vOORanjWp+2AjHRZcaONLNX0lViDgY1FsqKibbYG5KU3ABsohN8b1L6Cb4jLSPE2AFlFavHfErY5DA/Uc7MDEy3yvuPHyHW8Zhr9lC1IVmrxcnjKxvcK1mr0HF3zjMgRQCp0D8WFg+/4oxNpiDrkzuw/MxhSHGE3UYgqfwwsXY8sjWeBG+xcqZR+XYLbcJGszFzMkkudaX8z58XKNqQKNoyz1ebW/eGutoAWEAHUDRsoEu3dErIF0nxbFQKt+XDYjPIvy77EcT5byYzqlqYrTmaEJoSTbvbfoUoI1hb0Ui/3fajE8k86IYSZ6AsFZ0hq7mo+QpFedJAnNEttT+e1pKSX7wWBk5La83kIs5G7oPPUGpGInGuhg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(396003)(136003)(346002)(66446008)(64756008)(86362001)(66556008)(55016002)(66476007)(8676002)(966005)(66946007)(83380400001)(316002)(2906002)(110136005)(5660300002)(4326008)(53546011)(186003)(33656002)(26005)(71200400001)(9686003)(7696005)(107886003)(478600001)(76116006)(8936002)(52536014)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 uQ8bY8HTQqydbIxte1nd2ouo43FbuWyGxvTCXLLNhA1/UUF3/nzj8kjzJmOrf4QE/RcDHpLkEHyNEOxjvRu/L7R8L6v/GYg6+7jcjtXHg2kOMki+7xqUHdEfxq0pQCrarNDi639b9TuTmAwX5I1oIYWIHhC5DwvCN9HuJaSe5u4hpIol7cAyP1UKU+4bGV2M2P/92F7qyigz8obKMmU0cLy/HK9vETZx85S3gCeGvV25w/Zgea9ISjngoGG289AlyXDsHHEaIl27pgXL5BKx3cqD50aNQUF+h9I6//8pgf8GoyfXFz41qvzr6Rtx8Qxm6q6vutNTMSRz2qMARHGuCG3J/DOONqQyBztmo7lLeUAUY+E/pA7bCHbPHj01FHRjnR/a6sQCDVQgP67mmnnLU6Eg3lrRNp4bxSB/4pvECeZhfoh34lo2y4RHPEr6B2aq/tBvnu58gSNqPO2SMjZlfBetssM8ahuhraZUM1GhaBp/CpGkmZPiJYI5LEfrMmQI6R00HwJa7BT+BsUZzCbaMHONa76pmconFTvzkmr2PsOzW5EmaOG1S4wF1O7NvAWXGo8Sw4If3ZwNdZay1H8GQfZDsPDdxXZ8HnMkVXou3uMa5SPvdwgpslyByk5g/cvZbVBI2XVlnjKwded5lcWYEg==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b6392c-5658-4a34-c95a-08d858c88675
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 16:09:14.3206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZ1GMee0aYtjOYGEV8cuZI4v7/KezYTSVcec3xz7OvxrCNfvIb55TSaCgYIRwjAwNWSBsBfERKFczIj5tmpJtGjcrrmg3LwZkOfUxlqNybQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3319
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yeah, I should have checked that out, but why below 2.1.0?  If we change th=
e format, we will never have a 2.1.0,
But maybe a format of 2.1.0~? or 2.1.0-? would be better.

Joe

-----Original Message-----
From: Khem Raj <raj.khem@gmail.com>=20
Sent: Friday, September 11, 2020 9:49 PM
To: Slater, Joseph <joe.slater@windriver.com>; openembedded-devel@lists.op=
enembedded.org
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two C=
VE's



On 9/11/20 3:06 PM, Joe Slater wrote:
> No comments on this?   I do not see it has been accepted.     Joe

Thanks for reminder, there was a comment I made

https://lists.openembedded.org/g/openembedded-devel/topic/76607300#86861

patchwork also noticed it.

https://patchwork.openembedded.org/patch/176016/

>=20
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@list=
s.openembedded.org> On Behalf Of Joe Slater
> Sent: Thursday, September 3, 2020 6:58 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy <Randy.Mac=
Leod@windriver.com>
> Subject: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE=
's
>=20
> Fix CVE-2020-15890 and CVE-2020-24372.
>=20
> Also change PV format because the reference to 2.1.0-beta3 was already f=
ar behind the SRCREV.  Now, base PV on the branch name and date of SRCREV c=
ommit.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/rec=
ipes-devtools/luajit/luajit_git.bb
> index cc9039416..820722195 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -3,13 +3,15 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd739bb9250a55c124a545b588f=
d76771"
>  HOMEPAGE =3D "http://luajit.org"
>  
> -PV =3D "2.1.0~beta3"
> -SRCREV =3D "0ad60ccbc3768fa8e3e726858adf261950edbc22"
>  SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=
=
=3Dv2.1 \
>             file://0001-Do-not-strip-automatically-this-leaves-the-strip=
ping.patch \
>             file://clang.patch \
>             "
>  
> +# Set PV to the branch and date associated with SRCREV.
> +PV =3D "v2.1-200809"
> +SRCREV =3D "94d4abcca966df2cc423e821bcacd04898f73117"
> +
>  S =3D "${WORKDIR}/git"
>  
>  inherit pkgconfig binconfig siteinfo
> --
> 2.17.1
>=20
>=20
>=20
>=20
