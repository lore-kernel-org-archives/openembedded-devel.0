Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35458.1792987101950492739
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RTuF5J9u;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso7648616eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987101; x=1793591901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmrdfL9n1UbdlB80WQxxv7Jb39N+O5uQv7GxV58Uzg8=;
        b=RTuF5J9uJM0udzEEMySckn8G4kCYpn5ypWL3upoILwEKKqYcPSWPHNr0m5PFxdNgrt
         rmIuH5NHj8l09fhe+AD6kAo+2ilqquJ7yAVznNKTOXc8v8vhp7JLCMAg/aRWtWVerFmZ
         aiZyCGO+Wc0Qgi18nuu0rDLTPp/yZTVzhx6w21iI2KNbw4mw1SosGlfnN+dw9qUuHKXX
         yMnuFBJ9XdPusJAEc09OfKAlBBaqe8YfMRoydB3FN+AEL5qT/mjSSSqCkL88cdEz22vx
         cEnjfobDp5ccyjhXkbtxQmDnNH5KSR/6ITsuxrwWCDBubf3jfHjly7v4nxTYwp8otbOP
         zchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987101; x=1793591901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmrdfL9n1UbdlB80WQxxv7Jb39N+O5uQv7GxV58Uzg8=;
        b=yMFMnvJrHe4gctBJ/FoehKhx6tvSLPFMxTVnAibhpACbRWN+Ye+0Z86cdB+tVrbUD9
         6Vkj3wM/gg3Fkok+YRxCh4LSz8qlVXEkSQV08Q6xqsVIWppEXH99FXWcqWZFsGtOn/tf
         ZgO3P+42knimmwF/MOpKFVqM4m2VVRgR0WVAUw7yaYu46B5ugyQ0nnsUYhDYazOLOCSS
         gE9qlGU7GHfq4edO6pm3U5/zlmjLrGiuIrmoXL8EIizy27n9kC6e2JPG5EOnbI6IS3j2
         32R1R5P97H3wo7XmxM/i5x0wFRUs7LGUOhftBB0nT3xC9ahpGPTa4A/0MhyDkLfDpP51
         071Q==
X-Gm-Message-State: AFq9FYLgQxgcPDIgytFZRHeQUWjjkkfODvrAMG9iJNowS2BXn8cOqaBK
	D0smYs9gQROB5Sj8Mc1p6YJy0gmQLgRURJEi4D2xNQxYplKs8atU5wCdvPTBEmP1xj8=
X-Gm-Gg: AYBFou0rE9s4PMlQfZe10UeBNCo9sTtnXs3eKAJxBXrAbmwCLEeGH/y6AMYNW5V5ebb
	kmO1CBK+b/5xs5v4+SYE+ecTBXXVBKAMxpXDg3YkWIMyLoqHula85+0PECKPOh1hcPUjH+X/vJ8
	EPux40EOJjPJBO3LGIjw/MPNkL6/8aJhQB7+zWIkrhuPNeChmshOu9FQ5h/nq3VGB0G2C9xaqVq
	pc5OTQMoboyyPHcgYhmOXkwQC5+ulfYAVM4qiM0gWmPEIvxkY9Xeh/HRw1WtA5EZYuPFCxw9CPF
	lOEqLVgV525id8SrnZ4zbIGTpBl8XYC2hNJ2G0NqxIycj2bxTu1w7GQYZzXDPCD6i9+1v1CMi9p
	MQKqVOd8Cl+rv3P9Ts6hB+lMOMEjNMfFS+o+VHeyhJWuZQaYFjttEdh6W1FqoHkFCXRAYxbDEzk
	PLOoQx1z8CzxZkmZZY8dbCG6EsPUlCbjElcjKHQBkV/w7n5PtoZ/LK/qNe6PMFY0Qcv9esb5F9C
	uhSvtKovx+93LKeNBTe8caK1Sd3ZslJiO+DVKj98NVsEUMbT4GdPWBndKKD3D+iEfgHrZPC9mjN
	RTbxpnGIHoQfOCMbhwWahebHXweky56xwPe379J+GAYdei+dBVvyzPk4eyIpSa9GEVGSjcfWU4k
	yXodUkkuxtnBZpjladnB/UlSJKueCbI5E0QjWlBu4GJbzfFJtPq8eCeKhRD/n2VgcEUTyeQNKFI
	2nOuV5EUTf4OJySQnR+JRSBhepL7ALlmJh/zl95bY5FE+X4B50SApY2A3etD1EpVnDrIOd2tipu
	83Zx7AruIi8AdHge5Jrndcq99t0bk0W
X-Received: by 2002:a05:7300:cc14:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-369e84dcb4amr11001478eec.24.1792987101087;
        Sun, 25 Oct 2026 20:58:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/8] re2: Skip upstream's big tests in ptest under QEMU
Date: Sun, 25 Oct 2026 20:58:09 -0700
Message-ID: <20261026035814.55254-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131415
Content-Type: text/plain; charset="utf-8"

The CMake build registers every test with ctest, including the ones
upstream's Makefile keeps in BIGTESTS (and Bazel marks size = "large"),
which "make test" does not run. Each of these runs silently until it
finishes, and under qemu emulation several of them take longer than the
ptest-runner timeout. On qemuriscv64, dfa_test stalled in
Multithreaded.SearchDFA until ptest-runner killed the whole suite after
450s. Under qemu-user, exhaustive3_test takes ~460s, random_test ~760s,
and dfa_test more than 15 minutes.

Exclude dfa_test, exhaustive*_test and random_test from run-ptest when
running under QEMU, detected at runtime via DMI sys_vendor, a fw-cfg
device tree node or a qemu device tree compatible. Doing this at build
time with a qemuall override would make re2's task signatures differ
between machines sharing a tune. Real hardware still runs all tests.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/re2/re2/run-ptest | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/re2/re2/run-ptest b/meta-oe/recipes-support/re2/re2/run-ptest
index 8bd5fd1efb..8026ebc2b5 100644
--- a/meta-oe/recipes-support/re2/re2/run-ptest
+++ b/meta-oe/recipes-support/re2/re2/run-ptest
@@ -1,3 +1,20 @@
 #!/bin/sh

-ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
+# Running under QEMU (x86 and UEFI arm64 report it via DMI, arm/arm64/riscv
+# virt machines have a fw-cfg node, ppc64 pseries a qemu compatible)
+is_qemu() {
+    [ "$(cat /sys/class/dmi/id/sys_vendor 2>/dev/null)" = "QEMU" ] && return 0
+    for f in /proc/device-tree/fw-cfg@*; do
+        [ -e "$f" ] && return 0
+    done
+    grep -qs qemu /proc/device-tree/compatible
+}
+
+# Under QEMU, skip the tests upstream's Makefile lists as BIGTESTS (not run by
+# "make test", "size = large" in Bazel); emulated, each of them can run for
+# longer than the ptest-runner timeout without printing anything.
+if is_qemu; then
+    set -- -E '^(dfa|exhaustive[0-9]*|random)_test$'
+fi
+
+ctest --force-new-ctest-process "$@" | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
