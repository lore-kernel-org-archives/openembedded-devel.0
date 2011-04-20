Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRiQ-0007JP-VJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:20:47 +0200
Received: by eye27 with SMTP id 27so129283eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LrujyyIdHhSdIaTo8wV4J2EQEKpZzW66uvnMX/nzC7M=;
	b=pXTFbLvza/WiqPsEkQBANxs79r2ZOgOIsJcaWYcaa7d+jX9cVAEMLPaZ7JX2nQJ7TI
	dbsSci2ymH5DB3LsDuaHxhlLGUrnCxhFnRwV+jipM7WmBsDgGICtlH7pb8M2vYXiMi+A
	307SMQ8o4PMaJex0uvxknQM/eHRIndRMLJRv4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bKW311mGy4VegZPcl4lIwBS3kOEuh2O81bYg06J1XN9/J077l/ovVJ4Hc26OgAjUtY
	425Y/jOS4agvJD1JrCMrj/7uz/iYQPw6fHpqNpFj3ON/tSBuMm00SRGU8YU6VVLqNlSV
	Mf9ku+8IdBQt5mvHi7G+mCFb0u3GLfDeuTmOU=
Received: by 10.213.1.134 with SMTP id 6mr2996858ebf.134.1303283900187;
	Wed, 20 Apr 2011 00:18:20 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id q53sm443579eeh.25.2011.04.20.00.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:19 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:17 +0200
