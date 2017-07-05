Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D27A771985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JKDF029860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:24 +0800
Message-ID: <20170705081133.6496-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] Set packages conflict with distro feature openssl-no-weak-ciphers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jul 2017 08:19:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Distro feautre openssl-no-weak-ciphers is introduced to disable
openssl weak ciphers such as des, md2 etc. So set packages which could
not work if openssl disable weak ciphers conflict with distro feature
openssl-no-weak-ciphers.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb | 5 ++++-
 meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb             | 5 ++++-
 meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb            | 4 +++-
 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb     | 4 +++-
 meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb             | 4 +++-
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb               | 5 ++++-
 meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb                      | 5 +++++
 meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb                  | 4 +++-
 meta-oe/recipes-extended/mailx/mailx_12.5-5.bb                       | 5 ++++-
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb                          | 4 +++-
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                     | 2 ++
 meta-oe/recipes-support/freerdp/freerdp_git.bb                       | 4 +++-
 meta-python/recipes-devtools/python/python-cryptography.inc          | 4 +++-
 13 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
index 6971b03..18b12d9 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
@@ -84,7 +84,10 @@ PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDI
 PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
 PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
 
-inherit useradd autotools-brokensep update-rc.d systemd
+inherit useradd autotools-brokensep update-rc.d systemd distro_features_check
+
+# requires openssl ec support
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 # This is not a cpan or python based package, but it needs some definitions
 # from cpan-base and python-dir bbclasses for building rlm_perl and rlm_python
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index db2a24a..4d6c3fb 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -45,7 +45,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "4718b16e0f749b5ad214a9b04f45dd23"
 SRC_URI[sha256sum] = "e0a810cb401c4bdcfc9551f2e6afd5a8ca4b411f5ee3bc60c19f82fd6e84a3dc"
 
-inherit autotools pkgconfig ptest update-rc.d systemd
+inherit autotools pkgconfig ptest update-rc.d systemd distro_features_check
+
+# requires net-snmp enable des and openssl md2 support
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PACKAGES =+ "${PN}-libs"
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
index b2a3de3..ff2598e 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
@@ -18,7 +18,9 @@ DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
 
-inherit autotools pkgconfig systemd useradd
+inherit autotools pkgconfig systemd useradd distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)}"
 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index d7e8b25..7f4bc4c 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -28,7 +28,9 @@ SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${P
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
 
-inherit autotools systemd
+inherit autotools systemd distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 # Options:
 #  --enable-adminport      enable admin port
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
index ae72671..9f5b9f5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9b64491ec98eb6c6493ac5e4118f107"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-inherit autotools systemd
+inherit autotools systemd distro_features_check
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn \
@@ -15,6 +15,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
 SRC_URI[md5sum] = "0714019e109a043e858278c9e2ca18e0"
 SRC_URI[sha256sum] = "b24740c9d44a81eaf2befc4846d51445a520104321e32aaf0c135ed2e098a624"
 
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
+
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 607a617..dcd86a2 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -17,7 +17,10 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig distro_features_check
+
+# requires openssl des support
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
index 7fde778..83c917a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
@@ -17,6 +17,11 @@ SRC_URI[sha256sum] = "d84e7544c2e31a2d0825b4f8b093d169bf8bdb1881ee8cf75ff937918e
 
 S = "${WORKDIR}/node-v${PV}"
 
+inherit distro_features_check
+
+# requires openssl des support
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
index 4aa8ded..9d0c553 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz
 SRC_URI[md5sum] = "63da39655cfca30ca885fcc4a1bf8aa4"
 SRC_URI[sha256sum] = "32a38aedf1199c2361e1335e0d4a1d98f9efa7cd591bcb647f35c7395bb66f2d"
 
-inherit autotools systemd
+inherit autotools systemd distro_features_check
 
 export EXPLICIT_VERSION="${PV}"
 
@@ -68,3 +68,5 @@ EOF
 }
 
 RDEPENDS_${PN} += "${BPN}-masterfiles"
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
diff --git a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
index 9dd710a..b9eb607 100644
--- a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
@@ -33,7 +33,10 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(
 
 S = "${WORKDIR}/heirloom-mailx-12.5"
 
-inherit autotools-brokensep
+inherit autotools-brokensep distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
+
 
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
 
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
index 90f0216..b4d7d1e 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
@@ -5,7 +5,9 @@ DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual
 
 EXTRA_OECONF = "--disable-docs"
 
-inherit gnomebase vala gobject-introspection
+inherit gnomebase vala gobject-introspection distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index b047bc4..f46855a 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -21,6 +21,8 @@ DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdama
 inherit autotools-brokensep distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
+# requires opens des support
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} libvncserver"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index f2d0a4d..8825790 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -8,7 +8,9 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pkgconfig cmake gitpkgv
+inherit pkgconfig cmake gitpkgv distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 PV = "1.2.5+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 9a74e8e..6f0c9ef 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -41,7 +41,9 @@ RDEPENDS_${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
 "
 
-inherit ptest
+inherit ptest  distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.10.1


