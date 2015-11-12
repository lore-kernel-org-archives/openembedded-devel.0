Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6C97F7722C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:43:19 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so162303631wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mWXof65CUkbP7pv4Md8Rn2EPRWvSI/De2oUZIYs4knw=;
	b=Y0jDW/VpF9tngpWAxsFXiNmpDphGWNkyQvZx5E098LLWgcv0G/KCZYgPiM60ICeZOv
	7xmGlb3Hdrlxksm463i2Mj8Qgv5pnlJWQpFdv+68R1FenVHoSYFQ98IRsJIf8995CNI0
	DnFcOKEqFHszn3iE8jhHvupmwRLyfZ1AoT9wmEnSdrkcMZSEAh9lQtByvHdZ83yujuTk
	QoVSNB7lakuNO3ru7pQGvkBF2IAuYsUBjhHgj3WpghW3/YU7cvPCQ1wdC+NlwVythO3i
	suaO22Zp2k1ug7hKEQkvnq5J5GMPp3MgZL8h8Y1wI6LGed0hOW63VIyf7PGQqg9xver8
	9htQ==
X-Received: by 10.194.179.162 with SMTP id dh2mr11562875wjc.17.1447346599531; 
	Thu, 12 Nov 2015 08:43:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bo7sm15301157wjb.46.2015.11.12.08.43.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 08:43:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 17:43:35 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112164335.GJ2574@jama>
References: <3A08034A-59A7-41B3-9B13-06CB92592BED@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3A08034A-59A7-41B3-9B13-06CB92592BED@gmail.com>
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
X-List-Received-Date: Thu, 12 Nov 2015 16:43:22 -0000
X-Groupsio-MsgNum: 58582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="451BZW+OUuJBCAYj"
Content-Disposition: inline

--451BZW+OUuJBCAYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 05:17:25PM +0100, Jens Rehsack wrote:
>=20
> Fix remaining QA issues (dependency-wise) like
>=20
>   WARNING: QA Issue: samba rdepends on libacl, but it isn't a build depen=
dency? [build-deps]
>   WARNING: QA Issue: samba rdepends on libavahi-client, but it isn't a bu=
ild dependency? [build-deps]

More issues were reported in:
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112=
665.html

Is it fixed somewhere else (there is another patchset for samba/waf) or can=
 you look into them?

WARN: samba: samba rdepends on cyrus-sasl, but it isn't a build dependency?
WARN: samba: samba rdepends on dmapi, but it isn't a build dependency?
WARN: samba: samba rdepends on libaio, but it isn't a build dependency?
WARN: samba: samba rdepends on libbsd, but it isn't a build dependency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: samba: samba-python rdepends on libbsd, but it isn't a build dependen=
cy?

> broken perl library path, having a default PACKAGECONFIG, but allow
> user-defined one and rely on PACKAGECONFIG instead of DISTRO_FEATURES.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 41 ++++++++++++++++=
------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe=
/recipes-connectivity/samba/samba_4.1.12.bb
> index af2cc1f..04df8a3 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -38,26 +38,40 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.g=
z \
>  SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
>  SRC_URI[sha256sum] =3D "033604674936bf5c77d7df299b0626052b84a41505a6a6af=
e902f6274fc29898"
> =20
> -inherit systemd waf-samba
> +inherit systemd waf-samba cpan-base perlnative
> =20
> -DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb libteven=
t libldb krb5 ctdb cups"
> -RDEPENDS_${PN} +=3D "openldap"
> +DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb libteven=
t libldb krb5 ctdb"
> =20
> -PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '',=
 d)}"
> -PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'syst=
emd', '', d)}"
> +SYSVINITTYPE_linuxstdbase =3D "lsb"
> +SYSVINITTYPE =3D "sysv"
> =20
> -PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '=
', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '=
${SYSVINITTYPE}', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'syste=
md', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'zero=
conf', '', d)} \
> +                   acl aio cups ldap \
> +"
> +
> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb',=
 '', d)}"
> +
> +PACKAGECONFIG[acl] =3D "--with-acl-support,---without-acl-support,acl"
> +PACKAGECONFIG[aio] =3D "--with-aio-support,---without-aio-support,libaio"
>  PACKAGECONFIG[fam] =3D "--with-fam,--without-fam,gamin"
> +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
> +PACKAGECONFIG[lsb] =3D ",,lsb"
> +PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
> +PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
>  PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> +PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
> =20
>  SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_t=
db2"
> -SAMBA4_PDB_MODULES=3D"pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_=
sam,pdb_samba4"
> +SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', '=
ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
>  SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,aut=
h_script,auth_samba4"
>  SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4=
_AUTH_MODULES}"
> =20
>  SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tev=
ent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> =20
> -PERL_VERNDORLIB=3D"${datadir}/perl5/vendor_perl/"
> +PERL_VERNDORLIB=3D"${libdir}/perl5/vendor_perl/${PERLVERSION}"
> =20
>  EXTRA_OECONF +=3D "--enable-fhs \
>                   --with-piddir=3D${localstatedir}/run \
> @@ -85,7 +99,7 @@ LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>  do_install_append() {
>      rmdir --ignore-fail-on-non-empty "${D}/${localstatedir}/run"
> =20
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',=
 d)}; then
>          install -d ${D}${systemd_unitdir}/system
>          for i in nmb smb winbind; do
>              install -m 0644 packaging/systemd/$i.service ${D}${systemd_u=
nitdir}/system
> @@ -97,11 +111,16 @@ do_install_append() {
>  	install -d ${D}${sysconfdir}/tmpfiles.d
>  	echo "d ${localstatedir}/log/samba 0755 root root -" \
>              > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
> -    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fa=
lse', d)}; then
> +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d=
)}; then
>  	install -d ${D}${sysconfdir}/init.d
>  	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
>  	update-rc.d -r ${D} samba.sh start 20 3 5 .
>  	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
> +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d=
)}; then
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samb=
a.sh
> +	update-rc.d -r ${D} samba.sh start 20 3 5 .
> +	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
>      fi
> =20
>      install -d ${D}${sysconfdir}/samba
> @@ -160,4 +179,4 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHON_=
BASEVERSION}/site-packages/.d
>                            ${libdir}/python${PYTHON_BASEVERSION}/site-pac=
kages/samba/dcerpc/.debug/* \
>                           "
> =20
> -FILES_${PN}-pidl =3D "${datadir}/perl5/vendor_perl/*"
> +FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
> --=20
> 2.4.9 (Apple Git-60)
>=20
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--451BZW+OUuJBCAYj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEwbYACgkQN1Ujt2V2gBxtCACeKD8XE6Uu5bZWQHdMO4auQt32
vBcAn36WgCkLiAONWc9Kk7vw52rGAtNR
=rfX3
-----END PGP SIGNATURE-----

--451BZW+OUuJBCAYj--
