Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPWNK-0008VA-Ay
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 12:01:34 +0200
Received: by bkcjm2 with SMTP id jm2so289212bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LWzZm57fIHWKlXUOSERWcDTnk0nKPdQXS4PofIiJlm4=;
	b=b7tDnhTlKRwd739ZcsLLlWWFHuCIxSTfeNBifP84qD42vlBBcGL/zy/34KSC0IaBFx
	FpavE9cSaGf8MTQ6o/9d3aEp/w4MaipOaFAfPFnMF91fmTniQo/EvrsomfLd4IF/Y4kw
	GA1Zk1RIaaMB3Qdj3sEufmfXwIt9v9qcFU6gSI08L5WexPLeS/Mm/pnr8Z+1XWTj6lo/
	ZW1HeAvM49BP7SiUUZLUnIcirIm3l/WyXZCwGC71e+MeEVR0faiw3Rt3ftpz1Zu+u3BW
	Ko3hOfa2MfaCo+YdJdkGqZdl9wODwUpjcaQfcu221oagsZRFtDU7pEMt77v9ILz1wFIH
	c4Nw==
Received: by 10.204.152.138 with SMTP id g10mr8857385bkw.98.1335952310107;
	Wed, 02 May 2012 02:51:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v2sm2418308bkw.16.2012.05.02.02.51.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:51:49 -0700 (PDT)
Date: Wed, 2 May 2012 11:51:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120502095150.GA3682@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 10:01:34 -0000
X-Groupsio-MsgNum: 38527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 11:45:30AM +0200, Koen Kooi wrote:
> From: Khem Raj <raj.khem@gmail.com>

I'm not using gcc-4.5, but aren't those 3 patches only for master? As
gcc-4.7 and other gcc changes were in oe-core only after release AFAIK.

Cheers,

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Tested-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   47 ++++++++++++++=
+-----
>  1 file changed, 36 insertions(+), 11 deletions(-)
>=20
> diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolcha=
in-layer/recipes-devtools/gcc/libgcc_4.5.bb
> index 1579c8b..ecef5e7 100644
> --- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> @@ -1,33 +1,46 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
> =20
> -
>  INHIBIT_DEFAULT_DEPS =3D "1"
> +
>  DEPENDS =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
> =20
>  PACKAGES =3D "\
>    ${PN} \
>    ${PN}-dev \
> +  ${PN}-dbg \
> +  libgcov-dev \
>    "
> =20
>  FILES_${PN} =3D "${base_libdir}/libgcc*.so.*"
>  FILES_${PN}-dev =3D " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
> -  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> +FILES_libgcov-dev =3D " \
> +  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
> =20
> -do_fetch[noexec] =3D "1"
> -do_unpack[noexec] =3D "1"
> -do_patch[noexec] =3D "1"
> -do_configure[noexec] =3D "1"
> -do_compile[noexec] =3D "1"
> +FILES_${PN}-dbg +=3D "${base_libdir}/.debug/"
> =20
> -do_install () {
> +do_configure () {
>  	target=3D`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
> -
> -	# Install libgcc from our gcc-cross saved data
>  	install -d ${D}${base_libdir} ${D}${libdir}
> -	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${D}
> +	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
> +	mkdir -p ${B}/${PN}
> +	cd ${B}/${PN}
> +	chmod a+x ${S}/${PN}/configure
> +	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +	target=3D`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> +	cd ${B}/${PN}
> +	oe_runmake MULTIBUILDTOP=3D${B}/$target/${PN}/
> +}
> +
> +do_install () {
> +	target=3D`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> +	cd ${B}/${PN}
> +	oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/$target/${PN}/ install
> =20
>  	# Move libgcc_s into /lib
>  	mkdir -p ${D}${base_libdir}
> @@ -36,7 +49,19 @@ do_install () {
>  	else
>  		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
>  	fi
> +
> +	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
> +	# so that cross-gcc can find it in the sysroot
> +
> +	mv ${D}${libdir}/gcc/* ${D}${libdir}
> +	rm -rf ${D}${libdir}/gcc/
>  }
> =20
> +do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}libc:do_package"
> +do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}libc:do_package"
> +do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}libc:do_package"
> +
>  BBCLASSEXTEND =3D "nativesdk"
> =20
> +INSANE_SKIP_libgcc-dev =3D "staticdev"
> +INSANE_SKIP_libgcov-dev =3D "staticdev"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+hA7YACgkQN1Ujt2V2gBzmjgCdHte2oonZNWRGgrH5BNajzIWn
pTUAn1Nmfe3msjEE1SZWkXotHZbQ46TN
=SAKx
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
