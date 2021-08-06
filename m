Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.2531.1628240479375083032
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17691HjK003765
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 02:01:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17691H9V023845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 02:01:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 6 Aug 2021 02:01:16 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 6 Aug 2021 02:01:16 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-openembedded][PATCH] Convert to new override syntax using latest convert-overrides.py script
Date: Fri, 6 Aug 2021 02:01:16 -0700
Message-ID: <20210806090116.122021-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch is the result of running the latest convert-ovrrides.py
script.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-initramfs/classes/klibc.bbclass           |  2 +-
 .../recipes-daemons/lldpd/lldpd_1.0.8.bb       |  2 +-
 .../corosync/corosync_3.0.3.bb                 |  2 +-
 meta-oe/classes/image_types_sparse.bbclass     |  2 +-
 .../recipes-core/meta/distro-feed-configs.bb   |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb      | 14 +++++++-------
 .../geany/geany-plugins_1.37.bb                | 18 +++++++++---------
 .../recipes-devtools/lapack/lapack_3.9.0.bb    |  4 ++--
 meta-oe/recipes-devtools/luajit/luajit_git.bb  |  2 +-
 .../dnfdragora/dnfdragora_git.bb               |  2 +-
 .../fontforge/fontforge_20190801.bb            |  2 +-
 .../libmime/libmime-types-perl_2.17.bb         |  2 +-
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 83112c06f..202d132d9 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -4,7 +4,7 @@ DEPENDS =+ "klcc-cross"
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 CC:forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
-CC:forcevariable:armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
+CC:forcevariable:armv4:linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index d5e9e2c30..cf2b156fe 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -61,4 +61,4 @@ RDEPENDS:${PN} += "os-release"
 
 FILES:${PN}-zsh-completion += "${datadir}/zsh/"
 # FIXME: zsh is broken in meta-oe so this cannot be enabled for now
-#RDEPENDS_${PN}-zsh-completion += "zsh"
+#RDEPENDS:${PN}-zsh-completion += "zsh"
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index 0af954c31..909296197 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_un
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash ap_cv_cc_pie=no"
 EXTRA_OEMAKE = "tmpfilesdir_DATA="
 
-#do_configure_prepend() {
+#do_configure:prepend() {
 #    ( cd ${S}
 #    ${S}/autogen.sh )
 #}
diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 1459f800a..af3879372 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -1,7 +1,7 @@
 inherit image_types
 
 CONVERSIONTYPES += "sparse"
