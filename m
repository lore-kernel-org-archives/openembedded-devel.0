Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3bq9-0007FD-V3 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 01:29:22 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3bb2-0002pt-Hn for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 01:13:40 +0100
Received: from tfitzsim-lnx.cisco.com ([161.44.225.6])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 01:13:40 +0100
Received: from fitzsim by tfitzsim-lnx.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 01:13:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Thomas Fitzsimmons <fitzsim@cisco.com>
Date: Thu, 07 Feb 2013 19:13:09 -0500
Message-ID: <e425121552c4f8f14eba88f9b43bc351352589eb.1360262057.git.fitzsim@cisco.com>
References: <cover.1360262057.git.fitzsim@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: tfitzsim-lnx.cisco.com
In-Reply-To: <cover.1360262057.git.fitzsim@cisco.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1.50 (gnu/linux)
Cancel-Lock: sha1:vuoQ4qcZIMqAEA+5c96l8AnvZZc=
Subject: [meta-oe][PATCH 1/2] lmsensors-config: Initial commit
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
X-List-Received-Date: Fri, 08 Feb 2013 00:29:22 -0000
Content-Type: text/plain


lmsensors-config provides lmsensors configuration files.  The main lmsensors
recipe provides machine-independent parts of lmsensors, while this recipe
allows configuration files to be machine-specific.

The packages consist of:
* lmsensors-config-libsensors: libsensors configuration file
* lmsensors-config-sensord: sensord logging daemon configuration files
* lmsensors-config-fancontrol: fancontrol script configuration file

Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
---
 .../recipes-support/lm_sensors/files/fancontrol    |    2 -
 .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ----
 .../recipes-support/lm_sensors/files/sensord.conf  |   16 ------
 .../recipes-support/lm_sensors/files/sensors.conf  |    2 -
 .../lm_sensors/lmsensors-config/fancontrol         |    2 +
 .../lm_sensors/lmsensors-config/sensord.cgi        |   10 ++++
 .../lm_sensors/lmsensors-config/sensord.conf       |   16 ++++++
 .../lm_sensors/lmsensors-config/sensors.conf       |    2 +
 .../lm_sensors/lmsensors-config_1.0.bb             |   50 ++++++++++++++++++++
 9 files changed, 80 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
 delete mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb

