Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3FEC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 07:01:31 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.97])
 by mx.groups.io with SMTP id smtpd.web12.5778.1659510083724940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 00:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=UA1AiXk6;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.14.97,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IolIFX1pctkxZKg5/y8d3k8ojWl37P58tIELNPsE6r6cNRIqm1dJrKF+uuOvKiloaKtAZtpDL4/I56zI+jnrVZpKVx9Mkr8MvL7EqjsSw1ojzLTEZ6Yb8OfudgyM2YUDsrI5Do/ErXx8aBIVfWP4xh02KR0XZ+pb91sHNm6j3iX0P7wdJZSrJSIghMluXjp48+XxYpm1xRATyV0rRMDAbp5u+aLrN406J4+HOw3/2Rf6wL5Mh09bnTukdNMMQU6NDdq/vA87IAK/NkInhsfycn/iyjfct4Z6Lxtk+mUJpEFl1rlX9UtNFEi89HMxf53WqNcAt3Gvf2INZOH2uwkNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku34zy8PE1paFnT+fUEP3ys3niCBIfk6lJscavxRNe4=;
 b=bMNGkkzsSdpBc9JR512UdEfek1xiiKvOfK03I5nPZmJsmZvZFox5EYE5w1XLkvxyuoMttxVVNSPqR0ASk3j+u+j9YV8BZYVUMoZMAD08yACMomQO9YyAXNSCPF8xo4w+KKHvy7S0Wys2yeaha0mUwwFurJkPqNW9KJ+izm//gFhjapqbBGpLyuJocW3UAqc15ZoYyOxAzWQQDC8w7bb2vxFy909uKPRgjVVTjxWQZfroYu/Bdefu2iwpIjzgN1H3sCxB59bS05V9fwvVoEwsNkToO1YsIuoQgdeGOBPt353WE3TmZ5Io5d5lDBrzCV9SjU1zuIsXRD+9gyD6EG+w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku34zy8PE1paFnT+fUEP3ys3niCBIfk6lJscavxRNe4=;
 b=UA1AiXk6BWTGdF0d3/aZ84IDTj00rBrajdvMzbIprhQwqcf0T7/2nq9rk8DehJPgOOWMzhsgGDSEhizzXoqGQ00VOk9FnChdJaCqPKSQj0zV5Glw4ydxWTTj9JuOLcxFzfx+P2/6jgoDAHc7zefxW/u53zoi7UZpRP00vWzBG0g=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 VI1PR0602MB3565.eurprd06.prod.outlook.com (2603:10a6:803:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 07:01:20 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b%5]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:01:20 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
