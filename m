Return-Path: <offougajoris@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7C26060B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 15:06:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v11so5485108wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 07:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ocZeE+thGErsQfJdquysW9bXeTdXzARYf9x9Jz+ZHuA=;
	b=IBPvyCQ7mkae/JNNoS3VM7VjLTyfx2khMCEKiwg07nXzSjAxZgoo9G+gwlj7Onpc5u
	nQ7odULjNAW6JkASk6uRGSExBbB9wJUT6Bv7Kw0BJ3zxgLlFn4iURKALe+Ddx4/pKp7u
	b0xCnMoJp2hlvDYN7ZBbTGf93DbMhgyFiydInpbT1rwEQQu0L/Wmu4+Hjq76FrqHg2o3
	9o+kqojQg3rjpQwkfD0hjcUo7XH9geto05PLY815cfJRvsYNObONavaREbzfS9tDMxmT
	TEnVe4C6XU6H1iYn/8DH+QilVbenMlwpEQ/eb82HI0hcMXj6qgP7HmcMlU19gvhzCBjG
	bGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ocZeE+thGErsQfJdquysW9bXeTdXzARYf9x9Jz+ZHuA=;
	b=f5lTZAf113FLhEzPd2xW69E3AHsTrJbzP9lcZ2A8HbhFkdrxvQXjRhd72jD9b/J8G5
	uqLXxJr6YYObhOn2hUkrZN/mjIfnDP/9UJegePCrS6TQwyNwYdCe6kDtQC9KLI4JLUoT
	RPynQFu78WZ58p9WJuVtVRP/7oEHkjtC0fobE0BErsrOb7P1sFO851eG93a2lpb1oOQX
	ULLwAjUapJqPr28AxguRvDId6CpOluJIADmSZMbrTQM7Pga6q+IuJZSxOEwMLBwPCvYI
	98/sUyUnJrCS+dcJi1L9NTDcbTMdwNUIEg/6L/TIkHUOW6BquhPw2TSDMDpob2RqRRLF
	jBag==
X-Gm-Message-State: ANhLgQ3Ph/ryPTmFZaMy+HepsPcd+/7B1PczcvSv/GzImZ/VABFTsKi4
	ZqaKtp0Sy8CXYZrUz/aMLDUZsIDQCA4=
X-Google-Smtp-Source: ADFU+vtTJ/fMSBvC4i0LXQyj0DkG51/MppJMjSRSI5aMjZFOcvKqvqfCLlQLtGRlr7x8zoqVNGYImA==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr10684071wru.329.1583420807566;
	Thu, 05 Mar 2020 07:06:47 -0800 (PST)
Received: from XPS-15-7590.home ([2a01:cb19:16b:9900:658e:2ae4:3d5f:17d])
	by smtp.gmail.com with ESMTPSA id f6sm9241504wmh.29.2020.03.05.07.06.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 07:06:46 -0800 (PST)
From: Joris Offouga <offougajoris@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 16:08:09 +0100
Message-Id: <20200305150809.6991-1-offougajoris@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] monit: new package
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
X-List-Received-Date: Thu, 05 Mar 2020 15:06:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 meta-oe/recipes-support/monit/monit/monit     | 42 +++++++++++++++
 meta-oe/recipes-support/monit/monit/monitrc   | 44 +++++++++++++++
 meta-oe/recipes-support/monit/monit_5.26.0.bb | 53 +++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 meta-oe/recipes-support/monit/monit/monit
 create mode 100644 meta-oe/recipes-support/monit/monit/monitrc
 create mode 100644 meta-oe/recipes-support/monit/monit_5.26.0.bb

