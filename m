Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37972.1795594149803937815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lgaer0VN;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so2111490eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594149; x=1796198949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrdUhKfZUwqCSZ77xhg4xfxdMgUXpFXWtFRNu0FpT+4=;
        b=lgaer0VNp7PK6i4I2aRWLUPBIirAl0RhNeGgVoBvKsffkHs0HAimRnHDXu+AOrcJ2r
         z/aiPda1tVwRTN0pZBIq5c7hBhITVGHiX+hfhMXSAAUTjPatlXYXjUgxY6bqVS6ML7Gq
         fB+cfTiwPers2FgnNPLOMnib+R+nq77V8/3ThtAEg+JVwHEa+0uX0hUSHgR5QJDA5hYF
         MijHxVZdFKoDg4H/ZTgMddcO1AfJQteTKeqM69oZFynoF5o9kl9AJDNgWKStMwK2jS4c
         zRz7bOJz2a31qMJB/I7lkfLUcSvL9rT2DcLKkCrUvStJzWfen502G152g3Yu0sShzZIW
         lpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594149; x=1796198949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrdUhKfZUwqCSZ77xhg4xfxdMgUXpFXWtFRNu0FpT+4=;
        b=sr0AKWBp/zt4hfrfEquUarcMDCqk4PunvxynwafCpDolzrAvnFtPFOVLHJNjAv7Ho5
         3VTVUkoFft0upZmOZNIhU5QkYiIY/OSg/8Yp2/BHGnJYVRnDCcM3F15bLs88edNPrCuS
         jjFCcUVwUauo2LWKhUxaQw1VF7Il+p3KRnS5bxpfHjlEaDjkLdQ3Y8KiVLhCM6OIduUR
         6m57nUSm7u0ibBClRogeng4WBCtcTr+SV7zEXbYL4U9cpdIibcINfBtI9BztI+LguU3L
         u0TufnSZBvjZUYUCHWJjaakd+mu2oIzL3lxLSVyK+REo9qgFsGC34LtgcbQ0IKPLSuNC
         5XOw==
X-Gm-Message-State: APuU4Z+Nb/Iv5vedQfCS0Nd2LI1KJyuQjaY16MsK961nPU6dWshnHaCB
	qXurwG1sDFdzoeZg5tREqb/VuujvjtqwqCaU0Kqo9x+6yZyuLzfznFJ8NSIEC5OV
X-Gm-Gg: AZFdTZd4VBnw8dRGp9zaQ3qR7k416eWkB13uzF0DBOY+r7ATfQMpALJPst/exwI+2pv
	RsHUcXcA6jh40GwukT8JUZM7f7FW0XuK4dyqFwFGtsBVzCE/bCYr9eplh5JTVEXZ8TUMMyM/Mco
	GIRkcOsKQY2q5CQyoiAYyIFEm4yT29gYuRg7502C9//o4jKixV80zwMW90KiDogZnzZxQOiIcvs
	9d5r9roIknLMqlN4mg5Y40fV8hv16pKyIy2EP1EtqPUzKYJeKM6sB08NG8zu+rARLuhVBjKyXEb
	kZfVrF7py8EMVYc17BPwnyJI24fqsCXi9D66zM0xu3Jl8EWHo031SuZuTPH5iZwAoIWL5mWqz+p
	35wZFYPUKUUi/ZITG0QGuhqSnJ1vLEFFgEPUMoHG+iDs6xlSzq9xAuNJ0/1MgmClegJBfRlZl5h
	jKmyhJyFKnneAx1cENTjVyCzKaQzyLOvmO7O32PYnfNNEkQ+uKLMJhqTjFcR1TcOxorM4426dfn
	+aQ0kCSvbidUatBAk397lEMv/yV82E2pqc8+VM1rxDMH5+Q18YFHucntGPJ2WzxrYIuwwFTFOAG
	1nKSiK7QCthLDG5+Y6c8dXoSegf7Vu5ytdoamDLg1xMGtGLF9quJl2o5qzoBv8IZnCM1oguJJ4s
	7kXU+cb0Cld3C6BJQdZc6QFGtzV4lXG3X180ijVJ8EN4NW2gVMdyTOUklUNvJtT00Ss/0c7/YE8
	PRPfBW27XzUP5ILmkPgHOVih/RwS418lCpL2HGkink92KJ2u4jUYj2J7o+F0oaXy+6fopPbYi7I
	wUAwbQ5FvrvEA2AObp4zNHmQJibvKG6TTmKZZBO8q4w3uZNT2vhZJAafvcQ5tSekZBOJtfhntfw
	0Uzr
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr26436358eec.7.1795594149005;
        Wed, 25 Nov 2026 00:09:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 14/14] python3-yappi: upgrade 1.7.6 -> 1.7.7
