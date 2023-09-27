Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F67E810CC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:49:30 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.14601.1695811769525238583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YR3J8Vyz;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-532c66a105bso12591616a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811768; x=1696416568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fieIPinNJZQSiqvm3cw4Ja5xd+V6i0RiuSnHwXmYlEk=;
        b=YR3J8VyzzLx+Am3RMM/eemjnRHwb4gS6ExZ1D2dtVaC+kD1/EVvTaQD+XiDOh+JVZv
         HRkHXyoRQryd3Y2iWk4LDprJwlGQZeScf/kKB6G5AXOmjxDFoaaGsvwVrn1eY2yz3qYr
         NTD9mrtn7WvOiFDEx8faOFHV0V0dIM0AOQCkfhLbMRg9Y6xdlwxPBMysNkUHA8y0GbBN
         c+T6rIr6/L9A72JjPhDXfSGo5xxTdzycFmS5EHmGO0wIX6emLdKC2in4MggA/tb0sxNH
         laJqXskAh5TJ+8AdIqLcMdI8ymmtS6Tovm1uWqIEj7qVHP63HtDw3fThQyaERKa5fk9c
         Z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811768; x=1696416568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fieIPinNJZQSiqvm3cw4Ja5xd+V6i0RiuSnHwXmYlEk=;
        b=AIhTu27YwkKZ8QH7dteP6/2CF/q6J6VteSXCpdbM0LkewCRjOGswlHRHG34uf++0xD
         vRH1Zb8/lfdC7kLlH+b7q6tXVNiXwUyElOxQOvmKas/ceR5KOydJVetDynsdOmMlwTte
         +TaLRbF/sfx62WZVP8Nlu2QS7xxjKVeVLUYNEBuEAGpP6qJLaBcFrXCJtogFqAsKr6OT
         NVTYlI9mtJxDTd/SkFxJKYdTfnH/NIc8RVenq+uHK3STUa5NcrKBvgAiSWf0QlVFVrwl
         Bi2oe4iYgn0ojoo37LvKv5vfNJ+QKburXqvwNdlAaEs/3pL1RXEVd3EFV14bCGcGxWdg
         6kRA==
X-Gm-Message-State: AOJu0YyZ4HW/PRDc2sv/sLZBOQycFc60TAq7xejP7ryd+46D2E8treIv
	nohliZDhaBxTsNGWiiMVvABFLx04NPs=
X-Google-Smtp-Source: AGHT+IF5mdrEu1wuJKauI0n9xqAVhabJK5RLUIbyy0XIK+P+NOuHty/fhHUuRfz6fZiVYrZU6TARBw==
X-Received: by 2002:aa7:c709:0:b0:533:520:a5a8 with SMTP id i9-20020aa7c709000000b005330520a5a8mr1794390edq.29.1695811767963;
        Wed, 27 Sep 2023 03:49:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cm15-20020a0564020c8f00b0053537ad3936sm442591edb.21.2023.09.27.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:49:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] mozjs: use PV in MULTILIB_SCRIPTS
Date: Wed, 27 Sep 2023 12:49:18 +0200
Message-ID: <20230927104920.2052173-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927104920.2052173-1-martin.jansa@gmail.com>
References: <20230927104920.2052173-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 10:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105189

* to avoid possible issue next time new mozjs version recipe is
  introduced (as multilib isn't as well tested as other build configs)

* this depends on oe-core change to expand script name in MULTILIB_SCRIPTS:
  https://lists.openembedded.org/g/openembedded-core/message/188301

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb | 7 ++++---
 meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb  | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
index 08cfededa7..f2781d7096 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
@@ -66,12 +66,13 @@ do_install() {
 
 inherit multilib_script multilib_header
 
-MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js102-config"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
+MULTILIB_SCRIPTS += "${PN}-dev:${bindir}/js${MAJ_VER}-config"
 
 do_install:append() {
-    oe_multilib_header mozjs-102/js-config.h
+    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js102-config
+        -i ${D}${bindir}/js${MAJ_VER}-config
     rm -f ${D}${libdir}/libjs_static.ajs
 }
 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index b029c5f4ec..fcdf64c932 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -66,12 +66,13 @@ do_install() {
 
 inherit multilib_script multilib_header
 
-MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js115-config"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
+MULTILIB_SCRIPTS += "${PN}-dev:${bindir}/js${MAJ_VER}-config"
 
 do_install:append() {
-    oe_multilib_header mozjs-115/js-config.h
+    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js115-config
+        -i ${D}${bindir}/js${MAJ_VER}-config
     rm -f ${D}${libdir}/libjs_static.ajs
 }
 
-- 
2.42.0


