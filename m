Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UJ21S-0005Kc-4q
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 14:28:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2MDBle0015180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 06:11:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 22 Mar 2013 06:11:47 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A517E7FD0;
	Fri, 22 Mar 2013 09:11:03 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id E9E1920007; Fri,
	22 Mar 2013 09:11:45 -0400 (EDT)
Date: Fri, 22 Mar 2013 09:11:45 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130322131145.GF5049@windriver.com>
References: <1362445249-12669-1-git-send-email-rongqing.li@windriver.com>
	<20130318153933.GB9185@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130318153933.GB9185@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tftp-hpa: make init script work
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
X-List-Received-Date: Fri, 22 Mar 2013 13:28:49 -0000
X-Groupsio-MsgNum: 43661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Content-Disposition: inline

--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] tftp-hpa: make init script work] On 13.03.18 =
(Mon 11:39) Joe MacDonald wrote:

> Hey Roy,
>=20
> [[meta-networking][PATCH] tftp-hpa: make init script work] On 13.03.05 (T=
ue 09:00) rongqing.li@windriver.com wrote:
>=20
> > From: "Roy.Li" <rongqing.li@windriver.com>
> >=20
> > 1. fix the daemon name, it should be in.tftpd-hpa
> > 2. root directory should be /var/lib/tftpboot, since /var/lib/tftpboot =
has been
> > installed, but /srv/tftpboot not
>=20
> Hmm.  This is a bit problematic for me.  I wouldn't normally bat an eye
> at such a change, but because the original recipe specifically pointed
> the tftp server at /srv and when I looked at my own tftp server, that's
> where it was set.  It's been so long since I did anything with it I'd
> forgotten why I put the contents there, so I thought I'd have a quick
> look-see as to why.  Turns out that's actually the FHS-recommended
> location:
>=20
>    http://www.pathname.com/fhs/pub/fhs-2.3.html#SRVDATAFORSERVICESPROVIDE=
DBYSYSTEM
>=20
> And this has been identified and fixed in at least Ubuntu:
>=20
>    https://bugs.launchpad.net/ubuntu/+source/tftp-hpa/+bug/84615
>=20
> Unless there's a strong objection, I'd prefer to see a fix for this that
> updates the recipe to install into /svc/tftpboot, rather than changing
> the daemon options to look in /var/lib/tftpboot.

Roy?  Just a ping.

-J.

>=20
> Changing the name is fine with me (will this cause pain for the systemd
> folks?).
>=20
> -J.
>=20
> >=20
> > Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> > ---
> >  meta-networking/recipes-daemons/tftp-hpa/files/default   |    2 +-
> >  meta-networking/recipes-daemons/tftp-hpa/files/init      |    2 +-
> >  meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb |    2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/m=
eta-networking/recipes-daemons/tftp-hpa/files/default
> > index de2ed18..1dce7fd 100644
> > --- a/meta-networking/recipes-daemons/tftp-hpa/files/default
> > +++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
> > @@ -1,3 +1,3 @@
> >  #Defaults for tftpd-hpa
> >  RUN_DAEMON=3D"yes"
> > -OPTIONS=3D"-l -s /srv/tftpboot"
> > +OPTIONS=3D"-l -s /var/lib/tftpboot"
> > diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta=
-networking/recipes-daemons/tftp-hpa/files/init
> > index 5ad8c52..0561ff6 100644
> > --- a/meta-networking/recipes-daemons/tftp-hpa/files/init
> > +++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
> > @@ -18,7 +18,7 @@ set -e
> > =20
> >  PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> >  DESC=3D"HPA's tftpd"
> > -NAME=3Din.tftpd
> > +NAME=3Din.tftpd-hpa
> >  DAEMON=3D/usr/sbin/$NAME
> >  PIDFILE=3D/var/run/$NAME.pid
> >  SCRIPTNAME=3D/etc/init.d/tftpd-hpa
> > diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b=
/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > index af48455..c116121 100644
> > --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> > @@ -11,7 +11,7 @@ LICENSE =3D "BSD-4-Clause"
> >  LIC_FILES_CHKSUM =3D "file://MCONFIG.in;beginline=3D1;endline=3D9;md5=
=3Dc28ba5adb43041fae4629db05c83cbdd \
> >                      file://tftp/tftp.c;beginline=3D1;endline=3D32;md5=
=3D988c1cba99d70858a26cd877209857f4"
> > =20
> > -PR =3D "r0"
> > +PR =3D "r1"
> > =20
> >  SRC_URI =3D "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp=
-hpa-${PV}.tar.bz2 \
> >             file://tftp-0.40-remap.patch \
--=20
-Joe MacDonald.
:wq

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFMWJEACgkQPN8S4W6ZZnd0EwCfd2lOW1q4r2f5cal2Jb+QUX2F
WsAAnAhGx1VTCg1pY2PP0VXdddWNXM0O
=4eKZ
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
