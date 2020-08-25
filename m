Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.6170.1598324708668215217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 20:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dWCeuh/k;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id t185so3070050pfd.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2d6rLVdbiu3k4KHPzVDHMijrQX311QFjaaa3Wo4FbU=;
        b=dWCeuh/kvMKbGf1lg6k76mNe7chIu49KYGcnIJUlZBluIKZUa6fwB4rGvxyu4z5ma7
         AAwITuSDM0T9yfnDo9qpNnODeKJ3dc+eVGgKTHYv+tqSBCw3OVkeap1d4u1YLdR4Q90N
         2HpoDyBWY7ERKk5Sqw8Pavq9sztfoV0PkPF+YwTH3w5KgEAL09u8G+2ohuo8Dh6w9+23
         pxd9Hu/QcozKrWJQEEdvB3ZQhKVQ1FlIQ68n6HZwFx5tx7jo6NHqLHkKVwnfC+hTZ8s7
         m5DPbR20InI7WESzPsaMf/t/AVJZXpfbWEi8QQc/BrVInbWWSJJLQBr4OcLLVnr+vylT
         Yx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2d6rLVdbiu3k4KHPzVDHMijrQX311QFjaaa3Wo4FbU=;
        b=kwI0fQlfU7TyS3H86BOmb4Z0Wq1vKUhtUvttYv1MjYqTM/+EG+rbnELb/ORVpkd2Ru
         pS3Eva88BfnnpEUAav9jydFCCfOQmeTfLqfc/GtZnmnpCT957SXAuy4IZkYuErKuFVGR
         V8YXEA89P96Liexg2E/1dpo+OI9oyLBrzUFv3/jHQiD0Ix7i+tyLtLL1o7JU2/BbMTEw
         /Qh3iifNF2kCZz/aZrNFhB5oMVy2iq5GWMAg1eVOzI3quPXijfvvaVcfDhOl4fbc5s96
         yxEfyw2CXsCpv4RuVjaerU3xj/oEEP92zlGmKd6ZNB/fX6GKR4G848ej2rbniWwksEqf
         ndrg==
X-Gm-Message-State: AOAM533C8/Ud9Lx0djd0HHAwsDoJM1w8t0qksqre1N9PhjTBkdkQMOmF
	ETH6cQvZrMtt9E5wRfMCW06V5n8AradecQ==
X-Google-Smtp-Source: ABdhPJzdCI1U3xwXnYyz1pvM87qSqg0Jfr8Hcx4Wc/lVwNcFa9KMH0TQooDJSe/j9fjF7obkMcSv0g==
X-Received: by 2002:a63:8448:: with SMTP id k69mr4347714pgd.69.1598324707702;
        Mon, 24 Aug 2020 20:05:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::55db])
        by smtp.gmail.com with ESMTPSA id 5sm13399984pfw.25.2020.08.24.20.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 20:05:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] v2 liburing: add v0.7
Date: Mon, 24 Aug 2020 20:05:04 -0700
Message-Id: <20200825030504.1549416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

Add initial support for liburing v0.7.
Fix build with musl by linking and depending on libucontext

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with musl C library

 .../recipes-support/liburing/liburing_0.7.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/liburing/liburing_0.7.bb

diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_0.7.bb
new file mode 100644
index 0000000000..c66021156c
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing_0.7.bb
@@ -0,0 +1,23 @@
+SUMMARY = "This is the io_uring library, liburing."
+DESCRIPTION = "liburing provides helpers to setup and teardown io_uring \
+instances, and also a simplified interface for applications that don't need \
+(or want) to deal with the full kernel side implementation."
+HOMEPAGE = "https://github.com/axboe/liburing"
+BUGTRACKER = "https://github.com/axboe/liburing/issues"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 | MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
+
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
+S = "${WORKDIR}/git"
+
+DEPENDS_append_libc-musl = " libucontext"
+XCFLAGS_append_libc-musl = " -lucontext"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
-- 
2.28.0

