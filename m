Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11539.1603109159741290449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40188 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kUTvF-0005AN-3k; Mon, 19 Oct 2020 15:05:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] transmission: Upgrade 2.94 -> 3.00
Date: Mon, 19 Oct 2020 15:05:47 +0300
Message-Id: <20201019120547.29869-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 3.00:

- Allow the RPC server to listen on an IPv6 address
- Change TR_CURL_SSL_VERIFY to TR_CURL_SSL_NO_VERIFY and enable
  verification by default
- Go back to using hash as base name for resume and torrent files
  (those stored in configuration directory)
- Handle "fields" argument in "session-get" RPC request; if
  "fields" array is present in arguments, only return session
  fields specified; otherwise return all the fields as before
- Limit the number of incorrect authentication attempts in
  embedded web server to 100 to prevent brute-force attacks
- Set idle seed limit range to 1..40320 (4 weeks tops) in all
  clients
- Add Peer ID for Xfplay, PicoTorrent, Free Download Manager,
  Folx, Baidu Netdisk torrent clients
- Announce INT64_MAX as size left if the value is unknown
  (helps with e.g. Amazon S3 trackers)
- Add TCP_FASTOPEN support (should result in slight speedup)
- Improve ToS handling on IPv6 connections
- Abort handshake if establishing DH shared secret fails (leads
  to crash)
- Don't switch trackers while announcing (leads to crash)
- Improve completion scripts execution and error handling; add
  support for .cmd and .bat files on Windows
- Maintain a "session ID" file (in temporary directory) to better
  detect whether session is local or remote; return the ID as
  part of "session-get" response
- Change torrent location even if no data move is needed
- Support CIDR-notated blocklists
- Update the resume file before running scripts
- Make multiscrape limits adaptive
- Add labels support to libtransmission and transmission-remote
- Parse session-id header case-insensitively
- Sanitize suspicious path components instead of rejecting them
- Load CA certs from system store on Windows / OpenSSL
- Add support for mbedtls (formely polarssl) and wolfssl (formely
  cyassl), LibreSSL
- Fix building against OpenSSL 1.1.0+
- Fix quota support for uClibc-ng 1.0.18+ and DragonFly BSD
- Fix a number of memory leaks (magnet loading, session shutdown,
  bencoded data parsing)
- Bump miniupnpc version to 2.0.20170509
- CMake-related improvements (Ninja generator, libappindicator,
  systemd, Solaris and macOS)
- Switch to submodules to manage (most of) third-party
  dependencies
- Fail installation on Windows if UCRT is not installed

License-Update: Bump copyright to 2020

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...onfigure.ac-Fix-no-libsystemd-daemon.patch | 40 -------------------
 .../transmission/transmission_git.bb          | 15 ++++---
 2 files changed, 7 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch

diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch b/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch
deleted file mode 100644
index 130ead0842..0000000000
--- a/meta-oe/recipes-connectivity/transmission/files/0001-configure.ac-Fix-no-libsystemd-daemon.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 73ee7e68402a77287054df779f0e44ae1a4f9f0b Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 11 May 2020 17:01:35 +0000
-Subject: [PATCH] configure.ac: Fix no libsystemd-daemon
-
-Replace libsystemd-daemon with libsystemd.
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index df8cb5007..9a6fb9b2e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -249,10 +249,10 @@ AC_ARG_WITH([systemd-daemon], AS_HELP_STRING([--with-systemd-daemon],
-             [Add support for systemd startup notification (default is autodetected)]),
-             [USE_SYSTEMD_DAEMON=$withval], [USE_SYSTEMD_DAEMON=auto])
- AS_IF([test "x$USE_SYSTEMD_DAEMON" != "xno"], [
--    PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
-+    PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd],
-         [AC_DEFINE(USE_SYSTEMD_DAEMON,1,[Use systemd startup notification])],
-         [AS_IF([test "x$USE_SYSTEMD_DAEMON" = "xyes"],
--            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd-daemon not found.])]
-+            [AC_MSG_ERROR([systemd startup notification support requested, but libsystemd not found.])]
-         )]
-     )
- ])
-@@ -558,7 +558,6 @@ if test "x$enable_nls" = "xyes" ; then
-     GETTEXT_PACKAGE=transmission-gtk
-     AC_SUBST(GETTEXT_PACKAGE)
-     AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext package])
--    AM_GLIB_GNU_GETTEXT
-     transmissionlocaledir='${prefix}/${DATADIRNAME}/locale'
-     AC_SUBST(transmissionlocaledir)
- fi
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 412bd9d3fa..297185de72 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -2,20 +2,19 @@ DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
 SECTION = "network"
 HOMEPAGE = "https://transmissionbt.com/"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0dd9fcdc1416ff123c41c785192a1895"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73f535ddffcf2a0d3af4f381f84f9b33"
 
 DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS_${PN}-web = "${PN}"
 
 SRC_URI = " \
-	git://github.com/transmission/transmission \
-	file://0001-configure.ac-Fix-no-libsystemd-daemon.patch \
+	gitsm://github.com/transmission/transmission \
 	file://transmission-daemon \
 "
 
-# Transmission release 2.94
-SRCREV = "d8e60ee44f4295935bd98bf741f85ed19f5a7dfb"
-PV = "2.94"
+# Transmission release 3.00
+SRCREV = "bb6b5a062ee594dfd4b7a12a6b6e860c43849bfd"
+PV = "3.00"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +24,7 @@ PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 
 PACKAGECONFIG[gtk] = " --with-gtk,--without-gtk,gtk+3,"
-PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd,"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd,"
 
 # Weak default values for transmission user and group
 # Change them in bbappend if needed
@@ -62,7 +61,7 @@ PACKAGES += "${PN}-gtk ${PN}-client ${PN}-web"
 FILES_${PN}-client = "${bindir}/transmission-remote ${bindir}/transmission-cli ${bindir}/transmission-create ${bindir}/transmission-show ${bindir}/transmission-edit"
 FILES_${PN}-gtk += "${bindir}/transmission-gtk ${datadir}/icons ${datadir}/applications ${datadir}/pixmaps"
 FILES_${PN}-web = "${datadir}/transmission/web"
-FILES_${PN} = "${bindir}/transmission-daemon ${sysconfdir}/init.d/transmission-daemon"
+FILES_${PN} = "${bindir}/transmission-daemon ${sysconfdir}/init.d/transmission-daemon ${datadir}/appdata"
 
 SYSTEMD_SERVICE_${PN} = "transmission-daemon.service"
 
-- 
2.17.1

