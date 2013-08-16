Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F06C61222
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 19:49:38 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1086151eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 12:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZgVdObwszZa0SclEnz5xIoinFC9oo4aUUc+f44jSyfg=;
	b=Ou3WT9NjwvDI0d2YtDkZkXGblJs5pEKEq2nsZq+GGpE2E005oWG3x2QbMOlUYFjHeU
	8KtdSaU/DopVQy+4Vn90mtyEZMSqg6D52VPrwvZvFryCGEeKHzILJehJCRfHChvtRpEx
	Bm435vXztzAt2cQS15kAbraGEy+QNpnXBcUqV7R3VZ3JnRFOJQgWj0VRG2FFseS3gWH8
	wGuk0iTPX+xiI/8o451Wsl7HNblUxQoyfH9n/ya0Pzmj1ufQGsXF9Qx9sZCM8WSxNGm9
	O76cydzGME5SJjJUDC0bzTioW/9H7uaebLh6r31+jlIDLHUfg0v7P2wLTaAH8zBGFhAv
	Zgaw==
X-Received: by 10.14.241.74 with SMTP id f50mr4405718eer.29.1376682578459;
	Fri, 16 Aug 2013 12:49:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id a4sm4952350eez.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 16 Aug 2013 12:49:37 -0700 (PDT)
Date: Fri, 16 Aug 2013 21:50:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20130816195038.GA3573@jama>
References: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
	<20130816071954.GG17945@jama> <520DE65C.5050807@windriver.com>
MIME-Version: 1.0
In-Reply-To: <520DE65C.5050807@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org, joe.macdonald@windriver.com
Subject: Re: [PATCH meta-networking] quagga: two fixes
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
X-List-Received-Date: Fri, 16 Aug 2013 19:49:39 -0000
X-Groupsio-MsgNum: 45767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 04:44:12PM +0800, Rongqing Li wrote:
>=20
>=20
> On 08/16/2013 03:19 PM, Martin Jansa wrote:
> > On Fri, Aug 16, 2013 at 10:23:59AM +0800, rongqing.li@windriver.com wro=
te:
> >> From: "Roy.Li" <rongqing.li@windriver.com>
> >>
> >> 1. quagga should depend on iproute2, since ip from busybox is not suff=
icient
> >> 2. fix a typOS(should chmod, not chown)
> >
> > As you care about quagga, can you please fix:
> > quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped
> > in a particular package.
> >
> > ?
>=20
> I did not see this warning, and this file is shipped to quagga-doc.
>=20
> If there is difference, it is in oe-core, not quagga

Sorry I don't understand what you mean, the infodir QA test is
relatively new and quagga + 4 more recipes suffer from this issue and
should be fixed, see the check and list of recipes with warning in:
http://patches.openembedded.org/patch/52725/

>=20
> -Roy
>=20
>=20
> >
> > Thanks
> >
> >>
> >> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >> ---
> >>   meta-networking/recipes-protocols/quagga/quagga.inc |    9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/met=
a-networking/recipes-protocols/quagga/quagga.inc
> >> index f5489c6..89b9f7a 100644
> >> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >> @@ -5,7 +5,7 @@ Unix platforms, particularly FreeBSD, Linux, Solaris a=
nd NetBSD. \
> >>   Quagga is a fork of GNU Zebra which was developed by Kunihiro \
> >>   Ishiguro. The Quagga tree aims to build a more involved community \
> >>   around Quagga than the current centralised model of GNU Zebra."
> >> -HOMEPAGE =3D "http://www.quagga.net/"
> >> +HOMEPAGE =3D "http://www.nongnu.org/quagga/"
> >>   SECTION =3D "network"
> >>   LICENSE =3D "GPL-2.0 & LGPL-2.0"
> >>   DEPENDS =3D "readline ncurses perl-native"
> >> @@ -17,6 +17,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc8=
42c2336e835926c2166c28b \
> >>
> >>   INC_PR =3D "r2"
> >>
> >> +# the "ip" command from busybox is not sufficient (flush by protocol =
flushes all routes)
> >> +RDEPENDS_${PN} +=3D "iproute2"
> >> +
> >>   QUAGGASUBDIR =3D ""
> >>   # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
> >>   # versions and leave it empty for recent versions.
> >> @@ -128,11 +131,11 @@ pkg_postinst_${PN} () {
> >>       if [ "x$D" !=3D "x" ] ; then
> >>           exit 1
> >>       fi
> >> -    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do tou=
ch ${sysconfdir}/quagga/$f.conf; done
> >> +    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; =
do touch ${sysconfdir}/quagga/$f.conf; done
> >>       chown quagga:quaggavty ${sysconfdir}/quagga
> >>       chown quagga:quagga ${sysconfdir}/quagga/*.conf
> >>       chmod 750 ${sysconfdir}/quagga
> >> -    chown 640 ${sysconfdir}/quagga/*.conf
> >> +    chmod 640 ${sysconfdir}/quagga/*.conf
> >>       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> >>           ${sysconfdir}/init.d/populate-volatile.sh update
> >>       fi
> >> --
> >> 1.7.10.4
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIOgo4ACgkQN1Ujt2V2gBwPYQCeIGOVc1eLPla2Iqi8hdsoI8eK
0L0AniYdvPMFsxpbvrJoRdPPZqM8F4X3
=pQLv
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
