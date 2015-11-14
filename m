Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 66EC277323
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 09:18:52 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so112942469wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 01:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6bCmP8L/jquI9Ga3sgjMvGBhGFLVuGi5m7PKJsmRVMA=;
	b=cGg+S0wpzYfhrnuDrC06zmusz2ZsPNtXAtAdulpTfskGH/aPrz1zZy7wEIxgcm8Mkk
	J9avhujEu2pRO1u5oGRsPnzfjKPdjpFqSXErE1Zi4ePWHG8hGBjvbs3nJ00gr7ZfYbrc
	H7uPnbR7kYGV5BnZ6TTyUsRWiaoYf5ZpDQz7en+3K96Z3iA3qsDGmbfLmj9TFMIaChE1
	m53AeYaV1nXhUkUdndwLsNOvkbGHC07TLFkzzoyBkfwx8OU/kDvGkqs7aPz6xTobq70O
	O0941Vf2dEjPxX1krsLmZtxmQJvlRyDDW1Unph1BGe5V/Y80Z/g+VWBBgSTAOWUtLfsR
	BHsA==
X-Received: by 10.194.114.105 with SMTP id jf9mr16641573wjb.102.1447492732782; 
	Sat, 14 Nov 2015 01:18:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z131sm8010008wme.7.2015.11.14.01.18.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 01:18:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 14 Nov 2015 10:19:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151114091924.GB2564@jama>
References: <3A08034A-59A7-41B3-9B13-06CB92592BED@gmail.com>
	<20151112164335.GJ2574@jama>
MIME-Version: 1.0
In-Reply-To: <20151112164335.GJ2574@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2 1/3] samba: fix dependencies and QA issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Nov 2015 09:18:56 -0000
X-Groupsio-MsgNum: 58633
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 05:43:35PM +0100, Martin Jansa wrote:
> On Thu, Nov 12, 2015 at 05:17:25PM +0100, Jens Rehsack wrote:
> >=20
> > Fix remaining QA issues (dependency-wise) like
> >=20
> >   WARNING: QA Issue: samba rdepends on libacl, but it isn't a build dep=
endency? [build-deps]
> >   WARNING: QA Issue: samba rdepends on libavahi-client, but it isn't a =
build dependency? [build-deps]
>=20
> More issues were reported in:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/1=
12665.html
>=20
> Is it fixed somewhere else (there is another patchset for samba/waf) or c=
an you look into them?
>=20
> WARN: samba: samba rdepends on cyrus-sasl, but it isn't a build dependenc=
y?
> WARN: samba: samba rdepends on dmapi, but it isn't a build dependency?
> WARN: samba: samba rdepends on libaio, but it isn't a build dependency?
> WARN: samba: samba rdepends on libbsd, but it isn't a build dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: samba: samba-python rdepends on libbsd, but it isn't a build depend=
ency?
>=20
> > broken perl library path, having a default PACKAGECONFIG, but allow
> > user-defined one and rely on PACKAGECONFIG instead of DISTRO_FEATURES.

These are still detected in last test-dependencies build (with your patch i=
ncluded)

samba-4.1.12: samba rdepends on libbsd, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba rdepends on cyrus-sasl, but it isn't a build dependency=
? [build-deps]
samba-4.1.12: samba rdepends on dmapi, but it isn't a build dependency? [bu=
ild-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba-python rdepends on libbsd, but it isn't a build depende=
ncy? [build-deps]

