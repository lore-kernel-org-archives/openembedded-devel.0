Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37955.1795594119836113194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Dx0CaIhb;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso5440336c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594119; x=1796198919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQ0FPhEpEc3XSwDdFXnuIq0zJcXa1nb5ZEttk61e1ZU=;
        b=Dx0CaIhbvzVAsXFGTZxhfF9anJRIuU3uFy3MrOaQcN15HFyaUtoH1ZhbXk74JO5ha/
         Iu85utSnr+HNtGf9UnXXbIw4caC/Giimc2CYyDpvyeS3BD5nQq/ZnBTzff4R3MXm89U7
         QSHorehnkdfeovZoHQnO6FIOZqHbCEfkl4BDiGB5wqwJLmwuvuuoEbgQiiSX/SshpsVU
         yZyyMqG05agtZrJiCh7C9jWkoEYxwxlzOCD8iNv5Yy/jR4j/edZ6ziZ63ZbPW5QAlC4k
         EZNwQowt1zv4Y6a6eCPJlkQ9zPUxKEUI7+Uk1cWFNSzVkTDYtMBJLp/BdNjkw7htx1Q/
         xvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594119; x=1796198919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQ0FPhEpEc3XSwDdFXnuIq0zJcXa1nb5ZEttk61e1ZU=;
        b=Onh6BZA4yGU4cZAAy1DYWVKzbyk07Z8TPKUq7Cas59sN7MFGdP7KCw6u7BPpFUCN0Y
         ItbaWHIugLqQojI30FitFoMw8Meb3vBp9O0a71oH9WSbhtFIvLwHPigj4eUNJscUKA18
         SSojTbdAt1tSo/mPKpxv/w9hcg3dbRQKnrCZEFERvUMCoclsjFn/QOcdNmy1NblXYuvh
         JSExX142DfSwoK7oQ+bVJGYVajbd8XbMy4fTO6JLPVMO5Dmy5tKftuETbbUiacLog7tK
         zXr6zDVckz0iNGXLdBsN3OwiMpt65wcOGhQItv+n53u1pOnkGdjwUDRbXC9unV8GMBwF
         m37Q==
X-Gm-Message-State: APuU4Z9AiqMEG+lZxiewPcBqGGeNDHAG8B4rgJwpv5pk0gA4RyUSC1UP
	3JXvo02hvYE7uWDGIlixTODYgbYQ3mNRDADn6E9FhQPctpS+OXzGN10a6Gsc5jVd
X-Gm-Gg: AZFdTZeQNBrVPHmO969L4iv0C+C90otKAdfQvNVrGKxJDmxSfYSLqCv2OwnBvz52q7a
	J2HK2tMVyzc2VWhxyFEr2XkUMDeg/b3Wn4V+GOyjEuUmsueL+oeWIETgxfsPzcI/3CeMqDNj6oY
	G8o0e8wxauuaE43F9LwnrO5qlKUEwCFVz4lBh0SF/1JtC5wfG0xggqYDRG9cxUB+gDyWCqcPxQP
	ock6goOkBSugKV8G4VNABmlnoV5+QV/7Ob6thV64vY7EaTLSAdQiMIT/GR9iLkaO10YkduTNWsg
	/Osvrku+wQNcQ+mc9KJrZjUwYuoLDVhra2/l5ZrJmP6LOxxEyNwQZrMep81k0U8PobeBkfkemzb
	G/m3X2ROuUq6Za8R8GyY36zJONrK3SQA6tZfekXz3sOqmaw492cBvyY/+HpOY/rkDrAAFe1Dkn1
	l+mxjAnQTUKaJyn/qtCwwFFAJhjz8RvEha1aq9N+yguLtpbAoNzLhjUXh2MIO+LQlzFpzO1NxbF
	zgOqYE7i2wO05zU2vA+Rim19GCAy0egAmbkyzFVRk7KB08Sct/Q9bwxX+Cf70M/pMhwK9y6Cf/b
	0TgiIGqMZE8iTX65jgmUKqlgcj34B5l5I8MIepvy4+o7UGg+8HN80+nM/iM/kfwOMMKoq2n4HaW
	2/Mrkl1ZhJv4c1Htp+Ad+T3gHtw27J0p8WQmKmaH7V6iiXk1cT//RzOHh0/sjB2OIT9mal7KIJj
	BA4oXC3qWCwZpeqeivcc393UE2sSPfrFrt1e6KYo9UkSG0GkqfK6KnS+iNbmP7SOXsSVnFKON5p
	SsirgbuUA9Av/dNpY5YmB/3dowo3TYccLsVuC/YVtqnmwRULJIAIfDoFfLEl/kcVNCnMdUMQcAv
	QMJh/Q==
X-Received: by 2002:a05:7300:51f6:b0:384:7b4c:8564 with SMTP id 5a478bee46e88-3857131a749mr20081279eec.41.1795594119146;
        Wed, 25 Nov 2026 00:08:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 46/55] inotify-tools: upgrade 4.25.9.0 -> 4.26.291
