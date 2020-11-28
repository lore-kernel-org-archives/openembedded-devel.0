Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.37819.1606598504179909150
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 13:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BcPbNsZO;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id o4so4871124pgj.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 13:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T26bRKUQu/SIQc1MElFt7tEDPTucIDcrxf9HNVhHlps=;
        b=BcPbNsZO18xnV5ECj+df6VHqY6f5AekxUT3ouZWGmyAHN0TSRVZRp35/941W6hbF7M
         btO51iJTtkwKGg3sS/dZyerg8RHZLSVB71tyIyVQupF2/g6TDxYsA9uMhM0EsMNN+vT1
         9Vs0jtk63qiuiAtxuM2m+8bS7dNeGkeafHp6r45qeinqHq2P1RNo2ey1iGnpz4dvPYpA
         cPC6/LHr33g63JEH4ARlSgJNNNtI4KDDAfWGTP+ZhHeWTMf17vy24dFdWbZxpYSjfBEl
         IY1m8LoLZZNQB4UHBUH5YU6i5tU6+CreZRwoT2XL3ziPtbstrw4THJS4hgVTRYxf560N
         i2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T26bRKUQu/SIQc1MElFt7tEDPTucIDcrxf9HNVhHlps=;
        b=O5KvKjVzVBl2XLKgtVhhAMFwhZFuhcovG+NXYl4lD6t8bwp2FvJhsaScF2zOe4kk0X
         M7PZchwRsh1HKh/CAYw1UoDWULGF1C42V0rBFDqPu3BBtHQW5wRDZxB0/jK1+I/OsZDz
         PoYHrEZIaf3l+6WGHEWdj2Eiowe356FKoDkZABxccVK2+Q7B8jQ9rdRuEDeKiG53xfN9
         32GAYE2/QO+B1stBy1r23GPztZ5jcZxVp0cYf7/HhwZ6RF11diEuQg1NGMFM72Bb51eg
         B+U5vauf77SRptD7z6ujYxA4KhwuxPxEnMLUgnyP5ImvL2rys/IS/7FRXNw8nWWKyk9j
         8HbA==
X-Gm-Message-State: AOAM533GpsguGdMryNlI49HoMZBZgFnTJySZY5rmLr/gFwpa8RZyJ0Ii
	BocU64SgqnTcEkXi4zgx2ZSz6L5pYlomMA==
X-Google-Smtp-Source: ABdhPJwAub4I6utNb6QGSNvm9vNMgJ7vWAap2999SqdzwUXz9ObxX2a3gQDoiGyGfOZ1hW0jiAeezA==
X-Received: by 2002:a17:90a:a781:: with SMTP id f1mr18367496pjq.50.1606598503169;
        Sat, 28 Nov 2020 13:21:43 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id v145sm11228666pfc.112.2020.11.28.13.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 13:21:42 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] kas: cleanup files
Date: Sat, 28 Nov 2020 13:21:38 -0800
Message-Id: <20201128212138.11824-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete the following files were inadvertently left behind
when the previous commit moved them to kas/:
* Pipfile
* Pipfile.lock
* kas-meta-python2-image-base.yml
* kas-meta-python2-image.yml
* kas-meta-python2-ptest-image.yml

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 Pipfile                          |  12 ----
 Pipfile.lock                     | 102 -------------------------------
 kas-meta-python2-image-base.yml  |  26 --------
 kas-meta-python2-image.yml       |   8 ---
 kas-meta-python2-ptest-image.yml |  24 --------
 5 files changed, 172 deletions(-)
 delete mode 100644 Pipfile
 delete mode 100644 Pipfile.lock
 delete mode 100644 kas-meta-python2-image-base.yml
 delete mode 100644 kas-meta-python2-image.yml
 delete mode 100644 kas-meta-python2-ptest-image.yml

