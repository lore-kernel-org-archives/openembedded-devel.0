Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC3C7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3585.1684914796836155992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HIq/Hmtl;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1b2so1352156a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914795; x=1687506795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGjDhzUZbAnWsS8ILHa2ZmK4btDCYn6g6nPF3Sownug=;
        b=HIq/HmtlXN31JsYVjQuT3mZ/P9HJAHwk0yVkY2UqLgJIsPexrZsIIoue0EzmvUFLhU
         nDaYYiqWRVo0pSkeTpdV3vDVEKuZZuXcV3p+UZnd9O1sH7xpV9Cx6M6Xy5ZH8PNtzWzU
         sKvdgFQN6GPJQDzSY6exTZQi3a0xlNi3ykh8+UrRdL+L5Dkl7sjw7NR7ZPBfLUViCe/c
         TiaRndme90TGQUwK6nGhKtGzPV3QglluqcmO5NlDCTVgRmQXTpxEcf9dSiYsI6xzMup2
         QQwdud/4CJ0XseWt/C9HvShNvK3PF0tPJUOTOFgM5UkKttD4L3nLpglCl8dcDi01I3k1
         F9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914795; x=1687506795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGjDhzUZbAnWsS8ILHa2ZmK4btDCYn6g6nPF3Sownug=;
        b=WbqrG46y/3hi2mH7d7G+ZbyQW7JmuVJ/GpVIj8LwMXoKOP50kIb8ycXX20NKKv1brb
         R9XO0NAMyvh5hJDQtJExpP3FsupxDhIAbeUYUqiHiXVL9CQJaRB4Gn4ACd23UkVc4eOx
         kb3pZpuddFhGqF9GWFfbDDQQVinfFiomveyVF7Ely02G2f57Kkf0HgnVVg3hE5/YECIT
         qVcDbsq52SNGVQkgRqM+QvbEKoXJnPYClHG1raewOSsTLyUgqONjw7+I9I7Ti/GdlXdj
         u9GXkQdwcjdgZicUPg5x7H7Sti5dCs5SS1Ej7SAnqocUrFxTdZ+F/N6aoCsq5TmvWcP9
         nbDw==
X-Gm-Message-State: AC+VfDxbYYCEb3+eUVbCvqf1rXu8mz7yR4Ah/LRRrW82VmeiYRQJIppR
	pQf8b65FmjzC5FLhFGk/IgAPtXe/hv8=
X-Google-Smtp-Source: ACHHUZ4o6fiN3X0wL2RdA8u2hUf4ACIYEtjMWxKvhihdtdEtrbgHz1Io5G1HMc12jZZVDNlqvTzrnw==
X-Received: by 2002:a05:6402:1499:b0:510:eb22:3307 with SMTP id e25-20020a056402149900b00510eb223307mr1219019edv.22.1684914795282;
        Wed, 24 May 2023 00:53:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r10-20020a056402034a00b0050c03520f68sm4820949edw.71.2023.05.24.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/20] graphviz: remove unused patch files
Date: Wed, 24 May 2023 09:52:53 +0200
Message-Id: <20230524075253.1033593-20-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102774

* they were removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=edc38751dc1a0141c8f5f93f6650ca2d11b792bc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../graphviz/0001-Use-native-mkdefs.patch     | 26 ---------------
 ...-Include-freetype-headers-explicitly.patch | 33 -------------------
 2 files changed, 59 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
 delete mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
deleted file mode 100644
index 76ff08f63c..0000000000
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5e53b643615fd53f3ff960521bbe9d95641e5f68 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sun, 20 Jan 2019 23:58:29 +0100
-Subject: [PATCH] Use native mkdefs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- lib/gvpr/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/lib/gvpr/Makefile.am
-+++ b/lib/gvpr/Makefile.am
-@@ -59,7 +59,7 @@ mkdefs$(EXEEXT):
- 	$(HOSTCC) $(srcdir)/mkdefs.c -o mkdefs$(EXEEXT)
- 
- gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs$(EXEEXT)
--	./mkdefs$(EXEEXT) gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
-+	mkdefs$(EXEEXT) gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
- 
- EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcxproj*
- 
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
deleted file mode 100644
index dd79510560..0000000000
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 926d9285f3367ae1bdb9ce1dce95f7de73b3a980 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 12:42:19 -0700
-Subject: [PATCH] plugin/pango: Include freetype headers explicitly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Do not depend on pango automatically adding these headers
-Fixes
-| gvtextlayout_pango.c:140:10: error: unknown type name ‘FT_Face’
-|          FT_Face face;
-|          ^~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugin/pango/gvtextlayout_pango.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
---- a/plugin/pango/gvtextlayout_pango.c
-+++ b/plugin/pango/gvtextlayout_pango.c
-@@ -15,6 +15,10 @@
- 
- #include <stdlib.h>
- #include <string.h>
-+
-+#include <ft2build.h>
-+#include FT_FREETYPE_H
-+
- #include "gvplugin_render.h"
- #include "agxbuf.h"
- #include "utils.h"
-- 
2.40.1


