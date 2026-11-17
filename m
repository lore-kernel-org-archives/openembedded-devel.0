Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14886.1794911772939342124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Aj21H7xh;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2420501f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911771; x=1795516571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFdmgR59VEVHHhX53w0d/eEdnjn6PPgNdEJlhKLM9QI=;
        b=Aj21H7xhXWMG0lt9n3i/tO0Rz7lBl6LXkIhH7YHQXZcgPdGqZB6YwTdOGXjWFAbZQc
         jCg4vispKqSgCQ9Zcly+fQlyrvKz/KHdgfb9XJuIfoMdZqdoIgRO8M1IDj0yrLrrNx6/
         apw5hnV1jB+LvZOj4ldtxlCFAs4N5EtpY5zzTPc6czTHAZ5UZgfjZjTH9yHYf9UYwO05
         xwZcTdVqrgDi0cV/APo9S5XARpk+jIDtEOExUWvh6cio2LxBov/Nqs6Il3I1v9WT/cU2
         YWInZ+E49TxDWjfoyn2CvUQ67fp0wlY44JSvK8q8r0of4V9ehaAyfGHl3hy1mFwjkWGh
         Cb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911771; x=1795516571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFdmgR59VEVHHhX53w0d/eEdnjn6PPgNdEJlhKLM9QI=;
        b=THCufeIbZPvtAkCfc1cCt2QiwCzyKTxLQp5AaNDHNqh3PDstesWs5QySp9t7zzvSdU
         TKXnmp7C1MxoVz3eixZ5FmpyZD4OOwBiLwnL72RBM5oUBZSfiIVk2D8W+5BSqEJvDttn
         pwO0xlLQC/QMTJzeKLk0ThR9vbfdyHPx3dAEwv8tnQD2X0ftdtwg2fF6CFo6zxu+9cGS
         vrq5Wvscd7BT3QYGLSR5qy4fRtbNzdNMumFDgXXIwnYjaZj/5oVAm2u4cJZiDbTkxlRX
         IgUlwPqj4mmQjZQASLCVTV2Siwpv/s9rqiZ53P1ysqcVtr3UnmXuBhg0k1cLP44t9dph
         zu1w==
X-Gm-Message-State: APuU4Z//nyzVJvY2tj9WYugxfigvvF9JbGUDN8kZe0eXR2HLXgtVcFgb
	DSkO9HWojq0w88qQke7723c6/QpBZnQIlhCrUrOTvZmZq4RhVAsIfGwrknAMoA==
X-Gm-Gg: AZFdTZeRbqbTuOUuDcLFrtxZapTTqCu0Q5Cs6gaetfOl+kRwXaf2S/fU3eQw6U2CivE
	r/3R0eCanh6vjLGP9ws8kzj7GLT9IMnzkytR1+cvUvJfbkpBvRG5c7kvlZZRwljOxv5KYWCe0CD
	UM4MQr+bE2yLja885Uo3uSuynaJWNPXWIOWp3DFqqp9+rnUBw2e1/72R0zLLjhGTp3qyzKdFmyz
	DXSNqrKUOwf8lcZgAykPFwCK842moFnlri8U3rbLIJll9iHdhtm9t+UyNh6irjEcPoFrrnXtTCk
	kxvyZr+RG5hAWGWEv9NgBDAA2Qkm5/a371HM/oUruKrgc9tNDxK+4SC7v2I+lyCA7f27ix5qOVk
	lIysDlg1OSPEkuL7eqt2E7ynw95l5rc1PrbHmEYTNqpNlOPtK26FllWaerOIhqvNnshgDaDkPuZ
	QVqCMSFdqNAopjyIJwn2Z0uQ8hEk51J10RqdG9oaZ8QEy9w7Fj1qUpUo/eU5EMKmv+DsLsnHiYv
	/cMkZ41hdEIVt2oWga5vkxshU9CP7Jc05eCkOoiJb5ADVrzxp9aBi8RvHPJqSWIVF39W/RLkIvr
	nDbIL9iQCdaadEGtrl4ldjCoYTIE/4k=
X-Received: by 2002:a05:6000:2087:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4a47dd110e5mr2064464f8f.49.1794911770989;
        Tue, 17 Nov 2026 02:36:10 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm1604674f8f.8.2026.11.17.02.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:10 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH 2/2] overlayfs-tools: add ptest support
Date: Tue, 17 Nov 2026 10:35:37 +0000
Message-ID: <20261117103537.814124-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117103537.814124-1-uvv.mail@gmail.com>
References: <20261117103537.814124-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132578
Content-Type: text/plain; charset="utf-8"

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Run the upstream test cases on the target: the output of "overlay diff",
"overlay diff -v" and "overlay diff -b" is compared with the expected
results, and the result of "overlay merge" is mounted as an overlay.

The upstream meson test targets wrap these steps in sudo. ptest runs as
root, so run-ptest performs them directly. The tests need root, trusted.*
xattr support in TMPDIR and overlayfs support in the kernel; if any of
these is missing, the tests are reported as SKIP.

"overlay merge" generates a script that uses GNU coreutils options
(chmod --reference, mv -T, cp --attributes-only), hence the coreutils
dependency.

The tests take about a second, so add the recipe to
PTESTS_FAST_META_FILESYSTEMS.

AI-Assisted: Claude
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../ptest-packagelists-meta-filesystems.inc       |  1 +
 .../overlayfs/overlayfs-tools/run-ptest           |  7 +++++++
 .../overlayfs/overlayfs-tools_2026.11.bb          | 15 ++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100755 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/run-ptest

diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
index 26917a93c9..bf2701b660 100644
--- a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_FILESYSTEMS = "\
     e2tools \
     exfatprogs \
+    overlayfs-tools \
     unionfs-fuse \
 "
 
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/run-ptest b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/run-ptest
new file mode 100755
index 0000000000..80e0c2b6b6
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+cd "$(dirname "$0")" || exit 1
+./test_cases/run-tests.sh "$(command -v overlay)" ./test_cases
+rc=$?
+# 77 means "could not run"; the script already printed SKIP lines
+[ $rc -eq 77 ] && exit 0
+exit $rc
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
index f0c378e043..4714479024 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
@@ -5,12 +5,25 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
 
 SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=v${PV} \
+    file://run-ptest \
 "
 
 SRCREV = "42582352e11b162895c06826f18a2246d8005ca9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-inherit meson pkgconfig
+inherit meson pkgconfig ptest
 
 DEPENDS:append:libc-musl = " fts"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/test_cases
+    install -m 0755 ${S}/test_cases/run-tests.sh ${D}${PTEST_PATH}/test_cases/
+    for f in lower.tar upper.tar diff.saved verbose.saved brief.saved; do
+        install -m 0644 ${S}/test_cases/$f ${D}${PTEST_PATH}/test_cases/
+    done
+}
+
+# "overlay merge" generates a script that needs GNU coreutils options
+RDEPENDS:${PN}-ptest += "attr coreutils diffutils tar"
+RRECOMMENDS:${PN}-ptest += "kernel-module-overlay"
