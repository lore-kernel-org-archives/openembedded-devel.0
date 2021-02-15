Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.25706.1613351620343536205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n93CUOmt;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id q72so2782281pjq.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=d7IA8+LNvqWGuNiiKBPOLZICCmbcAIrcH7yy0udHDPU=;
        b=n93CUOmtM4+sMHq3gm39PQ3NyJsPNW4WSQslI4qxIa9gIk3fPRclNQW0+JIz60gz8q
         6quljjI5qgSjj8lgV4KhqFpXB7sOWGL7aOJ/CYj4IywoSslgnYwGLdX2y0HD9UGt+qiE
         0M/FCm7GBO/GqZTML1SfJwJiASh1FXBt28BH/lD+HDaFJuuaqHxyVHdUyM+7O79s+geX
         HToS+2Q9baLV55p7A9ZVv5utXlc0PQSTn3le9DTw0Z44czyhAh4nXKqk+coDGTqC4Wdo
         /+joZnf8ZikN0auy2A5iKMpDypW1ivtjsCJLk+wY313Nlu3/5wh9mg2kTxuxbrz3Z8md
         uJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=d7IA8+LNvqWGuNiiKBPOLZICCmbcAIrcH7yy0udHDPU=;
        b=IfmPj+BW6jHsR9pXwXIPqNebqMpbVP6lK6/9jhBJabvFvwcsftrk7yGcRT1aX+7qzp
         o7T4UOA+4YyOqZKD60Zi5FLBVrp+xXvQ2JdoksvT4oTgKYaN8jFBb7/Ojc+jAPA/ZtTx
         vXhWM+WEizwizYvFcxowa+aT1yPzS7SQZ9LNgSIoWveuDZgw89XAs5UMThI1QdSKl0G0
         XD/5gUExfsLSPHtScE6pqqHpA+nVMJ42wAjgwOtXYKHRV1PPeYkPpQsT8GjCQ7ADAFZ0
         Y5Kf904R44P2CJcPcxRYEDCDjoW4xuxyg6vyejbKtymjyGTqAh+6xWVMB7JRiiOaNp0e
         ks9A==
X-Gm-Message-State: AOAM533znXaM1/I5rHAE93mkSWN4UyGZEUKYoOVozXNBbr32vn6rExOi
	i9BXD1zZjwCRbAyhEDJszpxUx+BYBCBPTQ==
X-Google-Smtp-Source: ABdhPJxvFZyj4Gjh0gkGRZ5T1B8rkOdegCxVe67QMD5iIyXdxpIfJxoWlkFfMwWdprWme9KDrUZAAA==
X-Received: by 2002:a17:902:728a:b029:e3:530:cc73 with SMTP id d10-20020a170902728ab02900e30530cc73mr12780256pll.60.1613351619711;
        Sun, 14 Feb 2021 17:13:39 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:39 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 06/15] mariadb: Fix build on 32bit arches with 64bit time_t
Date: Sun, 14 Feb 2021 17:13:20 -0800
Message-Id: <5765b957ec5515ade2dbaa13a0a19e6954d15203.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 512712f9c4b5eb4f9a1280fe7dbe06089e547ac3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...fine-__NR_futex-if-it-does-not-exist.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7c92bbaad6..e3ce297618 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
+           file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
           "
 SRC_URI[sha256sum] = "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
new file mode 100644
index 0000000000..0a2eed44f4
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
@@ -0,0 +1,37 @@
+From d611f78198dee64bb6a05933d200b544e2510b76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Nov 2020 14:37:13 -0800
+Subject: [PATCH] innobase: Define __NR_futex if it does not exist
+
+__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex interface based
+on
+__NR_futex, since this is used in applications, such applications start
+to fail to build for these newer architectures. This patch defines a
+fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
+working
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ storage/innobase/log/log0sync.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/log0sync.cc
+index 7799e605..4fab8f74 100644
+--- a/storage/innobase/log/log0sync.cc
++++ b/storage/innobase/log/log0sync.cc
+@@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b) can be fine as alternative.
+ #ifdef __linux__
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
+ #endif
+ 
+ #include <atomic>
+-- 
+2.29.2
+
-- 
2.17.1

