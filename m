Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B94C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 16:23:16 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.12439.1676132593217327980
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 08:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iq3Ngvd1;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id k15-20020a4adfaf000000b00517450f9bd7so825576ook.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 08:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10KJ+qCr8ThUJANza7UP0e+8nAPg9yLVTktRVHYalCQ=;
        b=Iq3Ngvd1SIb+2y8Yz7mCQZCPWwY9qG1a3+ZbcOBZIJXRFzeADHB9ZsMPBeRAxBqhf/
         gZYEklS1xoS+vJPRM5MFxstXobv3Wuaejf27lMuKKVPFsfPokV4GsC7BUj24+/wEpdE+
         YYLHknLMVKYA4aW8+M21rybduTd+X22ap1AaleDg213M44AtFZ+RL5FDn8+oIcrbwkDh
         lGDmRrMIGJ9kifkMOEkB/4BY7/8xl57z6W4XAY0PX0DjFooSaczw5X+/Az0n/bSaItpu
         KVRcSwEwuLrIfCSIsfBRRzCGK2AhHTzwyKuGlRwhp7+vYIQONF6T/fTz9MugUqj3Q4Dt
         Uotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10KJ+qCr8ThUJANza7UP0e+8nAPg9yLVTktRVHYalCQ=;
        b=h0DtKuU1pUkmozXNs8IEGYLxN0c6kQohdb0HqOg/XM5IGo76Zass4M7XQOqAbwHNgM
         uAzV4qs5SyruC1zy4SieTHSTb1B4HxfBhOP02301jE1FbMyONmOQMV85+7uDy/+G6kgg
         fIaB6/pLN+S0B3CJZo7TVFLaSAlL/U5Fa3r8xkXhH2gzA7q4uAuEOYBD7a5NHYMM8Q1u
         LDdbjtAShacTty4IgHcMO1SPiJk7UWGNA39n3BLWm7JNktA+Z2nO7nsUIOiuF3FoaCVX
         l3fCTjesvheWJyHKYTB7zjaCP+om8+N98nwxxNXyaQJNmLR8BlQhnyBrON1wGLofp08B
         X33Q==
X-Gm-Message-State: AO0yUKUOFKjn3674Z0XLjt0NRicWJjioq+XlwtxJzzHd/iZw/EqIbOAO
	p5CzpPSxUJnst6KL6L1iZpBwZB1i9ww=
X-Google-Smtp-Source: AK7set/CCxd6ZsQa0drxKs6wKjyqdcuRY+gc168SM2xcd9rWHiRdBQ47kZjwWWtxXqK9kP3iG3enAw==
X-Received: by 2002:a05:6820:198d:b0:51a:186f:88c4 with SMTP id bp13-20020a056820198d00b0051a186f88c4mr10782039oob.0.1676132592377;
        Sat, 11 Feb 2023 08:23:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id v16-20020a4ae050000000b0051aa196ac82sm3117561oos.14.2023.02.11.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 08:23:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][langdale][PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Date: Sat, 11 Feb 2023 11:23:10 -0500
Message-Id: <20230211162310.3986652-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 16:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cba6df61c7cbc4446aab09eb11673bcb6c581307)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
index 4f30eca59e..88cef0ef83 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
+SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


