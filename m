Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4653776858
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2015 08:54:15 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so103002908wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2015 01:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ndiELrwPBhw6DMH5QxINQrSLpwBCtXE/zSOPGAh0J1Q=;
	b=ZzW1B09Pyc7V0y0wvp88XTzlFqI2j1N6VMrQBUGX/K1RdFz26jbUZbm7jAro/zaHbo
	cvBm9twYSnX8LPWrgIqo94gOix/fS/jd9sZlqxqSyoLVhuRSYhCssuskozi6Rh5C4UqF
	R21l1CF9WfIUWJ8+LNcN/FMYLUXDbsjFUfPwBiGssdj1tBrZzzkrnAV7V5r+WbfT4LS3
	azssHOT6kVApLxB/1bfqZCTPRwWDjkwMsgCxLcAsKdSJYXxgg6nEyVdV5FPe8cOrR0nG
	PjQ1AhKKEVRGSt/CT4On7AJhwBUSvGj95ABiXQTLRKfqNAbURYxGj7vkieAWR+yPUT4u
	bDog==
X-Gm-Message-State: ALoCoQm2tBHzf5xxeJ+oaMZ2A7xWtuz42fPs1cCQW9UJenvvU9hnqJmEv1YgDm9tTGcAr4exTZOm
X-Received: by 10.194.201.71 with SMTP id jy7mr34188904wjc.93.1439110455662;
	Sun, 09 Aug 2015 01:54:15 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	hd6sm7669352wib.19.2015.08.09.01.54.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 09 Aug 2015 01:54:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Aug 2015 10:54:05 +0200
Message-Id: <1439110446-22189-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
References: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][RFC][PATCH 2/3] samba: add 4.2.3
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
X-List-Received-Date: Sun, 09 Aug 2015 08:54:18 -0000

Samba is now waf based so this recipe has been written from scratch and
will need more review than the usual version bump.

Waf allows two methods for site files:

1) Run qemu against sysroot
2) cross-answers.txt

I've opted for 2) and split the answers in a generic and arch section.
I'm not sure of the arch stuff is really arch specific, but that's what
review is for :)

Another change is that when using systemd the daemons will run in the
foreground instead of forking.

Build tested on x86_64 and armv7a with the Angstrom Distribution.
Runtime tested on x86_64 and armv7a with the Angstrom Distribution.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../samba/samba/cross-answers-arm.txt              |   6 +
 .../samba/samba/cross-answers-x86_64.txt           |   4 +
 .../samba/samba/cross-answers.txt                  |  35 ++++
 .../recipes-connectivity/samba/samba/nmb.service   |   3 +-
 .../recipes-connectivity/samba/samba/smb.service   |   3 +-
 .../samba/samba/winbind.service                    |   5 +-
 meta-oe/recipes-connectivity/samba/samba_git.bb    | 187 +++++++++++++++++++++
 7 files changed, 236 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/cross-answers-arm.txt
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/cross-answers-x86_64.txt
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
 create mode 100644 meta-oe/recipes-connectivity/samba/samba_git.bb

diff --git a/meta-oe/recipes-connectivity/samba/samba/cross-answers-arm.txt b/meta-oe/recipes-connectivity/samba/samba/cross-answers-arm.txt
new file mode 100644
index 0000000..3652966
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/cross-answers-arm.txt
@@ -0,0 +1,6 @@
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+
diff --git a/meta-oe/recipes-connectivity/samba/samba/cross-answers-x86_64.txt b/meta-oe/recipes-connectivity/samba/samba/cross-answers-x86_64.txt
new file mode 100644
index 0000000..7dff9ef
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/cross-answers-x86_64.txt
@@ -0,0 +1,4 @@
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
diff --git a/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt b/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
new file mode 100644
index 0000000..d185fa0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/cross-answers.txt
@@ -0,0 +1,35 @@
+Checking uname sysname type: "Linux"
+Checking uname release type: "3.0.0"
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: OK
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from IBM850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking if can we convert from UTF8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
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
index 0000000..ca737fd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba_git.bb
@@ -0,0 +1,187 @@
+SUMMARY = "Samba is the standard Windows interoperability suite of programs for Linux and Unix."
+SECTION = "console/network"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "heimdal-native bash readline virtual/libiconv zlib popt gnutls python"
+
+PV = "4.2+4.3.0rc2"
+SRCREV = "19e089b798bf47381dbb0d0fb61cd6f0d2e6dba9"
+
+# Only allow builds for archs that provide cross-answers-${ARCH}.txt
+COMPATIBLE_HOST = "(x86_64|arm)"
+
+SRC_URI = "git://git.samba.org/samba.git;branch=v4-3-stable \
+           file://cross-answers.txt \
+           file://cross-answers-${TARGET_ARCH}.txt \
+           file://volatiles.03_samba \
+           file://smb.conf \
+           file://init.samba \
+           file://init.winbind \
+           file://nmb.service \
+           file://smb.service \
+           file://winbind.service \
+          "
+
+S = "${WORKDIR}/git"
+
+# Waf is not in ${S}, so we can't use waf.bbclass
+#inherit waf
+
+inherit perlnative pythonnative update-rc.d systemd
+
+EXTRA_OECONF = " \
+                --cross-compile \
+                --cross-answers=${B}/cross-answers.txt \
+                --enable-fhs \
+                --prefix=${prefix} \
+                --sysconfdir=${sysconfdir} \
+                --localstatedir=${localstatedir} \
+                --with-syslog \
+                --without-ldap \
+                --without-ads \
+                --disable-rpath-install \
+                --with-cluster-support \
+                --bundled-libraries='!asn1_compile,!compile_et' \
+               "
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                 avahi \
+                "
+
+PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
+PACKAGECONFIG[systemd] = " --with-systemd, --without-systemd,systemd"
+
+# The python stuff needs this in $ENV
+export HOST_SYS
+export BUILD_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+do_configure() {
+    mkdir -p ${B}
+
+    # Merge waf site cache entries into one file
+    sed -i '/uname machine type/d'  ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt
+    echo 'Checking uname machine type: "${TARGET_ARCH}"' >> ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt
+    cat ${WORKDIR}/cross-answers.txt ${WORKDIR}/cross-answers-${TARGET_ARCH}.txt > ${B}/cross-answers.txt
+
+    ${S}/buildtools/bin/waf configure --prefix=${prefix} ${EXTRA_OECONF}
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
+    install -d ${D}/var/log/samba
+    install -d ${D}/var/spool/samba
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


