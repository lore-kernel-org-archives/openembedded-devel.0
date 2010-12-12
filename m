Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PRoGn-0008RL-NU for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 16:55:30 +0100
Received: from f053045090.adsl.alicedsl.de ([78.53.45.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PRoFJ-0005Ry-FA for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 15:53:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Dec 2010 16:53:56 +0100
Message-ID: <1292169236.13905.40.camel@mattotaupa>
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
Subject: OT: cross compiling: `?=` or `+=` for `INCLUDES`
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
X-List-Received-Date: Sun, 12 Dec 2010 15:55:30 -0000
X-Groupsio-MsgNum: 27101
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jrL/HkWgWbEZx/6N+Hzz"

--=-jrL/HkWgWbEZx/6N+Hzz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


what is the best practice for Makefiles with `INCLUDES`? On the VDR list
it was requested to use `+=3D` instead of `?=3D`. [1]

        However, in the Makefile changes:
        -INCLUDES =3D -I/usr/include/freetype2
        +INCLUDES ?=3D -I/usr/include/freetype2
       =20
        Shouldn't that be +=3D instead of ?=3D.
       =20
        In my case, my IDE sets INCLUDES with some custom stuff. Therefore =
the
        Makefile does not touch INCLUDES any more and I get an error.

Is it common when changing `INCLUDES` that one has to take care about
this by oneself, i. e. by adding `-I/usr/include/freetype2` to
`INCLUDES`? Or is there a better way?


Thanks,

Paul


[1] http://www.linuxtv.org/pipermail/vdr/2010-November/023953.html
[2] http://www.linuxtv.org/pipermail/vdr/2010-December/024019.html

--=-jrL/HkWgWbEZx/6N+Hzz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0E8BMACgkQPX1aK2wOHVjQJACfdY+lLMsQXWafW7B2T/Zv2MSm
YGoAn3DoiEdcWi7S5Rdcu/OeSEFnROmx
=xMlZ
-----END PGP SIGNATURE-----

--=-jrL/HkWgWbEZx/6N+Hzz--
