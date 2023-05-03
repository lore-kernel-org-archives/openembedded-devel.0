Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E80FC7EE2D
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.26076.1683134643483445777
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cNjFU6yF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f18335a870so34397845e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134642; x=1685726642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=cNjFU6yF/VcQaftcignsGvD+e1dMTnTs5at4UczdUqy4auzI9OuFn/gl5o29yNox8F
         Ei69J8RpY+oE8Ix9eWwGAUt9Tc/FfBNV//FVQJ9Iw0NBqnIs6n0Qd5wMTRKqEfpY8//7
         ZFqARkzq9h8sxZVyfkArYwcSk6gtDyfFB+Snp9QTDFAD8424Dj6LdDp3y1l8GcCDaU3u
         lbl1tuVAvNDyHCGYKa8Z9cXiTLZcSmDjDfguLzEx7VLdOM0ScrZHcn06/XN7cr49kf4d
         JpL4RqK7GkWNHhABuk55PUOuHBWs/Hav7Bh8/RXf/IqJp4fnvTXVmS2pC3RGER0xWJCT
         oyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134642; x=1685726642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=gGC2yjbLMPSXx3Em8IZGWah99f6A4wcwcreGocC5ktpbWu0+o3ASUcJO2tPmB5VruP
         vCVNXe9F14nPGKtUZCpYBu83ROtPT3Bs0HRHruvnUGMxfB0KSFOOtvtEYmT1sCRRBV37
         X2zywAyyouwV1rmvBX9vkpjCP8BzWwNZFuzTdTM4w0FBYDT5b1C9wYcCPO8JS4eDV356
         N4yta8kEActiduMXC1L88PC2Zggw04wtAen9PdYPacdqzcgQLam4UX/0/0gsKFT7UQk5
         0K6CsGCZ+Hs9mAJh6zEYDU84m/C0xX9TV9R7QovAxmAwtufv1zVG77dR9sX2IsxfX42O
         EvTw==
X-Gm-Message-State: AC+VfDxwKotwbxllo+uj0FCQXdy/KR25A+Ec8ElMQ35tS98HPW//UnAE
	xow4edtP2nr3L6VvfMyhrNSP4KCAxgY=
X-Google-Smtp-Source: ACHHUZ5gJcUbiiPNiPCliVm/mvYoDqxV6s2mzqEmsImAI907hncz6PCJENb0pnwdNypA6Hu2K214Lw==
X-Received: by 2002:a05:600c:22d2:b0:3f1:6fef:9862 with SMTP id 18-20020a05600c22d200b003f16fef9862mr15485013wmg.13.1683134641762;
        Wed, 03 May 2023 10:24:01 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y10-20020a7bcd8a000000b003f16fc33fbesm2452964wmj.17.2023.05.03.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/7] geoclue: fix build without gobject-introspection-data
Date: Wed,  3 May 2023 19:23:50 +0200
Message-Id: <20230503172354.1439352-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102293

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


