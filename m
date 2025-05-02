Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB6EC3ABAD
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:50:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1330.1746226201986480805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 May 2025 15:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ug5si6iL;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso19571465e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746226199; x=1746830999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAtX7xo03Ltc2+uhdtQTuYgwbOpG4eBmxDt4Y/fxx84=;
        b=Ug5si6iLW2sSa23CdRr+QXFb7LPUWnu9Yr/W/0Aq2L6jEYI4V5xCpKnMSxS6g77z0i
         QTzq+1iWorFc5wyoljJ2CBNPdK6UKgVNiFLrCc4lrxr6hVlk1tjxBy2S6Ax3oyed6tNw
         aE3wNF6ij2UtshbXV+4qsw+b9yqpyb4rL/2ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226199; x=1746830999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAtX7xo03Ltc2+uhdtQTuYgwbOpG4eBmxDt4Y/fxx84=;
        b=YbWaGpkxLN3iBEviXRiN1QF7wmOqDXZkBQDvWlwCavhHvMk99NIpFAGjSQHFdGgZCo
         q4Pt+S9J1RROA2fQq7iK16Ag1MfauUJN1d/8oYsa4M00FliPtYPBMpZZyH36bMW48sDL
         Pq+2FOgjDoIKW97547m6+IooGc6zWmRIZzRhvvxVZbCLeyGDto1toq785h1LARs6Lxbn
         AbkVkobZ82AkS3kfTbo2u05LaoD4Hs8Z3/wRJziSTHVrLP3MDvVaQ8B3VzXQ9XA6AnXU
         xlggKk+zzBBMqx8UfLMa99IUPLC8TCkDU5pI1WKz/YscJfQZOeLGqRcAqaQRVo2HeOAL
         0ygQ==
X-Gm-Message-State: AOJu0Yyh2dYAWHmgoHV3OT0SLdoTP3D3KgdWJLRwlRr7L27o1dYVtzoF
	DSVnc89abpqsg5dom+wEP3BlaUD/VfZZDv0rxoVUEvuDRoo4CfNjh/O5Qfbwu8k0rdFfOu60kEL
	O
X-Gm-Gg: ASbGncvZIDGM9czvKpb6IgmirHtCJrf+uHDoBPGhc8Uo7Y8L9R0XDA43DS/phBWp5ho
	XDRqv5vV8tgkvG5ZdeqieS5W2aH4HFPJ4rzcc1Jz7K1SF2nqtmo019SuPhYzskQgbtk3ycGddQa
	CDFPCdWH4ludw6TxDcb+Gw8hOwu4+022UKB88BHPgfOuSksFGZY8aZihrdMqdLoc1+JPPwbJVA0
	k6r0Mz5Hz9nBMOaRAetRH+Bu16UaCC1sWb0yJMwH9euiWJzRu0B0O+bTyx3DUsKbdwPgGSG7IyH
	x20yEVH3M34P++EZRNu2qA3LKnzAsIe5e2YFXcyWDAhaKeH/+UEKy7KxDGk5EnyNoE8nyz7wy2G
	R5YXgpB7vgAm8uJuWopyu2RdWPhAObh5bXCmakJJxR7Ff3zn8
X-Google-Smtp-Source: AGHT+IGtiGBuNJTw3jA1SCYeQDahGWyoF0cN+OtLOkcU0HA2cHoo01ggKOM/u/NV6QB8dMr1fVop8g==
X-Received: by 2002:a05:600c:37ce:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-441bbeb511fmr44629735e9.14.1746226199538;
        Fri, 02 May 2025 15:49:59 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa008565a33a7c41f265.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8565:a33a:7c41:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm58235205e9.8.2025.05.02.15.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:49:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 1/3] python3-evdev: upgrade 1.9.1 -> 1.9.2
Date: Sat,  3 May 2025 00:49:43 +0200
Message-Id: <20250502224945.3081334-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 22:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117282

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