Date: Wed, 25 Nov 2026 00:07:25 -0800
Message-ID: <20261125080732.2419614-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133072
Content-Type: text/plain; charset="utf-8"

1.7.7 is tagged and released on GitHub but was never uploaded to PyPI,
so fetch the v1.7.7 tag from git instead of the PyPI sdist, and check
for new versions against the git tags.

Refresh the Python 3.15 coroutine fix to the version submitted upstream,
which also switches the guards to PY_VERSION_HEX.

Changes in 1.7.7:
- Fix a reference leak of the generator returned by PyFrame_GetGenerator
  in IS_SUSPENDED (#217)
- Add a regression test for it

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-coroutines-on-Python-3.15-and-newer.patch | 42 +++++++++++--------
 ...-yappi_1.7.6.bb => python3-yappi_1.7.7.bb} |  9 ++--
 2 files changed, 30 insertions(+), 21 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.7.6.bb => python3-yappi_1.7.7.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch b/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch
index 748cadbbe4..af8a3d40c8 100644
--- a/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch
+++ b/meta-python/recipes-devtools/python/python3-yappi/0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch
@@ -1,36 +1,44 @@
-From 99e422d5bcf9edff8427f9ccb5476ffec64c3348 Mon Sep 17 00:00:00 2001
+From fd1c436878b1ce7743ca921fd0cc3e52ef829859 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 24 Nov 2026 12:39:11 -0800
-Subject: [PATCH] Detect suspended coroutines on Python 3.15 and newer
+Date: Tue, 24 Nov 2026 22:09:38 -0800
+Subject: [PATCH] fix: detect suspended coroutines on Python 3.15+
 
 IS_SUSPENDED() checks the current instruction for YIELD_VALUE only when
-PY_MINOR_VERSION is 14. On 3.15 it falls back to the gi_frame_state
-check meant for Python < 3.13, which does not detect the suspension, so
-every resume of a coroutine counts as a new call and the asyncio tests
-fail, e.g.:
+the minor version is exactly 14. On Python 3.15 it falls through to the
+gi_frame_state check meant for Python < 3.13, which never reports the
+frame as suspended, so every resume of a coroutine is counted as a new
+call and the asyncio tests fail, e.g.:
 
-  test_asyncio.py::SingleThreadTests::test_issue58
+  test_asyncio.SingleThreadTests.test_issue58
   AssertionError: 2 != 4 : async_sleep 2 0 4.005451 2.002725
 
-Use the instruction check for 3.14 and later.
+Use the instruction check for 3.14 and later, and switch these guards
+to PY_VERSION_HEX like the rest of the file.
 
-Upstream-Status: Pending
+Tested with Python 3.15.2 (test_asyncio and test_asyncio_context_vars
+went from 6 failures to passing) and Python 3.14.
+
+Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/223]
 AI-Generated: Uses Claude Code
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- yappi/_yappi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ yappi/_yappi.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/yappi/_yappi.c b/yappi/_yappi.c
-index 8b867ef..ffd9e68 100644
+index 1dbb72e..e599c9e 100644
 --- a/yappi/_yappi.c
 +++ b/yappi/_yappi.c
-@@ -228,7 +228,7 @@ IS_SUSPENDED(PyFrameObject *frame) {
+@@ -229,10 +229,10 @@ IS_SUSPENDED(PyFrameObject *frame) {
      if (gen == NULL) {
          return 0;
      }
 -#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION == 14
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 14
++#if PY_VERSION_HEX >= 0x030E0000  // Python 3.14+
      unsigned char curr_op_code = (*frame->f_frame->instr_ptr).op.code;
-     return curr_op_code == YIELD_VALUE || curr_op_code == INSTRUMENTED_YIELD_VALUE;
- #elif PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION == 13
+     suspended = curr_op_code == YIELD_VALUE || curr_op_code == INSTRUMENTED_YIELD_VALUE;
+-#elif PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION == 13
++#elif PY_VERSION_HEX >= 0x030D0000  // Python 3.13
+     suspended = FRAME_STATE_SUSPENDED(gen->gi_frame_state);
+ #else
+     suspended = gen->gi_frame_state == FRAME_SUSPENDED;
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb b/meta-python/recipes-devtools/python/python3-yappi_1.7.7.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.7.7.bb
index be47e4ea40..9a0a38b9bc 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.7.7.bb
@@ -4,14 +4,15 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "c94281936af77c00c6ac2306a0e7f85a67e354d717120df85fcc5dfb9243d4dd"
-
-SRC_URI += " \
+# 1.7.7 is tagged on GitHub but was never uploaded to PyPI
+SRC_URI = "git://github.com/sumerc/yappi.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
            file://0003-Detect-suspended-coroutines-on-Python-3.15-and-newer.patch \
            "
+SRCREV = "d6593ea0bce0a13c65bd44511c3cee858b5985e8"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "\
     python3-datetime \
