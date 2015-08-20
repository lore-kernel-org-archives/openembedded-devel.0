Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1028776A4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:59:41 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so149391616wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8MVZE2nHnn+2E5IWUjtQ1mcbMXFjpDLYTDUKv8MUtPE=;
	b=Qmkh3BanH/qcDCSRAXWrmdwx32A8p0UugypAaeiNwMiBK4vBbQpd2r4sd5PiC8kdST
	LJprxDq/ws66VPxV01pt0lTolNRX0v4UR/UZiA2KCEiGe8cX5AietQM4iBb3WkNM1fm3
	UqLm7hlArgNXWHru3tfctfBR2gD7B7143mHtp7kMde/uvyz5H8JUB1XOdJeW44gjPx2c
	4FLJTww1VYMP2IdpIdgmk2qnp+ZgCw0/Oz/+6lmgZo53ukQ7WlD94h7hhkOAVQNnt5md
	5JrEUbJ3A7FEakQG+NMHC+Zy0Ww0y+VsjT21oOG7fGVC8F97YX+cSR7fXrRa1NNZSwxb
	JWlw==
X-Gm-Message-State: ALoCoQlrPzBtESfYOJuDlNqBkvJ8XImdIylePUziP0ZxpekkciHkd1L7MQpgy0KYukMmbzDu1VYe
X-Received: by 10.180.84.230 with SMTP id c6mr14733320wiz.32.1440086381787;
	Thu, 20 Aug 2015 08:59:41 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id i6sm6129170wje.33.2015.08.20.08.59.40
	(version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:59:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:59:28 +0200
Message-Id: <1440086369-3321-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 4/5] samba: add 4.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2015 15:59:42 -0000

Samba is now waf based so this recipe has been written from scratch and
will need more review than the usual version bump.

Waf allows two methods for site files:

1) Run qemu against sysroot
2) cross-answers.txt
3) all of the above

We're going to use 3). This allows overrides as well as building for
architectures where qemu doesn't work.

Another change is that when using systemd the daemons will run in the
foreground instead of forking.

Build tested on x86_64 and armv7a with the Angstrom Distribution.
Runtime tested on x86_64 and armv7a with the Angstrom Distribution.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../samba/samba/cross-answers.txt                  |   1 +
 .../recipes-connectivity/samba/samba/nmb.service   |   3 +-
 .../recipes-connectivity/samba/samba/smb.service   |   3 +-
 .../samba/samba/winbind.service                    |   5 +-
 meta-oe/recipes-connectivity/samba/samba_git.bb    | 181 +++++++++++++++++++++
 5 files changed, 186 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
 create mode 100644 meta-oe/recipes-connectivity/samba/samba_git.bb

diff --git a/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt b/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
new file mode 100644
index 0000000..10a2bcb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
@@ -0,0 +1 @@
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
diff --git a/meta-oe/recipes-connectivity/samba/samba/nmb.service b/meta-oe/recipes-connectivity/samba/samba/nmb.service
index 91b9975..64cefb6 100644
--- a/meta-oe/recipes-connectivity/samba/samba/nmb.service
+++ b/meta-oe/recipes-connectivity/samba/samba/nmb.service
@@ -3,9 +3,8 @@ Description=Samba NMB Daemon
 After=syslog.target network.target
 
 [Service]
-Type=forking
 PIDFile=/var/run/nmbd.pid
-ExecStart=@SBINDIR@/nmbd
+ExecStart=@SBINDIR@/nmbd -F
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba/smb.service b/meta-oe/recipes-connectivity/samba/samba/smb.service
index bc0707a..685480e 100644
--- a/meta-oe/recipes-connectivity/samba/samba/smb.service
+++ b/meta-oe/recipes-connectivity/samba/samba/smb.service
@@ -3,10 +3,9 @@ Description=Samba SMB Daemon
 After=syslog.target network.target nmb.service winbind.service
 
 [Service]
