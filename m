Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06529C369AE
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.47543.1743412320538902754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q2lukcMA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412320; x=1774948320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7EHkQvciCK2QfJbBpeS7pBgVLxRbuHH7Oqj4vNKjwqc=;
  b=q2lukcMAT3N/VDY0buvXFuwBA1AW+Y4cnaDJeC4XRyvQSDHaSP776AKm
   DuVo1k5SiqUMgD1+oBVGzEdRFLh2Dl1JnpeEk8g4aF6c5dPs+JNr5C3WQ
   3s6BcR16aL+vzt1IQpQWVYbkDTspJch4jLL/lJLkB0Wxk9rBU7Yvp1b9c
   SDMupf72xVRh0LqK8RJ+jNl81GS3QvBwpzlQz4u4ewn7B+AtyWGDx7O7I
   pNwwVVS1XXV0tx34iyB8RimzQOsJyYvSPYH0VxTAAx3ArTuqN7COuR1G9
   UcE2Z7cgHW+yoHNWIpMJaW9GGL7ngaZ6LvCqe6N9CJUOyF54mv2F51UN3
   w==;
X-CSE-ConnectionGUID: CFZp07PmTqmlj1d5DgXSEA==
X-CSE-MsgGUID: IYdmlOROQginbSFwM7yPrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="183356913"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="183356913"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1F95D4C2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4CF8D4C3A
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F1E61A0078;
	Mon, 31 Mar 2025 17:11:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] libdnf: upgrade 0.73.4 -> 0.74.0
Date: Mon, 31 Mar 2025 17:11:22 +0800
Message-Id: <1743412308-21887-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116397

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-iterator-of-a-ConfigParser-section.patch | 84 -------------------
 .../libdnf/enable_test_data_dir_set.patch     | 13 +--
 .../{libdnf_0.73.4.bb => libdnf_0.74.0.bb}    |  3 +-
 3 files changed, 9 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.4.bb => libdnf_0.74.0.bb} (93%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
deleted file mode 100644
index 1c62d02455..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From f3302a865b230e021e9defbcea978ed1290a9b2f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Fri, 6 Dec 2024 18:01:16 +0100
-Subject: [PATCH] Fix a segfault in iterator of a ConfigParser section
-
-An iterator should return self on __iter__.
-
-So that this works:
-
-    >>> it1 = iter(sectObj)
-    >>> it2 = iter(it1)
-    >>> it1 is it2
-    True
-
-Previously, this iterator did not return self on __iter__, it was like this:
-
-    class PreserveOrderMapStringStringIterator(object):
-        ...
-        def __iter__(self):
-            return _common_types.PreserveOrderMapStringStringIterator___iter__(self)
-
-And that returned a new Python object.
-
-This fixes https://bugzilla.redhat.com/2330562 by avoiding a second iterator object.
-
-My SWIG skills are close to zero,
-perhaps this is not the best way to return self, but it seems to work.
-
-Upstream-Status: Backport
-(https://github.com/rpm-software-management/libdnf/commit/f3302a865b)
-
-Backport so that it works properly with Python 3.13.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
----
- bindings/swig/common_types.i | 11 +++++++----
- bindings/swig/conf.i         |  4 ----
- 2 files changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/bindings/swig/common_types.i b/bindings/swig/common_types.i
-index c9ae798a..a1f90d9e 100644
---- a/bindings/swig/common_types.i
-+++ b/bindings/swig/common_types.i
-@@ -63,10 +63,6 @@ template<class T>
- class Iterator {
- public:
-     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
--    Iterator* __iter__()
--    {
--      return this;
--    }
- 
-     typename T::iterator cur;
-     typename T::iterator end;
-@@ -165,3 +161,10 @@ EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, std::string)
- EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, libdnf::PreserveOrderMap<std::string, std::string>)
- 
- %exception;  // beware this resets all exception handlers if you import this file after defining any
-+
-+%pythoncode %{
-+def PreserveOrderMapStringStringIterator___iter__(self):
-+    return self
-+PreserveOrderMapStringStringIterator.__iter__ = PreserveOrderMapStringStringIterator___iter__
-+del PreserveOrderMapStringStringIterator___iter__
-+%}
-diff --git a/bindings/swig/conf.i b/bindings/swig/conf.i
-index b6a0ce88..2f77003f 100644
---- a/bindings/swig/conf.i
-+++ b/bindings/swig/conf.i
-@@ -71,10 +71,6 @@ template<class T>
- class Iterator {
- public:
-     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
--    Iterator* __iter__()
--    {
--        return this;
--    }
- 
-     typename T::iterator cur;
-     typename T::iterator end;
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 5620b51d4c..6fc05d9ff8 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 05fff53c13fc5969e17f1e887b0b59bf0a088a6e Mon Sep 17 00:00:00 2001
+From 870f50ba4761317f2db018ac130a42087230dded Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
@@ -14,14 +14,14 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 60c66e94..1459dfbf 100644
+index b1daacb..f461e54 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=\\"libdnf\\")
- add_definitions(-DG_LOG_DOMAIN=\\"libdnf\\")
+@@ -131,7 +131,12 @@ add_definitions(-DGETTEXT_DOMAIN="libdnf")
+ add_definitions(-DG_LOG_DOMAIN="libdnf")
  
  # tests
--add_definitions(-DTESTDATADIR=\\"${CMAKE_SOURCE_DIR}/data/tests\\")
+-add_definitions(-DTESTDATADIR="${CMAKE_SOURCE_DIR}/data/tests")
 +if(NOT WITH_TESTS)
 +  set(TEST_DATA_DIR "/notests")
 +elseif(NOT DEFINED TEST_DATA_DIR)
@@ -31,3 +31,6 @@ index 60c66e94..1459dfbf 100644
  
  # librhsm
  if(ENABLE_RHSM_SUPPORT)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
similarity index 93%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
index 5b9e734e82..5a2d4d9364 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -11,10 +11,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
-           file://0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch \
            "
 
-SRCREV = "79ed383cd5a822e6d8d9d549835383f5c5106204"
+SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


