Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.2992.1586024484573822843
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v2so10946899oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m+/MBgFd/V6dWs47Dee1PLPG0csDsQMd307/YRXi/t4=;
        b=KbQskfOFfhM1ofvyZ3MmzhLhpqbbr02ykVLT1nFl3SlqkVIRLhVn2p71sqr1mUgIpn
         OANctRAHv4QzD1w31liZKxIyQamtoM7BXhAMXK7yDW4AkQkup/+ot6IJBi2Y8A/rjccY
         0vmfZMSIhOxlfHYHFDarTJOK/Rr9HvTZ8qtNtXOTy5/KVxmtvR8IbLBNooo1WYIuFOlp
         8FBmnSq+apYespSH3ymyTs5vPLZGnVE59NnwRdfA6mISa1qUkaYo1IE3R2pg0d4SKBHN
         /XSuyrqON3dU9+P89Nv9h5xhFGN2DrR7x+JWB7BPLRMNqcn3tx+fEk1YlH5Zi40IDJyk
         DApw==
X-Gm-Message-State: AGi0PubK/GRV4NDR0VKKLQzS2HxTZMMT9Nq5jsyVobIRqsrKL4CYQUPm
	7Dh36YDhE/rQp/LbFnFZ1lnSxDxGRHc=
X-Google-Smtp-Source: APiQypJpfKa3RK9D6qkTvMcNlxs153Lf3d01g7VA5I32XNR3CUlX3Ur7JdPazzm4wR+wy929IdOC7w==
X-Received: by 2002:a05:6830:17ca:: with SMTP id p10mr11606940ota.165.1586024483609;
        Sat, 04 Apr 2020 11:21:23 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:22 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/12] python-pyudev: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:59 -0400
Message-Id: <20200404182104.21027-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyudev.inc | 19 -----------------
 .../python/python3-pyudev_0.21.0.bb           | 21 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyudev.inc

diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
deleted file mode 100644
index 683a75cdd6..0000000000
--- a/meta-python/recipes-devtools/python/python-pyudev.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "A libudev binding"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
-
-do_configure_prepend() {
-    sed -i "/import pyudev/d" ${S}/setup.py
-    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
-}
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-    libudev \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
index a62d944bac..f39847ffa7 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -1,2 +1,21 @@
-require python-pyudev.inc
+SUMMARY = "A libudev binding"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
+SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
+
 inherit pypi setuptools3
+
+do_configure_prepend() {
+    sed -i "/import pyudev/d" ${S}/setup.py
+    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
+}
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-threading \
+    libudev \
+"
-- 
2.17.1

