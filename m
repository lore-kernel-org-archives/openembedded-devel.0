Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 717D477E48
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:13 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 79so18584953pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yG6cVQRwpfq++CQraMLLQiPEUIGDmoLdVY4F4gUzmSM=;
	b=PCJ9vGF4Eo5ISY8OGrK+w5upj8d3he3C+trS0kSyKoqA3VPDwGuYLq3Ioe+bJTDKlC
	HtWWvLMHPTz2MVZgRV7R5nay/xX1940j99v5+7Wtj63CbyXKAuwzRFJ8G9DdKXFOTps+
	UULxRlpY954W/fMokyRJ2bJOffN3gh8aHZd30NKcNmuyVZvb3nSPydrwWX/fCV6rUGPf
	LwPqjT1RySGAsT0oy+dUFUTYlMCPY2H96GYuVwpTVbpJzCpw1qT8+CLTl5X3g8Phi6lx
	lDUdiXpg3xp7p2f2R8jhK7MyPZfkjERaRax6yCxuqImafPAEkaHezL6jaAiooBmhLAk6
	4fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yG6cVQRwpfq++CQraMLLQiPEUIGDmoLdVY4F4gUzmSM=;
	b=etqadzK3Y0e7EDjs0fHi07YE7bTrv5m/3NVUrWKaPomPHs/RhqjX0HdzAUYOBie4/O
	gJQIU3aHr/YAppo/MuRdT1ByRkuZebHl0kvatUszYk3Upf8BC8g7PdaEy4CATOlrtjtq
	vywW9Ex/dKLuqTBgGY1JH1kar2nvrT88MzGC6T5+VDO+lfS+9blDMHCDABdiSlozFjjV
	GKkdQPu2kgsd3VWC0jdxOkuLWEUNbU1M8uWRjzCOwpJJah/wLMRsOIwm1+/Mo4rewEUY
	A3ACtUVSH9b9Mpy8YJpl2IywoblXNqowBJjPijozcUZDH4sawjjvEwytZNC0uTdGz6Mp
	KQ+Q==
X-Gm-Message-State: AFeK/H05+gopUn+c/wQ4pxdI+xJdOs9acsoGhrlRhhYtzfQp0DAsF10ECxQh/iglE+Ok+A==
X-Received: by 10.99.67.3 with SMTP id q3mr4282516pga.221.1490978595081;
	Fri, 31 Mar 2017 09:43:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:18 -0700
Message-Id: <20170331164247.5052-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/43] mariadb: Do not use ucontext_* APIs with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:13 -0000

musl has ucontext.h header but does not implement the APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mariadb/0001-disable-ucontext-on-musl.patch    | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 0a0caa3f0..401907251 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
            file://change-cc-to-cc-version.patch \
+           file://0001-disable-ucontext-on-musl.patch \
           "
 SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
 SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
diff --git a/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
new file mode 100644
index 000000000..60e9199f9
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
@@ -0,0 +1,28 @@
+From 5bc3e7ef9700d12054e0125a126f1bb093f01ef9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Mar 2017 14:30:33 -0700
+Subject: [PATCH] disable ucontext on musl
+
+musl does not have *contex() APIs even though it has ucontext.h header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/my_context.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/my_context.h b/include/my_context.h
+index dd44103..9b28c17 100644
+--- a/include/my_context.h
++++ b/include/my_context.h
+@@ -31,7 +31,7 @@
+ #define MY_CONTEXT_USE_X86_64_GCC_ASM
+ #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
+ #define MY_CONTEXT_USE_I386_GCC_ASM
+-#elif defined(HAVE_UCONTEXT_H)
++#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
+ #define MY_CONTEXT_USE_UCONTEXT
+ #else
+ #define MY_CONTEXT_DISABLE
+-- 
+2.12.1
+
-- 
2.12.1


