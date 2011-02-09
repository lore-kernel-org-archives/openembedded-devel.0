Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier.martin@vista-silicon.com>) id 1Pn6VX-0001ll-ID
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:38:43 +0100
Received: by mail-wy0-f175.google.com with SMTP id 40so6534501wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 01:37:42 -0800 (PST)
Received: by 10.227.153.202 with SMTP id l10mr15073648wbw.173.1297244261963;
	Wed, 09 Feb 2011 01:37:41 -0800 (PST)
Received: from localhost.localdomain (58.50.18.95.dynamic.jazztel.es
	[95.18.50.58])
	by mx.google.com with ESMTPS id u9sm109430wbg.0.2011.02.09.01.37.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 01:37:40 -0800 (PST)
From: Javier Martin <javier.martin@vista-silicon.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Feb 2011 10:37:13 +0100
Message-Id: <1297244237-9508-4-git-send-email-javier.martin@vista-silicon.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
Subject: [PATCH 3/7] Add custom init dropbear script and image for Visstrim_M10.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Feb 2011 09:38:43 -0000

Custom init script is needed since "/" is mounted as read-only
but "/etc" is mounted as read-write in Visstrim_M10 boards.
This case is not supported by default init script.

Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
---
 recipes/dropbear/dropbear/visstrim_m10/init |   91 +++++++++++++++++++++++++++
 recipes/images/micro-image-visstrim.bb      |   48 ++++++++++++++
 2 files changed, 139 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dropbear/dropbear/visstrim_m10/init
 create mode 100644 recipes/images/micro-image-visstrim.bb

diff --git a/recipes/dropbear/dropbear/visstrim_m10/init b/recipes/dropbear/dropbear/visstrim_m10/init
new file mode 100644
index 0000000..72ca918
--- /dev/null
+++ b/recipes/dropbear/dropbear/visstrim_m10/init
@@ -0,0 +1,91 @@
+#!/bin/sh
+#
+# Do not configure this file. Edit /etc/default/dropbear instead!
+#
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/dropbear
+NAME=dropbear
+DESC="Dropbear SSH server"
+PIDFILE=/var/run/dropbear.pid
+
+DROPBEAR_PORT=22
+DROPBEAR_EXTRA_ARGS=
+NO_START=0
+
+test ! -r /etc/default/dropbear || . /etc/default/dropbear
+test "$NO_START" = "0" || exit 0
+test -x "$DAEMON" || exit 0
+test ! -h /var/service/dropbear || exit 0
+
+# Allows comma-separated list of addresses/ports
+DROPBEAR_PORT=`echo $DROPBEAR_PORT | sed "s/,/ -p /g"`
+DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
+DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
+
+
+test -z "$DROPBEAR_BANNER" || \
+  DROPBEAR_EXTRA_ARGS="$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"
+test -n "$DROPBEAR_RSAKEY" || \
+  DROPBEAR_RSAKEY=$DROPBEAR_RSAKEY_DEFAULT
+test -n "$DROPBEAR_DSSKEY" || \
+  DROPBEAR_DSSKEY=$DROPBEAR_DSSKEY_DEFAULT
+test -n "$DROPBEAR_KEYTYPES" || \
+  DROPBEAR_KEYTYPES="rsa"
+
+gen_keys() {
+for t in $DROPBEAR_KEYTYPES; do
+  case $t in
+    rsa)
+	if [ ! -f $DROPBEAR_RSAKEY ]; then
+	    echo "Creating $DESC RSA host key."
+	    dropbearkey -t rsa -f $DROPBEAR_RSAKEY
+	fi
+	;;
+    dsa)
+	if [ ! -f $DROPBEAR_DSSKEY ]; then
+	    echo "Creating $DESC DSA host key."
+	    dropbearkey -t dss -f $DROPBEAR_DSSKEY
+	fi
+	;;
+  esac
+done
+}
+
+case "$1" in
+  start)
+	gen_keys
+	echo -n "Starting $DESC: "
+	KEY_ARGS=""
+	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
+	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
+	start-stop-daemon -S -p $PIDFILE \
+	  -x "$DAEMON" -- $KEY_ARGS \
+	    -p $DROPBEAR_PORT $DROPBEAR_EXTRA_ARGS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
+	sleep 1
+	KEY_ARGS=""
+	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
+	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
+	start-stop-daemon -S -p $PIDFILE \
+	  -x "$DAEMON" -- $KEY_ARGS \
+	    -p $DROPBEAR_PORT $DROPBEAR_EXTRA_ARGS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/images/micro-image-visstrim.bb b/recipes/images/micro-image-visstrim.bb
new file mode 100644
index 0000000..a53b076
--- /dev/null
+++ b/recipes/images/micro-image-visstrim.bb
@@ -0,0 +1,48 @@
+# micro-image-visstrim
+#
+# This image is based on micro-image and contains basic packages that are needed
+# to boot Visstrim_M10 boards and use jffs2+squashfs power cut safe schema.
+#
+# The image is tested to build and run succesfully with the following machines:
+#
+#	* visstrim_m10
+#
+# Maintainer: Javier Martin <javier.martin@vista-silicon.com>
+#
+
+DISTRO_SSH_DAEMON ?= "dropbear"
+
+# Install basic files only
+IMAGE_INSTALL = "base-files \
+		 visstrim-m10-utils \
+		 base-passwd \
+		 netbase \
+                 u-boot-utils \
+		 ${DISTRO_SSH_DAEMON}"
+
+IMAGE_LINGUAS = ""
+
+# Use busybox as login manager
+IMAGE_LOGIN_MANAGER = "busybox"
+
+# Include minimum init and init scripts
+IMAGE_DEV_MANAGER = ""
+IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
+IMAGE_INITSCRIPTS = ""
+
+inherit image
+
+fso_rootfs_postprocess() {
+	curdir=$PWD
+	cd ${DEPLOY_DIR_IMAGE}
+	mkdir -p tmp/config0
+	mkdir -p tmp/config1
+	cp -a ${IMAGE_ROOTFS}/etc tmp/config0/
+	cp -a ${IMAGE_ROOTFS}/etc tmp/config1/
+	mkfs.jffs2 -r ./tmp -s 0x800 -e 0x20000 -o ${MACHINE}-config.jffs2 --pad=0x200000
+	rm -rf ./tmp
+	cd $curdir
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "fso_rootfs_postprocess"
+
-- 
1.7.0.4



