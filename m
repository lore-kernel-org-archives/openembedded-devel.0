Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBC4C54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:30:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.44947.1674653451225066561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BDGIs7kJ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id kt14so47696223ejc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m58BTE7/Mkk1tCYvmASJX160rXxeH93e0Mmf0CEapJQ=;
        b=BDGIs7kJEpClp4k5vTowzSz731TGzUzWNv2FXMw+EFYKcgSQF6rLSNyCYiu8XDfeZx
         P7sTlzft9BFa5lSogoRCiBdurVRwwJRDrIxxaCtpNIjmL+cPNmsA/2fE9k0tSNqT662K
         dDunGOwK3JDJvLqU3h2/4TCnM6eirjvg65TtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m58BTE7/Mkk1tCYvmASJX160rXxeH93e0Mmf0CEapJQ=;
        b=H0+CHwHEpSJvPX0FcdBRMTM6oiIJL4QeJrpBZooQrX2BJn9qkt9Rvrf0N4PGumZnyO
         NyutObI88rCxiVlG3dMR/1bWNQ/wqKQwF8BBY1GCve2xiyvkRG2fc/p1BT3H4wmJgZsT
         oIYl2EvSOG6oc6W1F/b2zOKo4enuRgUlZCnPa03YaUWSZF/6xg9nHrofJ7Vxd7t6GeiB
         YH+IDF/so34+yMtPIz6D/31bpJqvRHMOY28PaeuHqPkZLjtgubBXTJfw+eaDJ8AzPzoz
         00KmC30e1OZWaD9k//j5NLx0Pw/SAPt4ny7Je4R6BNDm8Y3tEey6Lz6qGjV6e2gUBE2X
         Apaw==
X-Gm-Message-State: AFqh2ko/+8a66dhHeLOCPpLy11WOZQmRps2MhTaKXzjqA35epPZ30Onu
	JkdFXA5MPyIKUbK1ABUdOzl6b/sHCk99J96J
X-Google-Smtp-Source: AMrXdXtrlwPWnI55OWl8iAs5vKvrDibEgFb3S5B3TMXBSZ2y5MrovQRnXNtP+xxiZaqG+9ue3qc19w==
X-Received: by 2002:a17:907:7da0:b0:871:89ac:decb with SMTP id oz32-20020a1709077da000b0087189acdecbmr45000039ejc.76.1674653449536;
        Wed, 25 Jan 2023 05:30:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id g23-20020a17090613d700b007ae32daf4b9sm2382648ejc.106.2023.01.25.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:30:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cachetools: Upgrade 5.2.1 -> 5.3.0
Date: Wed, 25 Jan 2023 15:30:44 +0200
Message-Id: <20230125133044.2331059-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125133044.2331059-1-leon.anavi@konsulko.com>
References: <20230125133044.2331059-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100734

Upgrade to release 5.3.0:

- Add cache_info() function to @cached decorator.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_5.2.1.bb => python3-cachetools_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.2.1.bb => python3-cachetools_5.3.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.3.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.3.0.bb
index 7cb4f35d8..21bb51871 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.3.0.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "5991bc0e08a1319bb618d3195ca5b6bc76646a49c21d55962977197b301cc1fe"
+SRC_URI[sha256sum] = "13dfddc7b8df938c21a940dfa6557ce6e94a2f1cdfa58eb90c805721d58f2c14"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


