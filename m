Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C300678319
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:23 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id w126so27756162wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hyiLSkB3n+KwHiA/wBkqJxIgaKNj0vnkldifNSsZb6A=;
	b=XAMdVHsehUqXr/jIGS3DYK3toDexzi3i766VnhRCYQZuw/7+Y27aLdQuOKFgKq7dN0
	IeNEo5mnBQxipYzb8bz72aOnjSoffosVXY2nGMUOleqrw3BjDuw3WgzQOWI/NA4tHzsa
	ywwnM7A4VlMvZ9OXdm/TghGJqYewxjg4Z5+2EyU0UuBTe7LnWeg+VnSP6O9qVSlRGg56
	CVPWuwyepXqDlmyCq27iJ0RiJvk0TonwFeEP8sICsGYmlf4m2+VqExrJkJIKOXCKWHwy
	ErvPZKNlDzpiq0mintNtRSfToxTtPP8aXHnZDKkbg2JzxSDNh+pXf0oxeLmQ0sA4lUvC
	cscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hyiLSkB3n+KwHiA/wBkqJxIgaKNj0vnkldifNSsZb6A=;
	b=lWN81A2BOpDXGHJAXAf3dpGxUH4fcJBKIQ2zDctNCt/t6JZ+gXy6FQWGV+JA6E601f
	oeL3XEk79Fb2EddImhgkQww/PYmqCEptWvGPa/07UlVp2euSoilUBw9L3DHs5HC4syix
	YeN1K7QDdi5H9RqQFSEpqWAD3nBwfQNMlgDNAaLtxqjB7FCu8XY6VIMdGtpbdD/JwcgH
	A3fQVHt5wsS8FfoRVkmP61kaEOg1Ivlv5uMQFO0IMoXE4Pjh/UrC/7fvThjpXzK11WAG
	nvbgllufy8dxKQgClnLKxc3yN4pnrZfM4fbPOIzc9dPZk1l1RECEmo/szTN+RaKpEHTT
	deXQ==
X-Gm-Message-State: AIVw113gdQQwKufm3WjYbTGWGK3NURb+hFkH1WnYFn/GlaqRwufPCmmG
	v6kWqs+cpzggFJrSdfw=
X-Received: by 10.28.154.85 with SMTP id c82mr2764545wme.151.1500564923987;
	Thu, 20 Jul 2017 08:35:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:07 +0100
Message-Id: <20170720153508.23113-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 8/9] system-tools-backends: remove (previously blacklisted)
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:24 -0000

system-tools-backends is from 2011 and blacklisted, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../add-angstrom-distro.patch                      | 41 ------------
 .../system-tools-backends                          | 74 ----------------------
 .../system-tools/system-tools-backends_2.10.2.bb   | 54 ----------------
 3 files changed, 169 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb

diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
deleted file mode 100644
index cb03fd86e..000000000
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/add-angstrom-distro.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b5084616a3bc2a0d485f43aeae69c6025f3f857e Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 10 Jun 2011 18:44:21 +0200
-Subject: [PATCH] add support for the angstrom distribtion
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- Utils/Platform.pm |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/Utils/Platform.pm b/Utils/Platform.pm
-index fc76360..8b8c770 100644
---- a/Utils/Platform.pm
-+++ b/Utils/Platform.pm
-@@ -92,6 +92,7 @@ my $PLATFORM_INFO = {
-   "nexenta-1.0"     => [ "Nexenta GNU/Solaris", "1.0", "Ellate" ],
-   "yellowdog-4.1"   => [ "Yellow Dog Linux", "4.1", "Sagitta" ],
-   "guadalinex-v4"   => [ "Guadalinex", "v4", "Toro" ],
-+  "angstrom"        => [ "Angstrom", "", "" ],
- };
- 
- sub get_platform_info
-@@ -143,6 +144,7 @@ sub ensure_distro_map
-      "vine-3.1"         => "vine-3.0",
-      "vlos-1.2"         => "gentoo",
-      "nexenta-1.0"      => "solaris-2.11",
-+     "angstrom"         => "debian",
-      );
- 
-   return $metamap{$distro} if ($metamap{$distro});
-@@ -375,6 +377,7 @@ sub guess
-                   [ \&check_ark ],
-                   [ \&check_yoper ],
-                   [ \&check_distro_file, "/etc/yellowdog-release", "yellowdog", "^Yellow Dog Linux release (\\S+)" ],
-+                  [ \&check_file_exists, "/etc/angstrom-version", "angstrom" ],
-                  ],
-     "FreeBSD" => [[ \&check_freebsd ]],
-     "SunOS"   => [[ \&check_solaris ]]
--- 
-1.6.6.1
-
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
deleted file mode 100644
index 704c36dbf..000000000
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
+++ /dev/null
@@ -1,74 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          system-tools-backends
-# Required-Start:    $local_fs dbus
-# Required-Stop:     $local_fs dbus
-# Should-Start:	     $syslog
-# Should-Stop:       $syslog
-# Default-Start:     2 3 4 5
-# Default-Stop:      1
-# Short-Description: Gnome System Tools Backends
-# Description:       The Gnome System Tools Backends daemon handles root-needed
-#                    operations to configure your machine with the Gnome System
-#		     Tools.
-### END INIT INFO
-
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/bin/system-tools-backends
-PIDDIR=/var/run
-PIDFILE=$PIDDIR/system-tools-backends.pid
-NAME=system-tools-backends
-DESC="System Tools Backends"
-
-test -x $DAEMON || exit 0
-
-set -e
-
-do_start() {
-    echo "Starting $DESC"
-    start-stop-daemon --start --startas $DAEMON --quiet --pidfile $PIDFILE
-}
-
-do_stop() {
-    echo "Stopping $DESC"
-    start-stop-daemon --stop --oknodo --quiet --pidfile $PIDFILE --startas $DAEMON
-}
-
-case "$1" in
-  start)
-    do_start
-    ;;
-  stop)
-    do_stop
-    ;;
-  #reload)
-    #
-    # If the daemon can reload its config files on the fly
-    # for example by sending it SIGHUP, do it here.
-    #
-    # If the daemon responds to changes in its config file
-    # directly anyway, make this a do-nothing entry.
-    #
-    # echo "Reloading $DESC configuration files."
-    # start-stop-daemon --stop --signal 1 --quiet --pidfile \
-    #   /var/run/$NAME.pid --exec $DAEMON
-  #;;
-  restart|force-reload)
-    #
-    #   If the "reload" option is implemented, move the "force-reload"
-    #   option to the "reload" entry above. If not, "force-reload" is
-    #   just the same as "restart".
-    #
-    do_stop
-    sleep 5
-    do_start
-    ;;
-  *)
-    N=/etc/init.d/$NAME
-    echo "Usage: $N {start|stop|restart|reload|force-reload|status}" >&2
-    exit 1
-    ;;
-esac
-
-exit 0
-
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
deleted file mode 100644
index 862c0ea30..000000000
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "gnome system tools backends"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "dbus dbus-glib glib-2.0 polkit"
-
-inherit gnome pkgconfig update-rc.d gettext
-
-SRC_URI[archive.md5sum] = "edae148b31342aecae035051adc70c74"
-SRC_URI[archive.sha256sum] = "1dbe5177df46a9c7250735e05e77129fe7ec04840771accfa87690111ca2c670"
-
-SRC_URI += " \
-            file://system-tools-backends \
-"
-
-# This needs to move to meta-angstrom
-SRC_URI_append_angstrom = " \
-            file://add-angstrom-distro.patch \
-"
-
-EXTRA_OECONF = " --with-net-dbus=${libdir}/perl5 "
-
-do_configure() {
-    rm missing || true
-    automake --add-missing
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in
-    libtoolize --force --install
-    aclocal
-    gnu-configize
-    oe_runconf
-    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}
-}
-
-do_install_append () {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/
-}
-
-INITSCRIPT_NAME = "system-tools-backends"
-INITSCRIPT_PARAMS = "start 50 2 3 4 5 . stop 70 1 ."
-
-# Shadow added so there is a full adduser/deluser
-# (Gnome images tend to pull in shadow anyway)
-RDEPENDS_${PN} = "shadow"
-
-FILES_${PN} += " ${sysconfdir}/dbus-1/system.d"
-FILES_${PN} += " ${libdir}/pkgconfig"
-FILES_${PN} += " ${datadir}/dbus-1/system-services"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/files"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/scripts"
-FILES_${PN} += " ${datadir}/polkit*"
-
-PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


