Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BDFC7EE30
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.94798.1683499450721945662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ONegoYKz;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-966400ee79aso172303666b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499449; x=1686091449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=ONegoYKz0j6RHkW+qrkoZGMCw7F5aQrYEPm/2Vy4BbrXkb0WpbMS6Zwj6V9mS5LnZ1
         6jLBujayHMDEIJvO6LafCpNIJQ6wzD3M711ll5pseweqbxth5slVgMBpZ2I4QxKVKrf1
         Ax9ZTKpehiA3YphPSbLSlM6yraJTBbrpS+e2tpn3GRpuyTv7ZEOtcNsjQdAzj4eIF34m
         HcQIBO/y9PjlmhRDSkaP15xVVSsUr2YpclwVhREUuDZGko7/ALe6E1ciXSKQgfket7xW
         b54zKH5YBKiyese6bYCO8SYqpBq/haVyGsEUXMSONvdU5Dhv1AGxIEjFFY+5sy1xyJu3
         PyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499449; x=1686091449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJyMsw7dWMbci8VaDEaQ0PeEmTNYYTIYm3zwNKBSRZw=;
        b=VY47azRo6JzL+Ip8mZDEe0XZvbUjZ+ywWGJuE7f/btF7OsmkiOB6XEAsMopMn/x7QX
         89Oumk+UBWUQBkmMLiCiMV06ySuQffki5xcbxapscRvxW/mCoNNCdx0m7OTk83sax2hO
         86vwMOU5E2TkNKY11q1zutUGzOMG24CuuMKB0pD77WbyHsk91J7umZWxtW8L7qFOuFvY
         UKUUmCWGTGQg1Iwe96uFu4FaHOFBIo1N4MZmRb1nT8Pz+gbA2rbIPpuObXjA9ExZlFPv
         YN0LoSaKTK/ZoEqZ9BqykXvfE8kjd152M7+38s2Y72DAVkW5RQxRv7wHyRJ/E3wvaHtw
         Yvnw==
X-Gm-Message-State: AC+VfDwfEZ1JDbekXo2WtgFWddiHfBsZ05dGwcbwXLzekPq4AvSxnpG8
	b29C+kpP9qBj6z7gUCanw2tJUKiTGUA=
X-Google-Smtp-Source: ACHHUZ6FQTYRzmQIlG+6S3Fb4Fu5Q3f4hWILP+WEKqD1wcsZJ/9uScGp1o1L8NWTZeuD8Cy+on7Hhw==
X-Received: by 2002:a17:907:31c9:b0:94f:6627:22b5 with SMTP id xf9-20020a17090731c900b0094f662722b5mr6672509ejb.47.1683499449056;
        Sun, 07 May 2023 15:44:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jx13-20020a170907760d00b0094f1b8901e1sm4179370ejc.68.2023.05.07.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/16] geoclue: fix build without gobject-introspection-data
Date: Mon,  8 May 2023 00:43:43 +0200
Message-Id: <20230507224354.1149327-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102367

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


