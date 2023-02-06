Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AA1C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 08:00:12 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.48498.1675670411435594522
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 00:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pD3zfhl/;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: geoffhp@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 7so7601253pgh.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 00:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enUs/NNXdDceQBT/C4IRTEXhYZErxlj2GNfQXvTpGPI=;
        b=pD3zfhl/rJ5WFF4XjOpoL4ehoY9RLLrSccJhtd+I1MZGsVggaCEf0xg1PBaH84rQjf
         RphQA1v+9QMkA3u5+IuEjX48hX+i9/PJw4547t5dc28ngQycC3TbsGNZ/EB9MO/eZWFi
         qtUijZxAyo3wvg2B1kLSfRJWVxxtahj0/YB/L99/nILEkC8hmb5QiDLv7RlILPGjVBRd
         TK8WpDBMl0EZJOKls7RZZnOw6RG/RxcdNekHSx90/uhISE3OIE2HnvqeVorBm3t21DXU
         eaHI061FxSUhEuWaSRXQP8Z8Kze4/JQZVtIwA+X5O6dz8QLxI73iEH5ndgDQ0GuZAyyy
         SHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enUs/NNXdDceQBT/C4IRTEXhYZErxlj2GNfQXvTpGPI=;
        b=BKayryM5qCQFiZKVphOIsGlFSzJLuyrGxCE8ji1JAKtuKcizn8gMMMU2HlsyDyVNTB
         r3VF8Hk9qpGUriMNfW+9KQIFXdfx9rsOtBfmj0FYRJzJg19eVcAAg4+e/BY2vkB3565+
         z/p+DyyO85JAkENpbfaWyM1Al9x/NCiFa96GwUUq6XWTsu7W+0Wa63I0/HXauAd/FP0N
         3aXL0mEHL59SGRfy+KxWgZc/DFAH5v3QuYDXhUPtFWJPHtMY2wPdXKCg5AObesmoVX0D
         2qUBxL0Yzz0oj8OJvIdOfMHk6+Xi0uXyDNy92ycZ+exFxROoY7OQweUkkZp9/1bdyPLF
         BgBQ==
X-Gm-Message-State: AO0yUKWSSYAo6WPBsqXPY1X3vTEm3GNYVsNLydpvsOZBidhSCCriEd7H
	SLLiQZ6k/XGPa6BlK2iEn32nBbdUVvw=
X-Google-Smtp-Source: AK7set8N6P5byNOgrcmhbgSv7IlEwtG+yWXR6JYVJ+o8UoYNU0nGcaMVmDxR9Rk1RWs7vUSHcvtAGg==
X-Received: by 2002:aa7:8818:0:b0:593:6a2e:b96b with SMTP id c24-20020aa78818000000b005936a2eb96bmr18140123pfo.8.1675670410453;
        Mon, 06 Feb 2023 00:00:10 -0800 (PST)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id x15-20020a62860f000000b005943bd7c72bsm6328352pfd.190.2023.02.06.00.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 00:00:09 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: randy.macleod@Wwindriver.com,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [oe][meta-python][PATCH] python3-pillow: add tk to RDEPENDS ptest pkg only if x11 in DISTRO_FEATURES
Date: Sun,  5 Feb 2023 23:59:54 -0800
Message-Id: <20230206075954.600087-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 08:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100940

From: Geoff Parker <geoffrey.parker@arthrex.com>

commit 7b0e71e00 ("python3-pillow: add ptest support", 2023-01-31)
added tk to RDEPENDS:${PN}-ptest. Which cause this error on non x11
builds:

    ERROR: Nothing RPROVIDES 'tk' (but meta-openembedded/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
           RDEPENDS on or otherwise requires it) tk was skipped: missing required
           distro feature 'x11' (not in DISTRO_FEATURES)
    NOTE: Runtime target 'tk' is unbuildable, removing...
          Missing or unbuildable dependency chain was: ['tk']
    NOTE: Runtime target 'iotmanager' is unbuildable, removing...
          Missing or unbuildable dependency chain was: ['iotmanager', 'python3-pillow', 'tk']
    ERROR: Required build target 'update-runtime' has no buildable providers.
           Missing or unbuildable dependency chain was:
           ['update-runtime', 'runtime-image', 'iotmanager', 'python3-pillow', 'tk']

Add tk dependency only if DISTRO_FEATURES includes x11

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 68c81029c..9f1cc9eac 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -43,7 +43,7 @@ RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-timeout \
     ${PYTHON_PN}-resource \
-    tk \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'tk', '', d)} \
 "
 
 CVE_PRODUCT = "pillow"
-- 
2.30.2


