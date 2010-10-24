Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PA6XR-0007Mc-6E for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 21:47:29 +0200
Received: from f053032104.adsl.alicedsl.de ([78.53.32.104]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PA6Wp-0005x3-7D for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 19:46:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CC48B1B.6010405@eukrea.com>
References: <1287927378-11971-1-git-send-email-eric@eukrea.com>
	<AANLkTinU5a-o28y1CsAG2Yw_EpU3_SP-Pfe1ixcL7msC@mail.gmail.com>
	<4CC48B1B.6010405@eukrea.com>
Date: Sun, 24 Oct 2010 21:46:49 +0200
Message-ID: <1287949609.3866.4.camel@mattotaupa>
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
Subject: Re: [PATCH] shadow: Switch to getting libtool from PATH
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
X-List-Received-Date: Sun, 24 Oct 2010 19:47:30 -0000
X-Groupsio-MsgNum: 25415
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-z373rBcxz/fOvXgbIlpl"

--=-z373rBcxz/fOvXgbIlpl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric, dear Khem,


Am Sonntag, den 24.10.2010, 21:38 +0200 schrieb Eric B=C3=A9nard:

> Le 24/10/2010 20:28, Khem Raj a =C3=A9crit :
> > 2010/10/24 Eric B=C3=A9nard<eric@eukrea.com>:
> >> * with PAM enabled, shadow's libtool sets lt_sysroot to the machine's
> >> sysroot and not the arch's sysroot, thus it can't find libpam.
> >> * by using libtool from PATH, this patch fix the problem.
> >> * tested using angstrom-2010.x for an arvm5te target
> >>
> >> Signed-off-by: Eric B=C3=A9nard<eric@eukrea.com>
> >
> > I have fixed it in autotools class. Basically it should have takes
> > care of setting
> > the sysroot correctly for arch and machine recipes equally. Should be f=
ixed now
> > please pull and retest.

That is commit 669ac1 [1].
>
> you patch fixe the problem. Thanks

For me too with `angstrom-2008.1` for `MACHINE=3D"beagleboard"`!


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D669ac12=
1adeacd1850f67ab4aa758036f4599135

--=-z373rBcxz/fOvXgbIlpl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzEjSkACgkQPX1aK2wOHVjzZwCfXQFgugN1fnNjAsELqnAyg0bK
hPgAn2kthrFelCIz68rJc7ihs13+tdX/
=Sqlq
-----END PGP SIGNATURE-----

--=-z373rBcxz/fOvXgbIlpl--
