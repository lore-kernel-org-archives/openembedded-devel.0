Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 580EB7016E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 17:31:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so11452755wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9PIIgwDlHpw4FXiSXsDLTMUh5gAG2Xmsos/efiFM/+g=;
	b=aBpKqj9cQBed4rnI9+lQYWsWuKQH0AN7VS1ulAVbiUpZfb9jwXAD7e+S7EJqsl1SnI
	L7VLcCaJUntRIZ4E9AoyqSpErjMp3iWyhxg7V14kJ+BSRqdBxELLXy0ofDZPkAnnMGAY
	z76FruByBwUo4FRqzkUSAObpxAld9g0RLdqDAf1UZQgN8RCYWRBiiEF2SzDljaNyz64M
	swf9pY5JUZgGHX1Y9zdYf/7+b97/AAC/5dtXaonkBPWgGDJ2l9ZcFaMxTpFdB4wRPjL+
	E86G6H8CNMNSDYhYb2AqqTl8MZ83xzgR+bwV4pGtGjt6t0AJFJu8Ys0+EluHdRl1U/5L
	bJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9PIIgwDlHpw4FXiSXsDLTMUh5gAG2Xmsos/efiFM/+g=;
	b=BXGraT5Rko0O0MUY2lXUm+TqNZ2MM2RDIjzPRYGSZ9BLRWQEZtYqiuU763aghaRgIK
	18ZBUeyU2UNYhTQUK6ribMUQ6GTUQKDqEqoAttOPfNixhblwvcSwf+t1xEeinPmAn/X5
	yG3Q8kYRFLSH1WPGsqQ0WcumRkp3JLATJJ2TXu33FRgDPYb/6dfo17gJ/sjROJBgnIuD
	Mt2wdTjRm1pSbZ9GVrxbZTS0LNl7Ws6sFvcGOnLgs+wDikhgYTcvR9OP8jadOTGuvX/3
	Ur4B5xshnk5UcsAm79Mjhq4CmVQ4koIOxGeFLsz0uGz2jQVNcT+RrwH9fz8/ixT75Rqz
	962A==
X-Gm-Message-State: AD7BkJJ9mZHlOKxy1iOW/mZFXzh+2PYcUVn7QMSwpY8EWr/cH/vrViCQ15xHPNzjzJhDJQ==
X-Received: by 10.28.175.139 with SMTP id y133mr25485720wme.45.1457544701691; 
	Wed, 09 Mar 2016 09:31:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l7sm8933286wjx.14.2016.03.09.09.31.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 09:31:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 18:34:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160309173433.GF2542@jama>
References: <1457526838-18460-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1457526838-18460-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver][PATCH v3 1/3] nginx: split parts out of the recipe into nginx.inc
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
X-List-Received-Date: Wed, 09 Mar 2016 17:31:44 -0000
X-Groupsio-MsgNum: 60429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6BvahUXLYAruDZOj"
Content-Disposition: inline

--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 01:33:56PM +0100, Pascal Bach wrote:
> nginx has two maintained branches.
> - stable: is the long term maintained branch where only bugfixes occur
> - mainline: is the branch where new features get added

Still missing SOB lines in all 3 changes.