Message-Id: <507773779e2408e88224d9122a4cff2c289913fb.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 1/6] syslog-ng: Re-import 2.0.5 from org.oe.dev
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
X-List-Received-Date: Wed, 20 Apr 2011 07:20:47 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/files/initscript |   45 ++++++++++
 .../recipes-support/syslog-ng/files/syslog-ng.conf |   89 ++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   64 ++++++++++++++
 .../recipes-support/syslog-ng/syslog-ng_2.0.5.bb   |    9 ++
 4 files changed, 207 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/initscript
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
new file mode 100644
index 0000000..b95e8ad
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/initscript
@@ -0,0 +1,45 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/syslog-ng and type
+# > update-rc.d syslog-ng defaults 5
+#
+
+
+syslog_ng=/usr/sbin/syslog-ng
+test -x "$syslog_ng" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
+    ;;
+  restart)
+    echo "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo -n "Waiting for syslog-ng to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
new file mode 100644
index 0000000..4d1e9f8
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
@@ -0,0 +1,89 @@
+#
+# Syslog-ng example configuration for for Debian GNU/Linux
+#
+# Copyright (c) 1999 anonymous
+# Copyright (c) 1999 Balazs Scheidler
+# $Id: syslog-ng.conf.sample,v 1.3 2003/05/20 08:57:27 asd Exp $
+#
+# Syslog-ng configuration file, compatible with default Debian syslogd
+# installation. 
+#
+
+options { long_hostnames(off); sync(0); };
+
+source src { file("/proc/kmsg"); unix-stream("/dev/log"); internal(); };
+source net { udp(); };
+
+destination authlog { file("/var/log/auth.log"); };
+destination syslog { file("/var/log/syslog"); };
+destination cron { file("/var/log/cron.log"); };
+destination daemon { file("/var/log/daemon.log"); };
+destination kern { file("/var/log/kern.log"); };
+destination lpr { file("/var/log/lpr.log"); };
+destination user { file("/var/log/user.log"); };
+destination uucp { file("/var/log/uucp.log"); };
+destination ppp { file("/var/log/ppp.log"); };
+destination mail { file("/var/log/mail.log"); };
+
+destination mailinfo { file("/var/log/mail.info"); };
+destination mailwarn { file("/var/log/mail.warn"); };
+destination mailerr { file("/var/log/mail.err"); };
+
+destination newscrit { file("/var/log/news/news.crit"); };
+destination newserr { file("/var/log/news/news.err"); };
+destination newsnotice { file("/var/log/news/news.notice"); };
+
+destination debug { file("/var/log/debug"); };
+destination messages { file("/var/log/messages"); };
+destination console { usertty("root"); };
+destination console_all { file("/dev/tty12"); };
+#destination loghost { udp("loghost" port(999)); };
+
+
+destination xconsole { pipe("/dev/xconsole"); };
+
+filter f_auth { facility(auth); };
+filter f_authpriv { facility(auth, authpriv); };
+filter f_syslog { not facility(authpriv, mail); };
+filter f_cron { facility(cron); };
+filter f_daemon { facility(daemon); };
+filter f_kern { facility(kern); };
+filter f_lpr { facility(lpr); };
+filter f_mail { facility(mail); };
+filter f_user { facility(user); };
+filter f_uucp { facility(cron); };
+filter f_ppp { facility(local2); };
+filter f_news { facility(news); };
+filter f_debug { not facility(auth, authpriv, news, mail); };
+filter f_messages { level(info..warn) 
+	and not facility(auth, authpriv, mail, news); };
+filter f_emergency { level(emerg); };
+
+filter f_info { level(info); };
+filter f_notice { level(notice); };
+filter f_warn { level(warn); };
+filter f_crit { level(crit); };
+filter f_err { level(err); };
+
+log { source(src); filter(f_authpriv); destination(authlog); };
+log { source(src); filter(f_syslog); destination(syslog); };
+log { source(src); filter(f_cron); destination(cron); };
+log { source(src); filter(f_daemon); destination(daemon); };
+log { source(src); filter(f_kern); destination(kern); };
+log { source(src); filter(f_lpr); destination(lpr); };
+log { source(src); filter(f_mail); destination(mail); };
+log { source(src); filter(f_user); destination(user); };
+log { source(src); filter(f_uucp); destination(uucp); };
+log { source(src); filter(f_mail); filter(f_info); destination(mailinfo); };
+log { source(src); filter(f_mail); filter(f_warn); destination(mailwarn); };
+log { source(src); filter(f_mail); filter(f_err); destination(mailerr); };
+log { source(src); filter(f_news); filter(f_crit); destination(newscrit); };
+log { source(src); filter(f_news); filter(f_err); destination(newserr); };
+log { source(src); filter(f_news); filter(f_notice); destination(newsnotice); };
+log { source(src); filter(f_debug); destination(debug); };
+log { source(src); filter(f_messages); destination(messages); };
+log { source(src); filter(f_emergency); destination(console); };
+log { source(src); filter(f_ppp); destination(ppp); };
+log { source(src); destination(console_all); };
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
new file mode 100644
index 0000000..452dd78
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -0,0 +1,64 @@
+DESCRIPTION = "Alternative system logger daemon"
+DEPENDS = "libol flex eventlog glib-2.0"
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+DEPENDS_append = " update-rc.d update-rc.d-native"
+RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+
+INC_PR = "r4"
+
+inherit autotools
+
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
+EXTRA_OECONF = "--with-libol=${STAGING_BINDIR_CROSS}/ --enable-dynamic-linking ${noipv6}"
+
+do_configure_prepend() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+}
+
+do_install_append() {
+        install -d ${D}/${sysconfdir}/${PN}
+        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+}
+
+CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
+
+pkg_postinst_${PN} () {
+        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
+
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT="-s"
+        fi
+        # remove all rc.d-links potentially created from alternative
+        # syslog packages before creating new ones
+        update-rc.d $OPT -f syslog remove
+        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
+}
+
+pkg_prerm_${PN} () {
+        if test "x$D" = "x"; then
+                if test "$1" = "upgrade" -o "$1" = "remove"; then
+                        /etc/init.d/syslog stop
+                fi
+        fi
+
+        update-alternatives --remove syslog-init syslog.${PN}
+}
+
+pkg_postrm_${PN} () {
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT=""
+        fi
+        if test "$1" = "remove" -o "$1" = "purge"; then
+                if ! test -e "/etc/init.d/syslog"; then
+                        update-rc.d $OPT syslog remove
+                fi
+        fi
+}
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb
new file mode 100644
index 0000000..3e914be
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb
@@ -0,0 +1,9 @@
+require syslog-ng.inc
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/2.0/src/${P}.tar.gz \
+          file://syslog-ng.conf \
+          file://initscript"
+
+SRC_URI[md5sum] = "c161eefc450fabc246c1a10997c6c6a5"
+SRC_URI[sha256sum] = "34862f87d9d404ad4874d95ee871334f5bc2acad65420f672ad2ee286ab660a1"
-- 
1.7.3.4



