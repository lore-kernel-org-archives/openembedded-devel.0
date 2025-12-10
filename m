Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4ED3C553
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15319.1765373181188833369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDoKcMBj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34a72954a76so675594a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373180; x=1765977980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flGnbp1ZjIcT4Ev4MOcPv2JP6M+NUMvUCJq3PY0ftAY=;
        b=GDoKcMBj0yC5uYL9K/IsDn3aodGsdnQsm80Ii7m+ulI/qnPCkwbYxYLEga/Efof8SQ
         /Nr24IGNeerChOh7OIlx6eO7t6J3ZO8+xvEEcK78jVO8YbWqT/DIlLgoiT5hI4uhMDtG
         IznKlUuWcPHJLzepnzqrY/HFjarBkurjsPU1HqljGCO3NiOIj+gIUaPfW2k4jTc0KCzE
         VABXTKo3sTl5VWT7CpriIQXaRHoyoUFTlsEV74ikejkqpGus4IWGbQk5b8HxntBxsFji
         Wbj6QY5dP4L/1Gj630DXh6jC1sppJ8Umjx6fLffbM0bCn3AkEI2QUNlakGUuaYo2/xLj
         K3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373180; x=1765977980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=flGnbp1ZjIcT4Ev4MOcPv2JP6M+NUMvUCJq3PY0ftAY=;
        b=VTC1j6N9/7yfKsWm7hjKyjKKaDq8cP8up0zQKsRj48ZqmNHOsEKJrMWG+zReyaOaiC
         khi7AJNhIHPRb9MPH/6SudfYBRuCs5TxvE3FkH04t5G1z5RRGolB+ekzqRl49lM9Twhj
         ArNm0sOoHxYlFzs5xi2zZe8uNz/TdE2SF0osEsYB9K6q4GKgnD0AX5nJ7EeUYLhXXi78
         VMXlZezIbQRF+Rw3jnvWTdo71kD+tRm2rGuXU1DxNhEwgCHGnpihQnmHfUCsM+vK+wo4
         EaPJKNSE30DMNj9ideKANTs0Cj96jlbQZh1lNEBuL4n1vDJkFwVqP4zCONkqbsYFEfyf
         WqyA==
X-Gm-Message-State: AOJu0YxBKPVOx+NzFmM7YQEO408Z6yi7gmeVblHPAUnxfRyTZbjt/xvJ
	llxBt56kQNOMf9zFPVF4GhioISCVoemeWrdhQFZ/E5yRdV/9y8PNOlWsCnU0QQ==
X-Gm-Gg: AY/fxX6Ra3omb1W864mAYzEvh5ZepEtlAtxPSwkcdiPshWg0HcunDj9xSi77EiCu1/5
	Li8smLvb4q5QKWXNn+OMEacE/5c2L7cB53V1Dqdxs6EdCWbxXsNd4JkJdwE0igr+UWdMkL3GR48
	Hg7/kE1fouSe+fehcR5JeubHjhli2blMXyQU8HI73boApjPVI1wJnd2zB7wEURB0d7dFcHkQEp+
	wGFFmiCsuaA99yPO9D4fXe9evI+VtwCweCOif5IEiwmukBADBvfD4YA2AC39UB1yAu4OesUWS0d
	/nJFE4bLZR1npLH2iotlvg/7eGtoVaiQzpdkGA9tLQ5GX6Kh+3xqvv56jRbMhRxL2duOtJS7t1G
	VyGwEzD4+kvQAHb+o/2j6fi05up9ei6a4hRiVmoTFjApqXe1AmNZrMdgON5xYfYyG1F7dZ5oLuq
	3qb1PApfiAy1Is036CnzQetQw=
X-Google-Smtp-Source: AGHT+IHQg9IFRI30370SCq1VL7mFA/ohjFz7kW/OCE3wPzW0h2Y380i7muFBbkpWfUS+vkzGCSYUDQ==
X-Received: by 2002:a17:90b:5787:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-34a728c6e12mr2487872a91.22.1765373180367;
        Wed, 10 Dec 2025 05:26:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7092b1c1sm2550009a91.15.2025.12.10.05.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 24/43] dbus-broker: add ptest support
