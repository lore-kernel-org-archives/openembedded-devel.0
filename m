Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.12350.1596172889535841610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 22:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97199293"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 13:21:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 261094CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:21:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 13:21:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.7.3 -> 3.9.0
Date: Sat, 1 Aug 2020 01:21:14 +0800
Message-ID: <1596216075-3418-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596216075-3418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596216075-3418-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 261094CE5059.A0F7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

-0001-Templatize-basic_json-ctor-from-json_ref.patch
-0001-typo-fix.patch
Removed since these are included in 3.9.0

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...latize-basic_json-ctor-from-json_ref.patch | 99 -------------------
 .../nlohmann-json/0001-typo-fix.patch         | 43 --------
 ...n-json_3.7.3.bb => nlohmann-json_3.9.0.bb} |  6 +-
 3 files changed, 2 insertions(+), 146 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
 delete mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.7.3.bb => nlohmann-json_3.9.0.bb} (71%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
deleted file mode 100644
index aea48b60a5..0000000000
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ec955f08b47ab7cb81f6e4a4c3e7b331ddf50f71 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Art=C3=B6m=20Bakri=20Al-Sarmini?= <3sz3tt+git@gmail.com>
-Date: Sun, 12 Apr 2020 22:32:39 +0300
-Subject: [PATCH] Templatize basic_json ctor from json_ref
-
-Upstream-Status: Backport [https://github.com/nlohmann/json/commit/ec955f08b47ab7cb81f6e4a4c3e7b331ddf50f71]
-Signed-off-by: Andrew Geissler <geissonator@gmail.com>
-
----
- include/nlohmann/detail/meta/type_traits.hpp | 13 ++++++++++++
- include/nlohmann/json.hpp                    |  8 ++++----
- single_include/nlohmann/json.hpp             | 21 ++++++++++++++++----
- 3 files changed, 34 insertions(+), 8 deletions(-)
-
-diff --git a/include/nlohmann/detail/meta/type_traits.hpp b/include/nlohmann/detail/meta/type_traits.hpp
-index 280f6953..dd0b3084 100644
---- a/include/nlohmann/detail/meta/type_traits.hpp
-+++ b/include/nlohmann/detail/meta/type_traits.hpp
-@@ -41,6 +41,19 @@ template<typename> struct is_basic_json : std::false_type {};
- NLOHMANN_BASIC_JSON_TPL_DECLARATION
- struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
-
-+//////////////////////
-+// jspn_ref helpers //
-+//////////////////////
-+
-+template <typename>
-+class json_ref;
-+
-+template<typename>
-+struct is_json_ref : std::false_type {};
-+
-+template <typename T>
-+struct is_json_ref<json_ref<T>> : std::true_type {};
-+
- //////////////////////////
- // aliases for detected //
- //////////////////////////
-diff --git a/include/nlohmann/json.hpp b/include/nlohmann/json.hpp
-index 336d69fe..0598efc8 100644
---- a/include/nlohmann/json.hpp
-+++ b/include/nlohmann/json.hpp
-@@ -1773,10 +1773,10 @@ class basic_json
-     // other constructors and destructor //
-     ///////////////////////////////////////
-
--    /// @private
--    basic_json(const detail::json_ref<basic_json>& ref)
--        : basic_json(ref.moved_or_copied())
--    {}
-+    template <typename JsonRef,
-+              detail::enable_if_t<detail::conjunction<detail::is_json_ref<JsonRef>,
-+                                  std::is_same<typename JsonRef::value_type, basic_json>>::value, int> = 0 >
-+    basic_json(const JsonRef& ref) : basic_json(ref.moved_or_copied()) {}
-
-     /*!
-     @brief copy constructor
-diff --git a/single_include/nlohmann/json.hpp b/single_include/nlohmann/json.hpp
-index 09464f3b..8927180e 100644
---- a/single_include/nlohmann/json.hpp
-+++ b/single_include/nlohmann/json.hpp
-@@ -2794,6 +2794,19 @@ template<typename> struct is_basic_json : std::false_type {};
- NLOHMANN_BASIC_JSON_TPL_DECLARATION
- struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
-
-+//////////////////////
-+// jspn_ref helpers //
-+//////////////////////
-+
-+template <typename>
-+class json_ref;
-+
-+template<typename>
-+struct is_json_ref : std::false_type {};
-+
-+template <typename T>
-+struct is_json_ref<json_ref<T>> : std::true_type {};
-+
- //////////////////////////
- // aliases for detected //
- //////////////////////////
-@@ -16632,10 +16645,10 @@ class basic_json
-     // other constructors and destructor //
-     ///////////////////////////////////////
-
--    /// @private
--    basic_json(const detail::json_ref<basic_json>& ref)
--        : basic_json(ref.moved_or_copied())
--    {}
-+    template <typename JsonRef,
-+              detail::enable_if_t<detail::conjunction<detail::is_json_ref<JsonRef>,
-+                                  std::is_same<typename JsonRef::value_type, basic_json>>::value, int> = 0 >
-+    basic_json(const JsonRef& ref) : basic_json(ref.moved_or_copied()) {}
-
-     /*!
-     @brief copy constructor
---
-2.21.0 (Apple Git-122)
-
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
deleted file mode 100644
index 6af4e97403..0000000000
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 70be9751cd60e622ce6463f41d47c02fc2d83cbc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Art=C3=B6m=20Bakri=20Al-Sarmini?= <3sz3tt+git@gmail.com>
-Date: Sun, 12 Apr 2020 23:42:26 +0300
-Subject: [PATCH] typo fix
-
-Upstream-Status: Backport [https://github.com/nlohmann/json/commit/70be9751cd60e622ce6463f41d47c02fc2d83cbc]
-
-Signed-off-by: Andrew Geissler <geissonator@gmail.com>
-
----
- include/nlohmann/detail/meta/type_traits.hpp | 2 +-
- single_include/nlohmann/json.hpp             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/nlohmann/detail/meta/type_traits.hpp b/include/nlohmann/detail/meta/type_traits.hpp
-index dd0b3084..13e92cb4 100644
---- a/include/nlohmann/detail/meta/type_traits.hpp
-+++ b/include/nlohmann/detail/meta/type_traits.hpp
-@@ -42,7 +42,7 @@ NLOHMANN_BASIC_JSON_TPL_DECLARATION
- struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
-
- //////////////////////
--// jspn_ref helpers //
-+// json_ref helpers //
- //////////////////////
-
- template <typename>
-diff --git a/single_include/nlohmann/json.hpp b/single_include/nlohmann/json.hpp
-index 8927180e..294e7509 100644
---- a/single_include/nlohmann/json.hpp
-+++ b/single_include/nlohmann/json.hpp
-@@ -2795,7 +2795,7 @@ NLOHMANN_BASIC_JSON_TPL_DECLARATION
- struct is_basic_json<NLOHMANN_BASIC_JSON_TPL> : std::true_type {};
-
- //////////////////////
--// jspn_ref helpers //
-+// json_ref helpers //
- //////////////////////
-
- template <typename>
---
-2.21.0 (Apple Git-122)
-
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb
similarity index 71%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb
index 5766194d26..0f5ef7052c 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb
@@ -2,14 +2,12 @@ SUMMARY = "JSON for modern C++"
 HOMEPAGE = "https://nlohmann.github.io/json/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=dd0607f896f392c8b7d0290a676efc24"
 
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1 \
-           file://0001-Templatize-basic_json-ctor-from-json_ref.patch \
-           file://0001-typo-fix.patch \
            "
 
-SRCREV = "e7b3b40b5a95bc74b9a7f662830a27c49ffc01b4"
+SRCREV = "d34771cafc87b358ba421faca28facc7f8080174"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



