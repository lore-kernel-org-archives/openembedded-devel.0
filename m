Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC447724C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 13:56:10 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a4so106183232wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 05:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2LI6taOfRoUbv/Joz+3JT+rgc8HF0qaVdHtI2pu/yyI=;
	b=YXK/wHjVQBdtNnkYeaIMzvG+RrUBmfn8xzjhKowSQa4VXsINVurxihk+Fs5fm5U8Ch
	SHgE1isN6cmoEDntuBQGLHf4++Fxs5uD2btd+bKwJ3tepfw+m+p/EmLD2M3hy3JHj3Cy
	hfVOD3sHCMPCNZAWrcaM6a17FfluwUNj2MWz94jQdPniugSA/MAe5sduNCV/Afo0CEkl
	LYY3FB9sPCa6H92wBZJXX65LQ8x4MpbQ304spDRfnw+a7LMTYY142I4qAIuByXl12PTt
	pOzAcXcw5csqWnm59w5V30ort4za4esejtLhLLrlOUJGOPACALOCxK5VIzBImlZHVOLF
	Lu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=2LI6taOfRoUbv/Joz+3JT+rgc8HF0qaVdHtI2pu/yyI=;
	b=c9RW28tatY+PEnLzJAQmFu+Tw03JbV4pYETjwDeLMkMbouAFJVpvQDxdp1JTq8cgsW
	MV0gw/efYcm4FStPpEPm5yBLgDwL6bHy/GaalXgTTH9QbSvxrqK/yXsqffqyyBfhNImK
	KYfQ3xv4vNbpyApQB+2Plxc13LHOCZtO2fGYlzDdlq4QZP5GbEczlpo75GTzfkOKKbI2
	bIgeT3GXc7y0INREf4TWWwpU13Fbk6mjMeRx/LyZhqflYpKpdkqTs1EygqiE2+Xd54pM
	nC53/KrPoKyXkdceHDXUMuEF+ISb8gZBXKd4gnUGOlXfb4vIiZURSF0zYEG95s4KtPDj
	yIMQ==
X-Gm-Message-State: AG10YORGHr7gI/WI0kRSWpNik1CrhCS9i1gmd3iknV9RvTd119Q+4To79pTcBGpZRfNRxQ==
X-Received: by 10.28.189.212 with SMTP id n203mr2867180wmf.50.1455976571408;
	Sat, 20 Feb 2016 05:56:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w136sm12104101wmw.0.2016.02.20.05.56.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 05:56:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 20 Feb 2016 14:56:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160220135648.GB2589@jama>
References: <1454598194-11339-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1454598194-11339-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver][PATCH 1/2] nginx: make nginx user and home directory configurable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Feb 2016 13:56:11 -0000
X-Groupsio-MsgNum: 60049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 04:03:13PM +0100, Pascal Bach wrote:
> This allows selecting a different user then "www" in a bbappend.
> It also allows to change the default value of "/var/www/localhost" to som=
ething else.

Missing SOB line in all your patches, please resend.

> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb b/meta-web=
server/recipes-httpd/nginx/nginx_1.9.9.bb
> index 06d61c7..08f53a7 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.9.bb
> @@ -27,6 +27,9 @@ inherit update-rc.d useradd
>  CFLAGS_append =3D " -fPIE -pie"
>  CXXFLAGS_append =3D " -fPIE -pie"
> =20
> +NGINX_WWWDIR ?=3D "${localstatedir}/www/localhost"
> +NGINX_USER   ?=3D "www"
> +
>  EXTRA_OECONF =3D ""
> =20
>  do_configure () {
> @@ -71,9 +74,9 @@ do_install () {
>  	fi
>  	install -d ${D}${sysconfdir}/${BPN}
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> -	install -d ${D}${localstatedir}/www/localhost
> -	mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
> -	chown www:www-data -R ${D}${localstatedir}
> +	install -d ${D}${NGINX_WWWDIR}
> +	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> +	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> =20
>  	install -d ${D}${sysconfdir}/init.d
>  	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
> @@ -130,6 +133,6 @@ INITSCRIPT_PARAMS =3D "defaults 92 20"
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D " \
>      --system --no-create-home \
> -    --home ${localstatedir}/www/localhost \
> +    --home ${NGINX_WWWDIR} \
>      --groups www-data \
> -    --user-group www"
> +    --user-group ${NGINX_USER}"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbIcJ8ACgkQN1Ujt2V2gBz/GACeLV8jd7jAf/oYBiSorfnO4nQC
HHQAoICnB0s2a+wYANgs5TLt6pHmvoG8
=S4vg
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
