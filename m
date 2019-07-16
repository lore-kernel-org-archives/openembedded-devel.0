Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id C6ECD7ECD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 17:12:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l2so19452609wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XfXK12v1gQYWTHSl6BCeeH9FffJ9j0jYgPr0zglquMw=;
	b=JVal66GyC+Y16LiavoF2MGs8u/14a7zvNrVyOpqScs8I4gudcj/KqQg9pGzQZrT9IP
	FLNjZTp9ewiqKxD9vi/OUExrEtOf5tqdAAIRHwPgCvN+BONpN81sGetIzeD9cVyl3VcG
	6+5pV46UIbWti2XTH6RefxpJCN2hwH40+8dJ4bWZHZQCqAH360rJW9p3UASqa54Q5pKG
	zgCpHBh1suMVMtnk7S0gF8eiwQayqAZ8MRxikSzXL4R/ItlDGoiN6cqSVHc0mpB42+t2
	gy2LaxyqGRUhULXY6SgLzEfmS5GFkG47cO21NImy5TT0d29C8GSsidr9kDTyfdFDKYN6
	5U7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XfXK12v1gQYWTHSl6BCeeH9FffJ9j0jYgPr0zglquMw=;
	b=Suq3nd+R96DwqSEkXyb8/NVc0KR3picAUsK8juA97crASGumN9P31f4GxZ2bIY92Q1
	hVA69x9tgMuxtRstnPIBVfWxmMm1Nm9vCe+a20Tdgb/KXdUUX0ulI9tjd5j1R+pHQLrK
	VqPa6pOB2St6oqO5+Yh6HUPgYvHjd9ik7WmKguWdtEV7lwZQQSkezOrXlTWc/L1uLkee
	cwn7MzgsrvV3ORzHWjzcDKbqTLzaHVRyCwJSKJmMSst6Rc7ls3JjyGoFFY4sJbkBqIgv
	KWvYXE2RL+XTwm79soo/rnouMRRhzotTIIZcTvI0W0TW+wce68HJ7kn62fV8Cq940KKL
	2CCg==
X-Gm-Message-State: APjAAAVsT1J+aNB/4tqRH7wWLRK/yavnh4LF5E+8ObLcIdvtK0k+tWg2
	h3b8bkhuZoKykGkZUCHt9vn1LzYj1nI=
X-Google-Smtp-Source: APXvYqzDg7oc485Ydc0aUTIRsK2i/anRrAzp/MUNb3YaePRCUaeiPZaMrUV5Fk1aVFhYH54wzJowcw==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr30804514wmb.119.1563297149996;
	Tue, 16 Jul 2019 10:12:29 -0700 (PDT)
Received: from localhost.localdomain (5-13-246-159.residential.rdsnet.ro.
	[5.13.246.159]) by smtp.gmail.com with ESMTPSA id
	y18sm20986954wmi.23.2019.07.16.10.12.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 10:12:28 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jul 2019 20:12:13 +0300
Message-Id: <20190716171213.7862-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Tue, 16 Jul 2019 17:12:30 -0000

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...add-yocto-compatible-startup-scripts.patch | 78 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.9.2.bb  | 43 ++++++++++
 2 files changed, 121 insertions(+)
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
index 000000000..5f9bacc31
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
@@ -0,0 +1,43 @@
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
+EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
+		--with-ssl=${STAGING_EXECPREFIXDIR}"
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


