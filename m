Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 288A660291
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id bd4so4778795plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eITfT+2bO5yuExdp64u5nMp5AT7m8Y6jMD3QAIXdeHU=;
	b=oN7qIgPbU9l8VzRweadXq3JwBtcrC5U6eGcgGG2rLqIGDbe3jJYwF9UaDxOJPDYPxi
	J03MyJuBC28EuySieopl8L8s1LqifQtzJfIiTwgCbcDvqn/dcWV42FVQnOBB6UOi+X/d
	l/zliGwqU4po9iwXzbjVYMEVypwTuXemxOBElGb2ZQbg5A4wQgJd+Qqj/00x+0xLMV8N
	8QTMfM5PkG4FVFF9MXXjlDzoOzFkrWFTxrE1khMTOIDnciBsARXo8T9pkAAu77xBYEH7
	qqRyuu00dDJOGrnqHaNoU6QC5G086eUdY2cCqulLeTfgGIvvv48Tohp7WUC5+SfQUOsJ
	Hh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eITfT+2bO5yuExdp64u5nMp5AT7m8Y6jMD3QAIXdeHU=;
	b=l+aRHmSJ9+CdoXD8WPS10a9XwOPWnBiyATKi8FTr2yNUX6xhEOw4mfOPemcgRBJWOr
	rdfgHqdOnKCS/XswDq4RKCFgYu5j/QaZr1NUxqtTAJn18X38w/n8S1x7UZgrEj0SWlMM
	yTRRp9HJEFa1Jz+KHXOfsfql+AZoOFaj/i0ErpXKpYDy/tJcf/XBTo6VNccYgj8kandN
	zkaE4tNNe1z2wZyinLUqMomrhtSdTSkXQWxZdFWkjFSKcs5uaOzCoHJ1WsGrVEtMQ5YG
	WpIoNGjHIt1WH/SN2DYraugj2ari/hlfaAGqnl+SeUKwE+WFvfdt5laZEGsz9dZqLBGS
	LJEA==
X-Gm-Message-State: APjAAAVfWPhHOJgk26lCsGmHHp8IOsK9XmOhBi6J2jPdSJ/gIiWACKXF
	FmwJmpHxySmD755wy88YUKC0Kf5VOVE=
X-Google-Smtp-Source: APXvYqx9SP2xc3nYb+gqb8as87AIL5sMmmJtH23rTW3z5jqFD6PfSiijtaI9PWQ+p8/UqAx8erJ3nQ==
X-Received: by 2002:a17:90a:c583:: with SMTP id
	l3mr17297040pjt.58.1576886806624; 
	Fri, 20 Dec 2019 16:06:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:13 -0800
Message-Id: <20191221000635.1573390-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 01/23] cannelloni: Update to latest and fix multilib builds
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...allDirs-instead-of-hard-coding-paths.patch | 43 +++++++++++++++++++
 .../cannelloni/cannelloni_git.bb              |  6 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch
new file mode 100644
index 0000000000..b78f0b3291
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch
@@ -0,0 +1,43 @@
+From c74f04dbab4d586287347b1d5517f36e2f0c3d8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 15:52:34 -0800
+Subject: [PATCH] Use GNUInstallDirs instead of hard-coding paths
+
+Bump minimum cmake version to be >= 3.1
+
+Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/22]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 51b354f..958e0eb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.1)
+ project(cannelloni)
+ 
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
+@@ -60,6 +60,8 @@ set_target_properties ( cannelloni-common
+   SOVERSION 0
+ )
+ 
++include(GNUInstallDirs)
++
+ if(SCTP_SUPPORT)
+     add_library(sctpthread STATIC sctpthread.cpp)
+     target_link_libraries(sctpthread addsources sctp)
+@@ -68,5 +70,5 @@ endif(SCTP_SUPPORT)
+ set_target_properties(addsources PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
+ target_link_libraries(cannelloni addsources cannelloni-common pthread)
+ 
+-install(TARGETS cannelloni DESTINATION bin)
+-install(TARGETS cannelloni-common DESTINATION lib)
++install(TARGETS cannelloni DESTINATION ${CMAKE_INSTALL_BINDIR})
++install(TARGETS cannelloni-common DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-- 
+2.24.1
+
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
index df75e6342e..cd893afb37 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
@@ -2,8 +2,10 @@ SUMMARY = "a SocketCAN over Ethernet tunnel"
 HOMEPAGE = "https://github.com/mguentner/cannelloni"
 LICENSE = "GPLv2"
 
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
-SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https \
+           file://0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch \
+          "
+SRCREV = "82aa49b417b96fe46bb3f017ae1bfea928f20f9a"
 
 PV = "20160414+${SRCPV}"
 
-- 
2.24.1


