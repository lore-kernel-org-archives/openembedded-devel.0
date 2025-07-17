Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A20C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.42800.1752732744224605423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 23:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnLA7Kgj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so512866a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752732743; x=1753337543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kM3kfMvgLbAYjhHQc/6ytIpyHWeEVJtcuPaM/e3qAu4=;
        b=fnLA7KgjVw3PmvUh4Jud3zyqrlRbd9Up0TwYc6W3nCvMRmvy+ApHayCY/1stG/fMGY
         9xPrmRk2lilHEEj32Ms8uWdpbxSC8lKUxwvNWABmITfiHDp8PNnAXWJQkvtRN+0K/guU
         Siirj2RT7vA4i+Jvp62Z0GEdnPwRBtuT7izLhJmZmDP2Si4zHl9ze2FWHFk/0Xu5gCh+
         a28bIynJ1cS0IAF8pH6FL5xihYUlO/4R/0zEGeW8uIOOE2SLtRIZ2ZrfIfzifPYpaH8i
         HbVZIR0yS+cvo6hMNH6rHm4XsStIBcfCOYDNmpcCINvv2+31gw9Ou8goLD23UhW0fHip
         jDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732743; x=1753337543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM3kfMvgLbAYjhHQc/6ytIpyHWeEVJtcuPaM/e3qAu4=;
        b=CVaxbeJozbF/ZbMeQELorCMle4SVyHQxD2eFJ5+16JOe6EV8lKPz2nIfv/td2fwTVK
         dm61/KTQDQRI80RDPyvRoi8dUFUmFVquB/+Hxndjgo5Hf8art/zbvuZfR4KGZ3RaBQDQ
         TIHslpLHrnsSbiZAPYEMdx/KektBDcgkzbbZJeSgxt9fOoQr83DjOv/YWYOeOSKJMyMC
         7k3KiwfUgOnNBooaGA8XfxpMNVlxEl86ijPQxsotMf/fZ7Heoad8NiOi4Sx/RBk/KJpb
         Obg5dAAX2h5/+T9+q3dn2Xna1ypNnjzUvCt4KZ8kFXhWFIyXnup0joLWuexgE7WsHYaz
         LD+g==
X-Gm-Message-State: AOJu0Yz9JGFdme3R592dfpFdab6phWoU3kdP03E2kdBR7aRr/f1nGot3
	PtK3Lq1FZHrUDKzsWmiW7Di+Qy7qVK3wrPjObfJFpDQD6aYtGOkPPbu819iddFbvTDM=
X-Gm-Gg: ASbGncuJYeRMzqalZJJD4C4uqDCJTOnWXumEKQkBbofJos5eH4FaJ5OEIf3Khi/yALV
	se5xAtx0FITESBImmlYKyF0yP+jlXBMzgqGjRQ8VXldTiAjjelCLtZ1wF/QsGWHsSg8hcaoFMfP
	C0tyKR2y/SO55oiMaYVYdQZbUL9lN59qB/L2joh71bepgTxi3qoNnhWFgksRv34/I24owwfxYyA
	Kta9L58w0QXq7j127ZDEscCrDo+e58SZRFrfib9I1Ox9REO8m+WoZ+jtJZhzEsNbMuzf1lPsEsJ
	6Pii0PFX65E3OzsCyhZrbHMVvykC/1GTEYLSUc/POUsNpwJ2IYV4AZKBxMO9FN5IDGIlhc9ErUS
	puZ660FFkDREsFzJkooPIepAJ
X-Google-Smtp-Source: AGHT+IFJOe9kcHLLYdRIuqarUQIXhcw/P03yuQbgeP92+SyXJgVYsDI6J8Ac3MkNKJUfNICjgUTHHQ==
X-Received: by 2002:a17:90b:548d:b0:313:31ca:a74 with SMTP id 98e67ed59e1d1-31c9e759b27mr9781866a91.16.1752732743148;
        Wed, 16 Jul 2025 23:12:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c357])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e88e4sm752061a91.21.2025.07.16.23.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] bpftrace: Remove absolute buildtime paths in cmake files
Date: Wed, 16 Jul 2025 23:12:20 -0700
Message-ID: <20250717061220.4161608-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 06:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118606

Fixes
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testlibs/CTestTestfile.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testlibs/CTestTestfile.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testlibs/cmake_install.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testlibs/cmake_install.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testprogs/CTestTestfile.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testprogs/CTestTestfile.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testprogs/cmake_install.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]
WARNING: bpftrace-0.23.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bpftrace/ptest/tests/testprogs/cmake_install.cmake in package bpftrace-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bpftrace/bpftrace_0.23.0.bb         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
index bd3b772220..c8ccf4c83f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
@@ -41,6 +41,15 @@ do_install_ptest() {
         cp -rf ${B}/tests/runtime ${D}${PTEST_PATH}/tests
         cp -rf ${B}/tests/test* ${D}${PTEST_PATH}/tests
     fi
+    for f in testlibs/cmake_install.cmake \
+    testprogs/cmake_install.cmake \
+    testlibs/CTestTestfile.cmake \
+    testprogs/CTestTestfile.cmake
+    do
+        sed -i -e 's|${STAGING_BINDIR_TOOLCHAIN}/||' ${D}${libdir}/bpftrace/ptest/tests/$f
+        sed -i -e 's|${S}/||' ${D}${libdir}/bpftrace/ptest/tests/$f
+        sed -i -e 's|${B}/||' ${D}${libdir}/bpftrace/ptest/tests/$f
+    done
 }
 
 EXTRA_OECMAKE = " \

