Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAF87FC74
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:54 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id l127so6097618pfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V2F+9twDBAioV7Yqz6QjEgmepXXAhP8StRVxqA/NxOI=;
	b=ZexcRV4uU3//8aITcoqx1JQ4ZhNlQ3ezLj1ZHnQcC7mAkQcDQOEKz9nGLlPSSejyl2
	h+aqQcoG4RtkoTmtz1C6Y0vIKidFu4AXdh3NpLkp0FurcXozFd/obh7HUTSzbRL+KOfC
	eid0XQjpva1h08plGj6W1TCjZemxct6YmcqVGSuNADG5uy5NMhEz6JfwHHO1urMEGCnX
	o+zSirvI3cPpII3d8pdkD6kHI0/A33SPAfED2hCdyn4wPPUMr7YG6tdUdcX7O4C2gxB3
	XDb4s77xUiAUp63Wv9EqctlKhjGbu0g+vvp+OFIn1qonsHxNRuo1rymTC8ZqixGNnLav
	+nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V2F+9twDBAioV7Yqz6QjEgmepXXAhP8StRVxqA/NxOI=;
	b=CWy1e/ok2au8jZai+JwpNklvjI6RSq/Ft882w9Ixn1bVAaugCvIrfKaJ03OWUt1jhL
	KGnqOsVxOCA9TXCIeC7neS7lCBuTTnbySlFMdjW8Nys3/ggBR2nqjCKQXGxRI4KGulZy
	lPkM1EFRLhoTaThBmQVR1/BFG3R581FAPpNRJR1YxMpGi8Jtbn8GpNrLrykHZ+M/QEau
	RqskUOxAAv5YorKHrTs6DOFrIB3xYoGfFj5Ow7SRA6U79K5wrOpnn0m99lsLMuXQEYWm
	YZtMtsSww+HlwEpyrDIOdID1vPizEp1/tvd4u8sdXJtSqKZDU/MUDEfDaF6rN2wETQxW
	SSlQ==
X-Gm-Message-State: APjAAAXGIMA0FobPONKkkKYj8h9FTPfQnURxgT6K229Ygu15u/qukj6e
	wRK5m3gmYgvu5oKiW2An1PeA/xjnalI=
X-Google-Smtp-Source: APXvYqxSSY2bo4Qvva5qjIlOdZh3hlDLPFRFgFQxwFvK3vX40gopAXHRdj5MRZ2xy+ufUhFq0EGUaw==
X-Received: by 2002:a65:5788:: with SMTP id b8mr17670682pgr.324.1576886815559; 
	Fri, 20 Dec 2019 16:06:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:24 -0800
Message-Id: <20191221000635.1573390-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 12/23] ade: Fix install paths in multilib builds
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:55 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: ade-0.1.1f-r0 do_package: QA Issue: ade: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libade.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.24.1


