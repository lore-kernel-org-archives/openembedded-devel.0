Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7023771A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:36 +0000 (UTC)
Received: by wmec201 with SMTP id c201so1059856wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YJpm8nj1A78MR1+wVIkMPfxJCZpFoG+MFVt7Ao89l8k=;
	b=SuibHzouHcbSn4X8IlVy3ZIzE6pmB7tEibO6lqrhk2duWfHXBlVQq4AdLgEZPhUTls
	jneIaJBbgy93T0BY8i99W14ONp+e0+hUN4hW5b5v2ni7I6Z93GDXKE8eIsFNmhMZnCXo
	dIB9itIed1sidKHCD1wgFpJgdLqxKePfnIquAfvaxBqyNr29AEHFYAofTYbQHpg7u8mV
	qN5U6I6cx3v+374nLoSLnFjO4yhyPsYj/pTT1MoY7dJ/GL4Y1l7bbtq5SKnyqRTRxuAi
	PYzlApd317VhKtdoACGsnKXdPYFnmSt/RdQ9C/ehrK94ut7tt7pSkj6qzY92pTzg5ZGq
	Eazg==
X-Received: by 10.194.78.162 with SMTP id c2mr11739273wjx.112.1447271317044;
	Wed, 11 Nov 2015 11:48:37 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:36 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:10 +0100
Message-Id: <1447271300-4153-8-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 07/17] networkmanager: support gnutls and nss
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:39 -0000

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
index d529b4a..3a59f83 100644
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
+# If you need a different configuration for networkmanager, add lines similar to
+# the following example to your local.conf or distro config
+# PACKAGECONFIG_remove_pn-networkmanager = "nss"
+# PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
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


