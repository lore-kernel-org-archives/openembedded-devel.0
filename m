Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C694C10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 13:59:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web10.35553.1715522360727499200
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 06:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mLJYNG9/;
 spf=pass (domain: axis.com, ip: 40.107.7.75, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjAmB/VGBVYq5Uk+DypmRYlpzvXN8SbjniFgu91Dqv6q1b8j4seJ9isj8XTA5xrJI0Zj5qM1lTdcrHVo5uj+AhlyWdXrHCpIstDEWmAbOVNfduYJUANStVjmNECsthu5Yk1oO5B382s4c+E/aGrx2lw8Zh9nVQ9cDW5taN5vGUXEibUgsmF32Q7wwd/aomhUnHKli6CDNnc2CbaytHI/l0f3kO5eWMaMuloxHw3ljOptvmR0hvecI7hbO8mIZdhn3jb6O+kscd8P90V1zZU7gTia2/rotlal0x13YM5se14dZPvwwzRQNuS/N37Ne6zQ5Lfx9oLN9Y156eJYcJS0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvJxQiBxBtBOSUyf3Pgj3Xn8nrfX0I9BBA+k5PKmu/w=;
 b=j4PPoUtgJ3SpRWMOrg4eM3HHPOMKgh2CgnO5VxIHTaAthcUcElKOs/UoORICfdoyK1awOZFBP9zozjTP4nQaEmDq5MZ1NKsPOikLhrW6gILTh9Lu/WnzVy6KxfX5aPhfE7w0Y3sVtgpQ9FjnoM5FQ9HEWBgiiwyrE3tclivMHKTg2GWyNoJYCsfSCC6uRV+kDEBh8U06WPONxWfzcvbsvY39dtF8Asclnr3RgD/9DWB6bAXw80sBpa1le9BPdT0WHi1PYgyM3ExDgCj7crlrJDcG01vBtsKgzgPNT9Kuwv0+I7rAO8mdmlJSTxkZzey1p/qesHT4NCSHTdOSNrzeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvJxQiBxBtBOSUyf3Pgj3Xn8nrfX0I9BBA+k5PKmu/w=;
 b=mLJYNG9/HZPBDi0QChdx/qiLo3mc1t1pdOgZucsJVwY0bzFQ7b5IMwzU7OTlI03EOFZIbIA8qYEDVdaJ0cnqzQdV2arZ8ffSBnsfI0CKSmobFLvt4a/CtVRr7p/TYqRCg8zKSeOJw74sDe3k+Fkwc6kpsM7GaKCr+0uRrBlPMvw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9284.eurprd02.prod.outlook.com (2603:10a6:102:331::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 13:59:16 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7544.052; Sun, 12 May 2024
 13:59:16 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [PATCH v3 1/1] apache2: fix multilib file conflicts
Thread-Topic: [PATCH v3 1/1] apache2: fix multilib file conflicts
Thread-Index: AQHaoRZURdMa/IXteUuGr0dytZN61rGToWug
Date: Sun, 12 May 2024 13:59:16 +0000
Message-ID: 
 <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17CD719EC1248206.5708@lists.openembedded.org>
 <20240508070649.1657864-1-kai.kang@windriver.com>
In-Reply-To: <20240508070649.1657864-1-kai.kang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9284:EE_
x-ms-office365-filtering-correlation-id: df3527cb-8c7a-4d85-5f8e-08dc728bb666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Jo/LzYIPfT9ig6D5Mk9H4Eua48tMh0aXAR8v+gPw0UH2IiN/QB70vuUTxPns?=
 =?us-ascii?Q?seULS01AOq+rZc1fzgtePSjMbcWDfTRNWmg8yrWSfLfXLv2bA+tQEAgQRKah?=
 =?us-ascii?Q?Ia2LpMFxDatEPNGSr4gJRTmuDwDzueGDK4potbNLRXLcAyOjVeyPulNGCS8/?=
 =?us-ascii?Q?NZ7XLlRyW4nDgDJCIKGSmiFwisnZBSfjG5H5QvVajZZWacGgQ0596w4xTNGr?=
 =?us-ascii?Q?nHhn0q6txQ8vQuqQ9ZuBHVoB18C20aoyZTkJtK5FIEcve5cPCryFzmjTywXT?=
 =?us-ascii?Q?HiGgdmSGwbXBiIIoCuZkzfplWvjTLPZLTdvQihPGf1C5U9bcOUOR2g1xr8kN?=
 =?us-ascii?Q?6pKm8J+IiOh981/e3RJetwTkU+KaEU7uvl+VVl1QX7r1PH5EJu+KOsu8Cd83?=
 =?us-ascii?Q?wx4ew/1pfPBhJgHdvlG02Sd5WoQTKThHU8SIbF6hO//CZabazc4b+qrfIzJz?=
 =?us-ascii?Q?bVGWUbXU0WBR7i2KxdY2o3jLFGSoUV+wIHEeROPGHoQxleNpCHFP4UuWOIOU?=
 =?us-ascii?Q?nBzfvGRM2AJdhMfkJGDbKihyGVUrtotC2YsiCg+mvGoX61Tffbtvdktphy0U?=
 =?us-ascii?Q?Di9aFqMp1EJDrmuTB5fzStEYLVsxyYLjjfHjIOUyivLPX7izAKnBqqp6qMWc?=
 =?us-ascii?Q?qPr8CoZfR3z+1D9y8vyXA7lpLPybgFwGfpL0PrYjai80ac+wAxJpoJA+tR5v?=
 =?us-ascii?Q?rQ6xA1w4KgpShMouxmu33Q8b9AiC6CF5lkEyiVg2CIzrwiC7wwqUmoqp6Y0e?=
 =?us-ascii?Q?lwUC6m5KjVHd0UP/Ucp/Dz/JJDiuXG+LdZ2qF/kjevqPYz1IYtJff096rxqY?=
 =?us-ascii?Q?X/Jb2R6JjiBzCEJ9vcl7/6RIdDL0HQl/yG3n2A1ICu3PXoZ923FVfgLVZEWu?=
 =?us-ascii?Q?W3W/OUA1lgEuc8iv43tpzn+QDqlAjfmPGtqNBcvJ3FONRNE/VjZ9Mvc2qfUw?=
 =?us-ascii?Q?GCxEf51zjsbgA0JXN3YQSBNh2I3PlALQTXuCNsJCORwctdhu5dWHvAhY1G0I?=
 =?us-ascii?Q?jM12KdRtf6v4r1Y/xFFXa7fkPjfHSkQSJuWTdY1G4WWm4Sla0O4xz8SneQPo?=
 =?us-ascii?Q?n4jTxW4AKAHrOgcMpuf2qMzFXqyGygn/ipKDchXMvqv9sf5UaA4nswdADRKJ?=
 =?us-ascii?Q?MC/6Hy5FkxjYK82Zbmf7YX5ZcReOGIyZvnCuxwTvtwrvxLUL2o6LEidNL1yn?=
 =?us-ascii?Q?lg549drAHcyxHyiiIrzu3iQehcerRrVaNT0GrusLpibjYGEwFYXBGYuvgBjE?=
 =?us-ascii?Q?UXXNd6hPKWEOZPvUUHELliZOQCG3o6Hl/xOPshEpvSGTz6eyUWoJBS6fn0Mk?=
 =?us-ascii?Q?bTQAwrghZkzbXoAn/u+lrLGQ5MMFDRzVamib1ziZEc7fdg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FvO39BoXiha7YyC+TRvSAT4gsnyRf2Lwg/gWCYd6VsRjZWuv33WvGD90pXFz?=
 =?us-ascii?Q?OZJi9yjmR7kfwst0K1s0ZHHxOIl0Ug3lpjwaGLCyK/MUb2b+kRtor1daWQHf?=
 =?us-ascii?Q?EcphEwA9ZXfK41lrr0ulLLT6OBmHueFeBjoASbz1mYtd2oLFILlhzX2cQgz5?=
 =?us-ascii?Q?DKBOipIRJrwzCLRZ65I9YgX+eEwgYsTrMcOokZKi01L/OB+HgLazuc0spVNj?=
 =?us-ascii?Q?DbQqEuaNB1FCnlKCwoT4FPuhai21X6OkqYol8+/Y3YNMxFh4hGII6c0QQxuz?=
 =?us-ascii?Q?fQ3x5tK5Wd0Nxyupsi8cAm67XxevHgZd4mqZp3+SNqH3E31A67hC/DCrvsls?=
 =?us-ascii?Q?Zloj+CCbQ3FPY+C31OrRF+hGnjw24QmnagJYm2LPKxrXigARjDMX223VkEpB?=
 =?us-ascii?Q?gtjQ9ykDmmjrsf90L4f+81rk9rL80x2OfQ7/vFduIHTgamv7GM/lX/WXW8u6?=
 =?us-ascii?Q?xgbA6EI+vNKnOZX+c6xiY1fv5WgnU2NimW6/ztTAQSR5XM8TaxcIpqKkyek4?=
 =?us-ascii?Q?515BbWuSCxToB9WmwtI0sfNG+O4lA/jaT9VJV+LNZIXaS1vLH3tv+VaOr1H9?=
 =?us-ascii?Q?TDl5dTqTuYqSBji3azp3Fsvq14dydUEPcjOpf8LTLejluS9VWEt7qagTDLZG?=
 =?us-ascii?Q?6TG0vCyYSqWP3WkkjslkzCoWgCmV+BtP0d5fN9eXzVYxzJXDId8QiV5G9shh?=
 =?us-ascii?Q?tGGuTMQeXUdMzlqyjSdlwFZcHRioVF9fOu/M++1eqserU/hDLMlGzwUaaFtd?=
 =?us-ascii?Q?GIZSmK4M9mgGsmEhgMNtLj9netA6f6yWGeoftyt1nBzriMtCA9bbYd20vP9Z?=
 =?us-ascii?Q?0PfX2g/hpQKPSkXP030ow6lGTF/HC756kNShKlp+YWeaSfmgPtO3tmkBgYHU?=
 =?us-ascii?Q?dKDR0kdSfIARMCOpE4bCvgfJkN4b5cYgZqiMAtRNdzqOOxwFptPDE7wQ9azW?=
 =?us-ascii?Q?bk01bREDndhz0D2ABm1IsQOsbCOLyc8rtKjNZ6KcA/KzzlHm2LNHbcOwvlDj?=
 =?us-ascii?Q?XQVzscv+BrS87Sib5QrVzcaV47Phi8JaYaKY9ZGABsI6tLUSKwhkQwmbtEa0?=
 =?us-ascii?Q?n4txcu4cg2Yd5mj/qzXH6bOxHXZhyPGxr0wCFNZ7cexA8x1qmTb+3SOFU2BR?=
 =?us-ascii?Q?ALNdcZ9ad4blOokv0K5VKqLkTNJIXrzvWbiJAFVN2iJVDLhj5evEaH7jbBPZ?=
 =?us-ascii?Q?8tmcxXwSpeA6QBSdupg4l1rb1QFQe9quWg/WIXS59o9FAaFPyKb0uFYFDpu3?=
 =?us-ascii?Q?GN2P8VRzfVtdo2dU+OsthwufX2gi6ouGgAP6yynij11BhH5a8vz8SvA9+Os4?=
 =?us-ascii?Q?x2dZ7K+ixh7fEulXCNlCeMlzMtcPDLVUiabgSzpQ82skH/tQj2w6t7rgr167?=
 =?us-ascii?Q?XDs6F6kssyp2cll+XOhTLgvyZanwhieOToTDMIuFCoXWI33p7QPUh8W+umgg?=
 =?us-ascii?Q?N68bz1gGsEK8kwSxYu6c+N0Z7wtBHgNa2km3zSZ7DeUv1saRV9zreAD6MEdv?=
 =?us-ascii?Q?PoaEo0h4MA7B1PQPjyguvzBPEo8tHEnWTLEb22cHXq9zy+yrtcmLnszPRP/I?=
 =?us-ascii?Q?0SKrJXt1OrHf+UJkuTw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3527cb-8c7a-4d85-5f8e-08dc728bb666
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2024 13:59:16.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+FlgAIRk+Qk5bREQev0NeGM+Tg7vIOB6gINafksjs65It6SewD37AiFGPTc+xg4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9284
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 13:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110324

> -----Original Message-----
> From: kai.kang@windriver.com <kai.kang@windriver.com>
> Sent: den 8 maj 2024 09:07
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> There are file conflicts of apache2 when multilib enabled:
>=20
> Error: Transaction test error:
>   file /usr/share/apache2/build/config.nice conflicts between attempted
>     installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4=
.58-r0.armv7vet2hf_vfp
>   file /usr/share/apache2/build/config_vars.mk conflicts between
>     attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apach=
e2-dev-2.4.58-r0.armv7vet2hf_vfp
>=20
> Install the 'build' directory to ${libexecdir} by setting
> 'installbuilddir' to fix the conflicts. ${libexecdir} is not populated
> to sysroot by default, but command apxs requires these files, then add
> the dir to SYSROOT_DIRS to populate them.
>=20
> And inherit bbclasses multilib_script and multilib_header to fix follow
> up conflicts:
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
>  .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> index b96e8b4e1..59db22310 100644
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
> @@ -80,7 +80,9 @@ EXTRA_OECONF:class-native =3D "\
>      "
>=20
>  do_configure:prepend() {
> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' =
${S}/config.layout
> +    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \

I do not know if this was intentional or not, but the above changes the=20
location of the CGI directory for all layouts, where it previously only=20
changed the path used by the Debian layout.

It is not a problem for us as we do not use it anyway (we actually=20
remove it in our bbappend), but if it was intentional, it should be=20
mentioned in the commit message, and if it was not intentional, then=20
it should be reverted.

> +           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#'=
 \

This now works for us while using the RedHat layout.

> +           ${S}/config.layout
>  }
>=20
>  do_install:append:class-target() {
> @@ -119,14 +121,15 @@ do_install:append:class-target() {
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
> @@ -143,6 +146,8 @@ do_install:append:class-target() {
>=20
>      rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>      chown -R root:root ${D}
> +
> +    oe_multilib_header apache2/ap_config_layout.h
>  }
>=20
>  do_install:append:class-native() {
> @@ -152,20 +157,22 @@ do_install:append:class-native() {
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
> @@ -178,6 +185,8 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>  ALTERNATIVE:${PN}-doc =3D "htpasswd.1"
>  ALTERNATIVE_LINK_NAME[htpasswd.1] =3D "${mandir}/man1/htpasswd.1"
>=20
> +MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/apxs"
> +
>  PACKAGES =3D "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${=
PN}"
>=20
>  CONFFILES:${PN} =3D "${sysconfdir}/${BPN}/httpd.conf \
> @@ -200,7 +209,7 @@ FILES:${PN}-utils =3D "${bindir}/ab \
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

//Peter


