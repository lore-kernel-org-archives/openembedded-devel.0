Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D557CC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 19:47:13 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.14696.1633204032460877839
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 12:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Asa+KM++;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633204033;
  x=1664740033;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eF27iLrnZWlwWfL4m82WCxpHl1MgmxUhh/T/Qzgvou4=;
  b=Asa+KM++i2udCAFC5U2alIzkYaAmVBQ+Rmi9VAsy6iVE92jRzNK0ZBFC
   lfPOMHmPtGKmXsvXGoXG/Rged2cY7fs4qJj9VqnJyubtC390wOOTFr9xU
   xWi5HX/NNJKuwbdmDppHtRgy2qbrdsnEnUBTIATGvNGvkgPa+5VQRQDSK
   baeRFAmgxS+pYszICEYiM4OZrjyvTTIS8hnt429rzCXjvW0rvNzySfkHe
   zudSev5MTvcCCbFpryfB4JDi284krWFtD+n4O4dTaEeqTlWexYrEp9yA6
   /M9t+YRqiQBg9yix6Y1OiorVhk3g82UsYOlraG1vAqQTTNLWeGsOT3jjH
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][hardknott][PATCH] libiio: Make libiio-python3
 depend on python3-core
Thread-Topic: [oe] [meta-oe][hardknott][PATCH] libiio: Make libiio-python3
 depend on python3-core
Thread-Index: AQHXq/fhS9K3/pSb3EG3An1RsQcqsKvANEQA
Date: Sat, 2 Oct 2021 19:47:08 +0000
Message-ID: <42820145fee146fca2c6bb2e4912d56e@axis.com>
References: <16A5B1C70FCAE87F.4591@lists.openembedded.org>
In-Reply-To: <16A5B1C70FCAE87F.4591@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Oct 2021 19:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93193

*ping*

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 17 september 2021 21:12
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][hardknott][PATCH] libiio: Make libiio-python3
> depend on python3-core
>=20
> Inheriting setuptools3 incorrectly adds the dependency on python3-core
> to libiio instead of to libiio-python3 where it belongs.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-
> oe/recipes-support/libiio/libiio_git.bb
> index d7e4cc60a..cfd9746bd 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -37,7 +37,10 @@ PACKAGECONFIG[libiio-python3] =3D "-DPYTHON_BINDINGS=
=3DON,-
> DPYTHON_BINDINGS=3DOFF"
>=20
>  PACKAGES =3D+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>=20
> -RDEPENDS_${PN}-${PYTHON_PN} =3D "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-
> stringold"
> +# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}=
-
> core
> +# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
> +RDEPENDS_${PN}_remove =3D "${PYTHON_PN}-core"
> +RDEPENDS_${PN}-${PYTHON_PN} =3D "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-
> ctypes ${PYTHON_PN}-stringold"
>=20
>  FILES_${PN}-iiod =3D " \
>      ${sbindir}/iiod \

