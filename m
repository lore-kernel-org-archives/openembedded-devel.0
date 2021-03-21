Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3974.1616316028531797562
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Mar 2021 01:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ix1VgvfT;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y6so15705854eds.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Mar 2021 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4RO8yerxPdnT5e+ZQ/yklo3F7VaJzNUHG9KsFGmTJY=;
        b=Ix1VgvfTN+0msLrFNynHIn2fpZJAoQqztMMZ1sfwwP+JXEXX6nf1wKFo7JPPb7IhCl
         VWgaLWZPJr8umzQ3mo6csryVZWgZz3kvTeZdKdlqD9o6txFcUGVN/NHwg3wuqsAWdLJg
         MoCpe5fwSw5muGhkL+iPs/N0OWMoh7t8Fw1l/b6bDx6bAWd+Xe70StY1HhXkwAV7d4Jx
         6ZtKKY4Eht5wKq4KU6UiPWsYHyTJhnLC/bloPvnZag3CydAfdcTjYxA4hBjpaADd7phX
         iGWEXdeRGqN0ZzfO5A+J8ulFP12ZDaUsIJwRqldctFlg4BlWUilIM5L1bl6offMj5iNW
         +b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4RO8yerxPdnT5e+ZQ/yklo3F7VaJzNUHG9KsFGmTJY=;
        b=sfDr96aODgff3lot/XZS0JD+sPIotEMan5ufmvuEJ2ROvKaQFx4u1r02l2w2Tu3Qpf
         huD/AoyF0jDtE4cQG3EpV9biNAagzHZS43MCheBBsgHFYdSEg0qNACdINivqEN1eGiHZ
         R0A6S/HMLqfA/fAEcndYaYpkj+FhUYJshNl5ezMhejolik/BZOL+YOm12Mm5MIBrcI9j
         /kzJVHrOOGnSKrARRa5Zk6yBy1vaIWnAvHZK3oB9Pn9bWC5uc3nvcxyUiaZFLX/xI51c
         kfk5EFSo4+IRYJCLCVM2OkofE8D7qa9dAl3poinKhUVsFK2xce4/sE6T9esB2XeJiq7t
         rWJA==
X-Gm-Message-State: AOAM531qP/z/nYvHo44VOiciLybzGU/kc42BS3Pf9fYo1QF1EiTxQr3m
	wb55EjE3eeDRgTwb5cWo0SdzUYQmW84=
X-Google-Smtp-Source: ABdhPJzr1RvbVx6Bzp5DMEIsIU0Szf0L1nddLCs2kIffXEde+udK1gGrp5m61rC5aHzyghWNCc+jTw==
X-Received: by 2002:a05:6402:2215:: with SMTP id cq21mr19922023edb.281.1616316026870;
        Sun, 21 Mar 2021 01:40:26 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c20sm6732308eja.22.2021.03.21.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 01:40:26 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] bandit.bbclass: drop
Date: Sun, 21 Mar 2021 09:40:24 +0100
Message-Id: <20210321084024.5281-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the identical bbclass is in meta-openembedded/meta-python layer, it depends
  on python3-bandit-native and isn't inherited by default, anyone who wants to
  use it can add meta-python layer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/bandit.bbclass | 63 ------------------------------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 classes/bandit.bbclass

diff --git a/classes/bandit.bbclass b/classes/bandit.bbclass
deleted file mode 100644
index dc1041e..0000000
--- a/classes/bandit.bbclass
+++ /dev/null
@@ -1,63 +0,0 @@
-# Class to scan Python code for security issues, using Bandit.
-#
-# $ bitbake python-foo -c bandit
-#
-# Writes the report to $DEPLOY_DIR/bandit/python-foo.html.
-# No output if no issues found, a warning if issues found.
-#
-# https://github.com/PyCQA/bandit
-
-# Default location of sources, based on standard distutils
-BANDIT_SOURCE ?= "${S}/build"
-
-# The report format to use.
-# https://bandit.readthedocs.io/en/latest/formatters/index.html
-BANDIT_FORMAT ?= "html"
-
-# Whether a scan should be done every time the recipe is built.
-#
-# By default the scanning needs to be done explicitly, but by setting BANDIT_AUTO
-# to 1 the scan will be done whenever the recipe it built.  Note that you
-# shouldn't set BANDIT_AUTO to 1 globally as it will then try to scan every
-# recipe, including non-Python recipes, causing circular loops.
-BANDIT_AUTO ?= "0"
-
-# Whether Bandit finding issues results in a warning (0) or an error (1).
-BANDIT_FATAL ?= "0"
-
-do_bandit[depends] = "python3-bandit-native:do_populate_sysroot"
-python do_bandit() {
-    import os, subprocess
-    try:
-        report = d.expand("${DEPLOY_DIR}/bandit/${PN}-${PV}.${BANDIT_FORMAT}")
-        os.makedirs(os.path.dirname(report), exist_ok=True)
-
-        args = ("bandit",
-                "--format", d.getVar("BANDIT_FORMAT"),
-                "--output", report,
-                "-ll",
-                "--recursive", d.getVar("BANDIT_SOURCE"))
-        subprocess.check_output(args, stderr=subprocess.STDOUT)
-        bb.note("Bandit found no issues (report written to %s)" % report)
-    except subprocess.CalledProcessError as e:
-        if e.returncode == 1:
-            if oe.types.boolean(d.getVar("BANDIT_FATAL")):
-                bb.error("Bandit found issues (report written to %s)" % report)
-            else:
-                bb.warn("Bandit found issues (report written to %s)" % report)
-        else:
-            bb.error("Bandit failed:\n" + e.output.decode("utf-8"))
-}
-
-python() {
-    before = "do_build"
-    after = "do_compile"
-
-    if oe.types.boolean(d.getVar("BANDIT_AUTO")):
-        bb.build.addtask("do_bandit", before, after, d)
-    else:
-        bb.build.addtask("do_bandit", None, after, d)
-}
-
-# TODO: store report in sstate
-# TODO: a way to pass extra args or .bandit file, basically control -ll
-- 
2.30.2

