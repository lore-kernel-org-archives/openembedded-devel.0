Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NwzZC-0008Sv-OY
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 17:10:51 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 34D95140B0; Wed, 31 Mar 2010 17:02:19 +0200 (CEST)
Date: Wed, 31 Mar 2010 17:02:19 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331150219.GA29082@zlo.nu>
References: <20100331132523.31493.75635.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<w2u5e088bd91003310701t15cc16c5w4075659e89068d0f@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <w2u5e088bd91003310701t15cc16c5w4075659e89068d0f@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dhcp: Correct leases directory location
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
X-List-Received-Date: Wed, 31 Mar 2010 15:10:51 -0000
X-Groupsio-MsgNum: 18296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2010 at 07:01:29AM -0700, Steve Sakoman wrote:
> On Wed, 2010-03-31 at 14:29 +0100, Martyn Welch wrote:
> > The DHCP client currently expects to be able to create a leases file in
> > "/var/lib/dhcp" as configured in dhcp3.inc. Recipe is currently creatin=
g a
> > directory called "/var/lib/dhcp3", resulting in the following error:
> >
> > can't create /var/lib/dhcp/dhclient.eth0.leases
> >
> > Correct directory naming to resolve error.
> >
> > Signed-off-by: Martyn Welch <martyn.welch@ge.com>
> >
> > ---
> >
> >  Steve: This seems to be directy reversing a change you made. The commit
> >   message doesn't give me any idea of why you did it, can you remember?
>=20
> Interesting.  I made the change because I was getting quite similar
> errors, but for files being created in /var/lib/dhcp3!
>=20
> I'm not sure what is different about our overall set ups, but perhaps
> the proper fix is to create both directories.
>=20
> Steve

Hmm, note that recipes/dhcp/files/init-server uses /var/lib/dhcp as well.

dhclient from 3.1.2p1 uses /var/lib/dhcp by default. Maybe one of the
older versions used /var/lib/dhcp3 by default...

I did not spot this myself because dhclient is run from network-manager
on our system, which passes it command line arguments on where to put
the lease file.

Marc

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuzY/sACgkQezjnobFOgrEQOwCguK2f4RaFnsUTORSqqg7Sst0Q
O+EAoKnEQshMQXBt8HyMzmF454nOLglQ
=Lsoq
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
