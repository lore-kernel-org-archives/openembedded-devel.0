Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB1BC3ABC3
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 21:49:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.37043.1747000162786702746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 May 2025 14:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O3/sjh5h;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so1482179f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747000160; x=1747604960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msWNWLUxK0v6p10pH+EWugRdvY0CgjIjGkhD29EnzFM=;
        b=O3/sjh5hNJIEDK98ipYtxdVpAfM+5WqoyMrXlvc6b6u/hhaOQEI+NB4UMmoX9mM6Nq
         USkjrZM/pk6QDdIGoCSb+nyaCHZruw2K+W67wmJgXDMH1/Vwy57cWoNkm3cfkHC8uOCn
         /p50VeXjzBt1Yn3Z9aEqwRcJ81mvfJc8OBTPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747000160; x=1747604960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msWNWLUxK0v6p10pH+EWugRdvY0CgjIjGkhD29EnzFM=;
        b=L1oKJKTVCMpkPH3j2/GtIpJKhAkW3gZ2spCzwJ67MCeFHYGP5mPptuTFdD3mBlJWMQ
         TwGx6mvC7kpQrDcWk3/6qkc1vQADsygM1jczf7rJ6TnMtLR/s/wOv+rDQPtl5h01XOk/
         L0ZUZ5rk3gA0WAx186Aw0hgVxWXaatTypGpETDkq674xLPDw4CEL5ajsoFlHJyj4XPKS
         w7EXBtp0Nf02uBp9bz7iB+gqyMWvwiBemKZ+FVqW7O3q6f95/ChFcqovdxHf32NOzsSC
         X/JJYnF+VIAk1JSu8rqAFq5aBQJppEiw3HhV5JlYLvEkYuWtaOdTfMsTrqk8WpQM2ZUG
         hMRQ==
X-Gm-Message-State: AOJu0Yx3XqJz0I5lO8PfcT1pPKQFvmxAF9Ynp9RKE2OKaJPNjlQfGRwY
	JF7wuhS79sai+JrbBUCY3bolL//LjIqb4nTmEIY38jRLjLmImBLMNmO2EFpzLjAmucQbp/dEclR
	T
X-Gm-Gg: ASbGncuSMMwjTWHsTYbkFkBuLiOSNQ1i2e7rSQb7FhcMsVDogAWirmyGM6N0nr0QzCc
	l73UDz2x1aXFlc5TfDs150pbJgO2OB4ivLNJW8lvWCmO+jkvEddd+a5WsWuXZ7EJgKP0reabsCU
	jRDBvSjExj2nNfVh9vFfpsGcC6bRD4FipgsWwBHnE7j+lik1YEqITnSq9JkQB596T0DyIhRndXS
	8QwjnEyWIYyQdyYR5gOQQTOp8dwuZw8aH6Ww4B5nA5rdcb/ikPwEcK/fLqssJOtxqG/5HdQ2WWK
	5G5fdo+4VlWdBirK2ivWyExpF5yZcmSlVff6RD+6NDXp2LiyplkwQib/GgRl2gVqLLdmTt3AbZw
	sLEqBdrcx/DmzCRCP8yscSIo9a7MYxypPXQZ6G8WCOkhO735Vuf9tx4WhyGM=
X-Google-Smtp-Source: AGHT+IHNiDEsKbQNLe587iYcGDnFFtPmEWqNYYzLmSvZsPFyN8ZA17BmkqJNHs1I9Q4Dq0l6FxH5fw==
X-Received: by 2002:a5d:64ab:0:b0:3a1:f635:1133 with SMTP id ffacd0b85a97d-3a1f64220b7mr9162910f8f.7.1747000160422;
        Sun, 11 May 2025 14:49:20 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4cc44sm10180314f8f.85.2025.05.11.14.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 14:49:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] ibus: fix build with GCC 15
Date: Sun, 11 May 2025 23:48:58 +0200
Message-Id: <20250511214858.3693814-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 21:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117386

From: Yoann Congal <yoann.congal@smile.fr>

Backport 2 patchs from upstream to fix build with GCC 15.

