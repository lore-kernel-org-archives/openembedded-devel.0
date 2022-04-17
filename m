Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537ADC6371B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.28523.1650201126216827486
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23HDC3FR011895
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:12:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23HDC3eJ023172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:12:03 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Apr 2022 06:12:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Apr 2022 06:12:02 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 17 Apr 2022 06:12:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] wxwidgets: fix multilib issue when build with webkit
Date: Sun, 17 Apr 2022 21:11:58 +0800
Message-ID: <20220417131158.4883-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96677

From: Kai Kang <kai.kang@windriver.com>

When packageconfig 'webkit' is enabled, it installs library to bare
'lib' dir and causes 'installed-vs-shipped' issue:

| ERROR: wxwidgets-3.1.5-r0 do_package: QA Issue: wxwidgets:
     Files/directories were installed but not shipped in any package:
|  /usr/lib/wx/3.1.5/web-extensions/webkit2_extud-3.1.so

Respect ${wxPLATFORM_LIB_DIR} to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wxwidgets/fix-libdir-for-multilib.patch   | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
index 555ed47ad..8ce06028d 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
@@ -5,11 +5,12 @@ Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- CMakeLists.txt              | 2 +-
- build/cmake/config.cmake    | 2 +-
- build/cmake/functions.cmake | 6 +++---
- build/cmake/install.cmake   | 6 +++---
- 4 files changed, 8 insertions(+), 8 deletions(-)
+ CMakeLists.txt                         | 2 +-
+ build/cmake/config.cmake               | 2 +-
+ build/cmake/functions.cmake            | 6 +++---
+ build/cmake/install.cmake              | 6 +++---
+ build/cmake/lib/webview/CMakeLists.txt | 4 ++--
+ 5 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 4063020552..253d415210 100644
@@ -38,7 +39,7 @@ index 91d11acba2..f361d50a27 100644
          )
  endfunction()
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index c33dd3946c..51e47e05b3 100644
+index 5597e46a67..53cd6a1ace 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
 @@ -78,9 +78,9 @@ function(wx_set_common_target_properties target_name)
@@ -81,3 +82,19 @@ index 968dff859e..c850c51844 100644
          ${CMAKE_INSTALL_PREFIX}/bin/wx-config \
          )"
      )
+diff --git a/build/cmake/lib/webview/CMakeLists.txt b/build/cmake/lib/webview/CMakeLists.txt
+index cc3298ff33..36b190d2bc 100644
+--- a/build/cmake/lib/webview/CMakeLists.txt
++++ b/build/cmake/lib/webview/CMakeLists.txt
+@@ -45,9 +45,9 @@ wx_add_library(wxwebview ${WEBVIEW_FILES})
+ 
+ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
+     if(wxVERSION_IS_DEV)
+-        set(WX_WEB_EXTENSIONS_DIRECTORY "lib/wx/${wxMAJOR_VERSION}.${wxMINOR_VERSION}.${wxRELEASE_NUMBER}/web-extensions")
++        set(WX_WEB_EXTENSIONS_DIRECTORY "lib${wxPLATFORM_LIB_DIR}/wx/${wxMAJOR_VERSION}.${wxMINOR_VERSION}.${wxRELEASE_NUMBER}/web-extensions")
+     else()
+-        set(WX_WEB_EXTENSIONS_DIRECTORY "lib/wx/${wxMAJOR_VERSION}.${wxMINOR_VERSION}/web-extensions")
++        set(WX_WEB_EXTENSIONS_DIRECTORY "lib${wxPLATFORM_LIB_DIR}/wx/${wxMAJOR_VERSION}.${wxMINOR_VERSION}/web-extensions")
+     endif()
+ endif()
+ 
-- 
2.17.1


