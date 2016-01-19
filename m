Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E61536FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:34:46 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u188so139338960wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fymYeejTDX9v2URpWZzPn0DLnv1nlS1QW/J1/ctEm6E=;
	b=l3D7T5Ay3RdyWUwhRwobdYQDDrIF7M+lQyHNvDVjuI5IMwXZLHHu7cSsiRShpRSz+D
	lNKGNQVscnRu2eWN4s24D5GzMCCLRAl7e7B2o2BHpV2vHABF13S6LgRUa83E8HHrlP7U
	wVKH69vOEIAQdLxU4tcYPYG/nUiUuusZshcKmqOf5et9jsEXQRnopW1UYqaeR43+b+1U
	UYu6PYH6crilLuR2mAm/0PeGUnFwO8QYLmicYSLpNlmTF81uqdSOZ3fj1WyzZEj+ReNF
	qyKeQt5/mOk9EjN3f3ExdCX8Y6Hu3E5PjGUTO8SMee4yZ3a5DMinMZpgQ3mMQ9jQIZaj
	HFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=fymYeejTDX9v2URpWZzPn0DLnv1nlS1QW/J1/ctEm6E=;
	b=VTYQ+y4OSy5Bw9umOY2oS7x4WFp1l7PiWwc+9gxnMDyDsBsv1IAcZhrtjMZ4EKGjlO
	dQ3LUKzv70oIORzRSRrB7kwFecs0Vrr8XBdsI1Mta1Esk/lxqel/0ahLj5OQyzebtRbJ
	8T2ls+mRWBq+rIUDn2f88IMj6rvsLSjqTlfdrcGy7e07RyyfTBKDmJuGomLiPOSG8QLa
	WfPxQZrViKcqwiOnnX+y4KNgnTC4DLusvIjrRJMyO1ryJSqCPua/Y89/0eM8gImxWNtj
	U95Q5odxfu8WLmunMQXK4xMzTbiuZKZGOOt7gCRWfH0EOCQ0ugrXxeO2ovid5saS47w2
	gFEQ==
X-Gm-Message-State: AG10YOS34BVSd8n5b6yVr/Rnwxr19rn9PyUh/aoRSLgUZ8ceYefL4bX4deXAJOdWyYpYUQ==
X-Received: by 10.194.22.101 with SMTP id c5mr14560816wjf.151.1453203286892;
	Tue, 19 Jan 2016 03:34:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t195sm20114274wme.13.2016.01.19.03.34.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 03:34:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jan 2016 12:36:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160119113611.GA2611@jama>
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
	<CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
	<DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
	<CAF3KAoTy2xZ6a2KC3ci95fQ1QnH9-KSAuD2jpZ4vLeoqAc_ZQw@mail.gmail.com>
	<CA1094E9-AA29-4D48-9025-D3CC6E5A7C68@gmail.com>
	<CAF3KAoT-RZ-Ayq8D7c9x9_Nr7NXPW5qphV43NVWHQ_N0VUiYSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF3KAoT-RZ-Ayq8D7c9x9_Nr7NXPW5qphV43NVWHQ_N0VUiYSA@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Jan 2016 11:34:47 -0000
X-Groupsio-MsgNum: 59595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 07:41:40AM +0000, Bruno Vernay wrote:
> Here is a first try at a patch fixing OpenLDAP.
> I tested it on the Jethro branch and it works: from cleanall to the servi=
ce
> running in Qemu.

Can you send it with git send-email, so that your e-mail client doesn't
mangle the lines?

>=20
> From ee7ad184b3b500a711486f378e4a68fbd2a5ae11 Mon Sep 17 00:00:00 2001
> From: BrunoVernay <BrunoVern.a@gmail.com>
> Date: Tue, 19 Jan 2016 08:36:01 +0100
> Subject: [PATCH 1/1] Fixes build and configuration
>=20
> ---
>  .../recipes-support/openldap/openldap_2.4.42.bb    | 28
> +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> index 49fcb56..23586b7 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> @@ -148,6 +148,8 @@ PACKAGES +=3D "${PN}-overlay-proxycache"
>  # it was disabled for cross-compiling.
>  CPPFLAGS_append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=3D\'/dev/urandom\'"
>=20
> +LDFLAGS +=3D "-pthread"
> +
>  do_configure() {
>      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
>      rm -f ${S}/libtool
> @@ -166,7 +168,7 @@ LEAD_SONAME =3D "libldap-${LDAP_VER}.so.*"
>  PACKAGES +=3D "${PN}-slapd ${PN}-slurpd ${PN}-bin"
>=20
>  # Package contents - shift most standard contents to -bin
> -FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
> ${localstatedir}/openldap-data"
> +FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
> ${localstatedir}/${BPN}/data"
>  FILES_${PN}-slapd =3D "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindi=
r}
> ${localstatedir}/run ${localstatedir}/volatile/run \
>      ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
>      ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
> @@ -195,6 +197,18 @@ do_install_append() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/syst=
em/
>      sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_unitdir}/system/*.service
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
>=20
>  INITSCRIPT_PACKAGES =3D "${PN}-slapd"
> @@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?=3D "disable"
>=20
>  PACKAGES_DYNAMIC +=3D "^${PN}-backends.* ^${PN}-backend-.*"
>=20
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
> +    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$',
> 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=3DTrue,
> extra_depends=3D'', allow_links=3DTrue)
>      do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$',
> 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends=3D'',
> allow_links=3DTrue)
>=20
>      metapkg =3D "${PN}-backends"
> --=20
> 2.5.0
>=20
>=20
>=20
>=20
> On Thu, Jan 14, 2016 at 7:19 PM Khem Raj <raj.khem@gmail.com> wrote:
>=20
> >
> > > On Jan 14, 2016, at 9:22 AM, Bruno Vernay <brunovern.a@gmail.com> wro=
te:
> > >
> > > Thanks it works also.
> > >
> > > The second issue, that I still cannot resolve is that OpenLDAP requir=
es a
> > > .la or .so to load its modules.
> > > The openldap config specify a file name like "back_mdb" and expect
> > either a
> > > back_mdb.la or back_mdb.so
> > >
> > > but both la or so are limited to -dev in Yocto, I don't see how to
> > overcome
> > > this rule???
> >
> > you can reset e.g. FILES_SOLIBSDEV =3D =E2=80=9C"
> >
> > >
> > > Regards
> > >
> > >
> > > On Wed, Jan 13, 2016 at 7:36 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > >>
> > >>> On Jan 13, 2016, at 8:46 AM, Bruno Vernay <brunovern.a@gmail.com>
> > wrote:
> > >>>
> > >>> Adding this to my bbappend did the trick ...
> > >>>
> > >>> TARGET_CC_ARCH +=3D "-lpthread=E2=80=9D
> > >>
> > >> make it -pthread and add it to LDFLAGS
> > >>
> > >>>
> > >>> I may submit a patch
> > >>>
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaeH6oACgkQN1Ujt2V2gBzCoQCfZGScJoD6z2RpkubTg4LDHcK7
7y4AnA+UV/rc0UNq3r2l9GjNQQB/3zkR
=3RRk
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
