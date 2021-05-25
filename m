Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.11295.1621955701524804519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 08:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=kLhk+AU+;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id n4so6719953wrw.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0X+WK79RJZnAdrQA2A1kRM1oAuOZspLF9Q4XSXTWzk=;
        b=kLhk+AU+BvPgULKrCeiWloCKDhQgTBctfuIkWuyeb+aGgCw9ZhwYZlSoLFs5R2aKS1
         RKON0xlnz1+gEqXmDBY2e/dHMPBBOzT0Zq88E3gHKiW0a6qYwFlkCsFm/gEF8hOMVti9
         min8dAPGt8MFWZmevCgdqxc2kuWloqZFuTxKa9YPs7THxxGFQ7v2RfJAKpfm3deXe651
         Qo+ETyxp86iSrIe/LaV+Nnh9dXsY1e5XCyolB+MTeeHcPNxjBFd9wsz6Sdlsqu0hHzum
         +hGK8sHYvrStvHKKmBzxISTkSAYqWoI6pH3jreJvKmj6+llWjHx46NQQRJ715G88oiJG
         xzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0X+WK79RJZnAdrQA2A1kRM1oAuOZspLF9Q4XSXTWzk=;
        b=uGe7uRTUgYUnkQr8ayX4s7SjqHoAg6e2RVQIkRu0c9MNuUZzBj/Bv7DWN3KT+nT6ur
         rgicIJua0a3EOP5EojjjY3swt1YfOYkyVrdctcWjxZ+lfXBB6YgWN0QoZkdV+2U1gyGt
         XPojAa58DFJaRMFGPzyMGEWPVTEKVbMOtkco41W5lVRaaNtwIUJ+ezL3lQjisMvIzOrA
         mDfvbJ76h7BDqKZ5F90s7eUxUhj9fO3YoGQbGjSqT+ZIVircxlbbC4VgpweqAyGhKwQJ
         nz3UcFsYJdGSQh7wX3FIXuX5R1v7HdQCJlbAIqeHpIS6rkmhPh+05X8BNVEKYzJAhVid
         acjQ==
X-Gm-Message-State: AOAM531NKf5qqs2f9Q6Wb2OetgM9WlQxaYVykuw6kAJ1ZL5q+NA/BM0J
	TslOE2yfZwBM2imy0zyY5UqT0+EfT3GFaw==
X-Google-Smtp-Source: ABdhPJzPeBkFe2RjakmBO3mEQemc6CcPSPgd/i8dohgwIjjZ65KVC6Tx7H6qumKeETLDJHG/tIFmfg==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr27951999wrf.405.1621955699945;
        Tue, 25 May 2021 08:14:59 -0700 (PDT)
Return-Path: <romain.naour@smile.fr>
Received: from P-NTS-Evian.home (2a01cb058f8a180041413d5f65a5e97b.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:4141:3d5f:65a5:e97b])
        by smtp.gmail.com with ESMTPSA id i5sm16868409wrw.29.2021.05.25.08.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:14:59 -0700 (PDT)
From: "Romain Naour" <romain.naour@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@smile.fr>
Subject: [meta-networking][PATCH] libiec61850: Upgrade to 1.5.0
Date: Tue, 25 May 2021 17:14:56 +0200
Message-Id: <20210525151456.1720172-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all upstream patches
Rename patch 0003 -> 0001

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...break-CMAKE_INSTALL_PATH-by-trying-.patch} |  4 +--
 ...001-use-poll.h-instead-of-sys-poll.h.patch | 33 -------------------
 ...linux-Add-missing-include-sys-time.h.patch | 32 ------------------
 ...c61850_1.4.2.1.bb => libiec61850_1.5.0.bb} |  8 ++---
 4 files changed, 5 insertions(+), 72 deletions(-)
 rename meta-networking/recipes-connectivity/libiec61850/files/{0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch => 0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch} (95%)
 delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.4.2.1.bb => libiec61850_1.5.0.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
similarity index 95%
rename from meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
rename to meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
index 65567610b..2168a0713 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
@@ -1,4 +1,4 @@
-From 89f326a427c7ad13c115e2d3f2ac27807aa5a795 Mon Sep 17 00:00:00 2001
+From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Fri, 10 Jul 2020 17:08:34 +0200
 Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
@@ -33,5 +33,5 @@ index 159ef4b..d1732a1 100644
  
  add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
 -- 
-2.21.3
+2.31.1
 
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index a04473d21..000000000
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-use-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4cad505fc98240eb66eaabfae61a9694f8158dda Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 20:58:37 +0200
-Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
-
-The manpage of poll(2) states that the prototype of poll is defined
-in <poll.h>. Use that header file instead of <sys/poll.h> to allow
-compilation against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/ethernet/linux/ethernet_linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hal/ethernet/linux/ethernet_linux.c b/hal/ethernet/linux/ethernet_linux.c
-index c3ab2e2..9aa5c28 100644
---- a/hal/ethernet/linux/ethernet_linux.c
-+++ b/hal/ethernet/linux/ethernet_linux.c
-@@ -23,7 +23,7 @@
- 
- #include <sys/socket.h>
- #include <sys/ioctl.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_arp.h>
--- 
-2.21.1
-
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch b/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
deleted file mode 100644
index e1b8ca15b..000000000
--- a/meta-networking/recipes-connectivity/libiec61850/files/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 661405eb6066b67dfe51d5ff9635e29f86bdd238 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 21:02:54 +0200
-Subject: [PATCH] serial_port_linux: Add missing include sys/time.h
-
-POSIX says `struct timeval` is defined if <sys/time.h> is included.
-
-Adding this header allow to build against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/serial/linux/serial_port_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hal/serial/linux/serial_port_linux.c b/hal/serial/linux/serial_port_linux.c
-index e6308c0..15e5794 100644
---- a/hal/serial/linux/serial_port_linux.c
-+++ b/hal/serial/linux/serial_port_linux.c
-@@ -29,6 +29,7 @@
- #include <termios.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <sys/time.h>
- 
- #include "hal_serial.h"
- #include "hal_time.h"
--- 
-2.21.1
-
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
index 18cb0cd8e..18e299283 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.4.2.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
@@ -13,12 +13,10 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "d798814fb463115a835da597535a625b68a39cff"
+SRCREV = "fcefc746fea286aeaa40d2f62240216da81c85e5"
 
-SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.4 \
-           file://0001-use-poll.h-instead-of-sys-poll.h.patch \
-           file://0002-serial_port_linux-Add-missing-include-sys-time.h.patch \
-           file://0003-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
+SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5 \
+           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.31.1

