Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C81CCD187
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:58 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18613.1759326773276168576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQmxf6e0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso2140224a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326772; x=1759931572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB2lrQQ7OC/MiB6LPC5b+NHeiqOw0MQaVebQYBnrZ50=;
        b=eQmxf6e08vTR66MNCxaagQSA8jJK2hNTaI7gqVAESvtNQYBVkypAlogo0jLCN9uYHv
         KppanQGcVbDjXXqp07z4PoZr5uiw0kB4dlT7b1D/zNZnR2sYQAP0vAMIhEyA1y/Lt1Av
         bOmc8oWJoP3HOGa0ddSiGyHUmHGbSRrApRHTIi9epY8yUMmg2O8xzuZfVjIi5CtEhukT
         VzDEeLrLzjoeyXhrqDocBinQXDJnbI/VL9zqZ2M5t9/GU8fInB1Bf/TPC7k66LY0xVeq
         o8AV8LBcm851zgT9CTxm6O/xXnv+z0hj8zEcjGMnYSbiEygB2yXrAw/zxfd6Zrpm/HEz
         36Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326772; x=1759931572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SB2lrQQ7OC/MiB6LPC5b+NHeiqOw0MQaVebQYBnrZ50=;
        b=TOMeeu1CRAky4V0mM19zTIpTloiJ1kIfbPl47MGhYyPsR4Suq9uW3hh/picvSsdzSc
         fyYmdFqMvXamdkDCiZHylAkbpsZUxtswuHD60jTVcHSzYOqNIX+/7wAibtAQ+x311Dp9
         ANwhuweNVDYm1qZnSs8RPYe7hQQdbA1XZTiNJ9NgClCjq9SklPEMG6aUOQt0xJauup9I
         gEB9AcALseHHb1HTD2SiAoaksqQEJdXjIQHWP/pguPk+udq1mdfNC8Q73+qqM2VfWkbM
         nq0lmUM/Z6H0aM2Srwakku9Rm+casKLzUozD9Z03yDbMxa4AIMEtJVU10P61sntKfwti
         2b2A==
X-Gm-Message-State: AOJu0Yw0PbKd4+1uC/Hi/+97YFczMN2Hl2Q18AS79a85wyMmFVkZnoa8
	0sQS47zdl7Yps8w88zjmTouKS8W5ggNT5AGh9JW/EsYkkbq/Ok3RvI2o6P8ayA==
X-Gm-Gg: ASbGnctdsg2tw2fxV4hwJFFNBpYEOxes0HwUFRUsO+Lh9kSbMJ8FDVOvQEyqyiigORL
	VCEVSaGWdYXPJYSIrYeXfj2SvnQ/AaYLlOZsIF7xfr097yRVLUIgFlEHBr1W2cxZPD5noiUh80f
	E/CWHvkr54V8xzsAjMwkQ2saD0nnGBjYAsXjwvD6qqmKZLW4uIhxxRjQTi8E7Zuy+JLUkAMZyrv
	d033UJ4TVJPdz2nJeP0N1+pEQjs4cexazeByS80PbsFJX8fp6qEWQC6SNXLAEvDhHfWlLVrOi/q
	m3iDueM5j4qHESKdRw52Qs46LQ5Q1wfyo4Lg3usU6h3eq1RRqntdVlVCgidi9orJBclpXyzp9fT
	52C2qq36ihHqC5G5h5x86HlqmFTyzr+v24/MJ3ltBG4R8
X-Google-Smtp-Source: AGHT+IF4ZiWaaAaRIeioHT0w3LkAgqzOsARq633ZbvuM7HY8/eBnDQnCisfl6YLH2hpE3bqLRDeY0w==
X-Received: by 2002:a05:6402:4404:b0:633:4726:a077 with SMTP id 4fb4d7f45d1cf-63678bb906bmr4254419a12.15.1759326771536;
        Wed, 01 Oct 2025 06:52:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/25] gtk+: Fix CVE-2024-6655
Date: Wed,  1 Oct 2025 15:52:27 +0200
Message-ID: <20251001135243.1490753-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120124

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in the GTK library. Under certain conditions, it is possible for a
library to be injected into a GTK application from the current working directory.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6655

Upstream-patch:
https://gitlab.gnome.org/GNOME/gtk/-/commit/3bbf0b6176d42836d23c36a6ac410e807ec0a7a7

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4bd9d757c10265dbf75034b50504ad7340ae3012)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gtk+/gtk+/CVE-2024-6655.patch             | 40 +++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch b/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
new file mode 100644
index 0000000000..dfa54f2f31
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
@@ -0,0 +1,40 @@
+From 3bbf0b6176d42836d23c36a6ac410e807ec0a7a7 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sat, 15 Jun 2024 14:18:01 -0400
+Subject: [PATCH] Stop looking for modules in cwd
+
+This is just not a good idea. It is surprising, and can be misused.
+
+Fixes: #6786
+
+CVE: CVE-2024-6655
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/commit/3bbf0b6176d42836d23c36a6ac410e807ec0a7a7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ gtk/gtkmodules.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
+index e09b583..e75810c 100644
+--- a/gtk/gtkmodules.c
++++ b/gtk/gtkmodules.c
+@@ -225,13 +225,8 @@ find_module (const gchar *name)
+   gchar *module_name;
+
+   module_name = _gtk_find_module (name, "modules");
+-  if (!module_name)
+-    {
+-      /* As last resort, try loading without an absolute path (using system
+-       * library path)
+-       */
+-      module_name = g_module_build_path (NULL, name);
+-    }
++  if (module_name == NULL)
++    return NULL;
+
+   module = g_module_open (module_name, G_MODULE_BIND_LOCAL | G_MODULE_BIND_LAZY);
+
+--
+2.40.0
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index 082967e04c..3e610724fd 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://doc-fixes.patch \
            file://strict-prototypes.patch \
            file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
+           file://CVE-2024-6655.patch \
            "
 
 SRC_URI[sha256sum] = "ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da"

