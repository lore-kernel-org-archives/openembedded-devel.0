Received: from mail-gg0-f169.google.com ([209.85.161.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFozf-00087o-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:57:41 +0100
Received: by mail-gg0-f169.google.com with SMTP id j5so203649ggn.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7n4IF6kH1rNX14UtAxz/jp1rabeKHRTaSXYaUNugfAc=;
	b=L4ZfIFyeKStvHW8I6d/Vf/yqE32NWr54Dop+djyliAOKIXcwALXV5Ogq/GiaxqR59d
	fS2GxpFdr58j6ky3MsW0yItg6FJVF44b9fhLHphBbJuUUJk4CsTt0t7ntFBQ4P6xtiyG
	tU/iOT3QPY0+pNo4A9gdurbtLoohBrQ8c3GGlERnJyQI49f4XLBm99VdFzE49gXGqisN
	vmOwshiHW6KMOqv17UM9IiZlYS48KN4uwR9Ec9/VojeYWFOCLCltly0V0m1d4QimCxxE
	gMB3HmBAER2EC7Dyuahj4S2O7OiPhuP4qcgybz0+9UghGJiqHSu4HjRwDRatevo982qy
	y6kA==
X-Received: by 10.236.87.77 with SMTP id x53mr9613525yhe.86.1363192853819;
	Wed, 13 Mar 2013 09:40:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e8sm36324301yhh.16.2013.03.13.09.40.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:40:52 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:40:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313164045.GZ3260@jama>
References: <1362131442-26879-1-git-send-email-B40290@freescale.com>
	<20130301101805.GJ3279@jama>
MIME-Version: 1.0
In-Reply-To: <20130301101805.GJ3279@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: B29882@freescale.com, Chunrong Guo <B40290@freescale.com>,
	B19537@freescale.com
Subject: Re: [OE-core][PATCH] lmbench: update config script
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
X-List-Received-Date: Wed, 13 Mar 2013 16:57:55 -0000
X-Groupsio-MsgNum: 43539
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mla3UN0L0Ly2to/J"
Content-Disposition: inline

--Mla3UN0L0Ly2to/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 11:18:05AM +0100, Martin Jansa wrote:
> On Fri, Mar 01, 2013 at 05:50:42PM +0800, Chunrong Guo wrote:
> > From: Chunrong Guo <b40290@freescale.com>
> >=20
> >       *fix bug that can not find  CONFIG file
> >       |error: run ./results|./results: line 15: .: CONFIG.p2041rdb: fil=
e not found
> >       * update CONFIG file path
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  .../lmbench-3.0-a9/update-config-script.patch      |   12 ++++++++++++
> >  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    5 +++--
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/up=
date-config-script.patch
> >=20
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-co=
nfig-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update=
-config-script.patch
> > new file mode 100644
> > index 0000000..b46e09a
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-sc=
ript.patch
> > @@ -0,0 +1,12 @@
> > +Upstream-Status: Pending
> > +Index: lmbench-3.0-a9/scripts/config
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- lmbench-3.0-a9/scripts/config	2000-01-31 18:29:31.000000000 -0600
> > ++++ lmbench-3.0-a9/scripts/config	2013-03-01 00:19:41.032984315 -0600
> > +@@ -3,5 +3,5 @@
> > + UNAME=3D`uname -n 2>/dev/null`
> > + if [ X$UNAME =3D X ]
> > + then	echo CONFIG
> > +-else	echo CONFIG.$UNAME
> > ++else	echo ../scripts/CONFIG.$UNAME
> > + fi
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta=
-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > index 611013e..026b067 100644
> > --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > @@ -7,14 +7,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc84=
2c2336e835926c2166c28b \
> > =20
> >  inherit autotools
> > =20
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
> >  	   file://lmbench-run \
> >  	   file://rename-line-binary.patch \
> >  	   file://update-results-script.patch \
> >  	   file://obey-ranlib.patch \
> > -	   "
> > +	   file://update-config-script.patch \=20
> > +	  "
>=20
> Please don't mix tabs and spaces. I know it was there before.

Fixed and applied

>=20
> >  SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
> >  SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df99826961a=
397d9acf43d8a2a551"
> > =20
> > --=20
> > 1.7.5.4
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mla3UN0L0Ly2to/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFArA0ACgkQN1Ujt2V2gBylWQCgkgzt3BroIyCCgQ32Vuh8Z3yR
DMcAoKXD1olTmlBxjGFC5KsSShSequF7
=J3uf
-----END PGP SIGNATURE-----

--Mla3UN0L0Ly2to/J--
