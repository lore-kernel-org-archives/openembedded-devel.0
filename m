Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA73770F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 05:05:59 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so51225115pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 21:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ga6Z/MyTaEbVhNLK8Z1UwB8lpxyVyYbsogd0empXzek=;
	b=uTHV5o204G082oNEBYVos3g5JTv9eBgUJKJdECMt2ShTGWmjRhqrZiPs8WsvV7Bgxo
	4FjbBensQxpYhFJAY5Iua/+4cvXlQruBlz5KlyAfzmA6MF0Phfy4PAnmcDMMf8fKCM43
	cqvkDtB8YvJxUapflHdR/Qai5a6DFMGCF7V9t8OSKuQgQtP8kr3TwHrk9C34cm1C3hfQ
	4+kZrNwKP3prQWKafdXikUM6JJMwBCvHUPfI7L8iNGt6JT/D3JL5QFwSPJ5/hUwjxUdk
	P9sCSvRtrKx3NiALDYIVxPfgpawvielJ/+qYIFeQwK0JvEYio3GdG+gjTnXEUO7yBiOK
	UT6g==
X-Received: by 10.66.172.144 with SMTP id bc16mr6876460pac.114.1446699959571; 
	Wed, 04 Nov 2015 21:05:59 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	d13sm5181531pbu.20.2015.11.04.21.05.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 21:05:59 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 23:05:55 -0600
Message-Id: <1446699955-7624-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446699955-7624-1-git-send-email-danismostlikely@gmail.com>
References: <1446699955-7624-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-python][PATCH v2 2/2] gateone: update to latest git
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
X-List-Received-Date: Thu, 05 Nov 2015 05:05:59 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

