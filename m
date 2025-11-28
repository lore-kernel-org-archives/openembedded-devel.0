Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE1D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:26:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3410.1764361602844531527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksJUFLFq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so13369705e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361601; x=1764966401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23KdHPX5x9YQhI3CNl6PEChX4x3Js8ETA1AIQcOHBW4=;
        b=ksJUFLFqSd1jfAqaEYmgPOfVUS0mrsECo6Q0WlIxXg1XbrpcJo17eQ6C6VyLn1vGVs
         sfsYlgS7DCAA8goehRTLTjZoazEWumGfCYYhtrbDw7DIC0bMNW+CUu7OyYYqOiEFgG8V
         n5anhuvFf8MHaWyKsG2ORr7BhHsEsuxabSaxiXfIDjJGjFrUP/kqd06BZvNknp8fPVP5
         JJweAqOVlnhKoNaNtGD35rIZhA3IHZhSOMUYdjU3pxRzxHFI21Up08WCccCv+1MEbdYU
         n3/sMtGzGm0ZJtFc8q4iW/BVzcdVED+X9Lvmr8wWp8pnGrEw1jUgtaG4Z66EQe+sF46z
         Aekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361601; x=1764966401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=23KdHPX5x9YQhI3CNl6PEChX4x3Js8ETA1AIQcOHBW4=;
        b=e13ekau2m7cIwRMadiWIr7QGJoFBfqx16NupMxJ5REYMyZS6d7aiYjpTPToX0daaoE
         dDDZ2Hn3XDY/2Kem3ZMPf1GyX+lpWuqvBCFQs6d1OfvEe6ytM4IVg37LgOlqExRJnJ7w
         1ktjp9N3TW32UvTCF6WLEhrTv9QbZ+efkA9cZFOZ+BNhr4i4MJMamvuIbqo2FuLTbcRX
         a5k/LNu82d9ptvL9jFuCDJSWL8KuXiLZiZrwdhI59X3tIyU7yszxQsQckp/b8wCJnbN/
         iSb1diot5ZOV0m5AcM0Pdp7jR+xmt+uI5KlPPpz+WojjwOH+st3IslM57WHL4aGMuyFP
         Eyjg==
X-Gm-Message-State: AOJu0YyIhrT9maBm2RkOtVhoJ/J1FKeeEZjFpQh0FXMCr0kbXLSWhsTJ
	GaiaX5sjXWbmG2CGIGMuEOK4d3K6ao6N26slQ5q4q/VQrD6nRopKD0FGfVYKDA==
X-Gm-Gg: ASbGnctc6ej8gy/id/GJC7G2X8+E0Z1GfGuf1E6tXAQZoTB/GGV60cfp86A2TOr74Ng
	fz5WGHblkkEEFS8HPJ4rFuYCyORgDjPdof+eSysriRdbTNPBgoatuJF4WXF7ZAad4Df/TjqWgpg
	wTLNzYbO9P3byN/IjAqU9tfvQytywn4WR0FWBkHJ+/qdgCIOPKe0JlTykeza4+Fiq/+QJNZlzuy
	w2bC2ek3iTOfpwnCSa5hzgUfq2zOeZ68aLzSvfPGN45SjZIEsaigzAQRzKuSUGDxssTU7VGQhwv
	QyEjAIlSRArN1n3BGV5+goVw0RAR8eLycoMvt2WfyPASbb3OvKlFqR03DJS4kiHulD00dhP9OUH
	svNXtDvUdn7s4EW3UfGmhG37edG8eAFvvIAGrMxFVRPjXGcouCeURis4rNTCHDz8Tnehk73PUWC
	ZFE6jswBHv
X-Google-Smtp-Source: AGHT+IGcwFJ+BUHWcoQlFtgWvHGESQdMs+K2f9y8G8NUVwg/X3+Bg1/gWHDVT1XF16f5rHHw3BXbaA==
X-Received: by 2002:a05:600c:45c5:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47904b2bcccmr201746795e9.34.1764361601043;
        Fri, 28 Nov 2025 12:26:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc6f7bsm177198595e9.2.2025.11.28.12.26.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:26:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/3] dbus-broker: add ptest support
Date: Fri, 28 Nov 2025 21:26:38 +0100
Message-ID: <20251128202639.2631231-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128202639.2631231-1-skandigraun@gmail.com>
References: <20251128202639.2631231-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122148

It takes less than 30 seconds to execute.

Add a backported patch that fixes a broken test.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Add the test conditionally to PTESTS_FAST_META_OE, only
if systemd is enabled.

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...-loosen-verification-of-stale-pidfds.patch | 52 +++++++++++++++++++
 .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
 meta-oe/recipes-core/dbus/dbus-broker_37.bb   | 12 ++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0473b60504..74caac6ac0 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_OE = "\
     cli11 \
     cmocka \
     cunit \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'dbus-broker', '', d)} \
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

