Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD67C3ABDB
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.14876.1726553078896872214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5caFaxL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-205722ba00cso43508355ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553078; x=1727157878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBZRX9lNFNCqmA291lcwUinSEtE+5VptrzUKN26H/n0=;
        b=g5caFaxL7Cty/2K/vPeu1x/fTSGm6wp3tSMeBvTOPG+FlHyJfMjH2xp0BntW9t/i7S
         nN5fVdFPa6mrY+ea/q3JD+78R5sGdOQeYoOC9BzGaGFQibHrmd5MuOwRNGomY+985CK8
         3TkdOUPnXbZLTLQPlnouPyQk+LmWxIZs31k3j/2DsuHb/SGM5cFBdHOZPMhBile5vN5L
         FrqjU3N/DyWVN+La0Inr2ocDd7JYElCzm5cXaYfonOkS3FXT9Bw+8WSGAB2fpatl0waE
         L7PkeJfugD43yQfrv7iWwqa/XOA/6wgjX+CtT3kLlSpyxwMBVAfCE5dS5pgsLr732G6A
         wEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553078; x=1727157878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBZRX9lNFNCqmA291lcwUinSEtE+5VptrzUKN26H/n0=;
        b=a3zmUijqLEJGL50tpW9ykDAcK6x47fF66FmnWts1KE89c8ins7pQsHZF/m5U7VkSWC
         Gb6cCC4I1bE0ucOaGFsIFLwmz8OW6cM4ASUe2u7BWlzSXXPpgZVZJ+8O3EOD5rUSYyQm
         KZwaZSXDX5cKC2roksLBk00UoHMwc5XbxLqdOYbiNM17mK4vdiTa28qhQ7ci3KTv9PR/
         79avDTw7YTjeqsEf63TqJwOdwFyDXDTAnQSZB+jsfcnzsYfRbP4sudlq6943QwySDvQM
         FmBTQLX4hH/Dswgej+H409MXMmzPes/Kk/m8uwXZh/GdJktYqHF/GLDbxO75drV+f64B
         1tUQ==
X-Gm-Message-State: AOJu0YwBxPzBGDQYvsxChpHp019nD0y9utA8TgHhi0NDXz/y/TxvtgLh
	dVxP/McZYEkPsCn0qwIz4xoSHPtQkWB+5bR8u2ThSwCvSOrjyl776sUKggQt
X-Google-Smtp-Source: AGHT+IGJH39/hM7ffKYfoB0aJvlMq4txxfQmwbPseWlGykqt+eKZmrJEIOKgm7Aj39Nwh3YdVW5kwg==
X-Received: by 2002:a17:902:ce8f:b0:205:5f35:80b6 with SMTP id d9443c01a7336-2076e4f6247mr259086885ad.61.1726553078083;
        Mon, 16 Sep 2024 23:04:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 12/12] netdata: Add checks for 64-bit atomic builtins
Date: Mon, 16 Sep 2024 23:04:24 -0700
Message-ID: <20240917060424.1692067-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112338

This helps in passing correct flags to h2o module compilation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-check-for-64bit-builtin-atomics.patch | 51 +++++++++++++++++++
 .../netdata/netdata_1.47.1.bb                 |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-cmake-Add-check-for-64bit-builtin-atomics.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-cmake-Add-check-for-64bit-builtin-atomics.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-cmake-Add-check-for-64bit-builtin-atomics.patch
new file mode 100644
index 0000000000..d8ad69ceca
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-cmake-Add-check-for-64bit-builtin-atomics.patch
@@ -0,0 +1,51 @@
+From 1e8fbb6da4e5ee44fe24c078aae1930d759f0ba3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Sep 2024 05:29:13 +0000
+Subject: [PATCH] cmake: Add check for 64bit builtin atomics
+
+Compilers for some architectures e.g. RISCV32 do not have 64bit atomics
+therefore, its important to deduce that and use it to pass right flags to
+compiler to use them, e.g. h2o module
+
+Fixes
+nection.c.o): in function `h2o_create_connection':
+| /usr/src/debug/netdata/1.47.1/src/web/server/h2o/libh2o/include/h2o.h:1917:(.text.create_conn+0x5e): undefined reference to `__sync_add_and_fetch_8'
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Submitted [https://github.com/netdata/netdata/pull/18565]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+Index: netdata-v1.47.1/CMakeLists.txt
+===================================================================
+--- netdata-v1.47.1.orig/CMakeLists.txt
++++ netdata-v1.47.1/CMakeLists.txt
+@@ -448,6 +448,15 @@ int main() {
+ }
+ " HAVE_BUILTIN_ATOMICS)
+ 
++check_cxx_source_compiles("
++#include <stdint.h>
++int main(void) {
++        uint64_t a;
++        __sync_add_and_fetch(&a, 1);
++        return 0;
++}
++" ARCH_SUPPORTS_64BIT_ATOMICS)
++
+ check_c_source_compiles("
+ void my_printf(char const *s, ...) __attribute__((format(gnu_printf, 1, 2)));
+ int main() { return 0; }
+@@ -523,6 +532,10 @@ if(OS_FREEBSD OR OS_MACOS)
+         set(HAVE_BUILTIN_ATOMICS True)
+ endif()
+ 
++if (ENABLE_H2O AND NOT ARCH_SUPPORTS_64BIT_ATOMICS)
++       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DH2O_NO_64BIT_ATOMICS")
++endif (NOT ARCH_SUPPORTS_64BIT_ATOMICS)
++
+ # openssl/crypto
+ set(ENABLE_OPENSSL True)
+ pkg_check_modules(TLS IMPORTED_TARGET openssl)
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
index e134c06b06..5b38d401cd 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
@@ -9,6 +9,7 @@ DEPENDS += "json-c libuv libyaml util-linux zlib lz4"
 
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+    file://0001-cmake-Add-check-for-64bit-builtin-atomics.patch \
     file://netdata.conf \
     file://netdata.service \
     file://netdata-volatiles.conf \

