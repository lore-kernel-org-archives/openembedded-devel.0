Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1895.1795113387520059080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zmQ4CL2m;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso63371a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113387; x=1795718187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG7957jQrDxO0z4OqLFSX03vKOB6m0rro4Bj4TakwaU=;
        b=zmQ4CL2mhPXs69zxh7idSfEltuFpGzmeN5MuFpooAYqV8OvykvlHMRfHOUFRTCfUMx
         x4V8Q+n4c2HeSgJsJ3UgDxQX6cxIgaMeP0I4tzB307lyDQ0+DU0u5VfSeyJ3n54i1Hw9
         y+TJwgEWMxAXxf8pB3pLCLGQl7VmYA7hAc+md3hbYqG+1X9sfm0JNlO7bFo79wl4kA1S
         /gUgOthZ/o6mnOinc6Fc/LeviCJBBgLREwvtiP/92GDT4lSMFJOns5CasCfYf/xZgE4M
         eikZKWhQQLe8MEYaiarbTCWPMmn3hbx58VxkqU2r9cQ+wfkBiY30swyFL4mrvlchys3n
         d+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113387; x=1795718187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG7957jQrDxO0z4OqLFSX03vKOB6m0rro4Bj4TakwaU=;
        b=cRGWheSGO7lBftACgtSMoXWZiXKJJhOHm9ONdzxskIxap7qyI40cB0DIMDO4iDoA7D
         eBvnC2qxgrWT/PBfqsjnJ8NRh0ZbvVxmYYqHMUbzY8zfQzdIU6eAz7qWJqdQWbd5mkzZ
         RgsYAIGkx9Ga8UA+KmZIzznaxSmR/2hmliJl71FYL13pwqwPS2sBjC20I5nzpa82qqT7
         DdBKpairpEBY0JO5WHvibb1F1IG+xtv/rXuhaaguMVknZQUQ9+64P3pMuzkJNpmM5706
         pxe+FzS6esO4UqCuuXdv3hKx3bTsBnbFfCo2Eg5ZalIfqjt2vQjSwWqPaalSqayMgFT9
         /3vA==
X-Gm-Message-State: APuU4Z9UMf3cnJyGOADRpemHIAO5mz9L/xttZNtTQMVguhtjjLxKGGxl
	qOhYRr4k+/OReq8z5p9yMfhKd9f/5JRa98MhfdQ9L0YJP1GVag7vl0x2SkLjrw==
X-Gm-Gg: AYBFou2mPFQZ5kyL0x3XlCE5FkCIjEsPmuQ+Jr7FsmWQ4YIqNSqTl1RqmpobthBKfpn
	Xqc/PU0msYPfnvrktK3KKRfqhHACrSCMGg3FU/Mlphqk09+5beJRKklPv57aPAQX5YK0Q0rHysP
	ZZ4PtMkacbEwl9HiauIRqRmVdnzGJ+VqSI2AdXZO5v7o1CehAzwdiRRqg2BJOy0U+L3YIGKsB5O
	nBbQGpAj4Em2+W1C8oi0oO0dSQPdXBN/L1A9ciR0brDQYnA3Nxz7lZGvPvmS+MVCFSeuQ++rvIE
	Gvzb7fiBW7N+AQpQe9RV2zUgPAc0npshznij/weg+Pd3m0obwoaM9ZaOK3CaxiAsGjCBYaFxu7K
	0sir3M3BIjVBIftukza1BNzdtM5LQnXVGxW00GqfvpFvriJSaDx7ABS+/LTcwI3zF9gzufGI8SA
	sZfBmHqCBxKlZhH4uTK2bUj0IDnGuPl7I3tE14r+3volaBo5M7XjxtcVPfQ9n74A+jbwNSX9Rac
	tR0x/+Oufe5+mu0+goIgYOp1UE6iC2LgfQ8QZOnoG8NsP8fP5qC/cRt0kt3nz9z7/6KiHhXqDnB
	LOI1BEJ/wIxAzPsalrty2AyjaRBK8OMu/AI4bWVwD/ikVrHRvKNDHqveS4Tttg==
X-Received: by 2002:a05:6a20:6a10:b0:3eb:98d2:cd89 with SMTP id adf61e73a8af0-4014b65ccfdmr557295637.25.1795113386765;
        Thu, 19 Nov 2026 10:36:26 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [blacksail][PATCH 12/64] glaze: Install the CMake files in /usr/lib/cmake/glaze (as intended)
Date: Fri, 20 Nov 2026 07:32:40 +1300
Message-ID: <37c47d74ead168c64ae85e8a876c3242ddbe3b12.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132702
Content-Type: text/plain; charset="utf-8"

From: Peter Kjellerstedt <pkj@axis.com>

Commit 23304685070f85c25af858beec06ada10fd9df79 aspired to move the
CMake files from /usr/share/glaze to /usr/lib/cmake/glaze. However, all
it did was remove the FILES:${PN}-dev assignment, which resulted in the
CMake files ending up in the target package.

Actually set the install path for the CMake files using
-Dglaze_INSTALL_CMAKEDIR:PATH. For some odd reason, it needs to be
realtive, or the installed files will not work as intended when
cross-compiling.

Also remove -DCMAKE_INSTALL_PREFIX and -DDESTDIR from EXTRA_OECMAKE as
they are already set correctly by cmake.bbclass.

Finally, restore -Dglaze_DEVELOPER_MODE=OFF. It does not seem to affect
the installed files, but generates less CMake rules.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/glaze/glaze_8.3.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb b/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
index b393460c9f..e1bef79ba5 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
@@ -9,13 +9,15 @@ SRCREV = "dce5e0f7ec572725ec369a0bc59a00eeb2270a9a"
 
 inherit cmake
 
+# For some odd reason, glaze_INSTALL_CMAKEDIR must be relative, or the installed
+# files will not work as intended when cross-compiling.
 EXTRA_OECMAKE = " \
     -Dglaze_BUILD_EXAMPLES=OFF \
     -DBUILD_TESTING=OFF \
     -Dglaze_ENABLE_FUZZING=OFF \
+    -Dglaze_DEVELOPER_MODE=OFF \
     -DCMAKE_BUILD_TYPE=Release \
-    -DCMAKE_INSTALL_PREFIX=${prefix} \
-    -DDESTDIR=${D} \
+    -Dglaze_INSTALL_CMAKEDIR:PATH=${baselib}/cmake/${BPN} \
 "
 
 # Glaze is a header-only C++ library, so the main package will be empty.
