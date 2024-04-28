Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0D3C4345F
	for <webhook@archiver.kernel.org>; Sun, 28 Apr 2024 21:32:54 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web11.6272.1714339970237130715
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Apr 2024 14:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DeIGsAOM;
 spf=pass (domain: axis.com, ip: 40.107.6.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPGaERUMEK/fL/JTxM1YFw+AbzPP5ueXGbQa+SiRQw4UkTnZtsr0b9Vj8ivR7NGPYR+En5D0hVaxYFr1Ro6sZUDFdAM3gx8yf71hEEWdn6RuZLPeUSzAAZLXlJtcsbN0SQjMSVKqelR8LkWwYphDqx16AFXHCxZ/dzTm92RYkaaagFFr3cPHAduY2OhRVmaiKkdO2Tr+ZcdFN7OH50Ihg6sDFxlqQdzXoCXRplh0WoHSsHWKPydUTSIXn1skN6o8Rh2+1pmPx1+djHNNqEDwT3aiAjRMp4HTG6m3CkZz8sDaFM3u2WiNQH0djrNIfIQmjG7C53+Zn8i4QcO4tmEHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4YHYgkva9mB8TZTq87oK0KxMNl13OYvtmGf6vfBb/8=;
 b=S4Lqdo4SHPYepDf5dq0OKRmTWFB77V++evAQJiuiiZFbOBmBK2WkBp8xdNP3CFxBwG5YGztT7+AX9XGedu0Ng/06DLKnpwGM8inpe54hvPDajsnbYIbinoOukCHDGOlbAKcIHS4ui+hVqmTrFuHWT+tJp2jAGC8Eqwa6hXIRNHU466iBDLmjaw7pReMMOjgt23/bf5ONDFKYSl6RYIoc1BAcPR3DANa3pkscqhu1jO7gSXpwysYCPEJwLx6MZBvjqqOwAgKIc3BfVcZbc+HZhunPTR67eHvviGFMWvVpbtxb8s6nWUbP+0+u3eFMq5F+AhCKqTsHmxIhArEcAq/hzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4YHYgkva9mB8TZTq87oK0KxMNl13OYvtmGf6vfBb/8=;
 b=DeIGsAOMloEo7abIKULhZ0uIJLmxJhr9DtJdo9fAue/aAIvYGHbuDT8HyiIgjLjEmpxDXwKU+Wmmhxub/gQkqDjS7xbTr1YPk34m2NX1ODhM9n8Ks/7/Yz+0oCUJ/b64MUPSPUD9DhUkRMPqNpP7UZ4fDXINbOpMmHwuhIGaQ9U=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBBPR02MB10793.eurprd02.prod.outlook.com (2603:10a6:10:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sun, 28 Apr
 2024 21:32:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 21:32:46 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Kai Kang <kai.kang@eng.windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH v2] apache2: fix multilib files confliction
Thread-Topic: [oe] [PATCH v2] apache2: fix multilib files confliction
Thread-Index: AQHalr26WyxYfFCsnUOZZzVINkGVY7F+MnBw
Date: Sun, 28 Apr 2024 21:32:46 +0000
Message-ID: 
 <DB5PR02MB102136209B5AD04A5B968A792EF142@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240425030721.1613035-1-kai.kang@windriver.com>
In-Reply-To: <20240425030721.1613035-1-kai.kang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBBPR02MB10793:EE_
x-ms-office365-filtering-correlation-id: 840f8c02-c50b-4943-e552-08dc67cabf08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?9/en5e8vo2W9vCQDSSoywn5c78c/DWuf3XExVux1T4r/KofYD7flv+6zgRoh?=
 =?us-ascii?Q?pavkBfolIMErrLsQmdQvv5itg0oIk90Ol1RAaNturkJ88axj+waI0KMn+W6c?=
 =?us-ascii?Q?yotrqmP2E7vaaYgElCKfEcXEM34rWoONB4EA+MJUaJpbEtBIBShmkQJqVDGe?=
 =?us-ascii?Q?W9kvlZ0cuUavQSXfXCtM4YsTiIwzWBs6GTMExqj6pw8kTTeAeMST8ddtCW+w?=
 =?us-ascii?Q?L4RZdNmDsju0i+J2OQ5fjhmFtzBAgyq8S6r2vnEdRcYHl0tberSDehVLNI2P?=
 =?us-ascii?Q?hhbH7zz6Ipg4NZ5qYqu6TlfMTc1zJQ9RkPpAPLHk/U55dqNYb9aJoP9gIs0I?=
 =?us-ascii?Q?oQExqM5lW9x40QPEaSqu8idaFmGOgzySA/4NA8bJX/VaAyP9d+tqWjQk0wmf?=
 =?us-ascii?Q?8wsbMHvwJphErg8waGfNy4LpvMaQCKq6EdoRu/S1J9ASnfxuWPx3HF+NAA4j?=
 =?us-ascii?Q?SYDXPZC3CqMMrmxSfQcJyyVIwfRWDzAg2c4lRT3wZIskLXL+TWOnaSYLXDeX?=
 =?us-ascii?Q?jobWO25spYG7TolgTVdQ9NbIO5CtUIhzTw/i9mumwamuRF9ic3r3DTayzeS/?=
 =?us-ascii?Q?zaJ5QSII/TpfniB9kHYQbjxYr+yD8AjVcDVdMrstqBGC8tYEsah7Ce7iD+y2?=
 =?us-ascii?Q?1W2wwqkKwCtegRiEHNJZpKqXPcftmdU89mNY8KHhmSFPfxE7rSnM7NUhIbUE?=
 =?us-ascii?Q?lPH80xt45M6BjjUV0FVLC5CN7u+Suc2peI9cf216W5kjp7YTlkN69Mg9RD7E?=
 =?us-ascii?Q?/nKWYw67/L5HpgdXCj5rjx80p+C2T5ArsaKvzI2V4arxLQ+Oa7Lm0xYvaY2l?=
 =?us-ascii?Q?BEqliDN9/X+nduij7YEtjhEa0I5KjuzDCKIfVrgcr8Ol/mX1YrDpA6qyoZ54?=
 =?us-ascii?Q?Tf7HPobodvChV42Xu7cNTYKxqOOkERFy+hwOvjErCBLYC/RBs2+5DjmN+rwg?=
 =?us-ascii?Q?T1c8V6PdszAmlDeP49F0DspUEQXD3hhsbbSz6dLbIl9hn3aLIq/3EmG9+fdB?=
 =?us-ascii?Q?w/7Kd3c/f16vj/3RmstGfyhNRGM3wZiy/yz23nJLxIu5YyQ2/x28CmFeTOm3?=
 =?us-ascii?Q?wHqhFegMOgrFGl4rX31vbh0QIVl6LRANRQRCHwE1BAGrmyKJdqA6E3wn4H92?=
 =?us-ascii?Q?h45n64qDNELldbBmrK3i8VMd5le2nIve9TCXugPQow6kFgLjt8BoO5L5C5Nr?=
 =?us-ascii?Q?NAnu5gRlzcjaPaYBl2nE45j57XSVr4/oLTMBnke8VP0zbt/z8ZV635TLf+3a?=
 =?us-ascii?Q?Gaqz5G83LgF/013mHgKFQXqzhc4DTlZZ8obL32QTl9SpVZ/OJvoNq9GumaGV?=
 =?us-ascii?Q?0DJzLFFn9TW3hMHFM9PqLVeE2zRq4XPdR/k9pw4hVCTc3Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Cp1OMtCETXYkViz1AfNUiTSqvkDcLzmCsQCxIHt3dh8+U/kBpEyzm4uyv2+1?=
 =?us-ascii?Q?FWE6Zt4OLWRqurRhVlS+CeWFLRsTnWmLHV5ZF/8IYVf/MBFV2gHgJHAzOc20?=
 =?us-ascii?Q?AHJMoDgIzSXI0+hA9bRVSe+rnrA81uZYIQQ8RkbDA/xm5G/7A0eyvs47UDRf?=
 =?us-ascii?Q?OlMEu0ix5wmiyFAST9PwPY8ldVS5mAjUOwARpe+HPmNB2LWizje19OR69GtC?=
 =?us-ascii?Q?E2wXtgEbNedqI+oZpS+dnmsJfdZ5RH7jF5oXk8ScXX1o6CZwdtDFDqs5nPA5?=
 =?us-ascii?Q?dB5pqudd3keKuKBEGL1rqSfH6o4fr7ASbw8QOveKLifOO4LH1cti4vwjIIu8?=
 =?us-ascii?Q?yg4F5Q8tT1EZYQMeNkf629tuXkVnTQwNK5EVn0JJmIi+o7tcw3pKt8abVtDR?=
 =?us-ascii?Q?lkHrPER2+BHOpXtt6UQOEMrK3We7u7ixLBNO9yKYm1ojb2Qi19R8WxfiAPZ3?=
 =?us-ascii?Q?4zjVx4kbGlObaCxNiprbUsZsWh5Y1GoZB+5B+T9BCEURxO5Q3GDJcJIahZrV?=
 =?us-ascii?Q?Oakk0JT/rohXcQjO4VhY0XqZpaq6JzKKn6UwWbd9xopeP3sqFZu3QfTKXNUM?=
 =?us-ascii?Q?MDZx5AMm2BQ0avG/bagtLWtwGMkQjHTgPj2Doh7kMdZQYdWbTHD5b9Yyy26H?=
 =?us-ascii?Q?X9xum9LDAJCJmj906YZ+JB2CGVFQPHVkEGOfVQHiLo8Cr9AYh257Ot4keojP?=
 =?us-ascii?Q?upiDAe/ELF8C2a8CdSCYoafcn8RZOlwIxfWO/5oCim2wjdK+YIO9bADisTbW?=
 =?us-ascii?Q?EY0+xwdlLqGGnoLbl+qMMwj7SrXrDsPPrGL4Ad9K4MqwZ1HJPWJaWd6zJvtk?=
 =?us-ascii?Q?AnI+dTkjZRsqS1IyHPxsHv7vPeoByGbZs7pIlqKhj05NuhvW0SwwfMHEX4sj?=
 =?us-ascii?Q?d0HAZd8xXf7aRW4mZ0Pl196OXJPX3dy0ShBcW/lTQcb/CWo9bmyc9orToj0q?=
 =?us-ascii?Q?CmGIzcZn3Yo05atRy2pQTP2OOPFLninu6HZJRBfSwkKftk6RsL+RUnLLJ0cn?=
 =?us-ascii?Q?EaUw/A6BfUppwFDmiG4MPGMmA1FuJb0dWpAb9B855a4KYcrUy4V5qIb0ceZa?=
 =?us-ascii?Q?q6sAcm3pgBIGf0fMwiZ8ScFLuBv9E8t4m3JhZp6C3NPDCoYBp1/g9oP9whSj?=
 =?us-ascii?Q?snKkReWMR6rqcFw+3pIoGc5tw7A45VGqF5Q2dVh2+xGzg8C+6Uha9js9OFU2?=
 =?us-ascii?Q?MLjOPvxC8uYZUL2bd5HbAX0WnCw3O0lVBpzImwWriDZNDalTkzRA/cy/Wh9S?=
 =?us-ascii?Q?U8os/XxmQeSalwWYg2fsOIcKR0GHg1QSuYxe7LLv1Iyb9p5q4YvmA5c241E+?=
 =?us-ascii?Q?Juc7TsP8CQGB+ixh19BLftdZOtD0xmaHTr772WYWiEhRE+A6lnLuJ7+0X46Z?=
 =?us-ascii?Q?/i+GqUQ64xrRP0RkdmrNI5Yjz0w/VcSvRfwBJkCXz7zZz5WGhJpCPLvRH2Uy?=
 =?us-ascii?Q?Iwn9GFP2NZ3TUu9lFZ11IVJTsGKqgXAfAfYf88eqjXqO6ZWv5qL/HiH89pTK?=
 =?us-ascii?Q?GEdNsFeHHS9LLqT044HVeNyej5vV1OUWsH07+HZa53oCaZtgsU36IQ2q5ork?=
 =?us-ascii?Q?yyTXPGXmiwCipYctCoQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840f8c02-c50b-4943-e552-08dc67cabf08
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 21:32:46.5633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2rDdn/mo0/njNexO6S4jDT0B2pXnDQIeqOw8ckOhCLaYIetIT9nBkuNvId3PzEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10793
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 21:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110164

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Kai Kang
> Sent: den 25 april 2024 05:07
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH v2] apache2: fix multilib files confliction
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> There are files confliction of apache2 when multilib enabled:
>=20
> Error: Transaction test error:
>   file /usr/share/apache2/build/config.nice conflicts between attempted
>     installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4=
.58-r0.armv7vet2hf_vfp
>   file /usr/share/apache2/build/config_vars.mk conflicts between
>     attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apach=
e2-dev-2.4.58-r0.armv7vet2hf_vfp
>=20
> Install the 'build' directory to ${libexecdir} to fix the confliction by
> setting 'installbuilddir'. ${libexecdir} is not populated to sysroot by
> default, but command apxs requires these files, then add the dir to
> SYSROOT_DIRS to populate them.
>=20
> And inherit bbclasses multilib_script and multilib_header to fix follow
> up conflictions:
>=20
>   file /usr/bin/apxs conflicts between attempted installs of
>     apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7=
vet2hf_vfp
>   file /usr/include/apache2/ap_config_layout.h conflicts between
>     attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apach=
e2-dev-2.4.58-r0.armv7vet2hf_vfp
>=20
> Since multilib_script inherits update-alternatives, remove it from
> inherit line for beautification.
>=20
> Fix buildpaths warning as well:
>=20
>   WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/sha=
re/apache2/build/config.nice
>            in package lib32-apache2-dev contains reference to TMPDIR [bui=
ldpaths]
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * still populate `.../build` directory after installed to ${libexecdir}
> * fix buildpaths warning
>=20
>  .../recipes-httpd/apache2/apache2_2.4.59.bb   | 38 ++++++++++++-------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> index b96e8b4e1..5b170fac3 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] =3D "ec51501ec480284ff52f637258135d3=
33230a7d229c3afa6f6c2f9040e
>=20
>  S =3D "${WORKDIR}/httpd-${PV}"
>=20
> -inherit autotools update-rc.d pkgconfig systemd update-alternatives
> +inherit autotools update-rc.d pkgconfig systemd multilib_script multilib=
_header
>=20
>  DEPENDS =3D "openssl expat pcre apr apr-util apache2-native "
>=20
> @@ -80,7 +80,10 @@ EXTRA_OECONF:class-native =3D "\
>      "
>=20
>  do_configure:prepend() {
> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' =
${S}/config.layout
> +    # only modify layout Debian which is adopted
> +    sed -i -e '/Layout Debian/,/\Layout/ s#\(cgidir:\s*\).*#\1${libexecd=
ir}/cgi-bin#g' \
> +        -e '/Layout Debian/,/\Layout/ s#\(installbuilddir:\s*\).*#\1${li=
bexecdir}/${PN}/build#g' \
> +        ${S}/config.layout
>  }
>=20
>  do_install:append:class-target() {
> @@ -119,14 +122,15 @@ do_install:append:class-target() {
>             -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,=
g; s,-ffile-prefix-map[^ ]*,,g' \
>             -e 's,${HOSTTOOLS_DIR}/,,g' \
>             -e 's,APU_INCLUDEDIR =3D .*,APU_INCLUDEDIR =3D ,g' \
> -           -e 's,APU_CONFIG =3D .*,APU_CONFIG =3D ,g' ${D}${datadir}/apa=
che2/build/config_vars.mk
> +           -e 's,APU_CONFIG =3D .*,APU_CONFIG =3D ,g' ${D}${libexecdir}/=
${PN}/build/config_vars.mk
>=20
>      sed -i -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
>             -e 's,${DEBUG_PREFIX_MAP},,g' \
>             -e 's,${RECIPE_SYSROOT},,g' \
>             -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,=
g; s,-fmacro-prefix-map[^ ]*,,g' \
>             -e 's,APU_INCLUDEDIR =3D .*,APU_INCLUDEDIR =3D ,g' \
> -           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/bu=
ild/config.nice
> +           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
> +           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/b=
uild/config.nice
>=20
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
>          install -d ${D}${sysconfdir}/tmpfiles.d/
> @@ -143,6 +147,8 @@ do_install:append:class-target() {
>=20
>      rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>      chown -R root:root ${D}
> +
> +    oe_multilib_header apache2/ap_config_layout.h
>  }
>=20
>  do_install:append:class-native() {
> @@ -152,20 +158,22 @@ do_install:append:class-native() {
>=20
>  SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " apache_sysroot_prepro=
cess"
>=20
> +SYSROOT_DIRS +=3D "${libexecdir}/${PN}/build"
> +
>  apache_sysroot_preprocess() {
>      install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>      install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crosssc=
ripts}
>      install -d ${SYSROOT_DESTDIR}${sbindir}
>      install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
> -    sed -i 's!my $installbuilddir =3D .*!my $installbuilddir =3D "${STAG=
ING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crosss=
cripts}/apxs
> -
> -    sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache=
2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^CFLAGS =3D -I[^ ]*!CFLAGS =3D -I${STAGING_INCDIR}/openssl=
!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_LDFLAGS =3D .*!EXTRA_LDFLAGS =3D -L${STAGING_LIBDIR=
}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_INCLUDES =3D .*!EXTRA_INCLUDES =3D -I$(includedir) =
-I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_=
vars.mk
> -    sed -i 's!--sysroot=3D[^ ]*!--sysroot=3D${STAGING_DIR_HOST}!' ${SYSR=
OOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!\(my $installbuilddir =3D \)"\(.*\)"!\1"${STAGING_DIR_HOST=
}\2"!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
> +
> +    sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache=
2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^CFLAGS =3D -I[^ ]*!CFLAGS =3D -I${STAGING_INCDIR}/openssl=
!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_LDFLAGS =3D .*!EXTRA_LDFLAGS =3D -L${STAGING_LIBDIR=
}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_INCLUDES =3D .*!EXTRA_INCLUDES =3D -I$(includedir) =
-I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/confi=
g_vars.mk
> +    sed -i 's!--sysroot=3D[^ ]*!--sysroot=3D${STAGING_DIR_HOST}!' ${SYSR=
OOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>  }
>=20
>  # Implications - used by update-rc.d scripts
> @@ -178,6 +186,8 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>  ALTERNATIVE:${PN}-doc =3D "htpasswd.1"
>  ALTERNATIVE_LINK_NAME[htpasswd.1] =3D "${mandir}/man1/htpasswd.1"
>=20
> +MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/apxs"
> +
>  PACKAGES =3D "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${=
PN}"
>=20
>  CONFFILES:${PN} =3D "${sysconfdir}/${BPN}/httpd.conf \
> @@ -200,7 +210,7 @@ FILES:${PN}-utils =3D "${bindir}/ab \
>  # We override here rather than append so that .so links are
>  # included in the runtime package rather than here (-dev)
>  # and to get build, icons, error into the -dev package
> -FILES:${PN}-dev =3D "${datadir}/${BPN}/build \
> +FILES:${PN}-dev =3D "${libexecdir}/${PN}/build \
>                     ${datadir}/${BPN}/icons \
>                     ${datadir}/${BPN}/error \
>                     ${includedir}/${BPN} \
> --
> 2.34.1

The above breaks if you use another layout than Debian. We have the followi=
ng=20
in our apache2_%.bbappend:

EXTRA_OECONF:remove =3D "--enable-layout=3DDebian --prefix=3D${base_prefix}=
"

EXTRA_OECONF:append:class-target =3D " \
    --enable-layout=3DRedHat \
    --sysconfdir=3D/run/${BPN} \
    --libexecdir=3D${libdir}/${BPN}/modules \
    ...
"

and with the above patch it now results in:

| sed: can't read .../tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apache2/2=
.4.58/image/usr/libexec/apache2/build/config_vars.mk: No such file or direc=
tory

Due to the fact that these changes are done using sed with an
:append:class-target, it is hard to override them in a subsequent bbappend.=
=20

Do you think you could introduce a variable for this path, e.g.,=20
installbuilddir =3D "${libexecdir}/${PN}/build"
(which should be ${libexecdir}/${BPN}/build to match the other paths) so=20
that it can easily be corrected if using another layout than Debian?

//Peter


