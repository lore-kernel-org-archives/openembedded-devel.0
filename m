Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36944.1793168059053147120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Uyh6u6bj;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-156cbe59622so690280c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 23:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168058; x=1793772858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDbXR9OubXR3P3gCcqb2Rmfx7zW4ektT5nnU1K7da28=;
        b=Uyh6u6bjKrqCeH17buuCUxeVVbL/g2LcPctywUk+Vxpw7/AKTQKZwZKXbc3kVlsLQ3
         rTAZFRQ+CVSQlk+n45p64V5AokR8sjuyy5n0nBTK2eaiXRQwKw5Gzb7YLtYp5GeiM8KJ
         0BuR+BgnLUFc6qEUwJ5sQawZOsVHUUmACl/IZkRYjr3F+k3jf4HCipC9sgjVa0h4uc/k
         xa7cfkNxgwVRXVapdtKpGQI3OjlB6ZCDP2RWshRp1js1KrzaQXxFALmINqNhvwtQmMah
         GwPqHCyGMbSc3iXt9ib/9gtBB43fkVtR7akJP9dWSS687m8sZLmP+BRxvJ7ByytXw6We
         CenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168058; x=1793772858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDbXR9OubXR3P3gCcqb2Rmfx7zW4ektT5nnU1K7da28=;
        b=NqVBlZX2w0Phw+KvIRpspGj8jb2wDcW6e+1uPuCXixAH5xs87JT6DtQQKoI9VOVOFK
         JW6rRgMgdlmG/C3A+AHk+i63/NBOi/cHZ/zP0WafVGuHvNfOBPeqbKzhhvp2PzVCZs1z
         WRRdRbaHZoiXx51bhOra8XtcYGuaQH5uZl09TPr6KM667xzMKmEWcHcDFLDiqUfjZ57G
         Zt5gucKAq4dIY/XfMrrD6uGgI3rZcDOkwhnkJQ5MRBcA/R2eV2HkqE3tYio2K4LU/wf3
         1r/YBBFV7NuewHX14cSH1kP2t0i3nzV30HMv95TjBievGDMiJ2HTPalbyDH/f4A8DfYQ
         pQPA==
X-Gm-Message-State: AFq9FYKcpYghqszBk8ayDkXcX2LzHJk9JEA+SziSjS66MukyNhrwh2fz
	T970N7peCXMR/UhRJKsOeeEbh1vS2nWESFQMg/vcokceJ1rbrwPJYT372GwkfK12pU0=
X-Gm-Gg: AYBFou1tdc8tDW0bgNZ+RpWrjlVLFv8iT8zOW182UqGCpt/krkL1kYxAg3Z0NcNsE5W
	n+77RAfCxTOW7PFfv9rUr171gSUdSx2vTRlV1zuLsL3V5cI57IMLbqHp2IhQ0bv5YbwmYtqKD08
	i0FjW4NMk4wk2jxwngjxOY6jTzeq6X4K/XyuYE0Q5/4irvH6OzsoMc7A9wQWgBMIjcgcuknIjHG
	31I0sqvF/hg6pgLoi+yvsnNFlBALhrBTRDkHDuh8Ta6hTfVZ8cCNbfelqXRo3NLAGQQZ2vFyP9+
	bPAp53Uf5F+t+8p4cAmb5e7ldXNqDw8vkCBP/pkNJRhS0uzEEKHIIUeyoxnNe1CU0V+aLX+qkMw
	dJjDYDMq7bwVgKPwlTPr+CgpqXX7RvtXhsF1wEY68SYb4m9QbBFtUaneYIdIssO/HuCRJbxFgeD
	l2O2vTfd8/ioz9RYqbOhA53IMJeAi+E/3ecyPWGmVRFzANaipT6/GAhlB9H/De20ql6Fl5SOrud
	N705bR3w52D83lXyrSLwaR0mZk95JDpoI47fpWNf4bLg4pDhokSvqNas6eaA7CpCuX/EQr6FAPB
	4rpjq5u4X7DAoaFAQ/vEP4XdWKTDwDqPMXo7KgwTd0UMhLYpmusd4P+RiDrA3FdcF7A4AL6Pg8W
	GoEzrVK0h0s65VNtRrslX1zjBYTr2wl9Z93zJj6TuvG8kANQGTYqaHXavXRHqooqzbMiUObNtjL
	O+cogMYy+bkUzazY81w1nzYnoFuT22TEq7iHecqf0zwmAfjqXD8BUFWJmhao4UlerfdKIvX8UDI
	vrX6NkiPUFVnA6xr7UqE0PRUyCn9oovoXKEqv6XT1J0C/gR0qMmG15Mo3qHcuWGoSg0P8wBwxlt
	W33M
