Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3656C369AD
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.47778.1743412320619314618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HCh7llbl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412321; x=1774948321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Aaelos/W4rILE+rjQpOKzTH4yT/EhDDsHDjV548WFjA=;
  b=HCh7llblHocApctd7B8htUDamPeMWFqfnftbz8xJ034f59vVoaP9EJht
   v9d8uB/DU0BkyWQAtBTc+Tqx5iEarlXqo+3RccHeU9w5DSQ0558FFS8B7
   m9kEsEcgmpuKc2CNvpeYr1QzN5jKkZzLejgiQTDSAy3IbD0TnmgcOytGw
   ymnr3a/jZe0H3e9CB78/Mi7p1kjnFv3d+9fOb5wvNpOziwwz0aXsTQolT
   GsHQrR1xyppAxe0EGYignD3IEdRBjdxATE9Gai1Df2ADqp4DkHzk1ORlJ
   JJO3YzXsyt3vkZelqRclQQhn+kcL1/qgq4R+PXrIKXqzkBCX/BDl9EgKI
   A==;
X-CSE-ConnectionGUID: 9NcI8FH6RpmXUPVdgFETtg==
X-CSE-MsgGUID: 5FrNeNJDQ92RJ4XHEfEvQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195002707"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195002707"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C74ED4807
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80EE7D88BC
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BD781A009A;
	Mon, 31 Mar 2025 17:11:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Date: Mon, 31 Mar 2025 17:11:21 +0800
Message-Id: <1743412308-21887-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116399

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
0005-Do-not-prepend-installroot-to-logdir.patch
0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
refreshed for 4.23.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 7 +++++--
 .../dnf/0005-Do-not-prepend-installroot-to-logdir.patch    | 7 +++++--
 ...9-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 7 +++++--
 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} | 2 +-
 4 files changed, 16 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..24b26f4cb8 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index a76b6ac..a2ba58c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -4,8 +4,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
@@ -24,3 +24,6 @@ index 4aee99fb..9e2e9e9e 100644
  
  IF (NOT PYTHON_DESIRED)
      FIND_PACKAGE (PythonInterp REQUIRED)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..159dc32c75 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index 62b9434..14d4757 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1002,7 +1002,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
@@ -26,3 +26,6 @@ index d3844df3..ac080f79 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..09af96048c 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index a2ba58c..98aa9df 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
+@@ -20,7 +20,7 @@ ELSE ()
      MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
  ENDIF()
  
@@ -22,3 +22,6 @@ index 9e2e9e9e..2056089d 100644
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
  ADD_SUBDIRECTORY (dnf)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index e5ac3c9824..fe3deb4344 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


