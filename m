Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1POVeo-0008Nw-Er for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 14:26:41 +0100
Received: from f053040093.adsl.alicedsl.de ([78.53.40.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1POVdU-0005Q1-HZ for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 13:25:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1291365212.3669.6.camel@mattotaupa>
References: <1291365212.3669.6.camel@mattotaupa>
Date: Fri, 03 Dec 2010 14:25:15 +0100
Message-ID: <1291382715.3669.10.camel@mattotaupa>
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
Subject: [PATCH] [RESEND] midori: add `openssl` to `DEPENDS` and remove trailing whitespace
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
X-List-Received-Date: Fri, 03 Dec 2010 13:26:41 -0000
X-Groupsio-MsgNum: 26864
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-08bGpA4qT358k4Uf2cDE"

--=-08bGpA4qT358k4Uf2cDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 3 Dec 2010 00:55:42 +0100

Task `compile` of recipes `midori_0.2.*.bb` fails with the following error =
(`midori_0.2.8.bb`).

        NOTE: package midori-1_0.2.8-r0: task do_compile: Started
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/gtk-webcore/midori_0.2.8.b=
b do_compile failed
        ERROR: Task 13 (/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.b=
b, do_compile) failed with 256
        ERROR: '/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb' faile=
d
        ERROR: Function do_compile failed
        NOTE: Task failed: ('function do_compile failed', '/oe/build/angstr=
om-dev/work/armv7a-angstrom-linux-gnueabi/midori-1_0.2.8-r0/temp/log.do_com=
pile.17750')
        ERROR: Logfile of failure stored in: /oe/build/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/midori-1_0.2.8-r0/temp/log.do_compile.17750
        Log data follows:
        | NOTE: make
        | Waf: Entering directory `/oe/build/angstrom-dev/work/armv7a-angst=
rom-linux-gnueabi/midori-1_0.2.8-r0/midori-0.2.8/_build_'
        | [  1/119] glib_genmarshal: midori/marshal.list -> _build_/default=
/midori/marshal.h _build_/default/midori/marshal.c
        | [  2/119] cc: _build_/default/midori/marshal.c -> _build_/default=
/midori/marshal_1.o
        | [  3/119] cc: katze/katze-array.c -> _build_/default/katze/katze-=
array_1.o
        | [  4/119] cc: katze/katze-arrayaction.c -> _build_/default/katze/=
katze-arrayaction_1.o
        | [  5/119] cc: katze/katze-http-auth.c -> _build_/default/katze/ka=
tze-http-auth_1.o
        | [  6/119] cc: katze/katze-http-cookies.c -> _build_/default/katze=
/katze-http-cookies_1.o
        | [  7/119] cc: katze/katze-item.c -> _build_/default/katze/katze-i=
tem_1.o
        | [  8/119] cc: katze/katze-net.c -> _build_/default/katze/katze-ne=
t_1.o
        | [  9/119] cc: katze/katze-preferences.c -> _build_/default/katze/=
katze-preferences_1.o
        | [ 10/119] cc: katze/katze-scrolled.c -> _build_/default/katze/kat=
ze-scrolled_1.o
        | [ 11/119] cc: katze/katze-separatoraction.c -> _build_/default/ka=
tze/katze-separatoraction_1.o
        | [ 12/119] cc: katze/katze-throbber.c -> _build_/default/katze/kat=
ze-throbber_1.o
        | [ 13/119] cc: katze/katze-utils.c -> _build_/default/katze/katze-=
utils_1.o
        | [ 14/119] cc: panels/midori-bookmarks.c -> _build_/default/panels=
/midori-bookmarks_1.o
        | [ 15/119] cc: panels/midori-console.c -> _build_/default/panels/m=
idori-console_1.o
        | [ 16/119] cc: panels/midori-extensions.c -> _build_/default/panel=
s/midori-extensions_1.o
        | [ 17/119] cc: panels/midori-history.c -> _build_/default/panels/m=
idori-history_1.o
        | [ 18/119] cc: panels/midori-transfers.c -> _build_/default/panels=
/midori-transfers_1.o
        | [ 19/119] cc: toolbars/midori-findbar.c -> _build_/default/toolba=
rs/midori-findbar_1.o
        | [ 20/119] cc: toolbars/midori-transferbar.c -> _build_/default/to=
olbars/midori-transferbar_1.o
        | [ 21/119] cc: midori/gtkiconentry.c -> _build_/default/midori/gtk=
iconentry_1.o
        | [ 22/119] cc: midori/midori-app.c -> _build_/default/midori/midor=
i-app_1.o
        | [ 24/119] cc: midori/midori-browser.c -> _build_/default/midori/m=
idori-browser_1.o
        | [ 23/119] cc: midori/midori-array.c -> _build_/default/midori/mid=
ori-array_1.o
        | [ 25/119] cc: midori/midori-extension.c -> _build_/default/midori=
/midori-extension_1.o
        | [ 26/119] cc: midori/midori-locationaction.c -> _build_/default/m=
idori/midori-locationaction_1.o
        | [ 27/119] cc: midori/midori-panel.c -> _build_/default/midori/mid=
ori-panel_1.o
        | [ 28/119] cc: midori/midori-preferences.c -> _build_/default/mido=
ri/midori-preferences_1.o
        | [ 29/119] cc: midori/midori-searchaction.c -> _build_/default/mid=
ori/midori-searchaction_1.o
        | [ 30/119] cc: midori/midori-view.c -> _build_/default/midori/mido=
ri-view_1.o
        | [ 31/119] cc: midori/midori-viewable.c -> _build_/default/midori/=
midori-viewable_1.o
        | [ 32/119] cc: midori/midori-websettings.c -> _build_/default/mido=
ri/midori-websettings_1.o
        | [ 33/119] cc: midori/socket.c -> _build_/default/midori/socket_1.=
o
        | In file included from ../midori/socket.c:56:
        | ../midori/socket.h:27:27: error: openssl/ssl.h: No such file or d=
irectory
        | In file included from ../midori/socket.c:56:
        | ../midori/socket.h:49: error: expected specifier-qualifier-list b=
efore 'SSL'
        | ../midori/socket.h:119: error: expected ')' before '*' token
        | ../midori/socket.h:120: error: expected ')' before '*' token
        | ../midori/socket.h:121: error: expected ')' before '*' token
        | ../midori/socket.h:122: error: expected ')' before '*' token
        | ../midori/socket.h:123: error: expected ')' before '*' token
        | ../midori/socket.h:124: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_set_nonblocking_mode':
        | ../midori/socket.c:521: error: 'SockInfo' has no member named 'no=
nblock'
        | ../midori/socket.c: In function 'sock_check':
        | ../midori/socket.c:596: error: 'SockInfo' has no member named 'co=
ndition'
        | ../midori/socket.c:599: error: 'SockInfo' has no member named 'ss=
l'
        | ../midori/socket.c:601: warning: implicit declaration of function=
 'SSL_pending'
        | ../midori/socket.c:601: error: 'SockInfo' has no member named 'ss=
l'
        | ../midori/socket.c:603: warning: implicit declaration of function=
 'SSL_want_write'
        | ../midori/socket.c:603: error: 'SockInfo' has no member named 'ss=
l'
        | ../midori/socket.c:608: warning: implicit declaration of function=
 'SSL_want_read'
        | ../midori/socket.c:608: error: 'SockInfo' has no member named 'ss=
l'
        | ../midori/socket.c: In function 'sock_dispatch':
        | ../midori/socket.c:630: error: 'SockInfo' has no member named 'ca=
llback'
        | ../midori/socket.c:630: error: 'SockInfo' has no member named 'co=
ndition'
        | ../midori/socket.c:630: error: 'SockInfo' has no member named 'da=
ta'
        | ../midori/socket.c:631: warning: control reaches end of non-void =
function
        | ../midori/socket.c: In function 'sock_watch_cb':
        | ../midori/socket.c:638: error: 'SockInfo' has no member named 'co=
ndition'
        | ../midori/socket.c:641: error: 'SockInfo' has no member named 'ca=
llback'
        | ../midori/socket.c:641: error: 'SockInfo' has no member named 'co=
ndition'
        | ../midori/socket.c:641: error: 'SockInfo' has no member named 'da=
ta'
        | ../midori/socket.c:642: warning: control reaches end of non-void =
function
        | ../midori/socket.c: In function 'sock_add_watch':
        | ../midori/socket.c:647: error: 'SockInfo' has no member named 'ca=
llback'
        | ../midori/socket.c:648: error: 'SockInfo' has no member named 'co=
ndition'
        | ../midori/socket.c:649: error: 'SockInfo' has no member named 'da=
ta'
        | ../midori/socket.c:652: error: 'SockInfo' has no member named 'ss=
l'
        | ../midori/socket.c:663: error: 'SockInfo' has no member named 'so=
ck_ch'
        | ../midori/socket.c: In function 'sock_connect':
        | ../midori/socket.c:909: error: 'SockInfo' has no member named 'so=
ck_ch'
        | ../midori/socket.c:910: error: 'SockInfo' has no member named 'ho=
stname'
        | ../midori/socket.c:911: error: 'SockInfo' has no member named 'po=
rt'
        | ../midori/socket.c:912: error: 'SockInfo' has no member named 'st=
ate'
        | ../midori/socket.c:913: error: 'SockInfo' has no member named 'no=
nblock'
        | ../midori/socket.c: In function 'sock_connect_async_cb':
        | ../midori/socket.c:977: error: 'SockInfo' has no member named 'so=
ck_ch'
        | ../midori/socket.c:978: error: 'SockInfo' has no member named 'ho=
stname'
        | ../midori/socket.c:979: error: 'SockInfo' has no member named 'po=
rt'
        | ../midori/socket.c:980: error: 'SockInfo' has no member named 'st=
ate'
        | ../midori/socket.c:981: error: 'SockInfo' has no member named 'no=
nblock'
        | ../midori/socket.c: In function 'sock_read':
        | ../midori/socket.c:1379: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1380: warning: implicit declaration of functio=
n 'ssl_read'
        | ../midori/socket.c:1380: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: At top level:
        | ../midori/socket.c:1398: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_write':
        | ../midori/socket.c:1432: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1433: warning: implicit declaration of functio=
n 'ssl_write'
        | ../midori/socket.c:1433: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: At top level:
        | ../midori/socket.c:1463: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_write_all':
        | ../midori/socket.c:1487: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1488: warning: implicit declaration of functio=
n 'ssl_write_all'
        | ../midori/socket.c:1488: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: At top level:
        | ../midori/socket.c:1510: error: expected ')' before '*' token
        | ../midori/socket.c:1574: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_gets':
        | ../midori/socket.c:1602: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1603: warning: implicit declaration of functio=
n 'ssl_gets'
        | ../midori/socket.c:1603: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: At top level:
        | ../midori/socket.c:1634: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_getline':
        | ../midori/socket.c:1666: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1667: warning: implicit declaration of functio=
n 'ssl_getline'
        | ../midori/socket.c:1667: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: At top level:
        | ../midori/socket.c:1683: error: expected ')' before '*' token
        | ../midori/socket.c: In function 'sock_peek':
        | ../midori/socket.c:1717: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1718: warning: implicit declaration of functio=
n 'ssl_peek'
        | ../midori/socket.c:1718: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c: In function 'sock_close':
        | ../midori/socket.c:1731: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1735: error: 'SockInfo' has no member named 's=
ock_ch'
        | ../midori/socket.c:1736: error: 'SockInfo' has no member named 's=
ock_ch'
        | ../midori/socket.c:1737: error: 'SockInfo' has no member named 's=
ock_ch'
        | ../midori/socket.c:1747: error: 'SockInfo' has no member named 'h=
ostname'
        | ../midori/socket.c: In function 'ssl_done_socket':
        | ../midori/socket.c:1765: error: 'SockInfo' has no member named 's=
sl'
        | ../midori/socket.c:1766: warning: implicit declaration of functio=
n 'SSL_free'
        | ../midori/socket.c:1766: error: 'SockInfo' has no member named 's=
sl'
        | In file included from ../midori/midori-app.c:40:
        | ../midori/socket.h:27:27: error: openssl/ssl.h: No such file or d=
irectory
        | In file included from ../midori/midori-app.c:40:
        | ../midori/socket.h:49: error: expected specifier-qualifier-list b=
efore 'SSL'
        | ../midori/socket.h:119: error: expected ')' before '*' token
        | ../midori/socket.h:120: error: expected ')' before '*' token
        | ../midori/socket.h:121: error: expected ')' before '*' token
        | ../midori/socket.h:122: error: expected ')' before '*' token
        | ../midori/socket.h:123: error: expected ')' before '*' token
        | ../midori/socket.h:124: error: expected ')' before '*' token
        | Waf: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstr=
om-linux-gnueabi/midori-1_0.2.8-r0/midori-0.2.8/_build_'
        | Build failed:
        |  -> task failed (err #1):
        |       {task: cc socket.c -> socket_1.o}
        |  -> task failed (err #1):
        |       {task: cc midori-app.c -> midori-app_1.o}
        | make: *** [all] Error 1
        | FATAL: oe_runmake failed
        | ERROR: Function do_compile failed
        NOTE: package midori-1_0.2.8-r0: task do_compile: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/gtk-webcore/midori_0.2.8.b=
b do_compile failed
        ERROR: Task 13 (/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.b=
b, do_compile) failed with 256
        ERROR: '/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb' faile=
d

Adding `openssl` to `DEPENDS` fixes that error. The build succeeded with th=
e following build configuration.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "2abf626"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "2010.7-test-20101203"
        TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am resending this patch, because I messed up the meta data in my first me=
ssage.
---
 recipes/gtk-webcore/midori.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gtk-webcore/midori.inc b/recipes/gtk-webcore/midori.in=
c
index fc2df36..2f54c7b 100644
--- a/recipes/gtk-webcore/midori.inc
+++ b/recipes/gtk-webcore/midori.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Midori is a lightweight web browser."
 LICENSE =3D "GPLv2"
=20
-DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy"=20
+DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy openssl"
=20
 PE =3D "1"
=20
--=20
1.7.2.3

--=-08bGpA4qT358k4Uf2cDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkz477sACgkQPX1aK2wOHVj+pQCeKPOtTCVwNcP4SIQpJLXUYC32
xcIAniJbpMvimzFTrHtn2bgYxk/5h0vD
=RbY8
-----END PGP SIGNATURE-----

--=-08bGpA4qT358k4Uf2cDE--
