Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6191D3C92B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:58 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.862.1765383297116205210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 08:14:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBRUyO7I;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-349ae58a7baso13175a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765383296; x=1765988096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x519m5TOK6LI62WYiDND62nZMP+efU69vobMjeqJwoQ=;
        b=KBRUyO7ICUzPvNqe0yr/+7uAJtdIM4FwvIvqqr/JQUk2isxSFOwlhLgJNVyKaVu79J
         J3o13N2SNQ4h7tVn7KMlCWrbL4UTqS36qi47vf0gkT9SmwWhFSqEb9K5k6NLIDLUNuCb
         zXIIyDDbiuZGYoyzLYv2HkQyGhc92JHV2+wqa1Kp7+CKGqS6DZSadkkLfIamO0LroQaq
         jtX85FBnSa17GXmNIAeedudPcfiOq6JZVjbtZDAbTreeQKEoVYu200OLNSifaiQ+wL4N
         sy9NtofbbZpaXXQ1YJc5GbARSCREgvOEKWpmBdYUBHhQeosQNpAH7tX3PsObpmqarFLh
         LCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383296; x=1765988096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x519m5TOK6LI62WYiDND62nZMP+efU69vobMjeqJwoQ=;
        b=LeXmp7zT9tsAccTIcOE98B9Lr35ZzeiYSoslKUsUucwm8v3hd96Du8pfBmZPz25VEn
         BnYmVFb/sypa3Yg4wxSj1LA1wFTYJQ3WLNZNVNGCf/JiL+yf1tBX4MqDyCsLStK+uwKx
         ed35N3KZSYfEngHJqCouRF9PoBCvyT8iWBoS8R5SZ9/r90XTYSAc/f7lqij5K/BWikjj
         7aQCe/sJF9NxCtz7IbeewdgBvvL6vcOMxLWwmVLyAFh/NyilUVHwIWtnsxqsd7ZaXNak
         gQ7aZ0i/NF6EZbLOOSkyciOBjriiqHaKwS39bcqjg/rTmZf4yHvUb0Fi8cjhwH5x9eNA
         FjDQ==
X-Gm-Message-State: AOJu0Yx8SeROw9G5ZA5l4vcZyJPJmwzxgooqgaBTyn1ZlBn1Tlq1W31a
	99oaBbaIyixO8H5wCtyRH2AomnJmLb6lq0SduGBBEzYVmZFw/qiLtcfCZiAlTjSw
X-Gm-Gg: AY/fxX4mPXG8Cyiq3jl1kv77q81IQILYoz3p1Rl69S9axixW7WZHFOvu+D0KiLkZWL0
	sY8gRV99cto5s0docEq9tRf8j2cwzoWoHftaEfspJHc9A3wfBlDrXRPpZe1jAoQxjqXAvHfwHRy
	DqLPkRuMdoc5DCbC1e2vZGgpDCfoUUZwLSclmKDiEC1QFdQy0c6ARxy1Kn5bJpeWqAhdbs9Fslr
	v+CI23XH8ujxV02t2/t/RqCMhMed5GS3fUYj1mMr/1DDisVjCLCV8iS+dBigIMwCTnRcQxUnHck
	cfks2nr7kxGgrauQzCwxnbobei3yQoTDg4aR5YoRjLwAMgpzOOnM6K1Os9m+YM96qOUQSDnjY18
	9RNTSYfBXjxieyKjBRjPGQj3glDrq0lBBcSX3hd0Pb/dUTrj/SuqC/V7Q1X6O4YeiHFyuNpJzdh
	OQ+tVM8ldeacDDVQXki6+m8Tg=
X-Google-Smtp-Source: AGHT+IFfH+9A3M2OeEGE1v4pHFMfKPlVz9a9YiIOoCqiSST4IeRHMLFq4etxPa7HEweatmZYv1D1Kg==
X-Received: by 2002:a17:90b:2d4d:b0:349:3fe6:ab8b with SMTP id 98e67ed59e1d1-34a7289e99amr2681791a91.36.1765383296174;
        Wed, 10 Dec 2025 08:14:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70427ea6sm2928546a91.3.2025.12.10.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH v2] dbus-broker: add ptest support
Date: Wed, 10 Dec 2025 21:44:39 +0530
Message-ID: <20251210161440.2151692-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122559

From: Gyorgy Sarvari <skandigraun@gmail.com>

It takes less than 30 seconds to execute.

Add a backported patch that fixes a broken test.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 05230420abafb2d1a7da86c77f22434f415af8fb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- rebased on whinlatter branch
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...-loosen-verification-of-stale-pidfds.patch | 52 +++++++++++++++++++
 .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
 meta-oe/recipes-core/dbus/dbus-broker_37.bb   | 12 ++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 860c09119b..d092c3c327 100644
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

