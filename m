Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Oeoil-0000P4-8f
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 14:30:01 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o6UCTPJB027346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 30 Jul 2010 14:29:26 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OeoiK-00087e-Js; Fri, 30 Jul 2010 14:29:24 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 14:29:23 +0200
Message-Id: <1280492963-30578-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.2
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] ncurses: added 5.7 recipe
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
X-List-Received-Date: Fri, 30 Jul 2010 12:30:01 -0000

It uses ideas from the old 5.4 recipe but brings a lot of new features
like widec libs, pkgconfig files or splitted library packages.

As lot of packages depend on ncurses, whole distribution must be
probably rebuild when updating to this new version.

Due to this and the complex recipe, it has a negative DEFAULT_PREFERENCE
for now.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/ncurses/ncurses-5.7/tic-hang.patch |   25 ++++
 recipes/ncurses/ncurses_5.7.bb             |  187 ++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ncurses/ncurses-5.7/tic-hang.patch
 create mode 100644 recipes/ncurses/ncurses_5.7.bb

diff --git a/recipes/ncurses/ncurses-5.7/tic-hang.patch b/recipes/ncurses/ncurses-5.7/tic-hang.patch
new file mode 100644
index 0000000..1678b88
--- /dev/null
+++ b/recipes/ncurses/ncurses-5.7/tic-hang.patch
@@ -0,0 +1,25 @@
+'tic' of some linux distributions (e.g. fedora 11) hang in an infinite
+loop when processing the original file.
+
+Index: ncurses-5.7/misc/terminfo.src
+===================================================================
+--- ncurses-5.7.orig/misc/terminfo.src
++++ ncurses-5.7/misc/terminfo.src
+@@ -3706,12 +3706,11 @@ konsole-xf3x|KDE console window with key
+ # The value for kbs reflects local customization rather than the settings used
+ # for XFree86 xterm.
+ konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
+-	kend=\EOF, khome=\EOH, use=konsole+pcfkeys,
+-	use=konsole-vt100,
+-# Konsole does not implement shifted cursor-keys.
+-konsole+pcfkeys|konsole subset of xterm+pcfkeys,
+-	kLFT@, kRIT@, kcbt=\E[Z, kind@, kri@, kDN@, kUP@, use=xterm+pcc2,
+-	use=xterm+pcf0,
++	kend=\EOF, kf1=\EOP, kf13=\EO2P, kf14=\EO2Q, kf15=\EO2R,
++	kf16=\EO2S, kf17=\E[15;2~, kf18=\E[17;2~, kf19=\E[18;2~,
++	kf2=\EOQ, kf20=\E[19;2~, kf21=\E[20;2~, kf22=\E[21;2~,
++	kf23=\E[23;2~, kf24=\E[24;2~, kf3=\EOR, kf4=\EOS,
++	khome=\EOH, use=konsole-vt100,
+ # KDE's "vt100" keyboard has no relationship to any terminal that DEC made, but
+ # it is still useful for deriving the other entries.
+ konsole-vt100|KDE console window with vt100 (sic) keyboard,
diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.bb
new file mode 100644
index 0000000..8afb1d6
--- /dev/null
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -0,0 +1,187 @@
+DESCRIPTION = "Ncurses library"
+HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
+LICENSE = "MIT"
+SECTION = "libs"
+PATCHDATE = "20100501"
+PKGV = "${PV}.${PATCHDATE}"
+PR = "r8"
+
+# recipe is experimental for now...
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "ncurses-native"
+DEPENDS_virtclass-native = ""
+
+inherit autotools_stage binconfig
+
+SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz;name=tarball \
+        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-20100424-patch.sh.bz2;apply=yes;name=p20100424sh \
+\
+        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-${PATCHDATE}.patch.gz;name=p20100501 \
+        file://tic-hang.patch \
+"
+
+SRC_URI[tarball.md5sum] = "cce05daf61a64501ef6cd8da1f727ec6"
+SRC_URI[tarball.sha256sum] = "0a9bdea5c7de8ded5c9327ed642915f2cc380753f12d4ad120ef7da3ea3498f4"
+SRC_URI[p20100424sh.md5sum] = "3a5f76613f0f7ec3e0e73b835bc24864"
+SRC_URI[p20100424sh.sha256sum] = "1e9d70d2d1fe1fea471868832c52f1b9cc6065132102e49e2a3755f2f4f5be53"
+SRC_URI[p20100501.md5sum] = "6518cfa5d45e9069a1e042468161448b"
+SRC_URI[p20100501.sha256sum] = "a97ccc30e4bd6fbb89564f3058db0fe84bd35cfefee831556c500793b477abde"
+
+PARALLEL_MAKE = ""
+EXTRA_AUTORECONF = "-I m4"
+
+# Whether to enable separate widec libraries; must be 'true' or 'false'
+ENABLE_WIDEC = "true"
+# Build breaks on Ubuntu else :(
+ENABLE_WIDEC_virtclass-native = "false"
+
+
+# Override the function from the autotools class; ncurses requires a
+# patched autoconf213 to generate the configure script. This autoconf
+# is not available so that the shipped script will be used.
+do_configure() {
+        for i in \
+        'narrowc --with-ticlib' \
+        'widec   --enable-widec --without-progs'; do
+                set -- $i
+                mkdir -p $1
+                cd $1
+                shift
+
+                oe_runconf \
+                        --disable-static \
+                        --without-debug \
+                        --without-ada \
+                        --enable-hard-tabs \
+                        --enable-xmc-glitch \
+                        --enable-colorfgbg \
+                        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
+                        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
+                        --with-shared \
+                        --disable-big-core \
+                        --program-prefix= \
+                        --with-termlib=tinfo \
+                        --enable-sigwinch \
+                        --enable-pc-files \
+                        --with-build-cc="${BUILD_CC}" \
+                        --with-build-cpp="${BUILD_CPP}" \
+                        --with-build-ld="${BUILD_LD}" \
+                        --with-build-cflags="${BUILD_CFLAGS}" \
+                        --with-build-cppflags='${BUILD_CPPFLAGS} -D_GNU_SOURCE' \
+                        --with-build-ldflags='${BUILD_LDFLAGS}' \
+                        "$@"
+                cd ..
+        done
+}
+
+do_compile() {
+        oe_runmake -C narrowc libs
+        oe_runmake -C narrowc/progs
+
+        ! ${ENABLE_WIDEC} || \
+            oe_runmake -C widec libs
+}
+
+do_install() {
+        ## This variable is used as the installation direction of .pc
+        ## files and the cross variant is wrong here. pkgconfig itself
+        ## is not used so that this variable does not interfere with
+        ## the rest of the build process
+        sed -i \
+            -e 's!^\(PKG_CONFIG_LIBDIR.*=\).*!\1 /usr/lib/pkgconfig!g' \
+            misc/Makefile.in
+
+        ! ${ENABLE_WIDEC} || \
+               oe_runmake -C widec 'DESTDIR=${D}' \
+               install.libs install.includes install.man
+
+        oe_runmake -C narrowc 'DESTDIR=${D}' install.libs install.progs install.data
+
+
+        cd narrowc
+
+        # include some basic terminfo files
+        # stolen ;) from gentoo and modified a bit
+        for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86
+        do
+                local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
+                local basedir="$(basename $(dirname "${termfile}"))"
+
+                if [ -n "${termfile}" ]
+                then
+                        install -d ${D}${sysconfdir}/terminfo/${basedir}
+                        mv ${termfile} ${D}${sysconfdir}/terminfo/${basedir}/
+                        ln -s /etc/terminfo/${basedir}/${x} \
+                                ${D}${datadir}/terminfo/${basedir}/${x}
+                fi
+        done
+        # i think we can use xterm-color as default xterm
+        if [ -e ${D}${sysconfdir}/terminfo/x/xterm-color ]
+        then
+                ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
+        fi
+
+        if [ "${PN}" = "ncurses" ]; then
+                mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
+                mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
+        fi
+}
+
+python populate_packages_prepend () {
+        libdir = bb.data.expand("${libdir}", d)
+        do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'ncurses-lib%s', 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+}
+
+pkg_postinst_ncurses-tools () {
+        if [ "${PN}" = "ncurses" ]; then
+                update-alternatives --install ${bindir}/clear clear clear.${PN} 100
+                update-alternatives --install ${bindir}/reset reset reset.${PN} 100
+        fi
+}
+
+
+pkg_prerm_ncurses-tools () {
+        if [ "${PN}" = "ncurses" ]; then
+                update-alternatives --remove clear clear.${PN}
+                update-alternatives --remove reset reset.${PN}
+        fi
+}
+
+BBCLASSEXTEND = "native sdk"
+
+PACKAGES = " \
+  ncurses-dbg \
+  ncurses-dev \
+  ncurses-doc \
+  ncurses-tools \
+  ncurses \
+  ncurses-static \
+  ncurses-terminfo \
+"
+RSUGGESTS_${PN} = "ncurses-terminfo"
+
+FILES_${PN} = "\
+  ${bindir}/tput \
+  ${bindir}/tset \
+  ${datadir}/tabset \
+  ${sysconfdir}/terminfo \
+"
+
+# This keeps only tput/tset in ncurses
+# clear/reset are in already busybox
+FILES_ncurses-tools = "\
+  ${bindir}/tic \
+  ${bindir}/toe \
+  ${bindir}/infotocap \
+  ${bindir}/captoinfo \
+  ${bindir}/infocmp \
+  ${bindir}/clear.${PN} \
+  ${bindir}/reset.${PN} \
+  ${bindir}/tack \
+  ${bindir}/tabs \
+"
+
+FILES_ncurses-terminfo = "\
+  ${datadir}/terminfo \
+"
-- 
1.7.2



