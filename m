Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 58E557F306
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:43:28 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id u40so12011170qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=pEhfiC0x9A66NgSEIg2ECD8lSoxD1j9U7ehO0l09Eag=;
	b=JS3BFe7dDHGwx7evQgP6li0zkZSCX6a3cWZwlOvE4Ax2Y2tzH+WfimYcWACSN8lWit
	1kHE4Y0NSBrcWd2liwMi5vBRAKvPWL4obxiIbK7gfd9tcPQz2zbNvRSr6tDqrip+dMbN
	IuUCwDANXZqwE2qcBvMtDH45xdiRA30BGs8ec8JM6NXleDc7NlrS4zqWeuTIGYn/dOnr
	4iXLHfF+11oEI5fYF9W/jmhINvQHZqXTkJD/jQwqVo5wQnscmACOwyS8sBLlPANCYXQH
	VyZydXNtZGKhO318Dyim0fa7oT3V7C27KpCAUhK5woz/MyUHCrFz7mkcSiMzTTCmhSvS
	noeQ==
X-Gm-Message-State: APjAAAVOMhoFkucx3EeZEw2oET+qSiRrULvWW72NoNIHMavmrf48nW5j
	ppAKjmVDmVhIen6G7pdF96C5MwluWqY=
X-Google-Smtp-Source: APXvYqwu2rXuZsPj/VT26KBpE9umfkfkGIVDdVs/gZXbinyuzLpBIWUlwwA8iFUmkhGzNlfbAY2bVg==
X-Received: by 2002:ac8:5245:: with SMTP id y5mr17917474qtn.33.1569710608940; 
	Sat, 28 Sep 2019 15:43:28 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	b26sm3180782qkl.43.2019.09.28.15.43.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:43:28 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:43:16 -0300
Message-Id: <20190928224318.4127069-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190928224318.4127069-1-otavio@ossystems.com.br>
References: <20190928224318.4127069-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 3/5] networkmanager: Add sysvinit support
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
X-List-Received-Date: Sat, 28 Sep 2019 22:43:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../networkmanager/networkmanager.initd       | 110 ++++++++++++++++++
 .../networkmanager/networkmanager_1.18.2.bb   |   6 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/networkmanager.initd

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/networkmanager.initd b/meta-networking/recipes-connectivity/networkmanager/networkmanager/networkmanager.initd
new file mode 100644
index 000000000..4fdd80d41
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/networkmanager.initd
@@ -0,0 +1,110 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          network-manager
+# Required-Start:    $remote_fs dbus udev
+# Required-Stop:     $remote_fs dbus udev
+# Should-Start:      $syslog
+# Should-Stop:       $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: network connection manager
+# Description:       Daemon for automatically switching network
+#            connections to the best available connection.
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DESC="network connection manager"
+NAME="NetworkManager"
+
+DAEMON=/usr/sbin/$NAME
+
+PIDFILE=/run/$NAME/$NAME.pid
+
+SCRIPTNAME=/etc/init.d/network-manager
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+log_daemon_msg() {
+    echo -n $*
+}
+
+log_end_msg() {
+    if [ $1 -eq 0 ]; then
+        success
+    else
+        failure
+    fi
+    echo
+}
+
+log_progress_msg () {
+    if [ -z "${1:-}" ]; then
+        return 1
+    fi
+    echo -n " $@"
+}
+
+#
+#   Function that starts the daemon/service.
+#
+d_start() {
+    start-stop-daemon --start --quiet --pidfile $PIDFILE \
+        --exec $DAEMON -- $DAEMON_OPTS
+}
+
+#
+#   Function that stops the daemon/service.
+#
+d_stop() {
+    start-stop-daemon --stop --retry 5 --quiet --pidfile $PIDFILE \
+        --exec $DAEMON
+}
+
+d_reload() {
+    start-stop-daemon --stop --signal HUP --quiet --pidfile $PIDFILE \
+        --exec $DAEMON
+}
+
+case "$1" in
+  start)
+    log_daemon_msg "Starting $DESC" "$NAME"
+    d_start
+    case "$?" in
+        0) log_end_msg 0 ;;
+        1) log_progress_msg "already started"
+           log_end_msg 0 ;;
+        *) log_end_msg 1 ;;
+    esac
+    ;;
+  stop)
+    log_daemon_msg "Stopping $DESC" "$NAME"
+    d_stop
+    case "$?" in
+        0) log_end_msg 0 ;;
+        1) log_progress_msg "already stopped"
+           log_end_msg 0 ;;
+        *) log_end_msg 1 ;;
+    esac
+    ;;
+  reload|force-reload)
+    log_daemon_msg "Reloading $DESC" "$NAME"
+    d_reload
+    log_end_msg $?
+    ;;
+  restart)
+    $0 stop
+    $0 start
+    ;;
+  status)
+    status_of_proc -p $PIDFILE $DAEMON $NAME && exit 0 || exit $?
+    ;;
+  *)
+    echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload|status}" >&2
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index 3c220ec77..db69a5e77 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -19,10 +19,11 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
+inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
+    file://${BPN}.initd \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
 "
@@ -130,6 +131,7 @@ FILES_${PN}-nmtui-doc = " \
     ${mandir}/man1/nmtui* \
 "
 
+INITSCRIPT_NAME = "network-manager"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
 
 ALTERNATIVE_PRIORITY = "100"
@@ -138,6 +140,8 @@ ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','syste
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
 
 do_install_append() {
+    install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
+
     rm -rf ${D}/run ${D}${localstatedir}/run
 
     # For read-only filesystem, do not create links during bootup
-- 
2.23.0


