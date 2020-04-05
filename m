Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.20859.1586104950256491359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id a6so12788852otb.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8MpZFKp1tj0FaguZ25PRmcZz9SihWYAXo0QL3ffg5rk=;
        b=PQbnLn2jU073NWtM5D0B8NwZfyGvz2jYs5MK/LtbO64RvZrTFjZWk1ghxOOSbE75O7
         ivdF0qAEz7A6YM0KNpMuJKeGdfccpsq6UTxvWPFR05qZQw+3U6mB6ngxhS/zYad/oLqg
         pOa44Q55r1ZSbyiMdNx9rnXaAA+WsYAreLIhiDTcNmh9SIP4K5wTJZTuIfJ1XWpvqBCi
         d0RIndJYXDT9uQ/qNk6Zl13XqHppI0T4lvOKYqjMVy8MDlxf+lGKafSEiDfUfnoJFcKd
         TjeXVG8j7xvZUcg0dGHgX2wKtXXthGEQ8GSB+Ft8gklL/YYsIorfoiCKXyAGHFRH1CrR
         PpWw==
X-Gm-Message-State: AGi0PubR9WWhQfILNE8lXApsH9tjWcD+uCiFEldHPJEiYDSW4rch9+hD
	BHchzhP1dZyWrklj2WZ/qxb70pcqZv4=
X-Google-Smtp-Source: APiQypJMjhS/3GQsvAI2YHKFbA0KC/LNkasbuF+9iw4mJ93Epi1Y4NPR7AKf4+Io/5CO5HXTML8HKQ==
X-Received: by 2002:a4a:625b:: with SMTP id y27mr13393079oog.70.1586104949076;
        Sun, 05 Apr 2020 09:42:29 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:28 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/6] python-pyperf: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:41:57 -0400
Message-Id: <20200405164200.31599-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405164200.31599-1-derek@asterius.io>
References: <20200405164200.31599-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyperf.inc | 23 ------------------
 .../python/python3-pyperf_1.7.1.bb            | 24 +++++++++++++++++--
 2 files changed, 22 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyperf.inc

diff --git a/meta-python/recipes-devtools/python/python-pyperf.inc b/meta-python/recipes-devtools/python/python-pyperf.inc
deleted file mode 100644
index d9291b5957..0000000000
--- a/meta-python/recipes-devtools/python/python-pyperf.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "A toolkit to write, run and analyze benchmarks"
-DESCRIPTION = " \
-The Python pyperf module is a toolkit to write, run and analyze benchmarks. \
-Features: \
-    * Simple API to run reliable benchmarks \
-    * Automatically calibrate a benchmark for a time budget. \
-    * Spawn multiple worker processes. \
-    * Compute the mean and standard deviation. \
-    * Detect if a benchmark result seems unstable. \
-    * JSON format to store benchmark results. \
-    * Support multiple units: seconds, bytes and integer. \
-"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
-
-SRC_URI[md5sum] = "d9e894dc843bb7f0abff109931a29895"
-SRC_URI[sha256sum] = "c37690e810116a83a244dfeec47885e2f0475b4c450313904be3bc2cdaf6d50a"
-
-inherit pypi
-
-PYPI_PACKAGE = "pyperf"
-
-DEPENDS += "${PYTHON_PN}-six-native"
diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
index 5ba5efb05d..081e904e16 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
@@ -1,4 +1,24 @@
-inherit setuptools3
-require python-pyperf.inc
+SUMMARY = "A toolkit to write, run and analyze benchmarks"
+DESCRIPTION = " \
+The Python pyperf module is a toolkit to write, run and analyze benchmarks. \
+Features: \
+    * Simple API to run reliable benchmarks \
+    * Automatically calibrate a benchmark for a time budget. \
+    * Spawn multiple worker processes. \
+    * Compute the mean and standard deviation. \
+    * Detect if a benchmark result seems unstable. \
+    * JSON format to store benchmark results. \
+    * Support multiple units: seconds, bytes and integer. \
+"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
+
+SRC_URI[md5sum] = "d9e894dc843bb7f0abff109931a29895"
+SRC_URI[sha256sum] = "c37690e810116a83a244dfeec47885e2f0475b4c450313904be3bc2cdaf6d50a"
+
+DEPENDS += "${PYTHON_PN}-six-native"
+
+PYPI_PACKAGE = "pyperf"
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.17.1

