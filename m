Received: from banjo.bearstech.com ([78.40.125.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bpratz@bearstech.com>) id 1T79R8-0006Wq-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 20:25:50 +0200
Received: from barney.bearstech.com (barney.bearstech.lan [10.20.125.20])
	by banjo.bearstech.com (Postfix) with ESMTP id 23B00E012B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 20:13:37 +0200 (CEST)
Received: by barney.bearstech.com (Postfix, from userid 1001)
	id E875790271; Thu, 30 Aug 2012 20:13:36 +0200 (CEST)
From: Guyzmo <guyzmo+openembedded@hackable-devices.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Aug 2012 20:13:36 +0200
Message-Id: <1346348639-sup-4216@barney.bearstech.com>
User-Agent: Sup/git
Subject: [PATCH] zsh: updated recipe's version to v5.0.0
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
X-List-Received-Date: Thu, 30 Aug 2012 18:25:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* 4.3.17 has moved to old/ in zsh ftp and 5.0.0 is stable
* changed name of the recipe
* changed the hashes in the recipe

Signed-off-by: Guyzmo <guyzmo+openembedded@hackable-devices.org>
---
 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 ----------------------=
------
 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb  |   51 ++++++++++++++++++++++=
++++++
 2 files changed, 51 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
 create mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb

diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes=
-extended/zsh/zsh_4.3.17.bb
deleted file mode 100644
index 9192f20..0000000
--- a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION =3D "UNIX Shell similar to the Korn shell"
-HOMEPAGE=3D"http://www.zsh.org"
-SECTION =3D "base/shell"
-
-LICENSE =3D "ZSH"
-LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dad234d4b46db63491c4a9789da4fb=
341"
-
-DEPENDS =3D "ncurses libcap libpcre gdbm groff-native"
-
-SRC_URI =3D "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
-SRC_URI[md5sum] =3D "8258967060b2654f30001a011946ac6a"
-SRC_URI[sha256sum] =3D "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d1=
32551d850cf7a704"
-
-FILES_${PN}-dbg +=3D "\
-    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
-    "
-
-inherit autotools
-
-EXTRA_OECONF =3D " \
-    --bindir=3D${base_bindir} \
-    --enable-etcdir=3D${sysconfdir} \
-    --enable-fndir=3D${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=3D${datadir}/${PN}/site-functions \
-    --enable-function-subdirs \
-    --with-term-lib=3D'ncursesw ncurses' \
-    --with-tcsetpgrp \
-    --enable-pcre \
-    --enable-cap \
-    --enable-multibyte \
-    --enable-gdbm \
-    --enable-dynamic \
-    zsh_cv_shared_environ=3Dyes \
-    "
-
-do_configure () {
-    oe_runconf
-}
-
-pkg_postinst_${PN} () {
-    touch $D${sysconfdir}/shells
-    grep -q "bin/zsh" $D${sysconfdir}/shells || echo "/bin/zsh" >> $D${s=
ysconfdir}/shells
-}
-
-pkg_postrm_${PN} () {
-    if [ -e $D${sysconfdir}/shells ]; then
-        sed -i -e '/\/bin\/zsh/d' $D${sysconfdir}/shells
-    fi
-}
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb b/meta-oe/recipes-=
extended/zsh/zsh_5.0.0.bb
new file mode 100644
index 0000000..f499be7
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
@@ -0,0 +1,51 @@
+DESCRIPTION =3D "UNIX Shell similar to the Korn shell"
+HOMEPAGE=3D"http://www.zsh.org"
+SECTION =3D "base/shell"
+
+LICENSE =3D "ZSH"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dad234d4b46db63491c4a9789da4fb=
341"
+
+DEPENDS =3D "ncurses libcap libpcre gdbm groff-native"
+
+SRC_URI =3D "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
+SRC_URI[md5sum] =3D "e8484468925cec8d9a84b8b04797e764"
+SRC_URI[sha256sum] =3D "cd014a8e09a3607c68369d1615db96d0fbb7279a125950b3=
2032fd448c44a888"
+
+FILES_${PN}-dbg +=3D "\
+    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
+    "
+
+inherit autotools
+
+EXTRA_OECONF =3D " \
+    --bindir=3D${base_bindir} \
+    --enable-etcdir=3D${sysconfdir} \
+    --enable-fndir=3D${datadir}/${PN}/${PV}/functions \
+    --enable-site-fndir=3D${datadir}/${PN}/site-functions \
+    --enable-function-subdirs \
+    --with-term-lib=3D'ncursesw ncurses' \
+    --with-tcsetpgrp \
+    --enable-pcre \
+    --enable-cap \
+    --enable-multibyte \
+    --enable-gdbm \
+    --enable-dynamic \
+    zsh_cv_shared_environ=3Dyes \
+    "
+
+do_configure () {
+    oe_runconf
+}
+
+pkg_postinst_${PN} () {
+    touch $D${sysconfdir}/shells
+    grep -q "bin/zsh" $D${sysconfdir}/shells || echo "/bin/zsh" >> $D${s=
ysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+    if [ -e $D${sysconfdir}/shells ]; then
+        sed -i -e '/\/bin\/zsh/d' $D${sysconfdir}/shells
+    fi
+}
--=20
1.7.2.5


