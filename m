Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA341C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 00:21:57 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.2841.1635812516798681488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 17:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m7WtVO9P;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id j9so10457108pgh.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88Bh1AQXtgDJwpoIJ3CwuWppE1/b1cS2HAie1ZkWerE=;
        b=m7WtVO9Pi1xsgGrgliuJRFhzZpebRpSpjlSP9MRtjX08N8FjyOiGNiei9LSsN+l/tV
         jj0hT9nne3m4TnvlQCKFPin25trN0XbdrE2DPnSNzF3kSIunb2hlyrXwT1DlBiag9T39
         4j0+ONZIqXxvPgNAb5iq5Nra4vtMMHtgb+kTavta2m9RC0z1+yMicxTHfy0vx7c3PRsv
         j0+FeOLIaWlge+PZAQIpmipcl9rqwgvEkzrwNkdmMBseF76uGAuKTw6E6LoBy83hL9Ka
         4GzEEq+c5brbQBKgfCxAiqgPUKa3Co4CRbe54VaNYPd12OUh6xjTjaT4K1X9osdZXiKO
         MBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88Bh1AQXtgDJwpoIJ3CwuWppE1/b1cS2HAie1ZkWerE=;
        b=hUwnIT5QP5aRcJAB/2JgN20E2OvscMGI1cmInBk7qOHFRZeAoJ0Q9E1b4a4qN1MNhx
         An2PO4jFeLp8XV0vmdsPXwUTGiiI4fJN2oTH6JwwUiVXDIz6sHa5t0+l23b8vRT64rzr
         elq/vkfKx7WuyTVl49o2UEV+sk0FcV9jo0sYJFXe7fwnc4PN/rf67rRlWuv/4Sd5BiHU
         qGng8hl6IKd9i6fgckAJtE32XA0Zb0fNxkGkZ/+oMLRyqruKjrRDbNK9W9DThMIXtfj0
         dpKWV9qyZjpQU7w/7zbIBqe4/o4P01yAqa9qz3U+UZmoeL1/Waq1kk6GhbRrwv0zTEHE
         7UAw==
X-Gm-Message-State: AOAM532yzCxCSUP0i2Gm/cipKwx27N6fSqDMyp8Zl9slP0TWKsSJrjUK
	isNUB7IorxYyBUkpOSp0jDlS2JvSnjE=
X-Google-Smtp-Source: 
 ABdhPJwtXgRPGuJhRNXABM32cZQPXEUZLTNVqz+hfDERWJTw/52PVNCQrjBNgDvWdUQUT/UOwyoEsQ==
X-Received: by 2002:a63:86c1:: with SMTP id
 x184mr15486972pgd.114.1635812515949;
        Mon, 01 Nov 2021 17:21:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 c85sm18062081pfc.146.2021.11.01.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 17:21:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Pass C/C++ flags to js configure
Date: Mon,  1 Nov 2021 17:21:53 -0700
Message-Id: <20211102002153.915668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 00:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93760

On mips ensure -fpie is passed when using clang compiler, this fixes
configure issues e.g.

/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/mozjs-78/78.15.0-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: non-dynamic relocations refer to dynamic symbol localtime_r@@GLIBC_2.0
/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/mozjs-78/78.15.0-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld: failed to set dynamic section sizes: bad value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
index 090c2fe058..61c5861153 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
@@ -91,6 +91,9 @@ export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
 # otherwise we are asked for yasm...
 export AS = "${CC}"
 
+CPPFLAGS:append:mips:toolchain-clang = " -fpie"
+CPPFLAGS:append:mipsel:toolchain-clang = " -fpie"
+
 do_configure() {
     prepare_python_and_rust
 
@@ -102,7 +105,7 @@ do_configure() {
     # * with mozjs-78 we get without:
     # | Path specified in LOCAL_INCLUDES (..) resolves to the topsrcdir or topobjdir (<tmpdir>/oe-core-glibc/work/cortexa72-mortsgna-linux/mozjs-78/78.15.0-r0/firefox-78.15.0/js/src), which is not allowed
     mkdir -p "${B}/lcl_tmp"
-    TMPDIR="${B}/lcl_tmp"  ${S}/js/src/configure ${EXTRA_OECONF}
+    TMPDIR="${B}/lcl_tmp"  CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" ${S}/js/src/configure ${EXTRA_OECONF}
 
     # inspired by what fedora [1] does: for big endian rebuild icu dat
     # this avoids gjs qemu crash on mips at gir creation
-- 
2.33.1


