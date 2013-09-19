Return-Path: <eu@felipetonello.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFED6C9B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 19:09:29 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id k4so3898926qaq.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N0/UAmVireWtvqnYVoNWPDsYzbSDAmCwb79HpGil34k=;
	b=GrGUTsxXnkLIBv3iukgSOG85TItd6F7UZWDkE9G0uv2Lk19gfbO+CJZxsDq2dXws54
	gsklcHNtq0AeoU5gfZmsGk4gjhQSRLmLHFu23FD7oEnxpYPKiSYj6oDBFUAkguav1GHE
	3JDsSCUerZBtiJgBFS1nV71j6Pb0Ch236wrNgZMM38dRtDnvqiz8E4vmi9ss1bk7AiCH
	+MZhFrJwiHJdjIqKA22hE5+Rs8K6zAJusH3yXXXv65yhQ5mut/kNRIdIT9NeEAEubdJS
	Nj1EKqmpj8ZgHZFmASs3DL82f0r6fhVitS1Ukp1Wje+S/ubASOZKQzD51LASuAFZRwNx
	APeg==
X-Gm-Message-State: ALoCoQn8AP0/Nz77fJ7LaV+k6HajWw4QrIV1utlquvudNrwmgwHJChnCJb1241RkkE29OzPEeiBZ
X-Received: by 10.224.61.198 with SMTP id u6mr343710qah.83.1379617770863;
	Thu, 19 Sep 2013 12:09:30 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id k3sm13345014qaz.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 12:09:30 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 12:09:14 -0700
Message-Id: <1379617754-6342-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
References: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 2/2] gypsy: Added init script
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
X-List-Received-Date: Thu, 19 Sep 2013 19:09:29 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Added a modified version of the example init script, gypsy-example-initscript,
from the gypsy repository to be compatible with OE based distros.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../gypsy/files/gypsy-initscript                   | 61 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy.inc         | 13 ++++-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-navigation/gypsy/files/gypsy-initscript

diff --git a/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript b/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript
new file mode 100755
index 0000000..c3c94e5
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/files/gypsy-initscript
@@ -0,0 +1,61 @@
+#! /bin/sh
+#
+# based on gypsy-example-initscript in gypsy repository
+# there are some little modifications to work with OE based distros
+# []' Felipe Tonello eu@felipetonello.com
+#
+
+set -e
+
+DESC="Gypsy daemon"
+NAME="gypsy-daemon"
+DAEMON=/usr/lib/gypsy/$NAME
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/$NAME
+USER=root
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+#
+#	Function that starts the daemon/service.
+#
+d_start() {
+	start-stop-daemon --start --quiet --pidfile $PIDFILE \
+		--user $USER --exec $DAEMON -- $DAEMON_OPTS
+}
+
+#
+#	Function that stops the daemon/service.
+#
+d_stop() {
+	start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+		 --oknodo --user $USER --exec $DAEMON
+}
+
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: $NAME"
+	d_start
+	echo "."
+	;;
+  stop)
+	echo -n "Stopping $DESC: $NAME"
+	d_stop
+	echo "."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: $NAME"
+	d_stop
+	sleep 1
+	d_start
+	echo "."
+	;;
+  *)
+	echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 747b61d..1f50d79 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -8,13 +8,20 @@ LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "console/network"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
 
-inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"
+SRC_URI = "file://gypsy-initscript"
+
+inherit autotools pkgconfig gtk-doc update-rc.d
+
+INITSCRIPT_NAME = "gypsy-daemon"
+# make sure it starts after X
+INITSCRIPT_PARAMS = "start 10 5 3 2 . stop 20 0 1 6 ."
 
 EXTRA_OECONF += "--with-distro=debian"
 
 FILES_${PN} = " \
   ${sysconfdir}/gypsy.conf \
+  ${sysconfdir}/init.d/gypsy-daemon \
   ${sysconfdir}/dbus-1 \
   ${libexecdir}/gypsy-daemon \
   ${datadir}/dbus-1 \
@@ -23,3 +30,7 @@ FILES_${PN} = " \
 FILES_libgypsy = " \
   ${libdir}/libgypsy${SOLIBS} \
 "
+
+do_install_append() {
+  install -D ${WORKDIR}/gypsy-initscript ${D}/${sysconfdir}/init.d/gypsy-daemon
+}
-- 
1.8.3.1


