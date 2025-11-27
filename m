Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42196CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:17:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22171.1764260235784958023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HL2aDc+r;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47796a837c7so6668915e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260234; x=1764865034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcojzkDF1Tpg2mDWC0zrU4m/dWEaAo24zH7cWVW5leA=;
        b=HL2aDc+r5dF26U7mSdbu0hPm0aW+961sEefLySeDXyTJlVhRRvFhtq0kIXJyCeed+u
         Ggx4umGcVSdsSgmUno1/bb3Knp86tZiZ5Vuy3YDiFVPj3tAoMzLM1T1HXC/hA0Vk/0lk
         kez+eJwIxLTkslUkuDOGtYMl1tPmXBWcImXOFIaxAuq9zfkKWr5kXzGoYQhoJBl1FySV
         xXlHqS3Z/wr4KB3np5Qrl1aMmOf5H7XbbTLLhn9RtJ8/BEg+ViIyanPqG0ENo15H7C6D
         WWhQ/QAajtWIBdchn1whpgBQLTvUaN7M2wlYkbqgOFbd0p4EfAFihnS1UOuGCUwYCGRd
         D6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260234; x=1764865034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GcojzkDF1Tpg2mDWC0zrU4m/dWEaAo24zH7cWVW5leA=;
        b=q5XzcqoHM8G6rKnwcBbxkUDLdHkL80wgK+DoqLF6c9dv6RjQLlRkzKtXOjpT2aXzvl
         1eXcdlMhu7vfTwPVsc14ymlnSTopQ/nNFtqtm5DjvFyaSQgqBrZ/VZBDI4nxC8TpIH/E
         nJCdcx+QgYL+LVZryvNXQVBLNMSlpUwFXjCK9nkZ3kFLm3SD04FoYPgtyzVwzgkRfuxQ
         2sqtkmp7n/VGBsJaA4YtovI3o01dLjJbTjMZfL4GBUT5wHkEGWZanQ4ebl7AG+tMUqft
         cozpeTn4OLcbt4vXuIkPSKG1WTNvb/NWO5Efj2glIYsq1yCdCT1KKl7sL9VElw+JsqhE
         UKIA==
X-Gm-Message-State: AOJu0Yx/dScaCtnz3ojdfRSbRgJANRnBNSz71Cq4e37703v3x3ThSKOT
	exuWF4zERUQdv8bh9ukFyxofjMqD4xgxmvS3Qpfs/Ssw41Bd8W3FKb6lHohlZw==
X-Gm-Gg: ASbGncuuaqXp8mudY9ReH4skdvTaX3+BlInegg6KvdSDJAg2uULIs5R2ZAu9zqOfiUx
	Qpd/DZFxdB4tE5ST5r2Ah2WHNii7ksHtth1MRcaNYeeSdOuT47snH9F6DljIq4sT+bSGt+qFe7i
	p44I3OHOIyzVDee0xQgYqxb1RM9QneWWNXb3Pa+3n52nXGRuU3myim/Y7kXv+lwDlp5ps2nBAKV
	HLzOdUAH7H8kFQfbvkjBPWEpLNfm7ml1wTNEfkVv6E2k1GifplnlPhHbRTtUdT5O9TC1At8vrY8
	u3H+lZyrV27VwQavcRRjT4HmIVP7XhGG2EXGQkX+EiK9jYBylhb4yqo1J6wU548KvsSPu5rLblb
	txYJj87XfApe/vmuwN0j/XYRps1Dn+tEpv6InTm5lELWaakCxWj51RVHSuM1pwx3YRfN3unfLuv
	m/UyDwMxCC
X-Google-Smtp-Source: AGHT+IHsruKj+whQsZZuMblPWbbp4P2bFfDLu9qanQiXm5Ah9Fq+7hjmgnMK6UF93EuwAdIJ34COAw==
X-Received: by 2002:a05:600c:1906:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477c01e23bamr229369325e9.29.1764260233972;
        Thu, 27 Nov 2025 08:17:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040ac7e8sm75263665e9.1.2025.11.27.08.17.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:17:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] dbus-broker: add ptest support
Date: Thu, 27 Nov 2025 17:17:10 +0100
Message-ID: <20251127161711.2341194-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127161711.2341194-1-skandigraun@gmail.com>
References: <20251127161711.2341194-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 16:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122111

It takes less than 30 seconds to execute.

Add a backported patch that fixes a broken test.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...-loosen-verification-of-stale-pidfds.patch | 52 +++++++++++++++++++
 .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
 meta-oe/recipes-core/dbus/dbus-broker_37.bb   | 12 ++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 52ca06ae43..b725c1aa36 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_OE = "\
     cli11 \
     cmocka \
     cunit \
+    dbus-broker \
     duktape \
     exiv2 \
     fuse3 \
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

