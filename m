Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.18189.1590941791273256048
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hMPc3F0H;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id m1so2377404pgk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lKkZURxpCfOA2DYzvoJvTy26s/qqKM8MdoFvlk6Yw8I=;
        b=hMPc3F0Hk07HnHoMAkKYbnMBDLtXlzTHTp1jdixlWT9BgY9TY/Hw8qXzyEc91iZ7GQ
         LFWd+hg4tkH7X5xb3s/KRnXnd7Ex6Ff5oLmHHGoWpG/Uyn4nyn+01WfF/OSqXtGywW0F
         7wGZU5V4wO6ZccbzBHsaAB1QwqyIKIKllSq+XqsnItVC1FnTV2SjrMY8WDOztAHFzJWy
         yr21KeTf+it7/Wk+78B23B0rQTQnhLRGLApOX/DYdvYeGrVtwwWHCM4q7QxKti5WplbS
         sKBbxoDaFtYY3RKpUWyBMQ+LfFJzVbeT3ihEGy5gaHujM+D/UYOrSOw4gKbWS6dzC0HZ
         t08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lKkZURxpCfOA2DYzvoJvTy26s/qqKM8MdoFvlk6Yw8I=;
        b=MDqIj/9r5z24IRlId2UoJ21NWAX9vyjtsQ57rG1sTrbXSlD2ytlwQzvsJbBMcIqp22
         iA75dPkfUdgAn6lUW1HuzXn2gHgOsXi4U0RvFsThYfzF2FV0vg6FDhy7debZ6luyaSRx
         n7kyYm9rq201nYQ6+mD4BcNysEkn2WEcNIQ2uGLBUKvyugHrX5hbfuv9cgKo9XlaSCui
         MJzHAFSF2z3A2LpsniGC/S1mPQ3UbRNXejGNJ2Ggoa1sIntSfBsGA4s2/5RfN1JSGmL9
         vqpOVH5jMbH+zDde/eYOwnAFxHDJkLzjTUIWP3nDzXbaNqM3kM9vUjriWdC+VNw2wtix
         Lmgw==
X-Gm-Message-State: AOAM532+J02vYw7xGkKJc2eIBAxt0D7eTNdg3NOKSIqTahl6fbnalFQJ
	JYOg7fuiua0KS06WpPC4bRM5mJvB
X-Google-Smtp-Source: ABdhPJxhL1ocmON3q/t0pY6y6CBD39nO0NaClrC/8OPcrmFHUpQKnVRD1zdS0+EtkW0q4urswK3sVA==
X-Received: by 2002:a62:1917:: with SMTP id 23mr4596556pfz.272.1590941790546;
        Sun, 31 May 2020 09:16:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/35] nlohmann-json: backport gcc10 fix
Date: Sun, 31 May 2020 09:15:50 -0700
Message-Id: <3575cb4e60b2a878cb48383bb92a3a78a91fa0a6.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Andrew Geissler <geissonator@yahoo.com>

The following issue and PR describe an issue with nlohmann-json and
GCC10.

https://github.com/nlohmann/json/issues/1920
https://github.com/nlohmann/json/pull/2034

Confirmed that this fixed the issue seen in OpenBMC when pulling in the
latest upstream meta-openembedded.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 12b707c52de60f1cb4a0b4af8c379d4a11dfba35)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
 .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
 .../nlohmann-json/nlohmann-json_3.7.3.bb      |  5 +-
 3 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
