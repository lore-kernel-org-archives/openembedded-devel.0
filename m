Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrOe-0004lN-7L
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:14:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2148097eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2CPT4ME8t1Fg7Jd9J2mxOJaGMvEEta4nqOVYaOxk81g=;
	b=ytqukfvhlcgLGLuvWCWgiKJDa/1cqSpe0bFqfsrD2Gb1i52U4dLNoSsgCkUcu/9iPH
	MiNQ0pIbZMSEoV7gSMZh+wmTvLFSM0zGs8wY6LAfz8OSb6YXNum8YAJoS5q+eib9HO8X
	w/nR2xIPW0xuYvHFK2mAjaGX2k8D59kZ9hUql8u88dKFnE4vX8kBVyEF1fLhV+HG70VL
	k7EkzsvgPcoaYFgD5srqbNiSugLj7pMoF/+0D4MUoHKw/9jZkKMmX9mgIRMfzlFXm5Wp
	7lpmLVechjXw00s87Py3isITIlF0GP03DWIUzG/yDkl8ztic4zOKRVYywjBxTorzXnra
	H1Bw==
Received: by 10.14.184.131 with SMTP id s3mr47639458eem.38.1354622423901;
	Tue, 04 Dec 2012 04:00:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm2178044eem.16.2012.12.04.04.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:00:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:59:54 +0100
Message-Id: <8a6d73cf1bdcb97f82284a220840b1eb281433e9.1354622319.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 12:14:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Move common definitions to the inc file
* Drop override of do_configure which doesn't seem to be needed anymore
* Fold ntp-ssl into the ntp recipe as a PACKAGECONFIG option for those
  who want it (default to off) and fix configure-time checks to detect
  OpenSSL properly so that it gets enabled when selected
* Remove ntp-bin package and put its contents in currently empty
  ntp-utils package (with migration path)
* Fix hardcoded paths in ntpd initscript
* Specify ntpd.conf as a configuration file for packaging purposes
* Rearrange so that packaging definitions are towards the end in the
  expected order
* Delete unused "ntp" initscript file
* Add SUMMARY
* Update HOMEPAGE

This reapplies some of the changes from the original patch by
Morgan Little <morgan.little@windriver.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/files/ntp      | 31 --------
 .../recipes-support/ntp/files/openssl-check.patch  | 59 +++++++++++++++
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         | 11 ---
 meta-networking/recipes-support/ntp/ntp.inc        | 87 +++++++++++++++++-----
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 44 +----------
 5 files changed, 131 insertions(+), 101 deletions(-)
 delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
 create mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb

diff --git a/meta-networking/recipes-support/ntp/files/ntp b/meta-networking/recipes-support/ntp/files/ntp
deleted file mode 100755
index e91a528..0000000
--- a/meta-networking/recipes-support/ntp/files/ntp
+++ /dev/null
@@ -1,31 +0,0 @@
-#! /bin/sh
-
-FLAGS="defaults 23"
-
-test -f /usr/bin/ntpd || exit 0
-
-case "$1" in
-	start)
-		echo -n "Starting NTP server: ntpd"
-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
-		echo "."
-  		;;
-	stop)
-		echo -n "Stopping NTP server: ntpd"
-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
-		echo "."
-  		;;
-	restart|force-reload)
-		echo -n "Restarting NTP server: ntpd... "
-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
-  		sleep 2
-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
-		echo "done."
-  		;;
-	*)
-  		echo "Usage: /etc/init.d/ntp {start|stop|restart|force-reload}"
-  		exit 1
-		;;
-esac
-
-exit 0
diff --git a/meta-networking/recipes-support/ntp/files/openssl-check.patch b/meta-networking/recipes-support/ntp/files/openssl-check.patch
new file mode 100644
index 0000000..8b4a673
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/openssl-check.patch
@@ -0,0 +1,59 @@
+Hack OpenSSL check to work when libssl and libcrypto aren't in same dir
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ configure         |    4 ++--
+ m4/ntp_openssl.m4 |    4 ++--
+ sntp/configure    |    4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index aae2c01..6a3c15e 100755
+--- a/configure
++++ b/configure
+@@ -22868,8 +22868,8 @@ case "$ans" in
+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
+ 	    ;;
+ 	 *)
+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
++	    test -f $i/libssl.so && break
++	    test -f $i/libssl.a && break
+ 	    ;;
+ 	esac
+     done
+diff --git a/m4/ntp_openssl.m4 b/m4/ntp_openssl.m4
+index 7d9f477..67bdd55 100644
+--- a/m4/ntp_openssl.m4
++++ b/m4/ntp_openssl.m4
+@@ -41,8 +41,8 @@ case "$ans" in
+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
+ 	    ;;
+ 	 *)
+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
++	    test -f $i/libssl.so && break
++	    test -f $i/libssl.a && break
+ 	    ;;
+ 	esac
+     done
+diff --git a/sntp/configure b/sntp/configure
+index 7782c29..55e82d9 100755
+--- a/sntp/configure
++++ b/sntp/configure
+@@ -14810,8 +14810,8 @@ case "$ans" in
+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
+ 	    ;;
+ 	 *)
+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
++	    test -f $i/libssl.so && break
++	    test -f $i/libssl.a && break
+ 	    ;;
+ 	esac
+     done
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
deleted file mode 100644
index a158990..0000000
--- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ntp_${PV}.bb
-DEPENDS = "openssl"
-
-S = "${WORKDIR}/ntp-${PV}"
-
-EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
-	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
-
-
-SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
-SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 1d740f0..a614e3f 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -1,35 +1,86 @@
+SUMMARY = "Network Time Protocol daemon and utilities"
 DESCRIPTION = "The Network Time Protocol (NTP) is used to \
 synchronize the time of a computer client or server to \
 another server or reference time source, such as a radio \
 or satellite receiver or modem."
