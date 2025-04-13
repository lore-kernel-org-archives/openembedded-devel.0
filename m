Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2877BC369AE
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 08:08:24 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.25039.1744531699945534246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 01:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3XWEhEH/;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1721762f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744531697; x=1745136497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwUipkLPayRBMVMY/WEWBYD/1LRFLG77JccqIaat+ks=;
        b=3XWEhEH/X6UxJLb2pJQaHCCyJXCgb9fvjL80vnIcGHpccNS1z2UvsH42LiEELQD5tF
         iTvINRi66D8314agFBdmYR5P75keyGjQbsHATPJ4/sdGIX3jwkH5kFe1J2/YOSgvZzep
         ChhlOTxLwKWrucwhBRppig47WvMeebF7aAcLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744531697; x=1745136497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwUipkLPayRBMVMY/WEWBYD/1LRFLG77JccqIaat+ks=;
        b=UAziuapUwBY0t3ODJ0UotFOTHpIt8nGixSuP1/tHSxn78UeAIuQirG7PJnZpJDUMSO
         53Djkij4eZM387t/FDWXJiv+oNcTyL7KKYFQrP4DhGATkzM4SrXuMfFYccwczt7JFgQg
         ap4BYec+yazz1GmnQSZbV9YqRAvzPx4/7yhqwAo3TzVL9c3bu638ZmPmAMlRalrEOEeZ
         abo/q0zLYOZvgDN6EuIdYsqXyyBREBsY7PnAXCU77Ph+fZfPkaHTHd1F+naBharhwnXz
         yRl1FIA1BzehcYJvhe8zDWxivkVKDaKn33IDl9rRhxe1kzWW2TWevAas2BAV5uvpS1St
         3xLQ==
X-Gm-Message-State: AOJu0YzNTiwsFiWYQuxUsERg6xpqB1TTRf5WwBgrJ3v2VcHTIj5aV975
	VA5nXABMOJmI3RcUJqDMO0hjJ2JJ1cT84ZDm+iUuh2Ruh4B1Xrsyr5G3gznOsxQNsE8vp9bxPiR
	C9fdLJA==
X-Gm-Gg: ASbGnctbZ25rHd2ulxO99k/6Wduiv1r2ftx/afh+EaIVwoWnniP114m+na83pfIfJ1o
	lFwpfag8GffEz50BiNqacahmEgJ/SUNQ5GZ5TDevjwz/3QjvqbYquOA1nfkYvNmtet3KdzbLnbt
	3zn5dAw7o14NulXkg/rS2FYudf9IJyV8SllHwf2+TpZ26a6P5Qr5XCsGCjKUpwMFVpVjH92VYIi
	Lj2BNCqMcM3zoJGtgiq119UAD5fswh6W7Maiev3iyjSdh2lo9j8SXv5zHOuQ15PqcfUexEJuYyD
	SM+FUTe52yiA+xHrsRd7E/tm7A8Umi7FKaB8DjKSDdUne9A6yoErd45FW8PltMLRnIfSz7UG3ym
	fDV/a12srsV1lsUQLYS7xVvZwfx7DF3xhFecsLux/M8XgIqE=
X-Google-Smtp-Source: AGHT+IFvL3pKC9hlInSbSN5sWFdyUqzix2bLyMbDDgycrvK/vIDp3gUHz8J9uPFK2YYyx/5ptiymow==
X-Received: by 2002:a05:6000:1447:b0:391:3988:1c97 with SMTP id ffacd0b85a97d-39ea52036d2mr5932884f8f.17.1744531697401;
        Sun, 13 Apr 2025 01:08:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef00090089785c06a34e3.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:9008:9785:c06a:34e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm7289212f8f.68.2025.04.13.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 01:08:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 2/2] python3-evdev: Fix buildpaths errors and reproducibility
Date: Sun, 13 Apr 2025 10:08:02 +0200
Message-Id: <20250413080802.602658-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250413080802.602658-1-yoann.congal@smile.fr>
References: <20250413080802.602658-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116823

From: Yoann Congal <yoann.congal@smile.fr>

Add a submitted patch to support the reproducible generation of
intermediate file ecodes.c, then, use it to fix the buildpaths errors.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

