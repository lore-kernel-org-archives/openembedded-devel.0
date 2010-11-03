Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZf5-0005Fs-Gs for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:29:45 +0100
Received: from f053043217.adsl.alicedsl.de ([78.53.43.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDZeJ-0001MM-0F for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 09:28:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 03 Nov 2010 10:28:54 +0100
Message-ID: <1288776534.3980.33.camel@mattotaupa>
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
Subject: [PATCH] vlc_1.1.4.1: add `lua5.1` to `DEPENDS`
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
X-List-Received-Date: Wed, 03 Nov 2010 09:29:45 -0000
X-Groupsio-MsgNum: 25773
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DLRxyOnTOvbcMs9yCMvz"

--=-DLRxyOnTOvbcMs9yCMvz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 3 Nov 2010 09:52:36 +0100

After VLC 1.0.6, being the latest version in OE until addition of 1.1.4.1 i=
n commit 30e362 [2], some interfaces were implemented in Lua in VLC 1.1.0 [=
1].

	Interfaces:
	 * Renamed the legacy rc, telnet and http interfaces to oldrc, oldtelnet a=
nd oldhttp.
	 * rc, telnet and http are now implemented using the lua interface system.

Task `configure` fails with the following error message.

	[=E2=80=A6]
	| checking for LUA... no
	| configure: WARNING: lua5.1 not found, trying lua >=3D 5.1 instead
	| checking for LUA... no
	| checking lua.h usability... no
	| checking lua.h presence... no
	| checking for lua.h... no
	| checking lauxlib.h usability... no
	| checking lauxlib.h presence... no
	| checking for lauxlib.h... no
	| checking lualib.h usability... no
	| checking lualib.h presence... no
	| checking for lualib.h... no
	| checking for luaL_newstate in -llua5.1 ... no
	| checking for luaL_newstate in -llua51 ... no
	| checking for luaL_newstate in -llua ... no
	| configure: error: Could not find lua. Lua is needed for some interfaces =
(rc, telnet, http) as well as many other custom scripts. Use --disable-lua =
to ignore this error.
	| ERROR: Function do_configure failed
	NOTE: package vlc-1.1.4.1-r0: task do_configure: Failed
	[=E2=80=A6]

Adding `lua5.1` to `DEPENDS` is chosen in favor of disabling it.

[1] http://git.videolan.org/?p=3Dvlc.git;a=3Dcommitdiff;h=3D3c1df96cda8086f=
605f2eacaa5653c9e43ec45ac
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D30e362c=
22a49521ebeef9bed1f0c58902b7dc50b

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/vlc/vlc_1.1.4.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
index d4535a5..ef764c1 100644
--- a/recipes/vlc/vlc_1.1.4.1.bb
+++ b/recipes/vlc/vlc_1.1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "61c9ea30a17ea40c6ccbfd507026e5c83=
ad9e0691f221d3667c8e49696
=20
 # ffmpeg from git (library version =3D> 52) is required
 # libtool-native must be >=3D 2.2.4
-DEPENDS +=3D "libdvdcss libdvdread"
+DEPENDS +=3D "libdvdcss libdvdread lua"
=20
 EXTRA_OECONF +=3D "\
 	--enable-dvdread \
--=20
1.7.2.3

--=-DLRxyOnTOvbcMs9yCMvz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzRK1UACgkQPX1aK2wOHVjpfwCfdLr/ULZIfzA7Fe+SOpFP8cjH
ybcAn3xEvXp7IeIzDPMtsOx8cQ6+SIbX
=o4Gs
-----END PGP SIGNATURE-----

--=-DLRxyOnTOvbcMs9yCMvz--
