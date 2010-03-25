Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NursY-0003Ni-Mg
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 19:34:03 +0100
Received: from p5b036bbd.dip.t-dialin.net ([91.3.107.189] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NurpT-00024w-6a by authid <stefan@sostec.de> with cram_md5;
	Thu, 25 Mar 2010 19:30:54 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>)
	id 1NurpS-0007mL-4A; Thu, 25 Mar 2010 19:30:50 +0100
Date: Thu, 25 Mar 2010 19:30:50 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Antonio Ospite <ospite@studenti.unina.it>
Message-ID: <20100325183050.GH11431@excalibur.local>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<1269537597-26456-5-git-send-email-ospite@studenti.unina.it>
	<20100325174240.GF11431@excalibur.local>
	<20100325191311.7f113c74.ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <20100325191311.7f113c74.ospite@studenti.unina.it>
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
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/5] ezx: update ezx-gen-blob version
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
X-List-Received-Date: Thu, 25 Mar 2010 18:34:03 -0000
X-Groupsio-MsgNum: 18127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Thu, 2010-03-25 at 19:13, Antonio Ospite wrote:
> On Thu, 25 Mar 2010 18:42:40 +0100
> Stefan Schmidt <stefan@datenfreihafen.org> wrote:
>=20
> > On Thu, 2010-03-25 at 18:19, Antonio Ospite wrote:
> > > NOTE: this version builds fine but the resulting binaries do not seem=
 to
> > > be correct, their size is about 300KiB instead of the expected 64KiB.
> > >=20
> > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> >=20
> > I would need some more information before acking this one. Does the old=
 rev
> > still build with the gcc in OE?
> >=20
> > If yes I would prefer to stay with the old rev as a known working one u=
ntil the
> > root cause is found and fixed. If it does not even build we could go ah=
ead and
> > bump the rev as it does make things not even worse.
> >
>=20
> The current version doesn't even build, so bumping the revision is good
> even if doesn't solve the size issue.
>=20
> > Side note for others: Personally I know nobody who ever installed the g=
en-blob
> > produced with OE on his phone. All people who did it used a precompiled=
 version
> > from Wyrm, Antonio or me or compiled it by hand. So this one should not=
 bring to
> > much harm.
> >
>=20
> As you may guess, even compiling it manually "doesn't work" anymore with
> a recent toolchain...  to be more precise: I've tried running the
> big binary loading it via usb, it seems to work but it is just not
> suitable to be flashed because of its size.

Interesting. It is stripped, right? Anyway, as the old one does not build a=
nd
the new one "works" you have my

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAkurq9kACgkQbNSsvd31FmWOOwCg46PNubvpW3DXWBUWa1kY1sZ1
WsgAoKcDpX1M7OYlRpODmrU+Kbt9rVVk
=Cyvy
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
