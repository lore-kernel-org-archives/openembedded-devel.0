Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 10C3B77177
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:05 +0000 (UTC)
Received: by wmww144 with SMTP id w144so19788695wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a3Y0DSmHK27nWDqQR9qcxjoRBx9nMYCZ1UIit2Uf57s=;
	b=l+oNTT7Dm2DPzl0FDyLsEUxI+89Nff9fbzFbMZGvMflVAIgnLlTKAVcaGDYe6+6uI3
	ebJL72zayGuNv6BuGlrWR4JHx1sYNzVJ+n3wbs4Cl7SPRdU8UG6aJBR2b81UeWOkTjvL
	DWEFo8IfZ5gdoM1BdZEyHwhxd2hel804n054n6vtJwMXrmr1b1pRGu/p1s9m0z+rb4ny
	exbzOqijGJcytQtJ2fGL8PkuKrBp6842SCgOd+G5IQoI3mlGSDAb7lxX+eH2dlN6pOaa
	/3hzwF/JXova03+hd8y+LbJ12D/Vkhafdf7u5W1ASyx68hxqzyZxAb2LwX3CyGRV7kL+
	Aizw==
X-Received: by 10.194.58.44 with SMTP id n12mr6383785wjq.118.1447192206005;
	Tue, 10 Nov 2015 13:50:06 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:14 +0100
Message-Id: <1447192164-9399-8-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 07/17] networkmanager: support gnutls and nss
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:06 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../0002-add-pkg-config-for-libgcrypt.patch        | 41 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.6.bb         | 14 ++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
new file mode 100644
index 0000000..bb95eaa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
@@ -0,0 +1,41 @@
+From a9261fee4a41045c42e0d292237cee532e11982c Mon Sep 17 00:00:00 2001
+From: Adrian <adrian.freihofer@gmail.com>
+Date: Thu, 27 Nov 2014 15:43:26 +0100
+Subject: [PATCH] add pkg config for libgcrypt
+
+---
+ configure.ac | 18 +++++++-----------
+ 1 file changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 94b0758..654a015 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -480,17 +480,13 @@ if test x"$ac_crypto" = xnss; then
+   with_nss=yes
+ elif test x"$ac_crypto" = xgnutls; then
+   PKG_CHECK_MODULES(GNUTLS, [gnutls >= 1.2])
+-  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+-  if test x"$LIBGCRYPT_CONFIG" = xno; then
+-    AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on system])
+-  else
+-    AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
+-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
+-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
+-    AC_SUBST(LIBGCRYPT_CFLAGS)
+-    AC_SUBST(LIBGCRYPT_LIBS)
+-    with_gnutls=yes
+-  fi
++  AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
++      AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
++      with_gnutls=yes
++    ], [
++      AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on system])
++    ])
+ else
+   AC_MSG_ERROR([Please choose either 'nss' or 'gnutls' for certificate and crypto operations])
+ fi
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index d529b4a..3d3f63e 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
 
-DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools nss util-linux libndp"
+DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux libndp"
 
 inherit gnomebase gettext systemd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
+    file://0002-add-pkg-config-for-libgcrypt.patch \
 "
 
 SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
@@ -26,7 +27,6 @@ EXTRA_OECONF = " \
     --disable-ifnet \
     --disable-ifcfg-suse \
     --with-netconfig \
-    --with-crypto=nss \
     --disable-more-warnings \
     --with-dhclient=${base_sbindir}/dhclient \
     --with-iptables=${sbindir}/iptables \
@@ -34,7 +34,13 @@ EXTRA_OECONF = " \
     --with-dnsmasq=${bindir}/dnsmasq \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+# If you need a different configuration for networkmanager, add a line similar to
+# the following examples to your local.conf or distro config
+# PACKAGECONFIG_pn-networkmanager = "systemd gnutls"
+# PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
+PACKAGECONFIG ??= "nss \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
+"
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
     --without-systemdsystemunitdir, \
@@ -46,6 +52,8 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
+PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
+PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls libgcrypt"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
 
-- 
2.4.3


