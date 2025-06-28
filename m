Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969E5C54ED1
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 16:37:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1341.1751128655110622944
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jun 2025 09:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c9YiZsYG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso21950545e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751128653; x=1751733453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCuCIMp2J/j5NZl0mz+dHzW+46BzsphCsF9CNd+dnp8=;
        b=c9YiZsYGOnJwAdF4T2lz4HeLMNOQbgPfkj/y9Y98pJIta3wiQyDXURa8N9ncT/GNLb
         IZl+wD2jCt6IKaOmF2Jm9B/zZ0KqbTxFdXncyjDyncs05AvFpi2IAtG63fFwj1Pt6M+x
         sA2tvty6Q5BWh3LxWXdqqjgs5GHLR/nIu0sRls3dh2Ouf2+V410ckqITaUOeU0yYcrl1
         0QVF09KIe2xtssVl/IAUgq2FFCXze3UDPW3xltYlm97Az0QStXJh6/YfSYG+7vNIxFip
         8IlQi3+7rlCQmeBYJP/+uitm6ntCS5EjE9+S4bIH4e+dcZ+gf/xwrOlnf552fbtcWdRh
         lSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128653; x=1751733453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCuCIMp2J/j5NZl0mz+dHzW+46BzsphCsF9CNd+dnp8=;
        b=AWD2iIgUb+Opxyz9NaM2kYtTuHCJZdLSH/xpUdCS2J3bOmtZcTQc33SAhNFUeA+gR+
         GTbV2YRZy0/GY6HBEmFmfpZajyFT7H009QofZ6EXfOHX94FuuEgpgsaHk7F+7z3tmShI
         sMBi30rskIQxNATnCoPp2h/z71HOgJEtxl9ZuZk2ZylNqywzPZOngKb3zZe4rYCz3kuJ
         ovfLTP56B0DIUV+H6EI81KRQW57sX+AZATdY80IdHURAutT8uP6RrBG82c5iGHsMQEX0
         flwOcR1CPg8J1DO0NJAXlkItp+wGfDo+lPARwu29fak4IhmCzhtT8EXffTXNTawsPGVM
         cwpg==
X-Gm-Message-State: AOJu0YyZR84dQxIHifXXLZsyus6CEYMUwW/Q93/+6KrwgqQsjp5jTN+o
	Iv4lyCMj9XUz3xUPbSW7coTIRmTIREaalhdWOgZo98fW/wlH/MgZPwvvwIGavg==
X-Gm-Gg: ASbGncvtaPs4WO0HxzKeNFpDZvRYqdqTppbc5LlY9c6H2I4Ay+hDH89lZD1pvJvWqcy
	D/+0sTZ/3FVuqRbQ+mxWEpgWWkOCPeBugKHYpa/TGEDSxyJ9U0JiKMF3B/Ci3ZpUCimBSk4jpi1
	1y60HVYGkGZurQKZREbiNfOnBgUdx0AdmZ/lccHlnH6P4knTgt7D+4vNvJqrT/kapxkfvhIVd/v
	iWWv2ehTDSrzqB3Q/4Q1K5U8qAow/aVsbUS9YIdPnnalZqMljXbcqZsDrYxugL1uLh9sEHun15C
	FXq44gmNfhTtGXDW2lC2t/E5Djvpd7i5lOj1BvFtJgU2tayx2WvAydJ6ZjkLwGC8
X-Google-Smtp-Source: AGHT+IE68dxDWGZFrufCxWmbB5X4/Bmq7YTqJp2Njbm4GIP0zvUMtIVx0yS7XLr5uHtP65GmbAG2Ag==
X-Received: by 2002:a05:600c:3b2a:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4538edeb18dmr89879035e9.0.1751128653232;
        Sat, 28 Jun 2025 09:37:33 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a3fdfa6sm85547275e9.22.2025.06.28.09.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:37:32 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 2/2] python3-evdev: Fix buildpaths errors and reproducibility
Date: Sat, 28 Jun 2025 18:37:27 +0200
Message-ID: <20250628163727.859462-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250628163727.859462-1-martin.jansa@gmail.com>
References: <20250628163727.859462-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 16:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118161

From: Yoann Congal <yoann.congal@smile.fr>

Add a submitted patch to support the reproducible generation of
intermediate file ecodes.c, then, use it to fix the buildpaths errors.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibility-option-for-building-ecodes.c.patch | 116 ++++++++++++++++++
 .../python/python3-evdev_1.9.1.bb             |   5 +-
 2 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch

