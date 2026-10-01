Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7341CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 20:14:17 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20516.1790885649562713609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 13:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KTxVClqO;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so3532743eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 13:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790885649; x=1791490449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfeJ2YrRVyCqabIxwss1DPSoMplPSsvPjeCXt2NWIAo=;
        b=KTxVClqOug96aiVP/tOk1zWcCAkT2FJe+681+D+1i2928mEciQyEKKy90U0H2cZoL+
         0GviK1YyDkL4iL1jrbKeYiCA+R2Chivu/yUrgaThxlKOMZvAOafB0Dl9RcQdKzS1cxJx
         dfnvhVeg3sdsLGq/we7sDtBDtfQ4UssLjJSTAgCFn2YN54GsiWxdhBhpXuutwYDjf/cq
         NTwqjzqlpClalMDwG6etztoXv6BXzZ6mNv7l+As950E1CPSCNB9rikznSVrMizqPVYss
         n/33bnvWe9I5Q92KlhxRQr4PKzyIbwsTubtiMON9CuO6wXD6/R97fty/h02EnNrNrK3Y
         L6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885649; x=1791490449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfeJ2YrRVyCqabIxwss1DPSoMplPSsvPjeCXt2NWIAo=;
        b=PiWoOM3ugsLYq+o22W4YcFfyKPs7w4JloXFi+lKAgcSpZ4Dw6kWN0WjqLUKr3O58Ms
         vWq2H0LHAzsF7kJV7pFWsoQ5EjLPpDCxBu9e5a/+YBIpqsH9szFjEI6PWUUtICUF8WHq
         7x4X9AVMEJWzLFakCwhO3pHAsw4vki2oumfjlwRylxA+HmwiZ/rZr0O3KDvxm/m2A7x7
         RF/MaTEmCE9GQOhGwqe+wvKNMVVJJobtPNkFDqGgn7VqR//qBJBXlFlOi95xhgBi5AYs
         tmv3fa9Oj8CyFrGF5kp7/pmwkGAnCox1WY5HPQu2pgrV8S6CZM40si1z+alWp1DEQY2w
         HIsQ==
X-Gm-Message-State: AFq9FYKar9uq2LbamwjtG+eiZ62BIzIaOj28F/QhDBPBZTS3mNeyPDPX
	qbH4DOi4b6Kv80DfiNbNnERQjHSPOdmWOhoeb35ELSrd9YDh56eUxpa7JMbkk+6g
X-Gm-Gg: AYBFou3zeu0Lo9IJfAZyMmziyw9San9a41+lXcycuRrAcQjrjaZowadeCd1+pNmpIGx
	TE2B2qw+Qcf6BWa+FkuhTKjO0HON2NueYWcecmJe4vQyBtYdi4T5huoJB6ElRmajG9tjS3qFJ9Y
	tXGKJXHHTJwp707d+SXQDvz6GSXjO9lfqxub00NCkdaQ0ryYcD0AM3xG5xEK9ODGHeVZ762cZwO
	u5D8NlwkDqmM4TMY5U3G4x4+faK7luR61VArI7fWRt+gEwdaeL1bBInvVFzDOnFMmgA0UKFP4X1
	JE2hTwcJNksJcUxVgQLKtLDHgIZMn93KULI4NUvSrX5qgYrT1urL0NZJkkn5eWRwpPqt63KGzlh
	N23421tiZVYr1AuIvNVV3sbxD5o6c1PtMvh3vTNg0VFhL7eHRaYhES7F+T0k6o4ZxmzwiEj40mO
	+dHx37HUXvkXlMPKy0gkIQVw7RJ6FTU7A5xXgWh8NTSqx6QmrvgRG/eCtApRS1CKMa2PaA4x9WH
	wPLYnM/mG8HTcfOzKy7xGPcRD9dWv9W7HSV8fYmpvTBwSqSH/3XbCtFeC3CgIZrkWjYII01a4TS
	ofVjFxRlSERb28UK9+rEEUsU4HK9XzHsbap0EtRgn4SwwbaV9N2R16bkIeqymiVdxCy9N34s6gA
	YJ5L1Ms1JOCLicp6UfK1k2AFcUBWc10Gd/J2wvVOJCUB3F2Tbp5VNpmlWHZzXrFT4BW+pUcTPKN
	SYKW0Ob5uJioky7BXUYv2pO6dFCj0XFq1jKWK8pdsEE3QVSXDHxQ==
X-Received: by 2002:a05:7300:a211:b0:341:6552:8c39 with SMTP id 5a478bee46e88-34f219beff2mr417888eec.40.1790885648748;
        Thu, 01 Oct 2026 13:14:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm528055eec.24.2026.10.01.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:14:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] fuse3: Fix ptest for the new test runner
Date: Thu,  1 Oct 2026 13:14:04 -0700
Message-ID: <20261001201404.3518829-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001201404.3518829-1-khem.raj@oss.qualcomm.com>
References: <20261001201404.3518829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 20:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130601

libfuse 3.18.3 replaced its pytest based tests with shell test cases
driven by test/run-tests.py, so the pytest based run-ptest collected no
tests at all.

- Run test/run-tests.py from run-ptest and turn its result lines into
  ptest PASS/FAIL/SKIP lines. Use a run directory under the canonical
  /tmp, since some test filesystems mirror the real tree and cannot
  follow the /var/tmp symlink.
