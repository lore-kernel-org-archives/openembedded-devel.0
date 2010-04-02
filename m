Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NxpqK-0004Jj-3m for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 01:00:00 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NxpnA-0000RU-FS for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 22:56:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100402211847.GK3270@jama>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<20100402211847.GK3270@jama>
Date: Sat, 03 Apr 2010 00:56:42 +0200
Message-ID: <1270249002.3714.29.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Setting `PV` in recipes using SCM repositories (was: [PATCH v3] enna: Move to own recipe folder and update to new Enna hg repository.)
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
X-List-Received-Date: Fri, 02 Apr 2010 23:00:00 -0000
X-Groupsio-MsgNum: 18409
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xQp05enbx2xwZ9+P+eEW"

--=-xQp05enbx2xwZ9+P+eEW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 02.04.2010, 23:18 +0200 schrieb Martin Jansa:
> On Fri, Apr 02, 2010 at 11:28:10AM -0700, Khem Raj wrote:
> > On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel
> > <paulepanter@users.sourceforge.net> wrote:
> > > 1. Create `enna.inc`.
> > > 2. Use `INC_PR`.
> > > 3. Move to new repository location.
> > > 4. Use `NOTQUITESRCREV` since `SRCREV` seems to get set to the one fr=
om the EFL recipes.
>=20
> You can use SRCREV again after
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D82b394467d=
9142edf2721176244c3a7eb26ba69a

I guess I have to resend a v4.

> And maybe you want rev shown in PV or PR
> PV =3D "0.4.0+hg${SRCPV}" or=20
> PR_append =3D "+hg${SRCPV}"
> is quire common and should work for hg too (haven't checked)

Unfortunately I could not find any information about `SRCPV` in the
BitBake or OE manual. What is the difference to `SRCREV`?

Anyway, the problem I have with appending the `SRCREV` to `PV` is, that
if you change the revision `bitbake -c clean recipe.bb` will not work
and the old files stay in the build tree. Is that true with `SRCPV`
also?

Could the TSC make a suggestion on how to set `PV` in recipes using SCM
repositories.


Thanks,

Paul

--=-xQp05enbx2xwZ9+P+eEW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2dioACgkQPX1aK2wOHVjbBQCeN6kWw6l/KbRfM8iX3UtqT2Jo
DL8AnjhlnjVCQHq49ZnzooMaqliFiE9F
=2Eoa
-----END PGP SIGNATURE-----

--=-xQp05enbx2xwZ9+P+eEW--
