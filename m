Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1POR6V-0002U2-Lj for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 09:34:57 +0100
Received: from f053040093.adsl.alicedsl.de ([78.53.40.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1POR5B-0003Tx-V5 for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 08:33:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 03 Dec 2010 09:33:32 +0100
Message-ID: <1291365212.3669.6.camel@mattotaupa>
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
Subject: [PATCH] midori: add `openssl` to `DEPENDS` and remove trailing whitespace
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
X-List-Received-Date: Fri, 03 Dec 2010 08:34:57 -0000
X-Groupsio-MsgNum: 26860
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Hvg8+oks6trSKGF5sMun"

--=-Hvg8+oks6trSKGF5sMun
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=46rom c6d14219ce170589be7a482df7e793aafa140afd Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Fri, 3 Dec 2010 00:55:42 +0100
Subject: [PATCH] midori: add `openssl` to `DEPENDS`

Task `compile` of recipes `midori_0.2.*.bb` fails with the following error =
(`midori_0.2.8.bb`).

	NOTE: package midori-1_0.2.8-r0: task do_compile: Started
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb do_co=
mpile failed
	ERROR: Task 13 (/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb, do_c=
ompile) failed with 256
	ERROR: '/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb' failed
	ERROR: Function do_compile failed
	NOTE: Task failed: ('function do_compile failed', '/oe/build/angstrom-dev/=
work/armv7a-angstrom-linux-gnueabi/midori-1_0.2.8-r0/temp/log.do_compile.17=
750')
	ERROR: Logfile of failure stored in: /oe/build/angstrom-dev/work/armv7a-an=
gstrom-linux-gnueabi/midori-1_0.2.8-r0/temp/log.do_compile.17750
	Log data follows:
	| NOTE: make
	| Waf: Entering directory `/oe/build/angstrom-dev/work/armv7a-angstrom-lin=
ux-gnueabi/midori-1_0.2.8-r0/midori-0.2.8/_build_'
	| [  1/119] glib_genmarshal: midori/marshal.list -> _build_/default/midori=
/marshal.h _build_/default/midori/marshal.c
	| [  2/119] cc: _build_/default/midori/marshal.c -> _build_/default/midori=
/marshal_1.o
	| [  3/119] cc: katze/katze-array.c -> _build_/default/katze/katze-array_1=
.o
	| [  4/119] cc: katze/katze-arrayaction.c -> _build_/default/katze/katze-a=
rrayaction_1.o
	| [  5/119] cc: katze/katze-http-auth.c -> _build_/default/katze/katze-htt=
p-auth_1.o
	| [  6/119] cc: katze/katze-http-cookies.c -> _build_/default/katze/katze-=
http-cookies_1.o
	| [  7/119] cc: katze/katze-item.c -> _build_/default/katze/katze-item_1.o
	| [  8/119] cc: katze/katze-net.c -> _build_/default/katze/katze-net_1.o
	| [  9/119] cc: katze/katze-preferences.c -> _build_/default/katze/katze-p=
references_1.o
	| [ 10/119] cc: katze/katze-scrolled.c -> _build_/default/katze/katze-scro=
lled_1.o
	| [ 11/119] cc: katze/katze-separatoraction.c -> _build_/default/katze/kat=
ze-separatoraction_1.o
	| [ 12/119] cc: katze/katze-throbber.c -> _build_/default/katze/katze-thro=
bber_1.o
	| [ 13/119] cc: katze/katze-utils.c -> _build_/default/katze/katze-utils_1=
.o
	| [ 14/119] cc: panels/midori-bookmarks.c -> _build_/default/panels/midori=
-bookmarks_1.o
	| [ 15/119] cc: panels/midori-console.c -> _build_/default/panels/midori-c=
onsole_1.o
	| [ 16/119] cc: panels/midori-extensions.c -> _build_/default/panels/midor=
i-extensions_1.o
	| [ 17/119] cc: panels/midori-history.c -> _build_/default/panels/midori-h=
istory_1.o
	| [ 18/119] cc: panels/midori-transfers.c -> _build_/default/panels/midori=
-transfers_1.o
	| [ 19/119] cc: toolbars/midori-findbar.c -> _build_/default/toolbars/mido=
ri-findbar_1.o
	| [ 20/119] cc: toolbars/midori-transferbar.c -> _build_/default/toolbars/=
midori-transferbar_1.o
	| [ 21/119] cc: midori/gtkiconentry.c -> _build_/default/midori/gtkiconent=
ry_1.o
	| [ 22/119] cc: midori/midori-app.c -> _build_/default/midori/midori-app_1=
.o
	| [ 24/119] cc: midori/midori-browser.c -> _build_/default/midori/midori-b=
rowser_1.o
	| [ 23/119] cc: midori/midori-array.c -> _build_/default/midori/midori-arr=
ay_1.o
	| [ 25/119] cc: midori/midori-extension.c -> _build_/default/midori/midori=
-extension_1.o
	| [ 26/119] cc: midori/midori-locationaction.c -> _build_/default/midori/m=
idori-locationaction_1.o
	| [ 27/119] cc: midori/midori-panel.c -> _build_/default/midori/midori-pan=
el_1.o
	| [ 28/119] cc: midori/midori-preferences.c -> _build_/default/midori/mido=
ri-preferences_1.o
	| [ 29/119] cc: midori/midori-searchaction.c -> _build_/default/midori/mid=
ori-searchaction_1.o
	| [ 30/119] cc: midori/midori-view.c -> _build_/default/midori/midori-view=
_1.o
	| [ 31/119] cc: midori/midori-viewable.c -> _build_/default/midori/midori-=
viewable_1.o
	| [ 32/119] cc: midori/midori-websettings.c -> _build_/default/midori/mido=
ri-websettings_1.o
	| [ 33/119] cc: midori/socket.c -> _build_/default/midori/socket_1.o
	| In file included from ../midori/socket.c:56:
	| ../midori/socket.h:27:27: error: openssl/ssl.h: No such file or director=
y
	| In file included from ../midori/socket.c:56:
	| ../midori/socket.h:49: error: expected specifier-qualifier-list before '=
SSL'
	| ../midori/socket.h:119: error: expected ')' before '*' token
	| ../midori/socket.h:120: error: expected ')' before '*' token
	| ../midori/socket.h:121: error: expected ')' before '*' token
	| ../midori/socket.h:122: error: expected ')' before '*' token
	| ../midori/socket.h:123: error: expected ')' before '*' token
	| ../midori/socket.h:124: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_set_nonblocking_mode':
	| ../midori/socket.c:521: error: 'SockInfo' has no member named 'nonblock'
	| ../midori/socket.c: In function 'sock_check':
	| ../midori/socket.c:596: error: 'SockInfo' has no member named 'condition=
'
	| ../midori/socket.c:599: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:601: warning: implicit declaration of function 'SSL_p=
ending'
	| ../midori/socket.c:601: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:603: warning: implicit declaration of function 'SSL_w=
ant_write'
	| ../midori/socket.c:603: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:608: warning: implicit declaration of function 'SSL_w=
ant_read'
	| ../midori/socket.c:608: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: In function 'sock_dispatch':
	| ../midori/socket.c:630: error: 'SockInfo' has no member named 'callback'
	| ../midori/socket.c:630: error: 'SockInfo' has no member named 'condition=
'
	| ../midori/socket.c:630: error: 'SockInfo' has no member named 'data'
	| ../midori/socket.c:631: warning: control reaches end of non-void functio=
n
	| ../midori/socket.c: In function 'sock_watch_cb':
	| ../midori/socket.c:638: error: 'SockInfo' has no member named 'condition=
'
	| ../midori/socket.c:641: error: 'SockInfo' has no member named 'callback'
	| ../midori/socket.c:641: error: 'SockInfo' has no member named 'condition=
'
	| ../midori/socket.c:641: error: 'SockInfo' has no member named 'data'
	| ../midori/socket.c:642: warning: control reaches end of non-void functio=
n
	| ../midori/socket.c: In function 'sock_add_watch':
	| ../midori/socket.c:647: error: 'SockInfo' has no member named 'callback'
	| ../midori/socket.c:648: error: 'SockInfo' has no member named 'condition=
'
	| ../midori/socket.c:649: error: 'SockInfo' has no member named 'data'
	| ../midori/socket.c:652: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:663: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c: In function 'sock_connect':
	| ../midori/socket.c:909: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c:910: error: 'SockInfo' has no member named 'hostname'
	| ../midori/socket.c:911: error: 'SockInfo' has no member named 'port'
	| ../midori/socket.c:912: error: 'SockInfo' has no member named 'state'
	| ../midori/socket.c:913: error: 'SockInfo' has no member named 'nonblock'
	| ../midori/socket.c: In function 'sock_connect_async_cb':
	| ../midori/socket.c:977: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c:978: error: 'SockInfo' has no member named 'hostname'
	| ../midori/socket.c:979: error: 'SockInfo' has no member named 'port'
	| ../midori/socket.c:980: error: 'SockInfo' has no member named 'state'
	| ../midori/socket.c:981: error: 'SockInfo' has no member named 'nonblock'
	| ../midori/socket.c: In function 'sock_read':
	| ../midori/socket.c:1379: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1380: warning: implicit declaration of function 'ssl_=
read'
	| ../midori/socket.c:1380: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: At top level:
	| ../midori/socket.c:1398: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_write':
	| ../midori/socket.c:1432: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1433: warning: implicit declaration of function 'ssl_=
write'
	| ../midori/socket.c:1433: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: At top level:
	| ../midori/socket.c:1463: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_write_all':
	| ../midori/socket.c:1487: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1488: warning: implicit declaration of function 'ssl_=
write_all'
	| ../midori/socket.c:1488: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: At top level:
	| ../midori/socket.c:1510: error: expected ')' before '*' token
	| ../midori/socket.c:1574: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_gets':
	| ../midori/socket.c:1602: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1603: warning: implicit declaration of function 'ssl_=
gets'
	| ../midori/socket.c:1603: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: At top level:
	| ../midori/socket.c:1634: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_getline':
	| ../midori/socket.c:1666: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1667: warning: implicit declaration of function 'ssl_=
getline'
	| ../midori/socket.c:1667: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: At top level:
	| ../midori/socket.c:1683: error: expected ')' before '*' token
	| ../midori/socket.c: In function 'sock_peek':
	| ../midori/socket.c:1717: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1718: warning: implicit declaration of function 'ssl_=
peek'
	| ../midori/socket.c:1718: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c: In function 'sock_close':
	| ../midori/socket.c:1731: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1735: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c:1736: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c:1737: error: 'SockInfo' has no member named 'sock_ch'
	| ../midori/socket.c:1747: error: 'SockInfo' has no member named 'hostname=
'
	| ../midori/socket.c: In function 'ssl_done_socket':
	| ../midori/socket.c:1765: error: 'SockInfo' has no member named 'ssl'
	| ../midori/socket.c:1766: warning: implicit declaration of function 'SSL_=
free'
	| ../midori/socket.c:1766: error: 'SockInfo' has no member named 'ssl'
	| In file included from ../midori/midori-app.c:40:
	| ../midori/socket.h:27:27: error: openssl/ssl.h: No such file or director=
y
	| In file included from ../midori/midori-app.c:40:
	| ../midori/socket.h:49: error: expected specifier-qualifier-list before '=
SSL'
	| ../midori/socket.h:119: error: expected ')' before '*' token
	| ../midori/socket.h:120: error: expected ')' before '*' token
	| ../midori/socket.h:121: error: expected ')' before '*' token
	| ../midori/socket.h:122: error: expected ')' before '*' token
	| ../midori/socket.h:123: error: expected ')' before '*' token
	| ../midori/socket.h:124: error: expected ')' before '*' token
	| Waf: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-linu=
x-gnueabi/midori-1_0.2.8-r0/midori-0.2.8/_build_'
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
	ERROR: Build of /oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb do_co=
mpile failed
	ERROR: Task 13 (/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb, do_c=
ompile) failed with 256
	ERROR: '/oe/openembedded/recipes/gtk-webcore/midori_0.2.8.bb' failed

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

--=-Hvg8+oks6trSKGF5sMun
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkz4q1QACgkQPX1aK2wOHVjpaACfWqP956PRIelBz93fdHQa0WBt
o9MAn3bH+WO/ld0S0hxOWARxCvfavmQH
=OTRR
-----END PGP SIGNATURE-----

--=-Hvg8+oks6trSKGF5sMun--