This version works with pyton-tornado 4.2 as currently distributed
with OE.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...on.py-Hack-around-broken-gethostname-thin.patch | 26 ----------------------
 .../gateone/gateone/{80oe.conf => 80oe.conf.in}    |  5 +++--
 .../gateone/{gateone-init => gateone-init.in}      |  8 +++----
 .../{gateone.service => gateone.service.in}        |  6 ++---
 .../recipes-connectivity/gateone/gateone_git.bb    | 22 +++++++++++-------
 5 files changed, 24 insertions(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
 rename meta-python/recipes-connectivity/gateone/gateone/{80oe.conf => 80oe.conf.in} (81%)
 rename meta-python/recipes-connectivity/gateone/gateone/{gateone-init => gateone-init.in} (85%)
 rename meta-python/recipes-connectivity/gateone/gateone/{gateone.service => gateone.service.in} (38%)

diff --git a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch b/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
deleted file mode 100644
index 5f5fa91..0000000
--- a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d811d3bdf06d78c93c48bef762c19c392c879077 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 26 Nov 2013 15:54:10 +0100
-Subject: [PATCH] configuration.py: Hack around broken gethostname thingy
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- gateone/core/configuration.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gateone/core/configuration.py b/gateone/core/configuration.py
-index da41cbd..d1c8222 100644
---- a/gateone/core/configuration.py
-+++ b/gateone/core/configuration.py
-@@ -162,7 +162,7 @@ def define_options(installed=True):
-     ]
-     # Used both http and https above to demonstrate that both are acceptable
-     try:
--        additional_origins = socket.gethostbyname_ex(socket.gethostname())
-+        additional_origins = [] # additional_origins = socket.gethostbyname_ex(socket.gethostname())
-     except socket.gaierror:
-         # Couldn't get any IPs from the hostname
-         additional_origins = []
--- 
-1.8.4.2
-
diff --git a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
similarity index 81%
rename from meta-python/recipes-connectivity/gateone/gateone/80oe.conf
rename to meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
index cde98bc..4503da4 100644
--- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
+++ b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
@@ -2,13 +2,14 @@
 {
     "*": {
         "gateone": { // These settings apply to all of Gate One
+            "log_file_prefix": "@localstate@/log/gateone.log", // default would be /var/log/gateone/gateone.log
             "log_file_max_size": 5242880, // 5 megabyte logs for OE by default (default would normally be 100Mb)
             "log_file_num_backups": 2, // Default is normally 10
             "origins": ["*"], // Every device has a unique origin
             "logging": "info",
-            "pid_file": "/var/run/gateone.pid",
+            "pid_file": "/run/gateone.pid",
             "session_dir": "/tmp/gateone",
-            "user_dir": "/var/lib/gateone/users"
+            "user_dir": "@localstate@/lib/gateone/users"
         },
         "terminal": {
             // Disabling session logging for embedded devices is a good idea (limited/slow storage)
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone-init b/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
similarity index 85%
rename from meta-python/recipes-connectivity/gateone/gateone/gateone-init
rename to meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
index a1cf5ce..86d655c 100644
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone-init
+++ b/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
@@ -11,13 +11,13 @@
 . /etc/init.d/functions
 
 NAME=gateone
-DAEMON=/var/lib/gateone/gateone.py
-PIDFILE=/var/run/gateone.pid
-WORKDIR=/var/lib/gateone
+DAEMON=@bindir@/gateone
+PIDFILE=/run/gateone.pid
+WORKDIR=@localstate@/lib/gateone
 
 do_start() {
     cd $WORKDIR
-    /usr/bin/python $DAEMON > /dev/null 2>&1 &
+    @bindir@/python $DAEMON > /dev/null 2>&1 &
     cd $OLDPWD
 }
 
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone.service b/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
similarity index 38%
rename from meta-python/recipes-connectivity/gateone/gateone/gateone.service
rename to meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
index 7b14d3e..4466727 100644
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone.service
+++ b/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
@@ -1,10 +1,10 @@
 [Unit]
 Description=GateOne daemon
-ConditionPathExists=|/var/lib/gateone
+ConditionPathExists=|@localstate@/lib/gateone
 
 [Service]
-WorkingDirectory=/var/lib/gateone
-ExecStart=/usr/bin/python /usr/bin/gateone
+WorkingDirectory=@localstate@/lib/gateone
+ExecStart=@bindir@/python @bindir@/gateone
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 7eae12a..5ff753e 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -3,14 +3,13 @@ LICENSE = "AGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
 HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
 
-PV = "1.2"
-SRCREV = "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
-SRC_URI = "git://github.com/liftoff/GateOne.git \
-           file://0001-configuration.py-Hack-around-broken-gethostname-thin.patch \
+PV = "1.2+git${SRCPV}"
+SRCREV = "f7a9be46cb90f57459ebd363d24702de0e651034"
+SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
            file://gateone-avahi.service \
-           file://80oe.conf \
-           file://gateone.service \
-           file://gateone-init \
+           file://80oe.conf.in \
+           file://gateone.service.in \
+           file://gateone-init.in \
 "
 
 S = "${WORKDIR}/git"
@@ -28,7 +27,12 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
 do_install_append() {
 
     # fix up hardcoded paths
-    sed -i -e s:/usr/bin:${bindir}:g ${WORKDIR}/gateone.service
+    for file in gateone.service gateone-init 80oe.conf; do
+        sed -e s:@bindir@:${bindir}:g \
+            -e s:@localstate@:${localstatedir}:g \
+            < ${WORKDIR}/$file.in \
+            > ${WORKDIR}/$file
+    done
     
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
@@ -49,6 +53,7 @@ FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYT
 RDEPENDS_${PN} = "mime-support \
                   openssh-ssh \
                   python-compression \
+                  python-contextlib \
                   python-crypt \
                   python-datetime \
                   python-email \
@@ -76,6 +81,7 @@ RDEPENDS_${PN} = "mime-support \
                   python-tornado \
                   python-unixadmin \
                   python-xml \
+                  python-html5lib \
                   bash \
 "
 
-- 
2.6.2.11.gb05c2f9


