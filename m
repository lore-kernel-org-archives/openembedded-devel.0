Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0988C678DF
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 23:45:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1063.1692315924105467015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 16:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ClurF7Rv;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6886d6895a9so324902b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 16:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692315923; x=1692920723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7/Pu4v5PbJnKoET5MWQTwumI/yC5tTevc/k9Ims3Bw=;
        b=ClurF7RvLPjAGCXBHpUuFhocdkJJ9iecF5mYtbuNMaaPe74U1p7+l5Qfew4cGj4QBL
         VV6LjOQiVGh/D7ASz3fCoOHAJSPWMbT2zbpjiLaj6WqPrFIaSZnQW0EPcPTemEeUGufd
         L4Pv3v2VNJZ1U+WMcGmoY4AXkGz4EYvo38tf9KrIq2nYdEO7F9oRSkt7u6UTwAApgDvo
         LyAH67FblzdLbrBU4694GKb6DSshk+Gu7/xRZFvwQku2kYk0icQbZplcLI83LfCFnRe0
         qotHSP4r1ffNhM40sdoBc/QQoqpEAw5MncFkTuSUhE1OHnOQBtY6K0S2Fqxu6ESmzM6Z
         VRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692315923; x=1692920723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7/Pu4v5PbJnKoET5MWQTwumI/yC5tTevc/k9Ims3Bw=;
        b=SB6A+VjzgxLROYi2Lm99jvMK5uqwDCs5426h17JCvKgnI/WI/WQEIzz0l1XxwIsWLA
         q/xy5ImZHnnPNgNH9dcQiQMC9nqdwTTIr21ZInVg5MaH27g+drrGHrfzQTxF8hOoMqPf
         YRats4WqHgjPLKxma50ZOmOHueiPBuvv6TNyU6OgVObYKLoZBHKbt2dBj8CdATVI5B2o
         s/uBo15vneEtcpyYyukX8mHogDsofaC7tTtVm+e1aEq8wiWbsCfCkt0ffxlz+FXJJXlN
         stRrWsGrWK321Cz+MWqoFq1d3YtLilf6K7IKWAOowC2YnopCtYjmbHeTgfQBHMVyniWd
         hEhg==
X-Gm-Message-State: AOJu0YzY+EZs+Vt1XWxrn/pTLxQSJ/SnQsEiR57KjKlVx5QPoDT/NVT1
	2fs1siQFFKbKSo17T4xzxQLQjP1M3faGVw==
X-Google-Smtp-Source: AGHT+IHJ6WTdj4QxxTihYw3k5Ym1CtlJJiYf7hyVJn59bsGUVfEEY/2NZ6uNHW/qSxomX4i2o1FbNA==
X-Received: by 2002:a05:6a20:13c5:b0:131:5f8b:9c7d with SMTP id ho5-20020a056a2013c500b001315f8b9c7dmr1171672pzc.22.1692315922778;
        Thu, 17 Aug 2023 16:45:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id i23-20020aa787d7000000b0064d47cd116esm297081pfo.161.2023.08.17.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:45:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] mariadb: Fix build with libfmt 10.1+
Date: Thu, 17 Aug 2023 16:45:19 -0700
Message-ID: <20230817234519.125206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 23:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104477

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../mysql/mariadb/libfmt_make_fmt.patch       | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index ffecee1f9e..9415eae827 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://libfmt_make_fmt.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch b/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
new file mode 100644
index 0000000000..4d5f4a611b
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
@@ -0,0 +1,68 @@
+Make make_arg work with libfmt 10.1+
+
+This ensures that compiler can find the correct template to use
+Fixes
+
+mariadb-10.11.5/sql/item_strfunc.cc:1429:22: error: no matching functi
+on for call to 'make_arg'
+|  1429 |       vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
+|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
+| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1588:20: note: candidate functio
+n [with Context = fmt::basic_format_context<fmt::appender, char>, T = long long] not viable: expects an lvalue for 1st argument
+|  1588 | FMT_CONSTEXPR auto make_arg(T& val) -> basic_format_arg<Context> {
+|       |                    ^        ~~~~~~
+| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1559:31: note: candidate templat
+e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
+|  1559 | FMT_CONSTEXPR FMT_INLINE auto make_arg(T& [ 46%] Building C object mysys/CMakeFiles/mysys.dir/my_likely.c.o
+| val) -> value<Context> {
+|       |                               ^
+| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1596:27: note: candidate templat
+e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
+|  1596 | FMT_CONSTEXPR inline auto make_arg(T& val) -> basic_format_arg<Context> {
+|       |                           ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/cmake/libfmt.cmake
++++ b/cmake/libfmt.cmake
+@@ -33,8 +33,9 @@ MACRO (CHECK_LIBFMT)
+      #include <fmt/format-inl.h>
+      #include <iostream>
+      int main() {
++       int val = 42;
+        fmt::format_args::format_arg arg=
+-         fmt::detail::make_arg<fmt::format_context>(42);
++         fmt::detail::make_arg<fmt::format_context>(val);
+          std::cout << fmt::vformat(\"The answer is {}.\",
+                                    fmt::format_args(&arg, 1));
+      }" HAVE_SYSTEM_LIBFMT)
+--- a/sql/item_strfunc.cc
++++ b/sql/item_strfunc.cc
+@@ -1426,14 +1426,22 @@ String *Item_func_sformat::val_str(Strin
+     switch (args[carg]->result_type())
+     {
+     case INT_RESULT:
+-      vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
++      int intval;
++      intval = args[carg]->val_int();
++      vargs[carg-1]= fmt::detail::make_arg<ctx>(intval);
+       break;
+     case DECIMAL_RESULT: // TODO
+     case REAL_RESULT:
++      float fval;
++      int val;
+       if (args[carg]->field_type() == MYSQL_TYPE_FLOAT)
+-        vargs[carg-1]= fmt::detail::make_arg<ctx>((float)args[carg]->val_real());
+-      else
+-        vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_real());
++      {
++        fval = (float)args[carg]->val_real();
++        vargs[carg-1]= fmt::detail::make_arg<ctx>(fval);
++      } else {
++        val = args[carg]->val_real();
++        vargs[carg-1]= fmt::detail::make_arg<ctx>(val);
++      }
+       break;
+     case STRING_RESULT:
+       if (!(parg= args[carg]->val_str(&val_arg[carg-1])))
-- 
2.41.0


