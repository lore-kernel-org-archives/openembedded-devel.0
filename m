Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web09.10618.1607005456791407188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 06:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DFz5vHGE;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id t8so2203735iov.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcUGKIMsg758kCyBHcF90vBwXxeaypOV5uHsOHjlpn8=;
        b=DFz5vHGEpJ8AZFPhXkEEPBhTDHgQBWQ17Q0BE/Wcskcjk7oa1jImpleeyCQFtpueUA
         xUwqXWBT2DQd0fPm4dJOha1U+Q+NGNwP99Cv/c6XOLMe2CfUdw3L0jBmSUUbXn2Oe0D5
         1bSB52fCYgQT3wHBL7H6f3bAVwFNsas+BsGbBa7E97cBDwpqjCdy4BmQ4dGYs4kkF/Af
         xRbdkTpt2HSmJ2sUAwFJd5SDaUBoNWqurYVtb11NGccir6ior2uoqXo3DdguWNhO/wQE
         DClpUxZzyaq9SlNf8ERX5cST99qLfW2+HHvWP1ClpTP6GN+hW6fgBaE8tn95cbQkyt/m
         RWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcUGKIMsg758kCyBHcF90vBwXxeaypOV5uHsOHjlpn8=;
        b=B3KeXeG1w0/CeLPpLqAw0pZJ9uECtZdbZOemOkYqdlwFnlWBuj3kxNsnSUsm8cY0JE
         bh/vEsffFMhlNIEGA8BVtGSLh2IYTlpX9iOX7LzhA4CvYevoxAsIRkuB8s0D1CT8BGnN
         yMzzhgRaqL2CmMsDqB8VVYhBRCph5F4vVtgCoGSAvYY35Bpp00V7mW7A4VNZf8+AQ0gZ
         bE/1A6T05VH/Ypovtk9hGua6eAY3clS6pwTMZmGVtPOUT+D5nts3osUgTFvI8cYarC6a
         3LN0eI0u4X9fZZnBEAu0HiEqDXq1BdqD0d8MsmCSIrq6V/4Ip++tEMhg9Aaicv+GEY9K
         RY1g==
X-Gm-Message-State: AOAM531jyWLF3bCS2nNjaDXVHlsHt/5N47QzyihuNASMI7+ZI/0jfqhW
	pRi9WQqpnYNf7XfbdTbcG1u+JpUuS3+vjg==
X-Google-Smtp-Source: ABdhPJxStxoYm7gMxH8XSzVDG9hrrb7q4dM1OXU3ugx5G6udWyy/XTQ0Aj7bO7Dpk2EmmsgsItXucw==
X-Received: by 2002:a6b:92c4:: with SMTP id u187mr3225682iod.57.1607005455886;
        Thu, 03 Dec 2020 06:24:15 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id g1sm744722ioh.39.2020.12.03.06.24.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:24:15 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/3] glmark2: update information
Date: Thu,  3 Dec 2020 09:24:05 -0500
Message-Id: <20201203142407.4865-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to https://launchpad.net/glmark2 the preferred "home" and bugtracker
for the project are on github.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 2e727a01c..320d07dfc 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -1,8 +1,8 @@
 SUMMARY = "OpenGL (ES) 2.0 benchmark"
 DESCRIPTION = "glmark2 is a benchmark for OpenGL (ES) 2.0. \
 It uses only the subset of the OpenGL 2.0 API that is compatible with OpenGL ES 2.0."
-HOMEPAGE = "https://launchpad.net/glmark2"
-BUGTRACKER = "https://bugs.launchpad.net/glmark2"
+HOMEPAGE = "https://github.com/glmark2/glmark2"
+BUGTRACKER = "https://github.com/glmark2/glmark2/issues"
 
 LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.28.0.497.g54e85e7af1

