Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEC7CA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1495.1790722683373746775
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=faCK7aN+;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso4692064eec.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722683; x=1791327483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wu8067CYQ5bgKmylpZtK9Ohb/uOEaW+VVJUO9coEZM=;
        b=faCK7aN+inKLtnQg7fDlwsbmVKU0EURDXoRW+vZmhT/q9+U6VtAHI/WJR05a+AjESt
         lB1ZH+gOe8pZxCvx80SDQidMO4vRFR05TN+nVSKgVtBlU9c7Rrg0Wq97teuHbRb0F8Mx
         UHYSZQPychyBnyJu6FfqhgmozqvZUHl0MLFe+6hGbg495IRDd0KDSIUIaonNoJSGPfYq
         gz0ym4F8Cj9WHGzSwdO4YcG/XulqxfKJ/PIHszdHEtATUOaroproRvKKl3iNFm0bJWLv
         v83lsDAy09B19d/i03+bEW6xR0ZdWQYEC6CpZ6rAJxLdPhH1kDD1TWLYqSzfXRWpT2cb
         gXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722683; x=1791327483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wu8067CYQ5bgKmylpZtK9Ohb/uOEaW+VVJUO9coEZM=;
        b=SxlDSkEcBBTMWKbpBuQUkPTbCXFmStWHyvkuAt4gaSQN+SdtamzaX/p/1fk4+hfFXd
         WHcl6kdyI9nGP1EZT29s7z3SOo0skt5kASx6dL9YIM09BTIlYzj34P4x15HsJ/JB2ypr
         6oNeG4q5mPVOL7GA2kjsk0hwQ0x/ZYwuoR6xivVzLco18rz1j4YENaS9sSoExo1KflU8
         E5gXUc06LheOHNvO9s2atQfxfkW22qNSQUgKYTK0skkJhuFTjl0790X2jBjyjuNL5daT
         o/MC6w7rNjUXF2TjzARyPZ55Cj/WZDY5X/Cg9c0NpKFoK3+YOWgqcVM9lrdSFvlcD+fx
         t9tg==
X-Gm-Message-State: AFq9FYKV+rh3evBDARh4+APh2475BXXIKOXsNroSZU6vqGHsybmxmQAU
	K8W6ii0rtVBUUy54KqwpcK3uO+b8TX8oALUM6WT3w++fDZO/tMoradbjtLfcZrWNMjY=
X-Gm-Gg: AYBFou1g0pxm1LDQX7sWaToXmScpC4hOM7IWbK0IwTxxkiYC0QskaCXh3HaDnklewXL
	P6Iyjp6fNiMGTH+/AQ6VzwWV22dQs/QzoppSnpmj3ZyCWF58tDyoeQNezh/CCI/sQEaUujxNHvG
	Hsw3A3jsbtO7Im9kA1jKrYhRfyRTIfKjmxrP0YoBxC3xZOLJKXziBUzxyIiFD0zfL+G2rjZApWc
	YPaQI7acCUQsR3GzZcSGqjUh16mlblpaT5vQYe857oXqVud4E5+O5P0cvC0KrTyzYcLL3+6mtgf
	M+E9nuvd6IpVA82F53U69jIgsKDPkR71tp8jV6TUgyid7gdKyFKydNajiAU0th571JJHj0gaCpT
	EIfn6SSCit4b0yyt/sfc1srSnTFDVB9ngWZZFG5lO7kqwaA9CgdEWfqCi10FFz+uNx6hkNijgk7
	lIPaWCv9IMCp8h9ppkUGgJ2p4cdEuTeyc7SFr5ztQ2eMak2rz1Xt0pL0CiZidOmibQF09OIwiXm
	6IIVXAx1E49MggtcM9G294VcNgz0zxXosxb3BqHhnKmFR2dNCUcyZQLgX5s1O4NrayAW05/xpOi
	ndTjV/IdjdhvD8JJfAOJfEpa2U9kqk+bB1VqMJ7hLRPdM10VdIEv0NAm1xQzkNqbfTMqRILO7+u
	HlIeU99yFjYIGbE/p+ckcbhO3nmu13XQ5T7yLwHZROa0Sx8UimPrHjEdJECYzISkyyR/Y8D99Wh
	hxWZ4n5NDrGgY7ZwYshVF3ZjWgUymacKJBx6XmRQ7CbEC0fNf8zQ==