diff --git a/meta-oe/recipes-support/monit/monit/monit b/meta-oe/recipes-support/monit/monit/monit
new file mode 100644
index 000000000..394704e06
--- /dev/null
+++ b/meta-oe/recipes-support/monit/monit/monit
@@ -0,0 +1,42 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/monit and type
+# > update-rc.d monit defaults 89
+#
+monit=/usr/bin/monit
+pidfile=/var/run/monit.pid
+monit_args="-c /etc/monitrc"
+
+test -x "$monit" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting Monit"
+    start-stop-daemon --start --quiet --exec $monit -- $monit_args
+    RETVAL=$?
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping Monit"
+    start-stop-daemon --stop --quiet --pidfile $pidfile
+    RETVAL=$?
+    echo "."
+    ;;
+  restart)
+    $0 stop
+    $0 start
+    RETVAL=$?
+    ;;
+  status)
+    $monit $monit_args status
+    RETVAL=$?
+    echo "."
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart|status}"
+    exit 1
+esac
+
+exit $RETVAL
+
diff --git a/meta-oe/recipes-support/monit/monit/monitrc b/meta-oe/recipes-support/monit/monit/monitrc
new file mode 100644
index 000000000..f8d6a4388
--- /dev/null
+++ b/meta-oe/recipes-support/monit/monit/monitrc
@@ -0,0 +1,44 @@
+###############################################################################
+## Monit control file
+###############################################################################
+##
+## Comments begin with a '#' and extend through the end of the line. Keywords
+## are case insensitive. All path's MUST BE FULLY QUALIFIED, starting with '/'.
+##
+## Below you will find examples of some frequently used statements. For
+## information about the control file and a complete list of statements and
+## options, please have a look in the Monit manual.
+##
+##
+###############################################################################
+## Global section
+###############################################################################
+##
+## Start Monit in the background (run as a daemon):
+#
+set daemon  30              # check services at 30 seconds intervals
+#   with start delay 240    # optional: delay the first check by 4-minutes (by
+#                           # default Monit check immediately after Monit start)
+#
+#
+## Set syslog logging. If you want to log to a standalone log file instead,
+## specify the full path to the log file
+#
+set log syslog
+
+set httpd port 2812
+    allow 0.0.0.0/0        # allow localhost to connect to the server and
+    allow admin:monit      # require user 'admin' with password 'monit'
+    #with ssl {            # enable SSL/TLS and set path to server certificate
+    #    pemfile: /etc/ssl/certs/monit.pem
+    #}
+
+###############################################################################
+## Includes
+###############################################################################
+##
+## It is possible to include additional configuration parts from other files or
+## directories.
+#
+include /etc/monit.d/*
+
diff --git a/meta-oe/recipes-support/monit/monit_5.26.0.bb b/meta-oe/recipes-support/monit/monit_5.26.0.bb
new file mode 100644
index 000000000..a954682d6
--- /dev/null
+++ b/meta-oe/recipes-support/monit/monit_5.26.0.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Monit is a free open source utility for managing and monitoring, \
+processes, programs, files, directories and filesystems on a UNIX system. \
+Monit conducts automatic maintenance and repair and can execute meaningful \
+causal actions in error situations."
+
+HOMEPAGE = "http://mmonit.com/monit/"
+
+LICENSE = "AGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea116a7defaf0e93b3bb73b2a34a3f51 \
+                    file://libmonit/COPYING;md5=2405f1c59ed1bf3714cebdb40162ce92"
+
+SRC_URI = " \
+	https://mmonit.com/monit/dist/monit-${PV}.tar.gz \
+	file://monit \
+	file://monitrc \
+"
+
+SRC_URI[md5sum] = "9f7dc65e902c103e4c5891354994c3df"
+SRC_URI[sha256sum] = "87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2"
+
+DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
+
+inherit autotools-brokensep systemd update-rc.d
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+
+EXTRA_OECONF = "\
+    libmonit_cv_setjmp_available=no \
+    libmonit_cv_vsnprintf_c99_conformant=no \
+    --with-ssl-lib-dir=${STAGING_LIBDIR} \
+    --with-ssl-incl-dir=${STAGING_INCDIR} \
+"
+
+SYSTEMD_SERVICE_${PN} = "monit.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "monit"
+INITSCRIPT_PARAMS_${PN} = "defaults 89"
+
+do_install_append() {
+
+    # Configuration file
+    install -Dm 0600 ${WORKDIR}/monitrc ${D}${sysconfdir}/monitrc
+
+    # SystemD
+    install -Dm 0644 ${S}/system/startup/monit.service.in ${D}${systemd_system_unitdir}/monit.service
+    sed -i -e 's,@prefix@,${exec_prefix},g' ${D}${systemd_unitdir}/system/monit.service
+
+    # SysV
+    install -Dm 0755 ${WORKDIR}/monit ${D}${sysconfdir}/init.d/monit
+}
-- 
2.20.1


