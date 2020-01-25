Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2717FD97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 09:00:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t23so1820095wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 01:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4/LsiZSvD/UsC7qBFBGZTY5p7+Pg0rOcEo0D7QKLH9I=;
	b=N3c11gPh5C8v8r4zBWhedhCbKohtPeP2nBje4Axu7ulTwIzsFroytgfhC5sRwJ2Rm2
	hq3Mg2E4z1sNOItW5PPhOWsRxSQaBR6/ZDLZipOiNkDeqn4GsA8/zswFv0EmSKem5t1U
	PiTFSiU3NmCJ8GgVNXGMcTP4TOJNgcVanFFmZGadoY1LIDyHepqS2G/Da8JFPg4FLy4F
	1Ju0prB0CK59r663SsyAIpJ2W7gnjIfuYkR0qvTwhlW8to38iV1mNNinFZ+A3kdzs96+
	NkTSrngxSrku+iqTrLV7fChGSts78Xg9udN0q484nrIfkOE6cXcrlKANqKfDwm/0NU56
	e4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4/LsiZSvD/UsC7qBFBGZTY5p7+Pg0rOcEo0D7QKLH9I=;
	b=doGB4ajWzT5Nqa306mXUgkBn1NpIDqI8ct6ZAQjxjkpM+hXxBkuXZj86syT6ViyTT2
	VH0IBcpbDjWCLb2mWaegv/FiS0L8ITA6rboIKLplv4yJkfZvCm2MoTWdhtNrwl3mc3PN
	30grRO0Sdf52rWYNTx3Bxo3yI1pYrgyKqDgQogcGM8UYdFzHNAb6swdsL3YOuNSChuWO
	JmQrWJydar52/b3R04sN7JoZDJzKn4zxFfZI+4vpwtCayyjTsJiQSBj0y+adenuxe4T8
	xu6goYAal2EBBtxB6CFzTnjDLTktQdrgP5K/gd93hOJcdASplXN2JRYzekS2N80sIfx1
	fpvA==
X-Gm-Message-State: APjAAAWT4Vfzt7PAhIwYKCJRhAut2JfyAqQpdObQTqhQj99WWK2ujMpw
	Or09O1AB2XAnKH4EjFsuupq/rYfZ
X-Google-Smtp-Source: APXvYqz0DFDPWcOqUhhjpU+I+fM4VSLkUEXMTIpFsVhbZvN6/lqvcX+lMox/7iK1oLHSH3EBNH1VMA==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
	18mr3538733wmg.21.1579942808596; 
	Sat, 25 Jan 2020 01:00:08 -0800 (PST)
Received: from localhost.localdomain (mob-31-157-190-238.net.vodafone.it.
	[31.157.190.238]) by smtp.gmail.com with ESMTPSA id
	b137sm10606946wme.26.2020.01.25.01.00.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 01:00:07 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 10:00:02 +0100
Message-Id: <20200125090002.10399-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125090002.10399-1-costamagnagianfranco@yahoo.it>
References: <20200125090002.10399-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/2] dlt-daemon: Add initial recipe from meta-ivi, as of commit 6a5b0d6460028f695c62bd1f0b064207671b2236 with added upstream proposed pull request: https://github.com/GENIVI/meta-ivi/pull/118
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
X-List-Received-Date: Sat, 25 Jan 2020 09:00:09 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

dlt-daemon is useful on embedded systems as a logging system

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...execute-processes-as-a-specific-user.patch |  94 +++++++++++
 ...0004-Modify-systemd-config-directory.patch |  24 +++
 .../dlt-daemon/dlt-daemon/204.patch           | 148 ++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb           |  61 ++++++++
 4 files changed, 327 insertions(+)
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
index 000000000..a3b387a4c
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
@@ -0,0 +1,61 @@
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
+SRC_URI = "https://github.com/GENIVI/dlt-daemon/archive/v${PV}.tar.gz \
+    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
+    file://0004-Modify-systemd-config-directory.patch \
+    file://204.patch \
+"
+SRC_URI[md5sum] = "691c10b56857183d9a88023e18964211"
+SRC_URI[sha256sum] = "6bd2bd4e9157e459a4ac7429f9e19cdefd5705fd1358fcf33423b6b4b8b54ac5"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+PACKAGECONFIG ??= "systemd"
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