X-Received: by 2002:a05:7300:c01b:20b0:348:201a:6c8b with SMTP id 5a478bee46e88-34c642e07d6mr1031823eec.38.1790722682352;
        Tue, 29 Sep 2026 15:58:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:58:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/26] android-tools: fix musl build (off64_t, LFS64 fns, b64_pton, ANDROID_HOST_MUSL)
Date: Tue, 29 Sep 2026 15:57:21 -0700
Message-ID: <20260929225723.1046705-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130511

Several independent musl gaps surfaced one after another as each was
fixed and the build progressed further:
- android-base/off64_t.h only worked around __APPLE__ lacking off64_t;
  extend the same typedef fallback to musl.
- sysdeps.h's adb_pread/adb_pwrite/adb_lseek only fell back to the
  plain (non-LFS64) functions on __APPLE__; musl needs the same
  fallback for pread64/pwrite64/lseek64.
- daemon/auth.cpp calls b64_pton() from <resolv.h>, which the Linux
  host build gets via -lresolv and bionic provides natively, but musl
  has neither; vendor the standard BSD implementation for it.
- android-base/endian.h and threads.h already gate a musl-aware branch
  behind ANDROID_HOST_MUSL, matching upstream's own expectation, but
  nothing defined that macro for this recipe's build; define it via
  CFLAGS/CXXFLAGS for the musl toolchain.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...end-non-glibc-compat-typedef-to-musl.patch |  42 ++++++
 ...vide-pread64-pwrite64-lseek64-fallba.patch |  58 ++++++++
 ...dor-a-portable-b64_pton-for-non-glib.patch | 131 ++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb     |  11 ++
 4 files changed, 242 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch
new file mode 100644
index 0000000000..59feb3c1ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch
@@ -0,0 +1,42 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:01:07 +0000
+Subject: [PATCH] libbase: extend the off64_t compat typedef to musl
+
+android-base/off64_t.h already works around Apple's libc not
+providing the glibc LFS64 off64_t name by typedef'ing it to off_t.
+musl has the exact same situation -- it never defines the LFS64
+names because its off_t is already 64-bit -- but the guard only
+checked for __APPLE__, so building against musl failed:
+
+| system/libbase/mapped_file.cpp:47:67: error: unknown type name 'off64_t'; did you mean 'off_t'?
+| system/libbase/include/android-base/file.h:105:71: error: unknown type name 'off64_t'; did you mean 'off_t'?
+| system/libbase/include/android-base/mapped_file.h:50:61: error: unknown type name 'off64_t'; did you mean 'off_t'?
+
+Both file.h and mapped_file.h (and every .cpp that includes them)
+already pull in android-base/off64_t.h, so extending its guard to
+any non-glibc, non-bionic, non-Windows libc (i.e. musl) fixes all of
+these call sites in a single place.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ system/libbase/include/android-base/off64_t.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/system/libbase/include/android-base/off64_t.h b/system/libbase/include/android-base/off64_t.h
+index a4b7715..857ff29 100644
+--- a/system/libbase/include/android-base/off64_t.h
++++ b/system/libbase/include/android-base/off64_t.h
+@@ -16,7 +16,10 @@
+
+ #pragma once
+
+-#if defined(__APPLE__)
+-/** Mac OS has always had a 64-bit off_t, so it doesn't have off64_t. */
++#if defined(__APPLE__) || \
++    (!defined(__GLIBC__) && !defined(__BIONIC__) && !defined(_WIN32))
++/** Mac OS has always had a 64-bit off_t, so it doesn't have off64_t.
++ *  musl doesn't provide the glibc LFS64 off64_t name either, but its off_t
++ *  is already 64-bit, so the same typedef works there too. */
+ typedef off_t off64_t;
+ #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch
new file mode 100644
index 0000000000..54c931c210
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch
@@ -0,0 +1,58 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:36:00 +0000
+Subject: [PATCH] adb: sysdeps: provide pread64/pwrite64/lseek64 fallback for
+ musl
+
+adb_pread(), adb_pwrite() and adb_lseek() in sysdeps.h already special
+case __APPLE__ to call the plain (non-LFS64) pread/pwrite/lseek,
+because Mac OS never had the glibc LFS64 names. musl has the exact
+same situation -- like off64_t (see
+0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch),
+it never defines pread64/pwrite64/lseek64 since its off_t is already
+64-bit -- but these three call sites only checked for __APPLE__, so
+building against musl failed:
+
+| sysdeps.h:522:31: error: use of undeclared identifier 'pread64'
+| sysdeps.h:544:32: error: use of undeclared identifier 'pwrite64'
+| sysdeps.h:554:12: error: use of undeclared identifier 'lseek64'
+
+Extend the same non-glibc/non-bionic/non-Windows guard used by
+off64_t.h to these three functions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/packages/modules/adb/sysdeps.h
++++ b/packages/modules/adb/sysdeps.h
+@@ -516,7 +516,10 @@ static inline int adb_getlogin_r(char* buf, size_t bufsize) {
+ }
+
+ static inline int adb_pread(borrowed_fd fd, void* buf, size_t len, off64_t offset) {
+-#if defined(__APPLE__)
++#if defined(__APPLE__) || \
++    (!defined(__GLIBC__) && !defined(__BIONIC__) && !defined(_WIN32))
++    /* Mac OS and musl don't have the LFS64 pread64: their plain pread is
++     * already 64-bit (see android-base/off64_t.h). */
+     return TEMP_FAILURE_RETRY(pread(fd.get(), buf, len, offset));
+ #else
+     return TEMP_FAILURE_RETRY(pread64(fd.get(), buf, len, offset));
+@@ -538,7 +541,8 @@ static inline int unix_read_interruptible(borrowed_fd fd, void* buf, size_t le
+ }
+
+ static inline int adb_pwrite(int fd, const void* buf, size_t len, off64_t offset) {
+-#if defined(__APPLE__)
++#if defined(__APPLE__) || \
++    (!defined(__GLIBC__) && !defined(__BIONIC__) && !defined(_WIN32))
+     return TEMP_FAILURE_RETRY(pwrite(fd, buf, len, offset));
+ #else
+     return TEMP_FAILURE_RETRY(pwrite64(fd, buf, len, offset));
+@@ -548,7 +552,8 @@ static inline int adb_pwrite(int fd, const void* buf, size_t len, off64_t offs
+ // (write and pwrite macros omitted: incompatible with GCC/abseil compat)
+
+ static inline int64_t adb_lseek(borrowed_fd fd, int64_t pos, int where) {
+-#if defined(__APPLE__)
++#if defined(__APPLE__) || \
++    (!defined(__GLIBC__) && !defined(__BIONIC__) && !defined(_WIN32))
+     return lseek(fd.get(), pos, where);
+ #else
+     return lseek64(fd.get(), pos, where);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch
new file mode 100644
index 0000000000..f658fb3c57
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch
@@ -0,0 +1,131 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:47:00 +0000
+Subject: [PATCH] daemon/auth: vendor a portable b64_pton() for non-glibc,
+ non-bionic libcs
+
+adbd's daemon/auth.cpp calls b64_pton() from <resolv.h> to decode a
+client's base64-encoded public key. Android.bp gets this on the Linux
+host build by linking -lresolv ("b64_pton" comment at host_ldlibs),
+and bionic (the Android target libc) provides its own. musl has
+neither the symbol nor a libresolv to link against, so building
+against musl failed:
+
+| daemon/auth.cpp:119:13: error: use of undeclared identifier 'b64_pton'
+| daemon/auth.cpp:166:13: error: use of undeclared identifier 'b64_pton'
+
+Vendor the standard BSD base64 decoder (the same implementation
+glibc's own resolv/base64.c is derived from) as a local static
+function, gated to only be used where the libc doesn't already
+provide it, rather than adding a new libresolv-equivalent dependency
+just for this one call site.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/packages/modules/adb/daemon/auth.cpp
++++ b/packages/modules/adb/daemon/auth.cpp
+@@ -22,6 +22,10 @@
+ #include <stdio.h>
+ #include <string.h>
+
++#if !defined(__GLIBC__) && !defined(__BIONIC__)
++#include <cctype>
++#endif
++
+ #include <algorithm>
+ #include <chrono>
+ #include <iomanip>
+@@ -49,6 +53,93 @@
+ #include "transport.h"
+ #include "types.h"
+
++#if !defined(__GLIBC__) && !defined(__BIONIC__)
++/*
++ * musl doesn't provide libresolv's b64_pton(): glibc gets it by linking
++ * -lresolv (see Android.bp's host_ldlibs) and bionic has its own, but musl
++ * has neither the symbol nor a libresolv to link. This is the standard BSD
++ * base64 decoder (the same one glibc's own resolv/base64.c is derived
++ * from), vendored here so this one call site doesn't need a new
++ * dependency.
++ */
++static int b64_pton(const char* src, uint8_t* target, size_t targsize) {
++    static const char Base64[] =
++        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
++    static const char Pad64 = '=';
++    int tarindex, state, ch;
++    const char* pos;
++
++    state = 0;
++    tarindex = 0;
++
++    while ((ch = *src++) != '\0') {
++        if (isspace(static_cast<unsigned char>(ch))) continue;
++
++        if (ch == Pad64) break;
++
++        pos = strchr(Base64, ch);
++        if (pos == nullptr) return -1;
++
++        switch (state) {
++            case 0:
++                if (target) {
++                    if (static_cast<size_t>(tarindex) >= targsize) return -1;
++                    target[tarindex] = (pos - Base64) << 2;
++                }
++                state = 1;
++                break;
++            case 1:
++                if (target) {
++                    if (static_cast<size_t>(tarindex) + 1 >= targsize) return -1;
++                    target[tarindex] |= (pos - Base64) >> 4;
++                    target[tarindex + 1] = ((pos - Base64) & 0x0f) << 4;
++                }
++                tarindex++;
++                state = 2;
++                break;
++            case 2:
++                if (target) {
++                    if (static_cast<size_t>(tarindex) + 1 >= targsize) return -1;
++                    target[tarindex] |= (pos - Base64) >> 2;
++                    target[tarindex + 1] = ((pos - Base64) & 0x03) << 6;
++                }
++                tarindex++;
++                state = 3;
++                break;
++            case 3:
++                if (target) {
++                    if (static_cast<size_t>(tarindex) >= targsize) return -1;
++                    target[tarindex] |= (pos - Base64);
++                }
++                tarindex++;
++                state = 0;
++                break;
++        }
++    }
++
++    if (ch == Pad64) {
++        if (state != 2 && state != 3) return -1;
++
++        if (state == 2) {
++            for ((void)(ch = *src++); isspace(static_cast<unsigned char>(ch));
++                 (void)(ch = *src++))
++                continue;
++            if (ch != Pad64) return -1;
++            (void)(ch = *src++);
++        }
++
++        while ((ch = *src++) != '\0') {
++            if (!isspace(static_cast<unsigned char>(ch))) break;
++        }
++        if (ch != '\0') return -1;
++    } else {
++        if (state != 0) return -1;
++    }
++
++    return tarindex;
++}
++#endif
++
+ using namespace adb::crypto;
+ using namespace adb::tls;
+ using namespace std::chrono_literals;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 623dfa7717..300a92df00 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -57,6 +57,9 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0009-libbase-include-stdint.h-in-hex.cpp.patch \
            file://0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch \
            file://0011-adb-drop-non-portable-is_standard_layout-assertion.patch \
+           file://0012-libbase-off64_t-extend-non-glibc-compat-typedef-to-musl.patch \
+           file://0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch \
+           file://0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -81,12 +84,20 @@ SYSTEMD_PACKAGES = "${PN}-adbd"
 SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
 
 CFLAGS:append = " -fPIC -std=gnu2x"
+# android-base/endian.h and threads.h already have an
+# ANDROID_HOST_MUSL-gated branch for building against musl (alongside their
+# __GLIBC__ one); upstream expects the build system to define this macro,
+# which the debian/ Makefile-based packaging used here doesn't do on its
+# own.  Without it those headers fall through to their Windows-only branch
+# and fail with "'winsock2.h' file not found".
+CFLAGS:append:libc-musl = " -DANDROID_HOST_MUSL"
 # The bundled fmtlib 10.2.0 validates FMT_STRING() inside a consteval
 # basic_format_string constructor whose parse path evaluates "it - begin()",
 # which current C++ frontends reject as a non-constant subexpression. Define
 # FMT_CONSTEVAL to empty so format-string checking falls back to fmt's runtime
 # path instead of the broken compile-time one.
 CXXFLAGS:append = " -fPIC -std=gnu++20 -D_Nonnull= -D_Nullable= -I${STAGING_INCDIR}/boringssl -DFMT_CONSTEVAL="
+CXXFLAGS:append:libc-musl = " -DANDROID_HOST_MUSL"
 LDFLAGS:append = " -fPIC -L${STAGING_LIBDIR}/android"
 
 

