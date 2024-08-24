Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34D9C5472E
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 22:45:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.22411.1724539550645797958
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 15:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIztwCWU;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7142448aaf9so2138448b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724539550; x=1725144350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ0Sj4tSJwbtP2maom/FO85lfuMAx0V4rbXXLTVn7F0=;
        b=NIztwCWUJSsH4cZ/fw0lWRqq53EM4qcCGDuReT27w0n5zxx/zKzD4E5ST9pUbUeyNa
         J3uAQLBM9J1+fosjKQn5KHPO8+hq8KlRgc6gZI18p24WIFKBirq9wOFeJ24c8S/uUW5+
         f7SDwlJa1RzF2WSJSs9gFoYEkp1fNmsMJ0OxbIva/C3exTfPAHJZR3ChuUfoNgRg4GhB
         t69VOG29fFzYVeL1FSqHytbKPSAFq/MfXSJgCvZ1DiVQxP5CPkjZVMK6x0xEf3RlwWL5
         5ei8PZMBtkc/eZm/9muhnW6iwkR+xsnQ1Mw2+imK8BMFG2rm6HJZfXKHJivqeAttQp+5
         jl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724539550; x=1725144350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ0Sj4tSJwbtP2maom/FO85lfuMAx0V4rbXXLTVn7F0=;
        b=eB7l7qYmuUvtqasEtacuFXse5PeOMElOtRn2eoli3tQeX8eNgUYvWhV2D/7kw79YS3
         dYRyihj8sikJLMYeFvwK+mGgjgTk7vwOGwBElzVdHyr/CmG7aN0iUx8Mb0FZ3QjTUxdP
         HTiW25ZYftJBVXzv5Qa5IRCy9An8wAiwp0dnZv/wzI44h+i5DmDjR5VGNHby/fJ/wbsh
         2wo6XN9qKWRA7lDUEpGD8CssUpGKi7tqO1EU5LkwC6vsSBaNUaXyeBj3p6DssoyEp/8V
         9MbL7dw3CzDW81d2BZRMBXIgrfSj4UTalXHMU+H2bkV9/BY/S82CtAn0p/9189dERn24
         v47Q==
X-Gm-Message-State: AOJu0Yzbiv52cz6xcnE7dtLAS18hX2CM7kWbX+qiz8uMNhNcTpi42acV
	1fJ0aHzM9qCHk6j7U3scVplTrpNxppqxgRXlkvD54yUXLi1ZkTqeo5WAjA==
X-Google-Smtp-Source: AGHT+IEOdavB7hTOtx5zos0N2+ZuQ1U6BSsz3RT3I2BHLUl9PJSVXd4cP20OVoWUdXE9LGOB+K5aJg==
X-Received: by 2002:a05:6a00:8d46:b0:70e:cf99:adc7 with SMTP id d2e1a72fcca58-7143170e1d0mr16054145b3a.3.1724539549603;
        Sat, 24 Aug 2024 15:45:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343388a1sm4914817b3a.184.2024.08.24.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 15:45:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/4] libgsf: Fix build with libxml2 2.13+
Date: Sat, 24 Aug 2024 15:45:43 -0700
Message-ID: <20240824224545.1944956-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240824224545.1944956-1-raj.khem@gmail.com>
References: <20240824224545.1944956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 22:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111923

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lation-attempt-fixes-for-libxml-2.13.patch | 105 ++++++++++++++++++
 .../recipes-gnome/libgsf/libgsf_1.14.52.bb    |   3 +-
 2 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch
