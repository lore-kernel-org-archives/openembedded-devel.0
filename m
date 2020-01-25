Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF817F879
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 10:52:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so5085320wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ciLBRfXLxSpJ2TQWdxVtYohDZO72OumChbxejLCzMrA=;
	b=Hu5Xqb+yk+bsd/QRf1MA+XbMpdJ9fqsHBCD4EMID2dEIDDvFEjotaQ25s8nRf1xarT
	4+NMwwJFgVUVwSaPFx2kZxFtNYLnkOvV5J2AvbphrlUa5b30eOxnH0Z6IMTq0xfNAF92
	//mxMIGJ7tZIqI6T5MBCtsGOFHwasxMT8V5qJe3ygu9CAKLGJbtdh9j2vnBkNhGdgOq9
	MZW9W3GlEErZzsD/oP/on2jcr66Yn2OEjI/SEcJuFoaFWhJDwl7ak1atwblrrztgJc0n
	TqQxwcYm7S+r+iphIpPh9ONySwwKK/eyE14BfbVRr2jq/IGcL4QK8KYwFOLHyGjv/pfS
	F+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ciLBRfXLxSpJ2TQWdxVtYohDZO72OumChbxejLCzMrA=;
	b=Cqs4E0uZbQTeW9lZy2mgBJuobEXmWe3XZEU1tKtjXjbWHxQCIYw8FmYzgYMSjrghgg
	cQdxPmC9bmU94yxD3AsBYS2mURi1pW106A4Z1UzUEVWg10EpDgnY1UzoTnOKMUEVQ4do
	OB+Sixvd0e+VFC8ju8pW5/EvQn6eP0lZ9AuLu+f++whaOEkbcIPpCRCamH6IHI8HCAbL
	cAtUtzOmrXjrrRohqbYAdVEk4wi81ms2ihZ+ydHRhpkNS0aqUpEXh2cnl7FajTDZGW3/
	aLAqAFtFvd/a++OXnIwkenGS8vifsBP0i2vvx1mmPh+nQ6i+nN2LNpXtkYIF9j0ln0xh
	WKMQ==
X-Gm-Message-State: APjAAAXf0N/sWekYa9rpRgTXiqh8iz5hwixS8ceSNkCtlD2VlcgQ/D7p
	+ahCuqhkn7FMi2Cyp7P2QBnu2CxB
X-Google-Smtp-Source: APXvYqzyejTBBqyGOTMRjH8909xDx/V1zh6n88cyf7GPsS/HxN9nmwzhp9uoRccMs+qbx3vY+WcdHQ==
X-Received: by 2002:adf:a41c:: with SMTP id d28mr10430669wra.410.1579949551141;
	Sat, 25 Jan 2020 02:52:31 -0800 (PST)
Received: from localhost.localdomain (mob-31-157-190-238.net.vodafone.it.
	[31.157.190.238])
	by smtp.gmail.com with ESMTPSA id v8sm11093028wrw.2.2020.01.25.02.52.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 02:52:30 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 10:57:52 +0100
Message-Id: <20200125095753.21694-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] dlt-daemon: Add initial recipe from meta-ivi, as of commit 6a5b0d6460028f695c62bd1f0b064207671b2236 with added upstream proposed pull request: https://github.com/GENIVI/meta-ivi/pull/118
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
X-List-Received-Date: Sat, 25 Jan 2020 10:52:31 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

dlt-daemon is useful on embedded systems as a logging system

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...execute-processes-as-a-specific-user.patch |  94 +++++++++++
 ...0004-Modify-systemd-config-directory.patch |  24 +++
 .../dlt-daemon/dlt-daemon/204.patch           | 148 ++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb           |  60 +++++++
 4 files changed, 326 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