Fixes:
| ibusenginesimple.c: In function 'check_emoji_table':
| ibusenginesimple.c:523:41: error: too many arguments to function 'load_emoji_dict'; expected 0, have 1
|   523 |         emoji_dict = priv->emoji_dict = load_emoji_dict (simple);
|       |                                         ^~~~~~~~~~~~~~~  ~~~~~~
| ibusenginesimple.c:480:1: note: declared here
|   480 | load_emoji_dict ()
|       | ^~~~~~~~~~~~~~~
| make[4]: *** [Makefile:1012: ibusenginesimple.lo] Error 1

and:
| i18nMethod.c:84:28: error: initialization of 'int (*)(void)' from incompatible pointer type 'int (*)(struct _Xi18nCore *, TransportSW *, char *)' [-Wincompatible-pointer-types]
|    84 |     {"X",               1, _Xi18nCheckXAddress},
|       |                            ^~~~~~~~~~~~~~~~~~~
| i18nMethod.c:84:28: note: (near initialization for '_TransR[0].checkAddr')
| i18nMethod.c:79:13: note: '_Xi18nCheckXAddress' declared here
|    79 | extern Bool _Xi18nCheckXAddress (Xi18n, TransportSW *, char *);
|       |             ^~~~~~~~~~~~~~~~~~~
| i18nMethod.c: In function 'CheckIMName':
| i18nMethod.c:498:17: error: too many arguments to function '_TransR[i].checkAddr'; expected 0, have 3
|   498 |             if (_TransR[i].checkAddr (i18n_core,
|       |                 ^~~~~~~               ~~~~~~~~~
| In file included from i18nMethod.c:41:
| Xi18n.h:78:19: note: declared here
|    78 |     Bool        (*checkAddr) ();
|       |                   ^~~~~~~~~

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-gnome/recipes-support/ibus/ibus.inc      |   2 +
 ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ++++++
 ...incompatible-pointer-types-in-Transp.patch | 109 ++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 9d0600c794..9dce2ce4f3 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -13,6 +13,8 @@ SRC_URI = " \
     git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
     file://0001-makefile-don-t-gzip-the-man-pages.patch \
+    file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch \
+    file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
 "
 SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
new file mode 100644
index 0000000000..150ff631ba
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
@@ -0,0 +1,36 @@
+From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 2001
+From: fujiwarat <takao.fujiwara1@gmail.com>
+Date: Fri, 24 Jan 2025 09:40:31 +0900
+Subject: [PATCH] src: Fix declaration errors with GCC 15
+
+
+BUG=rhbz#2340629
+
+Upstream-Status: Backport [https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7e4c8c]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ src/ibusenginesimple.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ibusenginesimple.c b/src/ibusenginesimple.c
+index c57a3ea5..60e7fb34 100644
+--- a/src/ibusenginesimple.c
++++ b/src/ibusenginesimple.c
+@@ -477,7 +477,7 @@ check_hex (IBusEngineSimple *simple,
+ }
+ 
+ static IBusEngineDict *
+-load_emoji_dict ()
++load_emoji_dict (void)
+ {
+     IBusEngineDict *emoji_dict;
+     GList *keys;
+@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple       *simple,
+         g_object_ref_sink (priv->lookup_table);
+     }
+     if (emoji_dict == NULL)
+-        emoji_dict = priv->emoji_dict = load_emoji_dict (simple);
++        emoji_dict = priv->emoji_dict = load_emoji_dict ();
+ 
+     if (emoji_dict == NULL || emoji_dict->dict == NULL)
+         return FALSE;
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch b/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
new file mode 100644
index 0000000000..229a9d34aa
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
@@ -0,0 +1,109 @@
+From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 2001
+From: fujiwarat <takao.fujiwara1@gmail.com>
+Date: Fri, 24 Jan 2025 10:01:11 +0900
+Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in
+ TransportSW.checkAddr
+
+
+BUG=rhbz#2340629
+
+Upstream-Status: Backport [https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2ea41ca]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ util/IMdkit/Xi18n.h           | 18 ++++++++++--------
+ util/IMdkit/i18nMethod.c      |  3 ++-
+ util/IMdkit/i18nOffsetCache.c | 10 ++++++----
+ 3 files changed, 18 insertions(+), 13 deletions(-)
+
+diff --git a/util/IMdkit/Xi18n.h b/util/IMdkit/Xi18n.h
+index 79dd9619..09097bb6 100644
+--- a/util/IMdkit/Xi18n.h
++++ b/util/IMdkit/Xi18n.h
+@@ -3,7 +3,7 @@
+          Copyright (C) 1994-1995 Sun Microsystems, Inc.
+          Copyright (C) 1993-1994 Hewlett-Packard Company
+          Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
+-         Copyright (C) 2014 Red Hat, Inc.
++         Copyright (C) 2014-2025 Red Hat, Inc.
+  
+ Permission to use, copy, modify, distribute, and sell this software
+ and its documentation for any purpose is hereby granted without fee,
+@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #define I18N_SET	1
+ #define I18N_GET	2
+ 
+-typedef struct
+-{
+-    char        *transportname;
+-    int         namelen;
+-    Bool        (*checkAddr) ();
+-} TransportSW;
+-
+ typedef struct _XIMPending
+ {
+     unsigned    char *p;
+@@ -172,6 +165,15 @@ typedef struct _Xi18nClient
+ 
+ typedef struct _Xi18nCore *Xi18n;
+ 
++typedef struct _TransportSW TransportSW;
++
++struct _TransportSW
++{
++    char        *transportname;
++    int         namelen;
++    Bool        (*checkAddr) (Xi18n, TransportSW *, char *);
++};
++
+ /*
+  * Callback Struct for XIM Protocol
+  */
+diff --git a/util/IMdkit/i18nMethod.c b/util/IMdkit/i18nMethod.c
+index 9c44e7fe..7f343d87 100644
+--- a/util/IMdkit/i18nMethod.c
++++ b/util/IMdkit/i18nMethod.c
+@@ -2,6 +2,7 @@
+  
+          Copyright 1994, 1995 by Sun Microsystems, Inc.
+          Copyright 1993, 1994 by Hewlett-Packard Company
++         Copyright (C) 2014-2025 Red Hat, Inc.
+  
+ Permission to use, copy, modify, distribute, and sell this software
+ and its documentation for any purpose is hereby granted without fee,
+@@ -89,7 +90,7 @@ TransportSW _TransR[] =
+ #ifdef DNETCONN
+     {"decnet",          6, _Xi18nCheckTransAddress},
+ #endif
+-    {(char *) NULL,     0, (Bool (*) ()) NULL}
++    {(char *) NULL,     0, (Bool (*) (Xi18n, TransportSW *, char *))NULL}
+ };
+ 
+ static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)
+diff --git a/util/IMdkit/i18nOffsetCache.c b/util/IMdkit/i18nOffsetCache.c
+index e2fe8c6b..cab974c7 100644
+--- a/util/IMdkit/i18nOffsetCache.c
++++ b/util/IMdkit/i18nOffsetCache.c
+@@ -1,6 +1,6 @@
+ /*
+  * Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
+- * Copyright (C) 2014 Red Hat, Inc.
++ * Copyright (C) 2014-2025 Red Hat, Inc.
+  *
+  * Permission to use, copy, modify, distribute, and sell this
+  * software and its documentation for any purpose is hereby granted
+@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache *offset_cache, Atom key,
+     }
+ 
+     if (++offset_cache->size > offset_cache->capacity) {
+-        offset_cache->capacity *= OFFSET_CACHE_GROWTH_FACTOR;
+-        offset_cache->data = (Xi18nAtomOffsetPair *) realloc (data,
++        Xi18nAtomOffsetPair *pair = (Xi18nAtomOffsetPair *) realloc (data,
+                 offset_cache->capacity * sizeof (Xi18nAtomOffsetPair));
+-        if (offset_cache->data == NULL) {
++        offset_cache->capacity *= OFFSET_CACHE_GROWTH_FACTOR;
++        if (pair) {
++            offset_cache->data = pair;
++        } else {
+             offset_cache->data = data;
+             --offset_cache->size;
+         }

