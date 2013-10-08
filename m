Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id ABE646CE94
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:58:18 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so993895obc.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 14:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nmauRH9wryK5iSM0LKJXOPjEv4vLUr5ynVQkI248DXI=;
	b=H46slr5A1LSuPgZjvKd2mAlDLwATO8kXXqhlam5qfon8FUxxKlVcGXKRAv23gLxUWL
	yZrxtwgoieZICh3Cq4jxZIHcc3/OyOJAiBw5RgijqKu+1UdvUkM/P717gwvr2fV+Mt+U
	w11mGM8Iive9Ubb9sQB0c3FRAZkxJCyne4qT9BLtTMbZHspL48gVga+B15DvaTxMQGLl
	t1R4DcSVDU2SvykD5WKtufshA6fdE6S8TzlynFDTJkIMpIlyBAc0A6QU71/y0pl6r0Qj
	xErkwVUw4NwyflOGpvH7FRtBLJjKvlatgO5mypYtq09Wu+XcRoUUCQMvNqZS3pJP6+Qj
	iYdw==
X-Gm-Message-State: ALoCoQmglSXbfxnkkimdRK15VKqFjSO2MytfTw2PVVSQekf8K1BJyIhpHxkMQyJA/iyFZnM8QoFu
X-Received: by 10.182.246.39 with SMTP id xt7mr2955896obc.16.1381269500159;
	Tue, 08 Oct 2013 14:58:20 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id s14sm74027654oeo.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 14:58:19 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 14:58:15 -0700
Message-Id: <1381269495-25407-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] Revert "gypsy: Added init script"
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
X-List-Received-Date: Tue, 08 Oct 2013 21:58:19 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This reverts commit 13f540c5a98d3a64b41117db9cf554956eebafe9.

This daemon is called by dbus when I client connects to it. So it's not
necessary to have the init script. This patch would be useful if we add the
init script as a separeted package. But for now we can remove it.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../gypsy/files/gypsy-initscript                   | 61 ----------------------
 meta-oe/recipes-navigation/gypsy/gypsy.inc         | 13 +----
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100755 meta-oe/recipes-navigation/gypsy/files/gypsy-initscript

diff --git a/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript b/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript
deleted file mode 100755
index c3c94e5..0000000
--- a/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript
+++ /dev/null
@@ -1,61 +0,0 @@
-#! /bin/sh
-#
-# based on gypsy-example-initscript in gypsy repository
-# there are some little modifications to work with OE based distros
-# []' Felipe Tonello eu@felipetonello.com
-#
-
-set -e
-
-DESC="Gypsy daemon"
-NAME="gypsy-daemon"
-DAEMON=/usr/lib/gypsy/$NAME
-PIDFILE=/var/run/$NAME.pid
-SCRIPTNAME=/etc/init.d/$NAME
-USER=root
-
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
-
-#
-#	Function that starts the daemon/service.
-#
-d_start() {
-	start-stop-daemon --start --quiet --pidfile $PIDFILE \
-		--user $USER --exec $DAEMON -- $DAEMON_OPTS
-}
-
-#
-#	Function that stops the daemon/service.
-#
-d_stop() {
-	start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-		 --oknodo --user $USER --exec $DAEMON
-}
-
-
-case "$1" in
-  start)
-	echo -n "Starting $DESC: $NAME"
-	d_start
-	echo "."
-	;;
-  stop)
-	echo -n "Stopping $DESC: $NAME"
-	d_stop
-	echo "."
-	;;
-  restart|force-reload)
-	echo -n "Restarting $DESC: $NAME"
-	d_stop
-	sleep 1
-	d_start
-	echo "."
-	;;
-  *)
-	echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 1f50d79..747b61d 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -8,20 +8,13 @@ LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "console/network"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
 
+inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"
-SRC_URI = "file://gypsy-initscript"
-
-inherit autotools pkgconfig gtk-doc update-rc.d
-
-INITSCRIPT_NAME = "gypsy-daemon"
-# make sure it starts after X
-INITSCRIPT_PARAMS = "start 10 5 3 2 . stop 20 0 1 6 ."
 
 EXTRA_OECONF += "--with-distro=debian"
 
 FILES_${PN} = " \
   ${sysconfdir}/gypsy.conf \
-  ${sysconfdir}/init.d/gypsy-daemon \
   ${sysconfdir}/dbus-1 \
   ${libexecdir}/gypsy-daemon \
   ${datadir}/dbus-1 \
@@ -30,7 +23,3 @@ FILES_${PN} = " \
 FILES_libgypsy = " \
   ${libdir}/libgypsy${SOLIBS} \
 "
-
-do_install_append() {
-  install -D ${WORKDIR}/gypsy-initscript ${D}/${sysconfdir}/init.d/gypsy-daemon
-}
-- 
1.8.3.1


