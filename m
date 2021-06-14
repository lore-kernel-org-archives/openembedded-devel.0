Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web08.64.1623700072050256405
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 12:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=p2hk7UYX;
 spf=pass (domain: nxp.com, ip: 40.107.22.55, mailfrom: alejandro.lozano@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQXGWS8A9p6qY6busTLTh/afwKWJgfeQd4jSVIysH+DqeEpd7K5WePpIDac79M6iqc18mU8PGbM17gRgPPfLdqStByTAbCU/niODXpnp9bMmJuDzeSVYqbFtE2C1F+yTkQmz4IZ7LJ8177pRG92MhHlNayfFqXryCb7avZNh1YXRNf5bJQurYZEP2JzUJCjnKvxv9zYkvGVZaGCgfZ6xGu9x3Q2h3svAokLGcmqHICo8ard250ucGrvxcVFdGBIfjTEwNn5og1pQZZVG0iFoG3xcMe94BLRNRPL+EOtCJ7usmbMzGHrTzU3C/5ILvIOL6zXcOOPW5JLMc2+iCFWW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZQDP+lHGb1Br4KN0Ar87Vd3NvEF61YKTY0JrXY8NbA=;
 b=RUc8ex+jBbR93m6dU0t/LP/Gg8XEupCWY/H3AhKvzLMJ6u0jH7Lr+E9DJaOAdegyl9Dc8Ill/CNm/6ViLMNhrV17TSKyRtgsPw99dyGRVnrk8wdMvOqizTPU3m1mK4aVJxIvAtmwOdHdnweUtFAcuJNYSL54DjuxQOWgK572YvPlxkJWibOR2R+Ihv+UoKVJqK+PTuBzkTlD1OhGd2IkT7AFDLovXNSbobTsinD8sacuRCc4ZyP1wUgJBifEkxP7/UrMmWMMJ5kcbKOL1mVWD3QDLoJTp/AAp/oirVz/qPZsI8jP2h9aS6XZpG+vDzhYGUUQpFb90BEcERZYacb3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZQDP+lHGb1Br4KN0Ar87Vd3NvEF61YKTY0JrXY8NbA=;
 b=p2hk7UYXLEy0/3ou0j9PAKW5vk7in/WcXjNVZfOqqTUzgp2/no7TvPkBlR375nSXVBK9oZsNxUWIOoWQ4YN7A6YylHhBS9mzOBG7mP3cXqKVPUR+ONsCpegtVNVp8IpeUngD0Af136owaRi0YIAV7bpZBt2cHmnE6abGgMDQQFA=
Received: from DB6PR04MB3045.eurprd04.prod.outlook.com (2603:10a6:6:10::12) by
 DB9PR04MB8092.eurprd04.prod.outlook.com (2603:10a6:10:24f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Mon, 14 Jun 2021 19:47:49 +0000
Received: from DB6PR04MB3045.eurprd04.prod.outlook.com
 ([fe80::699a:49ef:e764:303e]) by DB6PR04MB3045.eurprd04.prod.outlook.com
 ([fe80::699a:49ef:e764:303e%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 19:47:49 +0000
From: "Alejandro Lozano Lozano" <alejandro.lozano@nxp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: https://icedtea.classpath.org/ changed file structure. meta-java is no longer working.
Thread-Topic: https://icedtea.classpath.org/ changed file structure. meta-java
 is no longer working.
Thread-Index: AddeGysPHxX8yoaSTsmTnPDHNkm/SwDOihagAAAyuaA=
Date: Mon, 14 Jun 2021 19:47:49 +0000
Message-ID: 
 <DB6PR04MB3045A102CD5B795566AFF29990319@DB6PR04MB3045.eurprd04.prod.outlook.com>
References: 
 <DB6PR04MB304502E71EFCE6EAAB33995B90359@DB6PR04MB3045.eurprd04.prod.outlook.com>
 <DB6PR04MB3045DF333A89B42E2772C68090319@DB6PR04MB3045.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DB6PR04MB3045DF333A89B42E2772C68090319@DB6PR04MB3045.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [177.241.60.159]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6432f5dc-4630-4c57-3a55-08d92f6d4a3c
x-ms-traffictypediagnostic: DB9PR04MB8092:
x-microsoft-antispam-prvs: 
 <DB9PR04MB8092C2C5FA4741955B89D32E90319@DB9PR04MB8092.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5SCSZvmV1KR6H5ziUvIhCLuKU/5ymNko0TvPE1bgPOHLxM5jpH/3cxTU6WGLXJ1OCvBYaIeIRQ9GssmRAYzPwe9vpL1mXCf/K0aTCzE9lSGSoZHeaXuKJwj4qdTXztb+Q8DlGybWGOs6Lx7++5ov+is1fXVoUFZ2fKMrdZ/u7wY3op4UrEcQx6o/geAGmCdvihDzWeIzPa4IKJGXifAhNN3Yml7h9HMH5YhKHw6Z74e/IstgzWJMAMtzAoHdfukAEapnq2vC8fUSbyBW1QduqCYxn/I6sUis591Tcqbj8x6Gi0g0W2W8QjfIcVlDHz3BqZ0D12HIgw+TlEoF3jzt7Kq+cGuwwhicSeXbrFSfCDNGf0BMv8WuQd84Pql0HnVeeJ32u8rxhIjL4p4o8M7JlPGP1Pyf+rhbH4rXm/xxvMwuTN2zETOyKezhZE+2wTWtJBIZHlUShCui1Do+lHyc0xhaKJHxUcoMiG+gUmXhC2zg0+ae0VKTxyXXhxlTOx3I4TYkwZuXyi0/3Q+VJ8jb110J50eaxeQxXzaLlefvyyixs0OXsHI5JVPMo5gmi7ZlIil/MgPxSBWodnT0w66TurXSZeMhrTzD/l4lZoL4Z3Pq7BV1DslVi2BrXEKLmFJ+F0iMKd/kQiUd6qcN+ZDy7C4azCqG4BApKM5RMPrggTIcrUyxkRHQVvFAUQpB4yc/ZDsNq/bR/FcsMg90tGApxA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3045.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(366004)(376002)(86362001)(316002)(478600001)(26005)(2906002)(966005)(7696005)(33656002)(9326002)(186003)(8936002)(6916009)(6506007)(83380400001)(9686003)(122000001)(64756008)(38100700002)(5660300002)(55016002)(71200400001)(52536014)(166002)(2940100002)(66946007)(66446008)(66476007)(8676002)(76116006)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VBdQd3JPsIprLh/YN26W8Nu3pKGL1cgZbGtHCzMlNMtoDXJAHkDU+VE+yIbZ?=
 =?us-ascii?Q?Wjzh23IaFwrysBGzeY6vMYf6VTMz48s/xMAXa7dD9mforqsSzNnW2L0MQFpj?=
 =?us-ascii?Q?G5C3AHAmZ+ACUWkSotqTi+CQCMjw3RqZoSoudxcVhQht1Ffe2cxhbpm6H7bL?=
 =?us-ascii?Q?3bzeJr7rQbAuzR2eM28JmFcZRotzv3kPTfMIgRZIUp6bdH40sfJfc6c7m7qB?=
 =?us-ascii?Q?Zedn1ciaVKoQZdJv5fCuHvqxiiPC4oG+1289eDaJDC+zr9NzEOvF/uRMUJ4k?=
 =?us-ascii?Q?ZWOBgXjrAllldz85jvzikEi/+YiRT35vgcF5Mp3mN3654QydD6IKXO3LCoez?=
 =?us-ascii?Q?euvoo/b+BvXKD8oDbhlb/kuFL+vgZuwM3MB6b/SscJqdWCK/FeM+u3lSHLTC?=
 =?us-ascii?Q?B/ZI5obx+Y/RNWTyRSk/xqJLAqcnID6Rsm3ckiBj5b4bNCUT1EEd1I0kNEG0?=
 =?us-ascii?Q?BSLd1HSbzuBuq/D2v3I5wL1JJZYad/4NN3UkmFNdXpsx4najWjHiLgrxtlQD?=
 =?us-ascii?Q?GLQlrB5kroIuqqyzovm925x+RB074nZJXnwNmgU8c5GcuHsU2eEWwd9JoPA1?=
 =?us-ascii?Q?wCQFXOR/HkYby8Bivtc/XwlT5AJwJ+jFiOrGo5ruy4+WmHNghMNK0LCvrscL?=
 =?us-ascii?Q?5TyoFaMmvDrMW4rs9obL626IMi3r/dFpYFozunVr4VZQjy+3mszSpWCrsmA7?=
 =?us-ascii?Q?Q7JqrJA9z8PInU8txMatBQQmhIiC8nVnC9wP+3MgElMs3PDrujED+7Z9OCv9?=
 =?us-ascii?Q?hUqJ3bEd9zvb1zUkCvFDEtx8pcrVCMz7z25opNUz8iJ7Cl30w3MFRQE13pLr?=
 =?us-ascii?Q?usPvDczIYfhsZEqbqtjD570ZNdViq4uYeq8ubAwvg0MZWv6+/yKTSjWR1SWY?=
 =?us-ascii?Q?uY0jg0zD4NxhpnrJWTwjklu7CAWyo5bilsrDsUemysBU36OH4XivpFISUYwx?=
 =?us-ascii?Q?bb8o078YXlnra4veBRb5b5R/nOuuELRocW5r+GyFc+Ny7vYYA5y81xDoxvrf?=
 =?us-ascii?Q?HMUsdjGBehf6HiwKosh5xY28UygeiKu+pbR8QPz/xiSWTGaJtNv6+PkWs+XP?=
 =?us-ascii?Q?htvubpfAnBsw+0n97+J+WmdErmVcsu5B+SXf2Dm3BkjuPxH5gUXvcxAQKNwm?=
 =?us-ascii?Q?XZMLD0QEQfJL52UrGTK7+R6j9iC6UmylQQI2NthH5TNUJ+ltN/NAPw41GLm4?=
 =?us-ascii?Q?OltsdCKFDQ7oCikuVlI7XEuBtnzB/6OZbR5RBrqs6Ab+n2A6kN/3UfobZk4Y?=
 =?us-ascii?Q?98P5Xd4Y0A+401d66S1NPDH1Zs22iDEpfn4l/Wo1V6W49daUCgUELBMCgpl3?=
 =?us-ascii?Q?GL2pTX5PVRdj5EARdEO4JTeB?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6432f5dc-4630-4c57-3a55-08d92f6d4a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 19:47:49.2757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCduFVReGcsRlcXUTpVGWMCjgCpcPzBKe0DikvBnYG51Oq+vTnk8de8tlAo833Z3z5K15HdEDjZrpQDkVojkigOb2KOvW2vrcDflFlokeLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8092
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR04MB3045A102CD5B795566AFF29990319DB6PR04MB3045eurp_"

--_000_DB6PR04MB3045A102CD5B795566AFF29990319DB6PR04MB3045eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

It seems that the icedtea server changed the file structure, making meta-ja=
va to fail.

NOTE: Executing Tasks
WARNING: icedtea7-native-2.1.3-r1.0 do_fetch: Failed to fetch URL http://ic=
edtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada191.tar.b=
z2;name=3Dopenjdk;unpack=3Dfalse;downloadfilename=3Dopenjdk-f89009ada191.ta=
r.bz2, attempting MIRRORS if available
ERROR: icedtea7-native-2.1.3-r1.0 do_fetch: Fetcher failure: Fetch command =
export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export DBUS_S=
ESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export PATH=3D"/home=
/lozano/S32G/fsl-auto-yocto-bsp/sources/poky/scripts/native-intercept:/home=
/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/sysroots-uninativ=
e/x86_64-linux/usr/bin:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengras=
s_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-nati=
ve/usr/bin/python3-native:/home/lozano/S32G/fsl-auto-yocto-bsp/sources/poky=
/scripts:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/wor=
k/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/usr/bin/x86=
_64-linux:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/wo=
rk/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/usr/bin:/h=
ome/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-li=
nux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/usr/sbin:/home/lozano/=
S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea=
7-native/2.1.3-r1.0/recipe-sysroot-native/usr/bin:/home/lozano/S32G/fsl-aut=
o-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1=
.3-r1.0/recipe-sysroot-native/sbin:/home/lozano/S32G/fsl-auto-yocto-bsp/bui=
ld_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-=
sysroot-native/bin:/home/lozano/S32G/fsl-auto-yocto-bsp/sources/poky/bitbak=
e/bin:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/hostto=
ols"; export HOME=3D"/home/lozano"; /usr/bin/env wget -t 2 -T 30 --passive-=
ftp --no-check-certificate -O /home/lozano/S32G/fsl-auto-yocto-bsp/download=
s/openjdk-f89009ada191.tar.bz2 -P /home/lozano/S32G/fsl-auto-yocto-bsp/down=
loads 'http://icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f8=
9009ada191.tar.bz2' --progress=3Ddot -v failed with exit code 8, output:
--2021-06-10 17:02:36--  http://icedtea.classpath.org/download/icedtea7-for=
est-2.1/archive/f89009ada191.tar.bz2
Resolving icedtea.classpath.org (icedtea.classpath.org)... 172.104.137.120
Connecting to icedtea.classpath.org (icedtea.classpath.org)|172.104.137.120=
|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://icedtea.classpath.org/download/icedtea7-forest-2.1/archiv=
e/f89009ada191.tar.bz2 [following]
--2021-06-10 17:02:37--  https://icedtea.classpath.org/download/icedtea7-fo=
rest-2.1/archive/f89009ada191.tar.bz2
Connecting to icedtea.classpath.org (icedtea.classpath.org)|172.104.137.120=
|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-06-10 17:02:38 ERROR 404: Not Found.


ERROR: icedtea7-native-2.1.3-r1.0 do_fetch: Fetcher failure for URL: 'http:=
//icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada191.t=
ar.bz2;name=3Dopenjdk;unpack=3Dfalse;downloadfilename=3Dopenjdk-f89009ada19=
1.tar.bz2'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/lozano/S32G/fsl-auto-yocto-bsp/b=
uild_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/=
log.do_fetch.7450
ERROR: Task (/home/lozano/S32G/fsl-auto-yocto-bsp/sources/meta-java/recipes=
-core/icedtea/icedtea7-native_2.1.3.bb:do_fetch) failed with exit code '1'


Is there a different SRC_URI that can be used?


Saludos y Gracias,
Alejandro


--_000_DB6PR04MB3045A102CD5B795566AFF29990319DB6PR04MB3045eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It seems that the icedtea server changed the file st=
ructure, making meta-java to fail.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">NOTE: Executing Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: icedtea7-native-2.1.3-r1.0 do_fetch: Failed=
 to fetch URL
<a href=3D"http://icedtea.classpath.org/download/icedtea7-forest-2.1/archiv=
e/f89009ada191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse;downloadfilename=3Dope=
njdk-f89009ada191.tar.bz2">
http://icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada=
191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse;downloadfilename=3Dopenjdk-f89009=
ada191.tar.bz2</a>, attempting MIRRORS if available<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: icedtea7-native-2.1.3-r1.0 do_fetch: Fetcher =
failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGD=
ATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/100=
0/bus&quot;; export PATH=3D&quot;/home/lozano/S32G/fsl-auto-yocto-bsp/sourc=
es/poky/scripts/native-intercept:/home/lozano/S32G/fsl-auto-yocto-bsp/build=
_greengrass_rdb2/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/lozano/S=
32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7=
-native/2.1.3-r1.0/recipe-sysroot-native/usr/bin/python3-native:/home/lozan=
o/S32G/fsl-auto-yocto-bsp/sources/poky/scripts:/home/lozano/S32G/fsl-auto-y=
octo-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-=
r1.0/recipe-sysroot-native/usr/bin/x86_64-linux:/home/lozano/S32G/fsl-auto-=
yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3=
-r1.0/recipe-sysroot-native/usr/bin:/home/lozano/S32G/fsl-auto-yocto-bsp/bu=
ild_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe=
-sysroot-native/usr/sbin:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengr=
ass_rdb2/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-na=
tive/usr/bin:/home/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp=
/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/sbin:/h=
ome/lozano/S32G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-li=
nux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/bin:/home/lozano/S32G/=
fsl-auto-yocto-bsp/sources/poky/bitbake/bin:/home/lozano/S32G/fsl-auto-yoct=
o-bsp/build_greengrass_rdb2/tmp/hosttools&quot;;
 export HOME=3D&quot;/home/lozano&quot;; /usr/bin/env wget -t 2 -T 30 --pas=
sive-ftp --no-check-certificate -O /home/lozano/S32G/fsl-auto-yocto-bsp/dow=
nloads/openjdk-f89009ada191.tar.bz2 -P /home/lozano/S32G/fsl-auto-yocto-bsp=
/downloads 'http://icedtea.classpath.org/download/icedtea7-forest-2.1/archi=
ve/f89009ada191.tar.bz2'
 --progress=3Ddot -v failed with exit code 8, output:<o:p></o:p></p>
<p class=3D"MsoNormal">--2021-06-10 17:02:36--&nbsp; <a href=3D"http://iced=
tea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2=
">
http://icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada=
191.tar.bz2</a><o:p></o:p></p>
<p class=3D"MsoNormal">Resolving icedtea.classpath.org (icedtea.classpath.o=
rg)... 172.104.137.120<o:p></o:p></p>
<p class=3D"MsoNormal">Connecting to icedtea.classpath.org (icedtea.classpa=
th.org)|172.104.137.120|:80... connected.<o:p></o:p></p>
<p class=3D"MsoNormal">HTTP request sent, awaiting response... 301 Moved Pe=
rmanently<o:p></o:p></p>
<p class=3D"MsoNormal">Location: <a href=3D"https://icedtea.classpath.org/d=
ownload/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2">
https://icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ad=
a191.tar.bz2</a> [following]<o:p></o:p></p>
<p class=3D"MsoNormal">--2021-06-10 17:02:37--&nbsp; <a href=3D"https://ice=
dtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ada191.tar.bz=
2">
https://icedtea.classpath.org/download/icedtea7-forest-2.1/archive/f89009ad=
a191.tar.bz2</a><o:p></o:p></p>
<p class=3D"MsoNormal">Connecting to icedtea.classpath.org (icedtea.classpa=
th.org)|172.104.137.120|:443... connected.<o:p></o:p></p>
<p class=3D"MsoNormal">HTTP request sent, awaiting response... 404 Not Foun=
d<o:p></o:p></p>
<p class=3D"MsoNormal">2021-06-10 17:02:38 ERROR 404: Not Found.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: icedtea7-native-2.1.3-r1.0 do_fetch: Fetcher =
failure for URL: 'http://icedtea.classpath.org/download/icedtea7-forest-2.1=
/archive/f89009ada191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse;downloadfilenam=
e=3Dopenjdk-f89009ada191.tar.bz2'. Unable
 to fetch URL from any source.<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /home/lozano/S3=
2G/fsl-auto-yocto-bsp/build_greengrass_rdb2/tmp/work/x86_64-linux/icedtea7-=
native/2.1.3-r1.0/temp/log.do_fetch.7450<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task (/home/lozano/S32G/fsl-auto-yocto-bsp/so=
urces/meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_fetch) fai=
led with exit code '1'<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a different SRC_URI that can be used?<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Saludos y Gracias,<o:p></o:p></p>
<p class=3D"MsoNormal">Alejandro<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB6PR04MB3045A102CD5B795566AFF29990319DB6PR04MB3045eurp_--
