Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DC7E8FDB4
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 19:10:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157476.1766776206048380186
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 11:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5vFy6yo;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3520079f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766776204; x=1767381004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUTPwEcCesXPNPwTBDR2VBqZ3E3+1Sg0xZX6Rrg5r/g=;
        b=E5vFy6yoEvtS8vOZLofWdlqqbjZ2ulFK5hULE9drYUwoDHkJevDVA4Y0v1hCfXTXKz
         Xws9NH8yrXJX4ArTs68qwL7ppgyJeR8TjS1+Q4a/UyYm2/mZ0BI105DPy+2Uop90AfS1
         8z/zrUQXQWy6iKILU+hL2u3d3AsYXgPJoCZ44QchbFbtJIFTgz0H6vpnMXwuW9hcsnLA
         qJYOxrhkMAMn7v8jaFPpmbJR/BY+XwzUiNpJcjQyI2Dt7hx0GEE84EL8aS1SelmqOms7
         7w0lFrKrq+8LA/r5sLuks7+/LjnTBnGUwLRws5S1benc/9fZCcAmp7FwohaSM69knpHz
         AF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776204; x=1767381004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUTPwEcCesXPNPwTBDR2VBqZ3E3+1Sg0xZX6Rrg5r/g=;
        b=hf/lZrBAykKJHqmIbG560bJAQ44qOeEMqYjs/rLB8Mc4wvJJBou8BTg/zHvAlySuBV
         49D5FFUV0KGq6Gfjmj546xopEiMd8Xv9h6jNQTpXjrCCrcazpZ8dMWUcePsGDnonpfzU
         yyU+JLmSfvebNk//VDInikXwghK3olwgaiFGu1TSLkMQXX4CAtRS7GklV7ukBdS2R7jk
         AfyUP5rfhWAUYEMJR3ZEufF7AbiiJGxOFxio0kl7yra3+JRi7WTq/JDCcp2aK92KwPpE
         mddgDucNdcqmi/U1YXlUyZxXmkGNk7NYyjGkt+6j3Ht7tP8ufFE4q9jOfwGsotNkX2dn
         ltyA==
X-Gm-Message-State: AOJu0YxsgpH30gSGsnDsNAP2PNKJH7yTnKBlCy0nOuLQG9QA+iUXqJu/
	AY1avATwwrCQp/sJMdo2cZcPNDRCh3JevmV3ZuWlQM6nqLCe2amvAT18iI5bug==
X-Gm-Gg: AY/fxX5sPiNXKrlOkyN3FpNDe5sd4eKAVk0FKVxxaaXUurfrZ4EFnE1criyZF068qes
	jxyb91ERskLVXUvnVtvy1cEL3laZ1qjYtyWly74wim5AVHBf06Smo7THLmKqI0h/AYAInzNqY/r
	14IYKyC8rZTQuH/7BDFn2yTO+zwYGVpwlxtccYs9X8P38hAkVsq2oObqlosiT3Ssi1j7aaPo50C
	vuMJoxtn7e9TZQHCqYbxWK2bAB1+YquxusmhG1Jm4+2FUaTU3cXH15sR7OP2EXU6kk0u0KiiBx3
	aqiWKzzR3JcEFPFiCoqOOXbLRHJzMcwvw5RmnLTDN0m+ek3vhBN3+ex40kJYQZso0zRiWiwY6Qu
	e6fQButaXzamSI7JZjQNfk3iX+s3e/AcVpFfSEiDi2d3tNnn6I4O2Th8qv395OKNAoX7WwRpU5z
	hqqqvdn9pZ
X-Google-Smtp-Source: AGHT+IETdchacuZjeoeH3Bme9CeXdpu2iZHlksduhIAnH5rGgsjjB77zEwJZkS8rW1C04l/oEsJsgQ==
X-Received: by 2002:a5d:64e8:0:b0:431:9f1:e4c8 with SMTP id ffacd0b85a97d-4324e4cc305mr26777858f8f.17.1766776204345;
        Fri, 26 Dec 2025 11:10:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm47583330f8f.9.2025.12.26.11.10.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 11:10:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 4/5] unionfs-fuse: add ptest support
Date: Fri, 26 Dec 2025 20:10:00 +0100
Message-ID: <20251226191001.2920748-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226191001.2920748-1-skandigraun@gmail.com>
References: <20251226191001.2920748-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 19:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122942

It takes about a second to execute.

Added two patches:
- One adapts the testuite to ptest, to test the installed binary instead of
  testing the one from the build folder.
- Another that fixes a bug in unionfsctl, which made the test fail. This
  patch is submitted upstream.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-26T19:03
BEGIN: /usr/lib/unionfs-fuse/ptest
ptestuser:!:20448:0:99999:7:::
PASS: test_all.IOCTL_TestCase.test_debug
PASS: test_all.IOCTL_TestCase.test_wrong_args
PASS: test_all.UnionFS_Help.test_help
[...many lines...]
PASS: test_all.UnionFS_RW_RW_PreserveBranch_TestCase.test_permissions_after_creating_directories
PASS: test_all.UnionFS_Sync.test_sync
PASS: test_all.UnionFS_Version.test_help

============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/unionfs-fuse/ptest
2025-12-26T19:03
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-filesystems.inc   |  1 +
 .../files/0001-adapt-tests-to-ptest.patch     | 43 ++++++++++++++
 .../files/0001-fix-debug-ioctl-call.patch     | 58 +++++++++++++++++++
 .../unionfs-fuse/files/run-ptest              |  9 +++
 .../unionfs-fuse/unionfs-fuse_3.7.bb          | 13 ++++-
 5 files changed, 122 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-adapt-tests-to-ptest.patch
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/run-ptest

diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
index 875a2f139a..3dc6986d6f 100644
--- a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
@@ -8,6 +8,7 @@
 
 PTESTS_FAST_META_FILESYSTEMS = "\
     e2tools \
+    unionfs-fuse \
 "
 
 PTESTS_SLOW_META_FILESYSTEMS = "\
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-adapt-tests-to-ptest.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-adapt-tests-to-ptest.patch
new file mode 100644
index 0000000000..1361501d4e
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-adapt-tests-to-ptest.patch
@@ -0,0 +1,43 @@
+From 8de40703857e63483a5c1b83ee7a5b6323c0b7d3 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 26 Dec 2025 19:50:20 +0100
+Subject: [PATCH] adapt tests to ptest
+
+The tests are expected to be executed after compilation, and
+they look for the tested binaries in the build folder. However
+for ptests we want to test the already installed binaries,
+so change the tests to use them.
+
+Also, adapt the fusermount executable name to what's installed
+in the ptest images.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test_all.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test_all.py b/test_all.py
+index 6ead5b4..bb167a9 100755
+--- a/test_all.py
++++ b/test_all.py
+@@ -41,8 +41,8 @@ def get_osxfuse_unionfs_mounts():
+ 
+ class Common:
+ 	def setUp(self):
+-		self.unionfs_path = os.path.abspath('src/unionfs')
+-		self.unionfsctl_path = os.path.abspath('src/unionfsctl')
++		self.unionfs_path = 'unionfs'
++		self.unionfsctl_path = 'unionfsctl'
+ 
+ 		self.tmpdir = tempfile.mkdtemp()
+ 		self.original_cwd = os.getcwd()
+@@ -81,7 +81,7 @@ class Common:
+ 			if platform.system() == 'Darwin':
+ 				call('umount %s' % self.mount_device)
+ 			else:
+-				call('fusermount -u union')
++				call('fusermount3 -u union')
+ 
+ 		os.chdir(self.original_cwd)
+ 		shutil.rmtree(self.tmpdir)
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
new file mode 100644
index 0000000000..a29128d22a
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
@@ -0,0 +1,58 @@
+From bf552c479a0c0b0ef2d52d8456030c56b8cc6dbb Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 26 Dec 2025 19:33:54 +0100
+Subject: [PATCH] fix debug ioctl call
+
+When calling the ioctl to set a debug file, the ioctl expects to receive a datatype
+that is specified in the ioctl definition: char[PATHLEN_MAX]
+
+However when passing the pointer from getopts, this is only true if the passed path
+has the maximal allowed length. Since usually this path is shorter than the max,
+the kernel is trying to read over the end of the argument, and returns "EFAULT/Bad address".
+
+To solve this, copy the argument to a buffer that has the exact size of what the ioctl
+expects, and pass this buffer to the ioctl.
+
+Upstream-Status: Submitted [https://github.com/rpodgorny/unionfs-fuse/pull/164]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/unionfsctl.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/unionfsctl.c b/src/unionfsctl.c
+index 74c4d33..efed505 100644
+--- a/src/unionfsctl.c
++++ b/src/unionfsctl.c
+@@ -44,25 +44,28 @@ int main(int argc, char **argv) {
+ 
+ 	int opt;
+ 	const char* argument_param;
++	char debug_file[PATHLEN_MAX];
+ 	int debug_on_off;
+ 	int ioctl_res;
+ 	while ((opt = getopt(argc, argv, "d:p:")) != -1) {
+ 		switch (opt) {
+ 		case 'p':
+-			argument_param = optarg;
+-			if (strlen(argument_param) < 1) {
++			if (strlen(optarg) < 1) {
+ 				fprintf(stderr,
+ 					"Not a valid debug path given!\n");
+ 				print_help(progname);
+ 				exit(1);
+ 			}
+ 
+-			if (strlen(argument_param) > PATHLEN_MAX) {
++			if (strlen(optarg) > PATHLEN_MAX) {
+ 				fprintf(stderr, "Debug path too long!\n");
+ 				exit(1);
+ 			}
+ 
+-			ioctl_res = ioctl(fd, UNIONFS_SET_DEBUG_FILE, argument_param);
++			memset(debug_file, 0, PATHLEN_MAX);
++			strncpy(debug_file, optarg, PATHLEN_MAX - 1);
++
++			ioctl_res = ioctl(fd, UNIONFS_SET_DEBUG_FILE, debug_file);
+ 			if (ioctl_res == -1) {
+ 				fprintf(stderr, "debug-file ioctl failed: %s\n",
+ 					strerror(errno) );
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/run-ptest b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/run-ptest
new file mode 100644
index 0000000000..a92ef0a8f7
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+# not all tests can run with root, so create a test user
+# if it doesn't exist yet
+
+if ! grep ptestuser /etc/shadow; then
+    useradd ptestuser
+fi
+
+su ptestuser -c "python3 -m putao.unittest"
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
index 5ba202b90c..b5c5bb847c 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
@@ -6,11 +6,20 @@ LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8a
                     file://LICENSE;md5=0e75c95b3e0e1c01489b39e7fadd3e2d \
 "
 
-SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
+           file://run-ptest \
+           file://0001-fix-debug-ioctl-call.patch \
+           file://0001-adapt-tests-to-ptest.patch \
+"
+
 SRCREV = "3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8"
 
 DEPENDS = "fuse3"
 RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN}-ptest += "python3-core python3-unittest python3-unittest-automake-output"
 
+inherit cmake pkgconfig ptest
 
-inherit cmake pkgconfig
+do_install_ptest(){
+    install ${S}/test_all.py ${D}${PTEST_PATH}
+}