>=20
> This change is in preparation to support these two branches.
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc       | 137 +++++++++++++++=
++++++
>  meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb | 137 +--------------=
------
>  2 files changed, 139 insertions(+), 135 deletions(-)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx.inc
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
> new file mode 100644
> index 0000000..53e3235
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -0,0 +1,137 @@
> +SUMMARY =3D "HTTP and reverse proxy server"
> +
> +DESCRIPTION =3D "Nginx is a web server and a reverse proxy server for \
> +HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
> +concurrency, performance and low memory usage."
> +
> +HOMEPAGE =3D "http://nginx.org/"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0bb58ed0dfd4f5dbece3b52aba79f=
023"
> +SECTION =3D "net"
> +
> +DEPENDS =3D "libpcre gzip openssl"
> +
> +SRC_URI =3D " \
> +	http://nginx.org/download/nginx-${PV}.tar.gz \
> +	file://nginx-cross.patch \
> +	file://nginx.conf \
> +	file://nginx.init \
> +	file://nginx-volatile.conf \
> +	file://nginx.service \
> +"
> +
> +inherit update-rc.d useradd
> +
> +CFLAGS_append =3D " -fPIE -pie"
> +CXXFLAGS_append =3D " -fPIE -pie"
> +
> +NGINX_WWWDIR ?=3D "${localstatedir}/www/localhost"
> +NGINX_USER   ?=3D "www"
> +
> +EXTRA_OECONF =3D ""
> +DISABLE_STATIC =3D ""
> +
> +do_configure () {
> +	if [ "${SITEINFO_BITS}" =3D "64" ]; then
> +		PTRSIZE=3D8
> +	else
> +		PTRSIZE=3D4
> +	fi
> +
> +	echo $CFLAGS
> +	echo $LDFLAGS
> +
> +	./configure \
> +	--crossbuild=3DLinux:${TUNE_ARCH} \
> +	--with-endian=3D${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'littl=
e', 'big', d)} \
> +	--with-int=3D4 \
> +	--with-long=3D${PTRSIZE} \
> +	--with-long-long=3D8 \
> +	--with-ptr-size=3D${PTRSIZE} \
> +	--with-sig-atomic-t=3D${PTRSIZE} \
> +	--with-size-t=3D${PTRSIZE} \
> +	--with-off-t=3D${PTRSIZE} \
> +	--with-time-t=3D${PTRSIZE} \
> +	--with-sys-nerr=3D132 \
> +	--conf-path=3D${sysconfdir}/nginx/nginx.conf \
> +	--http-log-path=3D${localstatedir}/log/nginx/access.log \
> +	--error-log-path=3D${localstatedir}/log/nginx/error.log \
> +	--pid-path=3D/run/nginx/nginx.pid \
> +	--prefix=3D${prefix} \
> +	--with-http_ssl_module \
> +	--with-http_gzip_static_module \
> +	${EXTRA_OECONF}
> +}
> +
> +do_install () {
> +	oe_runmake 'DESTDIR=3D${D}' install
> +	rm -fr ${D}${localstatedir}/run ${D}/run
> +	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)};=
 then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /run/${BPN} - - - -" \
> +		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +	fi
> +	install -d ${D}${sysconfdir}/${BPN}
> +	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> +	install -d ${D}${NGINX_WWWDIR}
> +	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> +	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> +
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
> +	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
> +	sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
> +
> +	install -d ${D}${sysconfdir}/nginx
> +	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
> +	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
> +	install -d ${D}${sysconfdir}/nginx/sites-enabled
> +
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/defaul=
t/volatiles/99_nginx
> +	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatile=
s/99_nginx
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fals=
e',d)};then
> +            install -d ${D}${systemd_unitdir}/system
> +            install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitd=
ir}/system/
> +            sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> +                    -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> +                    -e 's,@BASEBINDIR@,${base_bindir},g' \
> +                    ${D}${systemd_unitdir}/system/nginx.service
> +        fi
> +}
> +
> +pkg_postinst_${PN} () {
> +	if [ -z "$D" ]; then
> +		if type systemd-tmpfiles >/dev/null; then
> +			systemd-tmpfiles --create
> +		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> +			${sysconfdir}/init.d/populate-volatile.sh update
> +		fi
> +	fi
> +}
> +
> +FILES_${PN} +=3D "${localstatedir}/ \
> +                ${systemd_unitdir}/system/nginx.service \
> +                "
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/nginx/nginx.conf \
> +		${sysconfdir}/nginx/fastcgi.conf\
> +		${sysconfdir}/nginx/fastcgi_params \
> +		${sysconfdir}/nginx/koi-utf \
> +		${sysconfdir}/nginx/koi-win \
> +		${sysconfdir}/nginx/mime.types \
> +		${sysconfdir}/nginx/scgi_params \
> +		${sysconfdir}/nginx/uwsgi_params \
> +		${sysconfdir}/nginx/win-utf \
> +"
> +
> +INITSCRIPT_NAME =3D "nginx"
> +INITSCRIPT_PARAMS =3D "defaults 92 20"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D " \
> +    --system --no-create-home \
> +    --home ${NGINX_WWWDIR} \
> +    --groups www-data \
> +    --user-group ${NGINX_USER}"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.9.11.bb
> index 8b60e53..d76bd9e 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
> @@ -1,139 +1,6 @@
> -SUMMARY =3D "HTTP and reverse proxy server"
> +require nginx.inc
> =20
> -DESCRIPTION =3D "Nginx is a web server and a reverse proxy server for \
> -HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
> -concurrency, performance and low memory usage."
> -
> -HOMEPAGE =3D "http://nginx.org/"
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0bb58ed0dfd4f5dbece3b52aba79f=
023"
> -SECTION =3D "net"
> -
> -DEPENDS =3D "libpcre gzip openssl"
> -
> -SRC_URI =3D " \
> -	http://nginx.org/download/nginx-${PV}.tar.gz \
> -	file://nginx-cross.patch \
> -	file://nginx.conf \
> -	file://nginx.init \
> -	file://nginx-volatile.conf \
> -	file://nginx.service \
> -"
>  SRC_URI[md5sum] =3D "76eb5853a1190e0cfc691aa21c545de3"
>  SRC_URI[sha256sum] =3D "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64=
ee8714e7b368a51f"
> =20
> -inherit update-rc.d useradd
> -
> -CFLAGS_append =3D " -fPIE -pie"
> -CXXFLAGS_append =3D " -fPIE -pie"
> -
> -NGINX_WWWDIR ?=3D "${localstatedir}/www/localhost"
> -NGINX_USER   ?=3D "www"
> -
> -EXTRA_OECONF =3D ""
> -DISABLE_STATIC =3D ""
> -
> -do_configure () {
> -	if [ "${SITEINFO_BITS}" =3D "64" ]; then
> -		PTRSIZE=3D8
> -	else
> -		PTRSIZE=3D4
> -	fi
> -
> -	echo $CFLAGS
> -	echo $LDFLAGS
> -
> -	./configure \
> -	--crossbuild=3DLinux:${TUNE_ARCH} \
> -	--with-endian=3D${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'littl=
e', 'big', d)} \
> -	--with-int=3D4 \
> -	--with-long=3D${PTRSIZE} \
> -	--with-long-long=3D8 \
> -	--with-ptr-size=3D${PTRSIZE} \
> -	--with-sig-atomic-t=3D${PTRSIZE} \
> -	--with-size-t=3D${PTRSIZE} \
> -	--with-off-t=3D${PTRSIZE} \
> -	--with-time-t=3D${PTRSIZE} \
> -	--with-sys-nerr=3D132 \
> -	--conf-path=3D${sysconfdir}/nginx/nginx.conf \
> -	--http-log-path=3D${localstatedir}/log/nginx/access.log \
> -	--error-log-path=3D${localstatedir}/log/nginx/error.log \
> -	--pid-path=3D/run/nginx/nginx.pid \
> -	--prefix=3D${prefix} \
> -	--with-http_ssl_module \
> -	--with-http_gzip_static_module \
> -	${EXTRA_OECONF}
> -}
> -
> -do_install () {
> -	oe_runmake 'DESTDIR=3D${D}' install
> -	rm -fr ${D}${localstatedir}/run ${D}/run
> -	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)};=
 then
