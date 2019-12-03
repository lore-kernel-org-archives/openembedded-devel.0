Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D85E77F380
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 04:53:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id h13so1190515plr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 20:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0n3qkBNXTzbCUTZ90y/puIjJH5lHLY3JOGtRgTEUq/A=;
	b=SSp1cn6+sgpzyXI0jNQEuhtcnGqDjCRyDa8JYcBgO9ZvE1wYZbB8S/Tje1pxOAzuyg
	jCaw4BOOWfyTxd6+D6eUmBTxwFQCfnbpnj+rmBmtBijXO2GJeLEOwFysa4mHXBEQNh95
	KJhF55gZbU8PibAh5yM/4Q3WuTcbS8njhULAc/9wP/s0ev6iW8O6T658vK5fk2WWv74a
	d1gHSo0imoY9ZOxsoKmeSITkOv7zO+5XVxsYwUBET9f3gsWmu9orabhi6JHkX8BBzQOw
	YKMnat8V5bZw5tk+pNDGtwYIsgwNTGFZ3WVyPuTGNezesudaakOJDyGAkk0dNzjJvkJB
	l87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0n3qkBNXTzbCUTZ90y/puIjJH5lHLY3JOGtRgTEUq/A=;
	b=Q5WMnAWpdl1rKTxJXjYx3Clk8oBO4aaCs/OhIdjPTnySbHTjux6Pimw36K5vP069Pb
	R871w282JNGCQTOQEHV2bmiDMtZBYeaZUF5X0xa7QBNrOCcrlUHeBwwhaVNhS2uWkSMA
	CHagj3fEsu9L37sjNSUn9mli+GYHulX3YUS0EDL8taoOvEDrIKEhqnWCzw3oL9Fsz3wa
	fJfXAUmsBTCUNZF+q3KxYySxSgkcRI3qeogJm11ARrb4tWxOMXhHyGXhg/l5J0W/Z50c
	qkCjyX8pqbnPJf3Yx7Hn3sfGKVLI5C7KqpUPSmqx1281nr61OZ2wxyv00xs1lJ/8ZQFE
	8MBg==
X-Gm-Message-State: APjAAAWutOcLCFHdReSN9bICMbunU8/p6mDQq6xQgfpsRZD7upEeBE5u
	yQCCut+uLqJWFyc/DGvCVIhkuFbjePE=
X-Google-Smtp-Source: APXvYqyZMVUaPH46/4n1qRxFwaWtTjuUNM1X4jFOyKlnZbXrexLpyBQsKIJKuzsWBh77bdS0MyJZPw==
X-Received: by 2002:a17:902:b612:: with SMTP id
	b18mr3145817pls.210.1575348802589; 
	Mon, 02 Dec 2019 20:53:22 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:a470:42fc:1110:b615])
	by smtp.gmail.com with ESMTPSA id h7sm1397499pfq.36.2019.12.02.20.53.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 20:53:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 20:52:19 -0800
Message-Id: <20191203045219.29647-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203045219.29647-1-ticotimo@gmail.com>
References: <20191203045219.29647-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][zeus][PATCH 2/2] Enhance README, add kas, Pipfile and gitlab
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2019 04:53:22 -0000
Content-Transfer-Encoding: 8bit

