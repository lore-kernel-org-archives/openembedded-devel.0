Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBD4727D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 09:03:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57619296"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2015 16:59:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1F92iss010027
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 17:02:44 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 15 Feb 2015 17:03:31 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Feb 2015 16:58:23 +0800
Message-ID: <1423990703-31432-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423990703-31432-1-git-send-email-biannm@cn.fujitsu.com>
References: <1423990703-31432-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 2/2] cyrus-sasl: add systemd supported for saslauthd
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
X-List-Received-Date: Sun, 15 Feb 2015 09:03:31 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../cyrus-sasl/cyrus-sasl/saslauthd.conf           | 11 ++++++++
 .../cyrus-sasl/cyrus-sasl/saslauthd.service        | 12 +++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                | 31 ++++++++++++++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
new file mode 100644
index 0000000..a91a9d3
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
@@ -0,0 +1,11 @@
+# Directory in which to place saslauthd's listening socket, pid file, and so
+# on.  This directory must already exist.
+SOCKETDIR=@LOCALSTATEDIR@/run/saslauthd
+
+# Mechanism to use when checking passwords.  Run "saslauthd -v" to get a list
+# of which mechanism your installation was compiled with the ablity to use.
+MECH=pam
+
+# Additional flags to pass to saslauthd on the command line.  See saslauthd(8)
+# for the list of accepted flags.
+FLAGS=
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
new file mode 100644
index 0000000..f20ef6e
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=SASL authentication daemon.
+After=syslog.target 
+
+[Service]
+Type=forking
+PIDFile=@LOCALSTATEDIR@/run/saslauthd/saslauthd.pid
+EnvironmentFile=@SYSCONFDIR@/default/saslauthd
+ExecStart=@SBINDIR@/saslauthd -m $SOCKETDIR -a $MECH $FLAGS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 491ecdb..c235a1b 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -10,9 +10,11 @@ SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
 	   file://debian_patches_0009_sasldb_al.diff \
 	   file://debian_patches_0014_avoid_pic_overwrite.diff \
 	   file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
+	   file://saslauthd.service \
+	   file://saslauthd.conf \
 	   "
 
-inherit autotools-brokensep pkgconfig useradd
+inherit autotools-brokensep pkgconfig useradd systemd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-bdb-libdir=${STAGING_LIBDIR} \
@@ -51,17 +53,42 @@ do_compile_prepend () {
     cd ..
 }
 
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/saslauthd.service ${D}${systemd_unitdir}/system
+
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/saslauthd.service
+        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/saslauthd.service
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/saslauthd.service
+
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /run/saslauthd/ - - - -" > ${D}${sysconfdir}/tmpfiles.d/saslauthd.conf
+
+        install -d ${D}${sysconfdir}/default/
+        install -m 0644 ${WORKDIR}/saslauthd.conf ${D}${sysconfdir}/default/saslauthd
+        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${sysconfdir}/default/saslauthd
+    fi
+}
+
 USERADD_PACKAGES = "${PN}-bin"
 GROUPADD_PARAM_${PN}-bin = "--system mail"
 USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "saslauthd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
 SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
 
 PACKAGES =+ "${PN}-bin"
 
 FILES_${PN}           += "${libdir}/sasl2/*.so*"
-FILES_${PN}-bin       += "${bindir}"
+FILES_${PN}-bin       += "${bindir} \
+                          ${sysconfdir}/default/saslauthd \
+                          ${systemd_unitdir}/system/saslauthd.service \
+                          ${sysconfdir}/tmpfiles.d/saslauthd.conf"
 FILES_${PN}-dev       += "${libdir}/sasl2/*.la"
 FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
-- 
1.9.1


