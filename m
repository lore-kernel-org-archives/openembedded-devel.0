Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A0AC8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:36 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.10145.1752228086364171799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=JTecIsLP;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228091; x=1783764091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=24vkhwCXLC/ILdcPJFhunkGWUujW4L8IdThzK3E3PPo=;
  b=JTecIsLPoJJ3a/Wb920RxKnukkuTe75mKYvnoy5tQnQ46gRbdN6OaLKT
   iK9ey26M3vK9x80VVhSCl/HnI5dcr3vmrvS+FO+Rxivw6inMRDT0yyZMw
   rrGh2//3e+vaHqVvI1Ki0fyjjdX8nJ5kKy8KtI1PpLO5TlWp3sYUJ9JBC
   s=;
X-CSE-ConnectionGUID: 60qjpYQOSTODvxEjuKEWsg==
X-CSE-MsgGUID: CkgFkfNoTwiu/e/IUlzBzw==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: iN70GqMmSri8NQoNxztJJw==
X-CSE-MsgGUID: s3mipo/ETye0GnIIgY7vHw==
X-CSE-ConnectionGUID: 6lZpek6ARaGjuCqYyae//Q==
X-CSE-MsgGUID: lhYIFKyjTbCvnbpJAx8osA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 08/10] pcapplusplus: upgrade 24.09 -> 25.05
Date: Fri, 11 Jul 2025 12:00:25 +0200
Message-ID: <20250711100052.255467-9-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118442

New version includes support to build against CMake 4+.

Release notes are available at [0].

[0]: https://github.com/seladb/PcapPlusPlus/releases/tag/v25.05

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...-Remove-whitespace-in-operator-_json.patch | 52 -------------------
 ...lusplus_24.09.bb => pcapplusplus_25.05.bb} |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
 rename meta-oe/recipes-connectivity/pcapplusplus/{pcapplusplus_24.09.bb => pcapplusplus_25.05.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
deleted file mode 100644
index fb793548a2..0000000000
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 16974cb6a9f10fbd08db964ee0d9f074ef430db6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Mar 2025 11:55:12 -0800
-Subject: [PATCH] Remove whitespace in operator"" _json
-
-Clang 20+ errors about this whitespace.
-
-Fixes
-git/3rdParty/json/include/json.hpp:24428:58: error: identifier '_json' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
- 24428 |     using nlohmann::literals::json_literals::operator "" _json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
-       |                                              ~~~~~~~~~~~~^~~~~
-       |                                              operator""_json
-
-Upstream-Status: Backport [ Its fixed in json import post 2024.9 release ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- 3rdParty/json/include/json.hpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/3rdParty/json/include/json.hpp b/3rdParty/json/include/json.hpp
-index 60ba1df..6eceb7c 100644
---- a/3rdParty/json/include/json.hpp
-+++ b/3rdParty/json/include/json.hpp
-@@ -24353,7 +24353,7 @@ inline namespace json_literals
- /// @brief user-defined string literal for JSON values
- /// @sa https://json.nlohmann.me/api/basic_json/operator_literal_json/
- JSON_HEDLEY_NON_NULL(1)
--inline nlohmann::json operator "" _json(const char* s, std::size_t n)
-+inline nlohmann::json operator ""_json(const char* s, std::size_t n)
- {
-     return nlohmann::json::parse(s, s + n);
- }
-@@ -24361,7 +24361,7 @@ inline nlohmann::json operator "" _json(const char* s, std::size_t n)
- /// @brief user-defined string literal for JSON pointer
- /// @sa https://json.nlohmann.me/api/basic_json/operator_literal_json_pointer/
- JSON_HEDLEY_NON_NULL(1)
--inline nlohmann::json::json_pointer operator "" _json_pointer(const char* s, std::size_t n)
-+inline nlohmann::json::json_pointer operator ""_json_pointer(const char* s, std::size_t n)
- {
-     return nlohmann::json::json_pointer(std::string(s, n));
- }
-@@ -24425,8 +24425,8 @@ inline void swap(nlohmann::NLOHMANN_BASIC_JSON_TPL& j1, nlohmann::NLOHMANN_BASIC
- }  // namespace std
- 
- #if JSON_USE_GLOBAL_UDLS
--    using nlohmann::literals::json_literals::operator "" _json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
--    using nlohmann::literals::json_literals::operator "" _json_pointer; //NOLINT(misc-unused-using-decls,google-global-names-in-headers)
-+    using nlohmann::literals::json_literals::operator ""_json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
-+    using nlohmann::literals::json_literals::operator ""_json_pointer; //NOLINT(misc-unused-using-decls,google-global-names-in-headers)
- #endif
- 
- // #include <nlohmann/detail/macro_unscope.hpp>
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
rename to meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb
index a04102aa42..aa5fb8d417 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 DEPENDS = "libpcap"
 
-SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
-           file://0001-Remove-whitespace-in-operator-_json.patch \
-          "
-SRCREV = "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "a49a79e0b67b402ad75ffa96c1795def36df75c8"
 
 
 inherit cmake

