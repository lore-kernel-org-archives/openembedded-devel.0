Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 878986C643
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z18so2379371wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H0d/PMsW6ENz/km3NSdKznfgqc78E/MSu4yCCDknnYk=;
	b=jqflnAmK+TX7i5m3gv1GPIBnhbuA9wXw1rBjuiiSbfPURQQ0vbDSA+9PdUW3FKg6zP
	r1iNyTtdq1E4rIOOb6h3Uwwt2KI94zjgetZC6hqaQ8le/wLwSEgLG5ehOj8agO5vVs5I
	/qI3nMvlkdgB6fPOYF4HM/RDE5ro7SmTynBMsZtDJbUav8le4dLfhTASui/KlfiGFoCk
	GsfPBpIfKm43n3lwjL5eKW1Ij172xyZGR5i12e8EetPzjadz6mNVhjx1jxXgwU8sD02J
	4QB8FZ86YQXJxKEdFvlu9fooIg4cafwcntBB6F67w92k1b2D1TrgNyr6siWZJCYTAdUl
	zpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H0d/PMsW6ENz/km3NSdKznfgqc78E/MSu4yCCDknnYk=;
	b=UY/hmcxHyR2NzSJRqgTywBq/XmNn3TCkhz8yOeDhhxDlAs2m9WsB7P6Hb0qwVCCdyO
	PgiuDY7/bLEgfNASyU0kx/ukmfPunZXRGfHUTkTYB7IXpoc2oujTLQlGOKjGkOsvIr4Q
	ei2FezLdQsRGy09u87KadAOk8ZOqVb11Jfoz5vz/6dPq0hcNaNUnYYVEtT1K9Y99JT9L
	mGUSkONlG4CdZkB9zLRnEGcx5kVPbeLhF/B1zyWFjUoiNdP9SVGc7hg2v4TnmQT/cM9b
	j6LLo5vIKFRFerreOyfiTzc5CNad2BAnwLXmOyl+2UVb6z5g6VtzwKxNlQQMhjgl2Md7
	Wk2g==
X-Gm-Message-State: AGRZ1gKoR72IrVR9AYzP+ffUjedLrqVXuQw9tQeoGFxbRbwwQZrR9ZI+
	AOsWfZg4QgHjT1F2HdP65dXYLx++oto=
X-Google-Smtp-Source: AJdET5dNffI7WsgYBOFI69Ri1IjRxb8GUHZWqtJ3UHFUcnFdbzcDb7c2F+KJ+Vqmg39PxGzhFTpdWQ==
X-Received: by 2002:a1c:aacf:: with SMTP id
	t198-v6mr21810327wme.108.1543217727968; 
	Sun, 25 Nov 2018 23:35:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:17 +0100
Message-Id: <20181126073520.18859-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/6] doxygen: new package
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:27 -0000
Content-Transfer-Encoding: 8bit

Doxygen binary is necessary to generate C++ bindings for libsigrok.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
 .../doxygen/doxygen_1.8.14.bb                 | 17 +++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
new file mode 100644
index 000000000..0eefe0729
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -0,0 +1,36 @@
+From f3a6c05e3a8afdac547c6c8176fa6b57636db65c Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Fri, 23 Nov 2018 11:44:56 +0100
+Subject: [PATCH] build: don't look for Iconv
+
+Drop the find_package() for Iconv. CMake is unable to find iconv.h in
+native build but all modern systems supply it as part of the standard
+C library. We don't need this check in meta-openembedded.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+
+Upstream-status: Inappropriate
+- upstream doxygen must build on many architectures, this change is
+  too intrusive for upstream
+---
+ CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ba105b89..16252247 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -89,10 +89,6 @@ if (sqlite3)
+     find_package(SQLite3 REQUIRED)
+ endif()
+ 
+-find_package(Iconv REQUIRED)
+-include_directories(${ICONV_INCLUDE_DIR})
+-
+-
+ #set(DOXYDOCS ${CMAKE_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
+ set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
+ set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
new file mode 100644
index 000000000..3137c4843
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources."
+HOMEPAGE = "http://www.doxygen.org/"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake python3native
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz \
+           file://0001-build-don-t-look-for-Iconv.patch"
+
+SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
+SRC_URI[sha256sum] = "d1757e02755ef6f56fd45f1f4398598b920381948d6fcfa58f5ca6aa56f59d4d"
+
+BBCLASSEXTEND = "native"
-- 
2.19.1


