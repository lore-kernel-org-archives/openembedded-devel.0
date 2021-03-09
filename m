Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.4626.1615265707661250360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 20:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sD6Fo301;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id w34so6879140pga.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 20:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SW0k9kM2e/zqveoYY2rR7hU8oasfMKyXcb5oZkY4vVM=;
        b=sD6Fo3019ar6bKcvUJhQoag7s6sgC4zwqUEeBsn7pvHnf65yQIOt5xkaM/v46VBLkE
         GWekvzlScKXSQwEgaaj+YnG9brVVZtMNuOOZZao9nf+8n+QPFZkjte/zYmpLdSALyl12
         MDhsB2XJzib/w39iVM+/MFye66ykrc6H2M7CVSvOcdw2xVYOvKy0oJ+ScszXmm6fP3yd
         ru9wUxA85IXzEPX3SEh37pPTJlBjPCqB+ftZoJAYtV+RXI7HXnrDsru3fBy0FQl9QJAs
         Rk0MlXBlYG1mAJUQA1gTUwu8bIsKFD3AKDNi7EoHetbySpvoooCkrrnBw1gYH+A4Tg98
         kz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SW0k9kM2e/zqveoYY2rR7hU8oasfMKyXcb5oZkY4vVM=;
        b=suLdjfwZcqBFf+s5LlgHxG+Cvo49pEJHO3LG9J6iaorF+1dPVxz4AB01OkxPNyfVlS
         4EIhcBs0G0UWGz5Bc4x9Ry1eSO7I0MGFLbLyVHaMclthOpI16DH8kRx0dIVaEbgg5bV5
         H0PlUlQxVj0E6HH/C6GAJlTmsvpiqBUnrHFr62bPhxaDpYEXREvLCPi32W0IHWWgTT8h
         OshoQq8DHHsNh6gaaVFe4cJ4VFQOb6IL4iB6zZN+uxBoRIuQrNAyloLUqtTEBHJ6tYk1
         lBqtJg1JPiTNWMNiFqWmYCNEEfOVsgAKvd4ukVrj83GKSQlGr7UtiYxNpm9Y8/KQ1jGU
         mqiA==
X-Gm-Message-State: AOAM533s2BSLu0gwwhoCo/RUWWaUxUJZ9fJnLNcIPDvanTjlhaQe08Oz
	8IUUDYtp2Rw4PYR+EVMJChItfx+0e3HtvA==
X-Google-Smtp-Source: ABdhPJwQmoNWihofxnBlFT9++22Wh/0Nz9pzN3wx+9uIElsx1HrQxNoLuQxTV0Re7lp+i/v0TZHsyw==
X-Received: by 2002:a63:4845:: with SMTP id x5mr22404727pgk.315.1615265706752;
        Mon, 08 Mar 2021 20:55:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k13sm12180301pfg.3.2021.03.08.20.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 20:55:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] musl-nscd: Make lex syntax posix'y
Date: Mon,  8 Mar 2021 20:55:04 -0800
Message-Id: <20210309045504.774816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itch.y-Replace-empty-bison-extension.patch | 50 +++++++++++++++++++
 .../recipes-devtools/musl/musl-nscd_git.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-nsswitch.y-Replace-empty-bison-extension.patch

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-nsswitch.y-Replace-empty-bison-extension.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-nsswitch.y-Replace-empty-bison-extension.patch
new file mode 100644
index 0000000000..67c8b1bcfd
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd/0001-nsswitch.y-Replace-empty-bison-extension.patch
@@ -0,0 +1,50 @@
+From 82e51fb8ba2640b318826ef4e17b0f5c09c8dded Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Mar 2021 20:10:18 -0800
+Subject: [PATCH] nsswitch.y: Replace %empty bison extension
+
+POSIX compliant yacc do not understand %empty therefore replace it with
+/* empty */
+
+https://github.com/pikhq/musl-nscd/issues/13
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nsswitch.y | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/nsswitch.y b/src/nsswitch.y
+index 107073b..0b7c71e 100644
+--- a/src/nsswitch.y
++++ b/src/nsswitch.y
+@@ -38,7 +38,7 @@ top:
+ 	;
+ 
+ file:
+-	%empty {
++	/* empty */ {
+ 		list_init(&$$);
+ 	}
+ 	| file line {
+@@ -88,7 +88,7 @@ modifier:
+ 	;
+ 
+ modifiers:
+-	%empty {
++	/* empty */ {
+ 		memcpy($$, default_actions, sizeof($$));
+ 	}
+ 	| modifiers modifier {
+@@ -112,7 +112,7 @@ item:
+ 	;
+ 
+ list:
+-	%empty {
++	/* empty */ {
+ 		list_init(&$$);
+ 	}
+ 	| list item {
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index 83125a1ba4..6af7ab9cd8 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -15,6 +15,7 @@ SRCREV = "af581482a3e1059458f3c8b20a56f82807ca3bd4"
 SRC_URI = "git://github.com/pikhq/musl-nscd \
            file://0001-Fix-build-under-GCC-fno-common.patch \
            file://0001-configure-Check-for-flex-if-lex-is-not-found.patch \
+           file://0001-nsswitch.y-Replace-empty-bison-extension.patch \
           "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.30.1

