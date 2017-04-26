Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1654D77C76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 14:57:29 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1d3ONm-000691-PN from Joe_MacDonald@mentor.com ;
	Wed, 26 Apr 2017 07:57:30 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 26 Apr 2017 07:57:30 -0700
Received: by burninator (Postfix, from userid 1000)	id BAAA358093C; Wed, 26
	Apr 2017 10:57:29 -0400 (EDT)
Date: Wed, 26 Apr 2017 10:57:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170426145729.GF11025@mentor.com>
References: <20170420135735.25958-1-freesilicon@gmail.com>
	<CA+chaQcHQvssOS6gjeTWfKF2o0h+6gvxxrDEEk-N2jh7AYJoCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcHQvssOS6gjeTWfKF2o0h+6gvxxrDEEk-N2jh7AYJoCA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] strongswan: Split plugins
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
X-List-Received-Date: Wed, 26 Apr 2017 14:57:31 -0000
X-Groupsio-MsgNum: 66552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] strongswan: Split plugins] On 17.04.20 (=
Thu 16:36) Martin Jansa wrote:

> I think currently the preferred way is only one -dev/-dbg/-staticdev
> package per recipe.
>=20
> Why not set RDEPENDS_${PN} based on plugins packaged in first
> do_split_packages call?
>=20
> Just my 2c - I'm not using strongswan and Joe has last word for
> meta-networking.

Yeah, I've been giving this some thought and I'm inclined to agree.  The
RDEPENDS_${PN} being set with a canned list that doesn't reflect what
was configured for the build seems non-intuitive.

As for not breaking compatibility with the current configuration, if
RDEPENDS_${PN} is set based on the build, won't that come essentially
for free?

-J.