Date: Wed, 25 Nov 2026 00:07:02 -0800
Message-ID: <20261125080732.2419614-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133049
Content-Type: text/plain; charset="utf-8"

inotify-tools was rewritten in Rust. The tools and libinotifytools are
meant as drop-in replacements: the library keeps SONAME
libinotifytools.so.0 and the C headers. Upstream now releases every
green commit on master as <series>.<commit count>. Also new:
- fanotify mount and filesystem watches (btrfs sub-volumes, overlayfs)
- filenames preserved in fanotify delete and move events
- timeouts respected while waiting for filtered or batched events

Autotools is gone; the top-level GNU Makefile runs cargo for the
workspace, generates the headers and man pages and installs the
historical layout. Build with the cargo class and call make with the
OE target triple, profile and target dir. Use the release tarball,
which has the full version stamped in VERSION. The only crate is libc;
the crates include was generated from Cargo.lock with the same logic as
'bitbake -c update_crates inotify-tools'. The static library is not
installed, as with the old --disable-static build. The ptest keeps
running the C++ C-ABI unit test (libinotifytools/src/test.cpp), now
built against the Rust cdylib. The upstream package metadata
(Cargo.toml) declares GPL-2.0-or-later and COPYING is the GPLv2 text,
so LICENSE becomes GPL-2.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../inotify-tools/inotify-tools-crates.inc    |  8 +++
 .../inotify-tools/inotify-tools_4.25.9.0.bb   | 37 ------------
 .../inotify-tools/inotify-tools_4.26.291.bb   | 57 +++++++++++++++++++
 3 files changed, 65 insertions(+), 37 deletions(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools-crates.inc
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_4.26.291.bb

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools-crates.inc b/meta-oe/recipes-support/inotify-tools/inotify-tools-crates.inc
new file mode 100644
index 0000000000..90ab41a802
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools-crates.inc
@@ -0,0 +1,8 @@
+# Autogenerated with 'bitbake -c update_crates inotify-tools'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/libc/0.2.183 \
+"
+
+SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
deleted file mode 100644
index a03b835641..0000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Command line tools and C library providing a simple interface to inotify"
-HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
-SECTION = "console/devel"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
-
-SRCREV = "81c6c9881edf4844f2b8250e63f82da9cb7f5444"
-
-SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
-           file://run-ptest \
-           "
-
-
-inherit autotools ptest
-
-EXTRA_OECONF = "--disable-doxygen"
-
-# workaround until glibc 2.35 is fixed for this [1]
-# [1] https://sourceware.org/pipermail/libc-alpha/2021-December/134215.html
-CFLAGS += "-Wno-error"
-
-PACKAGES =+ "libinotifytools"
-
-FILES:libinotifytools = "${libdir}/lib*.so.*"
-
-do_compile_ptest() {
-        cd libinotifytools/src
-        oe_runmake
-        oe_runmake test
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}
-    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
-}
-
-FILES:${PN}-ptest += "${PTEST_PATH}"
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.26.291.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.26.291.bb
new file mode 100644
index 0000000000..75f26e8a97
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.26.291.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Command line tools and C library providing a simple interface to inotify"
+HOMEPAGE = "https://github.com/inotify-tools/inotify-tools"
+SECTION = "console/devel"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "633c012d30a0f66770454ee15e6d5d24003a61206b4a698cc4b32e6715855667"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
+inherit cargo cargo-update-recipe-crates ptest
+
+require ${BPN}-crates.inc
+
+EXTRA_OEMAKE = " \
+    CARGOFLAGS='-v --frozen' \
+    PROFILE=${CARGO_PROFILE} \
+    TARGET=${RUST_HOST_SYS} \
+    CARGO_TARGET_DIR=${B}/target \
+    ENABLE_STATIC=0 \
+    prefix=${prefix} \
+    bindir=${bindir} \
+    libdir=${libdir} \
+    includedir=${includedir} \
+    mandir=${mandir} \
+"
+
+do_compile() {
+    export RUSTFLAGS="${RUSTFLAGS}"
+    oe_runmake -C ${S}
+}
+
+do_install() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    oe_runmake -C ${S} install DESTDIR=${D}
+}
+
+PACKAGES =+ "libinotifytools"
+
+FILES:libinotifytools = "${libdir}/lib*.so.*"
+
+# The C++ unit test of the C ABI, linked against the installed library
+do_compile_ptest() {
+    ${CXX} ${CXXFLAGS} -std=c++17 -Wall -I${S}/libinotifytools/src \
+        -o ${B}/test ${S}/libinotifytools/src/test.cpp \
+        -L${B}/target/${CARGO_TARGET_SUBDIR} -linotifytools ${LDFLAGS}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${B}/test ${D}${PTEST_PATH}/
+}
