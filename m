Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A42C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.292.1650402539896587325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q+qpLLJH;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id t12so16972034pll.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwyKxwUqqC8xVBGOiIWIyiBMXYBITuyRJ5Wh59XFzkE=;
        b=Q+qpLLJHnPY6GkJMuI4ADCy93a0fHKQ5R0MdVUdxbBR9eklKWt2k/oIJljrs+WBlrf
         WjgoJusM3UV1K3qzFi/swuMMBH64GaPi+YIjNUf/3pZpCpLOoV1jVM5uG64dADmu4up9
         pU6WnVtV/js7In5SBC8hkArNVsIzWMZ1JR0BXX565baH/0a80XCX7z7FKC5QYZ3ViP11
         2SEXJVg6U0c1nSeOJ5tk4F9yV9+YeAKUIE+gynwbMDSD7iTVEvoErnqnjhQ6hWVGP2Bs
         7vE0OmJQO76doqlBxyPHHbTmyhNcFvsoicVXuHU7si9e3oVWRkmzHqG7ZF3ZQqpXcNna
         tWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwyKxwUqqC8xVBGOiIWIyiBMXYBITuyRJ5Wh59XFzkE=;
        b=q12eh4mFoC1Qqo1d3xgK7k7SDhYQ2rqQbe7NSqjN119+07WpT2kF9RoSfhU6egO/xK
         vwHzpQXXOTCkIGJQviTsrvjVSB/+7ExIXV14Cibz5RaCz99Fm7sTCZgrDcBrORd1EYDC
         zhlVCoPmsSEN1ZjkxGrLJTm7c1UBd+U1NL0k6O/feKyZ16+PcPlUHS9BK+u+/4jELM/H
         BVd+74hv40mUvsnuW8BxpqueYG9llMwkGksbAYuacm1OTiAwH5azITFgMa6c2mzrzo2O
         h4GVWq71QdP0N4p7Oe5PSGGwnDTxM0Ku7AH5wULzM9vSsRyWKavaLzJUHR3vFoslfIzt
         YQqg==
X-Gm-Message-State: AOAM532C6W5mghHTyRehXsJdop07nC/WvcQ+VZdnstGjOsApkiXjG0Ss
	5gGVPm/NPS9OlNF26k0o3CyvuTFov9BWIA==
X-Google-Smtp-Source: 
 ABdhPJxwWHFSHq1Q6zvWIKAN5Ht5RmX8Qgj2P7zTWPKayTdaHLuAtFlyiZxbwxB7DSkqqpIYOVDyjg==
X-Received: by 2002:a17:902:f711:b0:158:eab9:2677 with SMTP id
 h17-20020a170902f71100b00158eab92677mr16220544plo.56.1650402539136;
        Tue, 19 Apr 2022 14:08:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 34-20020a630b22000000b0039d97037bf3sm17334336pgl.92.2022.04.19.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 14:08:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-networking][PATCH] ot-br-posix: Fix build with gcc
Date: Tue, 19 Apr 2022 14:08:46 -0700
Message-Id: <20220419210846.3638856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96703

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 ...sable-nonnull-compare-warning-on-gcc.patch | 40 +++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
new file mode 100644
index 0000000000..f0bb392a9f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch
@@ -0,0 +1,40 @@
+From aa706d714294b83db696de2beca9a722a512796f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 14:04:40 -0700
+Subject: [PATCH] cmake: Disable nonnull-compare warning on gcc
+
+GCC finds a legit warning which clang does not on code like this
+
+class Message;
+void SendResponse(Message & aMessage)
+{
+    if ((&aMessage) != nullptr) { return; }
+}
+
+Perhaps it should be fixed upstream but for now disable treating this
+warning as error when using gcc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 59a567e729..3134740ff6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -57,6 +57,10 @@ endif()
+ 
+ set(CMAKE_CXX_EXTENSIONS OFF)
+ 
++if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
++	add_compile_options(-Wno-error=nonnull-compare)
++endif()
++
+ if (OTBR_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
+     message(STATUS "Coverage: ON")
+     target_compile_options(otbr-config INTERFACE -g -O0 --coverage)
+-- 
+2.36.0
+
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index c1af388627..a16b77849e 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -16,6 +16,7 @@ PV = "0.3.0+git${SRCPV}"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
+           file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.36.0


