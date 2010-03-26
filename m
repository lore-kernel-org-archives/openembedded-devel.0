Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvGue-0002Ob-AM
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:17:52 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvGrY-0000N8-DC by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 22:14:43 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvGrX-0002kh-AF
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:14:39 +0100
Date: Fri, 26 Mar 2010 22:14:39 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326211439.GB12605@excalibur.local>
References: <1269557553-6295-1-git-send-email-ospite@studenti.unina.it>
	<20100326002634.GA18231@gmail.com>
	<20100326092057.af620774.ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <20100326092057.af620774.ospite@studenti.unina.it>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] numptyphysics: update SRC_URI
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
X-List-Received-Date: Fri, 26 Mar 2010 21:17:52 -0000
X-Groupsio-MsgNum: 18152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Fri, 2010-03-26 at 09:20, Antonio Ospite wrote:
> On Thu, 25 Mar 2010 17:26:34 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On (25/03/10 23:52), Antonio Ospite wrote:
> > > The old SRC_URI doesn't work anymore, use vcs.maemo.org instead of
> > > garage.maemo.org as stated on https://garage.maemo.org/scm/?group_id=
=3D638
> > >=20
> > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > > ---
> > >  recipes/numptyphysics/numptyphysics_svn.bb |    4 ++--
> > >  1 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/num=
ptyphysics/numptyphysics_svn.bb
> [...]
> > >  SRC_URI =3D "\
> > >  # Maemo garage is sadly only available with https. Can make you trou=
ble while fetching without accepting the certificate.
> > > -  svn://garage.maemo.org/svn/${PN};module=3Dtrunk;proto=3Dhttps \
> > > +  svn://vcs.maemo.org/svn/${PN};module=3Dtrunk;proto=3Dhttps \
> >=20
> > does this also need updating checksums ?
>=20
> I don't know, are checksums used also for stuff pulled from scm repos?
> In checksum.ini I only see an entry for numptyphysics_setup.tgz and the
> URI for this one is left untouched by this patch.

That's correct. I tested the patch here and it builds fine. Applied and pus=
hed.

regards
Stefan Schmidt

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAkutI78ACgkQbNSsvd31FmU3EwCgh3r60x/anJ7Ijq9qXnl5Q3Nu
+AAAoK2qNUTyjr+8+yo+52P4klReMQ5A
=sZTh
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