diff --git a/meta-oe/recipes-support/lm_sensors/files/fancontrol b/meta-oe/recipes-support/lm_sensors/files/fancontrol
deleted file mode 100644
index 1f03a2b..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/fancontrol
+++ /dev/null
@@ -1,2 +0,0 @@
-# fancontrol configuration file.
-# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.cgi b/meta-oe/recipes-support/lm_sensors/files/sensord.cgi
deleted file mode 100644
index b1aad05..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/sensord.cgi
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/usr/bin/rrdcgi
-
-<html>
-<head>
-<title>sensord</title>
-</head>
-<body>
-Generate a valid sensord.cgi script and install it in your BSP.
-</body>
-</html>
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensord.conf b/meta-oe/recipes-support/lm_sensors/files/sensord.conf
deleted file mode 100644
index 6b48cf6..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/sensord.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-# Default sensord configuration file
-# Syntax: sensord {options} {chips}
-# -i, --interval <time>     -- interval between scanning alarms (default 60s)
-# -l, --log-interval <time> -- interval between logging sensors (default 30m)
-# -t, --rrd-interval <time> -- interval between updating RRD file (default 5m)
-# -T, --rrd-no-average      -- switch RRD in non-average mode
-# -r, --rrd-file <file>     -- RRD file (default <none>)
-# -c, --config-file <file>  -- configuration file
-# -p, --pid-file <file>     -- PID file (default /var/run/sensord.pid)
-# -f, --syslog-facility <f> -- syslog facility to use (default local4)
-# -g, --rrd-cgi <img-dir>   -- output an RRD CGI script and exit
-# -a, --load-average        -- include load average in RRD file
-# -d, --debug               -- display some debug information
-# -v, --version             -- display version and exit
-# -h, --help                -- display help and exit
-SENSORD_ARGS="-i60s -l30m -t1m -r/var/lib/sensord.rrd -a"
diff --git a/meta-oe/recipes-support/lm_sensors/files/sensors.conf b/meta-oe/recipes-support/lm_sensors/files/sensors.conf
deleted file mode 100644
index bb8c93d..0000000
--- a/meta-oe/recipes-support/lm_sensors/files/sensors.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-# sensors configuration file.
-# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol b/meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol
new file mode 100644
index 0000000..1f03a2b
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol
@@ -0,0 +1,2 @@
+# fancontrol configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi
new file mode 100644
index 0000000..b1aad05
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi
@@ -0,0 +1,10 @@
+#!/usr/bin/rrdcgi
+
+<html>
+<head>
+<title>sensord</title>
+</head>
+<body>
+Generate a valid sensord.cgi script and install it in your BSP.
+</body>
+</html>
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf
new file mode 100644
index 0000000..6b48cf6
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf
@@ -0,0 +1,16 @@
+# Default sensord configuration file
+# Syntax: sensord {options} {chips}
+# -i, --interval <time>     -- interval between scanning alarms (default 60s)
+# -l, --log-interval <time> -- interval between logging sensors (default 30m)
+# -t, --rrd-interval <time> -- interval between updating RRD file (default 5m)
+# -T, --rrd-no-average      -- switch RRD in non-average mode
+# -r, --rrd-file <file>     -- RRD file (default <none>)
+# -c, --config-file <file>  -- configuration file
+# -p, --pid-file <file>     -- PID file (default /var/run/sensord.pid)
+# -f, --syslog-facility <f> -- syslog facility to use (default local4)
+# -g, --rrd-cgi <img-dir>   -- output an RRD CGI script and exit
+# -a, --load-average        -- include load average in RRD file
+# -d, --debug               -- display some debug information
+# -v, --version             -- display version and exit
+# -h, --help                -- display help and exit
+SENSORD_ARGS="-i60s -l30m -t1m -r/var/lib/sensord.rrd -a"
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf
new file mode 100644
index 0000000..bb8c93d
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf
@@ -0,0 +1,2 @@
+# sensors configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
new file mode 100644
index 0000000..058ae1b
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -0,0 +1,50 @@
+SUMMARY = "lm_sensors configuration files"
+DESCRIPTION = "Hardware health monitoring configuration files"
+HOMEPAGE = "http://www.lm-sensors.org/"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "file://fancontrol \
+           file://sensord.cgi \
+           file://sensord.conf \
+           file://sensors.conf \
+"
+
+do_install() {
+    # Install fancontrol configuration file
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
+
+    # Install libsensors configuration file
+    install -d ${D}${sysconfdir}/sensors.d
+    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
+
+    # Install sensord configuration file
+    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
+
+    # Install sensord.cgi script and create world-writable
+    # web-accessible sensord directory
+    install -d ${D}/www/pages/cgi-bin
+    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
+    install -d -m a=rwxs ${D}/www/pages/sensord
+}
+
+# libsensors configuration
+PACKAGES =+ "${PN}-libsensors"
+
+# sensord logging daemon configuration
+PACKAGES =+ "${PN}-sensord"
+
+# fancontrol script configuration
+PACKAGES =+ "${PN}-fancontrol"
+
+# libsensors configuration file
+FILES_${PN}-libsensors = "${sysconfdir}/sensors.d/sensors.conf"
+
+# sensord logging daemon configuration files
+FILES_${PN}-sensord = "${sysconfdir}/sensord.conf /www/*"
+
+# fancontrol script configuration file
+FILES_${PN}-fancontrol = "${sysconfdir}/fancontrol"
-- 
1.6.0.6




