Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvwNm-0000uQ-Lk for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 19:34:46 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvwKb-0003gT-6T for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 17:31:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hon5i2$8iq$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org>
Date: Sun, 28 Mar 2010 19:31:21 +0200
Message-ID: <1269797481.8018.80.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: enna: do_configure failed: automake: unknown warning category `cross'
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
X-List-Received-Date: Sun, 28 Mar 2010 17:34:46 -0000
X-Groupsio-MsgNum: 18202
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xmljVHOQAipEg1wSYLBo"

--=-xmljVHOQAipEg1wSYLBo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 28.03.2010, 10:55 +0200 schrieb Koen Kooi:
> On 27-03-10 23:54, Paul Menzel wrote:
> > I am trying to write the recipe for Enna [1].
>=20
> [..]
>=20
> > Now I am getting the following error message during `configure`.
> >=20
> >         [=E2=80=A6]
>=20
> >         configure.ac:35: required file `./config.rpath' not found
>=20
> > Any hint is appreciated.
>=20
> do_configure_prepend() {
> 	autopoint || touch config.rpath
> }

Thanks that worked!

Sorry for the next question. Is that workaround needed because of not
having Automake 1.11.1? Or is the recommended fix, that upstream ships
`config.rpath`?

[=E2=80=A6]


Thanks,

Paul

--=-xmljVHOQAipEg1wSYLBo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvkl8ACgkQPX1aK2wOHVgB1QCdHF4/Ol/jX45KGSNBAQVrjmtg
R6QAn37vBr7CsiNLB9Tcj76DZahqGrsv
=LYCG
-----END PGP SIGNATURE-----

--=-xmljVHOQAipEg1wSYLBo--
