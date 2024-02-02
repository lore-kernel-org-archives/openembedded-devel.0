Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140C1C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 07:58:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.18321.1706860699583839495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 23:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fv01LEQ7;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29026523507so1449332a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1706860698; x=1707465498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=py4D5+GpgnBYcX49npzWmpBtbBwXsfOqXQPAOLMsyDA=;
        b=fv01LEQ7Yhb4fNrVa4wcvhQ8scCvzHLzUJvZQGaZQ9orDZS3agoahvurbWZxPZKS1L
         W2jU/fBrgl6gOXqD2SFDPnw69prpucu1OqxCjxSADXLGHDk+1kCk44eQDjRZo2UPu2TO
         aROqDxAYypdVw0lV4sVKqmIA8c2uAwaMDhYU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860698; x=1707465498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=py4D5+GpgnBYcX49npzWmpBtbBwXsfOqXQPAOLMsyDA=;
        b=iDUWO5xUMzHZYzch04I24OvBirxoml7b99QiaxKA9C7ZgNOedF3mhyqzhW9RGe1Vih
         VUqcUnXge9OUhkAMOOiDVsl0UX1H62foQ7gro+vlAY0XDbmBlkzo30eUN0Ak+YGOHklL
         WymOxulG4owdPpILM+InIUtnERSV1CnkXXr7PjLHx+Q1qIyzqe+7fNlbOsZUNkEKf0d6
         fvHiaVJ3u2xdi7laZSyb52EwAqzfIYzKFUqwP4YEu0B4M0m6Mg3UW/HpXjGUdefwY9K5
         6vCqjw0lXXonz2/fLFeV3up2vEysedVg5uOyXkryJP5wJgkqfyNkCyebyMJ4004nE0/a
         O8NA==
X-Gm-Message-State: AOJu0YyAhN8Y3rST8my8opzwy+ng5CwNHXcRt9QK+Vd+65E50DsPO6jr
	mCj/3C6WqHZLOQkI43Kj20MIuBYBLhfsjCl01G3onAT+heMUjni6webjiX7znHm7zn0g6kBQbUM
	7
X-Google-Smtp-Source: AGHT+IFPsFTZVswqZyZTFFo6FpBQGw9d/DEM3bz/aT11QDwdH0syvSZP9ZmfrN2wH094lX+PKZ35DQ==
X-Received: by 2002:a17:90a:c717:b0:296:2865:cc2b with SMTP id o23-20020a17090ac71700b002962865cc2bmr2858939pjt.35.1706860698502;
        Thu, 01 Feb 2024 23:58:18 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.236.129.127])
        by smtp.gmail.com with ESMTPSA id ju15-20020a170903428f00b001d75c26e857sm984666plb.288.2024.02.01.23.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:58:18 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] squid: Fix for CVE-2023-49285 and CVE-2023-49286
Date: Fri,  2 Feb 2024 13:25:58 +0530
Message-Id: <20240202075558.13810-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 07:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108528

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/squid-cache/squid/commit/77b3fb4df0f126784d5fd4967c28ed40eb8d521b
&
https://github.com/squid-cache/squid/commit/6014c6648a2a54a4ecb7f952ea1163e0798f9264]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../squid/files/CVE-2023-49285.patch          | 35 ++++++++
 .../squid/files/CVE-2023-49286.patch          | 87 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.9.bb        |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
