Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E43C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22149.1785672315667734786
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZN2qpJai;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2660789b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672315; x=1786277115; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwXV4t0yswCK8cdcdOdeRpfC+GOyCoB6ptPDi7/Y5Zg=;
        b=ZN2qpJaibaZ5XB88iktXyUIQNgA6whplkpmKJ35a6GhlAoziTYdrA20dFGnO0PItNU
         vchQ3/v+N00EZopcydUBZeTcLqt95xDGb+nhKg/rtZ/ELGRGdobGllu8YrpQLLGACRZ+
         saOD5zjNt1Yi2gUiGPAOhaReCmLZmJqTHGvVLLCEadV4epRb19GGjxF+S/S49vdcWJtO
         B0Y2emfRjRAAd9CjWlaF6Y1iLS7l8Y2YhajleL4aivHws0YrrrO/Ro6AkYF6euOS4Pa7
         P1tW5+W12p9M5eQCSy1NbbphN15oWYFC7DiK9oqb/7tbV6xQnzMcRq4Ios4sbbaNGgJ1
         yNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672315; x=1786277115;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwXV4t0yswCK8cdcdOdeRpfC+GOyCoB6ptPDi7/Y5Zg=;
        b=B63NLxytIJhWSXlfXFMtZlxeNjOcPoQnca1KyA0gurNk5oCjiTnFFHeOSPgCgmK0Yr
         3i9Ld5YYX6CfGK3x7v9TU4M9xEPMQ2xMBaqFSOHbY5rhaWqjKV1auarjWYMVLXQCbWFj
         wUJetILvF1EfGJ8eC1dAkzeeveAhfF9Fpa2kVAxa3tR7FGRvDEL/UOg31s+GRduEbzNB
         cV6igU8fuj3H1go/R0ZwgRKnm7pUngN5zydERmnfyEShYhZaF23ydDlOlo52K1IRNou8
         VfIgL7hNNiyB1xy2lHF4/5J+zdKss79tdsVilA9IT1UDM0hz75nKDIvMxRBWK5Dyk473
         0Fag==
X-Gm-Message-State: AOJu0Yy9S3VGblYw3CJZ4hT4YvmH+p0MwJBEUDungT7r6ofbs3DWtiGl
	KJkQb3iYzIPRsbG8slqnOk3hxl88zMUDtLY5S/kyZDtYGj3jdGK0DadUP2NITg==
X-Gm-Gg: AR+sD13tcfsw61gULts1x/RzdFChpBhrUZkN05An/f1n6NoKZSM7ZJa6HvSKdCfVzI9
	NDQvdDIOTUibMmnTQGuyU8qzFjCYH0TItakCXZFY9Aq6EkMoWzmu/BgA84EUk3W5La9d8ci4+Gw
	V4nIezEa4H0K4jjrsmYs5vL7y6P1cImz1TyjRnqje9pni+zGp6CrxPKpcrq0UP6Uwh57QPRljM8
	VqH07Vh+F3gOBvxAURbV2s4qX3Gz/GpBm5YhKRLiuyapu3pp3edBLcJb29y1XEZGUnk4Bqq2arU
	F/4Fw35lRch8DJN56KyUUD9hJd5K5TgtIAd9r3HtoptryR/zFGIBUtk9Y6qdlHch6wbeUNf4lP3
	CD9iKYmFzvrtSZQwlVZZPx7/IE5r367NjibpGaCu/dNM/WJE5mAuWjLazCCIs+KQ/sSkiK4bbhN
	0OKhU85gZupTpvma0SgFV/apcvOkcq51iIQUGaP2c3VHUpt65SL9PDf9tecntBhNWDHdzrXd+YM
	Q==
X-Received: by 2002:a05:6a00:8018:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-84ee49dd2a4mr5387539b3a.74.1785672314790;
        Sun, 02 Aug 2026 05:05:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-next][PATCH 8/11] jsoncpp: upgrade 1.9.7 -> 1.9.8
Date: Mon,  3 Aug 2026 00:04:39 +1200
Message-ID: <20260802120444.2973561-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128663

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are merged in the upstream version.