Add strong language about the EOL of Python2 to
the README. Also include information about 'kas',
'Pipfile' and .gitlab-ci.yml

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .gitlab-ci.yml                   |  13 ++++
 Pipfile                          |  12 ++++
 Pipfile.lock                     | 102 +++++++++++++++++++++++++++++++
 README                           |  73 +++++++++++++++++++---
 kas-meta-python2-image-base.yml  |  26 ++++++++
 kas-meta-python2-image.yml       |   8 +++
 kas-meta-python2-ptest-image.yml |  22 +++++++
 7 files changed, 249 insertions(+), 7 deletions(-)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 Pipfile
 create mode 100644 Pipfile.lock
 create mode 100644 kas-meta-python2-image-base.yml
 create mode 100644 kas-meta-python2-image.yml
 create mode 100644 kas-meta-python2-ptest-image.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 00000000..81807699
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,13 @@
+image: kasproject/kas:latest
+
+meta-python2-image:
+  stage: build
+  script:
+    - kas build kas-meta-python2-image.yml
+
+meta-python2-ptest-image:
+  stage: build
+  script:
+    - kas build kas-meta-python2-ptest-image.yml
+    - kas build -c testimage kas-meta-python2-ptest-image.yml
+
diff --git a/Pipfile b/Pipfile
new file mode 100644
index 00000000..4f2828fd
--- /dev/null
+++ b/Pipfile
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
diff --git a/Pipfile.lock b/Pipfile.lock
new file mode 100644
index 00000000..b4edbbb2
--- /dev/null
+++ b/Pipfile.lock
@@ -0,0 +1,102 @@
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
+                "sha256:08a96c641c3a74e44eb59afb61a24f2cb9f4d7188748e76ba4bb5edfa3cb7d1c",
+                "sha256:f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
+            ],
+            "version": "==19.3.0"
+        },
+        "distro": {
+            "hashes": [
+                "sha256:362dde65d846d23baee4b5c058c8586f219b5a54be1cf5fc6ff55c4578392f57",
+                "sha256:eedf82a470ebe7d010f1872c17237c79ab04097948800029994fa458e52fb4b4"
+            ],
+            "version": "==1.4.0"
+        },
+        "importlib-metadata": {
+            "hashes": [
+                "sha256:aa18d7378b00b40847790e7c27e11673d7fed219354109d0e7b9e5b25dc3ad26",
+                "sha256:d5f18a79777f3aa179c145737780282e27b508fc8fd688cb17c7a813e8bd39af"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==0.23"
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
+                "sha256:78372c2bb0f3b864516f93d72ba056bf2dc249d446b3bd0985e3ee1e5033eaf7"
+            ],
+            "index": "pypi",
+            "version": "==2.0"
+        },
+        "more-itertools": {
+            "hashes": [
+                "sha256:53ff73f186307d9c8ef17a9600309154a6ae27f25579e80af4db8f047ba14bc2",
+                "sha256:a0ea684c39bc4315ba7aae406596ef191fd84f873d2d2751f84d64e81a7a2d45"
+            ],
+            "version": "==8.0.0"
+        },
+        "pyrsistent": {
+            "hashes": [
+                "sha256:f3b280d030afb652f79d67c5586157c5c1355c9a58dfc7940566e28d28f3df1b"
+            ],
+            "version": "==0.15.6"
+        },
+        "pyyaml": {
+            "hashes": [
+                "sha256:0113bc0ec2ad727182326b61326afa3d1d8280ae1122493553fd6f4397f33df9",
+                "sha256:01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4",
+                "sha256:5124373960b0b3f4aa7df1707e63e9f109b5263eca5976c66e08b1c552d4eaf8",
+                "sha256:5ca4f10adbddae56d824b2c09668e91219bb178a1eee1faa56af6f99f11bf696",
+                "sha256:7907be34ffa3c5a32b60b95f4d95ea25361c951383a894fec31be7252b2b6f34",
+                "sha256:7ec9b2a4ed5cad025c2278a1e6a19c011c80a3caaac804fd2d329e9cc2c287c9",
+                "sha256:87ae4c829bb25b9fe99cf71fbb2140c448f534e24c998cc60f39ae4f94396a73",
+                "sha256:9de9919becc9cc2ff03637872a440195ac4241c80536632fffeb6a1e25a74299",
+                "sha256:a5a85b10e450c66b49f98846937e8cfca1db3127a9d5d1e31ca45c3d0bef4c5b",
+                "sha256:b0997827b4f6a7c286c01c5f60384d218dca4ed7d9efa945c3e1aa623d5709ae",
+                "sha256:b631ef96d3222e62861443cc89d6563ba3eeb816eeb96b2629345ab795e53681",
+                "sha256:bf47c0607522fdbca6c9e817a6e81b08491de50f3766a7a0e6a5be7905961b41",
+                "sha256:f81025eddd0327c7d4cfe9b62cf33190e1e736cc6e97502b3ec425f574b3e7a8"
+            ],
+            "version": "==5.1.2"
+        },
+        "six": {
+            "hashes": [
+                "sha256:1f1b7d42e254082a9db6279deae68afb421ceba6158efa6131de7b3003ee93fd",
+                "sha256:30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66"
+            ],
+            "version": "==1.13.0"
+        },
+        "zipp": {
+            "hashes": [
+                "sha256:3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e",
+                "sha256:f06903e9f1f43b12d371004b4ac7b06ab39a44adc747266928ae6debfa7b3335"
+            ],
+            "version": "==0.6.0"
+        }
+    },
+    "develop": {}
+}
diff --git a/README b/README
index 2e46ea8a..fd47ed59 100644
--- a/README
+++ b/README
@@ -1,13 +1,34 @@
 meta-python2
-================================
+============
+
+Preamble
+--------
+
+Python 2 is going EOL (end of life) in January 2020 [1]. This means that all support for the
+language will be on the shoulders of the community and the upstream python developers will
+no longer be supporting it. This has been in the works for several years and it should come
+as no surprise to ANYONE that the support is ending.
+
+In light of the above, oe-core, meta-oe, meta-python and other layers are actively dropping
+python2 recipes. This also means that the core developers for YP/OE will no longer have any
+motivation to maintain python2 or python2 recipes. This includes the creator of this layer.
+
+If your organization has legacy python2 code or depends upon upstream python2-only code, the
+time has come for you to move on. Porting from python2 to python3 is well documented [2].
+
+Continuing to depend upon python2-only code will increasingly open you up to security issues,
+vulnerabilities and breakage.
+
+[1] https://www.python.org/doc/sunset-python-2/
+[2] https://docs.python.org/3/howto/pyporting.html
 
 Introduction
