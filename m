Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32FBC636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 20:35:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.37470.1675629339304493785
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Feb 2023 12:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qEhNI/qs;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id g13so5399487ple.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXowGSnJL25Y3OaBWsRlmFYZN6GvE5ubfGYSbcgU6Ho=;
        b=qEhNI/qsMtHTmI98i+wcQc65MRiKczteIXF0nf8ddNCc8f0OnxqLZ6/Iu6zRZK2UZo
         qpQJtXJCu0BFjnAvYepVnDMQcBYy+3tLGOUNSmVL2Sc8+8bFYNlF07U/ILQPQPOkqvsR
         Izq5WgzAG4J9DrJJ5KLDcTiNLsrAfnLhRt3fxpRZJKMuRUVw1f+InTe2uWYn7Lz2nGJv
         uybYMqVjSOacoNqZu7aoqMcFYVrZSdzcrHHyEkPgaMwaxX5Ld0xb36XX3qhWfl5rDF1W
         3p635rRqjt32VnQY0/Aq6tI+pQ//8F9GF52hdu/uUi4m577JOYFKaZKczQtdziq7vaP4
         ZuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXowGSnJL25Y3OaBWsRlmFYZN6GvE5ubfGYSbcgU6Ho=;
        b=KGDGEB3A8/ug2QBy4E1PddMUIr0IQ0skAQ7xnh0pdwog9nL6qKF+nj9m0YsWFDKUHz
         y4+CJ/oUG/MeQ1aGct4FHa4Oo5W5vGlOLggVNtLEIEhG4oSqkFRwwtGXVee73JULm/T8
         507tBGL8+iZrn8piuqCjVMUQ9Nhj1+cTSfxS4ofZtn8kgzug3W8jex6kvl8vT0hGNDI7
         PBkFLIW2H7zAw7MSYKXrCBDjMGl6MHrd/6ghALG0Rj7czItxc25miWjxDi61/YP3iYKT
         J8p1qDJjmaYADxgX0rE9MGp7FJ6WvvWJz5G2M9I+ggcwsEWLVSg/RTCKw5f/BSikM2ln
         +egw==
X-Gm-Message-State: AO0yUKWvr7BdiUNL3fd/FzypLbpCrkBf4gOeVBXqF3DkxG9iijAJRes1
	baBLnLRAFlPThBzk+gLcsXBj7o+Y7Ys=
X-Google-Smtp-Source: AK7set/h6GgNy+pM/4HInGJW6Bk3J7bIE6yllL36HmtFY6xG5VlBb2K1/3U1th884aSjzgSB6WrrBw==
X-Received: by 2002:a17:90b:3a81:b0:230:c630:bbb3 with SMTP id om1-20020a17090b3a8100b00230c630bbb3mr376105pjb.33.1675629338462;
        Sun, 05 Feb 2023 12:35:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm4745392pgp.68.2023.02.05.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 12:35:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vulkan-cts: Rename patch to avoid problems on case insensitive filesytems
Date: Sun,  5 Feb 2023 12:35:36 -0800
Message-Id: <20230205203536.3597746-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 20:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100937

see
https://github.com/openembedded/meta-openembedded/commit/a493debe11e2e2d100fceac1cc64069f5d85390b#commitcomment-99397029

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dint.patch => 0001-vulkan-cts-include-missing-cstdint.patch} | 0
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/files/{0001-Include-missing-cstdint.patch => 0001-vulkan-cts-include-missing-cstdint.patch} (100%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch
similarity index 100%
rename from meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
rename to meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
index 862963dd0d..b1aa7d9b12 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
@@ -12,7 +12,7 @@ SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
 SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
-            file://0001-Include-missing-cstdint.patch \
+            file://0001-vulkan-cts-include-missing-cstdint.patch \
             file://0001-include-missing-cstdint.patch;patchdir=external/amber/src \
 "
 
-- 
2.39.1


