Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C5DC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 10:19:21 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.9865.1636021159110817229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 03:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=GcPH6lf4;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636021159;
  x=1667557159;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=stiDOuqA3uMwd9jJqWHiElEXktA+Hkgkz5yDsQEwRUo=;
  b=GcPH6lf48aGm1DvPR9y4kvIMrnXHSHdfD3UxUk5Q55XRTeMODsc8z20b
   VBcPvNJjF6dP/UYNs6sXUnBc5UPtFQgtmcrGFYPwYHE1NmQh+YOlfeiPA
   hBnfhK3tr3q6p5kQXJ5GETZ8sYSvQBkthkrqUayTeduseVIU4ZSuXj7fF
   wCRSp0LAHlgO927d8oppe8ZUd66rct/X8Ha+c1CA4tHjrZ3vKLV6g5yPb
   hhuyzoBUXugob7YvsaYkUmmEJtLUAA2PMtPwTPuQcXJBLtAOYpiOv14O8
   oysM21u246cIKN5toZNq5gxiniOjYNvBNZvGPsoNChKWk+CgG6g9jCbph
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-webserver][PATCH] hiawatha: Create /var/log /var/run
 at runtime
Thread-Topic: [oe] [meta-webserver][PATCH] hiawatha: Create /var/log /var/run
 at runtime
Thread-Index: AQHX0UV5MK3ZPoJ37k2BoxV24YNkhKvzJ2Yw
Date: Thu, 4 Nov 2021 10:19:15 +0000
Message-ID: <249aaaa44f4242bab7011b1e15d35174@axis.com>
References: <20211104063025.151460-1-raj.khem@gmail.com>
In-Reply-To: <20211104063025.151460-1-raj.khem@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 10:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93817

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Khem Raj
> Sent: den 4 november 2021 07:30
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-webserver][PATCH] hiawatha: Create /var/log /var/run =
at runtime
>=20
> Move WEBROOT to /use/share/www from /var/www
> this paves the way to empty these dirs which
> then can be mounted freely

It is typically only /var/run and /var/log that are volatile so there=20
should not be any reason to move /var/www and /var/lib.

//Peter

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-httpd/hiawatha/hiawatha_10.12.bb  | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/me=
ta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
> index f66ec7d736..ff3c3bf659 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
> @@ -33,6 +33,7 @@ EXTRA_OECMAKE =3D " -DENABLE_IPV6=3DOFF \
>                    -DCMAKE_INSTALL_SBINDIR=3D${sbindir} \
>                    -DCMAKE_INSTALL_SYSCONFDIR=3D${sysconfdir} \
>                    -DCMAKE_INSTALL_LIBDIR=3D${libdir} \
> +                  -DWEBROOT_DIR=3D${datadir}/www/${BPN} \
>                    -DCMAKE_INSTALL_FULL_LOCALSTATEDIR=3D${localstatedir}"
>=20
>  do_install:append() {
> @@ -50,7 +51,26 @@ do_install:append() {
>          install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdi=
r}/system
>      fi
>=20
> -    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}" "${D}${local=
statedir}/run"
> +    # /var/log/hiawatha and /var/lib/hiawatha needs to be created in run=
time.
> +    # Use rmdir to catch if upstream stops creating these dirs, or adds
> +    # something else in /var/log.
> +    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
> +    rmdir ${D}${localstatedir}/lib/${BPN} ${D}${localstatedir}/lib
> +    rmdir ${D}${localstatedir}/run
> +    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
> +
> +    # Create /var/log/hiawatha at runtime.
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
> +        install -d ${D}${nonarch_libdir}/tmpfiles.d
> +        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_lib=
dir}/tmpfiles.d/${BPN}.conf
> +        echo "d ${localstatedir}/lib/${BPN} - - - -" >> ${D}${nonarch_li=
bdir}/tmpfiles.d/${BPN}.conf
> +    fi
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}$=
{sysconfdir}/default/volatiles/99_${BPN}
> +        echo "d root root 0755 ${localstatedir}/lib/${BPN} none" >> ${D}=
${sysconfdir}/default/volatiles/99_${BPN}
> +    fi
> +
>  }
>=20
>  CONFFILES:${PN} =3D " \
> @@ -61,4 +81,5 @@ CONFFILES:${PN} =3D " \
>      ${sysconfdir}/hiawatha/php-fcgi.conf \
>  "
>=20
> +FILES:${PN} +=3D "${datadir}/www/${BPN} ${nonarch_libdir}/tmpfiles.d"
>  FILES:${PN}-dev =3D "${libdir}/hiawatha/*${SOLIBSDEV}"
> --
> 2.33.1


