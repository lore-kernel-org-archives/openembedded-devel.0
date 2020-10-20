Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.10714.1603160425404319332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 19:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s5mW9DRa;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b26so254275pff.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uAD7FQ9vL1HAXE8tGQbgsaL7WPVN5FNFN89vFSr3U0=;
        b=s5mW9DRaE8tLWa3jGCpEpI5km/eKXMNrWv0isLYIUA6+s7D+hALgiCjs77MyzCfpTA
         WlgLMa/nIRdyQr4vfvKt/vi6CakrvAYafm96YF7Hkiy/4sTrDZ8xM94OZxGAekxLKDSn
         yrJJ1sTSGyGjV1NaqIXV67A7YNjuJXl04Zm0WnR9AQI3WP6N4ev7IRdFYv2TOZAPJL9q
         MQuKbocps10uJSVCUPHFaEEwElKJS/I7wzd09mTUWJyPRM0damzNr5f/DEa4kWgHoWO2
         EwTEHOQQj7ikEt6KqaXv7nzLAH12pOdiaOspGaIqMrDN/2/+/HtKJ1shU/RwbYwIaA+Y
         iYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uAD7FQ9vL1HAXE8tGQbgsaL7WPVN5FNFN89vFSr3U0=;
        b=mMYly4PnKyiZW+beyX51C8WTDcXf0X8Jb3qYBqup2X1bigUo/AUrjH3LO1zpmnAP9l
         NWUAVpXCC0C+pi52osEU0rMLNV40t4mpVsV513m+Tqs7wR0udAa7pEf0QShI+KS1eIkJ
         jp/6FXrAmftz5o133DQ5E391rNjnWae/MrHOcPgHRzGGF+wlfAl0gOx1Q/bKt6KUPn4H
         n+SAGrASjH7AEriDOCvF5aENsSyES2PlCVDDa7c8Oq8ID3u0IU+0Rl7vbQ7nRvADMBMX
         rHATItLPMzNp6jDngyY0UcmJ6s5F2cSInq++avcG/Br80Tw3qMiBFdeJtKQ8itl0Zjj4
         dyLQ==
X-Gm-Message-State: AOAM530SnYmJv8FhG1h4/hR5X/fEzrTOe72walst53blEUBP1dNkZYB4
	hfss0eeLWMBdkNspc8Ghq73i2xoc8/ukTg==
X-Google-Smtp-Source: ABdhPJy2N8XEGB4lcxdpAIjfhJGemPFe0rX2dvIToVulxrGW7vBZ9ktpOpZvy4F4+XOveIqLyPbMfw==
X-Received: by 2002:a62:f94d:0:b029:15c:f1a3:cd47 with SMTP id g13-20020a62f94d0000b029015cf1a3cd47mr585500pfm.81.1603160424590;
        Mon, 19 Oct 2020 19:20:24 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8da4:4c66:a47a:824f])
        by smtp.gmail.com with ESMTPSA id y8sm248917pfg.104.2020.10.19.19.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 19:20:24 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][master,gatesgarth][PATCH] kas: move kas and Pipenv to kas/
Date: Mon, 19 Oct 2020 19:20:21 -0700
Message-Id: <20201020022021.2572-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move Pipenv, Pipenv.lock and kas*.yml files to kas

These kas specific workflow items do not need to
clutter the root of git repo.

Adjust .gitlab-ci.yml to the change.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .gitlab-ci.yml                       |  6 +-
 kas/Pipfile                          | 12 ++++
 kas/Pipfile.lock                     | 93 ++++++++++++++++++++++++++++
 kas/kas-meta-python2-image-base.yml  | 26 ++++++++
 kas/kas-meta-python2-image.yml       |  8 +++
 kas/kas-meta-python2-ptest-image.yml | 24 +++++++
 6 files changed, 166 insertions(+), 3 deletions(-)
 create mode 100644 kas/Pipfile
 create mode 100644 kas/Pipfile.lock
 create mode 100644 kas/kas-meta-python2-image-base.yml
 create mode 100644 kas/kas-meta-python2-image.yml
 create mode 100644 kas/kas-meta-python2-ptest-image.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 81807699..5a478713 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,11 +3,11 @@ image: kasproject/kas:latest
 meta-python2-image:
   stage: build
   script:
