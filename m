Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C00C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 03:53:34 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41902.1789962809049749015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2026 20:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jRw1ZLk8;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso2190813a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2026 20:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789962808; x=1790567608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2+GSq4nnuy8To/ZMgo9TBRE/OqQY6LkpHMtEEZlIVM=;
        b=jRw1ZLk8evvaxs8yVOwtm+v51nutcx3YcL1m30PWp/hnn1ga3DTLbEcPpHFw6Koqpe
         yi5+EFbk6UGPRTzgqnwho+dOKzVgiouo0qrFQXRJCuj06GPsqwMbQ7G36qjL9QILX9Jl
         FGAOF2usfQmur/fJ4gtrghJP8LHcrd7X8TjcCXp65qEAXCvbiWsD5zJ+NbNJjG6uOWrb
         0vX8Ot3JsAGX8P3G9Brij8QmaABWIZxNvDGq4LnVAG7ZJmKOpK0PNZ+X4S171KlvuoIf
         pYKI6lqlb1fILPfPNRSSjfTjMNXV4SvKNXeDu7/HJzkntaoMnOsKeFG/N3yhYFl7W4Cw
         lMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789962808; x=1790567608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2+GSq4nnuy8To/ZMgo9TBRE/OqQY6LkpHMtEEZlIVM=;
        b=JelyUEyC0AA8dCV/iPZeytfP6Tjz+dhvDdBtRiC2BSB6Yghk7aJH3D4xl/tLKx3jvU
         sqjTS5AAbOsJAYe/w+XmBmtTHrZjQfh0qKibcnm/JD8kX9T3+Nkr4Zcu7Tky+1i9hVJ1
         /0o25jx1jTTLCRyTZPQCiiCqyExCRgZVCSZrlLi0y01pVKU2zsazYM7io5LXGjIqJtZj
         wtc+1zztGE4JvpKnt90JxzheVLcr2YJ1507gSDQqg49dUthHtVoVcwF+FzlL5RwTJz9S
         yGjPTxo+32KkNEG7sEyi+pBSURVCSgHTwTjllvTT+ubUDcVUdpCHQ8YeGJx/vwIIph2T
         a0bA==
X-Gm-Message-State: AFuF++mG+thNTX78jlEv5IsBDAcZ5iPcYV5TPjuE8e1WKUU7Z9ibuEuW
	QwcgllA5PtHQMp+FYR/7dkRzl0fqeN1XKAlNjJTjf94R3S01WW/PwcPcloIRyw==
X-Gm-Gg: AYBFou1vzaEb71w/SnyclxaTJ4vORy+rtmP7vMe2ePpHAypEUaa+cLc9InxwWcbxTlx
	NXJWE9JIb6Xo6DOF257geATYez1TZhZ3cXNbw9DW8PVPJJr3ZznQVOwUWp5pQbcIOWsPG8v6HCm
	FfxqGdKtrJ5zbr/cEdDiGopN8eOBT5iw3e2vlQLj6TPOnD46cc0oe4mL79FZ76TCROwOIurUv+e
	HOWNPJFPme/QAGBI8CRz/p9qtKa8ZF1uQywUem8bU6I2lkgvVKlfj4NPEchjQW63QvhRPJSj7dV
	CgUpxw8oLNSPnVMxfDg7FfbANVn7oJRsqYZsA6LcdUSJgAPe1hDkPinfheLwYCpf5legRivIWE8
	qxMcL/apoWt6Cer1+RFnJ0eKdhuhCREiJRn27GD9wMR7byJM+Vxzpg496woNbz5KJcQYtYdpQWr
	YkKCrLbfneCuSuJKvdmc4XqQr0wOKwkqON0ytMV5hnjIJjSyLlgqWPq71YR7Uzmto8DSetCQoj5
	0QiRMIvghYGmu8D4Rgs8VpgVLVxHZLMBTJPyFFC5/bDFHS0+li+s0SR/NhcjiPfS5LSlPouUySW
	d7cCeukGvxLAff7MyzE8UWnVhWqltlYvw1tyw5rUEpHxcnqlO8A2/uOjNCHKXweseOSWKH5PuFG
	ru5GrjrAHEMHqcDMxWU1o9hvbNPKIjmFtDU0nQXCnT0v1pZxW1cKsubW+N7781Hn8QqJAoaxbiP
	fY0eiOiyRwV6xHs/5uKRXM7xmjOO9+OXTBFMZn0w==
X-Received: by 2002:a17:90b:3b8d:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-39e6c69362cmr8345882a91.57.1789962808357;
        Sun, 20 Sep 2026 20:53:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55a4378sm14924771c88.4.2026.09.20.20.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:53:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] kernel-selftest: Delete patch not needed with latest 7.2 kernel
Date: Sun, 20 Sep 2026 20:53:23 -0700
Message-ID: <20260921035324.2558889-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 03:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130127

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  1 -
 ...s-proc-include-fcntl.h-in-proc-pidns.patch | 40 -------------------
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-include-fcntl.h-in-proc-pidns.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3f991b9b7f..6519b4ee4b 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -23,7 +23,6 @@ SRC_URI += "file://run-ptest \
             file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
             file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
             file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
-            file://0001-selftests-proc-include-fcntl.h-in-proc-pidns.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'mm', '${MM_PATCH}', '', d)} \
             "

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-include-fcntl.h-in-proc-pidns.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-include-fcntl.h-in-proc-pidns.patch
deleted file mode 100644
index b34be8fb49..0000000000
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-include-fcntl.h-in-proc-pidns.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 879b3353d04d043a9e01525c520d9b81339421b2 Mon Sep 17 00:00:00 2001
-From: Amin Vakil <info@aminvakil.com>
-Date: Thu, 18 Jun 2026 18:44:44 +0330
-Subject: [PATCH] selftests: proc: include fcntl.h in proc-pidns
-
-proc-pidns.c uses open() and O_* flags, but does not include
-<fcntl.h>. This breaks the proc selftests build with errors such as:
-
-  error: implicit declaration of function 'open'
-  error: 'O_WRONLY' undeclared
-  error: 'O_CREAT' undeclared
-  error: 'O_RDONLY' undeclared
-
-Include <fcntl.h> to provide the declaration and flag definitions.
-
-Fixes: 5554d820f71c ("selftests/proc: add tests for new pidns APIs")
-Tested with:
-  make -C tools/testing/selftests TARGETS=proc
-
-Signed-off-by: Amin Vakil <info@aminvakil.com>
-Link: https://patch.msgid.link/20260618151444.124739-1-info@aminvakil.com
-Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
-Upstream-Status: Backport [https://git.kernel.org/torvalds/c/879b3353d04d]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- tools/testing/selftests/proc/proc-pidns.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/testing/selftests/proc/proc-pidns.c b/tools/testing/selftests/proc/proc-pidns.c
-index 25b9a2933c45697..6f7c10fe97b304c 100644
---- a/tools/testing/selftests/proc/proc-pidns.c
-+++ b/tools/testing/selftests/proc/proc-pidns.c
-@@ -6,6 +6,7 @@
-
- #include <assert.h>
- #include <errno.h>
-+#include <fcntl.h>
- #include <sched.h>
- #include <stdbool.h>
- #include <stdlib.h>

