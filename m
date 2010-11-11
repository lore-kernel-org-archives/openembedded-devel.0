Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGfcd-0001ZY-AU for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 23:28:19 +0100
Received: from f053038093.adsl.alicedsl.de ([78.53.38.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PGfbg-0002XI-OL for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 22:27:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289060440.4901.134.camel@mattotaupa>
References: <1288776534.3980.33.camel@mattotaupa>
	<4CD1A210.5000007@telus.net> <1288999268.4113.51.camel@mattotaupa>
	<20101106075118.GM15069@ibawizard.net>
	<1289035885.4901.2.camel@mattotaupa>
	<20101106103653.GO15069@ibawizard.net>
	<1289060440.4901.134.camel@mattotaupa>
Date: Thu, 11 Nov 2010 23:26:59 +0100
Message-ID: <1289514419.16615.19.camel@mattotaupa>
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
Subject: [PATCH][RESENT] vlc_1.1.4.1: add `lua5.1-native` to `DEPENDS` and `lua5.1` to `RDEPENDS`
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
X-List-Received-Date: Thu, 11 Nov 2010 22:28:22 -0000
X-Groupsio-MsgNum: 26076
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-a1yaTYm6XjduWu3ZuFTn"

--=-a1yaTYm6XjduWu3ZuFTn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 6 Nov 2010 12:00:31 +0100

Task `configure` failed with the following error.

        [=E2=80=A6]
        checking for LUA... yes
        checking for luac... no
        configure: error: Could not find the LUA byte compiler.
        ERROR: Function do_configure failed

It turns out that `luac` is needed on the build system and therefore `lua5.=
1-native` needs to be added to `DEPENDS`. Thanks to Petr =C5=A0tetiar for h=
is advise on this issue [1].

With this patch applied I built this recipe successfully with the following=
 build configuration.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "28492a5"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "2010.7-test-20101106"
        TARGET_FPU        =3D "hard"

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/0=
26631.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
This patch has the number 3506 in the patch queue [1].

[1] http://patchwork.openembedded.org/patch/3506/
---
 recipes/vlc/vlc_1.1.4.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
index af01d98..df8f17c 100644
--- a/recipes/vlc/vlc_1.1.4.1.bb
+++ b/recipes/vlc/vlc_1.1.4.1.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] =3D "61c9ea30a17ea40c6ccbfd507026e5c83=
ad9e0691f221d3667c8e49696
=20
 # ffmpeg from git (library version =3D> 52) is required
 # libtool-native must be >=3D 2.2.4
-DEPENDS +=3D "libdvdcss libdvdread lua5.1"
+DEPENDS +=3D "libdvdcss libdvdread lua5.1-native"
+RDEPENDS_${PN} +=3D "lua5.1"
=20
 EXTRA_OECONF +=3D "\
        --enable-dvdread \
--=20
1.7.2.3

--=-a1yaTYm6XjduWu3ZuFTn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzcbbMACgkQPX1aK2wOHVivwQCfaVY2obqhEf030Nh2hyLCAvOY
5iQAn351wRtTaFIYQZXA+YHCdt9Kg1Ye
=hmhF
-----END PGP SIGNATURE-----

--=-a1yaTYm6XjduWu3ZuFTn--
