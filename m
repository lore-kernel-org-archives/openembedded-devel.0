Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBE1C43219
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.1553.1650409829049562528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlOVhnMJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso216256pjk.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=woTHhb8xkpKzsK+QY1tBSbR2OcLqhhhmCbFbUpVNpUM=;
        b=AlOVhnMJ9HAKjolexM/bt3PkL/f7SrLaJ9CYczKEep63yWETeVrEFsSG9AeIaOyi4s
         frYeQ0xOBCUMblgmyjuW4be5/M8hCo8pwwLqlfCaY1HK4GWZ4y9unTByxT7H5mHkfLgx
         lBVUCm/4RmvzVg6lgH6ojIcsGIYaIjjnhO0P5StIKOmdj75YFxuyldR46Js7ObLZHwzu
         5xRtco9q0/QbvN3HGSDZCmdUpLV+1OBjMA4Gm4WWY8SPGOdZJlYayZl/wBlym7LG+jsN
         aR+k4QmRdt91L7Rio7pMrnVD5OQ1qNud4Wz2gZGYUHYbGi2uI1I47haP+Tdv4aXdb+as
         IT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=woTHhb8xkpKzsK+QY1tBSbR2OcLqhhhmCbFbUpVNpUM=;
        b=izLyN6oZyqj8BVjvSg5r8POzjIqsg6z532OalWnN+Gnck1dmU5pUA0ZYC1I3YRPhd0
         ejE+RZMqhI7TgV5J92UyM7bCQtplQKFESBWD0fk3+4PiVuCMO/8hGV7h4ewfukY3apEh
         AafMAeZ8kBGymp5GWLT0wrxap70O8hFRc3PU9rZVnpLEVeT38sCecmjdB24VQcCpG2lV
         PZhzW9lxXJB3JCAEzNRMoCXsDBhSZaCwjIUc/eS5SA5E46HW+7PAs5MgTK+M2gJ6/tYw
         vY3m5EGTiH+l1GVLwBoOpdV+O7MXV/TZSN+3TNc7CJSZ5TGLev+isES1XiUTvfKFOKru
         aOIw==
X-Gm-Message-State: AOAM531OZE1K+Rtqy5H7soicWbMr9dMBhl22Cqy9DF4Litdm0tcIIMAM
	T6OkqbtLzv00a/Se4ns8ysmkU69O6wTBeg==
X-Google-Smtp-Source: 
 ABdhPJwhGUMfLr8e7QL+6qnQVZj3yOR4H/V6BcKkQvPwEF4Gq0JuBQS86jpeyaE8wvHOE1dHagFyaw==
X-Received: by 2002:a17:902:b586:b0:159:684:c522 with SMTP id
 a6-20020a170902b58600b001590684c522mr9587785pls.39.1650409828329;
        Tue, 19 Apr 2022 16:10:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 k13-20020a056a00134d00b0050a5867dd73sm13649602pfu.157.2022.04.19.16.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 16:10:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] grpc: Fix build with rv32/rv64
Date: Tue, 19 Apr 2022 16:10:24 -0700
Message-Id: <20220419231024.283373-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220419231024.283373-1-raj.khem@gmail.com>
References: <20220419231024.283373-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96706

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-Link-with-libatomic-on-rv32-rv64.patch | 32 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
new file mode 100644
index 0000000000..c2afd4a92e
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
@@ -0,0 +1,32 @@
+From 592a4aaba20818bcff9a1448c34b09aff9e0d2e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Apr 2022 16:07:19 -0700
+Subject: [PATCH] cmake: Link with libatomic on rv32/rv64
+
+Fixes
+riscv64-yoe-linux-musl/12.0.1/ld: libgrpc.so.23.0.0: undefined reference to `__atomic_exchange_1'
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a8fd3bf37b3..9f5b242683d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -303,6 +303,9 @@ if(UNIX)
+   if(_gRPC_PLATFORM_LINUX OR _gRPC_PLATFORM_POSIX)
+     set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} rt)
+   endif()
++  if(CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv32")
++    set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} atomic)
++  endif()
+ endif()
+ 
+ # configure ccache if requested
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
index 48d0f58e20..c2f952fc64 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
@@ -25,6 +25,7 @@ BRANCH = "v1.45.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
+           file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.36.0


