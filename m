Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EE3C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 10:57:25 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.76317.1705316238657621371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 02:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kmhd+xED;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5596d187f0bso295922a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705316236; x=1705921036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30OtUjTy/MOXpZkZs9xLTsZuIFCZdU+cECXg52q70MY=;
        b=Kmhd+xEDicYJexlLxA5TxVYBeGil8GDTteTnjCxSzPBP9RY434cLlfrRxkymD+A3iP
         bRfdCogYR5L9fWNh6BiRgtABME712kUbmDfDVoZxiVjy7gaz6NZBYEuAcPWbCXwg0sM8
         a2G5VcIAmdivCZLQr3+Gq/qiImZ1pZ37+omcM/CqBHCBsp5/+dR6g+q2vrc7HSqZuAvt
         3/NTuRwbAAgbeakcZiWpO0l/FbTDSv1WyPa+cqcc0kZL+j2Fpys/kgIMk/RUENEAJ1kN
         wf5iyeKSnLvza7E4FYO7qWq0PaADze9ocZ2kdxPuRPJCbPcmHPjY8xaeRT0rF0M9OSE1
         NyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705316236; x=1705921036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30OtUjTy/MOXpZkZs9xLTsZuIFCZdU+cECXg52q70MY=;
        b=NWg/8hZV9aul16L05MzOo/VqGECx/2CU75giURDuEAuzATm3MYaABcmNhmC1MWglZ7
         h/rpX7QsB5Hjkdg4z3oubHyE1KvkuLbAuF8e8OrKdyF3p8PrdR97P6BMVO8YhhX9Ul+j
         lpUKh/xsfC9zN/vMgf8XvWOdoxOmI3YT9ukNPa1I7HotOpgJZXJEATDuzmjT8miZhq74
         KXtu3xfIaYXifmITPqiGltjQhjDkSsy3CM9pDk3Jx73Ti2dbEp/iT0zUI/5juQn8VINc
         rsC6l6eOsXCWgGKPEQ7hgfECbwrlgaPf+d99LUeDlUv9VFCznvbbmj8mqgW2Ptt9hVzB
         INPA==
X-Gm-Message-State: AOJu0Ywec/gl2d5OcH0ZR54+j5IV5QK9VGjJnc0ykYB+5OKHADWpmxaW
	qm+JAVojUgkUbCz/CT1QSggu+6JLUaX3DA==
X-Google-Smtp-Source: AGHT+IFj/BVJUnjahbhGfZ3j+lhuqRcF1XPC+OmpVoDiAeJhhwRtDOeaQ0Tfj5xVyFYYjUXCU7teRg==
X-Received: by 2002:a05:6402:3102:b0:559:454d:b646 with SMTP id dc2-20020a056402310200b00559454db646mr423923edb.111.1705316236199;
        Mon, 15 Jan 2024 02:57:16 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id el12-20020a056402360c00b0055894c2864fsm5332180edb.3.2024.01.15.02.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 02:57:15 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] fmt: upgrade 10.1.1 -> 10.2.1
Date: Mon, 15 Jan 2024 13:57:09 +0300
Message-Id: <20240115105709.727864-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 10:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108282

License-Update: Dropped the rst suffix from the license file

Changelog:

10.2.1 - 2024-01-03

  Fixed ABI compatibility with earlier 10.x versions

10.2.0 - 2024-01-01

  Added support for the %j specifier (the number of days) for std::chrono::duration
  Added support for the chrono suffix for days and changed the suffix for minutes from "m" to the correct "min"
  Fixed an overflow in std::chrono::time_point formatting with large dates
  Added a formatter for std::source_location
  Added a formatter for std::bitset
  Added an experimental nested_formatter that provides an easy way of applying a formatter to one or more subobjects while automatically handling width, fill and alignment.
  Added the generic representation (g) to std::filesystem::path
  Made format_as work with references
  Fixed formatting of invalid UTF-8 with precision
  Fixed an inconsistency between fmt::to_string and fmt::format
  Disallowed unsafe uses of fmt::styled
  Pass fmt::styled(...) as a parameter instead.
  Added a null check when formatting a C string with the s specifier.
  Disallowed the c specifier for bool
  Made the default formatting unlocalized in fmt::ostream_formatter for consistency with the rest of the library
  Fixed localized formatting in bases other than decimal
  Fixed a performance regression in experimental fmt::ostream::print
  Added synchronization with the underlying output stream when writing to the Windows console
  Changed to only export format_error when {fmt} is built as a shared library
  Made fmt::streamed constexpr
  Enabled consteval on older versions of MSVC
  Added an option to build without wchar_t support on Windows
  Improved build and CI configuration
  Fixed various warnings, compilation and test issues
  Improved documentation and README
  Updated CI dependencies

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-support/fmt/{fmt_10.1.1.bb => fmt_10.2.1.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/fmt/{fmt_10.1.1.bb => fmt_10.2.1.bb} (60%)

diff --git a/meta-oe/recipes-support/fmt/fmt_10.1.1.bb b/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
similarity index 60%
rename from meta-oe/recipes-support/fmt/fmt_10.1.1.bb
rename to meta-oe/recipes-support/fmt/fmt_10.2.1.bb
index d6706d3e7..c2f19c43a 100644
--- a/meta-oe/recipes-support/fmt/fmt_10.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.2.1.bb
@@ -2,15 +2,14 @@ SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "f5e54359df4c26b6230fc61d38aa294581393084"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=10.x;protocol=https"
+SRCREV = "e69e5f977d458f2650bb346dadf2ad30c5320281"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
-inherit ptest
+inherit cmake ptest
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
 
-- 
2.25.1


