Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6676060DD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 22:22:12 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so284304lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QZ4MwWVNsIO/QdrD1HT2zpdwEzJQLDUqp3FvwVZc6Kc=;
	b=nqGrU9zbL2TKvfT5gdbPlOostGa8FkptykVhJj6be2EpW1w56weXdWZT1ik7T33ING
	WcwaxtXUtiKHgXzCIGKGl0uZofUYESZArwJO8Ton+/QbNH/ODbeglRg/+7d+3Um6Hfnm
	grqE4XDIxgiGb+DqtTH6ON4AXSF9B/Y9jSCpQZFUPk3lWSxGiVrCMtOz6YyJpICi5Vyk
	eQ5213GIwisydXH9HZRrLE4hR1j72a+eezUhqSXc6pTo2t8W6SPmBLt2qpEBom3mbNxe
	lAkHgeumO5sN0kxmPijntCTiSmwfqFhATS/9LquTpkLWWZbewbiIb+lUxcwgqd8qPP/b
	sBuQ==
X-Received: by 10.112.164.98 with SMTP id yp2mr22791224lbb.29.1399242133064;
	Sun, 04 May 2014 15:22:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id r9sm6990lal.0.2014.05.04.15.22.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 15:22:11 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 May 2014 00:22:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140504222230.GI2486@jama>
References: <1377858084-31009-1-git-send-email-b40290@freescale.com>
	<20130904124920.GE11500@jama> <20140324150848.GA29998@jama>
MIME-Version: 1.0
In-Reply-To: <20140324150848.GA29998@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH V4 ] daq: add recipe
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
X-List-Received-Date: Sun, 04 May 2014 22:22:17 -0000
X-Groupsio-MsgNum: 49689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G3qA4w4pmPkqFkbr"
Content-Disposition: inline

--G3qA4w4pmPkqFkbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 04:08:48PM +0100, Martin Jansa wrote:
> On Wed, Sep 04, 2013 at 02:49:20PM +0200, Martin Jansa wrote:
> > On Fri, Aug 30, 2013 at 06:21:24PM +0800, b40290@freescale.com wrote:
> > > From: Chunrong Guo <B40290@freescale.com>
> > >=20
> > >    *The dump DAQ test the various inline mode features
> > >    *snort depends daq
> > >=20
> > > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > > ---
> > >  meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   16 +++++++++++
> > >  ...le-run-test-program-while-cross-compiling.patch |   29 ++++++++++=
++++++++++
> > >  2 files changed, 45 insertions(+), 0 deletions(-)
> > >  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > >  create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-ru=
n-test-program-while-cross-compiling.patch
> > >=20
> > > diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/=
recipes-connectivity/daq/daq_2.0.1.bb
> > > new file mode 100644
> > > index 0000000..4c1be44
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > > @@ -0,0 +1,16 @@
> > > +DESCRIPTION =3D "The dump DAQ test the various inline mode features "
> > > +HOMEPAGE =3D "http://www.snort.org"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b=
21c40e0"
> > > +
> > > +PARALLEL_MAKE =3D ""
> > > +
> > > +DEPENDS =3D "libpcap libpcre "
> > > +
> > > +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> > > +            file://disable-run-test-program-while-cross-compiling.pa=
tch "
> > > +
> > > +SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> > > +SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86=
ce5d1ba1ea6ce518ec6d"
> > > +
> > > +inherit autotools
> >=20
> > I don't have more than build log because workspace is already gone, but
> > qemuarm build fails:
> >=20
> > ERROR: Function failed: do_install (log file is located at
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> > ERROR: Logfile of failure stored in:
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> > 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> > 'common']
> > | DEBUG: Executing shell function do_install
> > | NOTE: make
> > DESTDIR=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/a=
rmv5te-oe-linux-gnueabi/daq/2.0.1-r0/image
> > install
> > | make: *** No rule to make target `install'.  Stop.
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_install (log file is located at
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> > NOTE: recipe daq-2.0.1-r0: task do_install: Failed
> > ERROR: Task 19484
> > (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/=
recipes-connectivity/daq/daq_2.0.1.bb,
> > do_install) failed with exit code '1'
>=20
> Can we fix this please?

ping^4 and PNBLACKLIST is on the way..

here is also couple of auto-detected dependencies

daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfn=
etlink

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G3qA4w4pmPkqFkbr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNmvaYACgkQN1Ujt2V2gBxTegCfYHUxEx2DhionIYlhww/TWARN
520AoKZthQ5SJaRhzdXETk25PgsSGBqe
=icxH
-----END PGP SIGNATURE-----

--G3qA4w4pmPkqFkbr--
