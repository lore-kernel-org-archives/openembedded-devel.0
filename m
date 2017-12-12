Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 55ED178869
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:37:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31247088"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2017 13:37:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 55709486A78E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2017 13:37:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 12 Dec 2017 13:37:07 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Dec 2017 22:36:50 +0800
Message-ID: <1513089410-7758-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 55709486A78E.A7594
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xrdp: Add some scripts and patches
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
X-List-Received-Date: Tue, 12 Dec 2017 05:37:12 -0000
Content-Type: text/plain

Add some scripts and patches for xrdp to make it work properly.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...istinguished_name-in-etc-xrdp-openssl.con.patch | 33 +++++++++
 .../xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch    | 75 +++++++++++++++++++
 .../xrdp/xrdp/0001-Fix-the-compile-error.patch     | 35 +++++++++
 meta-oe/recipes-support/xrdp/xrdp/xrdp.sysconfig   |  4 ++
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb         | 83 +++++++++++++++++++++-
 5 files changed, 227 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/xrdp.sysconfig

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
new file mode 100644
index 0000000..5e7fca0
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
@@ -0,0 +1,33 @@
+From d705b1d666cb8713d86ea6fb2fc45c424128285a Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 1 Dec 2017 10:24:50 +0900
+Subject: [PATCH] Added  req_distinguished_name in /etc/xrdp/openssl.conf,
+ otherwise, cert.pem can't be created.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ keygen/openssl.conf | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/keygen/openssl.conf b/keygen/openssl.conf
+index 09db6c2..f077d72 100644
+--- a/keygen/openssl.conf
++++ b/keygen/openssl.conf
+@@ -4,6 +4,14 @@ distinguished_name = req_distinguished_name
+ x509_extensions = v3_ca
+ 
+ [req_distinguished_name]
++# Certificate subject
++#countryName = US
++#stateOrProvinceName = CA
++#localityName = Sunnyvale
++#organizationName = xrdp
++#organizationalUnitName =
++commonName = XRDP
++#emailAddress =
+ 
+ [v3_ca]
+ # Extensions for a typical CA - PKIX recommendation.
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
new file mode 100644
index 0000000..deaadde
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
@@ -0,0 +1,75 @@
+From a9c460f158d68c1b3de6a31ce853de5379977695 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 30 Nov 2017 11:10:04 +0900
+Subject: [PATCH] Fix sesman.ini and xrdp.ini
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ sesman/sesman.ini | 20 ++++++--------------
+ xrdp/xrdp.ini     | 10 ----------
+ 2 files changed, 6 insertions(+), 24 deletions(-)
+
+diff --git a/sesman/sesman.ini b/sesman/sesman.ini
+index 8225ee4..c09189e 100644
+--- a/sesman/sesman.ini
++++ b/sesman/sesman.ini
+@@ -54,12 +54,14 @@ LogLevel=DEBUG
+ EnableSyslog=1
+ SyslogLevel=DEBUG
+ 
+-[X11rdp]
+-param=X11rdp
+-param=-bs
++[Xorg]
++param=Xorg
++param=-config
++param=xrdp/xorg.conf
++param=-noreset
+ param=-nolisten
+ param=tcp
+-param=-uds
++
+ 
+ [Xvnc]
+ param=Xvnc
+@@ -70,16 +72,6 @@ param=-localhost
+ param=-dpi
+ param=96
+ 
+-[Xorg]
+-param=Xorg
+-param=-config
+-param=xrdp/xorg.conf
+-param=-noreset
+-param=-nolisten
+-param=tcp
+-param=-logfile
+-param=.xorgxrdp.%s.log
+-
+ [Chansrv]
+ ; drive redirection, defaults to xrdp_client if not set
+ FuseMountName=thinclient_drives
+diff --git a/xrdp/xrdp.ini b/xrdp/xrdp.ini
+index cb6d7c3..9f63a69 100644
+--- a/xrdp/xrdp.ini
++++ b/xrdp/xrdp.ini
+@@ -157,16 +157,6 @@ ip=127.0.0.1
+ port=-1
+ code=20
+ 
+-[X11rdp]
+-name=X11rdp
+-lib=libxup.so
+-username=ask
+-password=ask
+-ip=127.0.0.1
+-port=-1
+-xserverbpp=24
+-code=10
+-
+ [Xvnc]
+ name=Xvnc
+ lib=libvnc.so
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
new file mode 100644
index 0000000..82b2790
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
@@ -0,0 +1,35 @@
+Subject: [PATCH] Fix the make error
+
+Fix the compile error:
+ *** No rule to make target '../librfxcodec/src/.libs/librfxencode.a', needed by 'xrdp'.  Stop..
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ xrdp/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xrdp/Makefile.am b/xrdp/Makefile.am
+index a259ef3..d5505b2 100644
+--- a/xrdp/Makefile.am
++++ b/xrdp/Makefile.am
+@@ -23,7 +23,7 @@ endif
+ if XRDP_RFXCODEC
+ AM_CPPFLAGS += -DXRDP_RFXCODEC
+ AM_CPPFLAGS += -I$(top_srcdir)/librfxcodec/include
+-XRDP_EXTRA_LIBS += $(top_builddir)/librfxcodec/src/.libs/librfxencode.a
++XRDP_EXTRA_LIBS += $(top_builddir)/librfxcodec/src/.libs/librfxencode.la
+ endif
+ 
+ if XRDP_PIXMAN
+@@ -35,7 +35,7 @@ endif
+ if XRDP_PAINTER
+ AM_CPPFLAGS += -DXRDP_PAINTER
+ AM_CPPFLAGS += -I$(top_srcdir)/libpainter/include
+-XRDP_EXTRA_LIBS += $(top_builddir)/libpainter/src/.libs/libpainter.a
++XRDP_EXTRA_LIBS += $(top_builddir)/libpainter/src/.libs/libpainter.la
+ endif
+ 
+ sbin_PROGRAMS = \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp/xrdp.sysconfig b/meta-oe/recipes-support/xrdp/xrdp/xrdp.sysconfig
new file mode 100644
index 0000000..39f500a
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/xrdp.sysconfig
@@ -0,0 +1,4 @@
+# put some options here
+
+XRDP_OPTIONS=""
+SESMAN_OPTIONS=""
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index f6fe42a..e7a77e4 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -4,16 +4,93 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
 "
 
