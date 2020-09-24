Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.18745.1600959047321952839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 07:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=Sc0+Y/fP;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id j2so4130375wrx.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmFK17DwHSVIrfsAbqXmED63MhauB0lXJjsj0JupZOA=;
        b=Sc0+Y/fPADYuSgtIl3T9V/rUpxI59utfrf8E6uc87GlUDx+XMJuPG9kosOy2YWuwAK
         5T0bJIcTvlIaM0Y1dzKi70D6PF98NFPGZqk0+Wvpib8qI+M31TOD7Qn90eZgo8aPtkMc
         jnaMD9CSFlHoFz0t0ZXET03be3Hi6cB4bn5uhbCaA+9E4nuZZF4wzFmcGpaaX/cUSIa0
         Zkkgn5P9MvV7xq2tifT5KpFVk+8WpOYialaJfJW5IecC+WZbv+tRLYT9N0nKleOF+Rbr
         dqpb/uY6BjCHsThwkfscdz/D7JqDEkNM/zoPD/PEogKFtgGJRm25Ni+n2zEkw6i5iqYq
         r2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmFK17DwHSVIrfsAbqXmED63MhauB0lXJjsj0JupZOA=;
        b=oI3rVS7s3qwtSChG4BKf0PimisC1c1FL+4xD74cYkqeypAyilOAEEPaC3f3rfbK3tG
         lamTlZTav3TpOMLqGDRJF0NGupVDgoJxLnh6Vv84+oLndU82iOBV90/ivXI2ITVPzMbi
         Zh23uSF5zbYl7MUiMpkXsVF0cY6I+ciSH9Ma4eKjk9Gtal7DtNW7nSru6GlJomLr641t
         msCInHCppb/StCdQWG6YNOIOcfEAKJsW2jODHDpYuRYaexvKX7WYkE8TiKtKSwfnfCWh
         Qhifuj9KpwRPHf1Do2ygmoxYYNInvEsXDyrQN95Dd8Lfmb1RWfJPuoCe6WzyFRK4u3Ym
         /6cQ==
X-Gm-Message-State: AOAM531weHAKebOfydo+LiMeRkVyMeZodU1TDvGJTwn0q+iRkNRTt/Rj
	mQZk9k6SZzJ3N0Qx8N8HHvvMfaya7TA7qA==
X-Google-Smtp-Source: ABdhPJwvgYudWOCVNZ/TN/FwnF4lQiMQLumlRMouFf+/bjdaWTWMzG+ggioaoxLeMqDdYs05Lb2ZIA==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr138200wrq.59.1600959045473;
        Thu, 24 Sep 2020 07:50:45 -0700 (PDT)
Return-Path: <romain.naour@smile.fr>
Received: from P-ASN-Evian.nantes.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id n3sm3568910wmn.28.2020.09.24.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 07:50:44 -0700 (PDT)
From: romain.naour@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@smile.fr>
Subject: [PATCH] libiec61850: add recipe for libiec61850
Date: Thu, 24 Sep 2020 16:50:42 +0200
Message-Id: <20200924145042.1189-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IEC 61850 is an international standard for communication systems in
Substation Automation Systems (SAS) and management of Decentralized
Energy Resources (DER). It is seen as one of the communication
standards of the emerging Smart Grid.

Add two upstream patch fixing build issues with musl libc.