- Install fuse_config.h, which the runner reads from the build tree.
- Replace the pytest dependencies with the python3 modules the runner
  uses, and add coreutils and util-linux-losetup for dd status=none and
  losetup --show, which busybox does not support.
- Do not print strerror(0) in test_syscalls, musl's "No error
  information" is flagged as suspicious output by the runner.

All 87 tests now run on qemux86-64 musl: 80 pass, 7 skip.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...est_syscalls-Do-not-print-strerror-0.patch | 36 +++++++++++++++++++
 meta-oe/recipes-support/fuse/fuse3/run-ptest  | 22 +++++++++++-
 meta-oe/recipes-support/fuse/fuse3_3.18.3.bb  | 20 +++++++++--
 3 files changed, 74 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/fuse/fuse3/0001-test_syscalls-Do-not-print-strerror-0.patch

diff --git a/meta-oe/recipes-support/fuse/fuse3/0001-test_syscalls-Do-not-print-strerror-0.patch b/meta-oe/recipes-support/fuse/fuse3/0001-test_syscalls-Do-not-print-strerror-0.patch
new file mode 100644
index 0000000000..eab67c623a
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse3/0001-test_syscalls-Do-not-print-strerror-0.patch
@@ -0,0 +1,36 @@
+From 75186b0a019645a2822c9d567464bb142cc8882a Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 1 Oct 2026 10:42:51 -0700
+Subject: [PATCH] test_syscalls: Do not print strerror(0)
+
+test_open_acc() prints strerror() of the expected error, which is 0 for
+the cases that should succeed. glibc returns "Success" for it, but musl
+returns "No error information", and run-tests.py treats the word "error"
+in the output as a failure:
+
+  FAIL  examples/passthrough-base  suspicious output: script.out: ... 49 [open_acc(O_RDONLY) mode: 0600 message: 'No error information'] START
+
+Print "Success" when no error is expected.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ test/test_syscalls.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/test/test_syscalls.c b/test/test_syscalls.c
+index 115eab8..f849e7b 100644
+--- a/test/test_syscalls.c
++++ b/test/test_syscalls.c
+@@ -1335,8 +1335,10 @@ static int do_test_open_acc(int flags, const char *flags_str, int mode, int err)
+ 	int res;
+ 	int fd;
+
++	/* strerror(0) is "Success" on glibc but "No error information" on
++	 * musl, which the test runner flags as a suspicious word. */
+ 	start_test("open_acc(%s) mode: 0%03o message: '%s'", flags_str, mode,
+-		   strerror(err));
++		   err ? strerror(err) : "Success");
+ 	unlink(testfile);
+ 	res = create_testfile(testfile, data, datalen);
+ 	if (res == -1)
diff --git a/meta-oe/recipes-support/fuse/fuse3/run-ptest b/meta-oe/recipes-support/fuse/fuse3/run-ptest
index b63c4de0d9..b8295bbce9 100644
--- a/meta-oe/recipes-support/fuse/fuse3/run-ptest
+++ b/meta-oe/recipes-support/fuse/fuse3/run-ptest
@@ -1,3 +1,23 @@
 #!/bin/sh

-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+# Run the libfuse test suite. The ptest directory mirrors the meson build
+# tree (example/, test/, util/, fuse_config.h) that test/run-tests.py expects.
+# Each finished test is reported as
+#   +   1.234s PASS  notify/prune                       0.12s
+# so print it as is and add the ptest result line after it.
+cd "$(dirname "$0")"
+
+# Some test filesystems mirror the real tree but cannot follow symlinks, so
+# keep the run directory off paths like /var/tmp, which is a symlink to
+# volatile/tmp. run-tests.py creates the directory and removes it when done.
+run_dir="$(readlink -f /tmp)/fuse-tests-$$"
+
+python3 test/run-tests.py --build-dir "$(pwd)" --run-dir "$run_dir" 2>&1 | awk '
+{ print }
+/^\+ *[0-9.]+s +(PASS|FAIL|SKIP) / {
+	line = $0
+	sub(/^\+ *[0-9.]+s +/, "", line)
+	split(line, f, " ")
+	printf "%s: %s\n", f[1], f[2]
+	fflush()
+}'
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
index 75dde98a7c..1e4b86a47a 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
@@ -31,14 +31,25 @@ LDFLAGS:append:toolchain-clang:riscv32 = " -latomic"
 SRC_URI += " \
     file://run-ptest \
     file://fuse3.conf \
+    file://0001-test_syscalls-Do-not-print-strerror-0.patch \
 "
-#python3-compile for filecmp module
+# test/run-tests.py needs python3-asyncio for concurrent.futures,
+# python3-compile for filecmp, python3-io for socket/tempfile and
+# python3-shell for shlex. The test cases use dd status=none and
+# losetup --show, which busybox does not support.
 RDEPENDS:${PN}-ptest += " \
+    python3-asyncio \
     python3-compile \
-    python3-pytest \
-    python3-looseversion \
+    python3-core \
+    python3-ctypes \
+    python3-io \
+    python3-json \
+    python3-resource \
+    python3-shell \
     bash \
+    coreutils \
     file \
+    util-linux-losetup \
 "
 RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"

@@ -66,6 +77,9 @@ do_install_ptest() {
     do
         cp -rf $e  ${D}${PTEST_PATH}/test
     done
+
+    # test/run-tests.py reads the build configuration from the build tree
+    install -m 0644 ${B}/fuse_config.h ${D}${PTEST_PATH}/
 }

 DEPENDS = "udev"

