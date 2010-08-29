Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OpfzB-0001as-H1
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 13:23:42 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 31AE94B0097
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 13:23:08 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Aug 2010 13:22:50 +0200
Message-Id: <1283080970-2494-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1283078750-25729-1-git-send-email-eric@eukrea.com>
References: <1283078750-25729-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] ncurses-5.7 : fix sdk build + add libtermcap link
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
X-List-Received-Date: Sun, 29 Aug 2010 11:23:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

- fix ncurses-sdk build (compile tested on ubuntu using angstrom
2010.x and 2008.1 for armv6 target on i686 host)
- fix asterisk build (by adding libtermcap's link), compile tested
on angstrom 2008.1 for armv6

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
v2 : remove wrong RPROVIDES/CONFLICTS/REPLACES

 recipes/ncurses/ncurses_5.7.bb |   32 ++++++++++++++++----------------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7=
.bb
index 57374ec..6866ffb 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 SECTION =3D "libs"
 PATCHDATE =3D "20100501"
 PKGV =3D "${PV}+${PATCHDATE}"
-PR =3D "r11"
+PR =3D "r12"
=20
 DEPENDS =3D "ncurses-native unifdef-native"
 DEPENDS_virtclass-native =3D "unifdef-native"
@@ -32,15 +32,15 @@ EXTRA_AUTORECONF =3D "-I m4"
 ENABLE_WIDEC =3D "true"
 # Build breaks on Ubuntu else :(
 ENABLE_WIDEC_virtclass-native =3D "false"
-
+ENABLE_WIDEC_virtclass-sdk =3D "false"
=20
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.
 do_configure() {
         for i in \
-        'narrowc --with-ticlib' \
-        'widec   --enable-widec --without-progs'; do
+        'narrowc  --with-ticlib' \
+        'widec    --with-ticlib --enable-widec --without-progs'; do
                 set -- $i
                 mkdir -p $1
                 cd $1
@@ -144,6 +144,11 @@ do_install() {
                 ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
         fi
=20
+	cd ${D}${libdir}
+	ln -sf libncurses.so libtermcap.so
+	ln -sf libncurses.a libtermcap.a
+	ln -sf libncurses.so.5 libtermcap.so.5
+
         if [ "${PN}" =3D "ncurses" ]; then
                 mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
                 mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
@@ -155,7 +160,6 @@ python populate_packages_prepend () {
         do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'ncurses-lib%s'=
, 'ncurses %s library', prepend=3DTrue, extra_depends =3D '', allow_links=
=3DTrue)
 }
=20
-
 pkg_postinst_ncurses-tools () {
         if [ "${PN}" =3D "ncurses" ]; then
                 update-alternatives --install ${bindir}/clear clear clea=
r.${PN} 100
@@ -172,16 +176,12 @@ pkg_prerm_ncurses-tools () {
=20
 BBCLASSEXTEND =3D "native sdk"
=20
-PACKAGES =3D " \
-  ncurses-dbg \
-  ncurses-dev \
-  ncurses-doc \
-  ncurses-tools \
-  ncurses \
-  ncurses-static \
-  ncurses-terminfo \
+PACKAGES +=3D " \
+  ${PN}-tools \
+  ${PN}-terminfo \
 "
-RSUGGESTS_${PN} =3D "ncurses-terminfo"
+
+RSUGGESTS_${PN} =3D "${PN}-terminfo"
=20
 FILES_${PN} =3D "\
   ${bindir}/tput \
@@ -192,7 +192,7 @@ FILES_${PN} =3D "\
=20
 # This keeps only tput/tset in ncurses
 # clear/reset are in already busybox
-FILES_ncurses-tools =3D "\
+FILES_${PN}-tools =3D "\
   ${bindir}/tic \
   ${bindir}/toe \
   ${bindir}/infotocap \
@@ -204,6 +204,6 @@ FILES_ncurses-tools =3D "\
   ${bindir}/tabs \
 "
=20
-FILES_ncurses-terminfo =3D "\
+FILES_${PN}-terminfo =3D "\
   ${datadir}/terminfo \
 "
--=20
1.6.3.3



