Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id D040D61BD1
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:42 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id m15so1305498pje.3
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LC7RxfHvK++rBbGJjNhBlLS0Nyw209m1yTayr/5OXAA=;
	b=LprLOfdo+lAoCWvmRE364X7FvXizYw8HD9mv6dOEQ05+ZrWtuhtDZIB/AsaBOxqZu7
	mJuq44xBCRMh+eark87UjBeKv5LClrkjDo8BS3Xz7hZlCDIGiO8nJswuLRU3w1NE/MxP
	SMDt2z3eioRK6vBfkY5tqt7IRHcr4GhIVrzuv63Hs5eb8aznVUzjJGxRn7ZCxM58FF7y
	eTbL/B7rXpm1G0i8vwoTwQ6xDFiaRB/nSiXOvW4NW0twjn+a1tPMRUGHXn5ONgc+ZMYY
	0BdG4P2hSdlWokatI5Ym1JKE2U9Is2pELCsySZm5eGMRlhNfKm7zjFj7yZL1rMp0KLuH
	imxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LC7RxfHvK++rBbGJjNhBlLS0Nyw209m1yTayr/5OXAA=;
	b=Z9miCOE6SUPajepb/jgA4xspCeyFuwfvrXPFL4wj0kTrPFNEPGmFekuWeL18ufV9Bl
	ljwzZ0rZKKjsy+gTSsUS3INkgkDQpQVOq7briVws06ckl3M9RILDn9jxflqx+G/SpDBg
	9SfM+wMHyZ1oyC2YwtYADkB0v3PNPBgLNYArVQrmjw4JMISWjvawNvf17t1u0uRHJvQY
	YFyabC4uuXz1Waqv/izSiNM4q4tQGeFDRWVHFjrOnKeM3WLJtmt46zbEVHK7X12+Zu3g
	GFh686Sf+S7coEEWd126Q0pqGqD+5/fKdrf3vPONlN6PlmXt+JPzDuxH8+X603+dCKpS
	hm+w==
X-Gm-Message-State: ANhLgQ0r+Us+ZhBNDw6PKx1ABuUy0FSteFVXqDQI/2jrThA0ugz5hVpR
	2ru+0PahMDPUWq9V0aV0QpnZg8ri
X-Google-Smtp-Source: ADFU+vurH4C+V5FkplUiEu3AsddnVTG17Pu2WpLYimfzJayI71CxXCpDM/WEargpFzlhoStCaIGUng==
X-Received: by 2002:a17:90a:de16:: with SMTP id
	m22mr1824096pjv.19.1583981863820; 
	Wed, 11 Mar 2020 19:57:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.43
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:25 -0700
Message-Id: <00cf0f4ddcd89ea8cc8f5f0f800954c349ade834.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 06/13] ade: Fix install paths in multilib builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 02:57:42 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: ade-0.1.1f-r0 do_package: QA Issue: ade: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libade.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sanjeev Nahulanthran <sanjeev.nahulanthran@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tallDirs-for-detecting-install-paths.patch | 39 +++++++++++++++++++
 meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch

diff --git a/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch b/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
new file mode 100644
index 0000000000..f038b0aa91
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
@@ -0,0 +1,39 @@
+From 67ccf77d97b76e8260c9d793ab172577e2393dbc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 21:33:46 -0800
+Subject: [PATCH] use GNUInstallDirs for detecting install paths
+
+This helps with multilib builds
+
+Upstream-Status: Submitted [https://github.com/opencv/ade/pull/19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sources/ade/CMakeLists.txt | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/sources/ade/CMakeLists.txt b/sources/ade/CMakeLists.txt
+index 2d1dd20..46415d1 100644
+--- a/sources/ade/CMakeLists.txt
++++ b/sources/ade/CMakeLists.txt
+@@ -47,12 +47,14 @@ if(BUILD_ADE_DOCUMENTATION)
+                       VERBATIM)
+ endif()
+ 
++include(GNUInstallDirs)
++
+ install(TARGETS ade COMPONENT dev
+         EXPORT adeTargets
+-        ARCHIVE DESTINATION lib
+-        LIBRARY DESTINATION lib
+-        RUNTIME DESTINATION lib
+-        INCLUDES DESTINATION include)
++	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
++	INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ 
+ install(EXPORT adeTargets DESTINATION share/ade COMPONENT dev)
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
index 332820d149..3861802158 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.1f.bb
@@ -5,6 +5,7 @@ organizing data flow processing and execution."
 HOMEPAGE = "https://github.com/opencv/ade"
 
 SRC_URI = "git://github.com/opencv/ade.git \
+           file://0001-use-GNUInstallDirs-for-detecting-install-paths.patch \
            "
 
 SRCREV = "58b2595a1a95cc807be8bf6222f266a9a1f393a9"
-- 
2.17.1