-HOMEPAGE = "http://ntp.isc.org/bin/view/Main/WebHome"
+HOMEPAGE = "http://support.ntp.org"
 SECTION = "console/network"
 LICENSE = "ntp"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
-RSUGGESTS_${PN} = "iana-etc"
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
-	file://ipv6only-workaround.patch \
-	file://ntpd \
-	file://ntp.conf \
-	file://ntpdate \
-	file://ntpd.service \
-"
+INC_PR = "r2"
 
-inherit autotools update-rc.d
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
+           file://tickadj.c.patch \
+           file://ntp-4.2.4_p6-nano.patch \
+           file://openssl-check.patch \
+           file://ntpd \
+           file://ntp.conf \
+           file://ntpdate \
+           "
 
-INITSCRIPT_NAME = "ntpd"
-# No dependencies, so just go in at the standard level (20)
-INITSCRIPT_PARAMS = "defaults"
+inherit autotools update-rc.d
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
+EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
-PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
+                          --with-openssl-incdir=${STAGING_INCDIR} \
+                          --with-crypto, \
+                          --without-openssl --without-crypto, \
+                          openssl"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
+	install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
+
+	# Fix hardcoded paths in scripts
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd
+	sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
+
+	install -d ${D}${sysconfdir}/network/if-up.d
+	install -m 755 ${WORKDIR}/ntpdate ${D}${sysconfdir}/network/if-up.d
+}
+
+PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
-# or the ntpdate systemd service
 
-# This should use rc.update
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
+# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
+# with wonky clocks (e.g. OpenSlug)
+RDEPENDS_${PN} = "${PN}-tickadj"
+# Handle move from bin to utils package
+RPROVIDES_${PN}-utils = "${PN}-bin"
+RREPLACES_${PN}-utils = "${PN}-bin"
+RCONFLICTS_${PN}-utils = "${PN}-bin"
+
+RSUGGESTS_${PN} = "iana-etc"
+
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
+FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_${PN}-utils = "${bindir}"
+FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
+
+CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
+
+INITSCRIPT_NAME = "ntpd"
+# No dependencies, so just go in at the standard level (20)
+INITSCRIPT_PARAMS = "defaults"
+
+pkg_postinst_ntpdate() {
+if test "x$D" != "x"; then
+        exit 1
+else
+        if ! grep -q -s ntpdate /var/spool/cron/root; then
+                echo "adding crontab"
+                test -d /var/spool/cron || mkdir -p /var/spool/cron
+                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
+        fi
+fi
+}
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
index f7c5b68..f1e9ecd 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -1,45 +1,7 @@
 require ntp.inc
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-        file://tickadj.c.patch \
-        file://ntp-4.2.4_p6-nano.patch \
-        file://ntpd \
-        file://ntp.conf \
-        file://ntpdate \
-"
+PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
-SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
-
-EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
-	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
-	install -d ${D}/${sysconfdir}/network/if-up.d
-	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
-}
-
-FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_ntp-utils = "${bindir}/*"
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
-
-# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
-# with wonky clocks (e.g. OpenSlug)
-RDEPENDS_${PN} = "${PN}-tickadj"
-
-pkg_postinst_ntpdate() {
-if test "x$D" != "x"; then
-        exit 1
-else
-        if ! grep -q -s ntpdate /var/spool/cron/root; then
-                echo "adding crontab"
-                test -d /var/spool/cron || mkdir -p /var/spool/cron
-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
-        fi
-fi
-}
+SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
+SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
 
-- 
1.8.0