Date: Wed, 10 Dec 2025 18:56:03 +0530
Message-ID: <20251210132604.317279-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
References: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122528

From: Gyorgy Sarvari <skandigraun@gmail.com>

It takes less than 30 seconds to execute.

Add a backported patch that fixes a broken test.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 05230420abafb2d1a7da86c77f22434f415af8fb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...-loosen-verification-of-stale-pidfds.patch | 52 +++++++++++++++++++
 .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
 meta-oe/recipes-core/dbus/dbus-broker_37.bb   | 12 ++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index ea336f1058..c43e9b8c2a 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_OE = "\
     cli11 \
     cmocka \
     cunit \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'dbus-broker', '', d)} \
     duktape \
     fuse3 \
     function2 \
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
new file mode 100644
index 0000000000..fac5be1917
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
@@ -0,0 +1,52 @@
+From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 4 Sep 2025 10:23:36 +0200
+Subject: [PATCH] test/sockopt: loosen verification of stale pidfds
+
+From: David Rheinsberg <david@readahead.eu>
+
+Newer kernels now properly return stale pidfds from AF_UNIX sockets,
+rather than refusing the operation. Ensure that our tests adopt to this
+and properly verify staleness.
+
+Signed-off-by: David Rheinsberg <david@readahead.eu>
+Upstream-Status: Backport [https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb8b0b03479accc04b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/util/test-sockopt.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c
+index 04148af..eaa8fba 100644
+--- a/src/util/test-sockopt.c
++++ b/src/util/test-sockopt.c
+@@ -81,17 +81,25 @@ static void test_peerpidfd_client(
+ 
+         r = sockopt_get_peerpidfd(fd, &pidfd);
+         if (r != SOCKOPT_E_UNSUPPORTED) {
+-                if (stale) {
+-                        c_assert(r == SOCKOPT_E_REAPED);
++                if (r == SOCKOPT_E_REAPED) {
++                        /*
++                         * Old kernels refused to return stale pidfds. Hence,
++                         * in that case verify that we expected a stale pidfd.
++                         */
++                        c_assert(stale);
+                 } else {
+                         c_assert(!r);
+                         c_assert(pidfd >= 0);
+ 
+                         r = proc_resolve_pidfd(pidfd, &pid_socket);
+                         c_assert(!r);
+-                        c_assert(pid_socket > 0);
+ 
+-                        c_assert(pid_socket == pid_server);
++                        if (stale) {
++                                c_assert(pid_socket == -1);
++                        } else {
++                                c_assert(pid_socket > 0);
++                                c_assert(pid_socket == pid_server);
++                        }
+                 }
+         }
+ }
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
new file mode 100644
index 0000000000..789000523e
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+RET=0
+
+run_tests(){
+  for t in *; do
+    if ./$t; then
+      echo PASS: $t
+    else
+      echo FAIL: $t
+      RET=1
+    fi
+  done
+}
+
+cd /usr/lib/dbus-broker/tests/dbus
+run_tests
+cd /usr/lib/dbus-broker/tests/unit
+run_tests
+exit $RET
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index f0312181b6..c531f555d2 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -10,7 +10,10 @@ DEPENDS = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)} \
 "
 
-SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz \
+           file://0001-test-sockopt-loosen-verification-of-stale-pidfds.patch \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
@@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+)"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
-inherit meson pkgconfig systemd features_check
+inherit meson pkgconfig systemd features_check ptest
 
 EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
 EXTRA_OEMESON += "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
+EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -36,3 +40,7 @@ RDEPENDS:${PN} += "dbus-common dbus-tools"
 FILES:${PN} += "${nonarch_libdir}/systemd/catalog"
 FILES:${PN} += "${systemd_system_unitdir}"
 FILES:${PN} += "${systemd_user_unitdir}"
+FILES:${PN}-ptest += "${libdir}/${PN}/tests"
+
+# test-sockopt fails to compile with musl without this flag
+CFLAGS:append:libc-musl = "${@bb.utils.contains('PTEST_ENABLED', '1', ' -Wno-error=incompatible-pointer-types ', '', d)}"

