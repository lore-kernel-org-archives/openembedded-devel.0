Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B7C8460030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:54:13 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so20548203wgg.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bl2eGjGjr+ZDWd6W2b8NvbTyOKadp/HwJj8Ryng2foU=;
	b=K+7SiYms3rJQcdTlF1T0ReIJYK6TJuJEpFTarNBONHObeGiqTiJGbBwOsWRqYM+/DY
	elFBRbMvcyRaluR5+/Adv8+ASwGgjVMPCd51VyAIoz81hOne7VP6bKNZInO59PLXbM0n
	uFz9HfNA5XIXD7jFp88btnsUYWJTaOF/pPdVZoAfY2qFSK418KQ3jUJTBuNCIB5NMYSz
	2nNN1AA1LelglzTHivD5JoTc+K0aXB4ToMjYHMKL8Fg5JX72zDQ8LNYtLIdrnnw/e9aF
	gnGjfHU5NCP5j7CJ6B1JyQFS8NerM1sQ+gvRWCBFrg87uSDLhspfFxUG3Q9eHl5rZoI0
	/6oQ==
X-Received: by 10.195.11.68 with SMTP id eg4mr9268878wjd.18.1417629253479;
	Wed, 03 Dec 2014 09:54:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p1sm37211781wjy.22.2014.12.03.09.54.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 09:54:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Dec 2014 18:54:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141203175414.GD2455@jama>
References: <1417490373-1909-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141202204504.GF12784@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20141202204504.GF12784@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] radiusclient-ng : add new recipe
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
X-List-Received-Date: Wed, 03 Dec 2014 17:54:15 -0000
X-Groupsio-MsgNum: 53169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2014 at 03:45:04PM -0500, Joe MacDonald wrote:
> Hi Li,
>=20
> [[oe] [meta-networking][PATCH] radiusclient-ng : add new recipe] On 14.12=
=2E02 (Tue 11:19) Li xin wrote:
>=20
> > RADIUS protocol client library.
> > It is Portable, easy-to-use and standard compliant library suitable
> > for developing free and commercial software that need support for a RAD=
IUS
> > protocol (RFCs 2128 and 2139).
> >=20
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> >  .../files/Fix-configure-and-compile-errors.patch   | 79 ++++++++++++++=
++++++++
> >  .../files/config-site.radiusclient-ng-0.5.6        |  1 +
> >  .../radiusclient-ng/radiusclient-ng_0.5.6.bb       | 36 ++++++++++
> >  3 files changed, 116 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/radiusclient-ng/fil=
es/Fix-configure-and-compile-errors.patch
> >  create mode 100644 meta-networking/recipes-support/radiusclient-ng/fil=
es/config-site.radiusclient-ng-0.5.6
> >  create mode 100644 meta-networking/recipes-support/radiusclient-ng/rad=
iusclient-ng_0.5.6.bb
>=20
> Can you move this to recipes-protocols?

and files -> radiusclient-ng for slightly faster lookup

Also small nitpick in couple recipes from fujitsu.com I've noticed that you=
're adding
space before ':' in subject, it should be

<recipe>: some message

I'm changing it when cherry-picking to master-next, but please do it on
your end so that we have less work integrating the patches.

