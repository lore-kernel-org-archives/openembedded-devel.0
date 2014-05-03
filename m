Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id CED1060650
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 09:21:22 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so128819eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 02:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gxQLKPSDcxyDMNGjJdM9+pNsG/g6Hc81o7cu02UsTeY=;
	b=ZbpW/dOzfatFRzUlZxQClEXTxF3Oar/Pvzf3rD7qWVBlNgyeiPMXhbbLX0CqrkQh3O
	KutL3FKduvSd/0hLqHNRyjKxkF6pB36ku4DObkWZ1ekF8YWta+KeGQ9aqOw0fBpZVR7D
	wKgQvFCgn0EWvFHHkUtJfpK1+3A2FFuOjSv7z4QNSAuoK76kkOcPpvqhZpAaZ63T8Ujo
	ATST9v8Jne2KnJq95m9g/3/Z8RmIyUUChtE+L2sR7oehog4np1athSmi1Z1MGG0kv2Kx
	ME8AIPn7+VHy3ptWkrFX+G+kUxcEipjdcGIclYK3SpsNUY6xLfEu8vvG7QXKonyGmLjm
	ATWA==
X-Gm-Message-State: ALoCoQmtLhYarEg2MfzA4+PamQIdop2RDQ/Wzu1rDHlYoOgVtQY5lHHFgM3YyYgRMtPplmsLaK+5
X-Received: by 10.14.211.133 with SMTP id w5mr19708758eeo.5.1399108883758;
	Sat, 03 May 2014 02:21:23 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	w12sm11330632eez.36.2014.05.03.02.21.22 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 03 May 2014 02:21:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 11:19:23 +0200
Message-Id: <1399108763-32032-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gateone: Updated to version 1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 May 2014 09:21:27 -0000

From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>

This new version of Gate One uses a new configuration file format which
means the old server.conf is gone.  It now stores configuration files in
/etc/gateone/conf.d.  The /opt/gateone directory is also gone and
instead the package installs like a regular Python module in
site-packages.  SSL certificates/keys are stored in /etc/gateone/ssl/.

The new version requires python-tornado 3.1.1 (which was submitted
earlier today) and the python-futures package (which was also submitted
today).

An 80oe.conf file has been added specific to OpenEmbedded that replaces
the old pre-configured server.conf functionality.

The old patch that removes the init script checks has been deprecated by
the use of the --skip_init_scripts option which is now being passed to
setup.py.

Lastly, Gate One 1.2 is about twice as fast (benchmarked) as Gate One
1.1 on the Beaglebone platform.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...on.py-Hack-around-broken-gethostname-thin.patch | 26 ++++++++++++++
 .../recipes-connectivity/gateone/gateone/80oe.conf | 23 ++++++++++++
 .../gateone/gateone/gateone.service                |  2 +-
 .../gateone/gateone/server.conf                    |  5 ---
 .../recipes-connectivity/gateone/gateone_git.bb    | 42 ++++++++++++++--------
 5 files changed, 77 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
 create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
 delete mode 100644 meta-oe/recipes-connectivity/gateone/gateone/server.conf

