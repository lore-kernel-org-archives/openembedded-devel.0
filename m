Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 558E37FD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 13:43:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q6so2016375wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HtLAtjM5qWmFfjoTLR1iQjNN5aOBOH/6ghKGTzSlgIU=;
	b=tO8i/ZDMEpM2Bv4vZTGsF8uR0ASdqALfoGXZvQDokUH+QVFY+LWqlueCvrXZGc/WSy
	voMrwhssVjdBfsami0YFmrVncnwjLoOX9jvJ4FJMX/SsNod7u/QKPcs7/MfojR884ExB
	cDABmShuBE3sfIbtpxLQj3QdefwTFT8C2XciN07HtMy9sNRAwrLKRRme37u3B7vw+8qS
	JDwdqeOu3nuJcGEq6mlGtWJPFrG2Pbo8DSCxMH1nVKLB1tqXP24/PFgahF+Imuvv+TrM
	PDBeVlpIag+aO0DCKAfxU30IyxNi2AOzRf3Y8Be6YcHqOtDauoQTfICmALXUNeuPGtpk
	y5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HtLAtjM5qWmFfjoTLR1iQjNN5aOBOH/6ghKGTzSlgIU=;
	b=JkiusCGnL4uBmdg5V97KZWiyl6ZajyfG11pq/3levWNeH3HjyLpVHmm7rKRW+vRa+I
	4Utcu3tGbX1Entr6d1SzESQJ9e46Oc443zYZrPC/ry2JoJwpUHKBf/tF5avVRSXzz4lW
	K2p3iKStye4YlPIYjURAgyWozcTCADrlyNFZYtz0lolh55egyNCP1gPBlEPbTUDIf9ka
	wdswde+fgL475SoTTy7VJx+G8/IAqt4IdKlgHzBCaTZAQX+z9UZ4DaFIuyIEViGjh06y
	5gIoYLvSZEB1z5DjET2PaFiZdSyfAn+08fA+0hBH2orTI1AMv/CbmH2we+cHJrX5X/CM
	RBtw==
X-Gm-Message-State: APjAAAVeCAM9AWD8cklwB6g7x1Su/3pj8lUhpAln98J8J3nqEpNIBDIq
	Yr0U5VP+CaDw35m9/bjYo5jKwtRY
X-Google-Smtp-Source: APXvYqz14c9UkhLiZDCqvJgXAURq2z8od17S+V68kBFdyZl0FNeeH27EsabSDijjJusGxur4FszqPQ==
X-Received: by 2002:a5d:4d0e:: with SMTP id z14mr4500973wrt.208.1579873390416; 
	Fri, 24 Jan 2020 05:43:10 -0800 (PST)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:804e:5376:3822:b356])
	by smtp.gmail.com with ESMTPSA id
	z11sm7673048wrt.82.2020.01.24.05.43.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 05:43:09 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 14:43:03 +0100
Message-Id: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] dlt-daemon: add initial recipe based on meta-ivi branch (with lots of changes)
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
X-List-Received-Date: Fri, 24 Jan 2020 13:43:10 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

dlt-daemon is useful on embedded systems as a logging system

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...execute-processes-as-a-specific-user.patch | 95 +++++++++++++++++++
 ...0004-Modify-systemd-config-directory.patch | 25 +++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb           | 48 ++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
 create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
 create mode 100644 meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb

diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
new file mode 100644
index 000000000..7c082297e
--- /dev/null
+++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
@@ -0,0 +1,95 @@
+From 24204fefec474ef001599a14ad669f41b6f28061 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Tue, 18 Nov 2014 15:47:22 +0100
+Subject: [PATCH] Don't execute processes as a specific user.
+
+Upstream-Status: Inappropriate [Configuration Specific]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+
+---
+ systemd/dlt-adaptor-udp.service.cmake  | 3 +--
+ systemd/dlt-dbus.service.cmake         | 1 -
+ systemd/dlt-example-user.service.cmake | 3 +--
+ systemd/dlt-receive.service.cmake      | 3 +--
+ systemd/dlt-system.service.cmake       | 1 -
+ systemd/dlt.service.cmake              | 1 -
+ 6 files changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/systemd/dlt-adaptor-udp.service.cmake b/systemd/dlt-adaptor-udp.service.cmake
+index e06330c..ebf0594 100644
+--- a/systemd/dlt-adaptor-udp.service.cmake
++++ b/systemd/dlt-adaptor-udp.service.cmake
+@@ -19,9 +19,8 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-adaptor-udp -a @DLT_ADAPTOR_UDP_APPID@ -c @DLT_ADAPTOR_UDP_CTID@ -p @DLT_ADAPTOR_UDP_PORT@
+ LimitCORE=infinity
+ 
+ [Install]
+-WantedBy=multi-user.target
+\ No newline at end of file
++WantedBy=multi-user.target
+diff --git a/systemd/dlt-dbus.service.cmake b/systemd/dlt-dbus.service.cmake
+index 9baf3e9..74a7eac 100644
+--- a/systemd/dlt-dbus.service.cmake
++++ b/systemd/dlt-dbus.service.cmake
+@@ -20,7 +20,6 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-dbus
+ WatchdogSec=@DLT_WatchdogSec@
+ NotifyAccess=main
+diff --git a/systemd/dlt-example-user.service.cmake b/systemd/dlt-example-user.service.cmake
+index 2f300ec..b1aef07 100644
+--- a/systemd/dlt-example-user.service.cmake
++++ b/systemd/dlt-example-user.service.cmake
+@@ -19,6 +19,5 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-example-user "Hallo from GENIVI DLT example user application"
+-LimitCORE=infinity
+\ No newline at end of file
++LimitCORE=infinity
+diff --git a/systemd/dlt-receive.service.cmake b/systemd/dlt-receive.service.cmake
+index dd53ab7..a68aad2 100644
+--- a/systemd/dlt-receive.service.cmake
++++ b/systemd/dlt-receive.service.cmake
+@@ -20,6 +20,5 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-receive -o /tmp/dlt_receive_log.dlt localhost
+-LimitCORE=infinity
+\ No newline at end of file
++LimitCORE=infinity
+diff --git a/systemd/dlt-system.service.cmake b/systemd/dlt-system.service.cmake
+index 7dfada0..ef6e319 100755
+--- a/systemd/dlt-system.service.cmake
++++ b/systemd/dlt-system.service.cmake
+@@ -20,7 +20,6 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-system
+ WatchdogSec=@DLT_WatchdogSec@
+ NotifyAccess=main
+diff --git a/systemd/dlt.service.cmake b/systemd/dlt.service.cmake
+index 920c81f..5480cbe 100755
+--- a/systemd/dlt.service.cmake
++++ b/systemd/dlt.service.cmake
+@@ -19,7 +19,6 @@ Documentation=man:dlt-daemon(1) man:dlt.conf(5)
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-daemon
+ WatchdogSec=@DLT_WatchdogSec@
+ NotifyAccess=main
diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
new file mode 100644
index 000000000..4e9e3ce43
--- /dev/null
+++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
@@ -0,0 +1,25 @@
+From 859e566b0ce6f791629704a5786be23489dc573f Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Tue, 18 Nov 2014 15:51:30 +0100
+Subject: [PATCH] Modify systemd config directory
+
+Upstream-Status: Inappropriate [Configuration Specific]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 845d269..52a00ed 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -200,7 +200,7 @@ if(WITH_SYSTEMD OR WITH_SYSTEMD_WATCHDOG OR WITH_SYSTEMD_JOURNAL)
+ 
+     set(systemd_SRCS ${PROJECT_SOURCE_DIR}/systemd/3rdparty/sd-daemon.c)
+ 
+-    set(SYSTEMD_UNITDIR "${CMAKE_INSTALL_PREFIX}/lib/systemd/system" CACHE PATH
++    set(SYSTEMD_UNITDIR "/lib/systemd/system" CACHE PATH
+         "Set directory to install systemd unit files")
+ 
+     add_subdirectory(systemd)
diff --git a/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb
new file mode 100644
index 000000000..de97ad28a
--- /dev/null
+++ b/meta-oe/recipes-devtools/dlt-daemon/dlt-daemon_2.18.4.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Diagnostic Log and Trace"
+DESCRIPTION = "This component provides a standardised log and trace interface, \
+based on the standardised protocol specified in the AUTOSAR standard 4.0 DLT. \
+This component can be used by GENIVI components and other applications as \
+logging facility providing: \
+- the DLT shared library \
+- the DLT daemon, including startup scripts \
+- the DLT daemon adaptors- the DLT client console utilities \
+- the DLT test applications"
+HOMEPAGE = "https://www.genivi.org/"
+SECTION = "console/utils"
+LICENSE = "MPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8184208060df880fe3137b93eb88aeea"
+
+PR = "r2"
+
+DEPENDS = "dbus zlib gzip-native"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES','systemd', d)}"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+
+
+SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
+SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
+    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
+    file://0004-Modify-systemd-config-directory.patch \
+    "
+S = "${WORKDIR}/git"
+
+inherit autotools gettext cmake systemd
+
+PACKAGES += "${PN}-systemd"
+SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "dlt-system.service dlt.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+SYSTEMD_SERVICE_${PN}-systemd = "dlt-example-user.service \
+    dlt-dbus.service \
+    dlt-adaptor-udp.service \
+    dlt-receive.service"
+SYSTEMD_AUTO_ENABLE_${PN}-systemd = "disable"
+
+EXTRA_OECMAKE += "-DWITH_DLT_DBUS=ON -DWITH_DLT_SYSTEM=ON -DWITH_DLT_ADAPTOR=ON"
+
+FILES_${PN}-doc += "/usr/share/dlt-filetransfer"
+
+do_install_append() {
+   rm -f ${D}${bindir}/dlt-test-*
+}
-- 
2.17.1


