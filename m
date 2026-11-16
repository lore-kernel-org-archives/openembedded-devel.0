Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4738.1794866444109300867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kh3DAQJa;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so3301054eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866443; x=1795471243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl0/7NKM2iuvsOU1E/MlrpphgUyCSu7wkOPFnU3gaIA=;
        b=kh3DAQJa0bs8+r6vdJ3AWRR1hBqAXfd5Li4299QLXHUTgGa0QrpGn0jSQg7fPuuqx6
         juYZkhJl3zUa4HFNiAvH/hRsPRNN7DY48JnjFwVV93bwVZDIRbTWPs7g0FBSZYTSJ7ZY
         e1mi4SLsAqTh/WyIy5YTN28KUvab97bI2A4xuRlwXSqTSASgUadCctuNUh6l0oaPuDa5
         Iz5znzGK2ROqYGzT+LDJeYd4RV/UmKb8m7UPodwmAIpv/fDbTnRHfTF6sLuNqMojOmmj
         eEXjMKcCQ2QLw3mQAHsZD9tGR3sOW6/xt0ae6v4T+IV7msAeodiLIk3qe3lVce1zixsm
         5kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866443; x=1795471243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cl0/7NKM2iuvsOU1E/MlrpphgUyCSu7wkOPFnU3gaIA=;
        b=20cPXRsgoPRIw1zt1hMbatNZXlPIKnIsUrjChRwgvQBifF8fAFKeKn0wPfJF/GvMIv
         +jrjjMIDuQBn0hZ2rPV5N3CiQCbKoJHiQDgxwfXppcA14/SeDd39F+5dO+Kg6tMdMA3s
         kdWRz5yA+eg8SeP+ZRUJmu2oCAqrjDfq9oe0JsHdowrU3+FLoo5l/S3PWNq89qtW6lZG
         RVGXswKu3QhfeN4i852XHnpjC7UA9BhyXIDgmVSx24mCt3QaygDE1OCA3HYUc/2YmZj2
         lirtWbxLXBQAb1Gu161zjvi8Qgpp/rBv5VBOfJb1XCK7sypwzUOa8qZ0MWN3WKo4GFW5
         2mkw==
X-Gm-Message-State: APuU4Z/U7TotvQ5ingM7OrKCzHmRsOIfLT6HToh+tbyXOCQc94YdHHaB
	02wdeu5q2h1UtZhNSPUPMByfUL7SvubVY4tb5GS7W2dvdFQqKZC+ygpAsnjYO+B8
X-Gm-Gg: AZFdTZfrvjBcd0ALMShTiuTBiGpRhZkNzp3ZAIGxF+7ovaOGqmEvz0eXIbe5OD3Gev4
	/s+++X2nKXhfI4Z65bMLfvze5RXtJF2WprIjAMPj5EDpQ7r5CKP0aUrPhvRcy1henSJhUyPNMWb
	KmeIBvHJZja9NkY2rP/9DcqzgwnDzvF6e5WPg3p2oPv/9Az/sy46iCosDmiK24H87w4gUXpE9yi
	Pj9ofubeUADIpv1j2S4Jo5gALZ2tsmBa2JLhjLBBoInaLEbMaCKY4Tz7gAsRdroAYGDu5NrEn2G
	1gk42lCOzehXeF97oOz8mKbB9lU518J57/rfSo+Cs2dyyUlo+Hj9LtRisEpWcpJ8yXn1kyi9oFu
	QD7wRZL6ONhmLMlCwqasoExzfr+ka3gBp3rdH9FkOyeKTSYs+B1aP3vqJu1qCcCN2Un54+N6kQT
	nakTJHyxSWWORfO/3MQgQZRNTFDAnP6BHZytRz7g4K1KJYZ9IikEvP40m8tKc6RUk7lEmkHYpvy
	kHSH9pVIIWdU3UXd4Gv8mygMzSSSieyKh1/TCDU8HHXJZYOBMzWpCCLwv+zkvNPXSOf8uza46SS
	Cp1ronff95+OakuOD0zAgYEHlY5ZFgFhBH4zijrybPOBfAKxhEjIngkQ5xTt6A2HSogYQSdia8v
	qrTZTrgK9hBJdVkNNPFYz9k793o7Yo1Q5j7nAch7yfEw/G9DmD4Mjya6KqYNapJ1fjQgWKRbhID
	bkUeag7n0RPDIidXa7+CsI8413ZsCbaopCeAlbzxc445BCOtJynVJW4FynyZWDc4DKiKwhAY6DX
	E6UVOnYuKxvWblLv6VulHNYlaDeTMX4zg2Ujpd80fQtktiEdqZ1C/elVJOuh3ISk+PalK5d2/tN
	W/NC
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr11766188eec.40.1794866443040;
        Mon, 16 Nov 2026 14:00:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm1221905eec.5.2026.11.16.14.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/5] kernel-selftest: Report per-test results in ptest
Date: Mon, 16 Nov 2026 14:00:35 -0800
Message-ID: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132565
Content-Type: text/plain; charset="utf-8"

run-ptest printed "PASS: kernel-selftest" or "[FAIL]: kernel-selftest".
The latter does not match the FAIL: pattern of the ptest log parser, so
whenever any selftest failed testimage reported no results at all:

  ptests which had no test results:
  ['kernel-selftest']

Convert the per-test TAP lines from run_kselftest.sh into PASS:, FAIL:
and SKIP: lines, so results are recorded and failing selftests are
listed by name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest/run-ptest | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
index 4e170fc2d0..e8a136dce8 100755
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -7,9 +7,22 @@
 # move to their own process group, escape the per-test timeout and keep the
 # runner blocked (and silent) until they finish, so ptest-runner kills the
 # whole suite. Skip it.
-/usr/kernel-selftest/run_kselftest.sh -s -S ftrace:ftracetest-ktap -S filesystems:file_stressor
-if [ $? == 0 ]; then
-    echo "PASS: kernel-selftest"
-else
-    echo "[FAIL]: kernel-selftest"
-fi
+#
+# Turn the runner's per-test TAP lines ("ok 3 selftests: cgroup: test_core",
+# "not ok 4 ... # exit=1", "ok 5 ... # SKIP") into PASS:/FAIL:/SKIP: lines
+# that ptest log parsers understand, keeping the original output too.
+/usr/kernel-selftest/run_kselftest.sh -s -S ftrace:ftracetest-ktap -S filesystems:file_stressor 2>&1 | awk '
+{ print; fflush() }
+/^(not )?ok [0-9]+ selftests: / {
+    res = "PASS"
+    if ($0 ~ /^not ok/)
+        res = "FAIL"
+    else if ($0 ~ /# SKIP/)
+        res = "SKIP"
+    name = $0
+    sub(/^(not )?ok [0-9]+ selftests: /, "", name)
+    sub(/ *#.*$/, "", name)
+    sub(/: /, ":", name)
+    print res ": " name
+    fflush()
+}'
