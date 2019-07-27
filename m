Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8E497F20C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 18:59:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id b7so25997748pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5gLyBq5Cql3FCZBB6u9x4DXPrOiwlmJzJEKxZ46TSgI=;
	b=bNKcQt2YPJoUA3E9aM1HO38sMWnrmaLxP/vQBQEIDI5E05pZJF9Fe5SOpMVmzmDTA1
	fAiLvLkHH25EnZufa6gMMWhupEIGv3yRPR99Bdg5mRt76HRUM8xUJkVYXtsVUI/jILia
	zJ1uEuYQpsmNQ1ntJlHQAzn0ItTSegc6loShRs4NW5oD/VdYG607nmXod9V9pA5yz+K5
	EvXpXPt5eGFDHZ18EYAyPJOFiwE8d/QPfoIli6RzeKw/ZhAPzLZ2uT6S29DttniiTcxi
	UwyoLlIDSZwp67ZdYc1WJD8vKG10SPxYpSwf3QSVudYvmNfNC4ZpyJMa7GxGMsWwYsdN
	dPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5gLyBq5Cql3FCZBB6u9x4DXPrOiwlmJzJEKxZ46TSgI=;
	b=XZxcA7Bs81HKG6GkAJybbV6G2cHvBVktvnt6OX96nvdw1/GP9sH4uRE74FdBTXqacL
	jczaz7/yieDC+1ddoI3L8MupGm5bhgnzi2a9ivedi9DcEh2DDVpirNfyANXXcwcmbUtn
	wnEpcyJd0MEjavljBgG34ovkN186o3KJSAWocfa8tcJDeEZn7bDwWQfBF/M/tCTshczG
	KMx42Jdn+tZamRKGuCY2QAKXSkUVdfciq/qDmVe110LDDRmHSIOBEan5BC8fnKfeYbFT
	B+fEbkKo8HdP4vLprKiBlrMjZG3iIpkMYmHlzrLgPiSPZyPOR4WB4W9ihCRBL/8SKl4g
	JUpw==
X-Gm-Message-State: APjAAAWqSpvXsKEIy1W4Ot3oCqvevjTa9398rr+4oP7HENwtLjwOBZcX
	FPPjH7GqIGQWD4BIUUeUoVir0fFRnvk=
X-Google-Smtp-Source: APXvYqy1MIF+1sXMrAXxohrvmMP82lz401VccLnczLR7wg+mdDRPp7lzpYDKyhIWg1R0ALUhRZBd6Q==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr97723650pla.50.1564253987571;
	Sat, 27 Jul 2019 11:59:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k22sm60178333pfk.157.2019.07.27.11.59.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 11:59:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 11:59:37 -0700
Message-Id: <20190727185937.29832-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727185937.29832-1-raj.khem@gmail.com>
References: <20190727185937.29832-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] ypbind-mt: Fix build with glibc 2.30
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
X-List-Received-Date: Sat, 27 Jul 2019 18:59:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure-time-check-for-gettid-API.patch | 45 +++++++++++++++++++
 .../recipes-support/nis/ypbind-mt_2.6.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch

diff --git a/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch b/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch
new file mode 100644
index 0000000000..9484d0b007
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch
@@ -0,0 +1,45 @@
+From 25d5daf30aa2dc451ba528712f668036d8506054 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 07:50:26 -0700
+Subject: [PATCH] Add configure time check for gettid API
+
+glibc 2.30 has added this syscalls wrapper
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac  | 1 +
+ src/log_msg.c | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9e32a4a..6d1067b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,7 @@ if test -n "$TIRPC_LIBS"; then
+   AC_DEFINE(HAVE_TIRPC, 1, [Define to 1 if TIRPC is available])
+ fi
+ 
++AC_CHECK_FUNCS(gettid)
+ dnl The difficult part: could we reconfigure NSS or must we use DNS ?
+ AC_CHECK_FUNCS(__nss_configure_lookup)
+ if eval "test \"`echo '$ac_cv_func___nss_configure_lookup'`\" != yes"; then
+diff --git a/src/log_msg.c b/src/log_msg.c
+index 49f0905..37da311 100644
+--- a/src/log_msg.c
++++ b/src/log_msg.c
+@@ -26,6 +26,7 @@
+ #include "log_msg.h"
+ 
+ #include <sys/syscall.h>
++#if !HAVE_GETTID
+ #ifdef __NR_gettid
+ static pid_t
+ gettid (void)
+@@ -39,6 +40,7 @@ gettid (void)
+     return getpid ();
+ }
+ #endif
++#endif
+ 
+ int debug_flag = 0;
+ int logfile_flag = 0;
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
index 1a64e6c2e1..4f7f8aa3ef 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://github.com/thkukuk/ypbind-mt/releases/download/v${PV}/${BPN}-
            file://ypbind.init \
            file://ypbind.service \
            file://0001-dns_hosts-Fix-build-with-musl.patch \
+           file://0001-Add-configure-time-check-for-gettid-API.patch \
            "
 SRC_URI[md5sum] = "7cf89641fdc128d0919207e4b7caaf1d"
 SRC_URI[sha256sum] = "0696c0263c4fd48a4ff2ce6c109f05f37aab0f71646d81cb22c7c28591bf80eb"
-- 
2.22.0


