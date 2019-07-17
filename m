Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 993107ED64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 18:44:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u25so12790083wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KwyaL5TM0onVahdpqcmwfhAOl4ryO9l2vlybfX28eAE=;
	b=iPP74IHAxlJSQ8sIm3HrdBQkcZH+avUcpfM7lOUonRi4XkV7vunPYp4/YAQ1RB+JIu
	m+jaazxWf+4LD9nAg99J9OXBO0C7dXtzh0t1xbJ+6s58WtVs7pODmtFve60buNciQTpn
	9I6qd4eDqlSD99sPe0MLYyhSVEBKtQ4TbJ77cR2XqMv9ndVs4s9ZP25UKXMdieNFJ0Jv
	pSBwtq2RyLlccXPZrpyg3dikEBlBo0kerU1jkIbcOCa1BEIbnL1ORW1a7/AwFqJ+i6NA
	xSc+h2B9lBX9ldRtEv+5J1q8ARXuQqhovbQAwI+M2wwiDZxYTL3YmIegKejjQ7lOnACC
	Dnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KwyaL5TM0onVahdpqcmwfhAOl4ryO9l2vlybfX28eAE=;
	b=Tb6IBqYtlH/AA0MVS0TCRMnlOt8m+b4Jm9HzgSWJ3z4aMGPGsIoq9CY/6gjA+ghn/8
	t7ZC+xWU51cfmyofLF/gTMlAsdqJ1MZQznvMIznPwF1eactPSJhybJOW6ivL4Gw+9jyi
	1DMB/o2QBXeLQV1ara+M6K5Y1HG03IWVNiYhb1upgnaCygSDQK98fwKpAH25/xUN+p10
	CdqbDmJJ4/5+DkfSindrc8Yb7wQU+HPNsGMxZnR2nXZju2bDcegjoDgqOgliNLS40Ybk
	7PM7edgQXejrDT9kccVDGuS97MzXc6Qs/dEIeTsDqg+E+A1el+H3S8peS1Lsv0GpNgvx
	EQeA==
X-Gm-Message-State: APjAAAUwojxnt9f+cvBcpLClCDhFoJ6PYl9zfyrO3iPpa1iFOBPVWuxq
	r2iD6GQ2iYKL/NO24pwVWRF8tTn3/RA=
X-Google-Smtp-Source: APXvYqxML4UTrlG+Kid5WoBc5AghQSHkGKsXBZcjjAUuLXPRpCOOv9KRPT8KJTzzBj5CgLjpc/+ZpQ==
X-Received: by 2002:a05:600c:225a:: with SMTP id
	a26mr39753378wmm.81.1563389047635; 
	Wed, 17 Jul 2019 11:44:07 -0700 (PDT)
Received: from localhost.localdomain (5-13-246-159.residential.rdsnet.ro.
	[5.13.246.159]) by smtp.gmail.com with ESMTPSA id
	i12sm17824856wrx.61.2019.07.17.11.44.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 11:44:06 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jul 2019 21:43:51 +0300
Message-Id: <20190717184351.27776-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH v2] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Wed, 17 Jul 2019 18:44:08 -0000

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...add-yocto-compatible-startup-scripts.patch | 78 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.9.2.bb  | 46 +++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
new file mode 100644
index 000000000..46f6a7b3f
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
@@ -0,0 +1,78 @@
+From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Tue, 16 Jul 2019 19:59:23 +0300
+Subject: [PATCH] contrib: add yocto compatible startup scripts
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ contrib/unbound.init       | 10 +++++-----
+ contrib/unbound.service.in |  4 ++--
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+ mode change 100644 => 100755 contrib/unbound.init
+
+diff --git a/contrib/unbound.init b/contrib/unbound.init
+old mode 100644
+new mode 100755
+index cccadecc..4eba752b
+--- a/contrib/unbound.init
++++ b/contrib/unbound.init
+@@ -19,11 +19,11 @@
+ ### END INIT INFO
+ 
+ # Source function library.
+-. /etc/rc.d/init.d/functions
++. /etc/init.d/functions
+ 
+ exec="/usr/sbin/unbound"
+ prog="unbound"
+-config="/var/unbound/unbound.conf"
++config="/etc/unbound/unbound.conf"
+ pidfile="/var/unbound/unbound.pid"
+ rootdir="/var/unbound"
+ 
+@@ -61,7 +61,7 @@ start() {
+     fi;
+ 
+     # if not running, start it up here
+-    daemon $exec
++    daemonize $exec
+     retval=$?
+     echo
+     [ $retval -eq 0 ] && touch $lockfile
+@@ -71,7 +71,7 @@ start() {
+ stop() {
+     echo -n $"Stopping $prog: "
+     # stop it here, often "killproc $prog"
+-    killproc -p $pidfile $prog
++    killproc $prog
+     retval=$?
+     echo
+     [ $retval -eq 0 ] && rm -f $lockfile
+@@ -99,7 +99,7 @@ force_reload() {
+ 
+ rh_status() {
+     # run checks to determine if the service is running or use generic status
+-    status -p $pidfile $prog
++    status $prog
+ }
+ 
+ rh_status_q() {
+diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
+index 95976dd9..0e7f79a9 100644
+--- a/contrib/unbound.service.in
++++ b/contrib/unbound.service.in
+@@ -10,9 +10,9 @@ WantedBy=multi-user.target
+ 
+ [Service]
+ ExecReload=/bin/kill -HUP $MAINPID
+-ExecStart=@UNBOUND_SBIN_DIR@/unbound
++ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
+ NotifyAccess=main
+-Type=notify
++Type=simple
+ CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
+ MemoryDenyWriteExecute=true
+ NoNewPrivileges=true
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
new file mode 100644
index 000000000..0607c9d77
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
+DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
+	features including enhanced security (DNSSEC) validation, Internet Protocol \
+	Version 6 (IPv6), and a client resolver library API as an integral part of the \
+	architecture"
+
+HOMEPAGE = "https://www.unbound.net/"
+SECTION = "net"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
+
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
+	file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
+"
+SRCREV="ee06aaaad99dc4d6b73f915d98f05c506885b98a"
+
+inherit autotools pkgconfig systemd update-rc.d
+
+DEPENDS = "openssl libevent libtool-native bison-native expat"
+RDEPENDS_${PN} = "bash openssl-bin daemonize"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
+		--with-ssl=${STAGING_EXECPREFIXDIR} \
+		libtool=${TARGET_PREFIX}libtool \
+"
+		
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
+PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
+}
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+INITSCRIPT_NAME = "unbound"
+INITSCRIPT_PARAMS = "defaults"
-- 
2.17.1