>=20
> > diff --git a/meta-networking/recipes-support/radiusclient-ng/files/Fix-=
configure-and-compile-errors.patch b/meta-networking/recipes-support/radius=
client-ng/files/Fix-configure-and-compile-errors.patch
> > new file mode 100644
> > index 0000000..5220923
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/radiusclient-ng/files/Fix-configu=
re-and-compile-errors.patch
> > @@ -0,0 +1,79 @@
> > +From 72154b3179d9352d3747d7b47d6029a9f1a304b2 Mon Sep 17 00:00:00 2001
> > +From: Li xin <lixin.fnst@cn.fujitsu.com>
> > +Date: Tue, 2 Dec 2014 02:33:53 +0900
> > +Subject: [PATCH] Fix configure and compile errors
> > +
> > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>=20
> We'll need an upstream-status on this, even if you're just integrating
> Fedora patches.  If you are the author of this patch, could you
> elaborate a bit in your comments here?  Looking at the Makefile.am patch
> I think I understand the intent, but it's probably best to write it out.
>=20
> > +---
> > + configure.in             | 6 +++++-
> > + etc/Makefile.am          | 9 ++++++---
> > + etc/radiusclient.conf.in | 2 +-
> > + 3 files changed, 12 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/configure.in b/configure.in
> > +index 812f640..3a8af99 100644
> > +--- a/configure.in
> > ++++ b/configure.in
> > +@@ -29,6 +29,9 @@ AC_SUBST(LIBVERSION)
> > + pkgsysconfdir=3D${sysconfdir}/$PACKAGE
> > + AC_SUBST(pkgsysconfdir)
> > +=20
> > ++pkgdatadir=3D${datadir}/$PACKAGE
> > ++AC_SUBST(pkgdatadir)
> > ++
> > + AC_PROG_LIBTOOL
> > +=20
> > + AC_PROG_CC
> > +@@ -118,7 +121,8 @@ then
> > + 	],
> > + 	AC_MSG_RESULT(yes)
> > + 	AC_DEFINE(HAVE_STRUCT_UTSNAME_DOMAINNAME),
> > +-	AC_MSG_RESULT(no)
> > ++	AC_MSG_RESULT(no),
> > ++	AC_MSG_RESULT(assume no),
> > + 	)
> > + fi
> > +=20
> > +diff --git a/etc/Makefile.am b/etc/Makefile.am
> > +index 39b6975..a3c403f 100644
> > +--- a/etc/Makefile.am
> > ++++ b/etc/Makefile.am
> > +@@ -14,9 +14,11 @@ CLEANFILES =3D *~ radiusclient.conf
> > +=20
> > + sbindir =3D @sbindir@
> > + pkgsysconfdir =3D @pkgsysconfdir@
> > +-pkgsysconf_DATA =3D issue port-id-map radiusclient.conf \
> > +-	dictionary dictionary.ascend dictionary.compat dictionary.merit \
> > +-	dictionary.sip
> > ++pkgsysconf_DATA =3D issue port-id-map radiusclient.conf
> > ++
> > ++pkgdatadir =3D @pkgdatadir@
> > ++pkgdata_DATA =3D dictionary dictionary.ascend dictionary.compat \
> > ++	dictionary.merit dictionary.sip
> > +=20
> > + EXTRA_DIST =3D issue port-id-map dictionary dictionary.ascend \
> > + 	dictionary.compat dictionary.merit servers radiusclient.conf.in \
> > +@@ -25,6 +27,7 @@ EXTRA_DIST =3D issue port-id-map dictionary dictiona=
ry.ascend \
> > + radiusclient.conf: radiusclient.conf.in
> > + 	sed -e 's|@sbin''dir@|$(sbindir)|g' \
> > + 	    -e 's|@pkgsysconf''dir@|$(pkgsysconfdir)|g' \
> > ++	    -e 's|@pkgdata''dir@|$(pkgdatadir)|g' \
> > + 	    <$(srcdir)/radiusclient.conf.in >radiusclient.conf
> > +=20
> > + install-data-local: servers
> > +diff --git a/etc/radiusclient.conf.in b/etc/radiusclient.conf.in
> > +index 948bc2f..aac9973 100644
> > +--- a/etc/radiusclient.conf.in
> > ++++ b/etc/radiusclient.conf.in
> > +@@ -47,7 +47,7 @@ servers		@pkgsysconfdir@/servers
> > +=20
> > + # dictionary of allowed attributes and values
> > + # just like in the normal RADIUS distributions
> > +-dictionary 	@pkgsysconfdir@/dictionary
> > ++dictionary 	@pkgdatadir@/dictionary
> > +=20
> > + # program to call for a RADIUS authenticated login
> > + login_radius	@sbindir@/login.radius
> > +--=20
> > +1.8.4.2
> > +
> > diff --git a/meta-networking/recipes-support/radiusclient-ng/files/conf=
ig-site.radiusclient-ng-0.5.6 b/meta-networking/recipes-support/radiusclien=
t-ng/files/config-site.radiusclient-ng-0.5.6
> > new file mode 100644
> > index 0000000..a30c144
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/radiusclient-ng/files/config-site=
=2Eradiusclient-ng-0.5.6
> > @@ -0,0 +1 @@
> > +ac_cv_func_uname=3Dno
> > diff --git a/meta-networking/recipes-support/radiusclient-ng/radiusclie=
nt-ng_0.5.6.bb b/meta-networking/recipes-support/radiusclient-ng/radiusclie=
nt-ng_0.5.6.bb
> > new file mode 100644
> > index 0000000..bc9d08e
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/radiusclient-ng/radiusclient-ng_0=
=2E5.6.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY =3D "RADIUS protocol client library"
> > +DESCRIPTION =3D "Portable, easy-to-use and standard compliant library =
suitable \
> > +for developing free and commercial software that need support for a RA=
DIUS \
> > +protocol (RFCs 2128 and 2139)."
> > +HOMEPAGE =3D "http://developer.berlios.de/projects/radiusclient-ng/"
>=20
> This 404s for me.  Actually, developer.berlios.de NXDOMAINs.  :-)
>=20
> I was ready to write this off as abandonware since I know a bit of the
> history of freeradius, but it actually looks like it's still relatively
> actively developed on SF.  So can you update the HOMEPAGE to point to
> http://sourceforge.net/projects/radiusclient-ng.berlios/ (or some more
> appropriate page, if you've got one).
>=20
> > +SECTION =3D "Applications/Internet"
> > +
> > +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${BP}.tar.g=
z/6fb7d4d0aefafaee7385831ac46a8e9c/${BP}.tar.gz \
> > +    file://Fix-configure-and-compile-errors.patch \
> > +    file://config-site.radiusclient-ng-${PV}"
> > +
> > +SRC_URI[md5sum] =3D "6fb7d4d0aefafaee7385831ac46a8e9c"
> > +SRC_URI[sha256sum] =3D "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3a=
d361ac595f72f09f14"
> > +
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D3e47566c9271b786693d8a087=
92dbf41"
> > +
> > +inherit autotools-brokensep
> > +
> > +EXTRA_OECONF +=3D "--disable-static"
> > +
> > +do_configure_prepend () {
> > +    export CONFIG_SITE=3D./config-site.${P}
> > +}
> > +
> > +do_compile_prepend() {
> > +    for m in `find . -name "Makefile"` ; do
> > +        sed -i -e 's:^program_transform_name =3D.*:program_transform_n=
ame =3D:g' ${m}
> > +    done
> > +}
> > +
> > +do_install() {
> > +    oe_runmake DESTDIR=3D${D} install
> > +    rm -f ${D}${libdir}/*.la
> > +    rm -f ${D}${sbindir}/radexample
> > +}
> > --=20
> > 1.8.4.2
> >=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR/TkYACgkQN1Ujt2V2gBwMNACgpipEIYbAZVAt+7kodgtgvIjH
iEoAoLEKabWx7Wtt9FhmEt6S3qk+CdJe
=+TX1
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
