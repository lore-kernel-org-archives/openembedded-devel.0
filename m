Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nv8Sm-0001pj-Dl for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 13:16:34 +0100
Received: from g225083006.adsl.alicedsl.de ([92.225.83.6]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nv8Pj-0004Nl-7Z for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 12:13:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Mar 2010 13:13:21 +0100
Message-ID: <1269605601.3889.58.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: glib-2.0_2.23.6.bb: do_configure failed
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
X-List-Received-Date: Fri, 26 Mar 2010 12:16:34 -0000
X-Groupsio-MsgNum: 18147
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZHpTKmM7m3coTo9jedBr"

--=-ZHpTKmM7m3coTo9jedBr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I get the following error.

        $ more glib-2.0-2.23.6-r0/temp/log.do_configure.19885
        [=E2=80=A6]
        checking for inflate in -lz... no
        configure: error: *** Working zlib library and headers not found **=
*
        FATAL: oe_runconf failed

Do you get the failure? I am trying to fix it by adding `zlib` to
`DEPENDS` and will report back if it worked.


Thanks,

Paul

--=-ZHpTKmM7m3coTo9jedBr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuspOEACgkQPX1aK2wOHViWHQCfV4g3+9YX4jqNpWfRo7dmthPu
tJ4An1fqP2qYNkSk3k6mVEajVgG4iIjA
=Wd3M
-----END PGP SIGNATURE-----

--=-ZHpTKmM7m3coTo9jedBr--
