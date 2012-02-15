Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kelvin.a.lawson@gmail.com>) id 1RxSxg-0007sU-5n
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 01:43:08 +0100
Received: by obhx4 with SMTP id x4so780826obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 16:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=cS4GY/4JD4K/Z+gFV5xHfM0xK18/38to61l19ADHzmY=;
	b=ToBHKO1uQjj+9H2svc7c2eq95crZ4PkR4BIz0U6WWQFOkQSCfwSnh6puLFtd37mWjc
	+V+vox1iE4UHne58+YNCKYg6kY+XMqrWDXsM2GQ5Bgj0egesAvJIo99qGHDjliLX9aEb
	TrQgFiwn1NHmFYzTOoibRd8o3cfV0nE6tPSbg=
MIME-Version: 1.0
Received: by 10.60.4.106 with SMTP id j10mr1669073oej.47.1329266096491; Tue,
	14 Feb 2012 16:34:56 -0800 (PST)
Sender: kelvin.a.lawson@gmail.com
Received: by 10.182.134.36 with HTTP; Tue, 14 Feb 2012 16:34:56 -0800 (PST)
Date: Wed, 15 Feb 2012 00:34:56 +0000
X-Google-Sender-Auth: RIijN4JEtQ0tSD3sId5vTNxh658
Message-ID: <CAO-TFnG+O4F8-Kiu8DK1SHR3Caz4xF-AJdHZouPrgv6fqw31NA@mail.gmail.com>
From: Kelvin Lawson <kelvinl@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ntpclient: Port 2010_365 recipe from OE Classicntpclient: Port 2010_365 recipe from OE Classic.
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
X-List-Received-Date: Wed, 15 Feb 2012 00:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

 * Also includes a Makefile fix to reorder the linker parameters.
Signed-off-by: Kelvin Lawson <kelvinl@users.sf.net>
---
 meta-oe/recipes-connectivity/ntpclient/files/init  |   42 +++++++++++++++++
 .../ntpclient/files/ntpclient-link.patch           |   12 +++++
 .../ntpclient/ntpclient_2010_365.bb                |   47 ++++++++++++++++++++
 3 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/ntpclient/files/init
 create mode 100644
meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
 create mode 100644 meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb

diff --git a/meta-oe/recipes-connectivity/ntpclient/files/init
b/meta-oe/recipes-connectivity/ntpclient/files/init
new file mode 100644
index 0000000..7b85902
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ntpclient/files/init
@@ -0,0 +1,42 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/ntpclient and type
+# > update-rc.d ntpclient defaults 60
+#
+ntpclient=/sbin/ntpclient
+test -x "$ntpclient" || exit 0
+# Seconds Between Time Checks
+ntpinterval=600
+# Upstream NTP Server Name
+ntpserver=pool.ntp.org
+
+case "$1" in
+  start)
+    echo -n "Starting NTP Client"
+    start-stop-daemon --start --quiet --background --make-pidfile
--pidfile /var/run/ntpclient.pid --exec $ntpclient -- -l -i
$ntpinterval -h $ntpserver
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping NTP Client"
+    start-stop-daemon --stop --quiet --pidfile /var/run/ntpclient.pid
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $ntpclient
+    ;;
+  restart)
+    echo -n "Stopping NTP Client"
+    start-stop-daemon --stop --quiet --pidfile /var/run/ntpclient.pid
+    echo "."
+    sleep 1
+    echo -n "Starting NTP Client"
+    start-stop-daemon --start --quiet --background --make-pidfile
--pidfile /var/run/ntpclient.pid --exec $ntpclient -- -l -i
$ntpinterval -h $ntpserver
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/ntpclient
{start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
b/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
new file mode 100644
index 0000000..b95fc24
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
@@ -0,0 +1,12 @@
+diff -Naur ntpclient-2010/Makefile ntpclient-2010-patched/Makefile
+--- ntpclient-2010/Makefile	2010-12-28 06:26:36.000000000 +0000
++++ ntpclient-2010-patched/Makefile	2012-01-31 00:55:36.000000000 +0000
+@@ -19,7 +19,7 @@
+ CFLAGS += -DENABLE_REPLAY
+ # CFLAGS += -DUSE_OBSOLETE_GETTIMEOFDAY
+
+-LDFLAGS += -lrt
++LDLIBS += -lrt
+
+ all: ntpclient
+
diff --git a/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
b/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
new file mode 100644
index 0000000..0ee7230
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "NTP (RFC-1305) client for unix-alike computers"
+HOMEPAGE = "http://doolittle.icarus.com/ntpclient"
+AUTHOR = "Larry Doolittle <larry@doolittle.boa.org>"
+RDEPENDS_${PN} = "busybox"
+SECTION = "admin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+PR = "r0"
+# The ntpclient package uses version numbers that include an underscore :(
+PV = "2010_365"
+# ntpclient unpacks into a directory that doesn't include version info :(
+S = "${WORKDIR}/${PN}-2010"
+
+SRC_URI = "http://doolittle.icarus.com/ntpclient/ntpclient_${PV}.tar.gz \
+           file://ntpclient-link.patch \
+           file://init \
+          "
+
+INITSCRIPT_NAME = "ntpclient"
+INITSCRIPT_PARAMS = "defaults 65"
+inherit update-rc.d
+
+LDFLAGS += " -lrt "
+
+do_compile() {
+    oe_runmake ntpclient
+    oe_runmake adjtimex
+}
+
+do_install () {
+    # Install the binary and tools
+    install -D -m 0755 ${S}/ntpclient ${D}${base_sbindir}/ntpclient
+    install -D -m 0755 ${S}/adjtimex ${D}${base_sbindir}/adjtimex.${PN}
+    install -D -m 0755 ${S}/rate.awk ${D}${sbindir}/ntpclient-drift-rate.awk
+    install -D -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ntpclient
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${base_sbindir}/adjtimex adjtimex
adjtimex.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove adjtimex adjtimex.${PN}
+}
+
+SRC_URI[md5sum] = "a64689398f2df8933ee0d8da246e9eaa"
+SRC_URI[sha256sum] =
"9ad9b028385082fb804167f464e2db0a0b3d33780acd399327e64898b8fcfddd"
-- 
1.7.1