> On Thu, Apr 20, 2017 at 3:57 PM, David Vincent <freesilicon@gmail.com>
> wrote:
>=20
> > strongSwan offers a plugin mechanism therefore it should not be
> > mandatory to install all of them when installing the package. Each
> > plugin is now a self-contained package with the library and its
> > configuration.
> >
> > To remain compatible with the current configuration, a default set of
> > plugins has been selected as RDEPENDS of the main package. This default
> > list is based on the default strongSwan list minus some plugins enabled
> > via PACKAGECONFIG
> > (see https://wiki.strongswan.org/projects/strongswan/PluginList).
> >
> > Signed-off-by: David Vincent <freesilicon@gmail.com>
> > ---
> >  .../recipes-support/strongswan/strongswan_5.5.1.bb | 101
> > ++++++++++++++++++---
> >  1 file changed, 88 insertions(+), 13 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/strongswan/strongswan_
> > 5.5.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.=
bb
> > index f9e7ae3c1..d63214ba4 100644
> > --- a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
> > +++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
> > @@ -24,17 +24,17 @@ EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEA=
TURES',
> > 'systemd', '--with-syst
> >  PACKAGECONFIG ??=3D "charon curl gmp openssl stroke sqlite3 \
> >          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
> >  "
> > -PACKAGECONFIG[aesni] =3D "--enable-aesni,--disable-aesni,"
> > +PACKAGECONFIG[aesni] =3D "--enable-aesni,--disable-
> > aesni,,${PN}-plugin-aesni"
> >  PACKAGECONFIG[charon] =3D "--enable-charon,--disable-charon,"
> > -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
> > -PACKAGECONFIG[gmp] =3D "--enable-gmp,--disable-gmp,gmp,"
> > -PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,openldap,"
> > -PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5,"
> > -PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl=
,"
> > +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,
> > curl,${PN}-plugin-curl"
> > +PACKAGECONFIG[gmp] =3D "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gm=
p"
> > +PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,
> > openldap,${PN}-plugin-ldap"
> > +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-
> > mysql,mysql5,${PN}-plugin-mysql"
> > +PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-
> > openssl,openssl,${PN}-plugin-openssl"
> >  PACKAGECONFIG[scep] =3D "--enable-scepclient,--disable-scepclient,"
> > -PACKAGECONFIG[soup] =3D "--enable-soup,--disable-soup,libsoup-2.4,"
> > -PACKAGECONFIG[sqlite3] =3D "--enable-sqlite,--disable-sqlite,sqlite3,"
> > -PACKAGECONFIG[stroke] =3D "--enable-stroke,--disable-stroke,"
> > +PACKAGECONFIG[soup] =3D "--enable-soup,--disable-soup,
> > libsoup-2.4,${PN}-plugin-soup"
> > +PACKAGECONFIG[sqlite3] =3D "--enable-sqlite,--disable-
> > sqlite,sqlite3,${PN}-plugin-sqlite"
> > +PACKAGECONFIG[stroke] =3D "--enable-stroke,--disable-
> > stroke,,${PN}-plugin-stroke"
> >  PACKAGECONFIG[swanctl] =3D "--enable-swanctl,--disable-swanctl,,libgcc"
> >
> >  # requires swanctl
> > @@ -44,10 +44,85 @@ inherit autotools systemd pkgconfig
> >
> >  RRECOMMENDS_${PN} =3D "kernel-module-ipsec"
> >
> > -FILES_${PN} +=3D "${libdir}/ipsec/lib*${SOLIBS}
> > ${libdir}/ipsec/plugins/*.so"
> > -FILES_${PN}-dbg +=3D "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.=
debug
> > ${libexecdir}/ipsec/.debug"
> > -FILES_${PN}-dev +=3D "${libdir}/ipsec/lib*${SOLIBSDEV}
> > ${libdir}/ipsec/*.la ${libdir}/ipsec/plugins/*.la"
> > -FILES_${PN}-staticdev +=3D "${libdir}/ipsec/*.a ${libdir}/ipsec/plugin=
s/*.a"
> > +FILES_${PN} +=3D "${libdir}/ipsec/lib*${SOLIBS}"
> > +FILES_${PN}-dbg +=3D "${bindir}/.debug ${libdir}/ipsec/.debug
> > ${libexecdir}/ipsec/.debug"
> > +FILES_${PN}-dev +=3D "${libdir}/ipsec/lib*${SOLIBSDEV}
> > ${libdir}/ipsec/*.la"
> > +FILES_${PN}-staticdev +=3D "${libdir}/ipsec/*.a"
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/*.conf ${sysconfdir}/ipsec.d/*.conf
> > ${sysconfdir}/strongswan.d/*.conf"
> > +
> > +PACKAGES +=3D "${PN}-plugins"
> > +ALLOW_EMPTY_${PN}-plugins =3D "1"
> > +
> > +PACKAGES_DYNAMIC +=3D "^${PN}-plugin-.*$"
> > +NOAUTOPACKAGEDEBUG =3D "1"
> > +
> > +python split_strongswan_plugins () {
> > +    sysconfdir =3D d.expand('${sysconfdir}/strongswan.d/charon')
> > +    libdir =3D d.expand('${libdir}/ipsec/plugins')
> > +    dbglibdir =3D os.path.join(libdir, '.debug')
> > +
> > +    def add_plugin_conf(f, pkg, file_regex, output_pattern, modulename=
):
> > +        dvar =3D d.getVar('PKGD', True)
> > +        oldfiles =3D d.getVar('CONFFILES_' + pkg, True)
> > +        newfile =3D '/' + os.path.relpath(f, dvar)
> > +
> > +        if not oldfiles:
> > +            d.setVar('CONFFILES_' + pkg, newfile)
> > +        else:
> > +            d.setVar('CONFFILES_' + pkg, oldfiles + " " + newfile)
> > +
> > +    split_packages =3D do_split_packages(d, libdir,
> > 'libstrongswan-(.*)\.so', '${PN}-plugin-%s', 'strongSwan %s plugin',
> > prepend=3DTrue)
> > +    do_split_packages(d, sysconfdir, '(.*)\.conf', '${PN}-plugin-%s',
> > 'strongSwan %s plugin', prepend=3DTrue, hook=3Dadd_plugin_conf)
> > +
> > +    split_dbg_packages =3D do_split_packages(d, dbglibdir,
> > 'libstrongswan-(.*)\.so', '${PN}-plugin-%s-dbg', 'strongSwan %s plugin -
> > Debugging files', prepend=3DTrue, extra_depends=3D'${PN}-dbg')
> > +    split_dev_packages =3D do_split_packages(d, libdir,
> > 'libstrongswan-(.*)\.la', '${PN}-plugin-%s-dev', 'strongSwan %s plugin -
> > Development files', prepend=3DTrue, extra_depends=3D'${PN}-dev')
> > +    split_staticdev_packages =3D do_split_packages(d, libdir,
> > 'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s pl=
ugin
> > - Development files (Static Libraries)', prepend=3DTrue, extra_depends=
=3D'${PN}-
> > staticdev')
> > +
> > +    if split_packages:
> > +        pn =3D d.getVar('PN', True)
> > +        d.setVar('RRECOMMENDS_' + pn + '-plugins', '
> > '.join(split_packages))
> > +        d.appendVar('RRECOMMENDS_' + pn + '-dbg', ' ' + '
> > '.join(split_dbg_packages))
> > +        d.appendVar('RRECOMMENDS_' + pn + '-dev', ' ' + '
> > '.join(split_dev_packages))
> > +        d.appendVar('RRECOMMENDS_' + pn + '-staticdev', ' ' + '
> > '.join(split_staticdev_packages))
> > +}
> > +
> > +PACKAGESPLITFUNCS_prepend =3D "split_strongswan_plugins "
> > +
> > +# Install some default plugins based on default strongSwan ./configure
> > options
> > +# See https://wiki.strongswan.org/projects/strongswan/wiki/Pluginlist
> > +RDEPENDS_${PN} +=3D "\
> > +    ${PN}-plugin-aes \
> > +    ${PN}-plugin-attr \
> > +    ${PN}-plugin-cmac \
> > +    ${PN}-plugin-constraints \
> > +    ${PN}-plugin-des \
> > +    ${PN}-plugin-dnskey \
> > +    ${PN}-plugin-hmac \
> > +    ${PN}-plugin-kernel-netlink \
> > +    ${PN}-plugin-md5 \
> > +    ${PN}-plugin-nonce \
> > +    ${PN}-plugin-pem \
> > +    ${PN}-plugin-pgp \
> > +    ${PN}-plugin-pkcs1 \
> > +    ${PN}-plugin-pkcs7 \
> > +    ${PN}-plugin-pkcs8 \
> > +    ${PN}-plugin-pkcs12 \
> > +    ${PN}-plugin-pubkey \
> > +    ${PN}-plugin-random \
> > +    ${PN}-plugin-rc2 \
> > +    ${PN}-plugin-resolve \
> > +    ${PN}-plugin-revocation \
> > +    ${PN}-plugin-sha1 \
> > +    ${PN}-plugin-sha2 \
> > +    ${PN}-plugin-socket-default \
> > +    ${PN}-plugin-sshkey \
> > +    ${PN}-plugin-updown \
> > +    ${PN}-plugin-vici \
> > +    ${PN}-plugin-x509 \
> > +    ${PN}-plugin-xauth-generic \
> > +    ${PN}-plugin-xcbc \
> > +    "
> >
> >  RPROVIDES_${PN} +=3D "${PN}-systemd"
> >  RREPLACES_${PN} +=3D "${PN}-systemd"
> > --
> > 2.12.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
--=20
-Joe MacDonald.
:wq

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJZALVZAAoJEEn8ffcsOfaWskAH/jTTs+/qk6X+420sQEj+JwtK
7gJFHuhl8KzqrQtpZgNl8FLaBcgcQ+CTcZk9ZVP7xmptk8NUy0w0y/eFCBjwTrCP
U90Unqmoi20bYXg7jzLHOWMm7hvtiPW+LUKSYFKAXfXTJ2p+ThHOBnZN61RaZQgt
r5GBo0BkVtRXPXJI626iXacuQScPtNoAAAm912EcnDyoHCKuokccndSdf/RLalxi
2txamQzpD9uHV8IHcQRUGZLLDMfl5HsQH95o6plfkkLhZK1x6Ju9xF7fwK+OIQOY
pJ7QX0mybCMx50ewdw6wFrriG07Ts9sWD8WBF2mYhWG5JWlBSRoBBMNOLgKcnwY=
=RGR1
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