new file mode 100644
index 0000000000..aea48b60a5
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
@@ -0,0 +1,99 @@
+From ec955f08b47ab7cb81f6e4a4c3e7b331ddf50f71 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Art=C3=B6m=20Bakri=20Al-Sarmini?= <3sz3tt+git@gmail.com>
+Date: Sun, 12 Apr 2020 22:32:39 +0300
+Subject: [PATCH] Templatize basic_json ctor from json_ref
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/ec955f08b47ab7cb81f6e4a4c3e7b331ddf50f71]
+Signed-off-by: Andrew Geissler <geissonator@gmail.com>
+
+---
+ include/nlohmann/detail/meta/type_traits.hpp | 13 ++++++++++++
+ include/nlohmann/json.hpp                    |  8 ++++----
+ single_include/nlohmann/json.hpp             | 21 ++++++++++++++++----
+ 3 files changed, 34 insertions(+), 8 deletions(-)
+
+diff --git a/include/nlohmann/detail/meta/type_traits.hpp b/include/nlohmann/detail/meta/type_traits.hpp
+index 280f6953..dd0b3084 100644
+--- a/include/nlohmann/detail/meta/type_traits.hpp
++++ b/include/nlohmann/detail/meta/type_traits.hpp
+@@ -41,6 +41,19 @@ template<typename> struct is_basic_json : std::false_type {};
+ NLOHMANN_BASIC_JSON_TPL_DECLARATION
+ struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
+
++//////////////////////
++// jspn_ref helpers //
++//////////////////////
++
++template <typename>
++class json_ref;
++
++template<typename>
++struct is_json_ref : std::false_type {};
++
++template <typename T>
++struct is_json_ref<json_ref<T>> : std::true_type {};
++
+ //////////////////////////
+ // aliases for detected //
+ //////////////////////////
+diff --git a/include/nlohmann/json.hpp b/include/nlohmann/json.hpp
+index 336d69fe..0598efc8 100644
+--- a/include/nlohmann/json.hpp
++++ b/include/nlohmann/json.hpp
+@@ -1773,10 +1773,10 @@ class basic_json
+     // other constructors and destructor //
+     ///////////////////////////////////////
+
+-    /// @private
+-    basic_json(const detail::json_ref<basic_json>& ref)
+-        : basic_json(ref.moved_or_copied())
+-    {}
++    template <typename JsonRef,
++              detail::enable_if_t<detail::conjunction<detail::is_json_ref<JsonRef>,
++                                  std::is_same<typename JsonRef::value_type, basic_json>>::value, int> = 0 >
++    basic_json(const JsonRef& ref) : basic_json(ref.moved_or_copied()) {}
+
+     /*!
+     @brief copy constructor
+diff --git a/single_include/nlohmann/json.hpp b/single_include/nlohmann/json.hpp
+index 09464f3b..8927180e 100644
+--- a/single_include/nlohmann/json.hpp
++++ b/single_include/nlohmann/json.hpp
+@@ -2794,6 +2794,19 @@ template<typename> struct is_basic_json : std::false_type {};
+ NLOHMANN_BASIC_JSON_TPL_DECLARATION
+ struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
+
++//////////////////////
++// jspn_ref helpers //
++//////////////////////
++
++template <typename>
++class json_ref;
++
++template<typename>
++struct is_json_ref : std::false_type {};
++
++template <typename T>
++struct is_json_ref<json_ref<T>> : std::true_type {};
++
+ //////////////////////////
+ // aliases for detected //
+ //////////////////////////
+@@ -16632,10 +16645,10 @@ class basic_json
+     // other constructors and destructor //
+     ///////////////////////////////////////
+
+-    /// @private
+-    basic_json(const detail::json_ref<basic_json>& ref)
+-        : basic_json(ref.moved_or_copied())
+-    {}
++    template <typename JsonRef,
++              detail::enable_if_t<detail::conjunction<detail::is_json_ref<JsonRef>,
++                                  std::is_same<typename JsonRef::value_type, basic_json>>::value, int> = 0 >
++    basic_json(const JsonRef& ref) : basic_json(ref.moved_or_copied()) {}
+
+     /*!
+     @brief copy constructor
+--
+2.21.0 (Apple Git-122)
+
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
new file mode 100644
index 0000000000..6af4e97403
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
@@ -0,0 +1,43 @@
+From 70be9751cd60e622ce6463f41d47c02fc2d83cbc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Art=C3=B6m=20Bakri=20Al-Sarmini?= <3sz3tt+git@gmail.com>
+Date: Sun, 12 Apr 2020 23:42:26 +0300
+Subject: [PATCH] typo fix
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/70be9751cd60e622ce6463f41d47c02fc2d83cbc]
+
+Signed-off-by: Andrew Geissler <geissonator@gmail.com>
+
+---
+ include/nlohmann/detail/meta/type_traits.hpp | 2 +-
+ single_include/nlohmann/json.hpp             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/nlohmann/detail/meta/type_traits.hpp b/include/nlohmann/detail/meta/type_traits.hpp
+index dd0b3084..13e92cb4 100644
+--- a/include/nlohmann/detail/meta/type_traits.hpp
++++ b/include/nlohmann/detail/meta/type_traits.hpp
+@@ -42,7 +42,7 @@ NLOHMANN_BASIC_JSON_TPL_DECLARATION
+ struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
+
+ //////////////////////
+-// jspn_ref helpers //
++// json_ref helpers //
+ //////////////////////
+
+ template <typename>
+diff --git a/single_include/nlohmann/json.hpp b/single_include/nlohmann/json.hpp
+index 8927180e..294e7509 100644
+--- a/single_include/nlohmann/json.hpp
++++ b/single_include/nlohmann/json.hpp
+@@ -2795,7 +2795,7 @@ NLOHMANN_BASIC_JSON_TPL_DECLARATION
+ struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
+
+ //////////////////////
+-// jspn_ref helpers //
++// json_ref helpers //
+ //////////////////////
+
+ template <typename>
+--
+2.21.0 (Apple Git-122)
+
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
index 86fe673b47..5766194d26 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
@@ -4,7 +4,10 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080"
 
-SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1"
+SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1 \
+           file://0001-Templatize-basic_json-ctor-from-json_ref.patch \
+           file://0001-typo-fix.patch \
+           "
 
 SRCREV = "e7b3b40b5a95bc74b9a7f662830a27c49ffc01b4"
 
-- 
2.17.1

