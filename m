Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066D4C4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 04:50:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.130598.1672030208108056706
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 20:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=anZbbOwA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso13921177pjt.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 20:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wbLuPsjVP0as1eCoVsuQkWMwhXZNWQ1JnW42dZsGUcQ=;
        b=anZbbOwAqxkj8/l0eFPTpHPYGc4PfGEDt4j5iUNbIj1wzmnMR/1Dd3nmmIewfzwE2t
         z/Hazmj9fYpEJ5kVre0BmwIxhHqoIVdPxl5eU3I8T59dKmTnAnLqiHN4lAUu47N2hF8H
         b2kK6UL+VZ4NnwJkAK698G8RKIbgswYhDlYKdwRTnJF3zDUlZIo+DmJnR2ABmV/cngeM
         Exap48B3lerh7pzP/XbeqMXEubYYciytV2rGX1rEe8u7dHwjNaMfNChuMrT6ZhhLpUci
         JKOz0Y7KGw3FZaIbIfKNjM3HXiIWjU2nAoXSFErou81T0lR9dCWMUu1L2zN7ROf003bz
         CnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbLuPsjVP0as1eCoVsuQkWMwhXZNWQ1JnW42dZsGUcQ=;
        b=ZmaxeLJCyk5KtTd21dUVvNuhZtt2mX/HLnpV0e7DapMlAKV+Ia5hZ5tqkm82WL3M+I
         ysf9Aubxbi3gxRDn89OiUrnvOGgv0dKzGNDv5WFp7Zm7NVgQd5rMNXL6gQZfygWDllgq
         Sz4t/NOho2OKuZ41ocGgRuOIROVaid+92MSOfyj8UXjO4aZJbFm9Ov0c5VLFATvPUZBd
         sUYMKrUstWv2KASpVgrR7rguPyxCroI1pDl/GyqEVz/Tto60KLP/OVIkyHkWADvcQlZ3
         qqyDwJmb290kvKJETds8Dq3xZwc4LyKv2F7aJoXn1Xm9sjDFt6QFUb0L7rmOYS/3v8pP
         oIVg==
X-Gm-Message-State: AFqh2kqpIb/2HDFA4hngOxzZFMwRwQhJiDzI4ZvwB+OAZIhJ9Bi7hKHL
	Ip9vA6Zqbla9Yr21E5yyctVAlWR9uWg=
X-Google-Smtp-Source: AMrXdXttP+PsEMMKKn4SVgTyongDi3K8MsXA/shE5zcqbDsBWUQKutayr/mm9eRi6OUhs3LVozYKXQ==
X-Received: by 2002:a17:902:c10a:b0:188:bc62:276f with SMTP id 10-20020a170902c10a00b00188bc62276fmr19732965pli.3.1672030207041;
        Sun, 25 Dec 2022 20:50:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b001743ba85d39sm6117873plw.110.2022.12.25.20.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:50:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Add -D_LARGEFILE64_SOURCE to cflags
Date: Sun, 25 Dec 2022 20:50:04 -0800
Message-Id: <20221226045004.3828873-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 04:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100237

-D_LARGEFILE64_SOURCE is needed for musl explicitly. Its added
indirectly via -D_GNU_SOURCE on glibc but not on musl feature macros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.1.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.11.bb b/meta-oe/recipes-devtools/php/php_8.1.11.bb
index fefabf72d8..dca482a1c8 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.11.bb
@@ -120,7 +120,7 @@ PACKAGECONFIG[mbstring] = "--enable-mbstring,,"
 export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
-CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
+CFLAGS += " -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
 # Adding these flags enables dynamic library support, which is disabled by
 # default when cross compiling
-- 
2.39.0


