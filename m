Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8B69D731CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:05 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n3so41997964wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C+wEIIhq5+db9vZQv9SuCQPSw0T+AUFG+ena1f0oRa0=;
	b=ylqxA/V+So8YSzy+4DVhk2oa6hzjzag6khenAG8ZvDaSmq5+f9OdXH1j36XRzh8WE1
	s8M6F+YTSv1q8UPu7GAHE1qrqomnlCcEp54iC6B5YzZvuPMIdX77nGKuJH+Zr1YpqmES
	BorEBeniZkYhyDuRmdtUAv6Vrys3l888EURj1jKuVFs+ewI1RBIiiLM0+yK5hCCGWm3y
	YJ02Gx6sOkRG/VzZQ50ElAKdCCAClarN1s/bTGJTUC/ZBWszUuzahG0/guCtGI3njPHN
	8ZYSmy2nOeV/3GjvuyscK5AcsfT4vZ7GyC3a0dTTxn1n/8kGbTQvokHBWhZ+LjkeZgB/
	5SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C+wEIIhq5+db9vZQv9SuCQPSw0T+AUFG+ena1f0oRa0=;
	b=HKf/5Uf/Sn4t0PVLDuOv+A7wtEf/iJh804/5zNIZjcTIeChaCh1mxJS7qN/gmFsHN0
	gLiN4ZEQMGxGFZVVNg9TRPpWWvEahLxhkKGgTHeIxkceoVvcuhpaUWGOqEBuG4Fye6pr
	1gYIJfYO35nYchSQWkl9aSrAgHgVOQSuahGjJ424dthcftcbr9smR+or1kXf7Ih3fi0J
	0zi6J0+M5ozytWj0bR8vWheZ94ZXyNbukZbcEbBLmzx8ago/Rxl1d2ikoiVTPUF5Xcqj
	NH9JIbT9LdIqg+lO7INMBQqPok4XYe45uiFmK4dCD9E1QYoaEGjNc0qrTjThOqVg1PBL
	hvjQ==
X-Gm-Message-State: AOPr4FVc3jCIlEmYZpKW6sRHv66A48tq5Tv0EQC+WEkFsCclDVgKXRdAG7kl5dRlq34fNyF+
X-Received: by 10.194.118.5 with SMTP id ki5mr21525323wjb.138.1461354545523;
	Fri, 22 Apr 2016 12:49:05 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:50 +0100
Message-Id: <1461354536-23240-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/8] meta-networking: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:06 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb      |  4 ++--
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb  |  6 +++---
 meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb     |  2 +-
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb        |  6 +++---
 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb        |  4 ++--
 meta-networking/recipes-daemons/postfix/postfix.inc        | 12 ++++++------
 meta-networking/recipes-daemons/squid/squid_3.5.7.bb       |  8 ++++----
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb     | 14 +++++++-------
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb           |  6 +++---
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb           |  2 +-
 meta-networking/recipes-protocols/openflow/openflow.inc    |  2 +-
 meta-networking/recipes-protocols/quagga/quagga.inc        | 12 ++++++------
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc        | 14 +++++++-------
 meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb  |  4 ++--
 meta-networking/recipes-support/fping/fping_3.5.bb         |  2 +-
 .../recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb       |  2 +-
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb    |  2 +-
 meta-networking/recipes-support/netcf/netcf_git.bb         |  2 +-
 meta-networking/recipes-support/netperf/netperf_2.6.0.bb   |  4 ++--
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb      |  2 +-
 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb       |  2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb   |  6 +++---
 .../recipes-support/strongswan/strongswan_5.3.2.bb         |  4 ++--
 meta-networking/recipes-support/stunnel/stunnel_5.28.bb    |  2 +-
 24 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 68487ea..58e760b 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -28,8 +28,8 @@ SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec9
 
 inherit autotools gettext update-alternatives texinfo
 
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
-noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
+noipv6="${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
 
 PACKAGECONFIG ??= "ftp uucpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 9358ca5..188dcf3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -32,10 +32,10 @@ DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libld
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
                    acl cups ldap \
 "
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
index 0f4c247..3b52ed4 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
@@ -36,7 +36,7 @@ CFLAGS += "${LDFLAGS}"
 
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 5da3d96..5046818 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -24,8 +24,8 @@ EXTRA_OECONF += "--with-dblib=berkeley \
                  andrew_cv_runpath_switch=none"
 
 PACKAGECONFIG ??= "ntlm \
-        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
-        ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
         "
 PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
