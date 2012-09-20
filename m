Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TEayr-00039v-O3
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 09:15:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4590; q=dns/txt; s=iport;
	t=1348124565; x=1349334165;
	h=from:to:cc:subject:date:message-id;
	bh=dGkGvW7+98HFDzQuwvRTaAZk5fdcik7iZPiPvUy2qGA=;
	b=SD5g2BVI5+CkOQDGyzCkvCTzkJ6s1laLi3oKpbUfI5kKv5MQ7ZY80/EW
	gQmIF40GYOg6gR5/Nsc4Y6Tdd35wyuEnNC97s7vWQuEGJw2U19vn9HyF9
	lIG/CrtLzMEEO93AbLKBfSOL+edxnZO222Ng7hrBucScYwMIdJ6WXxBJ6 o=;
X-IronPort-AV: E=Sophos;i="4.80,453,1344211200"; d="scan'208";a="144081568"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-1.cisco.com with ESMTP; 20 Sep 2012 07:02:43 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q8K72gsU015004;
	Thu, 20 Sep 2012 07:02:43 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2012 09:01:44 +0200
Message-Id: <1348124504-4764-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] zsh: Change from 4.3.17 to 5.0.0, which is the latest stable release. Also change the mirror from the zsh ftp server, which is really slow and unstable, to a sourceforce mirror.
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
X-List-Received-Date: Thu, 20 Sep 2012 07:15:26 -0000

The reason for removing the 4.3.17 recipe is that it used the ftp mirror, which
has removed the 4.3.17 tarbal used.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta-oe/recipes-extended/zsh/zsh.inc       |   55 ++++++++++++++++++++++++++++
 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 --------------------------
 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb  |    5 +++
 3 files changed, 60 insertions(+), 51 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zsh/zsh.inc
 delete mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
 create mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb

diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
new file mode 100644
index 0000000..cacce91
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -0,0 +1,55 @@
+DESCRIPTION = "UNIX Shell similar to the Korn shell"
+HOMEPAGE="http://www.zsh.org"
+SECTION = "base/shell"
+
+PR = "r0"
+
+LICENSE = "ZSH"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
+
+DEPENDS = "ncurses bison-native"
+
+SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+
+inherit autotools gettext update-alternatives
+
+EXTRA_OECONF = " \
+    --bindir=${base_bindir} \
+    --enable-etcdir=${sysconfdir} \
+    --enable-fndir=${datadir}/${PN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --with-term-lib='ncursesw ncurses' \
+    --with-tcsetpgrp \
+    --enable-cap \
+    --enable-multibyte \
+    --disable-gdbm \
+    --disable-dynamic \
+    zsh_cv_shared_environ=yes \
+    "
+
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
+ALTERNATIVE_PRIORITY = "100"
+
+export AUTOHEADER = "true"
+
+do_configure () {
+    oe_runconf
+}
+
+do_install_append () {
+    rm -fr ${D}/usr/share
+}
+
+pkg_postinst_${PN} () {
+    touch $D${sysconfdir}/shells
+    grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
+    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
+}
+
+FILES_${PN}-dbg += "\
+    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
+    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
+    "
diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
deleted file mode 100644
index 9192f20..0000000
--- a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "UNIX Shell similar to the Korn shell"
-HOMEPAGE="http://www.zsh.org"
-SECTION = "base/shell"
-
-LICENSE = "ZSH"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
-
-DEPENDS = "ncurses libcap libpcre gdbm groff-native"
-
-SRC_URI = "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
-SRC_URI[md5sum] = "8258967060b2654f30001a011946ac6a"
-SRC_URI[sha256sum] = "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d132551d850cf7a704"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
-    "
-
-inherit autotools
-
-EXTRA_OECONF = " \
-    --bindir=${base_bindir} \
-    --enable-etcdir=${sysconfdir} \
-    --enable-fndir=${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=${datadir}/${PN}/site-functions \
-    --enable-function-subdirs \
-    --with-term-lib='ncursesw ncurses' \
-    --with-tcsetpgrp \
-    --enable-pcre \
-    --enable-cap \
-    --enable-multibyte \
-    --enable-gdbm \
-    --enable-dynamic \
-    zsh_cv_shared_environ=yes \
-    "
-
-do_configure () {
-    oe_runconf
-}
-
-pkg_postinst_${PN} () {
-    touch $D${sysconfdir}/shells
-    grep -q "bin/zsh" $D${sysconfdir}/shells || echo "/bin/zsh" >> $D${sysconfdir}/shells
-}
-
-pkg_postrm_${PN} () {
-    if [ -e $D${sysconfdir}/shells ]; then
-        sed -i -e '/\/bin\/zsh/d' $D${sysconfdir}/shells
-    fi
-}
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
new file mode 100644
index 0000000..3421d95
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
@@ -0,0 +1,5 @@
+require zsh.inc
+DEPENDS = "ncurses libcap libpcre gdbm groff-native"
+
+SRC_URI[md5sum] = "01df38e4aa34aa227462fdf2f6d4c5cd"
+SRC_URI[sha256sum] = "835194ea83abd812b5fdb1d2bfa6427c4c4e95e771c4a75e9006037af8efd264"
-- 
1.7.8.6