diff --git a/meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch b/meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
new file mode 100644
index 0000000..5f5fa91
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
@@ -0,0 +1,26 @@
+From d811d3bdf06d78c93c48bef762c19c392c879077 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 26 Nov 2013 15:54:10 +0100
+Subject: [PATCH] configuration.py: Hack around broken gethostname thingy
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ gateone/core/configuration.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gateone/core/configuration.py b/gateone/core/configuration.py
+index da41cbd..d1c8222 100644
+--- a/gateone/core/configuration.py
++++ b/gateone/core/configuration.py
+@@ -162,7 +162,7 @@ def define_options(installed=True):
+     ]
+     # Used both http and https above to demonstrate that both are acceptable
+     try:
+-        additional_origins = socket.gethostbyname_ex(socket.gethostname())
++        additional_origins = [] # additional_origins = socket.gethostbyname_ex(socket.gethostname())
+     except socket.gaierror:
+         # Couldn't get any IPs from the hostname
+         additional_origins = []
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf b/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
new file mode 100644
index 0000000..cde98bc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
@@ -0,0 +1,23 @@
+// Some custom Gate One settings for OpenEmbedded
+{
+    "*": {
+        "gateone": { // These settings apply to all of Gate One
+            "log_file_max_size": 5242880, // 5 megabyte logs for OE by default (default would normally be 100Mb)
+            "log_file_num_backups": 2, // Default is normally 10
+            "origins": ["*"], // Every device has a unique origin
+            "logging": "info",
+            "pid_file": "/var/run/gateone.pid",
+            "session_dir": "/tmp/gateone",
+            "user_dir": "/var/lib/gateone/users"
+        },
+        "terminal": {
+            // Disabling session logging for embedded devices is a good idea (limited/slow storage)
+            "session_logging": false,
+            "syslog_session_logging": false
+//             "commands": {
+//                 // For some reason this doesn't work (never asks for the password)
+//                 "login": "setsid /bin/login" // Normally this would emulate logging into the host console
+//             }
+        }
+    }
+}
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone.service b/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
index 7ff6002..7b14d3e 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
+++ b/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
@@ -4,7 +4,7 @@ ConditionPathExists=|/var/lib/gateone
 
 [Service]
 WorkingDirectory=/var/lib/gateone
-ExecStart=/usr/bin/python gateone.py
+ExecStart=/usr/bin/python /usr/bin/gateone
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/server.conf b/meta-oe/recipes-connectivity/gateone/gateone/server.conf
deleted file mode 100644
index 988b0d0..0000000
--- a/meta-oe/recipes-connectivity/gateone/gateone/server.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-session_logging = False
-origins = "*"
-command = "/var/lib/gateone/plugins/ssh/scripts/ssh_connect.py -S '/tmp/gateone/%SESSION%/%SHORT_SOCKET%' --sshfp -a '-oUserKnownHostsFile=%USERDIR%/%USER%/ssh/known_hosts'"
-log_file_prefix = "/var/log/gateone.log"
-
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 0069c26..edc9977 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -1,14 +1,14 @@
 SUMMARY = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
+HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
 
-PR = "r13"
-
-PV = "1.1"
-SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
+PV = "1.2"
+SRCREV = "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
+           file://0001-configuration.py-Hack-around-broken-gethostname-thin.patch \
            file://gateone-avahi.service \
-           file://server.conf \
+           file://80oe.conf \
            file://gateone.service \
            file://gateone-init \
 "
@@ -16,33 +16,44 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
 S = "${WORKDIR}/git"
 
 inherit distutils python-dir systemd update-rc.d
+export prefix = "${localstatedir}"
 
-export prefix = "${localstatedir}/lib"
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${PYTHON_SITEPACKAGES_DIR} \
+    --install-scripts=${bindir} \
+    --skip_init_scripts"
 
 do_install_append() {
-    install -d ${D}${localstatedir}/log/${BPN}
 
-    install -m 0755 -d ${D}${sysconfdir}/avahi/services/
-    install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
-
-    install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
+    # fix up hardcoded paths
+    sed -i -e s:/usr/bin:${bindir}:g ${WORKDIR}/gateone.service
     
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
 
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gateone
+    
+    install -m 0755 -d ${D}${sysconfdir}/avahi/services/
+    install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
+
+    install -m 0755 -d ${D}${sysconfdir}/gateone/conf.d/
+    install -m 0644 ${WORKDIR}/80oe.conf ${D}${sysconfdir}/gateone/conf.d/80oe.conf
+
+    install -d ${D}${localstatedir}/lib/gateone
 }
 
-FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${localstatedir}/volatile/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS_${PN} = "file \
-                  mime-support \
+FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS_${PN} = "mime-support \
                   openssh-ssh \
                   python-compression \
                   python-crypt \
                   python-datetime \
                   python-email \
                   python-fcntl \
+                  python-futures \
                   python-html \
                   python-imaging \
                   python-io \
@@ -55,6 +66,7 @@ RDEPENDS_${PN} = "file \
                   python-pyopenssl \
                   python-re \
                   python-readline \
+                  python-setuptools \
                   python-shell \
                   python-simplejson \
                   python-subprocess \
-- 
1.9.0


