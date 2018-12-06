Return-Path: <ccflyer@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id BECEB748F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 20:26:36 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h193so3605442ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Dec 2018 12:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ru/Z6wA4oVNkzNs5cQcQ3VifIShG/pS8RAz1pS81Y8g=;
	b=gEKl5fYRUjOQNK6SIR7tPlcI+cqhNQkLICws0iZ7hFm0DGDX9MlD0PoTOq6EhBgVJo
	HsA0rUx71+2QQz1y8p1qnLpcmGWJEVia7hSoFz8pEX6hipM1Qcdzu0y6Hiv5mt1gJUjD
	v1966+UkiO/5xLOKzhM/zVndJ07yJGLe4XTZjPkvstmtxiBruRQD1lm3ug2gOXcGRodA
	CCfJ0xQ7TPeOmcASsrdSVLWOrHvBN62YoSY8PJgYtvGz0C0H9pdkgACfOqUKKbt6fVqg
	GYyklXez50qkoZAjqlROQc97fNP/gSt+GjWIV/Dg//XO5Fs9O5bL3jUXygsilmk8ORth
	YkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ru/Z6wA4oVNkzNs5cQcQ3VifIShG/pS8RAz1pS81Y8g=;
	b=foNyv3zxqgQUQZbro/BK3hkZ69CnKiyhn9RaPcYGVAC+3EVPH+Qn2GDwPwsFerT2v6
	TI48R3O/ebNa0DUCh69UNSTGuSBuEF2pl7YE83aXyNdmjTF3zB9dT5o7XWMTqEcTWh8O
	QiFQAe32azkf3WLgAH/r8yvpC0G7u3aXPTH4CyrUK3uqp09raaSiIiDDdYG0kan876nY
	lFHUMGH/cpgAd7/ur3RQd20osCiP+CsrZY4uZKlfuoAgElhzQ8cRbAAoNZZztNsJwLQu
	1nWvYKYXdr79efYM9HEn7/tD6vfewz4mRJ0ZvzZphoUepB7hd8JleOFLrc4hDCTP9FKK
	ZCDg==
X-Gm-Message-State: AA+aEWYJBF9Db5TCHiAeMdFctiwIu2dW9s20q0vf3I2RRpEWFxJvEjox
	6AaPmRBSFMhp5j+JFpiaaxo0/tdC
X-Google-Smtp-Source: AFSGD/UYWAp84cdwLuwAiPpRxYnupgnOJbzN1wt1A1JtuWfrLvh3iARijNu8+e1lwLDxoXIdhZMVJQ==
X-Received: by 2002:a05:660c:91:: with SMTP id
	t17mr13837463itj.41.1544127997450; 
	Thu, 06 Dec 2018 12:26:37 -0800 (PST)
Received: from ubuntu.localdomain ([72.175.11.38])
	by smtp.gmail.com with ESMTPSA id x21sm522406iob.84.2018.12.06.12.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Dec 2018 12:26:36 -0800 (PST)
From: Chris Conlon <ccflyer@gmail.com>
X-Google-Original-From: Chris Conlon <chris@wolfssl.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2018 13:26:29 -0700
Message-Id: <1544127989-3640-1-git-send-email-chris@wolfssl.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wolfssl: Update version to 3.15.5
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
X-List-Received-Date: Thu, 06 Dec 2018 20:26:36 -0000

This patch updates wolfSSL to the current 3.15.5 version. It removes a previous
patch for generating cyassl/options.h, as wolfSSL proper now does that as part
of the Autoconf configure step. It also removes the ipv6 PACKAGECONFIG usage.
wolfSSL is IP neutral and the --enable-ipv6 configure option only affects
the wolfSSL example client/server. As these examples are not compiled as part
of this recipe, the PACKAGECONFIG is unnecessary.

Signed-off-by: Chris Conlon <chris@wolfssl.com>
---
 ...0001-fix-no-rule-to-make-cyassl-options.h.patch | 27 ----------------------
 .../recipes-connectivity/wolfssl/wolfssl_3.14.4.bb | 24 -------------------
 .../recipes-connectivity/wolfssl/wolfssl_3.15.5.bb | 21 +++++++++++++++++
 3 files changed, 21 insertions(+), 51 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch b/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
deleted file mode 100644
index f304d93..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From fb490136cf8f2456cfe13b0b4f796e6c155e75dc Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 30 Aug 2017 03:02:32 -0400
-Subject: [PATCH] fix no rule to make cyassl/options.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 395d75d..d4a3880 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3684,6 +3684,7 @@ AC_CONFIG_FILES([wolfssl/options.h])
- #fi
- AC_CONFIG_FILES([support/wolfssl.pc])
- AC_CONFIG_FILES([rpm/spec])
-+AC_CONFIG_FILES([cyassl/options.h])
- 
- AX_CREATE_GENERIC_CONFIG
- AX_AM_JOBSERVER([yes])
--- 
-2.8.1
-
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
deleted file mode 100644
index dc9094d..0000000
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "wolfSSL Lightweight, Embedded SSL Library"
-DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written in C and \
-               optimized for embedded and RTOS environments. It can be \
-               Up to 20 times smaller than OpenSSL while still supporting \
-               a full TLS 1.2 client and server."
-HOMEPAGE = "http://www.wolfssl.com/yaSSL/Products-wolfssl.html"
-BUGTRACKER = "http://github.com/wolfssl/wolfssl/issues"
-SECTION = "libs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PROVIDES += "cyassl"
-RPROVIDES_${PN} = "cyassl"
-
-S = "${WORKDIR}/git"
-SRCREV = "1196a3b64d9fabffc8273b87f6f69ac0e75d2eb7"
-SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https; \
-           file://0001-fix-no-rule-to-make-cyassl-options.h.patch \
-          "
-
-inherit autotools
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb
new file mode 100644
index 0000000..37ba4aa
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.5.bb
@@ -0,0 +1,21 @@
+SUMMARY = "wolfSSL Lightweight Embedded SSL/TLS Library"
+DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written \
+               in C and optimized for embedded and RTOS environments. It can \
+               be up to 20 times smaller than OpenSSL while still supporting \
+               a full TLS client and server, up to TLS 1.3"
+HOMEPAGE = "https://www.wolfssl.com/products/wolfssl"
+BUGTRACKER = "https://github.com/wolfssl/wolfssl/issues"
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PROVIDES += "cyassl"
+RPROVIDES_${PN} = "cyassl"
+
+SRC_URI[md5sum] = "bc2dff70ba6e91aa3748d36ae6c6bc3d"
+SRC_URI[sha256sum] = "f6c04c25355b340373931f43f8041b3cef78b61122e8a8edf9ee63c07b7a58be"
+SRC_URI = "https://www.wolfssl.com/wolfssl-3.15.5.zip"
+
+inherit autotools
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.7.4