@@ -54,7 +54,7 @@ do_compile_prepend () {
 }
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/saslauthd.service ${D}${systemd_unitdir}/system
 
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
index 8769e52..b5851a9 100644
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -22,7 +22,7 @@ SYSTEMD_SERVICE_${PN} = "dnrd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 inherit autotools
-inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
 
 do_install() {
     oe_runmake install DESTDIR=${D} INSTALL="install -p"
@@ -34,7 +34,7 @@ do_install() {
     install -p -m 0644 ${WORKDIR}/dnrd.conf.sample ${D}${sysconfdir}/dnrd/dnrd.conf
     install -p -m 0755 ${WORKDIR}/dnrd.init ${D}${sysconfdir}/init.d/dnrd
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d -m 0755 ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/dnrd.service ${D}${systemd_unitdir}/system
     fi
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 17dbf76..228a815 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -7,8 +7,8 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
 DEPENDS = "virtual/db libpcre openssl postfix-native \
-    ${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
 DEPENDS_class-native = "virtual/db-native openssl-native libpcre-native"
 
@@ -52,9 +52,9 @@ export SYSLIBS = "${LDFLAGS}"
 
 # ldap support
 export CCARGS-ldap  = "\
-    ${@base_contains('DISTRO_FEATURES', 'ldap', '-DHAS_LDAP', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', '-DHAS_LDAP', '', d)}"
 export AUXLIBS-ldap = "\
-    ${@base_contains('DISTRO_FEATURES', 'ldap', '-lldap -llber', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', '-lldap -llber', '', d)}"
 
 # no native openldap
 export CCARGS-ldap_class-native = ""
@@ -63,9 +63,9 @@ export AUXLIBS-ldap_class-native = ""
 # SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH
 # current openldap didn't enable SASL
 export CCARGS-sasl  = "\
-    ${@base_contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I=/usr/include/sasl', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I=/usr/include/sasl', '', d)}"
 export AUXLIBS-sasl = "\
-    ${@base_contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
 export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index a94fed7..c3eabcd 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -34,15 +34,15 @@ inherit autotools useradd ptest
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
 
-PACKAGECONFIG ??= "${@base_contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
-                   ${@base_contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
+                   ${@bb.utils.contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
                   "
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
 
 BASIC_AUTH = "DB SASL LDAP NIS"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-BASIC_AUTH += "${@base_contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 
 EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}'"
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 4ee881d..6c8ba91 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -29,13 +29,13 @@ SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-SRC_URI +="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)}"
+SRC_URI +="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)}"
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
-PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
-NOPAM_SRC ="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
+PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
+NOPAM_SRC ="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
 
 inherit update-rc.d useradd systemd
 
@@ -75,7 +75,7 @@ do_install() {
         sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
     fi
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /var/run/vsftpd/empty 0755 root root -" \
         > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index e29369c..66bb4cc 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -26,7 +26,7 @@ SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d98
 PAM_SRC_URI = "file://rexec.pam \
 	file://rlogin.pam \
 	file://rsh.pam"
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 inherit pkgconfig
 
@@ -41,7 +41,7 @@ do_configure () {
     ./configure --prefix=${prefix} --exec-prefix=${exec_prefix}
     echo "INSTALLROOT=${D}" > MCONFIG
 
-    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
         echo "USE_PAM=1" >> MCONFIG
     fi
 
@@ -63,7 +63,7 @@ do_install () {
     'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' install
 
-    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/pam.d
         install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
         install -m 0644 ${WORKDIR}/rexec.pam ${D}/${sysconfdir}/pam.d/rexec
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 1a50932..ca8a6ba 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -143,7 +143,7 @@ INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME_${PN}-server = "snmpd"
 INITSCRIPT_PARAMS_${PN}-server = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
 
 SYSTEMD_PACKAGES = "${PN}-server-snmpd \
                     ${PN}-server-snmptrapd"
diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 5f465ce..d309ae1 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -20,7 +20,7 @@ PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
 
 EXTRA_OECONF += " \
                  KARCH=${TARGET_ARCH} \
-                 ${@base_contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
+                 ${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
                 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index de78e26..4244fdf 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -9,8 +9,8 @@ HOMEPAGE = "http://www.nongnu.org/quagga/"
 SECTION = "net"
 LICENSE = "GPL-2.0 & LGPL-2.0"
 DEPENDS = "readline ncurses perl-native"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
-SNMP_CONF="${@base_contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
+SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
                     file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
@@ -41,7 +41,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://zebra.service \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
@@ -62,7 +62,7 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --enable-exampledir=${docdir}/quagga/examples/ \
                 --enable-vtysh \
                 --enable-isisd \
-                ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
                 --enable-ospf-te \
                 --enable-opaque-lsa \
                 --enable-ospfclient=yes \
@@ -125,7 +125,7 @@ do_install () {
         fi
     done
 
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /var/run/quagga 0755 quagga quagga -" \
         > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
@@ -162,7 +162,7 @@ pkg_postinst_${PN} () {
 # Split into a main package and separate per-protocol packages
 PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
                      ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
-                     ${PN}-ospfclient ${@base_contains('DISTRO_FEATURES', 'sysvinit', '${PN}-watchquagga', '', d)}"
+                     ${PN}-ospfclient ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${PN}-watchquagga', '', d)}"
 
 RDEPENDS_${PN} += "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index cc7f9e3..793c106 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -26,10 +26,10 @@ PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
 PACKAGECONFIG[lua] = ",,lua"
 PACKAGECONFIG[resolvconf] = ",,,resolvconf"
 EXTRA_OEMAKE = "\
-    'COPTS=${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
-           ${@base_contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
+    'COPTS=${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
     'CFLAGS=${CFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
@@ -53,7 +53,7 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
 
-    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
         install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     else
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
@@ -61,11 +61,11 @@ do_install () {
 
     install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
 
-    if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
-    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/resolvconf/update.d/
         install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
index bdfd5a2..718f0b5 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
@@ -17,8 +17,8 @@ DEPENDS = "openssl xz zlib bzip2 libcap icu"
 inherit autotools pkgconfig systemd useradd
 
 PACKAGECONFIG ??= " \
-                   ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                   "
 
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
index b6b17b7..2f5f2b6 100644
--- a/meta-networking/recipes-support/fping/fping_3.5.bb
+++ b/meta-networking/recipes-support/fping/fping_3.5.bb
@@ -21,5 +21,5 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-ipv4"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index d9f1212..4466974 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -61,7 +61,7 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --enable-dpd \
                 --enable-natt=yes \
                 --sysconfdir=${sysconfdir}/racoon \
-                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
 CFLAGS += "-fno-strict-aliasing"
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index d3e6a5d..f69e71c 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
 #| collect2: error: ld returned 1 exit status
 #| make[4]: *** [libsctp.la] Error 1
-PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
+PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
 
 S = "${WORKDIR}/${BP}"
 
diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 26c738b..1bc6bae 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd",
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        if [ -d "${D}${libdir}/systemd/system" ]; then
            mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index 760bab0..650fdae 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -24,7 +24,7 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 
 # set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files
 # larger than 2GB
-CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
+CFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
     ' -D_FILE_OFFSET_BITS=64', '', d)}"
 
 PACKAGECONFIG ??= ""
@@ -60,7 +60,7 @@ do_install() {
     install -m 0644 ${S}/doc/netperf_old.ps ${D}${docdir}/netperf
 }
 
-RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'sctp', 'kernel-module-sctp', '', d)}"
 
 INITSCRIPT_NAME="netperf"
 INITSCRIPT_PARAMS="defaults"
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index d113b82..9fc6406 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -19,7 +19,7 @@ This is the final IPv4-only version of ypbind-mt. \
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
 DEPENDS = " \
            yp-tools \
-           ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
           "
 RDEPENDS_${PN} += "yp-tools"
 
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index cee5880..82544e7 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -15,7 +15,7 @@ of known secure NIS server (/etc/yp.conf) Binds to \
 the server which answered as first. \
 "
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS = "yp-tools ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PROVIDES += "ypbind"
 
 PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
index f010906..de2348e 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
-DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd
 
@@ -22,7 +22,7 @@ CFLAGS += "-fno-inline"
 
 # I want openvpn to be able to read password from file (hrw)
 EXTRA_OECONF += "--enable-password-save --enable-iproute2"
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
 
 # Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
 EXTRA_OECONF += "IPROUTE=/sbin/ip"
@@ -38,7 +38,7 @@ do_install_append() {
     install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-keys
     install -m 644 ${S}/sample/sample-keys/* ${D}${sysconfdir}/openvpn/sample/sample-keys
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system/openvpn@loopback-server.service
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
index 7ec1a8e..9dc4878 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -20,11 +20,11 @@ EXTRA_OECONF = " \
         --without-lib-prefix \
 "
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 
 PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
-        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.28.bb b/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
index 0a8bcd8..61be932 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
@@ -16,5 +16,5 @@ inherit autotools
 
 EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
2.8.0.rc3


