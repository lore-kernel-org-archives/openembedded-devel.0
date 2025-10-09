Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190DBCCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 04:11:04 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.4503.1759983059711997381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 21:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GR9h4EDP;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42e758963e4so4861985ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 21:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759983059; x=1760587859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FseS/ouik07pctY68oHHU//xw5l4PDCxIVLa4Ak0S1I=;
        b=GR9h4EDPz/FhrhXVxFSU2bwyc0c0KEvmwcJ4zv5IGzOUjeCvRvFj1E1m2SOmmh0rpK
         0Ut7mv9Y3V+CJS+/qtg9XqHa3e1pjLdnIGqn007dAT9URvA/jV/vuPob4Pz21Iojgn3z
         Q4ffsgHbU5l9I/83/kdFlYvyjjYpvkNV6PZAyCAwgehgsd0NZwEGx0eQ+bkv+qHXWB6I
         DJGbS5fgXunNlFN4L2628hO/XrCDVHg0WWnYbZMGbxA+DcRCvwIgSeb1YhE2v5oOTbeX
         yhPV/5uLCLLaQH8HzckpBeaUDmRztKNw+b+ewUzYpu7Y/L1C08NSouYoKOUSLwojGziK
         HkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983059; x=1760587859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FseS/ouik07pctY68oHHU//xw5l4PDCxIVLa4Ak0S1I=;
        b=f0F7C4N6pxr6+6nKODQu2zMP/vSjrj2rq3tCpijCDF2ah16gPjcEgCFH4LVZShHHw8
         q+yilOxQ7fOotQl4OlpHsjGQTogp1S6EJJsiJl4nnC9hRt9raMYZ8P9nz+3UmJoGo8uD
         yexb7yqSbhSBa/PpGX4hBCjfp69Rr0NgGkNX4xusY2TukkzOVPb7fXZvwiYk0xfnjaen
         g5XPndXz2X98IBKsWoS26e4Tbg98vIbthpD9tlGF/r2DN5Wbqiv58Q3FDa+MjXDS6cT4
         JrBAgUDuVpTCgpTcmMS5bVI49yCwxUY16ZnydprHpDqM1aFi/k2B8qzEqLuJKvtJZqoZ
         fP0Q==
X-Gm-Message-State: AOJu0YxH4UKwYiL2AEiMM9DFviacp+X8PqKvdxNJvnaSj/mUf1i4cX4u
	UNl0oqCuyuINzM1xtO5hxeI2Mq4ePZn9BvIIsOXgSe7HZhnfl31K0CQcuOrYfw==
X-Gm-Gg: ASbGncspt3uAYaEY0sdKPXw7A2l86VNGmXrNAxum/pLaXXN25zvp9mhbvKgyac+qEF0
	SE3/6J9yew7IE1JEjyeVFT88h8TzeG1mBF+3lzWnlr5lMNYmgRGZ1aMVmHn3MJPRo1rVxJFMxAR
	/Ipvcr8hGu0zNVgKY1v0FQ4f8FJAmqRk+pGnz2t9DrrTgrwDNrZn2AqcHUHcKD7o5ueELPG1SGR
	KzI81fxd6OoloPWYerertT7B1wxFwqNRAh+MI1+gA/jNBaamrMaVvvAhowiF5dtP0aKerDfJB+p
	HCW4LzO/zhzovzDjARwJsZ0qX4FPnqTnkLHM2OLM5iDvtPcYZuEloFJPk1VLO8O3WpKCv6pl/gK
	vZ9bzOoAWk27XOBqARJWyqxuz+QL8Sx3xGGhyMuIcp0zq0dS9X+GgOBFcGua1IWzsLeBAf4GglP
	+Qva9pJb+Tb+Y=
