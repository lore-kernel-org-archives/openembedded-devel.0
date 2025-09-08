Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BD1CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:53:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.6723.1757367998795984280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJ73blh0;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: rmmuniz@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-81076e81a23so529604585a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757367998; x=1757972798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nnH9KgC5gaBZzN+IRwGOSkIc/vf9E+YIoevfN/MgDU=;
        b=gJ73blh0kKYzocFAwti6Q0RJ/3OA2Ss9pay/kWrQJIaj4zO7jom2gNz/YTDAr0bG/b
         63RJf41UzjE40Dfjk7SK+BUml3URtMKGPSiRv+ZGv70QE7lwomIwx8Zz4RX9XGFgV3uF
         epdgg3S4HKwGtyTdAIUBeL/LyBcGkl9WJYmjkwrfd6CDbhOqKA6jY+72gwngt2NQ/Gn5
         qKLGhlYUqSdHdYeOL4uss+ux5A7/8bPXXuoIHw/JO05W9oJ4E6CNUwWSuP3o7rN6Zs2W
         MQI0L7VYhuH1yy/aQ+b0SbfzBwryXbOQMJ1HaZ+HkSKeqmzaIU1087PnRPIaLcyVZ1/T
         35/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757367998; x=1757972798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nnH9KgC5gaBZzN+IRwGOSkIc/vf9E+YIoevfN/MgDU=;
        b=EMwRCmd/b/4rBNca/xk6AzYULSHL3uOVoD4Za7UXJEZheM0vLVaPN1gVi2omaJYbYJ
         peyRjQodDEtHFkEpvVsZPxd29cev/E289Jq5rEJCxE5JIunyZS68sxM0ENCa9NJNv277
         lkRHbl6ljAhIywu1XUqfzyWB/422ia1uH6ntQ0IiFD1aO31xeelemufRFZIapsYjlNDR
         us+n0L86OtfzPGbRUd8G6RZO5CEdhjS+IWujVK/VOFWCuJxcXJupuCyHgOshMvte5POH
         tIidDDN8VFbkPr/55rkcb9SZueWW0T3Scu5fqKrG6U7SFOlb5o8e90oENu1nk9fjH/y1
         6CwQ==
X-Gm-Message-State: AOJu0YzpZIxrJGLxUOnH9E/pE9BxhwEuVbx/z8BYMyxBLbibZDSa6uHl
	afbyU3V8Kl6VmVEBJpPYqkDkgF8nBqqFHbJfvFR56jch4egtGfbS7pLuqOgvwOFM
X-Gm-Gg: ASbGncuzGza7RR0/KODEFqari8j8+frkIOEuDestB+SwsBIdi4BXxlw+u8S8Rh0TX5V
	4tIhKKy0IpAd4ib8U5LBk3w05ACkATNySG94K7JbysgZZhVy9nAk+kW/BsvPPDAKta3QgJ7zG8n
	5fqpkrCPNVnB/BH8teOvjFoF3wCp9Rl4aSiIn10yjwFPzZSdLzg/Hj71wWgl6cSRIgLhDqIxeJK
	ZpycMMu8AMqbTluc4R5QR0HqPejdsmOJdw/P2nSaxfoYVLVf3THP/07+LtfMVY4cPXLdkdrUx8n
	QFPScDd/0nfzXkB7nAhqIV++CBk0dMgSPXazpS4wqi/YIy5CKn+HX9jSItAm+TPiMYJ0WoKDNjk
	llm1fXBGnpQRQVe4ngaY=
X-Google-Smtp-Source: AGHT+IGJlOEuumBcFpBbo+rzu8/PFCXhKMGxuX+KNs6UslclOylqdkNzz8xcLa3gwV3fMiQvWc+F7g==
X-Received: by 2002:a05:622a:41:b0:4b5:d70a:2245 with SMTP id d75a77b69052e-4b5f848ab9cmr117036681cf.77.1757367598432;
        Mon, 08 Sep 2025 14:39:58 -0700 (PDT)