Thread-Topic: [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
Thread-Index: AQHYojYcRVJiuBnInECZgNwkhfXu2q2cyC8N
Date: Wed, 3 Aug 2022 07:01:19 +0000
Message-ID: 
 <DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <1705E216AF68BD15.13030@lists.openembedded.org>
In-Reply-To: <1705E216AF68BD15.13030@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a40e3154-7592-4052-0f1a-08da751df7d6
x-ms-traffictypediagnostic: VI1PR0602MB3565:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nNWg4pndHBzgRBpD76ywQMnVZXJGwefRMDCUVgxQ974lrExMLuZYxiakesL6IRnimG9E3JWOvcVmRcSodLh1epKIRpayKsHyRTITQjWHIjkpSWsIqNLL/xrNK8b923yHDhut7HZl80iMJcLhuq8s+RkERJz1Iql17QJXS7lqAY0eWqfqFBMf4HajUPtth2iIUEH5/FJ9G9ZgGk3r5iYE3/zjGwXzGZBmFjHREFRyzqTryfYyF0aucfKjF/T9ZroOXw7w3WERg5YRG59HiPDFHHo/Bbt3xWnzxftEd6K6uqnT27rhInmIvIuXMggDiVf7XcwfFn5ZIw86wH9CQkQrlPBMennxBdFC3hduooC8SVF+7arqD1j0dlQAJcM3MAUgSPW0i4SN0CSesrnRRecUsaI6d1KaH63avhai+eGQki7VbfPwOvIvTNYfiQ+zUOrdrIRvCAZkML3i/Sr19N+hnya7Oa6lMAavWDmxMvLzmGPQ4aH299uCc2ZZvAENZwIVuRQfUdIMSKdcY8uy7pBMy6Mn7yltypcvsuPEz1ZMvwM3mptwZkG525CgEb+3LYJ8edvG6lR2hNMdT8rhVwqZftFONlTsyCMBcbOQhfyH9hlAUPU/dqB66TvhYMaRI6q7fj2zL8W/VdQ0qx4kjwsCcgm5Prg9aX17UApGznIG1IQ/A2dO4tS03i7UvRGN16HlMdetd3d09prYuYRNint9bU4MR0Dgrw8+0TMbp4stz+WMxI4hz6X1XbNvQesA1DJH5a/kv+fX+WqNcurMiu1mCrQ1E2Bb1EEOJNBdckpWldR6X+3LjUAzmS9+ql2Bqfkl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(8936002)(52536014)(91956017)(6916009)(5660300002)(66446008)(478600001)(71200400001)(83380400001)(66476007)(66556008)(64756008)(66946007)(86362001)(76116006)(8676002)(4326008)(316002)(33656002)(55016003)(19627405001)(26005)(9686003)(186003)(45080400002)(38070700005)(41300700001)(2906002)(38100700002)(122000001)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?/3fhl9/ox6LOktXTtBJg8yNHcmJoLJSQoT9LLIg6IivohQNXoHkIAhDn?=
 =?Windows-1252?Q?KztBDUkRi4j3gxI1JSV56HwPf9PGHY6LDGT5Y0aHLw/B4oz8Htw/b9Ks?=
 =?Windows-1252?Q?hgFiItMGxBe/6IY7zKnbIcHb7iItT/Bg5WcLNJa3d1imMwMjydwhxUQN?=
 =?Windows-1252?Q?iJwdTlLKXaXQ2PnplOrnEjz37YacbrpcBIkcFSp3jaaxldNw4jtCjQXR?=
 =?Windows-1252?Q?ujhNcBflnaiJrwmKosIrTDBvokZYHAqBbD4RQPo2/Mxbtz6KQqgBJrE3?=
 =?Windows-1252?Q?YpyP1g91a+swXwJqd+m4FZoINqm8Rw5M9dIPKDAmdrU2TRwStdkyFHp6?=
 =?Windows-1252?Q?A1JwHu5G8el4555o7UybvhCTGv91NqMFtIOrpp22QVO1iWZcNjf7YndS?=
 =?Windows-1252?Q?o5++u6ddpPqq477Fw3xnw31o+vJeAOtBJDv3AaXwbt0AKZ5Gp8EE62i9?=
 =?Windows-1252?Q?gVFPyEdBP9hyt+JoS0QbPjEnKgsM6Zl3Bb4WTS4+QSWCEtPKlLuwvVU7?=
 =?Windows-1252?Q?w8pkQvEBrKIUoW2X8+TqPogRZrm28513WwQHN2I56g2YY/ayJvPeYQu4?=
 =?Windows-1252?Q?Rs4TmwNtMGO4i2NrwqK03p5YftuTYfkeTBCqPbIHM4hYCtWRFwNtDs1L?=
 =?Windows-1252?Q?8Zc1Ozc4L/yxHp3/6faD4WsO+W5cvgaNMC5Lf3vrx4BKKuVaZ+/yq7gf?=
 =?Windows-1252?Q?guKqkKP9N48UEsskSs58CsZF3nLB1i5eXbTurHHlwFoeUnCDgKCWOPRm?=
 =?Windows-1252?Q?4NMV6rAXJnx18h2EYj76ExPYIy1LyhdeiNEOfQS964aTc+lumB8Hdm3o?=
 =?Windows-1252?Q?DbrWAetpVwdifKoK4BRW2PLPJRJhYxFNzYA5qtO/delLqhMgnWQX8YUz?=
 =?Windows-1252?Q?B5BOYflMaxSuwUlMdohVVCJKwAfZvH57+sPq3SyQc67qaRjgqW8LUTPJ?=
 =?Windows-1252?Q?lHSkDMay9uR4Y0YROJ/C2jwBcPYKDA1U4e9uBxheVeEwp2u6KoMtm4Rb?=
 =?Windows-1252?Q?CQBvx0oXDWT7/KapywvCwl8cvURGYjNWS+9pMUU8cjo9pHKhZURyr7lW?=
 =?Windows-1252?Q?OaU0ODxe3oAqhK24K0wh3yzIra9LYj7tbxSme6T6J+aoP2FLLf89bbd0?=
 =?Windows-1252?Q?ydtAfmesUYT9Z98dVcdRG5KUrFqIVC1U2AP+wMKpJdfVFJ8QNKNWmOh9?=
 =?Windows-1252?Q?pzOATRZf500FjDvMgwG1WKhwscaaaGm7iHz/z+hdoob8GOCoT1lctVvD?=
 =?Windows-1252?Q?6b9PZ3nu3AmpeWkDn0N8YPOh07hhqVMM6r+yhf8RNAYsuJwM5GIRLXgo?=
 =?Windows-1252?Q?IJ6DfIWtBjLyDLN9eYLyPTYGi47jQLUH8nYxyIcKXQmxXkDSe94wpi1D?=
 =?Windows-1252?Q?rGqz6AuR4HWcS30USgmfkdBKAvkxT3nV9Z3VyrzBjoRgnR/5Mhscu1u4?=
 =?Windows-1252?Q?nn8ZkdpJNBjc4puoYf/D2eGNooGCU7tVdCYTp/3Uj+lnOba8NRtCvjFW?=
 =?Windows-1252?Q?JJnu7oi5fQaYloGixK4nJ6PvTuQdts823j+bqTnOVLio9Km2BknQF9SM?=
 =?Windows-1252?Q?Mal6t2HqlqrIru3Z3ieQWUhZttWP7mtNHIObL3EmM4dHIRNjNdSnavH0?=
 =?Windows-1252?Q?EetlbZIWxdfi6CORSIkGpWWc4+8EOzIujxicOOTzpr+QWHsUZFgsg7kx?=
 =?Windows-1252?Q?LVGYOH+TmANj71eqtf8AmcuRsrHVh5CFaG418mi147NGirNw5tMj7XeD?=
 =?Windows-1252?Q?IiavuolGgjLQVv6psvo=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9DB6PR06MB4008eurp_"
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a40e3154-7592-4052-0f1a-08da751df7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 07:01:19.8536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 b43EPRn+H0EN4GPfXodTCJIVhS7lhjYlZIQB1hHHBZmIJewh9jwohmjnyeQYROG2CQ/G68apQnbSUT7o1HglFc5/A1eLRgXbZmEoaxuWcCahSCo/Ot0/aCWaZP5Kfw/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3565
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 07:01:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98106

--_000_DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9DB6PR06MB4008eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,


and thanks for merging my patch into meta-openembedded:master (-:

since I observed these issues while running a kirkstone based system - and =
others will likely run into them as well - could you also put these changes=
 on the kirkstone branch?


thanks and regards
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Johannes Schneider via lists.openembedded.org=
 <johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org>
Sent: Thursday, July 28, 2022 05:56
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Subject: [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 -> 0.1=
0.0:

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


most important fix: version 0.8.0 errors out on dbus-lib interaction,
which is fixed with the most recent commit

505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses
2d90700 pystemd: add copyright boilerplate to typing stubs
5b95888 pystemd: update branch name in github workflow
16817d2 Add type stub for pystemd.run
410fd77 (tag: v.0.9.0) update changelog for 0.9.0
71aae43 GetProcesses() - info about systemd version (#59)
fcafd08 Also include .pxd and .pxi in the source distribution
475cd2f also support 3.9
ea98275 some formatting options and start pystemd 0.9 development
eb7d225 pystemd: update install instructions in README
6fdf2c8 Daily `arc lint --take BLACK`
50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../{python3-pystemd_0.8.0.bb =3D> python3-pystemd_0.10.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =3D> =
python3-pystemd_0.10.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b=
/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
index 0056a794f..da263fe94 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
@@ -2,13 +2,12 @@ SUMMARY =3D "Python bindings for interacting with systemd=
 over DBus"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b364516=
c"

-SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
-SRC_URI[sha256sum] =3D "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af=
6d9cd6458b9972"
+SRC_URI[sha256sum] =3D "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e2=
9ec811fa2ae859"

 DEPENDS =3D "systemd"
 RDEPENDS:${PN} +=3D "python3-xml python3-pprint"
 REQUIRED_DISTRO_FEATURES =3D "systemd"

-inherit pypi setuptools3 features_check
+inherit pypi setuptools3 features_check pkgconfig

 BBCLASSEXTEND =3D "native"
--
2.25.1


--_000_DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9DB6PR06MB4008eurp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
and thanks for merging my patch into meta-openembedded:master (-:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
since I observed these issues while running a kirkstone based system - and =
others will likely run into them as well - could you also put these changes=
 on the kirkstone branch?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
thanks and regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Johannes Schneider via lists.openembedded.org
 &lt;johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org&gt;<b=
r>
<b>Sent:</b> Thursday, July 28, 2022 05:56<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> SCHNEIDER Johannes &lt;johannes.schneider@leica-geosystems.com&g=
t;<br>
<b>Subject:</b> [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0=
 -&gt; 0.10.0:</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email is not from Hexagon=92s Office 365 inst=
ance. Please be careful while clicking links, opening attachments, or reply=
ing to this email.<br>
<br>
<br>
most important fix: version 0.8.0 errors out on dbus-lib interaction,<br>
which is fixed with the most recent commit<br>
<br>
505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses<br>
2d90700 pystemd: add copyright boilerplate to typing stubs<br>
5b95888 pystemd: update branch name in github workflow<br>
16817d2 Add type stub for pystemd.run<br>
410fd77 (tag: v.0.9.0) update changelog for 0.9.0<br>
71aae43 GetProcesses() - info about systemd version (#59)<br>
fcafd08 Also include .pxd and .pxi in the source distribution<br>
475cd2f also support 3.9<br>
ea98275 some formatting options and start pystemd 0.9 development<br>
eb7d225 pystemd: update install instructions in README<br>
6fdf2c8 Daily `arc lint --take BLACK`<br>
50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)<br>
<br>
Signed-off-by: Johannes Schneider &lt;johannes.schneider@leica-geosystems.c=
om&gt;<br>
---<br>
&nbsp;.../{python3-pystemd_0.8.0.bb =3D&gt; python3-pystemd_0.10.0.bb}&nbsp=
; | 5 ++---<br>
&nbsp;1 file changed, 2 insertions(+), 3 deletions(-)<br>
&nbsp;rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =
=3D&gt; python3-pystemd_0.10.0.bb} (62%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b=
/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb<br>
similarity index 62%<br>
rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb<br=
>
rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb<br>
index 0056a794f..da263fe94 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb<br>
@@ -2,13 +2,12 @@ SUMMARY =3D &quot;Python bindings for interacting with sy=
stemd over DBus&quot;<br>
&nbsp;LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D4fbd65380c=
dd255951079008b364516c">file://LICENSE;md5=3D4fbd65380cdd255951079008b36451=
6c</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;f993739eca645749f18d4ccfd4a0fbf3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;cac2e42043ab28d43adf33dab493c6a3cf8a99794f824=
ae8af6d9cd6458b9972&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b0=
3e7e29ec811fa2ae859&quot;<br>
<br>
&nbsp;DEPENDS =3D &quot;systemd&quot;<br>
&nbsp;RDEPENDS:${PN} +=3D &quot;python3-xml python3-pprint&quot;<br>
&nbsp;REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
<br>
-inherit pypi setuptools3 features_check<br>
+inherit pypi setuptools3 features_check pkgconfig<br>
<br>
&nbsp;BBCLASSEXTEND =3D &quot;native&quot;<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9DB6PR06MB4008eurp_--

