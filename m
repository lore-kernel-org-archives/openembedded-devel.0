Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7Y9R-00044e-62 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 20:40:12 +0200
Received: from f053038064.adsl.alicedsl.de ([78.53.38.64]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7Y8v-0003m9-Vi for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 18:39:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 20:39:36 +0200
Message-ID: <1287340776.3748.31.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libgee: `do_configure` fails: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Sun, 17 Oct 2010 18:40:12 -0000
X-Groupsio-MsgNum: 24987
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hfcu6Ep84lLuEIrjUitc"

--=-hfcu6Ep84lLuEIrjUitc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


commit a89e9c

        libgee.inc: Use libtool macros from installed libtool

breaks task `do_configure` with at least `minimal-{libc,uclibc,eglibc}`.

        | gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_COND=
ITIONAL
        | autoreconf: automake failed with exit status: 1
        | FATAL: autoreconf execution failed.
        | ERROR: Function do_configure failed
        NOTE: package libgee-1_0.6.0-r6.0: task do_configure: Failed

This problem was seen before [2].

Reverting commit a89e9c fixes the build.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da89e9c4=
1f6ea2df686bcfb7c01b39b23685b4261
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5125.html

--=-hfcu6Ep84lLuEIrjUitc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky7QugACgkQPX1aK2wOHVjO9gCfdff2VlDU6gahIrTeMQm6AeZq
a2YAnia+oTfxTkXy7x0uKVeEbEO47c++
=NFoL
-----END PGP SIGNATURE-----

--=-hfcu6Ep84lLuEIrjUitc--