new file mode 100644
index 000000000..d3cc549f9
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
@@ -0,0 +1,35 @@
+From 77b3fb4df0f126784d5fd4967c28ed40eb8d521b Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Wed, 25 Oct 2023 19:41:45 +0000
+Subject: [PATCH] RFC 1123: Fix date parsing (#1538)
+
+The bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/datetime-overflow.html
+where it was filed as "1-Byte Buffer OverRead in RFC 1123 date/time
+Handling".
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/77b3fb4df0f126784d5fd4967c28ed40eb8d521b]
+CVE: CVE-2023-49285
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/rfc1123.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/rfc1123.c b/lib/rfc1123.c
+index e5bf9a4d705..cb484cc002b 100644
+--- a/lib/rfc1123.c
++++ b/lib/rfc1123.c
+@@ -50,7 +50,13 @@ make_month(const char *s)
+     char month[3];
+ 
+     month[0] = xtoupper(*s);
++    if (!month[0])
++        return -1; // protects *(s + 1) below
++
+     month[1] = xtolower(*(s + 1));
++    if (!month[1])
++        return -1; // protects *(s + 2) below
++
+     month[2] = xtolower(*(s + 2));
+ 
+     for (i = 0; i < 12; i++)
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
new file mode 100644
index 000000000..8e0bdf387
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
@@ -0,0 +1,87 @@
+From 6014c6648a2a54a4ecb7f952ea1163e0798f9264 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Fri, 27 Oct 2023 21:27:20 +0000
+Subject: [PATCH] Exit without asserting when helper process startup fails
+ (#1543)
+
+... to dup() after fork() and before execvp().
+
+Assertions are for handling program logic errors. Helper initialization
+code already handled system call errors correctly (i.e. by exiting the
+newly created helper process with an error), except for a couple of
+assert()s that could be triggered by dup(2) failures.
+
+This bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/ipc-assert.html
+where it was filed as 'Assertion in Squid "Helper" Process Creator'.
+
+Origin: http://www.squid-cache.org/Versions/v6/SQUID-2023_8.patch
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/6014c6648a2a54a4ecb7f952ea1163e0798f9264]
+CVE: CVE-2023-49286
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ipc.cc | 33 +++++++++++++++++++++++++++------
+ 1 file changed, 27 insertions(+), 6 deletions(-)
+
+--- a/src/ipc.cc
++++ b/src/ipc.cc
+@@ -20,6 +20,12 @@
+ #include "SquidIpc.h"
+ #include "tools.h"
+ 
++#include <cstdlib>
++
++#if HAVE_UNISTD_H
++#include <unistd.h>
++#endif
++
+ static const char *hello_string = "hi there\n";
+ #ifndef HELLO_BUF_SZ
+ #define HELLO_BUF_SZ 32
+@@ -365,6 +371,22 @@
+     }
+ 
+     PutEnvironment();
++
++    // A dup(2) wrapper that reports and exits the process on errors. The
++    // exiting logic is only suitable for this child process context.
++    const auto dupOrExit = [prog,name](const int oldFd) {
++        const auto newFd = dup(oldFd);
++        if (newFd < 0) {
++            const auto savedErrno = errno;
++            debugs(54, DBG_CRITICAL, "ERROR: Helper process initialization failure: " << name);
++            debugs(54, DBG_CRITICAL, "helper (CHILD) PID: " << getpid());
++            debugs(54, DBG_CRITICAL, "helper program name: " << prog);
++            debugs(54, DBG_CRITICAL, "dup(2) system call error for FD " << oldFd << ": " << xstrerr(savedErrno));
++            _exit(1);
++        }
++        return newFd;
++    };
++
+     /*
+      * This double-dup stuff avoids problems when one of
+      *  crfd, cwfd, or debug_log are in the rage 0-2.
+@@ -372,17 +394,16 @@
+ 
+     do {
+         /* First make sure 0-2 is occupied by something. Gets cleaned up later */
+-        x = dup(crfd);
+-        assert(x > -1);
+-    } while (x < 3 && x > -1);
++        x = dupOrExit(crfd);
++    } while (x < 3);
+ 
+     close(x);
+ 
+-    t1 = dup(crfd);
++    t1 = dupOrExit(crfd);
+ 
+-    t2 = dup(cwfd);
++    t2 = dupOrExit(cwfd);
+ 
+-    t3 = dup(fileno(debug_log));
++    t3 = dupOrExit(fileno(debug_log));
+ 
+     assert(t1 > 2 && t2 > 2 && t3 > 2);
+ 
diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
index 98257e54c..482ce76d1 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-46728.patch \
            file://CVE-2023-46846-pre1.patch \
            file://CVE-2023-46846.patch \
+           file://CVE-2023-49285.patch \
+           file://CVE-2023-49286.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-- 
2.25.1