new file mode 100644
index 000000000..181be25c7
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
@@ -0,0 +1,94 @@
+From bcca4c99394ba422d03a5e76f2a0023ef248824a Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Tue, 18 Nov 2014 15:47:22 +0100
+Subject: [PATCH 2/4] Don't execute processes as a specific user.
+
+Upstream-Status: Inappropriate [Configuration Specific]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ systemd/dlt-adaptor-udp.service.cmake  | 1 -
+ systemd/dlt-dbus.service.cmake         | 1 -
+ systemd/dlt-example-user.service.cmake | 1 -
+ systemd/dlt-receive.service.cmake      | 1 -
+ systemd/dlt-system.service.cmake       | 1 -
+ systemd/dlt.service.cmake              | 1 -
+ 6 files changed, 6 deletions(-)
+
+diff --git a/systemd/dlt-adaptor-udp.service.cmake b/systemd/dlt-adaptor-udp.service.cmake
+index 8dac1f2..ecf9f9e 100644
+--- a/systemd/dlt-adaptor-udp.service.cmake
++++ b/systemd/dlt-adaptor-udp.service.cmake
+@@ -21,9 +21,8 @@ Wants=dlt.service
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
+index b665742..35009b0 100644
+--- a/systemd/dlt-example-user.service.cmake
++++ b/systemd/dlt-example-user.service.cmake
+@@ -21,6 +21,5 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-example-user "Hallo from GENIVI DLT example user application"
+-LimitCORE=infinity
+\ No newline at end of file
++LimitCORE=infinity
+diff --git a/systemd/dlt-receive.service.cmake b/systemd/dlt-receive.service.cmake
+index c07d447..8f88f00 100644
+--- a/systemd/dlt-receive.service.cmake
++++ b/systemd/dlt-receive.service.cmake
+@@ -22,6 +22,5 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-receive -o /tmp/dlt_receive_log.dlt localhost
+-LimitCORE=infinity
+\ No newline at end of file
++LimitCORE=infinity
+diff --git a/systemd/dlt-system.service.cmake b/systemd/dlt-system.service.cmake
+index 0e91f42..1a5b913 100755
+--- a/systemd/dlt-system.service.cmake
++++ b/systemd/dlt-system.service.cmake
+@@ -22,7 +22,6 @@ Wants=dlt.service
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-system
+ WatchdogSec=@DLT_WatchdogSec@
+ NotifyAccess=main
+diff --git a/systemd/dlt.service.cmake b/systemd/dlt.service.cmake
+index 0b3ee2c..e4753a2 100755
+--- a/systemd/dlt.service.cmake
++++ b/systemd/dlt.service.cmake
+@@ -21,7 +21,6 @@ Documentation=man:dlt-daemon(1) man:dlt.conf(5)
+ 
+ [Service]
+ Type=simple
+-User=@DLT_USER@
+ ExecStart=@CMAKE_INSTALL_PREFIX@/bin/dlt-daemon
+ WatchdogSec=@DLT_WatchdogSec@
+ NotifyAccess=main
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
new file mode 100644
index 000000000..ce028c0c5
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0004-Modify-systemd-config-directory.patch
@@ -0,0 +1,24 @@
+From 9a5e655cf57301008cd61d53c8a410a7f397e650 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Tue, 18 Nov 2014 15:51:30 +0100
+Subject: [PATCH 4/4] Modify systemd config directory
+
+Upstream-Status: Inappropriate [Configuration Specific]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ systemd/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e6b44a2..0e885bf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -201,7 +201,7 @@ if(WITH_SYSTEMD OR WITH_SYSTEMD_WATCHDOG OR WITH_SYSTEMD_JOURNAL)
+ 
+     set(systemd_SRCS ${PROJECT_SOURCE_DIR}/systemd/3rdparty/sd-daemon.c)
+ 
+-    set(SYSTEMD_UNITDIR "${CMAKE_INSTALL_PREFIX}/lib/systemd/system" CACHE PATH
++    set(SYSTEMD_UNITDIR "/lib/systemd/system" CACHE PATH
+         "Set directory to install systemd unit files")
+ 
+     add_subdirectory(systemd)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
new file mode 100644
index 000000000..f0fc0bcb2
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
@@ -0,0 +1,148 @@
+Upstream-Status: Submitted [https://github.com/GENIVI/dlt-daemon/pull/204]
+From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Sat, 25 Jan 2020 09:08:07 +0100
+Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
+ implementation, by adding a missing include for pthread_t reference:
+
+see https://errors.yoctoproject.org/Errors/Details/308000/ for details
+
+Thanks Khem Raj <raj.khem@gmail.com> for the report
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ include/dlt/dlt_user.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
+index 69cb854..766d349 100644
+--- a/include/dlt/dlt_user.h
++++ b/include/dlt/dlt_user.h
+@@ -74,6 +74,7 @@
+  \{
+  */
+ #   include <mqueue.h>
++#   include <pthread.h>
+ 
+ #   if !defined (__WIN32__)
+ #      include <semaphore.h>
+
+From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Sat, 25 Jan 2020 09:16:14 +0100
+Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with strict
+ compiler flags, due to uint being undefined. This is actually an "int" type,
+ looking at the test implementation
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ src/tests/dlt-test-init-free.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-init-free.c
+index 96b5245..35b8803 100644
+--- a/src/tests/dlt-test-init-free.c
++++ b/src/tests/dlt-test-init-free.c
+@@ -32,7 +32,7 @@
+ 
+ void exec(const char *cmd, char *buffer, size_t length);
+ void printMemoryUsage();
+-char *occupyMemory(uint size);
++char *occupyMemory(int size);
+ void do_example_test();
+ void do_dlt_test();
+ 
+@@ -131,7 +131,7 @@ void printMemoryUsage()
+     printf("%s", result);
+ }
+ 
+-char *occupyMemory(uint size)
++char *occupyMemory(int size)
+ {
+     char *buf = (char *)malloc(size * sizeof(char));
+ 
+
+From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Sat, 25 Jan 2020 09:20:48 +0100
+Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include header, now
+ glibc/musl wants poll.h being included directly. This fixes a build failure
+ on musl systems with strict c hardening flags
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
+ src/daemon/dlt_daemon_event_handler.c        | 2 +-
+ src/daemon/dlt_daemon_event_handler.h        | 2 +-
+ src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
+ src/lib/dlt_user.c                           | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/console/logstorage/dlt-logstorage-ctrl.c
+index 525c137..6614f44 100644
+--- a/src/console/logstorage/dlt-logstorage-ctrl.c
++++ b/src/console/logstorage/dlt-logstorage-ctrl.c
+@@ -61,7 +61,7 @@
+ #include <string.h>
+ #include <getopt.h>
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #if defined(__linux__)
+ #   include "sd-daemon.h"
+diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dlt_daemon_event_handler.c
+index 1611f7b..0d463da 100644
+--- a/src/daemon/dlt_daemon_event_handler.c
++++ b/src/daemon/dlt_daemon_event_handler.c
+@@ -30,7 +30,7 @@
+ #include <string.h>
+ #include <errno.h>
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <syslog.h>
+ 
+ #include "dlt_common.h"
+diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dlt_daemon_event_handler.h
+index eb96101..bd550d3 100644
+--- a/src/daemon/dlt_daemon_event_handler.h
++++ b/src/daemon/dlt_daemon_event_handler.h
+@@ -25,7 +25,7 @@
+  * \file dlt_daemon_event_handler.h
+  */
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "dlt_daemon_connection_types.h"
+ #include "dlt_daemon_event_handler_types.h"
+diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/daemon/dlt_daemon_event_handler_types.h
+index 370e503..0b16d08 100644
+--- a/src/daemon/dlt_daemon_event_handler_types.h
++++ b/src/daemon/dlt_daemon_event_handler_types.h
+@@ -25,7 +25,7 @@
+  * \file dlt_daemon_event_handler_types.h
+  */
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "dlt_daemon_connection_types.h"
+ 
+#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
+#index ffa9b09..511f991 100644
+#--- a/src/lib/dlt_user.c
+#+++ b/src/lib/dlt_user.c
+#@@ -43,7 +43,7 @@
+# #include <errno.h>
+# 
+# #include <sys/uio.h> /* writev() */
+#-#include <sys/poll.h>
+#+#include <poll.h>
+# 
+# #include <limits.h>
+# #ifdef linux
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
new file mode 100644
index 000000000..ef4fb6a76
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
@@ -0,0 +1,60 @@
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
+DEPENDS = "zlib gzip-native"
+
+SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
+    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
+    file://0004-Modify-systemd-config-directory.patch \
+    file://204.patch \
+"
+SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES','systemd', d)}"
+# General options
+PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
+
+# Linux options
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[systemd-watchdog] = "-DWITH_SYSTEMD_WATCHDOG=ON,-DWITH_SYSTEMD_WATCHDOG=OFF,systemd,libsystemd"
+PACKAGECONFIG[systemd-journal] = "-DWITH_SYSTEMD_JOURNAL=ON,-DWITH_SYSTEMD_JOURNAL=OFF,systemd,libsystemd"
+PACKAGECONFIG[dlt-dbus] = "-DWITH_DLT_DBUS=ON,-DWITH_DLT_DBUS=OFF,dbus,dbus-lib"
+PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=OFF"
+
+# Command line options
+PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
+PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
+
+inherit autotools gettext cmake systemd
+
+PACKAGES += "${PN}-systemd"
+SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)}"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+SYSTEMD_SERVICE_${PN}-systemd = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples', 'dlt-example-user.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
+"
+SYSTEMD_AUTO_ENABLE_${PN}-systemd = "disable"
+
+FILES_${PN}-doc += "${datadir}/dlt-filetransfer"
+
+do_install_append() {
+    rm -f ${D}${bindir}/dlt-test-*
+}
-- 
2.17.1