> >=20
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ---
> >  meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 41 ++++++++++++++=
++------
> >  1 file changed, 30 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-=
oe/recipes-connectivity/samba/samba_4.1.12.bb
> > index af2cc1f..04df8a3 100644
> > --- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> > +++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> > @@ -38,26 +38,40 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar=
=2Egz \
> >  SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
> >  SRC_URI[sha256sum] =3D "033604674936bf5c77d7df299b0626052b84a41505a6a6=
afe902f6274fc29898"
> > =20
> > -inherit systemd waf-samba
> > +inherit systemd waf-samba cpan-base perlnative
> > =20
> > -DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb libtev=
ent libldb krb5 ctdb cups"
> > -RDEPENDS_${PN} +=3D "openldap"
> > +DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb libtev=
ent libldb krb5 ctdb"
> > =20
> > -PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '=
', d)}"
> > -PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'sy=
stemd', '', d)}"
> > +SYSVINITTYPE_linuxstdbase =3D "lsb"
> > +SYSVINITTYPE =3D "sysv"
> > =20
> > -PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
> > +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam',=
 '', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',=
 '${SYSVINITTYPE}', '', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'sys=
temd', '', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'ze=
roconf', '', d)} \
> > +                   acl aio cups ldap \
> > +"
> > +
> > +RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb=
', '', d)}"
> > +
> > +PACKAGECONFIG[acl] =3D "--with-acl-support,---without-acl-support,acl"
> > +PACKAGECONFIG[aio] =3D "--with-aio-support,---without-aio-support,liba=
io"
> >  PACKAGECONFIG[fam] =3D "--with-fam,--without-fam,gamin"
> > +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
> > +PACKAGECONFIG[lsb] =3D ",,lsb"
> > +PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
> > +PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
> >  PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> > +PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
> > =20
> >  SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap=
_tdb2"
> > -SAMBA4_PDB_MODULES=3D"pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wb=
c_sam,pdb_samba4"
> > +SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG',=
 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
> >  SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,a=
uth_script,auth_samba4"
> >  SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMB=
A4_AUTH_MODULES}"
> > =20
> >  SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!t=
event,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> > =20
> > -PERL_VERNDORLIB=3D"${datadir}/perl5/vendor_perl/"
> > +PERL_VERNDORLIB=3D"${libdir}/perl5/vendor_perl/${PERLVERSION}"
> > =20
> >  EXTRA_OECONF +=3D "--enable-fhs \
> >                   --with-piddir=3D${localstatedir}/run \
> > @@ -85,7 +99,7 @@ LDFLAGS +=3D "-Wl,-z,relro,-z,now"
> >  do_install_append() {
> >      rmdir --ignore-fail-on-non-empty "${D}/${localstatedir}/run"
> > =20
> > -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false=
', d)}; then
> >          install -d ${D}${systemd_unitdir}/system
> >          for i in nmb smb winbind; do
> >              install -m 0644 packaging/systemd/$i.service ${D}${systemd=
_unitdir}/system
> > @@ -97,11 +111,16 @@ do_install_append() {
> >  	install -d ${D}${sysconfdir}/tmpfiles.d
> >  	echo "d ${localstatedir}/log/samba 0755 root root -" \
> >              > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
> > -    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', '=
false', d)}; then
> > +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false',=
 d)}; then
> >  	install -d ${D}${sysconfdir}/init.d
> >  	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
> >  	update-rc.d -r ${D} samba.sh start 20 3 5 .
> >  	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
> > +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false',=
 d)}; then
> > +	install -d ${D}${sysconfdir}/init.d
> > +	install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/sa=
mba.sh
> > +	update-rc.d -r ${D} samba.sh start 20 3 5 .
> > +	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
> >      fi
> > =20
> >      install -d ${D}${sysconfdir}/samba
> > @@ -160,4 +179,4 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHO=
N_BASEVERSION}/site-packages/.d
> >                            ${libdir}/python${PYTHON_BASEVERSION}/site-p=
ackages/samba/dcerpc/.debug/* \
> >                           "
> > =20
> > -FILES_${PN}-pidl =3D "${datadir}/perl5/vendor_perl/*"
> > +FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
> > --=20
> > 2.4.9 (Apple Git-60)
> >=20
> >=20
> > --=20
> > Jens Rehsack - rehsack@gmail.com
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZG/JsACgkQN1Ujt2V2gBw/owCfb0tVoxg/2GWaXJ94eZUAbaIH
lmwAoJwin3tK7VixF0qbezWj8RF93iei
=RnQJ
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
