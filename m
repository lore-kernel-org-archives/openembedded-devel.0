Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.2598.1627781112259953063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 18:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQATCHqa;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id l19so20678857pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ulEw6dS1MD+RlddCVKy7+JBOR2dzGVx1p7Sn/Dd5lIQ=;
        b=WQATCHqaCNZ9Z1v9tZIDjYTrsbxEdNxcB/ZGc97HMikugl0ikyG/X5qoTfP2RhK3xx
         KtYkkqxwhvMhFgW79Ikl5b5KetXgrUrmNLu90CFCEnl6wzczBg1i0LGaP2Dc8WATHiDF
         r2xoE7CWFi2h9lBSonccF+eMD5DTY43/2AJroYoHdpG7ncWZr+eE79cjhRHqpPY2gSgP
         AubLRsUyCTJ9i6zcRkbLQlJOVr5Pi6saICH0MK0s99b0nrFlNjlcAqT02Vblw4hUtSk/
         lKqYpJZU6XQvPVXki018q0VC4fiDssDsnyLpBQfhTyvE8+cEglNYkpt7bIc3h97CXeZ1
         qqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ulEw6dS1MD+RlddCVKy7+JBOR2dzGVx1p7Sn/Dd5lIQ=;
        b=TXZxsbNeGfn4ODo6Ouqe4/fmS2RZGb8Pt2VZQKkwmX0GL7TyRdZLn8O+MiwdErY2zD
         jTrLsEsL8wQrltPF7ST+S5DJ6AhB4r40mVyaLmmifGmBzXfRuwZHTpZhO8g09ggpNI1W
         BnuIrRFPKhr0nrFXUDebK4FkNSaT4ju3UCedpFZSFnWmoe1fiZ7QB66ry3RUwG5GSeEi
         hoP3YxIdxoU4Elm+W1qRF8CcybgJrOFcbbywj8a+HMPPZ7XVBnovscYQHklW3nhtLcUl
         /UNbiQeNfLrmDO/LE+D577ro6ZPKHDi0GQX03g2Ys+uMAxBcwoGM8gKxRpk1UXACcPfc
         biYA==
X-Gm-Message-State: AOAM531lW0PCDOpJJczXMfJvL7VjB93s1km/C0En/opEXUYPowJ4H1oA
	vcxGpWQIHHgu5LVLRseuTtPtqHf8LImmUA==
X-Google-Smtp-Source: ABdhPJzdGRw8rCodwvqVbq6QT1NvAPdkr4FC69dSNYHmEVe8LtmU8hpoT0UxOWxOUKpGaFgzjkPW6A==
X-Received: by 2002:a17:902:988b:b029:12c:4ce3:884a with SMTP id s11-20020a170902988bb029012c4ce3884amr8815937plp.54.1627781111473;
        Sat, 31 Jul 2021 18:25:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id s36sm8066917pgk.64.2021.07.31.18.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 18:25:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Upgrade to 4.4.7
Date: Sat, 31 Jul 2021 18:25:07 -0700
Message-Id: <20210801012507.2054977-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801012507.2054977-1-raj.khem@gmail.com>
References: <20210801012507.2054977-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with glibc 2.34+ while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/mongodb/PTHREAD_STACK_MIN.patch   | 19 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++++---
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch
new file mode 100644
index 0000000000..f08177d7b4
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch
@@ -0,0 +1,19 @@
+PTHREAD_STACK_MIN is no longer a compile time define in glibc 2.34+ and since
+we only care for glibc and musl where PTHREAD_STACK_MIN is always defined there
+is no need to check for constant called PTHREAD_STACK_MIN since its already defined
+this fix may not work for wider audience but for OE needs its sufficient
+
+Upstream-Status: Inappropriate [OE-only fix]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
++++ b/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
+@@ -57,9 +57,7 @@ namespace boost
+ #else
+           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
+ #endif
+-#if PTHREAD_STACK_MIN > 0
+           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
+-#endif
+           size = ((size+page_size-1)/page_size)*page_size;
+           int res = pthread_attr_setstacksize(&val_, size);
+           BOOST_VERIFY(!res && "pthread_attr_setstacksize failed");
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 9c1e485b31..9d461078ae 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \

 inherit scons dos2unix siteinfo python3native systemd useradd

-PV = "4.4.6"
-#v4.4.6
-SRCREV = "72e66213c2c3eab37d9358d5e78ad7f5c1d0d0d7"
+PV = "4.4.7"
+#v4.4.7
+SRCREV = "abb6b9c2bf675e9e2aeaecba05f0f8359d99e203"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://ppc64_ARCH_BITS.patch \
            file://0001-Do-not-use-MINSIGSTKSZ.patch \
            file://0001-Use-explicit-typecast-to-size_t.patch \
+           file://PTHREAD_STACK_MIN.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
--
2.32.0