--------------------------
+------------
 
 This layer is intended to be the home of legacy python2 modules for OpenEmbedded.
 
 Dependencies
--------------------------
+------------
 
 The meta-python2 layer depends on:
 
@@ -22,12 +43,45 @@ The meta-python2 layer depends on:
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
-For Angstrom that is:
-        http://www.angstrom-distribution.org/building-angstrom,
-other distros should have similar online resources.
+
+Building and Continuous Integration
+-----------------------------------
+
+We have provided 'kas' [3,4] YAML files to make it easier to build the basic images supplied by
+this layer. In order to make running 'kas' in a virtual environmnt easier, we have also provided
+a 'Pipfile' to enable using 'pipenv' [5].
+
+For instance, your CI workflow could include:
+
+$ pipenv install
+$ pipenv shell
+$ kas build path/to/meta-python/kas-meta-python2-image.yml
+
+Continous Integration via GitLab is also enabled by providing a .gitlab-ci.yml file.
+
+[3] https://github.com/siemens/kas
+[4] https://kas.readthedocs.io/en/latest/
+[5] https://github.com/pypa/pipenv
 
 Contributing
--------------------------
+------------
+
+Recipes in this layer use Debian naming, which means if it is a python library it should be prefixed
+with 'python-'. The only exception to this is when the recipe is providing an executable application
+that is installed in /usr/bin for example. Exceptions to Debian naming are very rare.
+
+It is expected that recipes will provide SUMMARY, DESCRIPTION, HOMEPAGE, BUGTRACKER and SECTION
+variables, unless the values are unknown. It is strongly recommended to use the pypi.bbclass unless
+your python module is not available on pypi.org.
+
+It is expected that ANY upgrades to a recipe will have undergone run-time testing before submitting
+the upgrade. Many other developers depend upon the quality of this layer and will be quite upset with
+you when you break their builds.
+
+Commit messages must include a "Signed-off-by:" line, including a valid email address and a legal name
+(not a nickname). The "Signed-off-by:" line means that you are either the author or have the legal right
+to submit the work. Please refer to the "Submitting a patch to OpenEmbedded" [6] and "Commit Patch
+Message Guidelines" [7] for guidance.
 
 The meta-openembedded mailinglist
 (openembedded-devel@lists.openembedded.org) is used for questions,
@@ -40,8 +94,13 @@ Send pull requests to openembedded-devel@lists.openembedded.org with
 When sending single patches, please use something like: 
 'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python2][zeus][PATCH'
 
+
+[6] https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+[7] https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
+
 Maintenance
 -------------------------
 
 zeus Maintainers: Armin Kuster <akuster808@gmail.com>
+                  Tim "moto-timo" Orling <ticotimo@gmail.com>
 
diff --git a/kas-meta-python2-image-base.yml b/kas-meta-python2-image-base.yml
new file mode 100644
index 00000000..9d63305c
--- /dev/null
+++ b/kas-meta-python2-image-base.yml
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
+    refspec: zeus
+    layers:
+      meta:
+      meta-poky:
+
+  meta-openembedded:
+    url: http://git.openembedded.org/meta-openembedded
+    refspec: zeus
+    layers:
+      meta-oe:
+
+local_conf_header:
+  reduce_diskspace: |
+    INHERIT += "rm_work_and_downloads"
diff --git a/kas-meta-python2-image.yml b/kas-meta-python2-image.yml
new file mode 100644
index 00000000..f5d82ba7
--- /dev/null
+++ b/kas-meta-python2-image.yml
@@ -0,0 +1,8 @@
+header:
+  version: 8
+  includes:
+    - kas-meta-python2-image-base.yml
+
+machine: qemux86-64
+distro: poky
+target: meta-python2-image
diff --git a/kas-meta-python2-ptest-image.yml b/kas-meta-python2-ptest-image.yml
new file mode 100644
index 00000000..3a15add5
--- /dev/null
+++ b/kas-meta-python2-ptest-image.yml
@@ -0,0 +1,22 @@
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
+  enable_ptest_and_testimage: |
+    INHERIT += "rm_work_and_downloads"
+    IMAGE_CLASSES += " testimage"
+    DISTRO_FEAURES_append = " ptest"
+    EXTRA_IMAGE_FEATURES = "debug-tweaks"
+    TESTIMAGE_AUTO = "1"
+    TEST_SUITES = " ping ssh ptest"
+    TEST_QEMUPARAMS += "-smp 4 -m 8192"
+    TEST_RUNQEMUPARAMS += "kvm gl"
+    IMAGE_ROOTFS_SIZE ?= "8192"
+    IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+    IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
-- 
2.24.0