Changelog:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...akage-when-compiled-with-C-17-1668-1.patch | 368 ------------------
 ...6ca38e90dc902e8178ba484af4f27fa11947.patch |  63 ---
 .../{jsoncpp_1.9.7.bb => jsoncpp_1.9.8.bb}    |   4 +-
 3 files changed, 1 insertion(+), 434 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
 delete mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4f27fa11947.patch
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.7.bb => jsoncpp_1.9.8.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
deleted file mode 100644
index 887bf14d2a..0000000000
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
+++ /dev/null
@@ -1,368 +0,0 @@
-From c67034e4b4c722579ee15fddb8e4af8f04252b08 Mon Sep 17 00:00:00 2001
-From: Jordan Bayles <bayles.jordan@gmail.com>
-Date: Thu, 9 Apr 2026 10:37:08 -0700
-Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 #1668 (#1675)
-
-When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
-`const char*` and `const String&` overloads for `operator[]`, `get`,
-`removeMember`, and `isMember`, breaking ABI compatibility for projects
-consuming the library with C++11.
-
-This change unconditionally declares and defines the legacy overloads
-so they are always exported, restoring compatibility.
-
-This commit completely eliminates the ABI breakage that occurs across
-C++ standard boundaries when using `std::string_view`.
-
-Previously, when the library was built with C++17+, CMake would leak
-`JSONCPP_HAS_STRING_VIEW=1` as a PUBLIC definition. A C++11 consumer
-would receive this definition, attempt to parse the header, and fail
-with compiler errors because `std::string_view` is not available in
-their environment.
-
-Conversely, if the library was built in C++11 (without `string_view`
-symbols), a C++17 consumer would naturally define
-`JSONCPP_HAS_STRING_VIEW` based on `__cplusplus` inside `value.h`. The
-consumer would then call the declared `string_view` methods, resulting
-in linker errors because the methods weren't compiled into the library.
-
-By moving all `std::string_view` overloads directly into `value.h` as
-`inline` methods that delegate to the fundamental
-`const char*, const char*` methods:
-1. The consumer's compiler dictates whether the overloads are visible
-   (via `__cplusplus >= 201703L`).
-2. The consumer compiles the inline wrappers locally, removing any
-   reliance on the library's exported symbols for `std::string_view`.
-3. CMake no longer needs to pollute the consumer's environment with
-   PUBLIC compile definitions.
-
-Backported only the library/header changes. Upstream CI and example
-test additions are omitted.
-
-Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp/commit/c67034e4b4c722579ee15fddb8e4af8f04252b08]
-Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
----
- include/json/value.h        | 54 ++++++++++++++++++++----------
- src/lib_json/CMakeLists.txt |  9 -----
- src/lib_json/json_value.cpp | 66 -------------------------------------
- 3 files changed, 36 insertions(+), 93 deletions(-)
-
-diff --git a/include/json/value.h b/include/json/value.h
-index f32f45609365..2007e6b4251d 100644
---- a/include/json/value.h
-+++ b/include/json/value.h
-@@ -357,7 +357,8 @@ public:
-   Value(const StaticString& value);
-   Value(const String& value);
- #ifdef JSONCPP_HAS_STRING_VIEW
--  Value(std::string_view value);
-+  inline Value(std::string_view value)
-+      : Value(value.data(), value.data() + value.length()) {}
- #endif
-   Value(bool value);
-   Value(std::nullptr_t ptr) = delete;
-@@ -405,7 +406,14 @@ public:
-   /** Get string_view of string-value.
-    *  \return false if !string. (Seg-fault if str is NULL.)
-    */
--  bool getString(std::string_view* str) const;
-+  inline bool getString(std::string_view* str) const {
-+    char const* begin;
-+    char const* end;
-+    if (!getString(&begin, &end))
-+      return false;
-+    *str = std::string_view(begin, static_cast<size_t>(end - begin));
-+    return true;
-+  }
- #endif
-   Int asInt() const;
-   UInt asUInt() const;
-@@ -496,12 +504,19 @@ public:
- #ifdef JSONCPP_HAS_STRING_VIEW
-   /// Access an object value by name, create a null member if it does not exist.
-   /// \param key may contain embedded nulls.
--  Value& operator[](std::string_view key);
-+  inline Value& operator[](std::string_view key) {
-+    return resolveReference(key.data(), key.data() + key.length());
-+  }
-   /// Access an object value by name, returns null if there is no member with
-   /// that name.
-   /// \param key may contain embedded nulls.
--  const Value& operator[](std::string_view key) const;
--#else
-+  inline const Value& operator[](std::string_view key) const {
-+    Value const* found = find(key.data(), key.data() + key.length());
-+    if (!found)
-+      return nullSingleton();
-+    return *found;
-+  }
-+#endif
-   /// Access an object value by name, create a null member if it does not exist.
-   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
-   /// Exceeding that will cause an exception.
-@@ -516,7 +531,6 @@ public:
-   /// that name.
-   /// \param key may contain embedded nulls.
-   const Value& operator[](const String& key) const;
--#endif
-   /** \brief Access an object value by name, create a null member if it does not
-    * exist.
-    *
-@@ -533,8 +547,10 @@ public:
- #ifdef JSONCPP_HAS_STRING_VIEW
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
--  Value get(std::string_view key, const Value& defaultValue) const;
--#else
-+  inline Value get(std::string_view key, const Value& defaultValue) const {
-+    return get(key.data(), key.data() + key.length(), defaultValue);
-+  }
-+#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   Value get(const char* key, const Value& defaultValue) const;
-@@ -542,7 +558,6 @@ public:
-   /// \note deep copy
-   /// \param key may contain embedded nulls.
-   Value get(const String& key, const Value& defaultValue) const;
--#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   /// \note key may contain embedded nulls.
-@@ -588,13 +603,14 @@ public:
-   /// \pre type() is objectValue or nullValue
-   /// \post type() is unchanged
- #if JSONCPP_HAS_STRING_VIEW
--  void removeMember(std::string_view key);
--#else
-+  inline void removeMember(std::string_view key) {
-+    removeMember(key.data(), key.data() + key.length(), nullptr);
-+  }
-+#endif
-   void removeMember(const char* key);
-   /// Same as removeMember(const char*)
-   /// \param key may contain embedded nulls.
-   void removeMember(const String& key);
--#endif
-   /** \brief Remove the named map member.
-    *
-    *  Update 'removed' iff removed.
-@@ -602,13 +618,14 @@ public:
-    *  \return true iff removed (no exceptions)
-    */
- #if JSONCPP_HAS_STRING_VIEW
--  bool removeMember(std::string_view key, Value* removed);
--#else
-+  inline bool removeMember(std::string_view key, Value* removed) {
-+    return removeMember(key.data(), key.data() + key.length(), removed);
-+  }
-+#endif
-   bool removeMember(String const& key, Value* removed);
-   /// Same as removeMember(const char* begin, const char* end, Value* removed),
-   /// but 'key' is null-terminated.
-   bool removeMember(const char* key, Value* removed);
--#endif
-   /// Same as removeMember(String const& key, Value* removed)
-   bool removeMember(const char* begin, const char* end, Value* removed);
-   /** \brief Remove the indexed array element.
-@@ -622,15 +639,16 @@ public:
- #ifdef JSONCPP_HAS_STRING_VIEW
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
--  bool isMember(std::string_view key) const;
--#else
-+  inline bool isMember(std::string_view key) const {
-+    return isMember(key.data(), key.data() + key.length());
-+  }
-+#endif
-   /// Return true if the object has a member named key.
-   /// \note 'key' must be null-terminated.
-   bool isMember(const char* key) const;
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
-   bool isMember(const String& key) const;
--#endif
-   /// Same as isMember(String const& key)const
-   bool isMember(const char* begin, const char* end) const;
-
-diff --git a/src/lib_json/CMakeLists.txt b/src/lib_json/CMakeLists.txt
-index 03e9335525ca..a0695e9eba83 100644
---- a/src/lib_json/CMakeLists.txt
-+++ b/src/lib_json/CMakeLists.txt
-@@ -131,9 +131,6 @@ if(BUILD_SHARED_LIBS)
-
-     target_compile_features(${SHARED_LIB} PUBLIC ${REQUIRED_FEATURES})
-
--    if(JSONCPP_HAS_STRING_VIEW)
--        target_compile_definitions(${SHARED_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
--    endif()
-
-     target_include_directories(${SHARED_LIB} PUBLIC
-         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
-@@ -168,9 +165,6 @@ if(BUILD_STATIC_LIBS)
-
-     target_compile_features(${STATIC_LIB} PUBLIC ${REQUIRED_FEATURES})
-
--    if(JSONCPP_HAS_STRING_VIEW)
--        target_compile_definitions(${STATIC_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
--    endif()
-
-     target_include_directories(${STATIC_LIB} PUBLIC
-         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
-@@ -198,9 +192,6 @@ if(BUILD_OBJECT_LIBS)
-
-     target_compile_features(${OBJECT_LIB} PUBLIC ${REQUIRED_FEATURES})
-
--    if(JSONCPP_HAS_STRING_VIEW)
--        target_compile_definitions(${OBJECT_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
--    endif()
-
-     target_include_directories(${OBJECT_LIB} PUBLIC
-         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
-diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
-index 74f77896fa7b..a8eb72d6b75f 100644
---- a/src/lib_json/json_value.cpp
-+++ b/src/lib_json/json_value.cpp
-@@ -441,14 +441,6 @@ Value::Value(const String& value) {
-       value.data(), static_cast<unsigned>(value.length()));
- }
-
--#ifdef JSONCPP_HAS_STRING_VIEW
--Value::Value(std::string_view value) {
--  initBasic(stringValue, true);
--  value_.string_ = duplicateAndPrefixStringValue(
--      value.data(), static_cast<unsigned>(value.length()));
--}
--#endif
--
- Value::Value(const StaticString& value) {
-   initBasic(stringValue);
-   value_.string_ = const_cast<char*>(value.c_str());
-@@ -656,21 +648,6 @@ bool Value::getString(char const** begin, char const** end) const {
-   return true;
- }
-
--#ifdef JSONCPP_HAS_STRING_VIEW
--bool Value::getString(std::string_view* str) const {
--  if (type() != stringValue)
--    return false;
--  if (value_.string_ == nullptr)
--    return false;
--  const char* begin;
--  unsigned length;
--  decodePrefixedString(this->isAllocated(), this->value_.string_, &length,
--                       &begin);
--  *str = std::string_view(begin, length);
--  return true;
--}
--#endif
--
- String Value::asString() const {
-   switch (type()) {
-   case nullValue:
-@@ -1190,17 +1167,6 @@ Value* Value::demand(char const* begin, char const* end) {
-                       "objectValue or nullValue");
-   return &resolveReference(begin, end);
- }
--#ifdef JSONCPP_HAS_STRING_VIEW
--const Value& Value::operator[](std::string_view key) const {
--  Value const* found = find(key.data(), key.data() + key.length());
--  if (!found)
--    return nullSingleton();
--  return *found;
--}
--Value& Value::operator[](std::string_view key) {
--  return resolveReference(key.data(), key.data() + key.length());
--}
--#else
- const Value& Value::operator[](const char* key) const {
-   Value const* found = find(key, key + strlen(key));
-   if (!found)
-@@ -1221,7 +1187,6 @@ Value& Value::operator[](const char* key) {
- Value& Value::operator[](const String& key) {
-   return resolveReference(key.data(), key.data() + key.length());
- }
--#endif
-
- Value& Value::operator[](const StaticString& key) {
-   return resolveReference(key.c_str());
-@@ -1261,18 +1226,12 @@ Value Value::get(char const* begin, char const* end,
-   Value const* found = find(begin, end);
-   return !found ? defaultValue : *found;
- }
--#ifdef JSONCPP_HAS_STRING_VIEW
--Value Value::get(std::string_view key, const Value& defaultValue) const {
--  return get(key.data(), key.data() + key.length(), defaultValue);
--}
--#else
- Value Value::get(char const* key, Value const& defaultValue) const {
-   return get(key, key + strlen(key), defaultValue);
- }
- Value Value::get(String const& key, Value const& defaultValue) const {
-   return get(key.data(), key.data() + key.length(), defaultValue);
- }
--#endif
-
- bool Value::removeMember(const char* begin, const char* end, Value* removed) {
-   if (type() != objectValue) {
-@@ -1288,31 +1247,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
-   value_.map_->erase(it);
-   return true;
- }
--#ifdef JSONCPP_HAS_STRING_VIEW
--bool Value::removeMember(std::string_view key, Value* removed) {
--  return removeMember(key.data(), key.data() + key.length(), removed);
--}
--#else
- bool Value::removeMember(const char* key, Value* removed) {
-   return removeMember(key, key + strlen(key), removed);
- }
- bool Value::removeMember(String const& key, Value* removed) {
-   return removeMember(key.data(), key.data() + key.length(), removed);
- }
--#endif
--
--#ifdef JSONCPP_HAS_STRING_VIEW
--void Value::removeMember(std::string_view key) {
--  JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
--                      "in Json::Value::removeMember(): requires objectValue");
--  if (type() == nullValue)
--    return;
-
--  CZString actualKey(key.data(), unsigned(key.length()),
--                     CZString::noDuplication);
--  value_.map_->erase(actualKey);
--}
--#else
- void Value::removeMember(const char* key) {
-   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
-                       "in Json::Value::removeMember(): requires objectValue");
-@@ -1323,7 +1264,6 @@ void Value::removeMember(const char* key) {
-   value_.map_->erase(actualKey);
- }
- void Value::removeMember(const String& key) { removeMember(key.c_str()); }
--#endif
-
- bool Value::removeIndex(ArrayIndex index, Value* removed) {
-   if (type() != arrayValue) {
-@@ -1353,18 +1293,12 @@ bool Value::isMember(char const* begin, char const* end) const {
-   Value const* value = find(begin, end);
-   return nullptr != value;
- }
--#ifdef JSONCPP_HAS_STRING_VIEW
--bool Value::isMember(std::string_view key) const {
--  return isMember(key.data(), key.data() + key.length());
--}
--#else
- bool Value::isMember(char const* key) const {
-   return isMember(key, key + strlen(key));
- }
- bool Value::isMember(String const& key) const {
-   return isMember(key.data(), key.data() + key.length());
- }
--#endif
-
- Value::Members Value::getMemberNames() const {
-   JSON_ASSERT_MESSAGE(
---
-2.43.0
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4f27fa11947.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4f27fa11947.patch
deleted file mode 100644
index d649c2ed4c..0000000000
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4f27fa11947.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 71d46ca38e90dc902e8178ba484af4f27fa11947 Mon Sep 17 00:00:00 2001
-From: Jordan Bayles <bayles.jordan@gmail.com>
-Date: Thu, 14 May 2026 15:57:53 -0700
-Subject: [PATCH] fix: GCC 16 / C++20 build failure with u8 string literals
- (#1685)
-
-* fix: GCC 16 / C++20 build failure with u8 string literals (#1684)
-
-In C++20, the `u8""` string literal prefix was changed to evaluate to `const char8_t[]` instead of `const char[]`. This caused compilation errors when these literals were implicitly converted to `std::string` or passed to functions expecting `const char*`.
-
-This commit adds `reinterpret_cast<const char*>` around the `u8` string literals in the test suite to resolve the build errors while maintaining the intended UTF-8 semantics.
-
-Additionally, this adds C++20 to the GitHub Actions CMake test matrix to ensure we don't regress on newer standards.
-
-Fixes #1684
-
-* style: run clang-format
-
-Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp/commit/71d46ca38e90dc902e8178ba484af4f27fa11947]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- .github/workflows/cmake.yml |  2 +-
- src/test_lib_json/main.cpp  | 12 +++++++-----
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/src/test_lib_json/main.cpp b/src/test_lib_json/main.cpp
-index 501aba10e..08731f66a 100644
---- a/src/test_lib_json/main.cpp
-+++ b/src/test_lib_json/main.cpp
-@@ -1993,7 +1993,8 @@ JSONTEST_FIXTURE_LOCAL(ValueTest, StaticString) {
-
- JSONTEST_FIXTURE_LOCAL(ValueTest, WideString) {
-   // https://github.com/open-source-parsers/jsoncpp/issues/756
--  const std::string uni = u8"\u5f0f\uff0c\u8fdb"; // "式，进"
-+  const std::string uni =
-+      reinterpret_cast<const char*>(u8"\u5f0f\uff0c\u8fdb"); // "式，进"
-   std::string styled;
-   {
-     Json::Value v;
-@@ -3109,9 +3110,9 @@ JSONTEST_FIXTURE_LOCAL(ReaderTest, strictModeParseNumber) {
- }
-
- JSONTEST_FIXTURE_LOCAL(ReaderTest, parseChineseWithOneError) {
--  checkParse(R"({ "pr)"
--             u8"\u4f50\u85e4" // 佐藤
--             R"(erty" :: "value" })",
-+  checkParse(reinterpret_cast<const char*>(R"({ "pr)"
-+                                           u8"\u4f50\u85e4" // 佐藤
-+                                           R"(erty" :: "value" })"),
-              {{18, 19, "Syntax error: value, object or array expected."}},
-              "* Line 1, Column 19\n  Syntax error: value, object or array "
-              "expected.\n");
-@@ -3223,7 +3224,8 @@ JSONTEST_FIXTURE_LOCAL(CharReaderTest, parseString) {
-     bool ok = reader->parse(doc, doc + std::strlen(doc), &root, &errs);
-     JSONTEST_ASSERT(ok);
-     JSONTEST_ASSERT(errs.empty());
--    JSONTEST_ASSERT_EQUAL(u8"\u8A2a", root[0].asString()); // "訪"
-+    JSONTEST_ASSERT_EQUAL(reinterpret_cast<const char*>(u8"\u8A2a"),
-+                          root[0].asString()); // "訪"
-   }
-   {
-     char const doc[] = R"([ "\uD801" ])";
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.8.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.8.bb
index bf91f8eff4..849c5c5a25 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.8.bb
@@ -13,10 +13,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 
 PE = "1"
 
-SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
+SRCREV = "8519b8381f3c741ad1421f88237b1deda0b11412"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV} \
-           file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch \
-           file://71d46ca38e90dc902e8178ba484af4f27fa11947.patch \
            file://run-ptest \
            "
 

