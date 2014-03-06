Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 141706F3AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:37:56 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so1299284eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 10:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DqCrlnjR2Qaa6Um647a0BdbURuoSZ/uy/65gLpB8fW8=;
	b=0TYf2Vje+ybPXWn6zaOP3bubSePbfS6uzPrO5vokapzhQMWit4tyCchjdUykFBMeP0
	x9ySTOK/Kx5g9QnTgkSmHTn/p8T42AP7mQKdUTNjRqjXPZykk8d+jik/DTkvSlG+AK7E
	KKs5h7gvDabIRA6pEEz/3yM8kmqxI8kUmc4VY56M8WtK0yxJ6c2HyHDvRUCQo3zctV3K
	tZR+6OAudbUi5qEkn5/UEtxl1yu5R9yLSl4RrXplrKuRaOApUytOfl+nZ1rMPn+5RRji
	u/QGG8N63VHc5dINTNMhWcRlFvoEkNlmb9TmqTiIEksyfJ8qNkeRN/f0NlSSBZ26YduK
	9oHw==
X-Received: by 10.15.56.130 with SMTP id y2mr14350969eew.17.1394131077071;
	Thu, 06 Mar 2014 10:37:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm12023835eew.19.2014.03.06.10.37.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 10:37:56 -0800 (PST)
Date: Thu, 6 Mar 2014 19:38:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Message-ID: <20140306183804.GI26981@jama>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<20140305172026.GX26981@jama>
	<53176169.9060501@dynamicdevices.co.uk>
	<20140305193027.GD26981@jama>
MIME-Version: 1.0
In-Reply-To: <20140305193027.GD26981@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Thu, 06 Mar 2014 18:37:57 -0000
X-Groupsio-MsgNum: 48550
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvWwdhJHqQXOQ5Pq"
Content-Disposition: inline

--mvWwdhJHqQXOQ5Pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 08:30:27PM +0100, Martin Jansa wrote:
> On Wed, Mar 05, 2014 at 05:39:53PM +0000, Alex J Lennon wrote:
> >=20
> > On 05/03/2014 17:20, Martin Jansa wrote:
> > > On Wed, Mar 05, 2014 at 03:49:13PM +0000, Alex J Lennon wrote:
> > >> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replac=
ed with 2.02.
> > > Sorry I haven't noticed it when replying on oe-core version, but can =
you
> > > please remove 2.0.1 version in the same patch and sent with -M?
> > >
> > > Do you know if it fixes do_install issue when building on host with
> > > dash? It's reported regularly in:
> > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > >
> > > Thanks!
> >=20
> > Apologies. I thought I had the removal of 2.0.1 in there. Clearly I
> > shouldn't be doing this
> > type of thing before the first coffee of the day!
>=20
> :)
>=20
> I've added 2.0.1 removal when cherry-picking this to master-next.
>=20
> > I'll take a look at the issue you mention before I resubmit
>=20
> Thanks, I've started new world build, please watch status e-mails to see
> if it happens there as well again, it's possible that dash isn't the
> (only) reason for the failure..

Yes, it does fail with 2.0.2, you can see whole log here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40306_000713.log/bitbake.log

>=20
> >=20
> > Cheers, Alex
> >=20
> > >> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
> > >> ---
> > >>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++=
++
> > >>  1 file changed, 16 insertions(+)
> > >>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> > >>
> > >> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe=
/recipes-connectivity/daq/daq_2.0.2.bb
> > >> new file mode 100644
> > >> index 0000000..2675e2a
> > >> --- /dev/null
> > >> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> > >> @@ -0,0 +1,16 @@
> > >> +SUMMARY =3D "The dump DAQ test the various inline mode features "
> > >> +HOMEPAGE =3D "http://www.snort.org"
> > >> +LICENSE =3D "GPLv2"
> > >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8=
b21c40e0"
> > >> +
> > >> +PARALLEL_MAKE =3D ""
> > >> +
> > >> +DEPENDS =3D "libpcap libpcre "
> > >> +
> > >> +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> > >> +            file://disable-run-test-program-while-cross-compiling.p=
atch "
> > >> +
> > >> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> > >> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942=
b4a51f605309beac269a8"
> > >> +
> > >> +inherit autotools
> > >> --=20
> > >> 1.7.9.5
> > >>
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >   =20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvWwdhJHqQXOQ5Pq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMYwIwACgkQN1Ujt2V2gByzrQCeLxyBKHwOOxYWBFw5pgNmwbv7
670An22rLjdUveC4PDw22c06wln18m2D
=hsd4
-----END PGP SIGNATURE-----

--mvWwdhJHqQXOQ5Pq--
