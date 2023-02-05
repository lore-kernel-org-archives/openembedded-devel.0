Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2483EC636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 00:08:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.19637.1675555703159089276
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 16:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hhOdYS6l;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id m2so8818944plg.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhO/QqbRmKqd8YAzCCySf3y10eT7DvKrem4dey9LF1U=;
        b=hhOdYS6lfJlOo+U2pQ+fhznEbLUg1OcUz994PrgmKwOsoDUK2Kzpb52dGKYOpJoUzO
         kE+PkKhIslhV/FRcfqlPYITO7GwPMTUoWVX1BfBzLKBouLkONHXP4UvJZpaFgp7KFxTd
         C67yfQ6zeY/7PuPte//YE41puYSzV6kv1+DUCrIIIIFOAS70UQdVqMJ0W9yGYc3w66m6
         XhqVDlXLoTtwjMIC044VIT66RfOjCz9Bde0P4I4m198f4PU2ikIsbPgOzT7Y6OAIaPR2
         a9IwA35OybkdfQ0S8qV3XNvkcj1OCP7bzPH491ZBdmoNEDfkcUKJpLm2dqYyk1yfRVR3
         5nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhO/QqbRmKqd8YAzCCySf3y10eT7DvKrem4dey9LF1U=;
        b=BJAhOO/mn5yV+oUtY9MWTGxAFMMIHUF0EZkTEVHO5yS01PbGFwDW76ryRHm67xz8sp
         j1OPvKXG4GQ8LAGRhSVA0tB7gVawUVYYJmgEnvC5k+PVMzAGQwg9Kr0pfcCzkN55TkFm
         ooHV/LQ8h6K7tXCQS8hCm8zO5BiPOkJmRayhXWDxZCkmRNEbL9KBiHrswgXcanFOiYKz
         9Cg6TPVCYDkOI0I4XxrXRgBLk2bCse/vpXn0faKIu4kbXId5j5XoNeR7lIT6gmO+AYhT
         6HkoKA3IoisJD4kHdewKCBbHs77x5LXs27dXaDBhnScrJt7IdCyo4JNRkBlEDZ8nOq+I
         EOTw==
X-Gm-Message-State: AO0yUKX+o+bFudNlawhT/GGhFre65+dxJrWh0PA5+pdeaoY3xBzPkybm
	UUvjD4cyQR3hQWukmYRnDWYqG0gGtDQ=
X-Google-Smtp-Source: AK7set8d7KUxCzPGf32Lpa0WbLfZXMTVgo0DTZxpMlyHg7U/TkxA+2l59AV+joj3qomd4ITBmGY4Bg==
X-Received: by 2002:a05:6a21:1586:b0:bc:a96b:c7f7 with SMTP id nr6-20020a056a21158600b000bca96bc7f7mr14057559pzb.9.1675555702298;
        Sat, 04 Feb 2023 16:08:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id y2-20020a626402000000b0058a7bacd31fsm4265046pfb.32.2023.02.04.16.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 16:08:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-isort: Upgrade to isort 5.12.0
Date: Sat,  4 Feb 2023 16:08:19 -0800
Message-Id: <20230205000819.1630674-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 00:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100932

Brings in these changes

Fix poetry pip-shims extras dependency (#2078) @jooola
Add the ability to restrict which directories isort works against (#1967) @vkomarov-r7
docs: fix simple typo, detrmination -> determination (#1948) @timgates42
updated format strings to fstrings (#2076) @marksmayo
Simplify typeshed integration test (#2075) @AlexWaygood
Fix re-export sorter (#2065) @parafoxia
Add more docs about filter-files option (#2074) @micahjsmith
Removal Python 3.7 (#2064) @staticdev
Added test case and fix for cython pure python import (#2063) @jtoledo1974

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-isort_5.11.4.bb => python3-isort_5.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.11.4.bb => python3-isort_5.12.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.11.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-isort_5.11.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
index 3ece22c382..6d7b20f3a9 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.11.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "6db30c5ded9815d813932c04c2f85a360bcdd35fed496f4d8f35495ef0a261b6"
+SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fcba0504"
 
 inherit pypi python_poetry_core
 
-- 
2.39.1