X-Google-Smtp-Source: AGHT+IGBTY1Wjpr/XMkY1XFKANYP44BQyrfpute7AIGOWoKOB+I2QdbdBdD+o9bN3DNy6E1tqmeJIg==
X-Received: by 2002:a05:6e02:1a88:b0:42d:86cc:1bd2 with SMTP id e9e14a558f8ab-42f87410bd5mr54203555ab.32.1759983058603;
        Wed, 08 Oct 2025 21:10:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9036e8a3sm6373825ab.31.2025.10.08.21.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 21:10:58 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH 1/3] libiec61850: patch CVE-2024-26529
Date: Thu,  9 Oct 2025 17:10:47 +1300
Message-ID: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 04:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120395

Details https://nvd.nist.gov/vuln/detail/CVE-2024-26529

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-break-CMAKE_INSTALL_PATH-by-trying-.patch |  7 ++--
 ...AKE_INSTALL_LIBDIR-from-GNUInstallD.patch} |  4 ++-
 ...ed-null-pointer-dereference-in-mmsSe.patch | 33 +++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |  3 +-
 4 files changed, 40 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-connectivity/libiec61850/files/{0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch => 0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch} (89%)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
index 3f0490cb80..4426bafabb 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
@@ -1,4 +1,4 @@
-From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
+From 21d0a059097dfae1723255e5ff59665d39420be0 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Fri, 10 Jul 2020 17:08:34 +0200
 Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
@@ -14,7 +14,7 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 9 deletions(-)
 
 diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
-index 159ef4b..d1732a1 100644
+index 159ef4bc..d1732a16 100644
 --- a/pyiec61850/CMakeLists.txt
 +++ b/pyiec61850/CMakeLists.txt
 @@ -31,14 +31,7 @@ endif()
@@ -34,6 +34,3 @@ index 159ef4b..d1732a1 100644
 +install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
  
  add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
--- 
-2.31.1
-
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
similarity index 89%
rename from meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
rename to meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
index e778e8158b..46e1c42e1e 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
@@ -1,4 +1,4 @@
-From 16d07a82242c3263ec0038c9b4c97355795d2dd9 Mon Sep 17 00:00:00 2001
+From aa48ec52d5792c18a3b369a55ed6472a7dfa1ec1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Mar 2022 23:16:51 -0700
 Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
@@ -13,6 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  pyiec61850/CMakeLists.txt | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
+diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
+index d1732a16..c19f889b 100644
 --- a/pyiec61850/CMakeLists.txt
 +++ b/pyiec61850/CMakeLists.txt
 @@ -31,7 +31,9 @@ endif()
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
new file mode 100644
index 0000000000..b55a40b240
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
@@ -0,0 +1,33 @@
+From de14cb2e053c95d9695bb41bbdd580f35f710793 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Fri, 2 Feb 2024 06:44:47 +0000
+Subject: [PATCH] LIB61850-430: fixed null pointer dereference in
+ mmsServer_handleDeleteNamedVariableListRequest when receiving malformed
+ message
+
+CVE: CVE-2024-26529
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/cf94d64206cf53298edf4799a75b31657bb7cbb3]
+
+(cherry picked from commit cf94d64206cf53298edf4799a75b31657bb7cbb3)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mms/iso_mms/server/mms_named_variable_list_service.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/mms/iso_mms/server/mms_named_variable_list_service.c b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+index 3a27061c..3365f771 100644
+--- a/src/mms/iso_mms/server/mms_named_variable_list_service.c
++++ b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+@@ -140,6 +140,12 @@ mmsServer_handleDeleteNamedVariableListRequest(MmsServerConnection connection,
+         mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
+         goto exit_function;
+     }
++
++    if (request->listOfVariableListName == NULL)
++    {
++        mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
++        goto exit_function;
++    }
+  
+ 	long scopeOfDelete = DeleteNamedVariableListRequest__scopeOfDelete_specific;
+ 
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 0e1f50164a..3fff45670f 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -17,7 +17,8 @@ SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
-           file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
+           file://0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
+           file://0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch \
 "
 
 S = "${WORKDIR}/git"

