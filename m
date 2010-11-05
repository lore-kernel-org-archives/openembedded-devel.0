Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEVbd-0007tf-3Y for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 00:22:03 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEVan-0005gq-RE for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:21:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CD1A210.5000007@telus.net>
References: <1288776534.3980.33.camel@mattotaupa> <4CD1A210.5000007@telus.net>
Date: Sat, 06 Nov 2010 00:21:08 +0100
Message-ID: <1288999268.4113.51.camel@mattotaupa>
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
Subject: vlc_1.1.4.1: Why is `lua5.1-native` not added to `DEPENDS` automatically? (was: [PATCH] vlc_1.1.4.1: add `lua5.1` to `DEPENDS`)
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
X-List-Received-Date: Fri, 05 Nov 2010 23:22:03 -0000
X-Groupsio-MsgNum: 25940
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KcSg4GL+F60GvMGgK75M"

--=-KcSg4GL+F60GvMGgK75M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 03.11.2010, 10:55 -0700 schrieb Dallas Foley:
> On 10-11-03 02:28 AM, Paul Menzel wrote:
> > Date: Wed, 3 Nov 2010 09:52:36 +0100
> >
> > After VLC 1.0.6, being the latest version in OE until addition of 1.1.4=
.1 in commit 30e362 [2], some interfaces were implemented in Lua in VLC 1.1=
.0 [1].
> >
> > 	Interfaces:
> > 	 * Renamed the legacy rc, telnet and http interfaces to oldrc, oldteln=
et and oldhttp.
> > 	 * rc, telnet and http are now implemented using the lua interface sys=
tem.
> >
> > Task `configure` fails with the following error message.
> >
> > 	[=E2=80=A6]
> > 	| checking for LUA... no
> > 	| configure: WARNING: lua5.1 not found, trying lua>=3D 5.1 instead
> > 	| checking for LUA... no
> > 	| checking lua.h usability... no
> > 	| checking lua.h presence... no
> > 	| checking for lua.h... no
> > 	| checking lauxlib.h usability... no
> > 	| checking lauxlib.h presence... no
> > 	| checking for lauxlib.h... no
> > 	| checking lualib.h usability... no
> > 	| checking lualib.h presence... no
> > 	| checking for lualib.h... no
> > 	| checking for luaL_newstate in -llua5.1 ... no
> > 	| checking for luaL_newstate in -llua51 ... no
> > 	| checking for luaL_newstate in -llua ... no
> > 	| configure: error: Could not find lua. Lua is needed for some interfa=
ces (rc, telnet, http) as well as many other custom scripts. Use --disable-=
lua to ignore this error.
> > 	| ERROR: Function do_configure failed
> > 	NOTE: package vlc-1.1.4.1-r0: task do_configure: Failed
> > 	[=E2=80=A6]
> >
> > Adding `lua5.1` to `DEPENDS` is chosen in favor of disabling it.
> >
> > [1] http://git.videolan.org/?p=3Dvlc.git;a=3Dcommitdiff;h=3D3c1df96cda8=
086f605f2eacaa5653c9e43ec45ac
> > [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D30e=
362c22a49521ebeef9bed1f0c58902b7dc50b
> >
> > Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
> > ---
> >   recipes/vlc/vlc_1.1.4.1.bb |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
> > index d4535a5..ef764c1 100644
> > --- a/recipes/vlc/vlc_1.1.4.1.bb
> > +++ b/recipes/vlc/vlc_1.1.4.1.bb
> > @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "61c9ea30a17ea40c6ccbfd507026e=
5c83ad9e0691f221d3667c8e49696
> >
> >   # ffmpeg from git (library version =3D>  52) is required
> >   # libtool-native must be>=3D 2.2.4
> > -DEPENDS +=3D "libdvdcss libdvdread"
> > +DEPENDS +=3D "libdvdcss libdvdread lua"
> >
> >   EXTRA_OECONF +=3D "\
> >   	--enable-dvdread \
>
> I seem to need lua5.1 and lua5.1-native in DEPENDS for this vlc as oppose=
d to just lua.

You are indeed correct. Somehow I messed up the patch and just edited
the commit message. :( I sent a fixup some minutes ago [3].

> ie. DEPENDS +=3D "libdvdcss libdvdread lua5.1 lua5.1-native"
>=20
> I doubt this has anything to do with it, but I am using DISTRO=3D"angstro=
m-2010.x"
> and setting
> ANGSTROM_LIBTOOL_VERSION =3D "2.2.6b"
> LIBTOOL_HAS_SYSROOT =3D "no"
> only because apache2 does not configure with the newer libtool

As you wrote after applying this patch there is still the following
problem in the task `configure`.

        [=E2=80=A6]
        checking for LUA... yes
        checking for luac... no
        configure: error: Could not find the LUA byte compiler.
        ERROR: Function do_configure failed

Indeed in all my tests there is no `luac` staged.

        $ find . -name *luac*
        ./minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include/luaconf.=
h
        ./minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/man/man1/l=
uac.1
        ./minimal-dev/work/armv7a-oe-linux-gnueabi/vlc-1.1.4.1-r0/vlc-1.1.4=
.1/share/lua/intf/luac.lua
        $ find angstrom-dev/ -name *luac* # angstrom-2008.1
        angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/lua=
conf.h
        angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/man/m=
an1/luac.1
        angstrom-dev/work/armv7a-angstrom-linux-gnueabi/vlc-1.1.4.1-r0/vlc-=
1.1.4.1/share/lua/intf/luac.lua

This should be done by adding `lua5.1-native` to `DEPENDS` as you
suggested. But I am wondering why `lua5.1` is not providing `luac`. Is
there a problem with the `lua5.1` recipe [4][5]?


Thanks,

Paul


[3] http://patchwork.openembedded.org/patch/3504/
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/lua/lua=
5.1_5.1.4.bb?id=3D48838f0fca6b00767115dd13bce2537f035fd3ba
[5] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/lua/lua=
.inc?id=3D709c4d66e0b107ca606941b988bad717c0b45d9b

--=-KcSg4GL+F60GvMGgK75M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUkWQACgkQPX1aK2wOHVh4YACcD5QBD2TMmIgHwPNG52my506O
P9kAn1i/NR70D/7piOxPnUIEe+UaCjzX
=TJMJ
-----END PGP SIGNATURE-----

--=-KcSg4GL+F60GvMGgK75M--
