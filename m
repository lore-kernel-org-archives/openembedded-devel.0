Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.12810.1600220456955407058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 18:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WbqUMErp;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id q12so283327plr.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 18:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bFAHX3gj4I/JNDS24hZZT2vqdwX3l2VwnDaFWkj7wDQ=;
        b=WbqUMErpAmRgiPg60N2PW9C8aegoohMS2rGO/t1Yj056uEC+LcidKnrMsAzkAUVdkl
         pFKnRRTTnBjF4+tmXeYKHgRz70FevTkLP6Ckm3ZcMB01TPcdWs1wowoBsjlO9jUfP0om
         pcohR+csq3T5+jvbXU/rQjs6peRm2QnOhI+hzz2s7hs4xhKZHZLC5fBw7QtYXTj4J2+D
         MFVsmJhcg+OLTHJgOHWrT/Ui7FFirRZH1spCLQT9kJwEBpVFxZJ1RXfb3AnSE2TLGyBf
         kVqAQgIjhOcwmUNrHcIbQCMqhg6t7u7jCLXRfa7oJBueL5NGosh7sfsZt4Dk6ho5i7AW
         v19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bFAHX3gj4I/JNDS24hZZT2vqdwX3l2VwnDaFWkj7wDQ=;
        b=YtX6yjxn+ggva6jN3lj6ipHhmiTvq1PwFsHMTrpJCktmG0YFYeTA1LWyQjSovnRWVz
         iUWULmWuut1JbjxjyuiBZeiVlFP0lL5uem6lHzSVkRlFhZlgY/dLXRE8eBCDIsIC8cD5
         SDq8z9rP/z8ktIe7LvRyYuIpdW/RICap8EYseoLaNV+Lv+dHBA281a+zXHmH1uVR4guR
         V5/NxFKmtI3TTwPelaYWpOFkn2Nmc8mRaTLeXHqLjcmDHkuUy+2vnMe+r1XmrzsujBZd
         GpMVcSC4b3MWV0rthBVgJfze5cYakKUoa24M+DC8w+NyhWgHCX4++s486idg+g5lic+2
         EfUQ==
X-Gm-Message-State: AOAM533YbuiULaKvkb2qZ1GA5Qo7uCqc9XSuawfzFm57woa1Wv1cI1Tr
	gWTn6bWF7cylAm2uBglsGSsCx/RIE9lYTw==
X-Google-Smtp-Source: ABdhPJx5JiN85oi7+64DwpN8UgKUTe7eyFtU+LaixLq2rDxmKUoiA77ddlBEjEjKsU/ftyvgRKVGFQ==
X-Received: by 2002:a17:902:758b:b029:d1:bb0f:25fc with SMTP id j11-20020a170902758bb02900d1bb0f25fcmr17955998pll.40.1600220456119;
        Tue, 15 Sep 2020 18:40:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id q65sm12349541pga.88.2020.09.15.18.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 18:40:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mongodb: Fix i386 builds for non-glibc systems
Date: Tue, 15 Sep 2020 18:40:53 -0700
Message-Id: <20200916014053.1178161-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stacktrace depends on internal glibc defines which may not be available
for other libc implementations e.g. __ELF_NATIVE_CLASS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-stacktrace-Define-ARCH_BITS-for-x86.patch | 29 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
new file mode 100644
index 0000000000..a92883516c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
@@ -0,0 +1,29 @@
+From efd79bda1b85a5a4398a71e5ea2bc00ee4b0ea46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2020 18:20:27 -0700
+Subject: [PATCH] stacktrace: Define ARCH_BITS for x86
+
+stacktrace_somap.cpp:92:33: error: 'ELFCLASSARCH_BITS' was not declared in this scope
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/stacktrace_somap.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/stacktrace_somap.cpp b/src/mongo/util/stacktrace_somap.cpp
+index f7ba66a142..2231948ce8 100644
+--- a/src/mongo/util/stacktrace_somap.cpp
++++ b/src/mongo/util/stacktrace_somap.cpp
+@@ -83,7 +83,7 @@ void addUnameToSoMap(BSONObjBuilder* soMap) {
+ #define ARCH_BITS __ELF_NATIVE_CLASS
+ #elif defined(__x86_64__) || defined(__aarch64__)
+ #define ARCH_BITS 64
+-#elif defined(__arm__)
++#elif defined(__i386__) || defined(__arm__)
+ #define ARCH_BITS 32
+ #else
+ #error Unknown target architecture.
+-- 
+2.28.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 7aa69b11cb..a153498480 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0003-Fix-unknown-prefix-env.patch \
            file://1296.patch \
            file://0001-Fix-compilation-with-fno-common.patch \
+           file://0001-stacktrace-Define-ARCH_BITS-for-x86.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.28.0