diff --git a/Pipfile b/Pipfile
deleted file mode 100644
index 4f2828fd..00000000
--- a/Pipfile
+++ /dev/null
@@ -1,12 +0,0 @@
-[[source]]
-url = "https://pypi.python.org/simple"
-verify_ssl = true
-name = "pypi"
-
-[packages]
-kas = "*"
-
-[dev-packages]
-
-[requires]
-python_version = "3.7"
diff --git a/Pipfile.lock b/Pipfile.lock
deleted file mode 100644
index b4edbbb2..00000000
--- a/Pipfile.lock
+++ /dev/null
@@ -1,102 +0,0 @@
-{
-    "_meta": {
-        "hash": {
-            "sha256": "807dcb4be569fc3eaf92f7e2c4df698b8797c43cfca5d6e28c1c2f7d3a29cc81"
-        },
-        "pipfile-spec": 6,
-        "requires": {
-            "python_version": "3.7"
-        },
-        "sources": [
-            {
-                "name": "pypi",
-                "url": "https://pypi.python.org/simple",
-                "verify_ssl": true
-            }
-        ]
-    },
-    "default": {
-        "attrs": {
-            "hashes": [
-                "sha256:08a96c641c3a74e44eb59afb61a24f2cb9f4d7188748e76ba4bb5edfa3cb7d1c",
-                "sha256:f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
-            ],
-            "version": "==19.3.0"
-        },
-        "distro": {
-            "hashes": [
-                "sha256:362dde65d846d23baee4b5c058c8586f219b5a54be1cf5fc6ff55c4578392f57",
-                "sha256:eedf82a470ebe7d010f1872c17237c79ab04097948800029994fa458e52fb4b4"
-            ],
-            "version": "==1.4.0"
-        },
-        "importlib-metadata": {
-            "hashes": [
-                "sha256:aa18d7378b00b40847790e7c27e11673d7fed219354109d0e7b9e5b25dc3ad26",
-                "sha256:d5f18a79777f3aa179c145737780282e27b508fc8fd688cb17c7a813e8bd39af"
-            ],
-            "markers": "python_version < '3.8'",
-            "version": "==0.23"
-        },
-        "jsonschema": {
-            "hashes": [
-                "sha256:4e5b3cf8216f577bee9ce139cbe72eca3ea4f292ec60928ff24758ce626cd163",
-                "sha256:c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
-            ],
-            "version": "==3.2.0"
-        },
-        "kas": {
-            "hashes": [
-                "sha256:78372c2bb0f3b864516f93d72ba056bf2dc249d446b3bd0985e3ee1e5033eaf7"
-            ],
-            "index": "pypi",
-            "version": "==2.0"
-        },
-        "more-itertools": {
-            "hashes": [
-                "sha256:53ff73f186307d9c8ef17a9600309154a6ae27f25579e80af4db8f047ba14bc2",
-                "sha256:a0ea684c39bc4315ba7aae406596ef191fd84f873d2d2751f84d64e81a7a2d45"
-            ],
-            "version": "==8.0.0"
-        },
-        "pyrsistent": {
-            "hashes": [
-                "sha256:f3b280d030afb652f79d67c5586157c5c1355c9a58dfc7940566e28d28f3df1b"
-            ],
-            "version": "==0.15.6"
-        },
-        "pyyaml": {
-            "hashes": [
-                "sha256:0113bc0ec2ad727182326b61326afa3d1d8280ae1122493553fd6f4397f33df9",
-                "sha256:01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4",
-                "sha256:5124373960b0b3f4aa7df1707e63e9f109b5263eca5976c66e08b1c552d4eaf8",
-                "sha256:5ca4f10adbddae56d824b2c09668e91219bb178a1eee1faa56af6f99f11bf696",
-                "sha256:7907be34ffa3c5a32b60b95f4d95ea25361c951383a894fec31be7252b2b6f34",
-                "sha256:7ec9b2a4ed5cad025c2278a1e6a19c011c80a3caaac804fd2d329e9cc2c287c9",
-                "sha256:87ae4c829bb25b9fe99cf71fbb2140c448f534e24c998cc60f39ae4f94396a73",
-                "sha256:9de9919becc9cc2ff03637872a440195ac4241c80536632fffeb6a1e25a74299",
-                "sha256:a5a85b10e450c66b49f98846937e8cfca1db3127a9d5d1e31ca45c3d0bef4c5b",
-                "sha256:b0997827b4f6a7c286c01c5f60384d218dca4ed7d9efa945c3e1aa623d5709ae",
-                "sha256:b631ef96d3222e62861443cc89d6563ba3eeb816eeb96b2629345ab795e53681",
-                "sha256:bf47c0607522fdbca6c9e817a6e81b08491de50f3766a7a0e6a5be7905961b41",
-                "sha256:f81025eddd0327c7d4cfe9b62cf33190e1e736cc6e97502b3ec425f574b3e7a8"
-            ],
-            "version": "==5.1.2"
-        },
-        "six": {
-            "hashes": [
-                "sha256:1f1b7d42e254082a9db6279deae68afb421ceba6158efa6131de7b3003ee93fd",
-                "sha256:30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66"
-            ],
-            "version": "==1.13.0"
-        },
-        "zipp": {
-            "hashes": [
-                "sha256:3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e",
-                "sha256:f06903e9f1f43b12d371004b4ac7b06ab39a44adc747266928ae6debfa7b3335"
-            ],
-            "version": "==0.6.0"
-        }
-    },
-    "develop": {}
-}
diff --git a/kas-meta-python2-image-base.yml b/kas-meta-python2-image-base.yml
deleted file mode 100644
index 6b7293e0..00000000
--- a/kas-meta-python2-image-base.yml
+++ /dev/null
@@ -1,26 +0,0 @@
-header:
-  version: 8
-
-machine: qemux86-64
-distro: poky
-target: meta-python2-image-base
-
-repos:
-  meta-python2:
-
-  poky:
-    url: https://git.yoctoproject.org/git/poky
-    refspec: master
-    layers:
-      meta:
-      meta-poky:
-
-  meta-openembedded:
-    url: http://git.openembedded.org/meta-openembedded
-    refspec: master
-    layers:
-      meta-oe:
-
-local_conf_header:
-  reduce_diskspace: |
-    INHERIT += "rm_work_and_downloads"
diff --git a/kas-meta-python2-image.yml b/kas-meta-python2-image.yml
deleted file mode 100644
index f5d82ba7..00000000
--- a/kas-meta-python2-image.yml
+++ /dev/null
@@ -1,8 +0,0 @@
-header:
-  version: 8
-  includes:
-    - kas-meta-python2-image-base.yml
-
-machine: qemux86-64
-distro: poky
-target: meta-python2-image
diff --git a/kas-meta-python2-ptest-image.yml b/kas-meta-python2-ptest-image.yml
deleted file mode 100644
index a2ee8ca0..00000000
--- a/kas-meta-python2-ptest-image.yml
+++ /dev/null
@@ -1,24 +0,0 @@
-header:
-  version: 8
-  includes:
-    - kas-meta-python2-image-base.yml
-
-machine: qemux86-64
-distro: poky
-target: meta-python2-ptest-image
-
-local_conf_header:
-  enable_gtk_in_qemu: |
-    DISTRO_FEATURES_append = "opengl"
-    PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
-  enable_ptest_and_testimage: |
-    IMAGE_CLASSES += " testimage"
-    DISTRO_FEAURES_append = " ptest"
-    EXTRA_IMAGE_FEATURES = "debug-tweaks"
-    TESTIMAGE_AUTO = "1"
-    TEST_SUITES = " ping ssh python2 ptest"
-    TEST_QEMUPARAMS += "-smp 4 -m 8192"
-    TEST_RUNQEMUPARAMS = "kvm gl-es gtk"
-    IMAGE_ROOTFS_SIZE ?= "8192"
-    IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
-    IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
-- 
2.25.0

