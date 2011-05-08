Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ763-0001Wn-CI
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:44 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so1743904gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=lVLOi1th0tdiTAQHooVlkRsWYlbYK6Au8jvkhqReNcw=;
	b=vO70sLGQtaUlm8emguan+husT3nDfAI9PPN6WhyMUC8RscJMbSEOAD5qTBDjxrHYkR
	ZpYyNi07AkxKWLd0wG5zEm2u6jxfOcIbB0Uw8XXthisHrsr4vRQj6xq6qYN8pepxKTbY
	phiecmTeQ0yJFnncJv9HYXCYBBzlMJPkJKcl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=plShkZ75G8TxOd/9hee7wm3OR2prbtIhE2GpiJ4k56oa6r3mE/fuU6S5Amp8l4f3FA
	mVzcasYi4O8PsIPkFEq25WdeJbhP25MGaRSZsLloRMehkix+Zj4C5GdtNI2jXVvNrqtt
	lV+uD90RCrSmRM9FYxfZdkgz3kdSUunzb/9ng=
Received: by 10.236.18.106 with SMTP id k70mr6859705yhk.203.1304872920849;
	Sun, 08 May 2011 09:42:00 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:30 +0000
Message-Id: <1304872895-21596-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 06/11] p910nd: add version 0.95
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
X-List-Received-Date: Sun, 08 May 2011 16:44:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/p910nd/files/p910nd.init |   31 ++++++++++++++++++++++
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb    |   29 ++++++++++++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb

diff --git a/meta-oe/recipes-support/p910nd/files/p910nd.init b/meta-oe/recipes-support/p910nd/files/p910nd.init
new file mode 100755
index 0000000..a19c09e
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/files/p910nd.init
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+test -f /usr/sbin/p910nd || exit 0
+
+test -d /var/spool/p910nd || mkdir -p /var/spool/p910nd
+
+case "$1" in
+  start)
+    echo -n "Starting p910nd printer daemon: p910nd"
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+   echo "."
+    ;;
+  restart)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+    sleep 2
+    echo -n " ... Starting p910nd printer daemon: p910nd " 
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/p910nd {start|stop|restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
new file mode 100644
index 0000000..ee43a59
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer"
+HOMEPAGE = "http://p910nd.sourceforge.net/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "defaults 60 "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+           file://p910nd.init"
+
+SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
+SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
+
+do_compile () {
+	${CC} ${LDFLAGS} -o p910nd p910nd.c
+}
+
+# The avahi stuff makes it work with bonjour printing
+do_install () {
+	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
+	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
+}
-- 
1.7.2.5



