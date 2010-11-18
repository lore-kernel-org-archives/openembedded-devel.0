Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJ9W0-0000KG-5F for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:47:26 +0100
Received: from f053032179.adsl.alicedsl.de ([78.53.32.179]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJ9Uw-0004Kh-Sk for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 18:46:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CE56C6B.1050009@eukrea.com>
References: <1290002140-17255-1-git-send-email-eric@eukrea.com>
	<20101118180346.GA18493@denix.org>  <4CE56C6B.1050009@eukrea.com>
Date: Thu, 18 Nov 2010 19:46:17 +0100
Message-ID: <1290105977.3755.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] amend.bbclass: handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Thu, 18 Nov 2010 18:47:33 -0000
X-Groupsio-MsgNum: 26281
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-L3bJwPCj1/dY60aiOQgR"

--=-L3bJwPCj1/dY60aiOQgR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 18.11.2010, 19:11 +0100 schrieb Eric B=C3=A9nard:
> On 18/11/2010 19:03, Denys Dmytriyenko wrote:
> > On Wed, Nov 17, 2010 at 02:55:40PM +0100, Eric B??nard wrote:
> >> * setting PACKAGE_ARCH =3D "${MACHINE_ARCH}" in and amend.inc actually
> >> leads to a packaga with the correct machine arch but the

s/packaga/package/

> >> work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
> >> updated after amend.inc is parsed.
> >>
> >> * this patch updates MULTIMACH_ARCH if PACKAGE_ARCH is changed in
> >> amend.inc
> >>
> >> Signed-off-by: Eric B??nard<eric@eukrea.com>
> >
> > Thanks! We have faced this issue before.
> >
> > Acked-by: Denys Dmytriyenko<denis@denix.org>
>=20
> I'm working on an update version after discussion with Kergoth on IRC. I =
hope=20
> to send it for review by tomorrow.

Just pointing out the typo above since you are going to update the
patch.


Thanks,

Paul

--=-L3bJwPCj1/dY60aiOQgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzldHkACgkQPX1aK2wOHVi/WACfTMXJLiPbqvKIxLIqJzmWkFRQ
pNkAn3A0RopUBNgtOg4gd0XU5bd3jJFt
=5pRj
-----END PGP SIGNATURE-----

--=-L3bJwPCj1/dY60aiOQgR--
