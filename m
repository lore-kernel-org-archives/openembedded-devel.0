Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E59C28B2F
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 23:05:55 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6120.1741475147296375556
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 15:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1TEPlF3;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239f8646f6so55746115ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 15:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741475146; x=1742079946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogzHLbUzwbIXwnKWA8miIti18sTm6o6Bp/ntuMvLKrM=;
        b=L1TEPlF3wmY0ERBVLz/YlaMV2gJ2ELWkPIcNCfHgUgdEtmjBPltheC92KTorofoPYO
         GsGlhR88DfC/OC/wKgK5rnktT52HOI8ia3yTjcl3hu6Y1b2ASnFZXXUIBOKmRHOCXIZr
         SnqCPYTeI+DoJHNUrHia2NOL9xib92wxl5IkrzfDXfotDzPQcE+YgPUhx+t0fF8+3FMb
         tPL3KN2Gfx1FUEoSGHmQG9qpbKCjrysc3Dv9YJy1GE9GSpgaS2A3D3ti9wZ/IQqAJV8z
         HB86j0b6tBbVsHDVJcwZXIz6HCB06iCfDHhllxoH4YwQ9a8QxTeUuMaDw7XNjMVHHFOq
         nc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741475146; x=1742079946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogzHLbUzwbIXwnKWA8miIti18sTm6o6Bp/ntuMvLKrM=;
        b=PyNwsx2KJ5bvKVcHwUoKpXJX/R71QmsAOG/puvfVHH/orP6WmEFcp+bXVVxRH7s1pz
         qgML/1LXdLTZoLsLTrhoN21fBrqnw6svTP37cmE+njwYV5NsW0K/JMoZ3wwz8KWEW2ts
         SwTEXTjaQltBKe53MA/i6pi7MvfA1moXcsnsXcwF34dS1CGuoVn06f6WZeuicqHjdCP8
         OmXTVy6IEWo6K5m//dh3nyJqa4WZv7VkSTiFzVlrqMXrdcHcmlN+hBwYGMhMgGl07oeb
         ksfEgnB0mH7m2UCKgnayfSVcc+UAgOgWHconoroRyVlhUVPi44owvgZrg+Sy0QjAUKQZ
         sWEw==
X-Gm-Message-State: AOJu0YxJKJmjKDEVd/cvEq9etzJu8KEDF5LusYkUoIlY/EShHz21Tsmr
	3DgRbcsf2Q8JAc+6gaXWnHtC6VDVGcsOON7HRmwKTf4kdRJ0vsTsYvu0leb4
X-Gm-Gg: ASbGncuJGCMMLW35sPr6rFlFstbxF0O7EatFawhB3HEMnIhdqmiRN9911xGABSYAukg
	wkuhQ1iOHpGXEqi/Js5GbyzqozPNY685oyyLhWbY6OYRo8hBwcrSSw+CAz4NBhzhkh97ms1ow62
	Rfgphlz74ahdFikuizN9Cpp7+pdCtwx0ytNE6mBt7NEy2b9qJTLPo+gWvLjxGiIo/wOqMfphgdJ
	o5aPvek81QDLay24GfD5CVv3/85tW3seAe6+/6xEfD/pKPigLg2TZqF+U927tEDBIRypStJlGAA
	hpdOpa47T2Cjd8GnvsWKrZwWWcl5n1Humx6x
X-Google-Smtp-Source: AGHT+IFRyJKWgxMjZbUJyeGzNP+5ukZTCNivTuuSt4gV10mdLqVpIXDry9OHmzdBmL4KIFLHSlxvkw==
X-Received: by 2002:a05:6a21:32a1:b0:1f3:3110:8298 with SMTP id adf61e73a8af0-1f544b1d2a8mr15695686637.23.1741475146334;
        Sat, 08 Mar 2025 15:05:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c456bf16sm1316881b3a.156.2025.03.08.15.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 15:05:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libtoml11: Upgrade to 4.4.0
Date: Sat,  8 Mar 2025 15:05:42 -0800
Message-ID: <20250308230543.1774147-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 23:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115811

Fix build with clang-20 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
 ...{libtoml11_4.3.0.bb => libtoml11_4.4.0.bb} |  5 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
 rename meta-oe/recipes-devtools/libtoml11/{libtoml11_4.3.0.bb => libtoml11_4.4.0.bb} (86%)

diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
new file mode 100644
index 0000000000..c8c9922d55
--- /dev/null
+++ b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
@@ -0,0 +1,46 @@
+From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Mar 2025 11:35:46 -0800
+Subject: [PATCH] Remove whitespace in operator""
+
+Clang 20+ errors about this whitespace.
+
+Fixes
+include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
+|    22 | ::toml::value operator"" _toml(const char* str, std::size_t len);
+|       |               ~~~~~~~~~~~^~~~~
+|       |               operator""_toml
+
+Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/toml11/fwd/literal_fwd.hpp   | 2 +-
+ include/toml11/impl/literal_impl.hpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/literal_fwd.hpp
+index e46612c..82f62b7 100644
+--- a/include/toml11/fwd/literal_fwd.hpp
++++ b/include/toml11/fwd/literal_fwd.hpp
+@@ -19,7 +19,7 @@ inline namespace literals
+ inline namespace toml_literals
+ {
+ 
+-::toml::value operator"" _toml(const char* str, std::size_t len);
++::toml::value operator""_toml(const char* str, std::size_t len);
+ 
+ #if defined(TOML11_HAS_CHAR8_T)
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/literal_impl.hpp
+index e8298c2..067d4ed 100644
+--- a/include/toml11/impl/literal_impl.hpp
++++ b/include/toml11/impl/literal_impl.hpp
+@@ -115,7 +115,7 @@ inline namespace toml_literals
+ {
+ 
+ TOML11_INLINE ::toml::value
+-operator"" _toml(const char* str, std::size_t len)
++operator""_toml(const char* str, std::size_t len)
+ {
+     if(len == 0)
+     {
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
similarity index 86%
rename from meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb
rename to meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 9f265ea19a..5b357e2492 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -11,13 +11,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
 
 PE = "1"
 
-SRCREV = "499be3c177bcf9b42848d5d9567153e4edfcbc8a"
-SRCREV_json = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
+SRCREV_json = "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
 SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
 
 SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
            git://github.com/nlohmann/json;destsuffix=git/tests/extlib/json;name=json;branch=develop;protocol=https \
            git://github.com/doctest/doctest;destsuffix=git/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
+           file://0001-Remove-whitespace-in-operator.patch \
            file://run-ptest \
 "
 SRCREV_FORMAT = "json_doctest"