Received: from rmuniz-SER5.. ([64.228.161.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbf54f7sm680501cf.47.2025.09.08.14.39.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:39:57 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/3] python3-evdev: upgrade 1.9.1 -> 1.9.2
Date: Mon,  8 Sep 2025 17:39:45 -0400
Message-Id: <20250908213947.481697-1-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119336

From: Yoann Congal <yoann.congal@smile.fr>

* Remove a merged reproducibility patch
* Adapt the --reproducible option

Changelog (from [0]):

1.9.2 (May 01, 2025)
====================
- Add the "--reproducible" build option which removes the build date and used headers from the
  generated ``ecodes.c``. Example usage::

    python -m build --config-setting=--build-option='build_ecodes --reproducible' -n

- Use ``Generic`` to set precise type for ``InputDevice.path``.

[0]: https://github.com/gvalkov/python-evdev/blob/v1.9.2/docs/changelog.rst

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibility-option-for-building-ecodes.c.patch | 116 ------------------
 ...-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 119 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.1.bb => python3-evdev_1.9.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
deleted file mode 100644
index e730519884..0000000000
--- a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Sun, 13 Apr 2025 00:52:13 +0200
-Subject: [PATCH] Add a reproducibility option for building ecodes.c
-
-ecodes.c currently contains the kernel info of the build machine and the
-full path of the input*.h headers: This is not reproducible as output
-can change even is headers content do not. Downstream distributions
-might package ecodes.c and get non-reproducible output.
-
-To fix this: introduce a --reproducible option in the build:
-- in setup.py build_ecodes command
-- in underlying genecodes_c.py
-
-Note: These options are disabled by default so no change is expected in
-current builds.
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/gvalkov/python-evdev/pull/242]
----
- setup.py                 | 13 ++++++++++---
- src/evdev/genecodes_c.py | 17 +++++++++++------
- 2 files changed, 21 insertions(+), 9 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 6b721d7..3371199 100755
---- a/setup.py
-+++ b/setup.py
-@@ -14,7 +14,7 @@ curdir = Path(__file__).resolve().parent
- ecodes_c_path = curdir / "src/evdev/ecodes.c"
- 
- 
--def create_ecodes(headers=None):
-+def create_ecodes(headers=None, reproducibility=False):
-     if not headers:
-         include_paths = set()
-         cpath = os.environ.get("CPATH", "").strip()
-@@ -65,7 +65,10 @@ def create_ecodes(headers=None):
- 
-     print("writing %s (using %s)" % (ecodes_c_path, " ".join(headers)))
-     with ecodes_c_path.open("w") as fh:
--        cmd = [sys.executable, "src/evdev/genecodes_c.py", "--ecodes", *headers]
-+        cmd = [sys.executable, "src/evdev/genecodes_c.py"]
-+        if reproducibility:
-+            cmd.append("--reproducibility")
-+        cmd.extend(["--ecodes", *headers])
-         run(cmd, check=True, stdout=fh)
- 
- 
-@@ -74,17 +77,21 @@ class build_ecodes(Command):
- 
-     user_options = [
-         ("evdev-headers=", None, "colon-separated paths to input subsystem headers"),
-+        ("reproducibility", None, "hide host details (host/paths) to create a reproducible output"),
-     ]
- 
-     def initialize_options(self):
-         self.evdev_headers = None
-+        self.reproducibility = False
- 
-     def finalize_options(self):
-         if self.evdev_headers:
-             self.evdev_headers = self.evdev_headers.split(":")
-+        if self.reproducibility is None:
-+            self.reproducibility = False
- 
-     def run(self):
--        create_ecodes(self.evdev_headers)
-+        create_ecodes(self.evdev_headers, reproducibility=self.reproducibility)
- 
- 
- class build_ext(_build_ext.build_ext):
-diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py
-index 5c2d946..24cad27 100644
---- a/src/evdev/genecodes_c.py
-+++ b/src/evdev/genecodes_c.py
-@@ -15,22 +15,27 @@ headers = [
-     "/usr/include/linux/uinput.h",
- ]
- 
--opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs"])
-+opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs", "reproducibility"])
- if not opts:
--    print("usage: genecodes.py [--ecodes|--stubs] <headers>")
-+    print("usage: genecodes.py [--ecodes|--stubs] [--reproducibility] <headers>")
-     exit(2)
- 
- if args:
-     headers = args
- 
-+reproducibility = ("--reproducibility", "") in opts
-+
- 
- # -----------------------------------------------------------------------------
- macro_regex = r"#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|ID|EV|BUS|SYN|FF|UI_FF|INPUT_PROP)_\w+)"
- macro_regex = re.compile(macro_regex)
- 
--# Uname without hostname.
--uname = list(os.uname())
--uname = " ".join((uname[0], *uname[2:]))
-+if reproducibility:
-+    uname = "hidden for reproducibility"
-+else:
-+    # Uname without hostname.
-+    uname = list(os.uname())
-+    uname = " ".join((uname[0], *uname[2:]))
- 
- 
- # -----------------------------------------------------------------------------
-@@ -138,5 +143,5 @@ elif ("--stubs", "") in opts:
-     template = template_stubs
- 
- body = os.linesep.join(body)
--text = template % (uname, headers, body)
-+text = template % (uname, headers if not reproducibility else ["hidden for reproducibility"], body)
- print(text.strip())
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index af88770c59..28c8ea4bc1 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI += "file://0001-Add-a-reproducibility-option-for-building-ecodes.c.patch"
-SRC_URI[sha256sum] = "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee62284bf427238abe45ee"
+SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
 
 inherit pypi python_setuptools_build_meta
 
@@ -14,7 +13,7 @@ do_compile:prepend() {
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
     --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
-    --reproducibility'"
+    --reproducible'"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
-- 
2.34.1