-CONVERSION_CMD_sparse() {
+CONVERSION_CMD:sparse() {
     in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
     out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
     case "${type}" in
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index cffeeb6a0..a87de4583 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -28,6 +28,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 #    confs = [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in archs ]
 #    return " ".join( confs )
 #
-#CONFFILES_${PN} += '${@distro_feed_configs(d)}'
+#CONFFILES:${PN} += '${@distro_feed_configs(d)}'
 
 CONFFILES:${PN} += '${@ " ".join( [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in "all ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}".split() ] ) }'
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ad95b9c45..cdc43bf04 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
     libsodium \
     pkcs11-helper \
 "
-RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
+RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
 
 RDEPENDS:packagegroup-meta-oe-dbs ="\
     influxdb \
@@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
     pm-qa \
     testfloat \
 "
-RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
-RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
+RDEPENDS:packagegroup-meta-oe-test:remove:arm = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:powerpc = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 = "fwts"
 
 RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
index 10e51fa81..9a7053792 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
@@ -66,7 +66,7 @@ FILES:${PN}-commander = "${libdir}/geany/commander.so"
 EXTRA_OECONF += "--disable-debugger"
 #PLUGINS += "${PN}-debugger"
 #LIC_FILES_CHKSUM += "file://debugger/COPYING;md5=4325afd396febcb659c36b49533135d4"
-#FILES_${PN}-debugger = "${libdir}/geany/debugger.so ${datadir}/${PN}/debugger"
+#FILES:${PN}-debugger = "${libdir}/geany/debugger.so ${datadir}/${PN}/debugger"
 
 PLUGINS += "${PN}-defineformat"
 LIC_FILES_CHKSUM += "file://defineformat/COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -76,8 +76,8 @@ FILES:${PN}-defineformat = "${libdir}/geany/defineformat.so"
 EXTRA_OECONF += "--disable-devhelp"
 #PLUGINS += "${PN}-devhelp"
 #LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
-#LICENSE_${PN}-devhelp = "GPLv3"
-#FILES_${PN}-devhelp = "${libdir}/geany/devhelp.so"
+#LICENSE:${PN}-devhelp = "GPLv3"
+#FILES:${PN}-devhelp = "${libdir}/geany/devhelp.so"
 
 PLUGINS += "${PN}-geanyctags"
 LIC_FILES_CHKSUM += "file://geanyctags/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -100,7 +100,7 @@ FILES:${PN}-geanyinsertnum = "${libdir}/geany/geanyinsertnum.so"
 EXTRA_OECONF += "--disable-geanylua"
 #PLUGINS += "${PN}-geanylua"
 #LIC_FILES_CHKSUM += "file://geanylua/COPYING;md5=4325afd396febcb659c36b49533135d4"
-#FILES_${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
+#FILES:${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
 
 PLUGINS += "${PN}-geanymacro"
 LIC_FILES_CHKSUM += "file://geanymacro/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -125,7 +125,7 @@ FILES:${PN}-geanyprj = "${libdir}/geany/geanyprj.so"
 
 #PLUGINS += "${PN}-geanypy"
 #LIC_FILES_CHKSUM += "file://geanypy/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-#FILES_${PN}-geanypy = "${libdir}/geany/geanypy.so"
+#FILES:${PN}-geanypy = "${libdir}/geany/geanypy.so"
 
 PLUGINS += "${PN}-geanyvc"
 LIC_FILES_CHKSUM += "file://geanyvc/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -160,13 +160,13 @@ FILES:${PN}-lipsum = "${libdir}/geany/lipsum.so"
 EXTRA_OECONF += "--disable-peg-markdown"
 #PLUGINS += "${PN}-markdown"
 #LIC_FILES_CHKSUM += "file://markdown/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-#FILES_${PN}-markdown = "${libdir}/geany/markdown.so"
+#FILES:${PN}-markdown = "${libdir}/geany/markdown.so"
 
 # | checking whether the GTK version in use is compatible with plugin multiterm... no
 EXTRA_OECONF += "--disable-multiterm"
 #PLUGINS += "${PN}-multiterm"
 #LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-#FILES_${PN}-multiterm = "${libdir}/geany/multiterm.so"
+#FILES:${PN}-multiterm = "${libdir}/geany/multiterm.so"
 
 PLUGINS += "${PN}-overview"
 LIC_FILES_CHKSUM += "file://overview/overview/overviewplugin.c;beginline=4;endline=20;md5=1aa33522916cdeb46cccac0c629da0d0"
@@ -226,8 +226,8 @@ FILES:${PN}-vimode = "${libdir}/geany/vimode.so"
 EXTRA_OECONF += " --disable-webhelper"
 #PLUGINS += "${PN}-webhelper"
 #LIC_FILES_CHKSUM += "file://webhelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
-#LICENSE_${PN}-webhelper = "GPLv3"
-#FILES_${PN}-webhelper = "${libdir}/geany/webhelper.so"
+#LICENSE:${PN}-webhelper = "GPLv3"
+#FILES:${PN}-webhelper = "${libdir}/geany/webhelper.so"
 
 PLUGINS += "${PN}-workbench"
 LIC_FILES_CHKSUM += "file://workbench/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
index 62d4df5e0..1664d637b 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
 # Note this is not officially supported and is just illustrated here to
 # show an example of how it can be done
 # You'll also need your fortran recipe to depend on libgfortran
-#FORTRAN_forcevariable = ",fortran"
-#RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"
+#FORTRAN:forcevariable = ",fortran"
+#RUNTIMETARGET:append:pn-gcc-runtime = " libquadmath"
 
 DEPENDS = "libgfortran"
 
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 645680cd9..87da485cc 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -31,7 +31,7 @@ BUILD_CC_ARCH:append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
 LUA_TARGET_OS = "Unknown"
 LUA_TARGET_OS:darwin = "Darwin"
 LUA_TARGET_OS_linux = "Linux"
-LUA_TARGET_OS_linux-gnueabi = "Linux"
+LUA_TARGET_OS:linux-gnueabi = "Linux"
 LUA_TARGET_OS:mingw32 = "Windows"
 
 # We don't want the lua buildsystem's compiler optimizations, or its
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
index f1e994863..70e1a47f0 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 inherit cmake gettext pkgconfig python3-dir python3native distutils3-base mime-xdg
 
 DEPENDS += "dnf python3 "
-#DEPENDS_class-nativesdk += "nativesdk-python3"
+#DEPENDS:class-nativesdk += "nativesdk-python3"
 
 RDEPENDS:${PN}:class-target = " python3-core libyui libyui-ncurses "
 
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 26d51bdaf..bcc85157c 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF:append:class-native = " with_x=no"
 LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 
-#do_configure_prepend() {
+#do_configure:prepend() {
 # uthash sources are expected in uthash/src
 #    mkdir -p ${S}/uthash/src
 #    cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index fd398a0fe..18fa46f01 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} = "\
 "
 
 RDEPENDS:${PN}-ptest = "perl-module-lib perl-module-test-more"
-#RSUGGESTS_${PN}-ptest = "libmojo-base-perl"
+#RSUGGESTS:${PN}-ptest = "libmojo-base-perl"
 
 do_install () {
     cpan_do_install
-- 
2.30.2