-    - kas build kas-meta-python2-image.yml
+    - kas build kas/kas-meta-python2-image.yml
 
 meta-python2-ptest-image:
   stage: build
   script:
-    - kas build kas-meta-python2-ptest-image.yml
-    - kas build -c testimage kas-meta-python2-ptest-image.yml
+    - kas build kas/kas-meta-python2-ptest-image.yml
+    - kas build -c testimage kas/kas-meta-python2-ptest-image.yml
 
diff --git a/kas/Pipfile b/kas/Pipfile
new file mode 100644
index 00000000..4f2828fd
--- /dev/null
+++ b/kas/Pipfile
@@ -0,0 +1,12 @@
+[[source]]
+url = "https://pypi.python.org/simple"
+verify_ssl = true
+name = "pypi"
+
+[packages]
+kas = "*"
+
+[dev-packages]
+
+[requires]
+python_version = "3.7"
diff --git a/kas/Pipfile.lock b/kas/Pipfile.lock
new file mode 100644
index 00000000..7b192e63
--- /dev/null
+++ b/kas/Pipfile.lock
@@ -0,0 +1,93 @@
+{
+    "_meta": {
+        "hash": {
+            "sha256": "807dcb4be569fc3eaf92f7e2c4df698b8797c43cfca5d6e28c1c2f7d3a29cc81"
+        },
+        "pipfile-spec": 6,
+        "requires": {
+            "python_version": "3.7"
+        },
+        "sources": [
+            {
+                "name": "pypi",
+                "url": "https://pypi.python.org/simple",
+                "verify_ssl": true
+            }
+        ]
+    },
+    "default": {
+        "attrs": {
+            "hashes": [
+                "sha256:26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594",
+                "sha256:fce7fc47dfc976152e82d53ff92fa0407700c21acd20886a13777a0d20e655dc"
+            ],
+            "version": "==20.2.0"
+        },
+        "distro": {
+            "hashes": [
+                "sha256:0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92",
+                "sha256:df74eed763e18d10d0da624258524ae80486432cd17392d9c3d96f5e83cd2799"
+            ],
+            "version": "==1.5.0"
+        },
+        "importlib-metadata": {
+            "hashes": [
+                "sha256:77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da",
+                "sha256:cefa1a2f919b866c5beb7c9f7b0ebb4061f30a8a9bf16d609b000e2dfaceb9c3"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==2.0.0"
+        },
+        "jsonschema": {
+            "hashes": [
+                "sha256:4e5b3cf8216f577bee9ce139cbe72eca3ea4f292ec60928ff24758ce626cd163",
+                "sha256:c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+            ],
+            "version": "==3.2.0"
+        },
+        "kas": {
+            "hashes": [
+                "sha256:673e3857d1bd2e4070145cf355d6b221474fa3bd3a6a3f4b5dfae750f3887336"
+            ],
+            "index": "pypi",
+            "version": "==2.2"
+        },
+        "pyrsistent": {
+            "hashes": [
+                "sha256:2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e"
+            ],
+            "version": "==0.17.3"
+        },
+        "pyyaml": {
+            "hashes": [
+                "sha256:06a0d7ba600ce0b2d2fe2e78453a470b5a6e000a985dd4a4e54e436cc36b0e97",
+                "sha256:240097ff019d7c70a4922b6869d8a86407758333f02203e0fc6ff79c5dcede76",
+                "sha256:4f4b913ca1a7319b33cfb1369e91e50354d6f07a135f3b901aca02aa95940bd2",
+                "sha256:69f00dca373f240f842b2931fb2c7e14ddbacd1397d57157a9b005a6a9942648",
+                "sha256:73f099454b799e05e5ab51423c7bcf361c58d3206fa7b0d555426b1f4d9a3eaf",
+                "sha256:74809a57b329d6cc0fdccee6318f44b9b8649961fa73144a98735b0aaf029f1f",
+                "sha256:7739fc0fa8205b3ee8808aea45e968bc90082c10aef6ea95e855e10abf4a37b2",
+                "sha256:95f71d2af0ff4227885f7a6605c37fd53d3a106fcab511b8860ecca9fcf400ee",
+                "sha256:b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d",
+                "sha256:cc8955cfbfc7a115fa81d85284ee61147059a753344bc51098f3ccd69b0d7e0c",
+                "sha256:d13155f591e6fcc1ec3b30685d50bf0711574e2c0dfffd7644babf8b5102ca1a"
+            ],
+            "version": "==5.3.1"
+        },
+        "six": {
+            "hashes": [
+                "sha256:30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259",
+                "sha256:8b74bedcbbbaca38ff6d7491d76f2b06b3592611af620f8426e82dddb04a5ced"
+            ],
+            "version": "==1.15.0"
+        },
+        "zipp": {
+            "hashes": [
+                "sha256:16522f69653f0d67be90e8baa4a46d66389145b734345d68a257da53df670903",
+                "sha256:c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa"
+            ],
+            "version": "==3.3.1"
+        }
+    },
+    "develop": {}
+}
diff --git a/kas/kas-meta-python2-image-base.yml b/kas/kas-meta-python2-image-base.yml
new file mode 100644
index 00000000..6b7293e0
--- /dev/null
+++ b/kas/kas-meta-python2-image-base.yml
@@ -0,0 +1,26 @@
+header:
+  version: 8
+
+machine: qemux86-64
+distro: poky
+target: meta-python2-image-base
+
+repos:
+  meta-python2:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    refspec: master
+    layers:
+      meta:
+      meta-poky:
+
+  meta-openembedded:
+    url: http://git.openembedded.org/meta-openembedded
+    refspec: master
+    layers:
+      meta-oe:
+
+local_conf_header:
+  reduce_diskspace: |
+    INHERIT += "rm_work_and_downloads"
diff --git a/kas/kas-meta-python2-image.yml b/kas/kas-meta-python2-image.yml
new file mode 100644
index 00000000..f5d82ba7
--- /dev/null
+++ b/kas/kas-meta-python2-image.yml
@@ -0,0 +1,8 @@
+header:
+  version: 8
+  includes:
+    - kas-meta-python2-image-base.yml
+
+machine: qemux86-64
+distro: poky
+target: meta-python2-image
diff --git a/kas/kas-meta-python2-ptest-image.yml b/kas/kas-meta-python2-ptest-image.yml
new file mode 100644
index 00000000..a2ee8ca0
--- /dev/null
+++ b/kas/kas-meta-python2-ptest-image.yml
@@ -0,0 +1,24 @@
+header:
+  version: 8
+  includes:
+    - kas-meta-python2-image-base.yml
+
+machine: qemux86-64
+distro: poky
+target: meta-python2-ptest-image
+
+local_conf_header:
+  enable_gtk_in_qemu: |
+    DISTRO_FEATURES_append = "opengl"
+    PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
+  enable_ptest_and_testimage: |
+    IMAGE_CLASSES += " testimage"
+    DISTRO_FEAURES_append = " ptest"
+    EXTRA_IMAGE_FEATURES = "debug-tweaks"
+    TESTIMAGE_AUTO = "1"
+    TEST_SUITES = " ping ssh python2 ptest"
+    TEST_QEMUPARAMS += "-smp 4 -m 8192"
+    TEST_RUNQEMUPARAMS = "kvm gl-es gtk"
+    IMAGE_ROOTFS_SIZE ?= "8192"
+    IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+    IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
-- 
2.25.0