diff --git a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
new file mode 100644
index 0000000000..e730519884
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-ecodes.c.patch
@@ -0,0 +1,116 @@
+From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sun, 13 Apr 2025 00:52:13 +0200
+Subject: [PATCH] Add a reproducibility option for building ecodes.c
+
+ecodes.c currently contains the kernel info of the build machine and the
+full path of the input*.h headers: This is not reproducible as output
+can change even is headers content do not. Downstream distributions
+might package ecodes.c and get non-reproducible output.
+
+To fix this: introduce a --reproducible option in the build:
+- in setup.py build_ecodes command
+- in underlying genecodes_c.py
+
+Note: These options are disabled by default so no change is expected in
+current builds.
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://github.com/gvalkov/python-evdev/pull/242]
+---
+ setup.py                 | 13 ++++++++++---
+ src/evdev/genecodes_c.py | 17 +++++++++++------
+ 2 files changed, 21 insertions(+), 9 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 6b721d7..3371199 100755
+--- a/setup.py
++++ b/setup.py
+@@ -14,7 +14,7 @@ curdir = Path(__file__).resolve().parent
+ ecodes_c_path = curdir / "src/evdev/ecodes.c"
+ 
+ 
+-def create_ecodes(headers=None):
++def create_ecodes(headers=None, reproducibility=False):
+     if not headers:
+         include_paths = set()
+         cpath = os.environ.get("CPATH", "").strip()
+@@ -65,7 +65,10 @@ def create_ecodes(headers=None):
+ 
+     print("writing %s (using %s)" % (ecodes_c_path, " ".join(headers)))
+     with ecodes_c_path.open("w") as fh:
+-        cmd = [sys.executable, "src/evdev/genecodes_c.py", "--ecodes", *headers]
++        cmd = [sys.executable, "src/evdev/genecodes_c.py"]
++        if reproducibility:
++            cmd.append("--reproducibility")
++        cmd.extend(["--ecodes", *headers])
+         run(cmd, check=True, stdout=fh)
+ 
+ 
+@@ -74,17 +77,21 @@ class build_ecodes(Command):
+ 
+     user_options = [
+         ("evdev-headers=", None, "colon-separated paths to input subsystem headers"),
++        ("reproducibility", None, "hide host details (host/paths) to create a reproducible output"),
+     ]
+ 
+     def initialize_options(self):
+         self.evdev_headers = None
++        self.reproducibility = False
+ 
+     def finalize_options(self):
+         if self.evdev_headers:
+             self.evdev_headers = self.evdev_headers.split(":")
++        if self.reproducibility is None:
++            self.reproducibility = False
+ 
+     def run(self):
+-        create_ecodes(self.evdev_headers)
++        create_ecodes(self.evdev_headers, reproducibility=self.reproducibility)
+ 
+ 
+ class build_ext(_build_ext.build_ext):
+diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py
+index 5c2d946..24cad27 100644
+--- a/src/evdev/genecodes_c.py
++++ b/src/evdev/genecodes_c.py
+@@ -15,22 +15,27 @@ headers = [
+     "/usr/include/linux/uinput.h",
+ ]
+ 
+-opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs"])
++opts, args = getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs", "reproducibility"])
+ if not opts:
+-    print("usage: genecodes.py [--ecodes|--stubs] <headers>")
++    print("usage: genecodes.py [--ecodes|--stubs] [--reproducibility] <headers>")
+     exit(2)
+ 
+ if args:
+     headers = args
+ 
++reproducibility = ("--reproducibility", "") in opts
++
+ 
+ # -----------------------------------------------------------------------------
+ macro_regex = r"#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|ID|EV|BUS|SYN|FF|UI_FF|INPUT_PROP)_\w+)"
+ macro_regex = re.compile(macro_regex)
+ 
+-# Uname without hostname.
+-uname = list(os.uname())
+-uname = " ".join((uname[0], *uname[2:]))
++if reproducibility:
++    uname = "hidden for reproducibility"
++else:
++    # Uname without hostname.
++    uname = list(os.uname())
++    uname = " ".join((uname[0], *uname[2:]))
+ 
+ 
+ # -----------------------------------------------------------------------------
+@@ -138,5 +143,5 @@ elif ("--stubs", "") in opts:
+     template = template_stubs
+ 
+ body = os.linesep.join(body)
+-text = template % (uname, headers, body)
++text = template % (uname, headers if not reproducibility else ["hidden for reproducibility"], body)
+ print(text.strip())
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
index b8930c97d5..af88770c59 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
+SRC_URI += "file://0001-Add-a-reproducibility-option-for-building-ecodes.c.patch"
 SRC_URI[sha256sum] = "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee62284bf427238abe45ee"
 
 inherit pypi python_setuptools_build_meta
@@ -12,7 +13,8 @@ do_compile:prepend() {
 }
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
-    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h'"
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
+    --reproducibility'"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
@@ -21,4 +23,3 @@ RDEPENDS:${PN} += "\
     python3-shell \
     python3-stringold \
     "
-INSANE_SKIP:${PN}-src = "buildpaths"