Enable the libiec61850 python binding (pyiec61850) that require a fix
to find the correct PYTHON_SITE_DIR path while cross-compiling.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...001-use-poll.h-instead-of-sys-poll.h.patch | 33 ++++++++++++++++
 ...linux-Add-missing-include-sys-time.h.patch | 32 +++++++++++++++
 ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 37 ++++++++++++++++++
 .../libiec61850/libiec61850_1.4.2.1.bb        | 39 +++++++++++++++++++
 4 files changed, 141 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 000000000..a04473d21
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,33 @@
+From 4cad505fc98240eb66eaabfae61a9694f8158dda Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Apr 2020 20:58:37 +0200
+Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
+
+The manpage of poll(2) states that the prototype of poll is defined
+in <poll.h>. Use that header file instead of <sys/poll.h> to allow
+compilation against musl-libc.
+
+Upstream status: Pending
+https://github.com/mz-automation/libiec61850/pull/228
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hal/ethernet/linux/ethernet_linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hal/ethernet/linux/ethernet_linux.c b/hal/ethernet/linux/ethernet_linux.c
+index c3ab2e2..9aa5c28 100644
+--- a/hal/ethernet/linux/ethernet_linux.c
++++ b/hal/ethernet/linux/ethernet_linux.c
+@@ -23,7 +23,7 @@
+ 
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <linux/if_packet.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_arp.h>
+-- 
+2.21.1
+
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch b/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
new file mode 100644
index 000000000..e1b8ca15b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
@@ -0,0 +1,32 @@
+From 661405eb6066b67dfe51d5ff9635e29f86bdd238 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Apr 2020 21:02:54 +0200
+Subject: [PATCH] serial_port_linux: Add missing include sys/time.h
+
+POSIX says `struct timeval` is defined if <sys/time.h> is included.
+
+Adding this header allow to build against musl-libc.
+
+Upstream status: Pending
+https://github.com/mz-automation/libiec61850/pull/228
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hal/serial/linux/serial_port_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hal/serial/linux/serial_port_linux.c b/hal/serial/linux/serial_port_linux.c
+index e6308c0..15e5794 100644
+--- a/hal/serial/linux/serial_port_linux.c
++++ b/hal/serial/linux/serial_port_linux.c
+@@ -29,6 +29,7 @@
+ #include <termios.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <sys/time.h>
+ 
+ #include "hal_serial.h"
+ #include "hal_time.h"
+-- 
+2.21.1
+
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
new file mode 100644
index 000000000..65567610b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
@@ -0,0 +1,37 @@
+From 89f326a427c7ad13c115e2d3f2ac27807aa5a795 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Fri, 10 Jul 2020 17:08:34 +0200
+Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
+ python modules install path (site-packages)
+
+https://stackoverflow.com/questions/1242904/finding-python-site-packages-directory-with-cmake
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ pyiec61850/CMakeLists.txt | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
+index 159ef4b..d1732a1 100644
+--- a/pyiec61850/CMakeLists.txt
++++ b/pyiec61850/CMakeLists.txt
+@@ -31,14 +31,7 @@ endif()
+ 
+ swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
+ 
+-# Finding python modules install path
+-execute_process(
+-	COMMAND ${PYTHON_EXECUTABLE} -c
+-	"from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())"
+-	OUTPUT_VARIABLE PYTHON_SITE_DIR
+-)
+-
+-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${PYTHON_SITE_DIR})
+-install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
++install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
+ 
+ add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
+-- 
+2.21.3
+
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb
new file mode 100644
index 000000000..18cb0cd8e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Open source iec61850 implementation"
+DESCRIPTION = "IEC 61850 is an international standard for \
+communication systems in Substation Automation Systems \
+(SAS) and management of Decentralized Energy Resources \
+(DER). It is seen as one of the communication standards \
+of the emerging Smart Grid. \
+The project libIEC61850 provides a server and client \
+library for the IEC 61850/MMS, IEC 61850/GOOSE and IEC \
+61850-9-2/Sampled Values communication protocols \
+written in C. It is available under the GPLv3 license."
+HOMEPAGE = "http://libiec61850.com"
+SECTION = "console/network"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "swig-native python3"
+SRCREV = "d798814fb463115a835da597535a625b68a39cff"
+
+SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.4 \
+           file://0001-use-poll.h-instead-of-sys-poll.h.patch \
+           file://0002-serial_port_linux-Add-missing-include-sys-time.h.patch \
+           file://0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig python3-dir python3native siteinfo
+
+EXTRA_OECMAKE = " \
+    -DBUILD_EXAMPLES=OFF \
+    -DBUILD_PYTHON_BINDINGS=ON \
+"
+
+RDEPENDS_${PN}-python = " python3-core "
+RDEPENDS_${PN} = " python3-core "
+
+FILES_${PN} += " \
+    ${libdir}/${PYTHON_DIR}/site-packages/iec61850.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/_iec61850.so \
+"
-- 
2.21.3

