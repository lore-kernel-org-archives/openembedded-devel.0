Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MWXX6-0007sR-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 17:27:04 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 339C61402C; Thu, 30 Jul 2009 17:12:02 +0200 (CEST)
Date: Thu, 30 Jul 2009 17:12:02 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090730151202.GA30550@zlo.nu>
References: <BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<20090730114922.GA29793@zlo.nu>
	<1248956053.21030.133.camel@hammer.suse.cz>
	<20090730125001.GA30052@zlo.nu>
	<c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>
	<20090730144831.GA30445@zlo.nu> <4A71B4E4.2030206@balister.org>
MIME-Version: 1.0
In-Reply-To: <4A71B4E4.2030206@balister.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Thu, 30 Jul 2009 15:27:04 -0000
X-Groupsio-MsgNum: 12151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2009 at 10:57:40AM -0400, Philip Balister wrote:
> No sense us creating bash only scripts, but some of the scripts used to =
=20
> build things in OE (created by others) may have bashism's. Easier for us =
=20
> to use bash than patch other people's scripts.

Well, there's a difference between 'to use bash' and 'to require /bin/sh
to be a bash', the /bin/sh of the host system nonetheless.  As bash is
non-POSIX compliant in different ways than other shells are non-POSIX
compliant, some (non-OE) #!/bin/sh scripts of other packages break.

IMO it would make more sense to use bash as /bin/sh for that specific
package (if possible) but even more sense to fix the bashism in the
first place (and notify upstream to fix it as well)...

Marc

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxuEIACgkQezjnobFOgrF58QCeMeShPr7LVjd9sLJV3q9npj8C
534AoMfl6gfdxVYuIA1/nyyHGE9S674X
=DpU3
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
