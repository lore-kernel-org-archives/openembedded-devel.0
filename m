Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1975.1795113519869473820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zzLIfl8w;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so70259b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113519; x=1795718319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vZkjbABuvAZ1pXBbcVBX1gfmq3xFMMbHek748rgTI0=;
        b=zzLIfl8wNyYWrAh5aWLE4roY4xFLWMjZPwnFRX7pgLqtOxUOp+G7vSA/WFtMIm1Bt5
         Xf235og8xn/Oh9nsaaUZDnTd8UmNOdFy5hX12BqcpEh1tAqZ74m038OZe/jV+0CSJCBq
         tvz8GmSiyTbQh/kYBX+g3QCt/KM8kt+VPLPhfBA+CPmus0fds0g0YNm3Qmhlyu1IeX1Z
         Wj88tbWhBN2qkoynZegDdNMNW4HB42UN/mtW7DD1f2weV/xLokYmVQ8Hgbo+tQ81wi5p
         BC7YhEq47Rrzijo5Bc3q0qnXZ++8SJntFwsuChIP8qDY6hcNsqsosoDfW08ipwDXcwIg
         U4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113519; x=1795718319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vZkjbABuvAZ1pXBbcVBX1gfmq3xFMMbHek748rgTI0=;
        b=Vgn9fiRZ9wc6X1X/Q242futIMTDW0cSeRurcFa++uv65i4yvnaLhslao1+/v8wwUHz
         q6RpfyRzzMg5Ib9AaBX8y3mnB6NYHS7JI5Z56IvsmyyXYvwpNOlQ/KBIwtgJ7ip7ZWhl
         kPedXlULH5AS492qLPzZXeoxn+z1ZY20pXhDre5FPUvXphNer/HcJ6Y4V/N7r+qNdSLx
         TY+HDAsME1fhZeyGlLy04CHIxvePZ6VY27rSY4IZuR5eJ0LDdLMPsKeFBgtX8SGorSvK
         QX3Y1UCcBBkgy1LqXQi2V7tgdz6tEvhvRd2rOiTEdycjPEj3OGxg6b01i9NVeIFdXlI+
         wyiQ==
X-Gm-Message-State: APuU4Z9q91xdh57ndRXxel6preWvPFt2P6DXzNyay47tIlDeJXNdugjh
	hJxRs8Px0T14vPnNGCPOwoisXhZgZCNhO9AaA1rPJZ6n1xeut1D1mb+K0vsx4w==
X-Gm-Gg: AYBFou0PMI3UCOsK6twzoTwVYlKH4SN50S6tYLpG1lH9gQ0rd5S1+QQBuM5t1X+280O
	6nHEkbPYR+0QGczH1u4umiRpVDVEwaMn3RckGfJlreWOzYs85huJQ+7jTkKx+TLgfSzxAIG6ipd
	EmpiNZ+GEA/lX9UrZzuRwS7/ZHdHAI7PrhLUqdt39msgD2ySl5rmdZlNqldvGjxk+rWyUhd1crQ
	SqV1wnidA39VhXvBnpaE2O7Epk7WlqIA2kwcCBg28nP9k+u0TOoLIFabBakUjIoD82tI3ONA80r
	sw/yfnm5/c8sQTMt08P6cMQ4+fuC1Smko+8ukiqhOAnFZZvUIaWumo4ZvlwnPPDhIn1XJOdultB
	mbdfUHKnw1yjM8cg0xyGGb6XVTx9/bX1DF/1FYyTfXabRol8hWicaQ1gkiCxsKRpdEsUnEBbS81
	RAzTcV2d+6NCI2frmuah29vvmvZTd4r+jKX1zwVsccaYQmkNIVRr05BSlA4xMGv7NELF47Cd22M
	dbx3BntuPPGEx0/GAcfNzBtZBTnT1t2bA0Ao7kdfecODWxUM0vWF7GSprvgOT+9Pln/wA43c+Tj
	efC/ZzO4q7cKeVc1PSOqdK2mDp3mhZCUVuwwaDYaHJytXY+k3Jm0osL7BS6u0bGz
X-Received: by 2002:a05:6a00:21c8:b0:89d:f19f:5dd1 with SMTP id d2e1a72fcca58-8c87c862aadmr475760b3a.33.1795113519214;
        Thu, 19 Nov 2026 10:38:39 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 63/64] tuna: Fix build with PEP 517 frontends
Date: Fri, 20 Nov 2026 07:33:31 +1300
Message-ID: <d9e188a808ad3b026b84829e5b3170b99a173a0a.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132753
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

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
(cherry picked from commit df1403411fb4a301af728cf225a49860c5ea3d7c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 
