Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D59C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 19:40:01 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.51796.1722454791124571682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jul 2024 12:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SnmD3Q48;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so741401966b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722454789; x=1723059589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd+WNxu5yLwWIl1lVWjtI0iT2NgwTb4Akq2Wq7wimuw=;
        b=SnmD3Q489F3ALv99yxXIkVT4+2EB0yUPALRRCW38p9z1GzKUbTl/IAOhFT0sVIpNSW
         B626dupc18VqJ0gAQlrUof3Ft/VD3uhhQlqF6Cimxa/YKrHZXJe68oPvTMbFXZYgeyL+
         gYm/hnTwEHnsIQL9oHmBKDUy+kspOy42h0aJZnwYv2PTwTkq+uHbrym2lGNFwymUSQcW
         tX9ccQUEfuSaeKrl91YyIuA8GzAAc5ecD+XcNwyQLeDjsrNc4E0+cCrdGV39V1pOEcv3
         edc3C4FOY29/ZAxsUha2krsnQMOdit+0tnU8ut6MH7cL2HHhzb7lgBx7EDcEIIHXlsQd
         vngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722454789; x=1723059589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd+WNxu5yLwWIl1lVWjtI0iT2NgwTb4Akq2Wq7wimuw=;
        b=eFJUAWqgxVk1hoqt4ui3fftnfjYROB8HuYht0uGS1fWwO67dOJMAuzDP1MnUcqbmRZ
         yYYQHIZ1gyO0S9nBu9wUKRYHaDrJjuArIoiuu6vNW9ZAaXFT5yrVTD8AoBPImddLHMvw
         wtAQKrlijnm+lVrLKGS4P8tUROCZwgXijWNZzVYEL4UF0lsRKBnyM5BG1h0dYw84NRxf
         zPcDuywFB7dsl7fGrjWL9SrdWu7uuuU6tZcyrn5qwO0qLCy64hGTziNnSuu+HewteO60
         AVZZe4A9ZI7bHkdXyicJDTYGRo8mOIYASCl6vJCtz+c2eBST4VwFVxIVc4pn02emHcH/
         +tYQ==
X-Gm-Message-State: AOJu0Yxi033gVBP/FngT0rwx9+xhe7QEeD84+hgxtMO5ebn3g8ZGZUFi
	lC7YS3fb9i3UiDS48SyUv11eGBGMDmhbIN5KXmd59hEwQtvLSGXrMkB6HrI0
X-Google-Smtp-Source: AGHT+IEC8sxQdUwPh2YlC0urWixol6NIoh/PLakOtRFThIG/Qm7wFl8LSw4behgw9FSjA7hVnvCxkw==
X-Received: by 2002:a17:907:a2cc:b0:a7a:ab1a:2d64 with SMTP id a640c23a62f3a-a7daf607399mr8929366b.58.1722454788405;
        Wed, 31 Jul 2024 12:39:48 -0700 (PDT)
Received: from control-center.home (164-12-20-31.ftth.glasoperator.nl. [31.20.12.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad903f1sm804116666b.152.2024.07.31.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:39:47 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-aiohue: 4.7.1 -> 4.7.2
Date: Wed, 31 Jul 2024 19:39:21 +0000
Message-Id: <20240731193920.917829-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 19:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111488

Drop runtime dependency on python3-profile as this is not in the pyproject.toml file.
---
 ...ython3-aiohue_4.7.1.bb => python3-aiohue_4.7.2.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.1.bb => python3-aiohue_4.7.2.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb
index 438c771db..57c40bdcc 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "29b5e5ae05938cac195b1969e70bd6ad4e4e2e105d0e565849803d2a99ff47d1"
+SRC_URI[sha256sum] = "8107f6fa9ad06eb91aef987a68bea7d3450510a433aed3a111e2827d37a37586"
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += " \
-	python3-aiohttp \
-	python3-asyncio-throttle \
-	python3-profile \
-        python3-awesomeversion \
+RDEPENDS:${PN} += "\
+    python3-aiohttp \
+    python3-asyncio-throttle \
+    python3-awesomeversion \
 "
-- 
2.34.1


