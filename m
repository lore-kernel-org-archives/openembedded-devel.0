Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nwa0o-0005d7-56 for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 13:53:39 +0200
Received: from f053036078.adsl.alicedsl.de ([78.53.36.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwZxh-0001MH-DK for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 11:50:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hooat6$p3d$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org> <1269797481.8018.80.camel@mattotaupa>
	<hooat6$p3d$1@dough.gmane.org>
Date: Tue, 30 Mar 2010 13:50:24 +0200
Message-ID: <1269949824.4103.38.camel@mattotaupa>
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
Subject: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Tue, 30 Mar 2010 11:53:39 -0000
X-Groupsio-MsgNum: 18252
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-spvOOyY33Hxx9wM+goZa"

--=-spvOOyY33Hxx9wM+goZa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In commit 0f235b0f42575bfb50dd891cf44aa08c2e404a67 [1] `autotools.bbclass` =
was imported from BitKeeper. According to rwhitby on IRC the original autho=
r of `autotool.bbclass` cannot be found out anymore, so the reason why Auto=
point has to be excluded not known.

Having `EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"` in `autotools.bbclass=
` forces the usage of same hacks to prevent failure of `do_configure` [2].

    configure.ac:35: required file `./config.rpath' not found

I ran a build from scratch with `EXTRA_AUTORECONF =3D "--exclude=3Dautopoin=
t"` from `autotools.bbclass` and did not see any regressions.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0f235b0=
f42575bfb50dd891cf44aa08c2e404a67
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/0188=
18.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 classes/autotools.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 31d3578..5902e87 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -35,7 +35,6 @@ inherit siteinfo
 export CONFIG_SITE =3D "${@siteinfo_get_files(d)}"
=20
 acpaths =3D "default"
-EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"
=20
 def autotools_set_crosscompiling(d):
 	if not bb.data.inherits_class('native', d):
--=20
1.7.0.3

--=-spvOOyY33Hxx9wM+goZa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkux5YAACgkQPX1aK2wOHVjjRgCfSz47wO3ntNXJ50Vsx1xt6Mrv
LoYAnjShLfIy+WMO/2OIV/JhScuqPw1g
=VSQ2
-----END PGP SIGNATURE-----

--=-spvOOyY33Hxx9wM+goZa--
