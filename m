Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7182475734
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:49:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96510291"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2015 16:53:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t558lwW9002492
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jun 2015 16:47:58 +0800
Received: from localhost.localdomain (10.167.226.47) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 5 Jun 2015 16:49:29 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jun 2015 16:49:26 +0800
Message-ID: <1433494166-1991-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.47]
Subject: [meta-networking][PATCH] dovecot: add systemd support and add user dovecot dovenull which is need to start dovecot service.
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
X-List-Received-Date: Fri, 05 Jun 2015 08:49:29 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../dovecot/dovecot/dovecot.service                | 14 ++++++++++++
 .../recipes-support/dovecot/dovecot/dovecot.socket | 14 ++++++++++++
 .../recipes-support/dovecot/dovecot_2.2.10.bb      | 26 +++++++++++++++++++---
 3 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/dovecot.service
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/dovecot.socket

diff --git a/meta-networking/recipes-support/dovecot/dovecot/dovecot.service b/meta-networking/recipes-support/dovecot/dovecot/dovecot.service
new file mode 100644
index 0000000..ca250ea
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/dovecot.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Dovecot IMAP/POP3 email server
+After=local-fs.target network.target
+
+[Service]
+Type=simple
+EnvironmentFile=-@SYSCONFDIR@/sysconfig/dovecot
+ExecStart=@SBINDIR@/dovecot -F
+ExecReload=/bin/kill -HUP $MAINPID
+NonBlocking=yes
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/dovecot.socket b/meta-networking/recipes-support/dovecot/dovecot/dovecot.socket
new file mode 100644
index 0000000..556e1a8
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/dovecot.socket
@@ -0,0 +1,14 @@
+[Unit]
+Description=Dovecot IMAP/POP3 email server activation socket
+
+[Socket]
+#dovecot expects separate IPv4 and IPv6 sockets
+BindIPv6Only=ipv6-only
+ListenStream=0.0.0.0:143
+ListenStream=[::]:143
+ListenStream=0.0.0.0:993
+ListenStream=[::]:993
+KeepAlive=true
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
index f733a78..82225b0 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
@@ -7,13 +7,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
 SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://building-rquota_xdr.c-depend-on-rquota.h.patch \
-          "
+           file://dovecot.service \
+           file://dovecot.socket"
+
 SRC_URI[md5sum] = "037e9c9e07d9dbff54dcff09f280fc8c"
 SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4d2e09b"
 
 DEPENDS = "openssl xz zlib bzip2 libcap"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd useradd
 
 PACKAGECONFIG ??= " \
                    ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
@@ -37,7 +39,25 @@ CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
 
 # hardcode epoll() to avoid running unsafe tests
 # BSD needs kqueue and uclibc poll()
-EXTRA_OECONF = " --with-ioloop=epoll"
+EXTRA_OECONF = " --with-ioloop=epoll \
+                 --with-systemdsystemunitdir=${systemd_unitdir}/system"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "dovecot.service dovecot.socket"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append () {
+    install -d 755 ${D}/etc/dovecot
+    touch 644 ${D}/etc/dovecot/dovecot.conf
+    install -m 0644 ${WORKDIR}/dovecot.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dovecot dovecot; \
+                      -r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dovenull dovenull"
+GROUPADD_PARAM_${PN} = "-f -r dovecot;-f -r dovenull"
 
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES_${PN}-dev += "${libdir}/dovecot/*.so"
-- 
1.8.4.2


