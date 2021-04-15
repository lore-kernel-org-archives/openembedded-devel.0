Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.7665.1618496295487793721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 07:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QXuSofbo;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id o123so16161294pfb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Apr 2021 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37GSLZDqsCe3Seymd0SsNFTvkhCUWUT1X3U1nVwa9M8=;
        b=QXuSofboxPLSte243gI2yfmQFd1IAIkcMCeWzrg2Bs9ea0CnXYzZgxDuDVYtlBT979
         Fo0elz7yBdFFQev2Gk1PZ6gMvOrZ2YUKiXPRbXBciMoynea3KfZrs5iKTMW+UW8sLFYj
         cMCEcmEceTL9p3ouUmvzl5d43uOWavQKn7lFlGGJvWbz9QzhIQ1Y0xok8HX1eDz6OuEZ
         YbeSoWncyRb+N+m5VjrrysuDDUCi6t3riwAG4kIPfy51NvBHozZxsZWMZwOG/0YIA3vb
         o7K6SBIwXR8AuDdb2XIDLoFkNrDXbWRBAYKwRUP+jb5xIzWCE6sFNyubZ54QmmdEx24r
         GVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37GSLZDqsCe3Seymd0SsNFTvkhCUWUT1X3U1nVwa9M8=;
        b=S3Vqm8n7Il/EV3/jpKUuBt/jRtxheDWW5HSOBbY7C0KzJOBCgke0tcOZUrmxqwPPov
         TDJvka3mHvNoZduQ0ToDYSl+x1E2evUPvHZg1ytvSzsrl3M9HUYYyDWXNwSJ6ADXp4B1
         ohDwTXR+91D9sb3DhV7Xme7fX35Vojh64BMAAZhqrld1v0f8o7qzT6NbjqY255LlcgkF
         aKRnkA/OfgnGu+WDFR4bifQ0s0KDB7nez1rQV/7QOakfpU/yN3GKcsTbIuK5aJo19j4w
         /gWj7D+W9snFp/qLCtYUxg516mYLizTSgWhIqaZcEnLOH78KJj8ntLJwT1i3SAI1lzS1
         Hp0g==
X-Gm-Message-State: AOAM5312JB+54BceKKJDP8MA9QnLiMR8IaiEzvW4gUhCar0UKWxpvc4+
	MPE16E8FzWUr/S1ChWNUJdzcsGgaQgwWig==
X-Google-Smtp-Source: ABdhPJxmDiNjsdbCnBWSEBpJK3vFEX9WgImp829Yq5NGBnFHPg9gNMOWeHc8isCpDQ3l2TASr2ZS2Q==
X-Received: by 2002:a62:f84a:0:b029:245:17e4:bde2 with SMTP id c10-20020a62f84a0000b029024517e4bde2mr3352646pfm.64.1618496294692;
        Thu, 15 Apr 2021 07:18:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g10sm2164229pfj.137.2021.04.15.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:18:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <Trevor.Gamblin@windriver.com>
Subject: [meta-networking][PATCH] open-vm-tools: Fix build with gcc 11
Date: Thu, 15 Apr 2021 07:18:12 -0700
Message-Id: <20210415141812.1342585-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <Trevor.Gamblin@windriver.com>
---
 ...latile-qualifier-exposed-incorrectly.patch | 29 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.2.5.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
new file mode 100644
index 0000000000..fdcd7d614e
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
@@ -0,0 +1,29 @@
+From 524fd4db646b4ac2155074b4cedf8436a8ff726d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Apr 2021 06:58:31 -0700
+Subject: [PATCH] pollGtk: Fix volatile qualifier exposed incorrectly
+
+GCC11 flags it
+
+Fixes
+glib-2.0/glib/gatomic.h:117:5: error: argument 2 of '__atomic_load' discards 'volatile' qualifier [-Werror=incompatible-pointer-types]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/pollGtk/pollGtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/lib/pollGtk/pollGtk.c b/open-vm-tools/lib/pollGtk/pollGtk.c
+index 4ccaeda6..336a8bf1 100644
+--- a/open-vm-tools/lib/pollGtk/pollGtk.c
++++ b/open-vm-tools/lib/pollGtk/pollGtk.c
+@@ -127,7 +127,7 @@ typedef struct Poll {
+ } Poll;
+ 
+ static Poll *pollState;
+-static volatile gsize inited = 0;
++static gsize inited = 0;
+ 
+ static VMwareStatus
+ PollGtkCallback(PollClassSet classSet,   // IN
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
index 256949a03d..473af8d41b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
     file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
+    file://0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch;patchdir=.. \
 "
 
 SRC_URI_append_libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
-- 
2.31.1

