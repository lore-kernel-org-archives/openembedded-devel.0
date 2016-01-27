Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 05BB876EBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:55:15 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n5so24400120wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 03:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bRbxzpMbmzi3lhwzRS4ZO8iQrAXWChkEgaKFe9Jihsk=;
	b=WJPtMkBxZUo9rozfxf0CeUUGYgdFO6lz9fDZvCfwjozQw6TCeEDKlBDrzf6UGnvNRc
	EXME5T+fueE8zPczo31jhdZKd/dyOHfLtwduuUKPqYW9doV6QXNEPyRQ9Zh68DMWToYR
	A9ktP+cR6Yps7j/64mqB0Zzs1f9fIal8XlQb8BvYb9PYI1RHvfY4ES5cPqtEX/0CPFrt
	huMxRtcwv7ngDmzv3cCburNS92lO/BSTRVsOvFEQA+1e8Wo/R6Q2pOWLFnrS33v6qb81
	yP7WnNzXdyPJouQHTNCkkI/gDYk+MIaxwffiwNRyi7ChGTWp4oadHv6mIwTObLOQvA7h
	6rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=bRbxzpMbmzi3lhwzRS4ZO8iQrAXWChkEgaKFe9Jihsk=;
	b=XLZRQhnVPvmZqRAp1SUgEc0LAONErMJWkNFzwu2rZ554/MXb2O06ovD8dFRGWvXJ30
	wwTeQ+Fl9jbB5bJmn1ixcLw17o+KCK1X+dekd77MXHEVTQuDET1MWMBlttlC1i5wAnRW
	Zwtj/Vma55krq4U2uvcW6cPYru4kMg2HecyEO1bPEb8zkX9W5N5Tmsi58EjmPKwEYvHt
	uhQQ0CvP/CZsmkZ9c4XSuIoWZWnX+SZyvgPlX6Xs+C/vPw+LCnYQP9alvmrjI2ZLEnCK
	VTo/cE4WyU+LxqJeO/ASL5lIZIUsuBpKPIC/Drx78TkSGVhVfvwoc9l95X4RtsvusP8y
	IFvw==
X-Gm-Message-State: AG10YORUFKUOu2PbUjzW8DvYFleNZctLm1RDDin8PYkjRqzeYukpzllhkrT42GQBR5hSng==
X-Received: by 10.28.111.18 with SMTP id k18mr28100903wmc.86.1453895715007;
	Wed, 27 Jan 2016 03:55:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q75sm7996562wmd.6.2016.01.27.03.55.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 03:55:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 12:57:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127115726.GC2574@jama>
References: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] OpenLDAP modules
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
X-List-Received-Date: Wed, 27 Jan 2016 11:55:22 -0000
X-Groupsio-MsgNum: 59718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2016 at 10:31:31PM +0100, BrunoVernay wrote:
> ---

Please follow
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

and improve commit message and add your SOB-line.

>  .../recipes-support/openldap/openldap_2.4.42.bb    | 28 ++++++++++++++++=
+++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-o=
e/recipes-support/openldap/openldap_2.4.42.bb
> index 49fcb56..23586b7 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> @@ -148,6 +148,8 @@ PACKAGES +=3D "${PN}-overlay-proxycache"
>  # it was disabled for cross-compiling.
>  CPPFLAGS_append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=3D\'/dev/urandom\'"
> =20
> +LDFLAGS +=3D "-pthread"
> +
>  do_configure() {
>      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
>      rm -f ${S}/libtool
> @@ -166,7 +168,7 @@ LEAD_SONAME =3D "libldap-${LDAP_VER}.so.*"
>  PACKAGES +=3D "${PN}-slapd ${PN}-slurpd ${PN}-bin"
> =20
>  # Package contents - shift most standard contents to -bin
> -FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${loc=
alstatedir}/openldap-data"
> +FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${loc=
alstatedir}/${BPN}/data"
>  FILES_${PN}-slapd =3D "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindi=
r} ${localstatedir}/run ${localstatedir}/volatile/run \
>      ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
>      ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
> @@ -195,6 +197,18 @@ do_install_append() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/syst=
em/
>      sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*=
=2Eservice
> +
> +    # Uses mdm as the database
> +    #  and localstatedir as data directory ...
> +    sed -e 's/# modulepath/modulepath/' \
> +        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
> +        -e 's/database\s*bdb/database        mdb/' \
> +        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%=
' \
> +        -i ${D}${sysconfdir}/openldap/slapd.conf
> +
> +    mkdir -p ${D}${localstatedir}/${BPN}/data
> +
> +
>  }
> =20
>  INITSCRIPT_PACKAGES =3D "${PN}-slapd"
> @@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?=3D "disable"
> =20
>  PACKAGES_DYNAMIC +=3D "^${PN}-backends.* ^${PN}-backend-.*"
> =20
> +# The modules require their .so to be dynamicaly loaded
> +INSANE_SKIP_${PN}-backend-dnssrv  +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-ldap    +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-meta    +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-mdb     +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-monitor +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-null    +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-passwd  +=3D "dev-so"
> +INSANE_SKIP_${PN}-backend-shell   +=3D "dev-so"
> +
> +
>  python populate_packages_prepend () {
>      backend_dir    =3D d.expand('${libexecdir}/openldap')
> +    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-ba=
ckend-%s', 'OpenLDAP %s backend', prepend=3DTrue, extra_depends=3D'', allow=
_links=3DTrue)
>      do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'ope=
nldap-backend-%s', 'OpenLDAP %s backend', extra_depends=3D'', allow_links=
=3DTrue)
> =20
>      metapkg =3D "${PN}-backends"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaosKUACgkQN1Ujt2V2gByecwCbBHqVkd2h80OD1nce7ZnBzVmH
GesAnRPNelR52LtpIUiUcUnFETQXPJC+
=0ytj
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
