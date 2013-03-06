Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UD9XH-000835-6V
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 09:17:18 +0100
Received: by mail-ia0-f170.google.com with SMTP id h8so1916047iaa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2013 00:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O0Z2deU1FrJl3gTzmr6smLd/m241zKs0RjEHSiK1sc8=;
	b=uwjRcOXRiqW5rvFfyjCxNkuDqdfn5+Z/bcAE8ZiqU/eaxGoWFJz3i0SWXj2E0TezjM
	cP+h/6lZ1D9LDAsqAWJWjh+44lgGVS9BpjqGizcSklgZc1RomJVpjDOybf/uxRLMM+ld
	QnryvPWIGuWkncJxhxQlqIEAqQc1ibF2NZrvzqtwRc8HpuyFyKFuKymXWOSiy2ZRAteG
	U0WvMKhN9XDaGPOkNsVA6MzwWGvmcXKmFy4uN+CXxNp2RgcZeYHup5m1FXbOJEdWR8ux
	5vUo/N4C06kNwPGS2OWY3OqsvnMtsCa7Xj+enXauJIzxoptSJLNDPo6i/pxKXahpOHfl
	vWag==
X-Received: by 10.50.149.233 with SMTP id ud9mr9898924igb.92.1362556844377;
	Wed, 06 Mar 2013 00:00:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id px9sm21250600igc.0.2013.03.06.00.00.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 00:00:43 -0800 (PST)
Date: Wed, 6 Mar 2013 09:00:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130306080035.GB32228@jama.dyndns-home.com>
References: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
	<1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
	<20130214094445.GJ3300@jama> <5136F265.1080603@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5136F265.1080603@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][] rpcbind: Add ${PN}-systemd to PACKAGES
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
X-List-Received-Date: Wed, 06 Mar 2013 08:17:18 -0000
X-Groupsio-MsgNum: 43396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 09:38:13AM +0200, Florin Sarbu wrote:
> Hi,
> this is still needed (for me at least but it looks like should be the=20
> case for everybody too). I have today's master on both poky and=20
> meta-openembedded and get:
>=20
> ERROR: rpcbind-systemd does not appear in package list, please add it
> ERROR: Function failed:
>=20
> SYSTEMD_SERVICE_rpcbind-systemd value rpcbind.service does not exist

Are you sure you're using systemd.bbclass from meta-systemd?=20

$ bitbake -e rpcbind | grep ^PACKAGES
PACKAGESPLITFUNCS=3D"populate_packages_updatercd package_do_split_locales  =
               populate_packages"
PACKAGES=3D"rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbi=
nd-doc rpcbind-locale  rpcbind"
PACKAGES_DYNAMIC=3D"^rpcbind-locale-.*"

# $PACKAGES [3 operations]
#   set conf/bitbake.conf:270
#     "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE=
_BEFORE_PN} ${PN}"
#   set /OE/shr-core/openembedded-core/meta/conf/documentation.conf:91
#     [doc] "Names of packages to be generated. @group packaging"
#   set systemd.bbclass:33 [systemd_create_package]
#     "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbind-do=
c rpcbind-locale  rpcbind"
# computed:
#   "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbind-doc =
rpcbind-locale  rpcbind"
PACKAGES=3D"rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbi=
nd-doc rpcbind-locale  rpcbind"

>=20
>=20
> Have Khem's patches you were talking about been merged? Can't see them=20
> anywhere though.
>=20
> Thank you,
> Florin
>=20
> On 02/14/2013 11:44 AM, Martin Jansa wrote:
> > On Thu, Feb 14, 2013 at 11:32:05AM +0200, Florin Sarbu wrote:
> >> The ${PN}-systemd should be added to PACKAGES
> >> so that the package gets created.
> >>
> >> Added do_install_append to have the systemd.service
> >> installed in the proper location.
> > see khem's patch fixing this in many recipes including rpcbind.
> >
> >> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> >> ---
> >>   .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend    |    =
8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2=
=2E0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0=
=2Ebbappend
> >> index 0fa7f97..8197550 100644
> >> --- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbap=
pend
> >> +++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbap=
pend
> >> @@ -1,6 +1,8 @@
> >>   inherit systemd
> >>  =20
> >> -PRINC :=3D "${@int(PRINC) + 1}"
> >> +PACKAGES =3D+ "${PN}-systemd"
> >> +
> >> +PRINC :=3D "${@int(PRINC) + 2}"
> >>  =20
> >>   # look for files in the layer first
> >>   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >> @@ -10,3 +12,7 @@ SRC_URI +=3D "file://rpcbind.service"
> >>   SYSTEMD_PACKAGES =3D "${PN}-systemd"
> >>   SYSTEMD_SERVICE =3D "rpcbind.service"
> >>  =20
> >> +do_install_append() {
> >> +        install -d ${D}${systemd_unitdir}/system/
> >> +        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unit=
dir}/system
> >> +}
> >> --=20
> >> 1.7.10.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE296MACgkQN1Ujt2V2gByZFACgrze7hFVfJw+Yx54OzWfxS+51
Zk8An1ry0gB2IUTPJ5LqzmTJpqiXCgG6
=uSjS
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