new file mode 100644
index 0000000000..08ff51205a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch
@@ -0,0 +1,105 @@
+From 4a84e9857d83f684bf53d616942a393ce558a328 Mon Sep 17 00:00:00 2001
+From: Morten Welinder <terra@gnome.org>
+Date: Wed, 3 Jul 2024 19:18:15 -0400
+Subject: [PATCH] Compilation: attempt fixes for libxml 2.13
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgsf/-/commit/5d4bb55095d3d6ef793c1908a88504183e28644c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac         |  1 +
+ gsf/gsf-input-http.c | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index fceb776..7c2f946 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -238,6 +238,7 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <glib/gstdio.h>]], [[(void)g_chown("/
+ 		AC_MSG_RESULT(yes)],
+ 	       [AC_MSG_RESULT(no)])
+ AC_CHECK_FUNCS(g_date_time_new_from_iso8601 g_date_time_format_iso8601)
++AC_CHECK_FUNCS(xmlNanoHTTPOpen xmlNanoHTTPClose)
+ CFLAGS=$SAVE_CFLAGS
+ LIBS=$SAVE_LIBS
+ 
+diff --git a/gsf/gsf-input-http.c b/gsf/gsf-input-http.c
+index bdde3c8..03f4045 100644
+--- a/gsf/gsf-input-http.c
++++ b/gsf/gsf-input-http.c
+@@ -23,7 +23,10 @@
+ #include <gsf/gsf-input-http.h>
+ #include <gsf/gsf.h>
+ 
++#ifdef HAVE_XMLNANOHTTPOPEN
++// It's going away, so make it conditional
+ #include <libxml/nanohttp.h>
++#endif
+ 
+ struct _GsfInputHTTP {
+         GsfInput input;
+@@ -74,7 +77,9 @@ gsf_input_http_finalize (GObject *obj_input)
+ 	input->content_type = NULL;
+ 
+         if (input->ctx) {
++#ifdef HAVE_XMLNANOHTTPCLOSE
+                 xmlNanoHTTPClose ((gpointer) input->ctx);
++#endif
+                 input->ctx = NULL;
+         }
+ 
+@@ -215,6 +220,7 @@ gsf_input_http_get_content_type (GsfInputHTTP *input)
+         return content_type;
+ }
+ 
++#ifdef HAVE_XMLNANOHTTPOPEN
+ static GsfInput *
+ make_local_copy (gpointer *ctx)
+ {
+@@ -254,6 +260,7 @@ make_local_copy (gpointer *ctx)
+ 
+ 	return copy;
+ }
++#endif
+ 
+ /**
+  * gsf_input_http_new:
+@@ -265,6 +272,7 @@ make_local_copy (gpointer *ctx)
+ GsfInput *
+ gsf_input_http_new (gchar const * url, GError **error G_GNUC_UNUSED)
+ {
++#ifdef HAVE_XMLNANOHTTPOPEN
+         GObject *obj;
+ 	GsfInput *input;
+         gpointer ctx;
+@@ -293,6 +301,10 @@ gsf_input_http_new (gchar const * url, GError **error G_GNUC_UNUSED)
+         GSF_INPUT_HTTP (obj)->ctx = ctx;
+ 
+         return GSF_INPUT (obj);
++#else
++        g_return_val_if_fail(url != NULL, NULL);
++	return NULL;
++#endif
+ }
+ 
+ static GsfInput *
+@@ -304,6 +316,7 @@ gsf_input_http_dup (GsfInput *src, GError **err)
+ static guint8 const *
+ gsf_input_http_read (GsfInput *input, size_t num_bytes, guint8 *buffer)
+ {
++#ifdef HAVE_XMLNANOHTTPOPEN
+         int nread;
+         size_t total_read;
+         gpointer ctx = GSF_INPUT_HTTP (input)->ctx;
+@@ -324,6 +337,12 @@ gsf_input_http_read (GsfInput *input, size_t num_bytes, guint8 *buffer)
+                         return NULL;
+         }
+         return buffer;
++#else
++	(void)input;
++	(void)num_bytes;
++	(void)buffer;
++	return NULL;
++#endif
+ }
+ 
+ static gboolean
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
index 7e1842b1ac..97cbbe450c 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
@@ -10,7 +10,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
 SRC_URI[archive.sha256sum] = "9181c914b9fac0e05d6bcaa34c7b552fe5fc0961d3c9f8c01ccc381fb084bcf0"
-SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
+SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch \
+            file://0001-Compilation-attempt-fixes-for-libxml-2.13.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"

