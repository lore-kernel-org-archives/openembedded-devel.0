Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMH75-0004eE-P1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 13:39:39 +0200
Received: from localhost ([127.0.0.1]:35239 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TMGuL-0004bt-Cn; Thu, 11 Oct 2012 11:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=xefRQJQI0PjLWcUyF4Gn8BYy
	f8E=; b=NbiRtSNOvFEURzhurTwvgl8EKsMT0ALqLmcwEP6SHnA+ra8iSvPzB6HM
	BhbcTIXwDLeNEm2rh6Gyzs21u105/rLzRPe9WltMHGHr7tjQIP9ffBZ7TCMEES4J
	sMQypXuRfiGHd+hu88HFzzw1f0BXIm4XmNeOaxM986M2C+L6X1U=
Received: from [195.171.99.130] (port=34874 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TMGuL-0004bm-7w; Thu, 11 Oct 2012 11:26:29 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 12:28:11 +0100
Message-Id: <1349954891-17044-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] hiawatha: add initial 8.5 recipe and associated files
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
X-List-Received-Date: Thu, 11 Oct 2012 11:39:40 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

---
 .../recipes-httpd/hiawatha/files/hiawatha-init     | 34 +++++++++++++++++
 .../recipes-httpd/hiawatha/hiawatha_8.5.bb         | 44 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
new file mode 100644
index 0000000..c265093
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/hiawatha
+NAME=hiawatha
+DESC="Hiawatha Web Server"
+OPTS=""
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	sleep 1
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
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
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
new file mode 100644
index 0000000..4146d56
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Lightweight secure web server"
+HOMEPAGE = "http://www.hiawatha-webserver.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "libxml2 libxslt"
+
+SECTION = "net"
+
+SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
+					 file://hiawatha-init"
+
+SRC_URI[md5sum] = "71d3903657953c93fc930758d158097d"
+SRC_URI[sha256sum] = "2567e6b4b4c6666388087b586238e6e91a4afd80e10a879920020a097fcdc946"
+
+inherit cmake update-rc.d
+
+INITSCRIPT_NAME = "hiawatha"
+INITSCRIPT_PARAMS = "defaults 70"
+
+EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
+                  -DENABLE_CACHE=ON \
+                  -DENABLE_DEBUG=OFF \
+                  -DENABLE_SSL=OFF \
+                  -DENABLE_TOOLKIT=OFF \
+                  -DENABLE_CHROOT=OFF \
+                  -DENABLE_XSLT=ON \
+                  -DENABLE_TOMAHAWK=OFF \
+                  -DCMAKE_INSTALL_MANDIR=${mandir} \
+                  -DCMAKE_INSTALL_BINDIR=${bindir} \
+                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
+                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
+                  -DCMAKE_INSTALL_LIBDIR=${libdir} \ 
+                  -DLOG_DIR=/var/log/hiawatha \
+                  -DPID_DIR=/var/run \
+                  -DWEBROOT_DIR=/var/www/hiawatha \
+                  -DWORK_DIR=/var/lib/hiawatha "
+
+do_install_append() {
+
+	# Copy over init script
+  mkdir -p ${D}${sysconfdir}/init.d
+  install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
+
+}
-- 
1.7.12.2



