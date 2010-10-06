Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3dV4-00010N-L9 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 01:34:19 +0200
Received: from f053036164.adsl.alicedsl.de ([78.53.36.164]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3dUm-0006x5-1r; Wed, 06 Oct 2010 23:34:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Oct 2010 01:33:58 +0200
Message-ID: <1286408038.3829.22.camel@mattotaupa>
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
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: libgee_0.6.0: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Wed, 06 Oct 2010 23:34:19 -0000
X-Groupsio-MsgNum: 24457
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-D2eoSsBqGGFRs3HTARYv"

--=-D2eoSsBqGGFRs3HTARYv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`configure` fails for me for `libgee_0.6.0.bb` [1].

        | gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_COND=
ITIONAL

`libgee_0.5.2.bb` builds correctly because it does not yet use gobject-intr=
ospection.

This question was brought up before but was left unanswered [2].

There was no file `introspection.m4`, where `HAVE_INTROSPECTION` is
defined in, in

	=E2=80=A6/work/armv7a-oe-linux-gnueabi/libgee-1_0.6.0-r1/libgee-0.6.0/m4

as recommended in [3]. Should the m4 file be copied there as it is done
for the other m4 files?

        [=E2=80=A6]
        | autoreconf: configure.ac: tracing
        | autoreconf: running: libtoolize --copy --force
        | libtoolize: putting auxiliary files in `.'.
        | libtoolize: copying file `./ltmain.sh'
        | libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
        | libtoolize: copying file `m4/libtool.m4'
        | libtoolize: copying file `m4/ltoptions.m4'
        | libtoolize: copying file `m4/ltsugar.m4'
        | libtoolize: copying file `m4/ltversion.m4'
        | libtoolize: copying file `m4/lt~obsolete.m4'
        [=E2=80=A6]

I manually put the m4 file [4] into `libgee-0.6.0/m4/` and added
`m4/introspection.m4` to `EXTRA_DIST` in `Makefile.am` to `` but

	bitbake -c configure libgee

still failed.

Do you have any ideas?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/diff/recipes/libgee/=
libgee_0.6.0.bb?id=3D57c890552b870c6b0941fa3ba12943cf2e6879d0
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/02157=
1.html
[3] http://live.gnome.org/GObjectIntrospection/AutotoolsIntegration
[4] http://git.gnome.org/browse/gobject-introspection/tree/m4/introspection=
.m4

--=-D2eoSsBqGGFRs3HTARYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkytB1gACgkQPX1aK2wOHVgdCwCfXgQNYxpDOfLTVV6qLFTgmAOH
9KEAnj95HD9EEPQpUfgWPg6fpYWiWiv/
=dAZE
-----END PGP SIGNATURE-----

--=-D2eoSsBqGGFRs3HTARYv--
