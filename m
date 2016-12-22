Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C74D777711
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:34:00 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id qs7so349758wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Q//ZwZlSiwV4B2SLR43jdq6mEAJgNbPJ8hiFQeakDWs=;
	b=qhy5WeORFvMiVTeCrilJsWbm7ODZ1QoOoCJ1FE6U912QoX48CYYa/HfhwKlYl0fuTx
	iHGClB4lq8PD/lJhMg13VmkQcZtxt1J9S49lNgoBHp25qK2rKEJoOw7vu6BqAMZ/6hUf
	e6lgbmoXiS5f3ys4OO1ZI0xJGGRK3E7oK9+HN3i50qRVgTOsb6dOuoCep1bpkyA1bWdf
	+dXWNWPY2xxzEoSEsPwNBknsRUqVTejprRzeDufdQRa9IrWTTexRudjYrI+IxnvOzWsh
	ACjvAG90rqgGCG4t5yC61oC+7pEJ6VnfXZ94pcv3XnCAtzikjcuQCE4W6yJZnqY8zw7E
	4YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q//ZwZlSiwV4B2SLR43jdq6mEAJgNbPJ8hiFQeakDWs=;
	b=H3KMtg+FF7Q2oCTFlzbSD0ace87rxCEW9cTKlSICGaqgBorxaG7ByhMQuq5SeoWFAy
	nSRvDzISYEQwt7jBli85+D50aUDrZVBk1vmWyEwAS+KrmRB9kTC3W0r9c4QaSFW1eA1O
	iue0YuETNue+HzdiWvxJ1wq7aBjPP1Ow0xNZLzcaHcWkGG7RjwyCi6pPzDBb657XxxCE
	22xgHjszchX74g+hpSy27mWWNqLorIFQTu4oA8KOBNaO2nae6DM3Bm8lhzEY3+HCsiV5
	cxmOj8avgBNL3d6ewFzQNyt5EvesF6beWiMHmjeXlyVrdZs7zd+m1Y3wHap4eqbg9kSq
	byag==
X-Gm-Message-State: AIkVDXKg3HTfJMZmvTu5yTgVKqTQkW02G9OrbHdFaEA+fqFb9VGrSORr08ma5Hte4xTj9g==
X-Received: by 10.194.126.38 with SMTP id mv6mr10638436wjb.142.1482446041297; 
	Thu, 22 Dec 2016 14:34:01 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.33.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:34:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:34 +0100
Message-Id: <1482446018-17187-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] geany: update to 1.29
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
X-List-Received-Date: Thu, 22 Dec 2016 22:34:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-configure.ac-remove-additional-c-test.patch: additional compiler check is
gone

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...001-configure.ac-remove-additional-c-test.patch | 47 ----------------------
 .../geany/{geany_1.28.bb => geany_1.29.bb}         |  9 ++---
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch
 rename meta-oe/recipes-devtools/geany/{geany_1.28.bb => geany_1.29.bb} (55%)

diff --git a/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch b/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch
deleted file mode 100644
index 5166fec..0000000
--- a/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e62d5b59262ec7ffe07931790712c7e247377795 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 21 Feb 2013 09:31:31 +0100
-Subject: [PATCH] configure.ac remove additional c++ test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-For openembedded cross-builds CXX can contain something like:
-
-arm-oe-linux-gnueabi-g++  -march=armv5te  -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
-
-This ends up in
-
-configure:5582: error: No C++ compiler found. Please install a C++ compiler.
-
-Anyway if [1] is still valid, the combination of AC_PROG_CC and AC_PROG_CXX
-should thow an error message.
-
-[1] http://lists.gnu.org/archive/html/bug-autoconf/2010-05/msg00001.html
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac |    5 -----
- 1 files changed, 0 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c37312a..742bf35 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,11 +26,6 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_PROG_CC
- 
- AC_PROG_CXX
--# check for C++ compiler explicitly and fail if none is found, do this check
--# after AC_PROG_CXX has set the CXX environment variable
--if ! which $CXX >/dev/null 2>&1; then
--	AC_MSG_ERROR([No C++ compiler found. Please install a C++ compiler.])
--fi
- 
- AC_PROG_INSTALL
- AC_PROG_LN_S
--- 
-1.7.6.5
-
diff --git a/meta-oe/recipes-devtools/geany/geany_1.28.bb b/meta-oe/recipes-devtools/geany/geany_1.29.bb
similarity index 55%
rename from meta-oe/recipes-devtools/geany/geany_1.28.bb
rename to meta-oe/recipes-devtools/geany/geany_1.29.bb
index da97090..db6a34a 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.28.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.29.bb
@@ -6,12 +6,9 @@ DEPENDS = "gtk+ python3-docutils-native"
 
 inherit autotools pkgconfig perlnative pythonnative
 
-SRC_URI = " \
-    http://download.geany.org/${BP}.tar.bz2 \
-    file://0001-configure.ac-remove-additional-c-test.patch \
-"
-SRC_URI[md5sum] = "39a29deb598e9e3503ee7d9d5fb51a34"
-SRC_URI[sha256sum] = "f73a3708f1a26e9bf72da564d5037d6f7fedca2e0d6175db0681c2b672100a5a"
+SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
+SRC_URI[md5sum] = "9b62a443461cc917b41c94fa7d58fdb1"
+SRC_URI[sha256sum] = "394307596bc908419617e4c33e93eae8b5b733dfc8d01161677b8cbd3a4fb20f"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.5.5


