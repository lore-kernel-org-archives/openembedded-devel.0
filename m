Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3339C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 23:28:58 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3664.1646868536788455797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 15:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 229NStIc007066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Mar 2022 15:28:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 9 Mar 2022 15:28:55 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 9 Mar 2022 15:28:54 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] wxwidgets: fix install errors
Date: Thu, 10 Mar 2022 07:28:51 +0800
Message-ID: <20220309232851.14147-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220309232851.14147-1-kai.kang@windriver.com>
References: <20220309232851.14147-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 23:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95915

From: Kai Kang <kai.kang@windriver.com>

There are errors during do install. So link files 'wx-config' and 'wxrc'
are not created, and rename failed either:

| CMake Error: failed to create symbolic link '/usr/bin/wx-config': Permission denied
| Error renaming from "/usr/bin/wxrc" to "/usr/bin/wxrc-3.1": No such file or directory
| CMake Error: failed to create symbolic link '/usr/bin/wxrc': Permission denied

Respect variable 'DESTDIR' to make it work as expect.

And package ${libdir}/wx/config/gtk3-unicode-3.1 to ${PN}-dev that
/usr/bin/wx-config from ${PN}-dev links to it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../respect-DESTDIR-when-create-link.patch    | 55 +++++++++++++++++++
 .../wxwidgets/wxwidgets_git.bb                |  6 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch
new file mode 100644
index 000000000..69be32928
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch
@@ -0,0 +1,55 @@
+There are errors during do install. So link files 'wx-config' and 'wxrc' are
+not created, and rename failed either:
+
+| CMake Error: failed to create symbolic link '/usr/bin/wx-config': Permission denied
+| Error renaming from "/usr/bin/wxrc" to "/usr/bin/wxrc-3.1": No such file or directory
+| CMake Error: failed to create symbolic link '/usr/bin/wxrc': Permission denied
+
+Respect variable 'DESTDIR' to make it work as expect.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ build/cmake/install.cmake        | 4 ++--
+ build/cmake/utils/CMakeLists.txt | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
+index c850c51844..5cbc67daa1 100644
+--- a/build/cmake/install.cmake
++++ b/build/cmake/install.cmake
+@@ -46,8 +46,8 @@ else()
+     install(DIRECTORY DESTINATION "bin")
+     install(CODE "execute_process( \
+         COMMAND ${CMAKE_COMMAND} -E create_symlink \
+-        ${CMAKE_INSTALL_PREFIX}/lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
+-        ${CMAKE_INSTALL_PREFIX}/bin/wx-config \
++        ../lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
++        \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config \
+         )"
+     )
+ endif()
+diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMakeLists.txt
+index 4108d6a723..fbac6bb533 100644
+--- a/build/cmake/utils/CMakeLists.txt
++++ b/build/cmake/utils/CMakeLists.txt
+@@ -34,14 +34,14 @@ if(wxUSE_XRC)
+     if(NOT MSVC)
+         install(CODE "execute_process( \
+             COMMAND ${CMAKE_COMMAND} -E rename \
+-            ${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
+-            ${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
++            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
++            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
+             )"
+         )
+         install(CODE "execute_process( \
+             COMMAND ${CMAKE_COMMAND} -E create_symlink \
+-            ${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
+-            ${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
++            wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
++            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
+             )"
+         )
+     endif()
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index 724bc0084..b4420a18e 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     git://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
     file://fix-libdir-for-multilib.patch \
+    file://respect-DESTDIR-when-create-link.patch \
 "
 PV = "3.1.4"
 SRCREV= "6cdaedd42ba59331b3dc4ead50e0bac76ae14c19"
@@ -103,4 +104,7 @@ FILES:${PN} += " \
     ${libdir}/wx/ \
 "
 
-FILES:${PN}-dev += "${libdir}/wx/include/"
+FILES:${PN}-dev += " \
+    ${libdir}/wx/include/ \
+    ${libdir}/wx/config/ \
+"
-- 
2.17.1


