Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C0DC7EE32
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25902.1683616024563570570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MxeSG+g+;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-306f2b42a86so3395652f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616023; x=1686208023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=MxeSG+g+mH4ZD1h+xVUow5xWoCCq/mDvxfUqW5y8kbw4hTYTCAKlU4Tp69NM9muc51
         mNpUiLI6mktWq+qamEasuhdyI84LJSjsuBakwOC4ozYkhdNTWwzOcbtog/ZBP4JArgxn
         yP41wWnW3zyNe5r8cNKA2+rc+Fl/+1dhA94BdNn63+xSoPRqtZdwLXD6vRJyYDeZZPXx
         ZQ+we2K/Fs5o79q1MA9y5ar9W7AGm1jZyLwpxAZ0nuKCc0KCUf+BtRa6hNUG13ILRahG
         gAQF/jh30GP6JhI8TMO8UIyFeBrNH9OKhtaIAxmRS5kiXb7UcQ9ZvT7APsQ4mcjD/Uvt
         41VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616023; x=1686208023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=JQFvsvaiLoXQnKctnAM7VYl7Qvecf7GFe+zyZJ3X6cw9l5AHS62YTMPaBI0HvOQ0S8
         JBZqCHzt+WvOiMJJ+7ZdxlOz0o2DghknQKTY3rAo5ZymbCCHV8xwJgaNZAHMUXp0jNTD
         /Kt5G9HWiEogv/77+uzQVNryHl0xC+KsEZZZM17ORV1eyycF6mKjgmzGw5Rv7KEBQ2aO
         ocdPvoAqHSPe9bxlXArUh6SJUn9qoMHcKakHWe9j6urEq+/3wZ79DSfDk398fYRbES2E
         nDoLysUrVgQmzoYTtgjWADvyrB1fkp7ds29Dj/7eWFJC8cz1DnBbsSxtx4feJem3v+nq
         f37g==
X-Gm-Message-State: AC+VfDxiqA3rpAOlvXQ1K7bmBmE8V/R9oM4cXbeSJke3yZU86o3IOnb3
	L130F0az3SmBnj3rNlmAeyqNnVIzdiw=
X-Google-Smtp-Source: ACHHUZ7wRsMUPdJVnKFGhNx1aW52U8Fb/j7fUusoniWwfLewBR6D7m97s/jhDA89xWhmGZPEwDaVmg==
X-Received: by 2002:a05:6000:d2:b0:306:3afd:ed8f with SMTP id q18-20020a05600000d200b003063afded8fmr8401657wrx.25.1683616022808;
        Tue, 09 May 2023 00:07:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b002f9e04459desm13346050wrq.109.2023.05.09.00.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 05/16] geoclue: fix build without gobject-introspection-data
Date: Tue,  9 May 2023 09:06:44 +0200
Message-Id: <20230509070655.70784-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102473

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-try-to-use-g-ir-scanner-when-intros.patch | 30 +++++++++++++++++++
 .../geoclue/geoclue_2.7.0.bb                  |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch b/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
new file mode 100644
index 0000000000..18e7185649
--- /dev/null
+++ b/meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch
@@ -0,0 +1,30 @@
+From 6c434bdd31d674f85a82cb83248571813c7a37ff Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 3 May 2023 18:06:46 +0200
+Subject: [PATCH] libgeoclue: don't try to use g-ir-scanner when introspection
+ isn't enabled
+
+* it finds target g-ir-scanner, so gir is found(), but when it tries to call it, it fails:
+  http://errors.yoctoproject.org/Errors/Details/702778/
+  geoclue/2.7.0-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper: line 5: g-ir-scanner: command not found
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Pending
+
+ libgeoclue/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgeoclue/meson.build b/libgeoclue/meson.build
+index 5f05dad..7ed06a1 100644
+--- a/libgeoclue/meson.build
++++ b/libgeoclue/meson.build
+@@ -77,7 +77,7 @@ gir_sources = [ libgeoclue_sources,
+                 libgeoclue_headers,
+                 libgeoclue_public_api_gen_sources[1] ]
+ 
+-if gir.found()
++if gir.found() and get_option('introspection')
+   geo_gir = gnome.generate_gir(libgeoclue,
+                                sources: gir_sources,
+                                namespace: 'Geoclue',
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
index f7039b5916..d05a309455 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
@@ -13,7 +13,9 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
 
 SRCREV = "bbfb6289dedb88cb8155d9f6868787d5432e1f90"
-SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1"
+SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1 \
+    file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.1


