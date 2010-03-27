Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvexG-0003Z9-K5 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 23:58:11 +0100
Received: from f053034000.adsl.alicedsl.de ([78.53.34.0] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NveuC-0008VN-87 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 22:55:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Mar 2010 23:54:59 +0100
Message-ID: <1269730499.4033.176.camel@mattotaupa>
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
Subject: enna: do_configure failed: automake: unknown warning category `cross'
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
X-List-Received-Date: Sat, 27 Mar 2010 22:58:11 -0000
X-Groupsio-MsgNum: 18182
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2coRhrlER/30GIS1CxNF"

--=-2coRhrlER/30GIS1CxNF
Content-Type: multipart/mixed; boundary="=-AXyYpE+1NAIqRHzaRlNG"

--=-AXyYpE+1NAIqRHzaRlNG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I am trying to write the recipe for Enna [1].

        $ more enna.inc
        HOMEPAGE =3D "http://${PN}.geexbox.org/"
        SECTION =3D "x11/multimedia"
        LICENSE =3D "LGPLv2.1+"
        DEPENDS =3D "curl dbus eet evas edje ecore edbus elementary emotion=
"
        DEPENDS +=3D "libmusicbrainz lightmediascanner libxml2 taglib libva=
lhalla libplayer"
       =20
        INC_PR =3D "r1"
       =20
        SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D=
${PN}"
       =20
        inherit autotools pkgconfig

Now I am getting the following error message during `configure`.

        [=E2=80=A6]
        automake: unknown warning category `cross'
        configure.ac:27: installing `./compile'
        configure.ac:7: installing `./config.guess'
        configure.ac:35: required file `./config.rpath' not found
        configure.ac:7: installing `./config.sub'
        configure.ac:11: installing `./install-sh'
        configure.ac:11: installing `./missing'
        src/bin/Makefile.am: installing `./depcomp'
        autoreconf: automake failed with exit status: 1
        FATAL: autoreconf execution failed.

I am using automake 1.10.3 and it looks like I need 1.11.1.

I found this commit [2], but this workaround

        # Needs automake 1.11.x, which isn't safe to use yet in OE
        do_configure() {
               oe_runconf
        }

did not work for me. The error was then that `./configure` was not
found. So `autogen.sh` needs to be run and I just found the following
hint.

        do_configure_prepend() {
               sh autogen.sh
        }

But this fails with the error that C programs cannot be executed.

Any hint is appreciated.


Thanks,

Paul


PS: You need libvalhalla 2.0.0 for which I send a patch a moment ago (PV
=3D 1.0.0+hg).


[1] http://enna.geexbox.org/
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da353f4e=
e7229c686bfc61417cab979ffa1735d55

--=-AXyYpE+1NAIqRHzaRlNG
Content-Disposition: attachment; filename="enna.inc"
Content-Type: text/plain; name="enna.inc"; charset="UTF-8"
Content-Transfer-Encoding: base64

REVTQ1JJUFRJT04gPSAiRW5uYSBpcyBhIG1lZGlhIGNlbnRlciBhcHBsaWNhdGlvbiBiYXNlZCBv
biBFRkwuIg0KSE9NRVBBR0UgPSAiaHR0cDovLyR7UE59LmdlZXhib3gub3JnLyINClNFQ1RJT04g
PSAieDExL211bHRpbWVkaWEiDQpMSUNFTlNFID0gIkxHUEx2Mi4xKyINCkRFUEVORFMgPSAiY3Vy
bCBkYnVzIGVldCBldmFzIGVkamUgZWNvcmUgZWRidXMgZWxlbWVudGFyeSBlbW90aW9uIg0KREVQ
RU5EUyArPSAibGlibXVzaWNicmFpbnogbGlnaHRtZWRpYXNjYW5uZXIgbGlieG1sMiB0YWdsaWIg
bGlidmFsaGFsbGEgbGlicGxheWVyIGF1dG9tYWtlLW5hdGl2ZS0xLjExLjEiDQoNCklOQ19QUiA9
ICJyMSINCg0KU1JDX1VSSSA9ICJodHRwOi8vJHtQTn0uZ2VleGJveC5vcmcvcmVsZWFzZXMvJHtQ
fS50YXIuYnoyO25hbWU9JHtQTn0iDQoNCmluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KDQoj
ZG9fY29uZmlndXJlX3ByZXBlbmQoKSB7DQojCXNoIGF1dG9nZW4uc2gNCiN9DQoNCiMgTmVlZHMg
YXV0b21ha2UgMS4xMS54LCB3aGljaCBpc24ndCBzYWZlIHRvIHVzZSB5ZXQgaW4gT0UNCiNkb19j
b25maWd1cmUoKSB7DQojCW9lX3J1bmNvbmYNCiN9DQo=

--=-AXyYpE+1NAIqRHzaRlNG
Content-Disposition: attachment; filename="enna_hg.bb"
Content-Type: text/plain; name="enna_hg.bb"; charset="UTF-8"
Content-Transfer-Encoding: base64

cmVxdWlyZSBlbm5hLmluYw0KUFYgPSAiMC40LjAiDQpQUiA9ICIke0lOQ19QUn0uMCINClBSX2Fw
cGVuZCA9ICIraGdyJHtOT1RRVUlURVNSQ1JFVn0iDQoNCk5PVFFVSVRFU1JDUkVWID0gImViZjZm
YWVmMDEzNiINCg0KUyA9ICIke1dPUktESVJ9LyR7UE59Ig0K

--=-AXyYpE+1NAIqRHzaRlNG--

--=-2coRhrlER/30GIS1CxNF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuujMIACgkQPX1aK2wOHViFJwCfUyHUZvtM8F8RrT3/8M/POzDQ
7rYAnjdhFTPni/5GTGIo/kwbHqiMapZ3
=CT+Y
-----END PGP SIGNATURE-----

--=-2coRhrlER/30GIS1CxNF--
