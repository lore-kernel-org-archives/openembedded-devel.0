Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.70.1612391364531769606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 14:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCt1R3oT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id j11so636578plt.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 14:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6IKRWzEoU3R0iBW8IvCgWCGASJmIXD8BU9PEyRVEkvo=;
        b=cCt1R3oTDbzeayKE1xDizmcApHgL87lFgcZIiamDEZZltfYHyQxrBVOQ7ZRiiVzMdM
         tiNHS5sKdUJRBZicM94axUq6EZ5YD7YjGHCwVQvxwEJYglRRFosNoSKnQWT4T6xKtj0F
         of3Xg0b8tPUsKvMPWZ/q7GGU2roJmwVTtwbVYX8SafM8xx9r3DVa6chhaN8xpEdyImZf
         1Jx18gNQmMquwqOa+lD4FI+Mj2ysyQkJ3HDZEr61p4IkFZpcsrv84XMQk2HlhsDfegAt
         slHDheFQaQ56Ih9Ie4A8p+UXFo0mQ4RvDi0TMMlU9JR9Abhjcvv5mWAUOlvidXiazhGG
         OvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6IKRWzEoU3R0iBW8IvCgWCGASJmIXD8BU9PEyRVEkvo=;
        b=Vbd4fJODWXtaG8hK9YZkt+c/t/i4JVRxWoChui0ak30sAPIF6+BlaRQx+rfw3hU8gL
         RC+ZUlG5eZzlbMfRsPv122Vgc9PZXuDa/BGXkVpFMvFyDuPDxnBiNQLXUheZGPhrZ+xZ
         38Ec5TZRFF/JBOQ4PiTD0jN45ZY5BhPWoOfcjJG+mj+zCbTB8aVB5lBCSFtcZxXiKPjl
         OR705aNxt5QgrC8KdJcg+FWRkK+WO13eu138HtXknoaiUkzfCx0o1272d5pz3lEVI5Mo
         5rACMVfSdTudpOAQSKJJ5SydnReQfwiXljClLCsolpfHR1yeFX9PDt2sAs1xVkXk1m01
         nrOw==
X-Gm-Message-State: AOAM533FlvWQXiSZQpQzGAB4YC4rqiTFph+ljUSKSjLUg936cL0o9wUO
	SWOSWU91c2hpyMerNeUr7/lAU+xSj8CFxw==
X-Google-Smtp-Source: ABdhPJzAWY3cUPna/E5kCqP8BuriC4wRSOhrSuxmvgNfUpXUhxagzQST5/bkw3wXdH+aeulJOsIwfQ==
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr5109873pjg.110.1612391363790;
        Wed, 03 Feb 2021 14:29:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id l12sm3023199pjg.54.2021.02.03.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 14:29:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] yasm: Fix build with autotools 2.70+
Date: Wed,  3 Feb 2021 14:29:20 -0800
Message-Id: <20210203222920.3872916-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../yasm/0001-Do-not-use-AC_HEADER_STDC.patch | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch
new file mode 100644
index 0000000000..bda90edb20
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/0001-Do-not-use-AC_HEADER_STDC.patch
@@ -0,0 +1,39 @@
+From 6b1cbe8b4dcc45103d69bc7337e5eb33d1fd21f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Feb 2021 14:22:51 -0800
+Subject: [PATCH] Do not use AC_HEADER_STDC
+
+This macro is removed in autotools 2.70+ and it can be expected that C90
+headers are always available [1]
+
+Upstream-Status: Pending
+
+[1] https://www.gnu.org/software/autoconf/manual/autoconf-2.70/autoconf.html#index-AC_005fHEADER_005fSTDC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 01b61097..2823ecd7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,14 +101,8 @@ AM_WITH_DMALLOC
+ #
+ # Checks for header files.
+ #
+-AC_HEADER_STDC
+ AC_CHECK_HEADERS([strings.h libgen.h unistd.h direct.h sys/stat.h])
+ 
+-# REQUIRE standard C headers
+-if test "$ac_cv_header_stdc" != yes; then
+-	AC_MSG_ERROR([Standard (ANSI/ISO C89) header files are required.])
+-fi
+-
+ #
+ # Checks for typedefs, structures, and compiler characteristics.
+ #
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 53856263f7..cacdd74c4e 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -9,7 +9,9 @@ DEPENDS += "flex-native bison-native xmlto-native"
 PV = "1.3.0+git${SRCPV}"
 # v1.3.0
 SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
-SRC_URI = "git://github.com/yasm/yasm.git"
+SRC_URI = "git://github.com/yasm/yasm.git \
+           file://0001-Do-not-use-AC_HEADER_STDC.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.0

