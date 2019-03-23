Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 287CB7C88C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 23:13:00 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y6so4808051ljd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2iQ8b3RFE47YjVPnb+xlXxa9/7YA9frEvsieBAHtyoU=;
	b=c0JIk5d5n/ydmQR2Mtlp6ilsje05Av61zL//p5b0WKXDqGPqSsBwd8h1wdZvMY3+LB
	lApw3M/EGXkVDe6EhG27Z/AlRGP16stmV8aqzk7PggqPOw0Fpz0OtcigEybJ9ZH4fV6w
	03i1nBQClSJ9WIhWiXf/WmVyuEb3K0nVDT/lkJN9Up4piQaZE6Mv/8ydZ8zLB6XuJvnW
	//CsBZJO3hZvdj5rP3eix/KCo0zEdaAtSS0zRHbFr+uxovHFYbCYHIOOJnjiPQj0bV49
	Do0r+l/KPA3m1eUUxAxXHd6Y+a32Bfewmq4Tt0FyD2qlJB49X/GKZYbI14DaU0/WV8qG
	3NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2iQ8b3RFE47YjVPnb+xlXxa9/7YA9frEvsieBAHtyoU=;
	b=iNdyGyHUxRhQcJciV5xvg3Zu6oSBnyVINUKiScNDgIevEDnT0vZ3gT9jsMofMCRT8/
	eZ38jpn0erKmh6E2/V6c4CeeH8GxqT3/Utf8z8ahr43CLd0KXzUTVbwAD8MImVtMfLgy
	VzaZP8CXt52jbkevbHfVasg3Ht/xQv2WsUEF5tVf/JOspTpHV4XCckmggtMKNI7phZoy
	xCo0cAPbyIbDdF49DULNw79aeamZ0L4twLxPIf1FQbe3phrm8upcUxnf8yR0NG4KNMLA
	w05xIu3wMGbD22KG2RyH6Eku8siD23O/KzKGJlNJ6tK5Ol3sbG5fraTrpxfFOPwPlEUZ
	rF/w==
X-Gm-Message-State: APjAAAWOELqC/SFt95ZhFxYCDTU3I39JY09TauQdkJ+pGFKuOpxRpMlk
	bNGaTZhgfrJL1aQwarpK5ChrbI4helI=
X-Google-Smtp-Source: APXvYqxiqRH8yHrkSJ0RbAvKAynliCr8rAd729EdBx5ORdu4xKILEWKFhVCDlEBPc9nsHVsyjMQoMw==
X-Received: by 2002:a2e:292:: with SMTP id y18mr6470296lje.52.1553382780584;
	Sat, 23 Mar 2019 16:13:00 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m18sm2603849ljb.35.2019.03.23.16.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 16:12:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Mar 2019 00:12:31 +0100
Message-Id: <20190323231231.21729-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] doxygen: update to 1.8.15
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
X-List-Received-Date: Sat, 23 Mar 2019 23:13:01 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../doxygen/0001-build-don-t-look-for-Iconv.patch      | 10 +++++-----
 .../doxygen/{doxygen_1.8.14.bb => doxygen_1.8.15.bb}   |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.14.bb => doxygen_1.8.15.bb} (76%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
index 0eefe0729..c86dc1691 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -1,4 +1,4 @@
-From f3a6c05e3a8afdac547c6c8176fa6b57636db65c Mon Sep 17 00:00:00 2001
+From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 2001
 From: Bartosz Golaszewski <brgl@bgdev.pl>
 Date: Fri, 23 Nov 2018 11:44:56 +0100
 Subject: [PATCH] build: don't look for Iconv
@@ -17,11 +17,11 @@ Upstream-status: Inappropriate
  1 file changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ba105b89..16252247 100644
+index 45c2f2c1..22cf0144 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -89,10 +89,6 @@ if (sqlite3)
-     find_package(SQLite3 REQUIRED)
+@@ -92,10 +92,6 @@ if (sqlite3)
+   endif()
  endif()
  
 -find_package(Iconv REQUIRED)
@@ -32,5 +32,5 @@ index ba105b89..16252247 100644
  set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
  set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
 -- 
-2.19.1
+2.17.1
 
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
similarity index 76%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
index 7c7024ecf..784684620 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
@@ -10,8 +10,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch"
-
-SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
-SRC_URI[sha256sum] = "d1757e02755ef6f56fd45f1f4398598b920381948d6fcfa58f5ca6aa56f59d4d"
+SRC_URI[md5sum] = "2c98c73eba392d334f5bbaf15e09bae3"
+SRC_URI[sha256sum] = "bd9c0ec462b6a9b5b41ede97bede5458e0d7bb40d4cfa27f6f622eb33c59245d"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