X-Received: by 2002:a05:7022:629:b0:196:4eeb:76e8 with SMTP id a92af1059eb24-1a6cf914491mr2482204c88.20.1793168058136;
        Tue, 27 Oct 2026 23:14:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm3654486eec.12.2026.10.27.23.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:14:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] tuna: Fix build with PEP 517 frontends
Date: Tue, 27 Oct 2026 23:14:14 -0700
Message-ID: <20261028061414.4062430-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 06:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131622
Content-Type: text/plain; charset="utf-8"

setup.py imports tuna.version from the source tree. The setuptools
build_meta backend does not put the source directory on sys.path, so
do_compile fails:

  File "<string>", line 9, in <module>
  ModuleNotFoundError: No module named 'tuna'
  ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

It only worked so far because python3targetconfig added an empty entry,
i.e. the current directory, to PYTHONPATH. The same happens with a plain
"python3 -m build" outside of OE.

pyproject.toml already gets the version from tuna.version via
[tool.setuptools.dynamic], so drop the import from setup.py.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...una-Do-not-import-tuna-from-setup.py.patch | 48 +++++++++++++++++++
 .../recipes-extended/tuna/tuna_0.21.bb        |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-extended/tuna/tuna/0001-tuna-Do-not-import-tuna-from-setup.py.patch

diff --git a/meta-python/recipes-extended/tuna/tuna/0001-tuna-Do-not-import-tuna-from-setup.py.patch b/meta-python/recipes-extended/tuna/tuna/0001-tuna-Do-not-import-tuna-from-setup.py.patch
new file mode 100644
index 0000000000..94b8fd917c
--- /dev/null
+++ b/meta-python/recipes-extended/tuna/tuna/0001-tuna-Do-not-import-tuna-from-setup.py.patch
@@ -0,0 +1,48 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Oct 2026 22:59:58 -0700
+Subject: [PATCH] tuna: Do not import tuna from setup.py
+
+Commit cb5593a2be9c ("tuna: Get the tuna version from a single source")
+made setup.py import tuna.version. setup.py runs from the setuptools
+build backend, which does not put the source directory on sys.path (only
+the legacy backend does), so building with a PEP 517 frontend fails:
+
+  $ python3 -m build --no-isolation --wheel
+  ...
+    File "<string>", line 9, in <module>
+  ModuleNotFoundError: No module named 'tuna'
+  ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
+
+pyproject.toml already takes the version from tuna.version.TUNA_VERSION
+via [tool.setuptools.dynamic], which setuptools reads without importing
+the package, so drop the import and the version argument from setup().
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-rt-users/20261028061243.4061773-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ setup.py | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 8036a64..07ec523 100755
+--- a/setup.py
++++ b/setup.py
+@@ -5,9 +5,6 @@ import sysconfig
+ from os.path import isfile, relpath
+ from setuptools import setup
+
+-# Get the tuna version from a single source
+-from tuna.version import TUNA_VERSION
+-
+ if isfile("MANIFEST"):
+     os.unlink("MANIFEST")
+
+@@ -19,7 +16,6 @@ if SCHEME not in sysconfig.get_scheme_names():
+ PYTHONLIB = relpath(sysconfig.get_path('platlib', SCHEME), '/usr')
+
+ setup(name="tuna",
+-      version = TUNA_VERSION,
+       description = "Application tuning GUI",
+       author = "Arnaldo Carvalho de Melo, John Kacur",
+       author_email = "acme@redhat.com, jkacur@redhat.com",
diff --git a/meta-python/recipes-extended/tuna/tuna_0.21.bb b/meta-python/recipes-extended/tuna/tuna_0.21.bb
index de80d1aa7a..0e96eabbdc 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.21.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.21.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Tuna"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

-SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main \
+           file://0001-tuna-Do-not-import-tuna-from-setup.py.patch \
+           "

 SRCREV = "cb5593a2be9c26c8865f46bf29723c1ce93890aa"

