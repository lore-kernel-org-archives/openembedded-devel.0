Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.190.1597273705656476032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 16:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=clZ80s1g;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id kr4so1867818pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 16:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1BR+NgVGguL0xjDonLtD92KsirZDVLl/I3J6gu0j/LA=;
        b=clZ80s1gvN5apRnQsTgo9MdxNyVWWfKOOZUcJ7xVEELQqe//l5tYpOOtDIwToR5SqB
         SNFriU/srfIh07NTlhYWGkTRCtzDYsj5uDoIWYPfP9hj1Yi/HQYTXuQ5Uqawopwu2Plb
         /PClDyozKOCWJU2vUJn4ibC6Y1ikFqimSVbGd2SgNnhVoFqOh9bRR/w1znqKB8d0q4He
         Gex/UG3w9lpeuzv4WApuDqC8GsTZP/ZdIaIsSe7QrFFTuLkJhlg3iAMbpxXzC8DMpso0
         cHC+5oMX3P235LF6aZjRoPSziyG6RX5DYw3r2ixfDJr7ziqsAEDnJx8Xhzfpi4iWDiTw
         4Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BR+NgVGguL0xjDonLtD92KsirZDVLl/I3J6gu0j/LA=;
        b=oe6et9fJ3gfumzP3QQAWQ72JZxdmRswPuICRQyJguXC0LQlK7ZhpjsL6NZnlmZH6rx
         RIN1Xk7WnWuthuPrCBLjnd9LwuipmEaHYMKLhJlVBnAL2UfPmLz+7nnaHPnDgBrh/7ru
         Nnm2IY6JsausaeY2Mzils588LgAAB8jCrrF+rs3CHUEHcwALCa+ElSE3Gd4BTAYkw2sn
         FOS/BnS01FA68XcyQJ/qplkWp85Kfl5oullBFcMDKs5kgrSuc99KwpsE6X0HUlCVai+O
         JX5jeQ0O6GLoLSzxZPDsKi4dHKKd1+lDO5I36LWb+XpalEJ/IGP54OuTtF16RNQyXfZS
         c/tg==
X-Gm-Message-State: AOAM530fH/8oeh+rzFBVyUEOX24HvaWl6GWjFJbnVkspaBGbrisZkVW6
	+TnvX+YmXcLVxOeLzSNNRQLkkC1RX8U=
X-Google-Smtp-Source: ABdhPJx9C/kwS9CAhQgeGSXevkXWoEBmEmTXM/po24/ynQIRmG17lFUVg3IJLw3B4x4IFkDVyUYJlQ==
X-Received: by 2002:a17:902:a70e:: with SMTP id w14mr1527341plq.259.1597273704743;
        Wed, 12 Aug 2020 16:08:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h19sm3112146pjv.41.2020.08.12.16.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:08:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] lcdproc: Fix compilation with GCC >= 10.x
Date: Wed, 12 Aug 2020 16:08:20 -0700
Message-Id: <20200812230821.1802729-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812230821.1802729-1-raj.khem@gmail.com>
References: <20200812230821.1802729-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-compilation-with-GCC-10.x.patch  | 46 +++++++++++++++++++
 .../recipes-extended/lcdproc/lcdproc_git.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
new file mode 100644
index 0000000000..35634dd9ba
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
@@ -0,0 +1,46 @@
+From 9b07f6a472c24f5e1b65746756764391be0d55e4 Mon Sep 17 00:00:00 2001
+From: Harald Geyer <harald@ccbib.org>
+Date: Mon, 10 Feb 2020 13:15:10 +0100
+Subject: [PATCH] Fix compilation with GCC >= 10.x
+
+Starting with GCC >= 10.x, -fno-common is used as default
+instead of -fcommon. This patch fixes the compilation.
+
+Closes: #148
+
+Upstream-Status: Backport
+Suggested-by: Conrad Kostecki <conrad@kostecki.com>
+Signed-off-by: Harald Geyer <harald@ccbib.org>
+---
+ clients/lcdproc/iface.c | 1 +
+ clients/lcdproc/iface.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clients/lcdproc/iface.c b/clients/lcdproc/iface.c
+index 40e50cb7..1ac355bd 100644
+--- a/clients/lcdproc/iface.c
++++ b/clients/lcdproc/iface.c
+@@ -32,6 +32,7 @@
+ #define UNSET_INT -1
+ #define UNSET_STR "\01"
+ 
++IfaceInfo iface[MAX_INTERFACES];
+ 
+ static int iface_count = 0;	/* number of interfaces */
+ static char unit_label[10] = "B";	/* default unit label is Bytes */
+diff --git a/clients/lcdproc/iface.h b/clients/lcdproc/iface.h
+index cc6dbaaf..c1bd6b5b 100644
+--- a/clients/lcdproc/iface.h
++++ b/clients/lcdproc/iface.h
+@@ -18,7 +18,7 @@
+ /** max number of interfaces in multi-interface mode */
+ #define MAX_INTERFACES 3
+ 
+-IfaceInfo iface[MAX_INTERFACES];	/* interface info */
++extern IfaceInfo iface[MAX_INTERFACES];	/* interface info */
+ 
+ /** Update screen content */
+ int iface_screen(int rep, int display, int *flags_ptr);
+-- 
+2.28.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
index 275b984e47..35585d0690 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/lcdproc/lcdproc \
            file://0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch \
            file://0002-Include-limits.h-for-PATH_MAX-definition.patch \
            file://0003-Fix-non-x86-platforms-on-musl.patch \
+           file://0001-Fix-compilation-with-GCC-10.x.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