> -		install -d ${D}${sysconfdir}/tmpfiles.d
> -		echo "d /run/${BPN} - - - -" \
> -		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> -	fi
> -	install -d ${D}${sysconfdir}/${BPN}
> -	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> -	install -d ${D}${NGINX_WWWDIR}
> -	mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> -	chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> -
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
> -	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
> -	sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
> -
> -	install -d ${D}${sysconfdir}/nginx
> -	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
> -	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
> -	install -d ${D}${sysconfdir}/nginx/sites-enabled
> -
> -	install -d ${D}${sysconfdir}/default/volatiles
> -	install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/defaul=
t/volatiles/99_nginx
> -	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatile=
s/99_nginx
> -
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fals=
e',d)};then
> -            install -d ${D}${systemd_unitdir}/system
> -            install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitd=
ir}/system/
> -            sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -                    -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> -                    -e 's,@BASEBINDIR@,${base_bindir},g' \
> -                    ${D}${systemd_unitdir}/system/nginx.service
> -        fi
> -}
> -
> -pkg_postinst_${PN} () {
> -	if [ -z "$D" ]; then
> -		if type systemd-tmpfiles >/dev/null; then
> -			systemd-tmpfiles --create
> -		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> -			${sysconfdir}/init.d/populate-volatile.sh update
> -		fi
> -	fi
> -}
> -
> -FILES_${PN} +=3D "${localstatedir}/ \
> -                ${systemd_unitdir}/system/nginx.service \
> -                "
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/nginx/nginx.conf \
> -		${sysconfdir}/nginx/fastcgi.conf\
> -		${sysconfdir}/nginx/fastcgi_params \
> -		${sysconfdir}/nginx/koi-utf \
> -		${sysconfdir}/nginx/koi-win \
> -		${sysconfdir}/nginx/mime.types \
> -		${sysconfdir}/nginx/scgi_params \
> -		${sysconfdir}/nginx/uwsgi_params \
> -		${sysconfdir}/nginx/win-utf \
> -"
> -
> -INITSCRIPT_NAME =3D "nginx"
> -INITSCRIPT_PARAMS =3D "defaults 92 20"
> -
> -USERADD_PACKAGES =3D "${PN}"
> -USERADD_PARAM_${PN} =3D " \
> -    --system --no-create-home \
> -    --home ${NGINX_WWWDIR} \
> -    --groups www-data \
> -    --user-group ${NGINX_USER}"
> +DISABLE_STATIC =3D ""
> \ No newline at end of file
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

--6BvahUXLYAruDZOj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgXqgACgkQN1Ujt2V2gByrpwCggcmp9/PYKiE0FZ635Q0AqKnU
fvsAoKH+aXxAP8azXbUEHs4jnOvdTvK2
=cN3o
-----END PGP SIGNATURE-----

--6BvahUXLYAruDZOj--