-Type=forking
 PIDFile=/var/run/smbd.pid
 LimitNOFILE=16384
-ExecStart=@SBINDIR@/smbd
+ExecStart=@SBINDIR@/smbd -F
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba/winbind.service b/meta-oe/recipes-connectivity/samba/samba/winbind.service
index bff6fb8..ebcb230 100644
--- a/meta-oe/recipes-connectivity/samba/samba/winbind.service
+++ b/meta-oe/recipes-connectivity/samba/samba/winbind.service
@@ -1,11 +1,10 @@
-i[Unit]
+[Unit]
 Description=Samba Winbind Daemon
 After=syslog.target network.target nmb.service
 
 [Service]
-Type=forking
 PIDFile=/var/run/winbindd.pid
-ExecStart=@SBINDIR@/winbindd
+ExecStart=@SBINDIR@/winbindd -F
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 
 [Install]
diff --git a/meta-oe/recipes-connectivity/samba/samba_git.bb b/meta-oe/recipes-connectivity/samba/samba_git.bb
new file mode 100644
index 0000000..9ed3bfa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba_git.bb
@@ -0,0 +1,181 @@
+SUMMARY = "Samba is the standard Windows interoperability suite of programs for Linux and Unix."
+SECTION = "console/network"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "heimdal-native bash readline virtual/libiconv zlib popt gnutls python talloc"
+
+PV = "4.2+4.3.0rc3"
+SRCREV = "5d9f4f950e5c63d30611e77eb7bc7fcfcf985b82"
+
+SRC_URI = "git://git.samba.org/samba.git;branch=v4-3-stable \
+           file://volatiles.03_samba \
+           file://smb.conf \
+           file://init.samba \
+           file://init.winbind \
+           file://nmb.service \
+           file://smb.service \
+           file://winbind.service \
+           file://cross-answers.txt \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit waf-samba
+
+inherit perlnative pythonnative update-rc.d systemd
+
+SAMBA4_IDMAP_MODULES = "idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
+SAMBA4_PDB_MODULES = "pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
+SAMBA4_AUTH_MODULES = "auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
+SAMBA4_MODULES = "${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
+
+EXTRA_OECONF = " \
+                --disable-rpath \
+                --disable-rpath-install \
+                --enable-fhs \
+                --with-syslog \
+                --without-ldap \
+                --without-ads \
+                --with-cluster-support \
+                --with-shared-modules=${SAMBA4_MODULES} \
+                --bundled-libraries='heimdal,!asn1_compile,!compile_et,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util' \
+               "
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                 avahi \
+                "
+
+PACKAGECONFIG[avahi]    = "--enable-avahi  ,--disable-avahi    ,avahi"
+PACKAGECONFIG[pam]      = "--with-pam      ,--without-pam      ,libpam"
+PACKAGECONFIG[fam]      = "--with-fam      ,--without-fam      ,gamin"
+PACKAGECONFIG[systemd]  = "--with-systemd  ,--without-systemd  ,systemd"
+
+PERL_VERNDORLIB = "${datadir}/perl5/vendor_perl/"
+
+do_configure_prepend() {
+     # Merge waf site cache entries into one file
+     mkdir -p ${B}
+     if [ -e  ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt ] ; then
+        sed -i '/uname machine type/d'  ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt
+     fi
+     echo 'Checking uname machine type: "${TARGET_ARCH}"' >> ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt
+     cat ${WORKDIR}/cross-answers.txt ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt > ${B}/cross-answers.txt
+}
+
+do_compile()  {
+    ${S}/buildtools/bin/waf build ${PARALLEL_MAKE}
+}
+
+do_install() {
+    ${S}/buildtools/bin/waf install --destdir=${D}
+
+    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
+        
+    install -D -m 755 ${WORKDIR}/init.samba ${D}${sysconfdir}/init.d/samba
+    install -D -m 755 ${WORKDIR}/init.winbind ${D}${sysconfdir}/init.d/winbind
+    install -D -m 644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/volatiles.03_samba
+
+    install -d ${D}/var/log/samba
+    install -d ${D}/var/spool/samba
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    install -d ${D}${systemd_unitdir}/system
+    for i in nmb smb winbind; do
+        install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/system
+    done
+    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/log/samba 0755 root root -" \
+            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+    fi
+}
+
+SYSTEMD_PACKAGES = "${PN} winbind"
+SYSTEMD_SERVICE_${PN} = "nmb.service smb.service"
+SYSTEMD_SERVICE_winbind = "winbind.service"
+
+INITSCRIPT_PACKAGES = "samba winbind"
+INITSCRIPT_NAME_samba = "samba"
+INITSCRIPT_NAME_winbind = "winbind"
+
+# No dependencies, goes in at level 20 (NOTE: take care with the
+# level, later levels put the shutdown later too - see the links
+# in rc6.d, the shutdown must precede network shutdown).
+INITSCRIPT_PARAMS = "defaults"
+
+CONFFILES_${PN} = "${sysconfdir}/samba/smb.conf"
+
+PACKAGES =+ "ctdb-tests-dbg ctdb-tests samba-python-dbg samba-python samba-perl libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+
+RDEPENDS_ctdb-tests += "bash"
+FILES_ctdb-tests = "${libdir}/ctdb-tests \
+                    ${datadir}/ctdb-tests"
+FILES_ctdb-tests-dbg = "${libdir}/ctdb-tests/.debug"
+
+FILES_samba-python = "${libdir}/python*"
+FILES_samba-python-dbg = "${libdir}/python*/site-packages/samba/*/.debug \
+                          ${libdir}/python*/site-packages/samba/.debug \
+                          ${libdir}/python*/site-packages/.debug \
+                         "
+
+FILES_samba-perl = "${datadir}/perl*"
+
+FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
+                     ${libdir}/security/.debug/pam_winbind.so \
+"
+
+# For some reason the shlib code doesn't pick this up leading to: /usr/sbin/smbd: error while loading shared libraries: libnetapi.so.0: cannot open shared object file: No such file or directory
+RDEPENDS_${PN} += "libnetapi"
+
+FILES_${PN} += "${libdir}/vfs/*.so \
+                ${libdir}/charset/*.so \
+                ${libdir}/*.dat \
+                ${libdir}/auth/*.so \
+                ${libdir}/security/pam_smbpass.so \
+                ${libdir}/winbind_krb5*.so \
+                ${libdir}/mit_samba*.so \
+"
+
+FILES_${PN}-dbg += "${libdir}/vfs/.debug \
+                    ${libdir}/charset/.debug \
+                    ${libdir}/auth/.debug \
+                    ${libdir}/security/.debug \
+                    ${libdir}/samba/*/.debug \
+"
+
+FILES_libwbclient = "${libdir}/libwbclient.so.*"
+FILES_libnetapi = "${libdir}/libnetapi.so.*"
+FILES_libsmbsharemodes = "${libdir}/libsmbsharemodes.so.*"
+FILES_libtdb = "${libdir}/libtdb.so.*"
+FILES_cifs = "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
+FILES_cifs-doc = "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.cifs.8"
+FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
+FILES_libsmbclient-dev = "${libdir}/libsmbclient.so ${includedir}"
+FILES_winbind = "${sbindir}/winbindd \
+                 ${bindir}/wbinfo \
+                 ${bindir}/ntlm_auth \
+                 ${sysconfdir}/init.d/winbind \
+                 ${systemd_unitdir}/system/winbind.service \
+"
+FILES_libwinbind = "${libdir}/idmap/*.so \
+                    ${libdir}/pdb \
+                    ${libdir}/gpext \
+                    ${libdir}/perfcount \
+                    ${libdir}/security/pam_winbind.so \
+"
+
+FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info"
+
+FILES_swat       = "${sbindir}/swat ${datadir}/swat ${libdir}/*.msg"
-- 
2.0.1


