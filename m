Received: from mail-gh0-f181.google.com ([209.85.160.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1UJl8F-0006pz-QC
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Mar 2013 14:38:48 +0100
Received: by mail-gh0-f181.google.com with SMTP id y8so298737ghb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DcD6vRBb0BK+BD+lbOPEc5DTuHP0CXi0PUbuFp/AdCQ=;
	b=RCXpdSlUdYCIqsa/hGk+VJZYdhZ5rBIqG+B1/D8lQ2gnHhcZ6C5SIEH//8I0x6NMJq
	Y1vsSPki2ySAeW4hAAH9zwgXfiMcjZv5Z1O+ldcl1PgEJEdDmLT0rwsEhucOEPSL+snU
	mgiiWBNHuV/0MLToCsJL8OH6zVjJFosekyEoyoseipbWZS4PmojuM6VWvaxMCjs8teeS
	7p+z0YexU2Y+SJHlSNjsIjmDHhF6tqYM1zGb04FeAhITT64Suaa/j7g2MARAVd1hzGIE
	UPgZ/AUBtAaJJvW/RVlvbwnfCdJFNGPVHi5H+oNhUXywVuWq6NnQ98XFO+v+EcQSnbrX
	mfzw==
X-Received: by 10.236.128.194 with SMTP id f42mr4987002yhi.197.1364131306786; 
	Sun, 24 Mar 2013 06:21:46 -0700 (PDT)
Received: from bill-the-cat (cpe-065-184-250-089.ec.res.rr.com.
	[65.184.250.89])
	by mx.google.com with ESMTPS id 10sm13446656yhp.5.2013.03.24.06.21.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Mar 2013 06:21:45 -0700 (PDT)
Date: Sun, 24 Mar 2013 09:21:49 -0400
From: Tom Rini <tom.rini@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20130324132149.GA9388@bill-the-cat>
References: <cover.1363255209.git.apelete@seketeli.net>
	<20130322221414.GB6454@hermes>
MIME-Version: 1.0
In-Reply-To: <20130322221414.GB6454@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH v5 0/2] Pull request 20130314
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
X-List-Received-Date: Sun, 24 Mar 2013 13:38:54 -0000
X-Groupsio-MsgNum: 43705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 11:14:14PM +0100, Apelete Seketeli wrote:
> Hi Tom,
>=20
> Le 14-Mar-13, Apelete Seketeli a ?crit:
> > Hello,
> >=20
> > The patches that come as a follow-up of this message fix an issue
> > found while building muffinman-image on top of the 2011.03-maintenance
> > branch, and also build a ubi image for the ben-nanonote machine.
> > This work is intended to be used as a basis for porting the JLime
> > distribution to oe-core.
> >=20
> > These modifications were tested by successfully building
> > muffinman-image from scratch on a Debian Wheezy host.
> > Please pull into 2011.03-maintenance branch.
> >=20
> > The following changes since commit ff679935b073a89c4e407d259bcc2eea9148=
fb91:
> >=20
> >   opkg-utils: bump SRCREV to latest (2012-10-26 11:11:59 +0200)
> >=20
> > are available in the git repository at:
> >=20
> >   git://seketeli.fr/~apelete/oe.git muffinman-image-fix
> >=20
> > Apelete Seketeli (2):
> >   gnutls: update SRC_URI
> >   jlime-2010.1: build ubi image for ben-nanonote machine
> >=20
> >  conf/bitbake.conf              |    2 +-
> >  conf/distro/jlime-2010.1.conf  |    3 ++-
> >  conf/machine/ben-nanonote.conf |   12 ++++++++++++
> >  recipes/gnutls/gnutls.inc      |    3 ++-
> >  4 files changed, 17 insertions(+), 3 deletions(-)
>=20
> It's been a week and no more reviews, could you please take a look at
> it and see if it's good to be pulled ?

Applied to 2011.03-maintenance, thanks for your patience!

--=20
Tom

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlFO/e0ACgkQdZngf2G4WwOs5ACgkjHYPkp5Hv79d0mn4VYU6ZpM
M8sAoIapnK/XkFjCf7AQvqdgOJo2hIcy
=pHSd
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