-inherit distro_features_check
+inherit distro_features_check autotools pkgconfig useradd systemd
 
-DEPENDS = "openssl virtual/libx11 libxfixes libxrandr"
+DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/neutrinolabs/xrdp.git"
+SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
+           file://xrdp.sysconfig \
+           file://0001-Fix-sesman.ini-and-xrdp.ini.patch \
+           file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
+           file://0001-Fix-the-compile-error.patch \
+           "
 
 SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
 
 PV = "0.9.4+git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system xrdp"
+USERADD_PARAM_${PN}  = "--system --home /var/run/xrdp -g xrdp \
+                        --no-create-home --shell /bin/false xrdp"
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service \
+                ${datadir}/dbus-1/accessibility-services/*.service "
+
+FILES_${PN}-dev += "${libdir}/xrdp/libcommon.so \
+                    ${libdir}/xrdp/libxrdp.so \
+                    ${libdir}/xrdp/libscp.so \
+                    ${libdir}/xrdp/libxrdpapi.so "
+
+#EXTRA_OECONF = "--disable-rfxcodec --disable-painter"
+
+do_configure_prepend() {
+    cd ${S}
+    ./bootstrap
+    cd -
+}
+
+do_compile_prepend() {
+    sed -i 's/(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am/(MAKE) $(AM_MAKEFLAGS) install-exec-am/g' ${S}/keygen/Makefile.in
+}
+
+
+do_install_append() {
+	install -d ${D}${sysconfdir} 
+	install -d ${D}${sysconfdir}/xrdp
+	install -d ${D}${sysconfdir}/xrdp/pam.d
+	install -d ${D}${sysconfdir}/sysconfig/xrdp
+   
+	# deal with systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/instfiles/xrdp.service.in ${D}${systemd_unitdir}/system/xrdp.service
+	install -m 0644 ${S}/instfiles/xrdp-sesman.service.in ${D}${systemd_unitdir}/system/xrdp-sesman.service 
+	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
+	sed -i -e 's,@sysconfdir@,${sysconfdir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
+	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
+
+	install -m 0644 ${S}/instfiles/*.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/instfiles/pam.d/xrdp-sesman.debian ${D}${sysconfdir}/xrdp/pam.d/xrdp-sesman
+	install -m 0644 ${S}/sesman/sesman.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/xrdp/xrdp.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/xrdp/xrdp_keyboard.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/instfiles/xrdp.sh ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${WORKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
+	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
+}
+
+SYSTEMD_SERVICE_${PN} = "xrdp.service xrdp-sesman.service"
+
+pkg_postinst_${PN}() {
+	if test -z "$D"
+	then
+		if test -x ${bindir}/xrdp-keygen
+		then
+			${bindir}/xrdp-keygen xrdp ${sysconfdir}/xrdp/rsakeys.ini >/dev/null
+                fi
+		if test ! -s ${sysconfdir}/xrdp/cert.pem
+		then
+			openssl req -x509 -newkey rsa:2048 -sha256 -nodes -days 3652 \
+			-keyout ${sysconfdir}/xrdp/key.pem \
+			-out ${sysconfdir}/xrdp/cert.pem \
+			-config ${sysconfdir}/xrdp/openssl.conf >/dev/null 2>&1
+			chmod 400 ${sysconfdir}/xrdp/key.pem
+		fi			
+        fi
+}
-- 
2.7.4




