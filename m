Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FC6C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:24 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.1290.1705454003863180274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKRWL3ZS;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f68af028afso89108317b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454003; x=1706058803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6/YtMC+mmuNxaWK5q/hn2JpNx4efQ1KJcByKiEhux8=;
        b=GKRWL3ZS13QYxCrntFDaxk98aLqJk6yh/rCglnpMf748io7ZJPmnVpyrgB4JAU0VD/
         j2E8rcPkgAmvaa6gkuE4TLE10JWEpkv+RnfSkiFwSAxIsXWG1eb06/FVlk4ccDbbCkWB
         elF0ACRvZzPncYXRzA1DQZKshUKe1oS8VsfvH6xXEZQQOgLtn/gyxUxR6ksFXQeZnloZ
         dfVRNJNU7Xx17BMqt3/a6AZC3UiOOZ7qe7QZ/9ak/x4b/qB2MEgusTCobpcSxP+QHpvM
         33svHTTfbAoesngmbFtdG+mA+7uyoVfpR1jTIaCMa8dQya06C9/NUi9YWrbE4+NQ3eWS
         HBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454003; x=1706058803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6/YtMC+mmuNxaWK5q/hn2JpNx4efQ1KJcByKiEhux8=;
        b=KklCZWYXQbqNfMA6UWk3prLk12kW91JT2mO/Wn4PMlMQ8fU29HrhkjM764zJ5eF8XW
         x2Q6gG1hT7A8NNwBJYiEQwFJz0bWD2jVOdH0XM/M5KIWLTvS+fDIUyrnWu9LWHqZE3CS
         ZZye1nFhjIEvPdLPvg8oUv2wD0uQ/lYy2FESIJTnbh6SPTBaUUS/QBKpF0MkSeaqHuoX
         bLtVw/rRtMw1A34IaaZ4NOHiiWYgEOisIZsA1eqpPTiigBG824JQ3R3rRujjIFdil0gG
         fNqKfisC8WbGlHCl+3dTquR2NBBvFwX0qsOfpESewxFbCmZzdV18JroOLlH4ff2OQeCO
         mKKA==
X-Gm-Message-State: AOJu0Yx9ICRK7l2tdFxoecD06oesj5gcVLWZPtVY5SO4t2YoY0l0p+uY
	gd92PvpSI4YQB5sFcNHsQVg/LH6C4gTCfQ==
X-Google-Smtp-Source: AGHT+IG4/6p8z8jlc+vPM5kdQC50SIeujKEqrO4g7zEe6kIUvlxfEy/8YilhGAZbq8hXp2UuZ4+L3g==
X-Received: by 2002:a81:f201:0:b0:5f7:263b:ebf7 with SMTP id i1-20020a81f201000000b005f7263bebf7mr4157066ywm.64.1705454002717;
        Tue, 16 Jan 2024 17:13:22 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 03/11] mariadb: Upgrade to 10.11.6
Date: Tue, 16 Jan 2024 20:13:12 -0500
Message-Id: <20240117011320.1856392-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108313

From: Mingli Yu <mingli.yu@windriver.com>

Remove one patch as the logic is included in the new version [1] [2].

Upgrade mariadb to 10.11.6 [3].

[1] https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a
[2] https://github.com/MariaDB/server/commit/cd5808eb8da13c5626d4bdeb452cef6ada29cb1d
[3] https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 702cf1dc114d7c65cde4fe1d3f19a3314fccb7ff)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...e_10.11.5.bb => mariadb-native_10.11.6.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 .../mysql/mariadb/libfmt_make_fmt.patch       | 68 -------------------
 ...{mariadb_10.11.5.bb => mariadb_10.11.6.bb} |  0
 4 files changed, 1 insertion(+), 70 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.5.bb => mariadb-native_10.11.6.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.5.bb => mariadb_10.11.6.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index d64d5b0e42..7e6ef42bc3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,10 +23,9 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://libfmt_make_fmt.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
+SRC_URI[sha256sum] = "1c0163463e98d71f4780741611a40981eee2bc44d392601ca49bbf948d04dd67"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch b/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
deleted file mode 100644
index 4d5f4a611b..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Make make_arg work with libfmt 10.1+
-
-This ensures that compiler can find the correct template to use
-Fixes
-
-mariadb-10.11.5/sql/item_strfunc.cc:1429:22: error: no matching functi
-on for call to 'make_arg'
-|  1429 |       vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
-|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1588:20: note: candidate functio
-n [with Context = fmt::basic_format_context<fmt::appender, char>, T = long long] not viable: expects an lvalue for 1st argument
-|  1588 | FMT_CONSTEXPR auto make_arg(T& val) -> basic_format_arg<Context> {
-|       |                    ^        ~~~~~~
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1559:31: note: candidate templat
-e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
-|  1559 | FMT_CONSTEXPR FMT_INLINE auto make_arg(T& [ 46%] Building C object mysys/CMakeFiles/mysys.dir/my_likely.c.o
-| val) -> value<Context> {
-|       |                               ^
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1596:27: note: candidate templat
-e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
-|  1596 | FMT_CONSTEXPR inline auto make_arg(T& val) -> basic_format_arg<Context> {
-|       |                           ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/cmake/libfmt.cmake
-+++ b/cmake/libfmt.cmake
-@@ -33,8 +33,9 @@ MACRO (CHECK_LIBFMT)
-      #include <fmt/format-inl.h>
-      #include <iostream>
-      int main() {
-+       int val = 42;
-        fmt::format_args::format_arg arg=
--         fmt::detail::make_arg<fmt::format_context>(42);
-+         fmt::detail::make_arg<fmt::format_context>(val);
-          std::cout << fmt::vformat(\"The answer is {}.\",
-                                    fmt::format_args(&arg, 1));
-      }" HAVE_SYSTEM_LIBFMT)
---- a/sql/item_strfunc.cc
-+++ b/sql/item_strfunc.cc
-@@ -1426,14 +1426,22 @@ String *Item_func_sformat::val_str(Strin
-     switch (args[carg]->result_type())
-     {
-     case INT_RESULT:
--      vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
-+      int intval;
-+      intval = args[carg]->val_int();
-+      vargs[carg-1]= fmt::detail::make_arg<ctx>(intval);
-       break;
-     case DECIMAL_RESULT: // TODO
-     case REAL_RESULT:
-+      float fval;
-+      int val;
-       if (args[carg]->field_type() == MYSQL_TYPE_FLOAT)
--        vargs[carg-1]= fmt::detail::make_arg<ctx>((float)args[carg]->val_real());
--      else
--        vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_real());
-+      {
-+        fval = (float)args[carg]->val_real();
-+        vargs[carg-1]= fmt::detail::make_arg<ctx>(fval);
-+      } else {
-+        val = args[carg]->val_real();
-+        vargs[carg-1]= fmt::detail::make_arg<ctx>(val);
-+      }
-       break;
-     case STRING_RESULT:
-       if (!(parg= args[carg]->val_str(&val_arg[carg-1])))
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
-- 
2.34.1


