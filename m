Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmdx-0001Fp-QF
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:33:36 +0100
Received: by eya28 with SMTP id 28so2293179eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=uCoP5t6+TY2oes36300Z7CaS6nXNZ1swoaLM5seo9nA=;
	b=a1O0YXP4TqZ5NDL5D78pZ2M86r/lFWLEM0bHs0kUjzZ/q7q6StTQtlbprzHuC2iSCE
	PxnWBp/DH5uAVoYwSjskvtJgOum3MYuwlCTYynnEPMYHljxOflNKcq/c5VcFRVC74oCX
	RiLGjEQ+Nur/0lAMjgi731bdFkGZRYj43sKQI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=GRoWOliYN57BJNloBfJ8ZkyHuwn0cjRbKhbWVl/ZBfxw7oifgGiu/1RFGqaQ6+qPY3
	6Itz/ogSIKJHSeJgmfqfiwfzWwn8UuK910daGI+FuJLYoJOvGxnhGwizOV57b9Fmn3nW
	1BNu+8tpmSGquOo5x5ifyKDUaZUtjFAjqtwnk=
Received: by 10.14.119.197 with SMTP id n45mr1946989eeh.28.1289064760260;
	Sat, 06 Nov 2010 10:32:40 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id x54sm2322766eeh.5.2010.11.06.10.32.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:32:39 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:32:31 +0000
Message-Id: <1289064751-20094-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 09/11] pathfinder: Added pathfinder (X.509 path verification)
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
X-List-Received-Date: Sat, 06 Nov 2010 17:33:36 -0000

  * PathFinder is designed to provide a mechanism for any program to
	perform RFC3280-compliant path validation of X509 certificates, even
	when some of the intermediate certificates are not present on the
	local machine.

  * pathfinder can be used with opkg to provide verification of remote
    ssl certificates
---
 recipes/pathfinder/files/pathfinderd.conf |   21 +++++++++++++++++++
 recipes/pathfinder/files/pathfinderd.init |   32 +++++++++++++++++++++++++++++
 recipes/pathfinder/pathfinder.inc         |   22 +++++++++++++++++++
 recipes/pathfinder/pathfinder_1.1.3.bb    |   11 ++++++++++
 recipes/pathfinder/pathfinder_svn.bb      |   11 ++++++++++
 5 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pathfinder/files/pathfinderd.conf
 create mode 100644 recipes/pathfinder/files/pathfinderd.init
 create mode 100644 recipes/pathfinder/pathfinder.inc
 create mode 100644 recipes/pathfinder/pathfinder_1.1.3.bb
 create mode 100644 recipes/pathfinder/pathfinder_svn.bb

diff --git a/recipes/pathfinder/files/pathfinderd.conf b/recipes/pathfinder/files/pathfinderd.conf
new file mode 100644
index 0000000..9c285a8
--- /dev/null
+++ b/recipes/pathfinder/files/pathfinderd.conf
@@ -0,0 +1,21 @@
+<!DOCTYPE busconfig PUBLIC
+ "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+    <policy user="root">
+        <allow own="ca.carillon.pathfinder"/>
+        <allow send_destination="ca.carillon.pathfinder"/>
+    </policy>
+
+    <!--
+    <policy user="pathfinderd">
+        <allow own="ca.carillon.pathfinder"/>
+        <allow send_destination="ca.carillon.pathfinder"/>
+    </policy>
+    -->
+
+    <policy context="default">
+        <deny own="ca.carillon.pathfinder"/>
+        <allow send_destination="ca.carillon.pathfinder"/>
+    </policy>
+</busconfig>
diff --git a/recipes/pathfinder/files/pathfinderd.init b/recipes/pathfinder/files/pathfinderd.init
new file mode 100644
index 0000000..a20b4c1
--- /dev/null
+++ b/recipes/pathfinder/files/pathfinderd.init
@@ -0,0 +1,32 @@
+#!/bin/sh
+DAEMON=/usr/sbin/pathfinderd
+NAME=pathfinderd
+DESC="pathfinderd: X509 Path Verification Daemon"
+PIDFILE=/var/run/pathfinderd/pathfinderd.pid
+ARGS="-d"
+
+test -f $DAEMON || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME"
+        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $ARGS
+        echo "."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME"
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
+        echo "."
+        ;;
+    restart)
+        $0 stop
+        sleep 1
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes/pathfinder/pathfinder.inc b/recipes/pathfinder/pathfinder.inc
new file mode 100644
index 0000000..ce1d832
--- /dev/null
+++ b/recipes/pathfinder/pathfinder.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "A tool to perform RFC3280-compliant path validation of X509 certificates"
+
+LICENSE = "LGPL"
+DEPENDS = "wvstreams openldap boost"
+RDEPENDS = "dbus"
+HOMEPAGE = "http://code.google.com/p/pathfinder-pki/"
+
+INC_PR = "0"
+
+inherit cmake pkgconfig update-rc.d
+
+INITSCRIPT_NAME = "pathfinderd"
+INITSCRIPT_PARAMS = "defaults"
+
+do_install_append() {
+  install -d ${D}/${sysconfdir}/init.d/
+  install -m 755 "${WORKDIR}/pathfinderd.init" "${D}/etc/init.d/pathfinderd"
+
+  install -d ${D}/${sysconfdir}/dbus-1/system.d/
+  install ${WORKDIR}/pathfinderd.conf ${D}/${sysconfdir}/dbus-1/system.d/
+
+}
diff --git a/recipes/pathfinder/pathfinder_1.1.3.bb b/recipes/pathfinder/pathfinder_1.1.3.bb
new file mode 100644
index 0000000..ab8aa65
--- /dev/null
+++ b/recipes/pathfinder/pathfinder_1.1.3.bb
@@ -0,0 +1,11 @@
+require pathfinder.inc
+
+SRC_URI = "http://pathfinder-pki.googlecode.com/files/${PN}-${PV}-Source.tar.gz \
+  file://pathfinderd.init \
+  file://pathfinderd.conf \
+"
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "6985ea14da6dff30c3c4e5cfc8b3d0f7"
+SRC_URI[sha256sum] = "a81b09a306aa997980d76f2b6e9215e7b3a91ed4c5fb413b3c4d30513a5e1031"
diff --git a/recipes/pathfinder/pathfinder_svn.bb b/recipes/pathfinder/pathfinder_svn.bb
new file mode 100644
index 0000000..f17943e
--- /dev/null
+++ b/recipes/pathfinder/pathfinder_svn.bb
@@ -0,0 +1,11 @@
+require pathfinder.inc
+
+SRC_URI = "svn://pathfinder-pki.googlecode.com/svn/trunk;module=pathfinder;proto=http \
+  file://pathfinderd.init \
+  file://pathfinderd.conf \
+"
+
+SRCREV = "224"
+PV = "1.1.3+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+S = "${WORKDIR}/${PN}"
-- 
1.7.3.1



