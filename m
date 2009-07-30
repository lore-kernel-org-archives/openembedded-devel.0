Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MWUMy-00046F-81
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 14:04:24 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id DDD661402C; Thu, 30 Jul 2009 13:49:22 +0200 (CEST)
Date: Thu, 30 Jul 2009 13:49:22 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: Stanislav Brabec <utx@penguin.cz>
Message-ID: <20090730114922.GA29793@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
MIME-Version: 1.0
In-Reply-To: <1248952464.21030.110.camel@hammer.suse.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks	libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 12:04:24 -0000
X-Groupsio-MsgNum: 12144
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2009 at 01:14:24PM +0200, Stanislav Brabec wrote:
> > I'm not sure how you tested this, but there are quotes missing, so that
> > the "-E" argument to "grep" is passed to "export" instead. I guess some
> > shells have a "-E" flag to "export", so it is silently ignored, but mine
> > don't.
>=20
> I tried both versions - quoted and unquoted - before the commit. Both
> worked for me, that is why I committed the shorter one.
>=20
> Well, adding quotes is safe. Can you check your configure output and
> host shell version?
>=20
> My configure output:
>=20
> checking for a sed that does not truncate output... (cached) /bin/sed
> checking for grep that handles long lines and -e... (cached) /bin/sed
> checking for egrep... (cached) /bin/grep -E
> checking for fgrep... (cached) /bin/grep -F
>=20
> It indicates, that it worked correctly.
>=20
> My native shell is:
>=20
> /OE/openembedded/build> sh --version
> GNU bash, version 4.0.24(1)-release (x86_64-suse-linux-gnu)

Hmm, what I got was:

(task 365) ERROR: function do_configure failed
(task 365) ERROR: log data follows
(/home/marcolz/src/iphion-new-oe3/embbuild/tmp/work/i686-oe-linux/libtool-c=
ross-2.2.6a-r0/temp/log.do_configure.22690)
| export: 929: -E: bad variable name
(task 365) NOTE: Task failed:
/home/marcolz/src/iphion-new-oe3/embbuild/tmp/work/i686-oe-linux/libtool-cr=
oss-2.2.6a-r0/temp/log.do_configure.22690
(task 365) ERROR: TaskFailed event exception, aborting
(task 365) ERROR: Build of
/home/marcolz/src/iphion-new-oe3/embbuild/openembedded.iphion/recipes/libto=
ol/libtool-cross_2.2.6a.bb
do_configure failed


My local bash version is:

GNU bash, version 3.2.39(1)-release (i486-pc-linux-gnu)
Copyright (C) 2007 Free Software Foundation, Inc.

Marc

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxiMIACgkQezjnobFOgrGRmQCgu7+x20Dz68pmzoTvPv1dXNVS
glAAoJOVZ1BXSIM1OHVAsenE91sive10
=yO+l
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
