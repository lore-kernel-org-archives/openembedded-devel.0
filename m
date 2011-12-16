Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUbZ-0001qq-7D
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:01:29 +0100
Received: from mail8-db3-R.bigfish.com (10.3.81.242) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 09:39:26 +0000
Received: from mail8-db3 (localhost [127.0.0.1])	by mail8-db3-R.bigfish.com
	(Postfix) with ESMTP id 7EA8C2604F0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:34 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275ch8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail8-db3 (localhost.localdomain [127.0.0.1]) by mail8-db3
	(MessageSwitch) id 1324028374376830_3094;
	Fri, 16 Dec 2011 09:39:34 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.247])	by
	mail8-db3.bigfish.com (Postfix) with ESMTP id 4D49E160043	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 09:39:25 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 16 Dec 2011 03:39:25 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG9dDjl008853;
	Fri, 16 Dec 2011 03:39:24 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 17:41:59 +0800
Message-ID: <1324028520-16474-7-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324028520-16474-1-git-send-email-b19537@freescale.com>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe v2 7/8] rng-tools: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:01:29 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    Random number generator daemo.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/rng-tools/files/default  |    2 +
 meta-oe/recipes-support/rng-tools/files/init     |   49 ++++++++++++++++++++++
 meta-oe/recipes-support/rng-tools/rng-tools_2.bb |   26 +++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/rng-tools/files/default
 create mode 100644 meta-oe/recipes-support/rng-tools/files/init
 create mode 100644 meta-oe/recipes-support/rng-tools/rng-tools_2.bb

diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/recipes-support/rng-tools/files/default
new file mode 100644
index 0000000..ab7cd93
--- /dev/null
+++ b/meta-oe/recipes-support/rng-tools/files/default
@@ -0,0 +1,2 @@
+# Specify rng device
+RNG_DEVICE=/dev/hwrng
diff --git a/meta-oe/recipes-support/rng-tools/files/init b/meta-oe/recipes-support/rng-tools/files/init
new file mode 100644
index 0000000..5fa5959
--- /dev/null
+++ b/meta-oe/recipes-support/rng-tools/files/init
@@ -0,0 +1,49 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/rng-tools and type
+# > update-rc.d rng-tools defaults 60
+#
+
+rngd=/usr/sbin/rngd
+test -x "$rngd" || exit 1
+
+if [ -e /etc/default/rng-tools ]; then
+    . /etc/default/rng-tools
+fi
+
+if [ -n "$RNG_DEVICE" ]; then
+    EXTRA_ARGS="-- -r $RNG_DEVICE"
+fi
+
+
+case "$1" in
+  start)
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    ;;
+  reload|force-reload)
+    echo -n "Signalling rng daemon restart"
+    start-stop-daemon -K -q -s 1 -x $rngd
+    start-stop-daemon -K -q -s 1 -x $rngd
+    ;;
+  restart)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
\ No newline at end of file
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
new file mode 100644
index 0000000..3057ba8
--- /dev/null
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Random number generator daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
+           file://init \
+           file://default"
+
+SRC_URI[md5sum] = "63d503191eabed630324c104cc024475"
+SRC_URI[sha256sum] = "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e"
+
+inherit autotools update-rc.d
+
+do_install_append() {
+        install -d "${D}${sysconfdir}/init.d"
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
+            ${D}${sysconfdir}/init.d/rng-tools
+
+        install -d "${D}${sysconfdir}/default"
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
+}
+
+DEPENDS_append_libc-uclibc = " argp-standalone"
+INITSCRIPT_NAME = "rng-tools"
+INITSCRIPT_PARAMS = "defaults"
-- 
1.7.0.4




