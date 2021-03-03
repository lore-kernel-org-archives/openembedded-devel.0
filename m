Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.7937.1614784117034299338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a+bXW5gE;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id h4so16529449pgf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 07:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yzrIZthCTm+mnkvCmEuwQbWNQZxltKhsryZodULeGQ=;
        b=a+bXW5gEcHr+eDeZZ2jMvKGH38ZdF8XoQca62jICI3H9l6bX5ZbyBvAeEqQlFn/GKd
         F7lcJY7ZvfmqcUNwof3dbuNmLAY43QcL3LJpsXZQCQlYZ+KeWVA+j3DdO+VtumBvCVFT
         eCcu+7XLJqFM7QNVh+ISt55rQLQPYon/VwLiHoPE/cn7Cfuq+OJzqpTIrjJCbn3u7aRP
         2p6rpSpWB0QjQU++Ynsy1AVZQKoJKmn84t8tSR72NAy3npcbWR01EQVP+6zL0gSQbIP4
         GVZxqR+iRliETg9TFZjVNLzggOOwc52eDGjAd7XnSv79ZEjLUKLPgkaVbd+ll+HaNAel
         cP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yzrIZthCTm+mnkvCmEuwQbWNQZxltKhsryZodULeGQ=;
        b=dD36QFQH4sbqvM8k8RBoLFX7ZjwRHSNPU9QIHWXPEBifgWwtvs91k+MvLJFMjrDOlj
         pv0Th+h4RobVFJGELz6fTUnwbO4LW6NHm5mGg8iZ9GLGvBWigf8hiaw71pUKmitc7DwL
         5kdpM9lx3OYRrHBUJGbZX75bkjQUribAy3sPIf0Jvcw0MjdRRFrzdoyvs16PYRRueX7U
         V/FvWCQdyqomB1AFbGfOzmDVrrkwaENApym/uPMXGoeNAaizZDlgFiF5XxG+C9zrq2qp
         nFpHDLDERGIBG3fuY5TpEsR88WjEZLJmcZBlT0/0tYiM9P7KBJq6PukGF2LmpfRFSwh7
         xbvQ==
X-Gm-Message-State: AOAM533sKOHNwO5QPtH8GmVMOIkmVWNMTYBC4s8FkaGTujRNt8s3/GpE
	KeJ5cYdY4uWn7MvjBckTn5s3vcdk3D+F4A==
X-Google-Smtp-Source: ABdhPJzkDM4rn1L2Dsl34Sk9KODA8+DFVWfpi13opygjXTyHeKC4fDtwIJK31cmHriq9x1ywj6kblg==
X-Received: by 2002:a63:2164:: with SMTP id s36mr23717209pgm.268.1614784115325;
        Wed, 03 Mar 2021 07:08:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id k16sm17806347pfp.161.2021.03.03.07.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 07:08:34 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/2] srt: Backport fix for missing <limits> header
Date: Wed,  3 Mar 2021 07:08:30 -0800
Message-Id: <20210303150830.2471319-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303150830.2471319-1-raj.khem@gmail.com>
References: <20210303150830.2471319-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-core-Fix-build-with-GCC-11.-1806.patch | 26 +++++++++++++++++++
 .../recipes-support/srt/srt_1.4.2.bb          |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch

diff --git a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
new file mode 100644
index 0000000000..0cb6943ccb
--- /dev/null
+++ b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
@@ -0,0 +1,26 @@
+From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001
+From: Christophe Giboudeaux <krop@users.noreply.github.com>
+Date: Wed, 10 Feb 2021 12:42:45 +0000
+Subject: [PATCH] [core] Fix build with GCC 11. (#1806)
+
+The 'limits' header must be included explicitly.
+---
+Upstream-Status: Backport [https://github.com/haivision/srt/commit/f1b35cbf5b9b42b031e9b119e4c802b5f744468c]
+ srtcore/sync.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/srtcore/sync.h b/srtcore/sync.h
+index 59c125a7..9f01ca91 100644
+--- a/srtcore/sync.h
++++ b/srtcore/sync.h
+@@ -15,6 +15,7 @@
+ //#define ENABLE_CXX17
+ 
+ #include <cstdlib>
++#include <limits>
+ #ifdef ENABLE_STDCXX_SYNC
+ #include <chrono>
+ #include <thread>
+-- 
+2.30.1
+
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
index 567ea68edf..f7dfda28f1 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 SRCREV = "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https \
            file://0001-don-t-install-srt-ffplay.patch \
+           file://0001-core-Fix-build-with-GCC-11.-1806.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.30.1

